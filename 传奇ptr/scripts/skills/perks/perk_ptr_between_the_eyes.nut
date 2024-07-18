this.perk_ptr_between_the_eyes <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_between_the_eyes";
		this.m.Name = this.Const.Strings.PerkName.PTRBetweenTheEyes;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBetweenTheEyes;
		this.m.Icon = "ui/perks/ptr_between_the_eyes.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.getContainer().hasSkill("actives.ptr_between_the_eyes"))
		{
			this.getContainer().add(this.new("scripts/skills/actives/ptr_between_the_eyes_skill"));
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_between_the_eyes");
	}
});

