this.perk_ptr_wears_it_well <- this.inherit("scripts/skills/skill", {
	m = {
		FatPenReduction = 20
	},
	function create()
	{
		this.m.ID = "perk.ptr_wears_it_well";
		this.m.Name = this.Const.Strings.PerkName.PTRWearsItWell;
		this.m.Description = this.Const.Strings.PerkDescription.PTRWearsItWell;
		this.m.Icon = "ui/perks/ptr_wears_it_well.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate(_properties)
	{
		local actor = this.getContainer().getActor();
		local fat = actor.getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]);

		local mainhand = actor.getMainhandItem();
		if (mainhand != null)
		{
			fat += mainhand.getStaminaModifier();
		}

		local offhand = actor.getOffhandItem();
		if (offhand != null)
		{
			fat += offhand.getStaminaModifier();
		}

		_properties.Stamina -= fat * 20 * 0.01;
	}
});
