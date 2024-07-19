this.perk_ptr_follow_up <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_follow_up";
		this.m.Name = this.Const.Strings.PerkName.PTRFollowUp;
		this.m.Description = this.Const.Strings.PerkDescription.PTRFollowUp;
		this.m.Icon = "ui/perks/ptr_follow_up.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.ptr_follow_up"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/ptr_follow_up_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.ptr_follow_up");
	}
});

