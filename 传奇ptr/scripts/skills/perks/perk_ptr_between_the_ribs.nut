this.perk_ptr_between_the_ribs <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		DamageBonusPerSurroundCount = 0.05
	},
	function create()
	{
		this.m.ID = "perk.ptr_between_the_ribs";
		this.m.Name = this.Const.Strings.PerkName.PTRBetweenTheRibs;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBetweenTheRibs;
		this.m.Icon = "ui/perks/ptr_between_the_ribs.png";
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
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Dagger))
		{
			return false;
		}

		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || _targetEntity == null || _targetEntity.getCurrentProperties().IsImmuneToSurrounding || _targetEntity.isAlliedWith(this.getContainer().getActor()))
		{
			return;
		}

		if (!this.isEnabled())
		{
			return;
		}

		local count = _targetEntity.getSurroundedCount();
		_properties.DamageTotalMult *= 1.0 + (this.m.DamageBonusPerSurroundCount * count);
	}
});
