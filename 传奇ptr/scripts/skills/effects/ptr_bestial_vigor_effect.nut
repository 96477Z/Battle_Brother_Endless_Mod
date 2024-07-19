this.ptr_bestial_vigor_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.ptr_bestial_vigor";
		this.m.Name = "Bestial Vigor";
		this.m.Description = "This character has gone into a beastly rage.";
		this.m.Icon = "ui/perks/ptr_bestial_vigor.png";
		this.m.IconMini = "ptr_bestial_vigor_effect_mini";
		this.m.Overlay = "ptr_bestial_vigor_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/action_points.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Action Points"
		});

		return tooltip;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.setFatigue(actor.getFatigue() / 2);
		actor.setActionPoints(actor.getActionPoints() + 3);
	}

	function onUpdate( _properties )
	{
		_properties.ActionPoints += 3;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}
});
