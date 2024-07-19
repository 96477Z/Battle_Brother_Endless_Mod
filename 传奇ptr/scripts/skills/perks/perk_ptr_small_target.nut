this.perk_ptr_small_target <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_small_target";
		this.m.Name = this.Const.Strings.PerkName.PTRSmallTarget;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSmallTarget;
		this.m.Icon = "ui/perks/ptr_small_target.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.HitChance[this.Const.BodyPart.Head] += 10;
	}
});

