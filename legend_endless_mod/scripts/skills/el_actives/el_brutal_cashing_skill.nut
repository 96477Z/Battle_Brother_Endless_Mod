this.el_brutal_cashing_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ApplyBonusToBodyPart = -1
	},

	function create()
	{
		this.m.ID = "actives.strike";//"el_rarity_actives.brutal_cashing_skill";
		this.m.Name = "残暴劈砍";
		this.m.Description = "A slow overhead strike performed with full force to smash a target to bits.";
		this.m.Icon = "skills/active_66.png";
		this.m.IconDisabled = "skills/active_66_sw.png";
		this.m.Overlay = "active_66";
		this.m.SoundOnUse = [
			"sounds/combat/strike_01.wav",
			"sounds/combat/strike_02.wav",
			"sounds/combat/strike_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/strike_hit_01.wav",
			"sounds/combat/strike_hit_02.wav",
			"sounds/combat/strike_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsTooCloseShown = true;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.3;
		this.m.HitChanceBonus = 0;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.ChanceDecapitate = 50;
		this.m.ChanceDisembowel = 33;
		this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles"
		});

		if (!this.getContainer().getActor().getCurrentProperties().IsSpecializedInAxes)
        {
            ret.push({
                id = 6,
                type = "text",
                icon = "ui/icons/hitchance.png",
                text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] chance to hit targets directly adjacent"
            });
        }

		return ret;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInAxes ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		local targetEntity = _targetTile.getEntity();
		local success = this.attackEntity(_user, _targetTile.getEntity());

		if (!_user.isAlive() || _user.isDying())
		{
			return success;
		}

		if (success && this.m.ApplyBonusToBodyPart != -1 && !_targetTile.IsEmpty && targetEntity.isAlive() && targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
		{
			local p = this.getContainer().buildPropertiesForUse(this, targetEntity);
			local hitInfo = clone this.Const.Tactical.HitInfo;
			local damageRegular = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageRegularMult * 0.5;
			local damageArmor = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageArmorMult * 0.5;
			local damageDirect = this.Math.minf(1.0, p.DamageDirectMult * (this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd));
			hitInfo.DamageRegular = damageRegular;
			hitInfo.DamageArmor = damageArmor;
			hitInfo.DamageDirect = damageDirect;
			hitInfo.BodyPart = this.m.ApplyBonusToBodyPart;
			hitInfo.BodyDamageMult = 1.0;
			local damageDirect = this.Math.minf(1.0, p.DamageDirectMult * (this.m.DirectDamageMult + p.DamageDirectAdd));
			hitInfo.DamageDirect = damageDirect;
			targetEntity.onDamageReceived(this.getContainer().getActor(), this, hitInfo);
			this.m.ApplyBonusToBodyPart = -1;
		}

		return success;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this)
		{
			this.m.ApplyBonusToBodyPart = _bodyPart == this.Const.BodyPart.Body ? this.Const.BodyPart.Head : this.Const.BodyPart.Body;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			if (_targetEntity != null && !this.getContainer().getActor().getCurrentProperties().IsSpecializedInAxes && this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) == 1)
			{
				_properties.MeleeSkill += -15;
				this.m.HitChanceBonus = -10;
			}
		}
	}

    function EL_isRaritySkill()
    {
        return true;
    }

	function onAdded()
	{
		this.World.Assets.EL_addToPursuitList(this.getContainer().getActor(), this.Const.EL_Rarity_Entry.EL_getAttackSkill(this.getContainer().getActor()));
	}

	function onCombatStarted()
	{
		this.World.Assets.EL_addToPursuitList(this.getContainer().getActor(), this.Const.EL_Rarity_Entry.EL_getAttackSkill(this.getContainer().getActor()));
	}

	function onRemoved()
	{
		this.World.Assets.EL_removeByPursuitList(this.getContainer().getActor());
	}

	function onDeath()
	{
		this.World.Assets.EL_removeByPursuitList(this.getContainer().getActor());
	}
});

