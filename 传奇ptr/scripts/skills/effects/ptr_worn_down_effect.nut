this.ptr_worn_down_effect <- this.inherit("scripts/skills/skill", {
	m = {
		FatigueEffectIncrease = 10
	},
	function create()
	{
		this.m.ID = "effects.ptr_worn_down";
		this.m.Name = "Worn Down";
		this.m.Description = "This character is feeling worn down after reciving rather tiring attacks.";
		this.m.Icon = "ui/perks/ptr_wear_them_down.png";
		this.m.IconMini = "ptr_worn_down_effect_mini";
		this.m.Overlay = "ptr_worn_down_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + (1.0 + this.m.FatigueEffectIncrease * 0.01) + "%[/color] Fatigue built"
		});

		return tooltip;
	}

	function onUpdate( _properties )
	{
		if (!this.isGarbage())
		{
			_properties.FatigueEffectMult *= 1.0 + this.m.FatigueEffectIncrease * 0.01;
		}
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}
});
