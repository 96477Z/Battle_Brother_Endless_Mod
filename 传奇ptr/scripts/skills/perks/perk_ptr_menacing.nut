this.perk_ptr_menacing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_menacing";
		this.m.Name = this.Const.Strings.PerkName.PTRMenacing;
		this.m.Description = this.Const.Strings.PerkDescription.PTRMenacing;
		this.m.Icon = "ui/perks/ptr_menacing.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	{
		_properties.Threat += 10;
	}
});
