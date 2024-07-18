this.perk_ptr_vanguard_deployment <- this.inherit("scripts/skills/skill", {
	m = {
		UsesRemaining = 2	
	},
	function create()
	{
		this.m.ID = "perk.ptr_vanguard_deployment";
		this.m.Name = this.Const.Strings.PerkName.PTRVanguardDeployment;
		this.m.Description = this.Const.Strings.PerkDescription.PTRVanguardDeployment;
		this.m.Icon = "ui/perks/perk_ptr_vanguard_deployment.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		this.m.UsesRemaining = 2;

		local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());
		foreach (ally in allies)
		{
			local skill = this.new("scripts/skills/actives/ptr_deploy_in_vanguard_skill");
			skill.setTacticianPerk(this);
			ally.getSkills().add(skill);
		}
	}

	function canDeploy()
	{
		return this.m.UsesRemaining > 0 && this.Time.getRound() == 1;
	}
});
