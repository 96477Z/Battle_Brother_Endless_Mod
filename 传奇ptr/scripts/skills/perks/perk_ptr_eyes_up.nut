this.perk_ptr_eyes_up <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		TargetEntity = null,
		TargetTile = null
	},
	function create()
	{
		this.m.ID = "perk.ptr_eyes_up";
		this.m.Name = this.Const.Strings.PerkName.PTREyesUp;
		this.m.Description = this.Const.Strings.PerkDescription.PTREyesUp;
		this.m.Icon = "ui/perks/ptr_eyes_up.png";
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
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
		{
			return false;
		}

		return true;
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_targetEntity != null && this.isEnabled() && (_skill.isRanged() || this.m.IsForceEnabled))
		{
			this.m.TargetEntity = _targetEntity;
			this.m.TargetTile = _targetTile;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.applyEffect();
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		this.applyEffect();
	}

	function applyEffect()
	{
		if (this.m.TargetEntity == null) return;

		if (this.m.TargetEntity.isAlive() && !this.m.TargetEntity.isDying()) this.m.TargetEntity.getSkills().add(this.new("scripts/skills/effects/ptr_eyes_up_effect"));
		for (local i = 0; i < 6; i++)
		{
			if (this.m.TargetTile.hasNextTile(i))
			{
				local nextTile = this.m.TargetTile.getNextTile(i);
				if (nextTile.IsOccupiedByActor)
				{
					if (nextTile.getEntity().isAlliedWith(this.getContainer().getActor())) continue;

					local effect = ::new("scripts/skills/effects/ptr_eyes_up_effect");
					local previouslyAppliedEffect = nextTile.getEntity().getSkills().getSkillByID("effects.ptr_eyes_up");
					if (previouslyAppliedEffect != null)
					{
						previouslyAppliedEffect.m.Stacks -= 0.5;
					}
					else
					{
						effect.m.Stacks -= 0.5;
					}
					nextTile.getEntity().getSkills().add(effect);
				}
			}
		}

		this.m.TargetEntity = null;
		this.m.TargetTile = null;
	}
});
