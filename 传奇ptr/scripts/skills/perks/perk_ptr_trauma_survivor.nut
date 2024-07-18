this.perk_ptr_trauma_survivor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_trauma_survivor";
		this.m.Name = this.Const.Strings.PerkName.PTRTraumaSurvivor;
		this.m.Description = this.Const.Strings.PerkDescription.PTRTraumaSurvivor;
		this.m.Icon = "ui/perks/ptr_trauma_survivor.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getBonusRes()
	{
		return this.Math.floor(this.getContainer().getActor().getBravery() * 0.5);
	}
});
