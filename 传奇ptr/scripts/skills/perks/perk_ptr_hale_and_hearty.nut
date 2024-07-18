this.perk_ptr_hale_and_hearty <- this.inherit("scripts/skills/skill", {
	m = {
		FatigueRecoveryBonusPercentage = 5
	},
	function create()
	{
		this.m.ID = "perk.ptr_hale_and_hearty";
		this.m.Name = this.Const.Strings.PerkName.PTRHaleAndHearty;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHaleAndHearty;
		this.m.Icon = "ui/perks/ptr_hale_and_hearty.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	{
		_properties.FatigueRecoveryRate += this.Math.floor(0.01 * this.m.FatigueRecoveryBonusPercentage * this.getContainer().getActor().getFatigueMax());
	}
});
