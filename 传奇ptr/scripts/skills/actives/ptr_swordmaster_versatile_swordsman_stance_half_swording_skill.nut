this.ptr_swordmaster_versatile_swordsman_stance_half_swording_skill <- this.inherit("scripts/skills/actives/ptr_swordmaster_versatile_swordsman_stance_abstract", {
	m = {
		RemovedSkills = []
	},
	function create()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.create();
		this.m.ID = "actives.ptr_swordmaster_versatile_swordsman_stance_half_swording";
		this.m.Name = "Stance: Half Swording";
		this.m.Description = "Switch to a half-sword grip to allow for precise piercing attacks through your target\'s armor.";
		this.m.Icon = "skills/ptr_swordmaster_versatile_swordsman_stance_half_swording_skill.png";
		this.m.IconDisabled = "skills/ptr_swordmaster_versatile_swordsman_stance_half_swording_skill_bw.png";
		this.m.Overlay = "ptr_swordmaster_versatile_swordsman_stance_half_swording_skill";
		this.m.SoundOnUse = [
			"sounds/combat/riposte_01.wav",
			"sounds/combat/riposte_02.wav",
			"sounds/combat/riposte_03.wav"
		];
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
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Removes[/color] all attack skills from the currently equipped sword and adds the [color=" + this.Const.UI.Color.PositiveValue + "]Puncture[/color] skill"
		});

		if (!this.getContainer().getActor().isArmedWithTwoHandedWeapon() && !this.getContainer().getActor().isDoubleGrippingWeapon())
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a two-handed sword or a double-gripped one-handed sword[/color]"
			});
		}

		this.addEnabledTooltip(tooltip);

		return tooltip;
	}

	function isUsable()
	{
		return this.ptr_swordmaster_versatile_swordsman_stance_abstract.isUsable() && (this.getContainer().getActor().isArmedWithTwoHandedWeapon() || this.getContainer().getActor().isDoubleGrippingWeapon());
	}

	function toggleOn()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.toggleOn();
		local weapon = this.getContainer().getActor().getMainhandItem();
		local skills = weapon.getSkills();
		foreach (skill in skills)
		{
			this.m.RemovedSkills.push(skill);
			weapon.removeSkill(skill);
		}

		weapon.addSkill(this.new("scripts/skills/actives/puncture"));
	}

	function toggleOff()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.toggleOff();
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && this.m.RemovedSkills.len() != 0)
		{
			weapon.removeSkill(this.getContainer().getSkillByID("actives.puncture"));
			foreach (skill in this.m.RemovedSkills)
			{
				weapon.addSkill(skill);
			}
		}

		this.m.RemovedSkills.clear();
	}

	function onUnequip( _item )
	{
		if (_item.getSlotType() == ::Const.ItemSlot.Mainhand) this.m.RemovedSkills.clear();
	}

	function onCombatFinished()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.onCombatFinished();
		this.m.RemovedSkills.clear();
	}
});
