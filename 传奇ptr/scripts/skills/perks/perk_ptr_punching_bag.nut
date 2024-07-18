this.perk_ptr_punching_bag <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_punching_bag";
		this.m.Name = this.Const.Strings.PerkName.PTRPunchingBag;
		this.m.Description = this.Const.Strings.PerkDescription.PTRPunchingBag;
		this.m.Icon = "ui/perks/ptr_punching_bag.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	{
		_properties.IsAffectedByLosingHitpoints = false;
	}
});
