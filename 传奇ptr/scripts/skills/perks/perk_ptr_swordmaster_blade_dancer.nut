this.perk_ptr_swordmaster_blade_dancer <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_blade_dancer";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterBladeDancer;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterBladeDancer;
		this.m.Icon = "ui/perks/ptr_swordmaster_blade_dancer.png";
	}

	function onAfterUpdate( _properties )
	{
		if (!this.isEnabled()) return;

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (!weapon.isWeaponType(::Const.Items.WeaponType.BFFencing))
		{
			local skills = this.getContainer().getActor().getMainhandItem().getSkills();
			foreach (skill in skills)
			{
				skill.m.ActionPointCost = ::Math.max(0, skill.m.ActionPointCost - 1);
			}
		}

		local kataStep = this.getContainer().getSkillByID("actives.ptr_kata_step")
		if (kataStep != null)
		{
			kataStep.m.ActionPointCost = ::Math.max(0, kataStep.m.ActionPointCost - 2);
			kataStep.m.FatigueCost = ::Math.max(0, kataStep.m.FatigueCost - 2);
		}
	}
});
