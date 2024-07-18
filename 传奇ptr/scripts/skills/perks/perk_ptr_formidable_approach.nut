this.perk_ptr_formidable_approach <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_formidable_approach";
		this.m.Name = this.Const.Strings.PerkName.PTRFormidableApproach;
		this.m.Description = this.Const.Strings.PerkDescription.PTRFormidableApproach;
		this.m.Icon = "ui/perks/ptr_formidable_approach.png";
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
		if (weapon == null || !(weapon.isItemType(this.Const.Items.ItemType.TwoHanded) && weapon.isItemType(this.Const.Items.ItemType.MeleeWeapon)))
		{
			return false;
		}

		return true;
	}
});
