this.perk_ptr_utilitarian <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		PivotFat = 15,
		FatChangeStep = 2,
		MeleeSkillMaxBonus = 10,
		FatReductionMaxBonus = 15
	},
	function create()
	{
		this.m.ID = "perk.ptr_utilitarian";
		this.m.Name = this.Const.Strings.PerkName.PTRUtilitarian;
		this.m.Description = "This character is skilled in long reach weapons and gains bonuses depending on the weight of %their% armor";
		this.m.Icon = "ui/perks/ptr_utilitarian.png";
		// this.m.IconMini = "ptr_utilitarian_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
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
		local fat = this.getTotalArmorFat();

		local meleeSkillBonus = this.getMeleeSkillBonus(fat);
		if (meleeSkillBonus > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + meleeSkillBonus + "[/color] Melee Skill"
			});
		}
		else if (meleeSkillBonus < 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + meleeSkillBonus + "[/color] Melee Skill"
			});
		}

		local fatReductionBonus = this.getFatigueReductionBonus(fat);
		if (fatReductionBonus > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Skills build up [color=" + this.Const.UI.Color.PositiveValue + "]-" + fatReductionBonus + "%[/color] Fatigue"
			});
		}
		else if (fatReductionBonus < 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]+" + this.Math.abs(fatReductionBonus) + "%[/color] Fatigue"
			});
		}

		local damageBonus = this.getDamageBonus(fat);
		if (damageBonus > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + damageBonus + "%[/color] Melee Damage"
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
		if (weapon == null || weapon.getRangeMax() != 2 || !weapon.isItemType(this.Const.Items.ItemType.TwoHanded) || !weapon.isItemType(this.Const.Items.ItemType.MeleeWeapon))
		{
			return false;
		}

		return true;
	}

	function getTotalArmorFat()
	{
		local fat = 0;

		local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);

		if (body != null)
		{
			fat = fat + body.getStaminaModifier();
		}

		if (head != null)
		{
			fat = fat + head.getStaminaModifier();
		}

		return this.Math.abs(fat);
	}

	function onUpdate(_properties)
	{
		if (!this.isEnabled())
		{
			return;
		}

		local fat = this.getTotalArmorFat();

		_properties.MeleeSkill += this.getMeleeSkillBonus(fat);
		_properties.FatigueEffectMult *= 1.0 - this.getFatigueReductionBonus(fat) * 0.01;
		_properties.MeleeDamageMult *= 1.0 + this.getDamageBonus(fat) * 0.01;
	}

	function getMeleeSkillBonus(_armorFat)
	{
		if (_armorFat > this.m.PivotFat)
		{
			return this.m.MeleeSkillMaxBonus - (_armorFat - this.m.PivotFat) / this.m.FatChangeStep;
		}

		return this.m.MeleeSkillMaxBonus;
	}

	function getFatigueReductionBonus(_armorFat)
	{
		if (_armorFat > this.m.PivotFat)
		{
			return this.m.FatReductionMaxBonus - (_armorFat - this.m.PivotFat) / this.m.FatChangeStep;
		}

		return this.m.FatReductionMaxBonus;
	}

	function getDamageBonus(_armorFat)
	{
		if (_armorFat > this.m.PivotFat)
		{
			return (_armorFat - this.m.PivotFat) / 2;
		}

		return 0;
	}
});
