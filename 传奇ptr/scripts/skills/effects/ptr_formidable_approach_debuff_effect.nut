this.ptr_formidable_approach_debuff_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		CurrentEnemies = [],
		CurrentMalus = 0,
		MalusFactor = 0.1
	},
	function create()
	{
		this.m.ID = "effects.ptr_formidable_approach_debuff";
		this.m.Name = "Formidable Approach";
		this.m.Description = "This character has entered the zone of control of a formidable opponent. Melee Skill and Melee Defense will be reduced until exiting this zone of control or successfully hitting the opponent.";
		this.m.Icon = "ui/perks/ptr_formidable_approach.png";
		this.m.IconMini = "ptr_formidable_approach_debuff_effect_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function addEnemy( _entityID )
	{
		if (this.m.CurrentEnemies.find(_entityID) == null)
		{
			this.m.CurrentEnemies.push(_entityID);
		}
	}

	function removeEnemy( _entityID )
	{
		local idx = this.m.CurrentEnemies.find(_entityID);
		if (idx != null)
		{
			this.m.CurrentEnemies.remove(idx);
			return true;
		}
		
		return false;
	}

	function hasEnemy( _entityID )
	{
		return this.m.CurrentEnemies.find(_entityID) != null;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.extend([
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.CurrentMalus + "[/color] Melee Skill"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.CurrentMalus + "[/color] Melee Defense"
			}
		]);
		
		return tooltip;
	}

	function isHidden()
	{
		return this.m.CurrentMalus == 0;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local perk = this.getContainer().getSkillByID("perk.ptr_formidable_approach");

		if (perk != null && perk.isEnabled())
		{
			return false;
		}

		return true;
	}

	function getCurrentMalus()
	{
		this.pruneEnemies();

		if (this.m.CurrentEnemies.len() == 0 || !this.isEnabled())
		{
			return 0;
		}

		local meleeSkill = 0;
		foreach (id in this.m.CurrentEnemies)
		{
			local enemy = this.Tactical.getEntityByID(id);
			if (enemy != null)
			{
				meleeSkill = this.Math.max(meleeSkill, enemy.getCurrentProperties().getMeleeSkill());
			}
		}

		local malusfactor = this.getContainer().getActor().isArmedWithTwoHandedWeapon() ? this.m.MalusFactor / 2 : this.m.MalusFactor;

		return meleeSkill * malusfactor;
	}

	function updateMalus()
	{
		this.m.CurrentMalus = this.Math.floor(this.getCurrentMalus());
	}
	
	function onMovementFinished( _tile )
	{
		if (this.isEnabled())
		{
			this.updateEnemies();
			this.updateMalus();
		}			
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkill -= this.m.CurrentMalus;
		_properties.MeleeDefense -= this.m.CurrentMalus;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.removeEnemy(_targetEntity.getID()))
		{
			this.updateMalus();
		}
	}

	function updateEnemies()
	{
		this.pruneEnemies();
		
		local actor = this.getContainer().getActor();
		local adjacentEnemies = ::Tactical.Entities.getHostileActors(actor.getFaction(), actor.getTile(), 1);
		foreach (enemy in adjacentEnemies)
		{
			if (!enemy.hasZoneOfControl() || this.hasEnemy(enemy.getID()))
			{
				continue;
			}

			local enemyPerk = enemy.getSkills().getSkillByID("perk.ptr_formidable_approach");
			if (enemyPerk != null && enemyPerk.isEnabled())
			{
				this.addEnemy(enemy.getID());
			}
		}
	}
	
	function pruneEnemies()
	{
		local pruned = false;
		
		for (local i = this.m.CurrentEnemies.len() - 1; i >= 0; i--)
		{
			local enemy = this.Tactical.getEntityByID(this.m.CurrentEnemies[i]);
			if (enemy == null)
			{
				continue;
			}
			
			if (!enemy.isAlive() || !enemy.hasZoneOfControl() || enemy.getTile().getDistanceTo(this.getContainer().getActor().getTile()) > 1)
			{
				this.m.CurrentEnemies.remove(i);
				pruned = true;
			}
		}
		
		return pruned;
	}

	function onTurnStart()
	{
		if (this.pruneEnemies())
		{
			this.updateMalus();
		}
	}

	function onResumeTurn()
	{		
		if (this.pruneEnemies())
		{
			this.updateMalus();
		}
	}

	function onCombatStarted()
	{
		this.m.CurrentEnemies.clear();
		this.m.CurrentMalus = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.CurrentEnemies.clear();
		this.m.CurrentMalus = 0;
	}
});
