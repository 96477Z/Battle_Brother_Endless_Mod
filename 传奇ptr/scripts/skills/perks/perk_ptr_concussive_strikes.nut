this.perk_ptr_concussive_strikes <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_concussive_strikes";
		this.m.Name = this.Const.Strings.PerkName.PTRConcussiveStrikes;
		this.m.Description = this.Const.Strings.PerkDescription.PTRConcussiveStrikes;
		this.m.Icon = "ui/perks/ptr_concussive_strikes.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_bodyPart != this.Const.BodyPart.Head || !_skill.isAttack())
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(actor))
		{
			return;
		}

		local weapon = actor.getMainhandItem();
		if (weapon == null)
		{
			return;
		}

		local isMace = false;
		if (weapon.isWeaponType(this.Const.Items.WeaponType.Mace) && _skill.m.IsWeaponSkill && _skill.getDamageType().contains(this.Const.Damage.DamageType.Blunt))
		{
			isMace = true;
		}

		local isTwoHanded = false;
		if (weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
		{
			isTwoHanded = true;
		}

		local targetTile = _targetEntity.getTile();

		if (weapon.isWeaponType(this.Const.Items.WeaponType.Mace) && _skill.m.IsWeaponSkill && _skill.getDamageType().contains(this.Const.Damage.DamageType.Blunt))
		{
			if (weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
			{
				if (!_targetEntity.getCurrentProperties().IsImmuneToStun)
				{
					if (!_targetEntity.getSkills().hasSkill("effects.stunned"))
					{
						_targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));

						if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
						{
							this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has stunned " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for one turn");
						}
					}
				}
				else
				{
					local effect = this.new("scripts/skills/effects/dazed_effect");
					_targetEntity.getSkills().add(effect);
					effect.m.TurnsLeft = this.Math.max(1, 1 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);

					if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " struck a blow that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed for " + effect.m.TurnsLeft + " turns");
					}
				}
			}
			else
			{
				local effect = this.new("scripts/skills/effects/dazed_effect");
				_targetEntity.getSkills().add(effect);
				effect.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
				if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " struck a blow that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed for " + effect.m.TurnsLeft + " turns");
				}
			}
		}
		else
		{
			local effect = this.new("scripts/skills/effects/dazed_effect");
			_targetEntity.getSkills().add(effect);
			effect.m.TurnsLeft = this.Math.max(1, 1 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
			if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " struck a blow that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed for " + effect.m.TurnsLeft + " turns");
			}
		}

		// if (isTwoHanded && isMace)
		// {
			// if (!_targetEntity.getCurrentProperties().IsImmuneToStun)
			// {
				// if (!_targetEntity.getSkills().hasSkill("effects.stunned"))
				// {
					// _targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));

					// if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
					// {
						// this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has stunned " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for one turn");
					// }
				// }
			// }
			// else
			// {
				// local effect = this.new("scripts/skills/effects/dazed_effect");
				// effect.m.TurnsLeft = 1;
				// _targetEntity.getSkills().add(effect);

				// if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
				// {
					// this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " struck a blow that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed for " + effect.m.TurnsLeft + " turns");
				// }
			// }
		// }
		// else
		// {
			// local effect = this.new("scripts/skills/effects/dazed_effect");
			// effect.m.TurnsLeft = isMace ? 2 : 1;
			// _targetEntity.getSkills().add(effect);
			// if (!actor.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
			// {
				// this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " struck a blow that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed for " + effect.m.TurnsLeft + " turns");
			// }
		// }
	}
});
