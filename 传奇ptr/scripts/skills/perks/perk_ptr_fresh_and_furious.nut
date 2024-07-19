this.perk_ptr_fresh_and_furious <- this.inherit("scripts/skills/skill", {
	m = {
		IsUsingFreeSkill = false,
		IsSpent = true
	},
	function create()
	{
		this.m.ID = "perk.ptr_fresh_and_furious";
		this.m.Name = this.Const.Strings.PerkName.PTRFreshAndFurious;
		this.m.Description = "This character is exceptionally fast when not fatigued.";
		this.m.Icon = "ui/perks/ptr_fresh_and_furious.png";
		this.m.IconMini = "ptr_fresh_and_furious_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.IsSpent || !this.isEnabled();
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "The next skill used has its Action Point cost [color=" + this.Const.UI.Color.PositiveValue + "]halved[/color] and Fatigue Cost reduced by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Will expire upon using a skill with non-zero Action Point or Fatigue cost or when current Fatigue reaches 30% of Maximum Fatigue[/color]"
		});

		return tooltip;
	}

	function isEnabled()
	{
		return this.getContainer().getActor().getFatigue() < 0.3 * this.getContainer().getActor().getFatigueMax();
	}

	function onAfterUpdate( _properties )
	{
		if (!this.m.IsSpent && this.isEnabled())
		{
			foreach (skill in this.getContainer().getAllSkillsOfType(::Const.SkillType.Active))
			{
				// ::Math.round to round up the subtraction because we want to emulate the behavior of _properties.IsSkillUseHalfCost
				// whereby it rounds down the cost (due to integer division) after halving it.
				skill.m.ActionPointCost -= ::Math.max(0, ::Math.min(skill.m.ActionPointCost - 1, ::Math.round(skill.m.ActionPointCost / 2.0)));
				skill.m.FatigueCostMult *= 0.75;
			}
		}
	}

	function onAffordablePreview( _skill, _movementTile )
	{
		if (_skill != null && _skill.getActionPointCost() != 0 && _skill.getFatigueCost() != 0)
		{
			foreach (skill in this.getContainer().getAllSkillsOfType(::Const.SkillType.Active))
			{
				this.modifyPreviewField(skill, "ActionPointCost", 0, false);
				this.modifyPreviewField(skill, "FatigueCostMult", 1, true);
			}
		}
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.IsUsingFreeSkill = _forFree || (_skill.getActionPointCost() == 0 && _skill.getFatigueCost() == 0);
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.logInfo("111111111111111111111");
		if (!this.m.IsUsingFreeSkill) this.m.IsSpent = true;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsSpent = true;
	}
});
