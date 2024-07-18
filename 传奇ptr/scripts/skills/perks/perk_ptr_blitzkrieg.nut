this.perk_ptr_blitzkrieg <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_blitzkrieg";
		this.m.Name = this.Const.Strings.PerkName.PTRBlitzkrieg;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBlitzkrieg;
		this.m.Icon = "ui/perks/ptr_blitzkrieg.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.getContainer().add(this.new("scripts/skills/actives/ptr_blitzkrieg_skill"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_blitzkrieg");
	}
});
