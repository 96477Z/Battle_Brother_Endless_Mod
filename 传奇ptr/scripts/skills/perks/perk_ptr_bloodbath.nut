this.perk_ptr_bloodbath <- this.inherit("scripts/skills/skill", {
	m = {
		RestoredActionPoints = 3
	},
	function create()
	{
		this.m.ID = "perk.ptr_bloodbath";
		this.m.Name = this.Const.Strings.PerkName.PTRBloodbath;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBloodbath;
		this.m.Icon = "ui/perks/ptr_bloodbath.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
});

