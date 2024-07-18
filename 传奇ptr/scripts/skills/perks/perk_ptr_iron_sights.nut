this.perk_ptr_iron_sights <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 25
	},
	function create()
	{
		this.m.ID = "perk.ptr_iron_sights";
		this.m.Name = this.Const.Strings.PerkName.PTRIronSights;
		this.m.Description = this.Const.Strings.PerkDescription.PTRIronSights;
		this.m.Icon = "ui/perks/ptr_iron_sights.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isItemType(this.Const.Items.ItemType.RangedWeapon) &&
			 (weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow) || weapon.isWeaponType(this.Const.Items.WeaponType.Firearm))
			)
		{
			_properties.HitChance[this.Const.BodyPart.Head] += this.m.Bonus;
		}
	}
});
