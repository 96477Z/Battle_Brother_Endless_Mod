this.perk_ptr_swordmaster_reaper <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {
		ActionPointCostReduction = 2,
		FatigueCostMultReduction = 0.1
	},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_reaper";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterReaper;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterReaper;
		this.m.Icon = "ui/perks/ptr_swordmaster_reaper.png";
	}

	function onAfterUpdate( _properties )
	{
		if (!this.isEnabled()) return;

		local skills = this.getContainer().getActor().getMainhandItem().getSkills();
		foreach (skill in skills)
		{
			if (skill.isAttack() && skill.isAOE())
			{
				skill.m.ActionPointCost = ::Math.max(0, skill.m.ActionPointCost - this.m.ActionPointCostReduction);
				skill.m.FatigueCostMult *= 1 - this.m.FatigueCostMultReduction;
			}
		}
	}
});
