this.el_lichking_overhead_strike <- this.inherit("scripts/skills/skill", {
	m = {
        EL_RankLevel = 0,
        EL_isExtraAttack = false,
		StunChance = 0
	},
	function setStunChance( _c )
	{
		this.m.StunChance = _c;
	}

	function create()
	{
		this.m.ID = "el_actives.lichking_overhead_strike";
		this.m.Name = "Overhead Strike";
		this.m.Description = "A diagonal overhead strike performed with full force to devastating effect.";
		this.m.Icon = "skills/active_20.png";
		this.m.IconDisabled = "skills/active_20_sw.png";
		this.m.Overlay = "active_20";
		this.m.SoundOnUse = [
			"sounds/combat/overhead_strike_01.wav",
			"sounds/combat/overhead_strike_02.wav",
			"sounds/combat/overhead_strike_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/overhead_strike_hit_01.wav",
			"sounds/combat/overhead_strike_hit_02.wav",
			"sounds/combat/overhead_strike_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = false;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.25;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 99;
		this.m.ChanceDisembowel = 50;
		this.m.ChanceSmash = 0;
	}
    
	function EL_isInStrengthenForm()
	{
        return this.getContainer().hasSkill("el_effect.lichking_strengthen");
	}
    
	function isUsable()
	{
        return EL_isInStrengthenForm() && this.World.Assets.EL_getSoulEnergy() < this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel] ? false : this.skill.isUsable();
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();

		if (this.m.StunChance != 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.StunChance + "%[/color] chance to stun on a hit"
			});
		}

		if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInGreatSwords)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] chance to hit due to sword specialisation"
			});
		}
        if(EL_isInStrengthenForm())
        {
			ret.push({
				id = 7,
				type = "text",
			    icon = "ui/icons/special.png",
				text = "当前处于“黑暗强化”状态，每次攻击额外消耗 [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel] + "[/color] 点灵魂能量。"
			});
			ret.push({
				id = 8,
				type = "text",
				text = "  对伤害目标及其周围一格内的所有敌人造成相当于本次攻击" + this.Const.EL_LichKing.Weapon.NormalSkill.AdditionDamagePersent[this.m.EL_RankLevel] * 100 + "%的伤害，此额外伤害必中且触发一次士气判定，士气判定额外惩罚基于你的决心与霜之哀伤等阶。"
			});
        }

		return ret;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInGreatSwords ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
        local attack_tiles = [];
		local target = _targetTile.getEntity();
		local success = this.attackEntity(_user, target);
        attack_tiles.push(_targetTile);

		if (!_user.isAlive() || _user.isDying())
		{
			return success;
		}

		if (success && _targetTile.IsOccupiedByActor && this.Math.rand(1, 100) <= this.m.StunChance && !target.getCurrentProperties().IsImmuneToStun && !target.getSkills().hasSkill("effects.stunned"))
		{
			target.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));

			if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has stunned " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
			}
		}

        if(EL_isInStrengthenForm() && this.World.Assets.EL_getSoulEnergy() > this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel] && !this.m.EL_isExtraAttack)
        {
            this.m.EL_isExtraAttack = true;
            this.World.Assets.EL_addSoulEnergy(-this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel]);
            EL_extraAttack(_user, attack_tiles);
            this.m.EL_isExtraAttack = false;
        }

		return success;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.MeleeSkill += 5;
			_properties.DamageRegularMin += 20;
			_properties.DamageRegularMax += 20;

			if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInGreatSwords)
			{
				_properties.MeleeSkill += 5;
			}
		}
	}

	function EL_extraAttack( _user, _attack_tiles )
	{
        local targets = this.Tactical.Entities.getAllInstances();
        local affect_targets = [];
        foreach( target in targets )
        {
            foreach( tar in target )
            {
                if(tar != null && !tar.isDying() && tar.isAlive() && !tar.isAlliedWith(_user)) {
                    foreach (t in _attack_tiles)
                    {
                        if(tar.getTile().getDistanceTo(t) > 1)
                        {
							continue;
                        }
						local is_repeat = false;
						foreach(tile in _attack_tiles)
						{
							if(tile == tar.getTile())
							{
								is_repeat = true;
								break;
							}
						}
						if(!is_repeat)
						{
							affect_targets.push(tar);
							break;
						}
                    }
                }
            }
        }
        foreach (target in affect_targets)
        {
			if(target != null && !target.isDying() && target.isAlive())
			{
				local properties = this.getContainer().buildPropertiesForUse(this, target);
				properties.DamageTotalMult *= this.Const.EL_LichKing.Weapon.NormalSkill.AdditionDamagePersent[this.m.EL_RankLevel];
				local info = {
					Skill = this,
					Container = this.getContainer(),
					User = _user,
					TargetEntity = target,
					Properties = properties,
					DistanceToTarget = _user.getTile().getDistanceTo(target.getTile())
				};
				this.onScheduledTargetHit(info);
				local difficulty = _user.getBravery() * this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.AdditionMoraleCheckPersent[this.m.EL_RankLevel] + this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.BaseOffset
								this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.RankFactor * (target.EL_getRankLevel() - _user.EL_getRankLevel()) +
								this.Math.pow(this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.CombatLevelFactor, this.Math.abs(target.EL_getCombatLevel() - _user.EL_getCombatLevel())) * (target.EL_getCombatLevel() - _user.EL_getCombatLevel());
				target.checkMorale(-1, difficulty);
			}
        }
	}

    function EL_setRankLevel( _EL_rankLevel )
	{
        this.m.EL_RankLevel = _EL_rankLevel;
    }

});

