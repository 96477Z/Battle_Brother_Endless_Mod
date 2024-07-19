this.perk_ptr_marksmanship <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_marksmanship";
		this.m.Name = this.Const.Strings.PerkName.PTRMarksmanship;
		this.m.Description = this.Const.Strings.PerkDescription.PTRMarksmanship;
		this.m.Icon = "ui/perks/ptr_marksmanship.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	{
		if (!this.getContainer().getActor().isArmedWithRangedWeapon())
		{
			return;
		}
				
		local bonus = this.Math.floor(this.getContainer().getActor().getBaseProperties().RangedSkill * 0.1);
		_properties.DamageRegularMin += bonus;
		_properties.DamageRegularMax += bonus;
	}
});
