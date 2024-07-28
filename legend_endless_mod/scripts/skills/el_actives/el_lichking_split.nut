this.el_lichking_split <- this.inherit("scripts/skills/skill", {
	m = {
        EL_RankLevel = 0,
        EL_isExtraAttack = false
    },
	function create()
	{
		this.m.ID = "el_actives.lichking_split";
		this.m.Name = "Split";
		this.m.Description = "A wide-swinging overhead attack performed for maximum reach rather than force that can hit two tiles in a straight line.";
		this.m.KilledString = "Split in two";
		this.m.Icon = "skills/active_07.png";
		this.m.IconDisabled = "skills/active_07_sw.png";
		this.m.Overlay = "active_07";
		this.m.SoundOnUse = [
			"sounds/combat/split_01.wav",
			"sounds/combat/split_02.wav",
			"sounds/combat/split_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/split_hit_01.wav",
			"sounds/combat/split_hit_02.wav",
			"sounds/combat/split_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsAOE = true;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.3;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 50;
		this.m.ChanceDisembowel = 25;
		this.m.ChanceSmash = 0;
	}
    
	function EL_isInStrengthenForm()
	{
        return  this.getContainer().hasSkill("el_effect.lichking_strengthen");
	}
    
	function isUsable()
	{
        return EL_isInStrengthenForm() && this.World.Assets.EL_getSoulEnergy() < this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel] ? false : this.skill.isUsable();
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Can hit up to 2 targets"
		});

		if (!this.getContainer().getActor().getCurrentProperties().IsSpecializedInGreatSwords)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] chance to hit"
			});
		}
		else
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] chance to hit"
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
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSplit);
        local attack_targets = [];
		local ret = this.attackEntity(_user, _targetTile.getEntity());
        attack_targets.push(_targetTile);

		if (!_user.isAlive() || _user.isDying())
		{
			return ret;
		}

		local ownTile = _user.getTile();
		local dir = ownTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local forwardTile = _targetTile.getNextTile(dir);

			if (forwardTile.IsOccupiedByActor && forwardTile.getEntity().isAttackable() && this.Math.abs(forwardTile.Level - ownTile.Level) <= 1)
			{
				ret = this.attackEntity(_user, forwardTile.getEntity()) || ret;
                attack_targets.push(forwardTile);
			}
		}
        if(EL_isInStrengthenForm() && this.World.Assets.EL_getSoulEnergy() > this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel] && !this.m.EL_isExtraAttack)
        {
            this.m.EL_isExtraAttack = true;
            this.World.Assets.EL_addSoulEnergy(-this.Const.EL_LichKing.Weapon.NormalSkill.AdditionSoulEnergyCost[this.m.EL_RankLevel]);
            EL_extraAttack(_user, attack_targets);
            this.m.EL_isExtraAttack = false;
        }

		return ret;
	}

	function onTargetSelected( _targetTile )
	{
		this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, _targetTile, _targetTile.Pos.X, _targetTile.Pos.Y);
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local forwardTile = _targetTile.getNextTile(dir);

			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= 1)
			{
				this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, forwardTile, forwardTile.Pos.X, forwardTile.Pos.Y);
			}
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			if (!this.getContainer().getActor().getCurrentProperties().IsSpecializedInGreatSwords)
			{
				_properties.MeleeSkill -= 5;
			}
			else
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
				if(target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					local is_able_to_die = target.m.IsAbleToDie;
					target.m.IsAbleToDie = false;
					this.onScheduledTargetHit(info);
					target.m.IsAbleToDie = is_able_to_die;
				}
				else
				{
					this.onScheduledTargetHit(info);
					local difficulty = _user.getBravery() * this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.AdditionMoraleCheckPersent[this.m.EL_RankLevel] + this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.BaseOffset
									this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.RankFactor * (target.EL_getRankLevel() - _user.EL_getRankLevel()) +
									this.Math.pow(this.Const.EL_LichKing.Weapon.NormalSkill.MoraleCheck.CombatLevelFactor, this.Math.abs(target.EL_getCombatLevel() - _user.EL_getCombatLevel())) * (target.EL_getCombatLevel() - _user.EL_getCombatLevel());
					target.checkMorale(-1, difficulty);
				}
			}
        }
	}

    function EL_setRankLevel( _EL_rankLevel )
	{
        this.m.EL_RankLevel = _EL_rankLevel;
    }

});

