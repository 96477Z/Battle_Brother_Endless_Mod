this.str_covering_ally_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Ally = null,
		IsAlive = true,
		SelfSkillMalusPercentage = 25,
		SelfDefenseMalusPercentage = 25
	},
	function setAlly( _p )
	{
		if (typeof _p == "instance")
		{
			this.m.Ally = _p;
		}
		else
		{
			this.m.Ally = this.WeakTableRef(_p);
		}
	}

	function create()
	{
		this.m.ID = "effects.str_covering_ally";
		this.m.Name = "Covering an Ally";
		this.m.Description = "This character is using their shield to help an ally move ignoring Zone of Control. This takes up significant effort, reducing %their% combat effectiveness."
		this.m.Icon = "ui/perks/ptr_cover_ally.png";
		this.m.IconMini = "ptr_covering_ally_effect_mini";
		this.m.Overlay = "ptr_covering_ally_effect";
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
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfDefenseMalusPercentage + "%[/color] Melee Defense"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfDefenseMalusPercentage + "%[/color] Ranged Defense"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfSkillMalusPercentage + "%[/color] Melee Skill"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfSkillMalusPercentage + "%[/color] Ranged Skill"
		});

		return tooltip;
	}

	function onUpdate( _properties )
	{
		if (this.m.Ally == null || this.m.Ally.isNull() || !this.m.Ally.isPlacedOnMap() || this.m.Ally.getFlags().get("Devoured") == true)
		{
			this.removeSelf(); 
			return;
		}

		local actor = this.getContainer().getActor();
		if (actor.m.IsMoving)
		{
			this.removeSelf();
		}

		local isCoverStillValid = true;
		if (actor.getCurrentProperties().IsRooted || actor.getCurrentProperties().IsStunned || actor.getFlags().get("Devoured") == true || !actor.isArmedWithShield())
		{
			isCoverStillValid = false;
		}

		if (actor.getTile().getDistanceTo(this.m.Ally.getTile()) > 1)
		{
			isCoverStillValid = false;
		}

		if (!isCoverStillValid)
		{
			if (!this.getContainer().getActor().isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " is no longer providing cover to " + this.Const.UI.getColorizedEntityName(this.m.Ally));
			}
			this.removeSelf();
			this.onRemoved();
			return;
		}
		local skillMalus = this.m.SelfSkillMalusPercentage * 0.01;
		local defMalus = this.m.SelfDefenseMalusPercentage * 0.01;
		_properties.MeleeDefenseMult *= 1.0 - defMalus;
		_properties.RangedDefenseMult *= 1.0 - defMalus;
		_properties.MeleeSkillMult *= 1.0 - skillMalus;
		_properties.RangedSkillMult *= 1.0 - skillMalus;
	}

	function onDeath( _fatalityType )
	{
		this.onRemoved();
	}

	function onTurnStart()
	{
		this.removeSelf();
		this.onRemoved();
	}

	function onRemoved()
	{
		this.m.IsHidden = true;
		if (this.m.Ally != null && !this.m.Ally.isNull() && this.m.Ally.isAlive())
		{
			local skill = this.m.Ally.getSkills().getSkillByID("effects.str_covered_by_ally");

			if (skill != null)
			{
				skill.setCoverProvider(null);
				this.m.Ally.getSkills().remove(skill);
			}
		}
	}

});
