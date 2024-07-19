this.perk_ptr_heft <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_heft";
		this.m.Name = this.Const.Strings.PerkName.PTRHeft;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHeft;
		this.m.Icon = "ui/perks/ptr_heft.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	{
		local weapon = this.getContainer().getActor().getMainhandItem();

		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Axe))
		{
			_properties.DamageRegularMax += this.Math.floor(weapon.m.RegularDamageMax * 0.3);
		}
	}
});
