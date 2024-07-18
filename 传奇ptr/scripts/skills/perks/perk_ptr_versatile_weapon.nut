this.perk_ptr_versatile_weapon <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 0.05
	},
	function create()
	{
		this.m.ID = "perk.ptr_versatile_weapon";
		this.m.Name = this.Const.Strings.PerkName.PTRVersatileWeapon;
		this.m.Description = this.Const.Strings.PerkDescription.PTRVersatileWeapon;
		this.m.Icon = "ui/perks/ptr_versatile_weapon.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local weapon = this.getContainer().getActor().getMainhandItem();

		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return;
		}

		_properties.MeleeDamageMult += this.m.Bonus;
		_properties.DamageDirectAdd += this.m.Bonus;
		_properties.DamageArmorMult += this.m.Bonus;
	}
});
