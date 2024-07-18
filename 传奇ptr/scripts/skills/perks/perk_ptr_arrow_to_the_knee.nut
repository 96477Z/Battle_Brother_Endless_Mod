this.perk_ptr_arrow_to_the_knee <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_arrow_to_the_knee";
		this.m.Name = this.Const.Strings.PerkName.PTRArrowToTheKnee;
		this.m.Description = this.Const.Strings.PerkDescription.PTRArrowToTheKnee;
		this.m.Icon = "ui/perks/ptr_arrow_to_the_knee.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.getContainer().hasSkill("actives.ptr_arrow_to_the_knee"))
		{
			this.getContainer().add(this.new("scripts/skills/actives/ptr_arrow_to_the_knee_skill"));
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_arrow_to_the_knee");
	}
});

