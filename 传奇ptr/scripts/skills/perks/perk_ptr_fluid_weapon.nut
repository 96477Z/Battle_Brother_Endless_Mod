this.perk_ptr_fluid_weapon <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		ArmorPenAsInit = 0.35,
		ArmorEffAsFatCostRed = 0.20,
	},
	function create()
	{
		this.m.ID = "perk.ptr_fluid_weapon";
		this.m.Name = this.Const.Strings.PerkName.PTRFluidWeapon;
		this.m.Description = "Thanks to wielding a well-balanced sword, this character is gaining increased mobility and endurance.";
		this.m.Icon = "ui/perks/ptr_fluid_weapon.png";
		// this.m.IconMini = "ptr_fluid_weapon_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return !this.isEnabled();
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local initiativeBonus = this.getInitiativeBonus();
		if (initiativeBonus > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + initiativeBonus + "[/color] Initiative"
			});
		}

		local fatReductionBonus = this.getFatigueReductionBonus();
		if (fatReductionBonus > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Weapon skills build up [color=" + this.Const.UI.Color.PositiveValue + "]-" + fatReductionBonus + "%[/color] Fatigue"
			});
		}

		return tooltip;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return false;
		}

		return true;
	}

	function onUpdate(_properties)
	{
		if (!this.isEnabled())
		{
			return;
		}		

		_properties.Initiative += this.getInitiativeBonus();		
	}

	function onAfterUpdate(_properties)
	{
		if (!this.isEnabled())
		{
			return;
		}
		
		local skills = this.getContainer().getAllSkillsOfType(this.Const.SkillType.Active);
		foreach (s in skills)
		{
			if (s.m.IsWeaponSkill)
			{
				s.m.FatigueCostMult *= 1.0 - this.getFatigueReductionBonus() * 0.01;
			}
		}
	}

	function getInitiativeBonus()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		local armorPen = weapon.m.DirectDamageMult + weapon.m.DirectDamageAdd;
		return this.Math.floor(this.m.ArmorPenAsInit * armorPen * 100);
	}

	function getFatigueReductionBonus()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		return this.Math.floor(this.m.ArmorEffAsFatCostRed * weapon.m.ArmorDamageMult * 100);
	}
});
