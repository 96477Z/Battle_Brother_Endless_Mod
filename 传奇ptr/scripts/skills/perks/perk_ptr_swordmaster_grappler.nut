this.perk_ptr_swordmaster_grappler <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_grappler";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterGrappler;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterGrappler;
		this.m.Icon = "ui/perks/ptr_swordmaster_grappler.png";
	}

	function onAdded()
	{
		if (this.perk_ptr_swordmaster_abstract.onAdded())
		{
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_tackle_skill"));
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_kick_skill"));
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_push_through_skill"));
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_swordmaster_tackle");
		this.getContainer().removeByID("actives.ptr_swordmaster_kick");
		this.getContainer().removeByID("actives.ptr_swordmaster_push_through");
	}
});
