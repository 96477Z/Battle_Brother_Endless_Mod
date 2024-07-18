this.ptr_inspired_by_champion_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Difference = 0
	},
	function create()
	{
		this.m.ID = "effects.ptr_inspired_by_champion";
		this.m.Name = "Inspired by nearby Champion";
		this.m.Description = "With a champion nearby, this character has temporarily increased Resolve.";
		this.m.Icon = "ui/perks/perk_26.png";
		this.m.IconMini = "perk_26_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.push(
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.Difference + "[/color] Resolve"
			}
		);

		return tooltip;		
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return 0;
		}

		local myTile = actor.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
		local bestBravery = 0;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
			{
				continue;
			}

			if (ally.getTile().getDistanceTo(myTile) > 5)
			{
				continue;
			}

			if (this.getContainer().getActor().getBravery() >= ally.getBravery())
			{
				continue;
			}

			if (ally.getSkills().hasSkill("racial.champion"))
			{
				if (ally.getBravery() > bestBravery)
				{
					bestBravery = ally.getBravery();
				}
			}
		}

		if (bestBravery != 0)
		{
			bestBravery = this.Math.min(bestBravery * 0.15, bestBravery - this.getContainer().getActor().getBravery());
		}

		return bestBravery;
	}

	function onAfterUpdate( _properties )
	{
		local bonus = this.getBonus();

		if (bonus != 0)
		{
			this.m.IsHidden = false;
			_properties.Bravery += bonus;
			this.m.Difference = bonus;
		}
		else
		{
			this.m.IsHidden = true;
			this.m.Difference = 0;
		}
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsHidden = true;
		this.m.Difference = 0;
	}

});

