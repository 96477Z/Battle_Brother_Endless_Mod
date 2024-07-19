this.ptr_bestial_vigor_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false	
	},
	function create()
	{
		this.m.ID = "actives.ptr_bestial_vigor";
		this.m.Name = "Bestial Vigor";
		this.m.Description = "Unleash your beastly vigor to shake off the effects of Fatigue and push your body beyond limits!";
		this.m.Icon = "skills/ptr_bestial_vigor_skill.png";
		this.m.IconDisabled = "skills/ptr_bestial_vigor_skill_bw.png";
		this.m.Overlay = "ptr_bestial_vigor_skill";
		this.m.SoundOnUse = [
			"sounds/enemies/orc_linebreaker_01.wav",
			"sounds/enemies/orc_linebreaker_02.wav",
			"sounds/enemies/orc_linebreaker_03.wav",
			"sounds/enemies/orc_linebreaker_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();

		tooltip.extend([
			{
				id = 10,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Current Fatigue is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Action Points for this turn"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is only usable [color=" + this.Const.UI.Color.NegativeValue + "]once[/color] per combat"
			},
		]);

		return tooltip;
	}

	function isUsable()
	{
		return !this.m.IsSpent && this.skill.isUsable();
	}

	function onUse( _user, _targetTile )
	{
		this.m.IsSpent = true;		
		_user.getSkills().add(this.new("scripts/skills/effects/ptr_bestial_vigor_effect"));
		return true;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsSpent = false;
	}
});
