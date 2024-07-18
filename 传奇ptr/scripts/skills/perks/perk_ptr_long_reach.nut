this.perk_ptr_long_reach <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false	
	},
	function create()
	{
		this.m.ID = "perk.ptr_long_reach";
		this.m.Name = this.Const.Strings.PerkName.PTRLongReach;
		this.m.Description = this.Const.Strings.PerkDescription.PTRLongReach;
		this.m.Icon = "ui/perks/ptr_long_reach.png";
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
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Polearm))
		{
			return true;
		}

		return false;
	}
});

