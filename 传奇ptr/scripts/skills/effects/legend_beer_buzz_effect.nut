this.legend_beer_buzz_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 6
	},
	function create()
	{
		this.m.ID = "effects.legend_beer_buzz_effect";
		this.m.Name = "Buzzed";
		this.m.Icon = "skills/status_effect_61.png";
		this.m.IconMini = "status_effect_61_mini";
		this.m.Overlay = "status_effect_61";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "After guzzling beer, this character has [color=" + this.Const.UI.Color.PositiveValue + "]+3%[/color] Resolve and Hitchance, [color=" + this.Const.UI.Color.NegativeValue + "]-6%[/color] Defenses and [color=" + this.Const.UI.Color.NegativeValue + "]-12%[/color] Initiative for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turn(s).";
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3%[/color] Resolve"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3%[/color] Melee Skill"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3%[/color] Ranged Skill"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-6%[/color] Melee Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-6%[/color] Ranged Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-12%[/color] Initiative"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.BraveryMult *= 1.03;
		_properties.MeleeSkillMult *= 1.03;
		_properties.RangedSkillMult *= 1.03;
		_properties.MeleeDefenseMult *= 0.94;
		_properties.RangedDefenseMult *= 0.94;
		_properties.InitiativeMult *= 0.88;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 6;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();

		if (this.Math.rand(1, 100) <= 10 && !actor.getSkills().hasSkill("trait.drunkard"))
		{
			this.getContainer().add(this.new("scripts/skills/effects_world/hangover_effect"));
		}
		else if (this.Math.rand(1, 100) <= 5 && actor.getSkills().hasSkill("trait.drunkard"))
		{
			this.getContainer().add(this.new("scripts/skills/effects_world/hangover_effect"));
		}
	}

});

