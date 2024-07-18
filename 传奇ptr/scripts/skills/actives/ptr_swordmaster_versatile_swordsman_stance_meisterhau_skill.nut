this.ptr_swordmaster_versatile_swordsman_stance_meisterhau_skill <- this.inherit("scripts/skills/actives/ptr_swordmaster_versatile_swordsman_stance_abstract", {
	m = {
		RemovedSkills = []
	},
	function create()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.create();
		this.m.ID = "actives.ptr_swordmaster_versatile_swordsman_stance_meisterhau";
		this.m.Name = "Stance: Meisterhau";
		this.m.Description = "Readying yourself for the master strikes known as the Meisterhäu allows you to strike and defend at the same time.";
		this.m.Icon = "skills/ptr_swordmaster_versatile_swordsman_stance_meisterhau_skill.png";
		this.m.IconDisabled = "skills/ptr_swordmaster_versatile_swordsman_stance_meisterhau_skill_bw.png";
		this.m.Overlay = "ptr_swordmaster_versatile_swordsman_stance_meisterhau_skill";
		this.m.SoundOnUse = [
			"sounds/combat/riposte_01.wav",
			"sounds/combat/riposte_02.wav",
			"sounds/combat/riposte_03.wav"
		];
	}

	function onAdded()
	{
		this.toggleOn();
	}

	function getTooltip()
	{
		local tooltip = this.ptr_swordmaster_versatile_swordsman_stance_abstract.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png"
			text = "Currently Active: " + (this.m.IsOn ? "[color=" + this.Const.UI.Color.PositiveValue + "]Yes[/color]" : "[color=" + this.Const.UI.Color.NegativeValue + "]No[/color]")
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png"
			text = "Moving from your position no longer disables the En Garde perk"
		});

		this.addEnabledTooltip(tooltip);

		return tooltip;
	}

	function onCombatStarted()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.onCombatStarted();
		this.toggleOn();
	}

	function onCombatFinished()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.onCombatFinished();
		this.toggleOn();
	}
});
