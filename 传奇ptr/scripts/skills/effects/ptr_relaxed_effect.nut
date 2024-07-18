this.ptr_relaxed_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "effects.ptr_relaxed";
		this.m.Name = "Relaxed";
		this.m.Icon = "ui/perks/relax_circle.png";
		//this.m.IconMini = "ptr_entrenched_effect_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return this.m.IsSpent ? "This character was soothed by an ally and gained increased Fatigue Recovery for this turn, but cannot be soothed again this turn." : "This character has been soothed by an ally, gaining increased Fatigue Recovery for their next turn.";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		if (!this.m.IsSpent)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 100 + "%[/color] Fatigue Recovery"
			});
		}

		return tooltip;
	}

	function onUpdate( _properties )
	{
		_properties.FatigueRecoveryRateMult *= 2.0;
	}

	function onTurnStart()
	{
		this.m.IsSpent = true;
	}

	function onTurnEnd()
	{
		if (this.m.IsSpent)
		{
			this.removeSelf();
		}
	}
});
