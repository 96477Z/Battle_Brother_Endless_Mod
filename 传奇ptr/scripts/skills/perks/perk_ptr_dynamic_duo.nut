this.perk_ptr_dynamic_duo <- this.inherit("scripts/skills/skill", {
	m = {
		AOE = 2,
		MaxAllowedAllyDistance = 2,
		AllyDynamicDuoMultiplier = 2,
		ResolveBonus = 10,
		InitiativeBonus = 10,
		MeleeDefenseBonus = 5,
		HitChanceBonus = 10,
		AllyID = 0,
		AllyDistance = 0,
		IsAllyDynamicDuo = false,
		RotationSkill = null,
		IsRotationAdded = false,
		IsRotationUsedThisTurn = false,
		Opponents = []
	},
	function create()
	{
		this.m.ID = "perk.ptr_dynamic_duo";
		this.m.Name = this.Const.Strings.PerkName.PTRDynamicDuo;
		this.m.Description = this.Const.Strings.PerkDescription.PTRDynamicDuo;
		this.m.Icon = "ui/perks/ptr_dynamic_duo.png";
		this.m.IconMini = "ptr_dynamic_duo_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.BeforeLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getDescription()
	{
		local ret = "Instead of fighting in a large formation, this character has trained to fight as a duo and gains bonuses while there is only one nearby ally."
		if (this.m.IsAllyDynamicDuo)
		{
			ret += " As, " + this.Tactical.getEntityByID(this.m.AllyID).getName() + " also has this perk, the bonuses are increased.";
		}

		return ret;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getResolveBonus() + "[/color] Resolve"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getInitiativeBonus() + "[/color] Initiative"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getMeleeDefenseBonus() + "%[/color] Melee Defense"
		});

		if (!this.m.IsRotationUsedThisTurn)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The first use of the Rotation skill this turn has its Fatigue Cost cost halved" + (this.m.IsAllyDynamicDuo ? " and costs no Action Points" : "")
			});
		}

		if (this.m.Opponents.len() > 0)
		{
			local t = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.HitChanceBonus + "%[/color] Chance to Hit against: "

			foreach (opponentID in this.m.Opponents)
			{
				local e = this.Tactical.getEntityByID(opponentID);
				if (e != null && e.isAlive())
				{
					t += e.getName() + ", "
				}
			}

			t = t.slice(0, -2);

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = t
			});
		}

		return tooltip;
	}

	function onGetHitFactors( _skill, _targetTile, _tooltip )
	{	
		local targetEntity = _targetTile.getEntity();
		if (targetEntity != null && this.hasOpponent(targetEntity.getID()))
		{
			_tooltip.push({
				icon = "ui/tooltips/positive.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.HitChanceBonus + "%[/color] " + this.getName()
			});
		}
	}

	function addOpponent(_entityID)
	{
		if (this.m.Opponents.find(_entityID) == null)
		{
			this.m.Opponents.push(_entityID);
		}
	}

	function removeOpponent(_entityID)
	{
		local idx = this.m.Opponents.find(_entityID);
		if (idx != null)
		{
			this.m.Opponents.remove(idx);
		}
	}

	function hasOpponent(_entityID)
	{
		return this.m.Opponents.find(_entityID) != null;
	}

	function getResolveBonus()
	{
		return this.m.ResolveBonus * (this.m.IsAllyDynamicDuo ? this.m.AllyDynamicDuoMultiplier : 1);
	}

	function getInitiativeBonus()
	{
		return this.m.InitiativeBonus * (this.m.IsAllyDynamicDuo ? this.m.AllyDynamicDuoMultiplier : 1);
	}

	function getMeleeDefenseBonus()
	{
		return this.m.MeleeDefenseBonus * (this.m.IsAllyDynamicDuo ? this.m.AllyDynamicDuoMultiplier : 1);
	}

	function getAllyIfOnlyOneWithinAOE(_actor)
	{
		local ret = {
			Actor = null,
			Distance = 0
		};

		local myTile = _actor.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(_actor.getFaction());

		local count = 0;

		local ally = null;
		local allyDistance = 0;

		foreach( a in allies )
		{
			if (a.getID() == _actor.getID() || !a.isPlacedOnMap())
			{
				continue;
			}

			local distance = a.getTile().getDistanceTo(myTile);
			if (distance <= this.m.AOE)
			{
				count++;
				if (count > 1)
				{
					return ret;
				}

				if (distance <= this.m.MaxAllowedAllyDistance)
				{
					ally = a;
					allyDistance = distance;
				}
			}
		}

		if (count == 1 && allyDistance <= this.m.MaxAllowedAllyDistance)
		{
			ret.Actor = ally;
			ret.Distance = allyDistance;
		}

		return ret;
	}

	function updateSituation()
	{
		this.m.AllyID = 0;
		this.m.AllyDistance = 0;
		this.m.IsAllyDynamicDuo = false;

		local actor = this.getContainer().getActor();
		local ally = this.getAllyIfOnlyOneWithinAOE(actor);
		if (ally.Actor == null)
		{
			return false;
		}

		local a = this.getAllyIfOnlyOneWithinAOE(ally.Actor);
		if (a.Actor == null || a.Actor.getID() != actor.getID())
		{
			return false;			
		}

		if (ally.Actor.getSkills().hasSkill("perk.ptr_dynamic_duo"))
		{
			this.m.IsAllyDynamicDuo = true;
		}
		
		this.m.AllyID = ally.Actor.getID();
		this.m.AllyDistance = ally.Distance;

		return true;
	}

	function isEnabled()
	{
		local actor = this.getContainer().getActor();		
		return actor.isPlacedOnMap() && this.updateSituation();
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = true;

		if (!isEnabled())
		{
			return;
		}

		this.m.IsHidden = false;

		_properties.Bravery += this.getResolveBonus();
		_properties.Initiative += this.getInitiativeBonus();
		_properties.MeleeDefenseMult *= 1.0 + this.getMeleeDefenseBonus() * 0.01;

	}

	function addRotationIfApplicable()
	{
		if (!this.isEnabled())
		{
			if (this.m.RotationSkill != null && this.m.IsRotationAdded)
			{
				this.m.RotationSkill.removeSelf();
			}

			this.m.RotationSkill = null;

			return;
		}


		this.m.RotationSkill = this.getContainer().getSkillByID("actives.rotation");
		if (this.m.RotationSkill == null)
		{
			local rotation = this.new("scripts/skills/actives/rotation");
			this.getContainer().add(rotation);
			rotation.saveBaseValues();
			this.m.RotationSkill = rotation;
			this.m.IsRotationAdded = true;
		}
	}

	function onMovementFinished(_tile)
	{
		this.addRotationIfApplicable();
	}

	function onAfterUpdate(_properties)
	{
		if (this.m.RotationSkill != null && !this.m.IsRotationUsedThisTurn)
		{
			this.m.RotationSkill.m.FatigueCostMult *= 0.5;

			if (this.m.IsAllyDynamicDuo)
			{
				this.m.RotationSkill.m.ActionPointCost = 0;
			}
		}
	}

	function addOpponentToAlly( _attacker, _skill )
	{
		if (this.m.IsHidden || _skill == null || _skill.isRanged() || _attacker.isAlliedWith(this.getContainer().getActor()) || this.m.AllyID == 0 || !this.m.IsAllyDynamicDuo)
		{
			return;
		}

		local ally = this.Tactical.getEntityByID(this.m.AllyID);
		if (ally != null && ally.isAlive())
		{
			local allyPerk = ally.getSkills().getSkillByID("perk.ptr_dynamic_duo");
			if (allyPerk != null)
			{
				allyPerk.addOpponent(_attacker.getID());
			}
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		this.addOpponentToAlly(_attacker, _skill);
	}

	function onMissed( _attacker, _skill )
	{
		this.addOpponentToAlly(_attacker, _skill);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.m.IsHidden || _targetEntity == null || !_skill.isAttack())
		{
			return;
		}

		if (this.hasOpponent(_targetEntity.getID()) != null)
		{
			_properties.MeleeSkill += this.m.HitChanceBonus;
		}
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill.getID() == "actives.rotation")
		{
			this.m.IsRotationUsedThisTurn = true;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_skill.isAttack() || _skill.isRanged())
		{
			return;
		}

		this.removeOpponent(_targetEntity.getID());
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (!_skill.isAttack() || _skill.isRanged())
		{
			return;
		}

		this.removeOpponent(_targetEntity.getID());
	}

	function onTurnEnd()
	{
		this.m.Opponents.clear();
	}

	function onTurnStart()
	{
		this.m.IsRotationUsedThisTurn = false;
		this.addRotationIfApplicable();
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.Opponents.clear();
		this.m.IsRotationUsedThisTurn = false;
	}
});
