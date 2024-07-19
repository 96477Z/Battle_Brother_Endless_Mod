this.ptr_bolstered_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 0,
		AllyMeleeSkillFactor = 0.05,
		IsCombatStarted = false
	},
	function create()
	{
		this.m.ID = "effects.ptr_bolstered";
		this.m.Name = "Bolstered";
		this.m.Description = "This character is feeling braver thanks to an adjacent Polearm-wielding ally\'s support.";
		this.m.Icon = "ui/perks/ptr_bolster.png";
		this.m.IconMini = "ptr_bolstered_effect_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsStacking = false;
	}

	function getTooltip()
	{
		return [
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
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.Bonus + "[/color] Resolve"
			}
		];
	}

	function isHidden()
	{
		return this.m.Bonus == 0 || this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Ignore || this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Fleeing;
	}

	function onUpdate( _properties )
	{
		this.m.Bonus = 0;

		if (this.m.IsCombatStarted == false)
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap() || !actor.isArmedWithMeleeWeapon() || actor.getMoraleState() == this.Const.MoraleState.Ignore || actor.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return;
		}

		local allyMeleeSkill = 0;
		if (::Tactical.isActive())
		{
			local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 1);
			foreach (ally in adjacentAllies)
			{
				if (!ally.hasZoneOfControl() || ally.getID() == actor.getID())
				{
					continue;
				}

				local allyPerk = ally.getSkills().getSkillByID("perk.ptr_bolster");
				if (allyPerk != null && allyPerk.isInEffect())
				{
					allyMeleeSkill = this.Math.max(allyMeleeSkill, ally.getCurrentProperties().getMeleeSkill());
				}
			}
		}

		if (allyMeleeSkill > 0)
		{
			this.m.Bonus = this.Math.floor(allyMeleeSkill * this.m.AllyMeleeSkillFactor);
			_properties.Bravery += this.m.Bonus;
		}
	}

	function onCombatStarted()
	{
		this.m.IsCombatStarted = true;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsCombatStarted = false;
	}
});
