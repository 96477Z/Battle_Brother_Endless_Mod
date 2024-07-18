this.perk_ptr_heavy_projectiles <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_heavy_projectiles";
		this.m.Name = this.Const.Strings.PerkName.PTRHeavyProjectiles;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHeavyProjectiles;
		this.m.Icon = "ui/perks/ptr_heavy_projectiles.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Sling))
		{
			return true;
		}

		return false;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_skill.isAttack() || !_skill.isRanged() || !_targetEntity.isAlive() || _targetEntity.isDying() || !this.isEnabled())
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (_bodyPart == this.Const.BodyPart.Head)
		{
			if (_targetEntity.getCurrentProperties().IsImmuneToStun)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));
				if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + "\'s use of heavy projectiles leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed");
				}
			}
			else
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
				if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + "\'s use of heavy projectiles leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " stunned");
				}
			}
		}
		else
		{
			if (_targetEntity.getCurrentProperties().IsImmuneToStun)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_baffled_effect"));
				if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + "\'s use of heavy projectiles leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " baffled");
				}
			}
			else
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));
				if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + "\'s use of heavy projectiles leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed");
				}
			}
		}
	}
});
