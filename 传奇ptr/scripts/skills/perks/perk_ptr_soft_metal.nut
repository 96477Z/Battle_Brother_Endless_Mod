this.perk_ptr_soft_metal <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_soft_metal";
		this.m.Name = this.Const.Strings.PerkName.PTRSoftMetal;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSoftMetal;
		this.m.Icon = "ui/perks/ptr_soft_metal.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isEnabled(_skill)
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		if (!_skill.getDamageType().contains(this.Const.Damage.DamageType.Blunt))
		{
			return false;
		}

		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity != null && _skill.isAttack() && this.isEnabled(_skill))
		{
			local remArmorFraction = _targetEntity.getRemainingArmorFraction();
			local weapon = this.getContainer().getActor().getMainhandItem();
			if (remArmorFraction < 0.6 || (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Hammer)))
			_properties.DamageDirectAdd += 0.1;
		}
	}
});
