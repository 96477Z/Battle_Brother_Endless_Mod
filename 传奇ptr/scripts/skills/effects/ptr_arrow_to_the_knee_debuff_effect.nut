this.ptr_arrow_to_the_knee_debuff_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2
		DefMalusPercentagePerTurnLeft = 5,
		MovementAPCostAdditionalPerTurnLeft = 1
	},
	function create()
	{
		this.m.ID = "effects.ptr_arrow_to_the_knee_debuff";
		this.m.Name = "Took an Arrow to the Knee";		
		this.m.Description = "%name% used to move around freely like you, but then %they% took arrow to the knee.";
		this.m.Icon = "ui/perks/ptr_arrow_to_the_knee.png";
		this.m.IconMini = "ptr_arrow_to_the_knee_debuff_effect_mini";
		this.m.Overlay = "ptr_arrow_to_the_knee_debuff_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		local defenseMalus = this.m.TurnsLeft * this.m.DefMalusPercentagePerTurnLeft;
		local APMalus = this.m.TurnsLeft * this.m.MovementAPCostAdditionalPerTurnLeft;
		tooltip.extend(
			[
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + defenseMalus + "%[/color] Melee Defense"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + defenseMalus + "%[/color] Ranged Defense"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/action_points.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + APMalus + "[/color] additional Action Points per tile moved"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/action_points.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turns remaining. This effect will reduce in intensity with fewer turns remaining."
				}
			]
		);

		return tooltip;
	}

	function onRefresh()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefenseMult *= 1.0 - this.m.TurnsLeft * this.m.DefMalusPercentagePerTurnLeft * 0.01;
		_properties.RangedDefenseMult *= 1.0 - this.m.TurnsLeft * this.m.DefMalusPercentagePerTurnLeft * 0.01;
		_properties.MovementAPCostAdditional += this.m.TurnsLeft * this.m.MovementAPCostAdditionalPerTurnLeft;
	}

	function onTurnEnd()
	{
		this.m.TurnsLeft -= 1;
		if (this.m.TurnsLeft == 0)
		{
			this.removeSelf();
		}
	}
});
