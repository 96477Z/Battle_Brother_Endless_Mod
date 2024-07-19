this.ai_ptr_blitzkrieg <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		Skill = null,
		PossibleSkills = [
			"actives.ptr_blitzkrieg"
		],
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.PTRBlitzkrieg;
		this.m.Order = this.Const.AI.Behavior.Order.PTRBlitzkrieg;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}
		
		local enemies = this.Tactical.Entities.getHostileActors(_entity.getFaction());
		foreach (enemy in enemies)
		{
			local blitzkrieg = enemy.getSkills().getSkillByID("actives.ptr_blitzkrieg");
			if (blitzkrieg != null && blitzkrieg.m.IsSpent && enemy.getSkills().hasSkill("effects.adrenaline"))
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
		}

		local allies = this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction());
		local myTile = _entity.getTile();
		local useScore = 0.0;
		local numTargets = 0;
		local score = this.getProperties().BehaviorMult[this.m.ID] * this.getFatigueScoreMult(this.m.Skill);

		local getPredictedInitiatve = function( _actor )
		{
			local ret = _actor.getInitiative();
			if (!_actor.isTurnStarted() && !_actor.isTurnDone())
			{
				local aoo = _actor.getSkills().getAttackOfOpportunity();
				if (aoo != null)
				{
					local predictedFatigueBuilt = aoo.getFatigueCost() * this.Math.floor(_actor.getActionPointsMax() / aoo.getActionPointCost());
					ret -= predictedFatigueBuilt * _actor.getCurrentProperties().FatigueToInitiativeRate;					
				}
			}

			return (ret + _actor.getCurrentProperties().InitiativeForTurnOrderAdditional) * _actor.getCurrentProperties().InitiativeForTurnOrderMult;
		}

		foreach( ally in allies )
		{
			if (ally.getID() == _entity.getID())
			{
				continue;
			}

			local allyTile = ally.getTile();

			if (allyTile.getDistanceTo(myTile) > 4 || ally.getCurrentProperties().IsStunned || ally.getMoraleState() == this.Const.MoraleState.Fleeing || ally.getSkills().hasSkill("effects.adrenaline"))
			{
				continue;
			}

			local numFasterEnemies = 0;

			foreach (enemy in enemies)
			{
				if ((enemy.getFaction() == this.Const.Faction.Player || enemy.getMainhandItem() != null) && enemy.getTile().getDistanceTo(allyTile) <= 2 && !enemy.getCurrentProperties().IsStunned && enemy.getMoraleState() != this.Const.MoraleState.Fleeing && getPredictedInitiatve(enemy) > getPredictedInitiatve(ally))
				{
					numFasterEnemies++;
				}
			}

			if (numFasterEnemies > 0)
			{
				numTargets++;
				useScore += numFasterEnemies;
			}
		}

		if (numTargets < 4 && (1.0 * numTargets) / allies.len() < 0.75)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * (useScore * 0.1);
		return this.Const.AI.Behavior.Score.PTRBlitzkrieg * score;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(_entity.getTile());
			this.m.IsFirstExecuted = false;
			return false;
		}

		this.m.Skill.use(_entity.getTile());

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
			this.getAgent().declareEvaluationDelay(1500);
		}

		this.m.Skill = null;
		return true;
	}
});
