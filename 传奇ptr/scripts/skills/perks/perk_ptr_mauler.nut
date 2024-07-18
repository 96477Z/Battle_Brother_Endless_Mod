this.perk_ptr_mauler <- this.inherit("scripts/skills/skill", {
	m = {
		MaxBonus = 35,
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_mauler";
		this.m.Name = this.Const.Strings.PerkName.PTRMauler;
		this.m.Description = this.Const.Strings.PerkDescription.PTRMauler;
		this.m.Icon = "ui/perks/ptr_mauler.png";
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
		if(weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Cleaver))
		{
			return false;
		}

		return true;
	}

	function getBonus( _targetEntity )
	{
		local remainingArmorFraction = _targetEntity.getRemainingArmorFraction();

		return 0.01 * this.m.MaxBonus * (1.0 - remainingArmorFraction);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || _targetEntity == null || !this.isEnabled())
		{
			return;
		}

		_properties.DamageTotalMult *= 1.0 + this.getBonus(_targetEntity);
	}
});
