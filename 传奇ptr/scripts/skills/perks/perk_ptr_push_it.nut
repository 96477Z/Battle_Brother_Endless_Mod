this.perk_ptr_push_it <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		IsHit = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_push_it";
		this.m.Name = this.Const.Strings.PerkName.PTRPushIt;
		this.m.Description = this.Const.Strings.PerkDescription.PTRPushIt;
		this.m.Icon = "ui/perks/ptr_push_it.png";
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
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Mace))
		{
			return true;
		}

		return false;
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.IsHit = false;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.IsHit && _targetEntity != null && _targetEntity.isAlive() && !_targetEntity.isDying())
		{
			if (_targetEntity.getSkills().hasSkill("effects.stunned"))
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/staggered_effect"));
				local user = this.getContainer().getActor();
				if (!user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " has staggered " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for one turn");
				}
			}
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill.isAttack() && this.isEnabled() && _targetEntity.isAlive() && !_targetEntity.isDying())
		{
			if (!_targetEntity.getSkills().hasSkill("effects.stunned"))
			{
				this.m.IsHit = true;
			}
		}
	}
});

