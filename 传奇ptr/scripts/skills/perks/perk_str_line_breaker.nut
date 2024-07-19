this.perk_str_line_breaker <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.str_line_breaker";
		this.m.Name = this.Const.Strings.PerkName.STRLineBreaker;
		this.m.Description = this.Const.Strings.PerkDescription.STRLineBreaker;
		this.m.Icon = "ui/perks/ptr_line_breaker.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local skill = this.new("scripts/skills/actives/line_breaker");
		skill.m.SoundOnUse = [
			"sounds/combat/indomitable_01.wav",
			"sounds/combat/indomitable_02.wav"
		];
		skill.m.Icon = "skills/ptr_line_breaker_skill.png";
		skill.m.IconDisabled = "skills/ptr_line_breaker_skill_bw.png";
		skill.m.Overlay = "ptr_line_breaker_skill";
		skill.m.Order = this.Const.SkillOrder.Any;
		skill.m.FatigueCost = 25;
		skill.m.Description = "Use your shield to push through the ranks of your enemies, knocking back a target and taking their place, all in one action."
		skill.isUsable <- function()
		{
			local actor = this.getContainer().getActor();
			return this.skill.isUsable() && actor.isArmedWithShield() && !actor.getCurrentProperties().IsRooted && !actor.getCurrentProperties().IsStunned;
		}
		skill.getTooltip <- function()
		{
			local tooltip = this.skill.getDefaultUtilityTooltip();
			local actor = this.getContainer().getActor();

			if (!actor.isArmedWithShield())
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "Requires shield"
				});
			}

			if (!actor.getCurrentProperties().IsRooted || actor.getCurrentProperties().IsStunned)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "Cannot be used while Rooted or Stunned"
				});
			}

			return tooltip;
		}

		this.getContainer().add(skill);

		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		local agent = actor.getAIAgent();

		if (agent.findBehavior(this.Const.AI.Behavior.ID.LineBreaker) == null)
		{
			agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_line_breaker"));
			agent.finalizeBehaviors();
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.line_breaker");
	}
});
