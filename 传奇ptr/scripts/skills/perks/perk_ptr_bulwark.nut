this.perk_ptr_bulwark <- this.inherit("scripts/skills/skill", {
	m = {
		ArmorPercentageAsBonus = 2
	},
	function create()
	{
		this.m.ID = "perk.ptr_bulwark";
		this.m.Name = this.Const.Strings.PerkName.PTRBulwark;
		this.m.Description = "%name% feels braver the more durable %their% armor is!"
		this.m.Icon = "ui/perks/ptr_bulwark.png";
		this.m.IconMini = "ptr_bulwark_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local bonus = this.getBonus();
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Resolve"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Resolve at negative morale checks except mental attacks"
		});

		return tooltip;
	}

	function getBonus()
	{
		local armor = this.getContainer().getActor().getArmor(this.Const.BodyPart.Head) + this.getContainer().getActor().getArmor(this.Const.BodyPart.Body);
		return this.Math.floor(armor * this.m.ArmorPercentageAsBonus * 0.01);
	}

	function onUpdate(_properties)
	{
		_properties.Bravery += this.getBonus();
	}
});
