this.ptr_swordmaster_versatile_swordsman_stance_reverse_grip_skill <- this.inherit("scripts/skills/actives/ptr_swordmaster_versatile_swordsman_stance_abstract", {
	m = {
		RemovedSkills = []
	},
	function create()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.create();
		this.m.ID = "actives.ptr_swordmaster_versatile_swordsman_stance_reverse_grip";
		this.m.Name = "Stance: Reverse Grip";
		this.m.Description = "Grab your sword in a reverse grip to use it like a mace.";
		this.m.Icon = "skills/ptr_swordmaster_versatile_swordsman_stance_reverse_grip_skill.png";
		this.m.IconDisabled = "skills/ptr_swordmaster_versatile_swordsman_stance_reverse_grip_skill_bw.png";
		this.m.Overlay = "ptr_swordmaster_versatile_swordsman_stance_reverse_grip_skill";
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

		local skillsString = this.getContainer().getActor().getMainhandItem().isItemType(::Const.Items.ItemType.TwoHanded) ? "[color=" + this.Const.UI.Color.PositiveValue + "]Cudgel[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]Strike Down[/color]" : "[color=" + this.Const.UI.Color.PositiveValue + "]Bash[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]Knock Out[/color]";
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png"
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Removes[/color] all skills from the currently equipped sword and adds the " + skillsString + " skills"
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

		if (weapon.isItemType(::Const.Items.ItemType.TwoHanded))
		{
			weapon.addSkill(this.new("scripts/skills/actives/cudgel_skill"));
			weapon.addSkill(this.new("scripts/skills/actives/strike_down_skill"));
		}
		else
		{
			weapon.addSkill(this.new("scripts/skills/actives/bash"));
			weapon.addSkill(this.new("scripts/skills/actives/knock_out"));
		}
	}

	function toggleOff()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.toggleOff();
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && this.m.RemovedSkills.len() != 0)
		{
			if (weapon.isItemType(::Const.Items.ItemType.TwoHanded))
			{
				weapon.removeSkill(this.getContainer().getSkillByID("actives.cudgel"));
				weapon.removeSkill(this.getContainer().getSkillByID("actives.strike_down"));
			}
			else
			{
				weapon.removeSkill(this.getContainer().getSkillByID("actives.bash"));
				weapon.removeSkill(this.getContainer().getSkillByID("actives.knock_out"));
			}

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
