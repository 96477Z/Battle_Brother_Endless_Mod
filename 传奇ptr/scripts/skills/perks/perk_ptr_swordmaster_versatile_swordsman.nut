this.perk_ptr_swordmaster_versatile_swordsman <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_versatile_swordsman";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterVersatileSwordsman;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterVersatileSwordsman;
		this.m.Icon = "ui/perks/ptr_swordmaster_versatile_swordsman.png";
	}

	function onAdded()
	{
		if (this.perk_ptr_swordmaster_abstract.onAdded())
		{
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_versatile_swordsman_stance_half_swording_skill"));
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_versatile_swordsman_stance_reverse_grip_skill"));
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_versatile_swordsman_stance_meisterhau_skill"));
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_swordmaster_versatile_swordsman_stance_half_swording");
		this.getContainer().removeByID("actives.ptr_swordmaster_versatile_swordsman_stance_reverse_grip");
		this.getContainer().removeByID("actives.ptr_swordmaster_versatile_swordsman_stance_meisterhau");
	}
});
