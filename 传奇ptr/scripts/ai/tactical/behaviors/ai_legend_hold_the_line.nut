this.ai_legend_hold_the_line <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.legend_hold_the_line"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.LegendHoldTheLine;
		this.m.Order = this.Const.AI.Behavior.Order.LegendHoldTheLine;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;
		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);
		local myTile = _entity.getTile();
		local allies = this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction());		
		local enemies = this.Tactical.Entities.getHostileActors(_entity.getFaction());
		local useScore = 0.0;
		local numTargets = 0;

		local relevantAllies = [];		

		foreach( enemy in enemies )
		{
			if (!enemy.hasZoneOfControl())
			{
				continue;
			}
			
			local bestTarget = this.queryBestMeleeTarget(enemy, null, allies).Target;			
			if (bestTarget == null || bestTarget.getMoraleState() == this.Const.MoraleState.Fleeing || bestTarget.getTile().getDistanceTo(myTile) > 4 || bestTarget.getSkills().hasSkill("effects.legend_holding_the_line"))
			{
				continue;
			}

			local enemyAttack = enemy.getSkills().getAttackOfOpportunity();
			if (!enemyAttack.onVerifyTarget(enemy.getTile(), bestTarget.getTile()) || !enemyAttack.isInRange(bestTarget.getTile(), enemy.getTile()))
			{
				continue;
			}

			local hitChance = enemyAttack.getHitchance(bestTarget);

			if (hitChance < 40 || hitChance > 90)
			{
				continue;
			}

			if (relevantAllies.find(bestTarget.getID()) == null) 
			{
				relevantAllies.push(bestTarget.getID());
			}
			
			useScore = useScore + hitChance - 40;
		}

		if (relevantAllies.len() < 5)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * (useScore * 0.01);
		return this.Const.AI.Behavior.Score.LegendHoldTheLine * score;
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
