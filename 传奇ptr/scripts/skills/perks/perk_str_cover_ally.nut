this.perk_str_cover_ally <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.str_cover_ally";
		this.m.Name = this.Const.Strings.PerkName.STRCoverAlly;
		this.m.Description = this.Const.Strings.PerkDescription.STRCoverAlly;
		this.m.Icon = "ui/perks/ptr_cover_ally.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.getContainer().add(this.new("scripts/skills/actives/str_cover_ally_skill"));
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.str_cover_ally");
	}
});
