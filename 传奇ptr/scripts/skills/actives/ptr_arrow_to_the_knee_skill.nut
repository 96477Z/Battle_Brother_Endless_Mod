this.ptr_arrow_to_the_knee_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.ptr_arrow_to_the_knee";
		this.m.Name = "Arrow to the Knee";
		this.m.Icon = "skills/ptr_arrow_to_the_knee_skill.png";
		this.m.IconDisabled = "skills/ptr_arrow_to_the_knee_skill_bw.png";
		this.m.Overlay = "ptr_arrow_to_the_knee_skill";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getDescription()
	{
		return "Aim your next ranged attacks during this turn at the knees of your targets, making it harder to aim and dealing reduced damage but reducing the your targets' Melee and Ranged defense and causing them to spend additional Action Points per tile moved.";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();

		tooltip.extend([
			{
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]50%[/color] reduced Ranged Damage"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Ranged Skill"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.NegativeValue + "]0%[/color] chance to hit the head"
			},			
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Target will have [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Melee and Ranged defense for 1 turn and [color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] in the turn after that"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Target will require [color=" + this.Const.UI.Color.NegativeValue + "]2[/color] additional Action Points per tile moved for 1 turn and [color=" + this.Const.UI.Color.NegativeValue + "]1[/color] in the turn after that"
			}
		]);		

		if (this.getContainer().getActor().isEngagedInMelee())
		{
			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "Not usable when engaged in melee"
			});
		}

		return tooltip;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		local agent = actor.getAIAgent();

		if (agent.findBehavior(this.Const.AI.Behavior.ID.PTRArrowToTheKnee) == null)
		{
			agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_ptr_arrow_to_the_knee"));
			agent.finalizeBehaviors();
		}
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();
		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.ptr_arrow_to_the_knee_attack") && !actor.isEngagedInMelee();
	}

	function isHidden()
	{
		return !this.getContainer().getActor().isArmedWithRangedWeapon();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Container.add(this.new("scripts/skills/effects/ptr_arrow_to_the_knee_attack_effect"));
		return true;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.ptr_arrow_to_the_knee_attack");
	}
});
