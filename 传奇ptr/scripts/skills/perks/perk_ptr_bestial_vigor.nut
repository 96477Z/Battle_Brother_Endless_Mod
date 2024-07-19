this.perk_ptr_bestial_vigor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_bestial_vigor";
		this.m.Name = this.Const.Strings.PerkName.PTRBestialVigor;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBestialVigor;
		this.m.Icon = "ui/perks/ptr_bestial_vigor.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.getContainer().add(this.new("scripts/skills/actives/ptr_bestial_vigor_skill"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_bestial_vigor");
	}
});
