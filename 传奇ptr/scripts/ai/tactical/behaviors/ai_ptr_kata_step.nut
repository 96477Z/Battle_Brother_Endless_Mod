this.ai_ptr_kata_step <- this.inherit("scripts/ai/tactical/behavior", {
	m = {		
		TargetTile = null,
		TargetActor = null,
		PossibleSkills = [
			"actives.ptr_kata_step"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.PTRKataStep;
		this.m.Order = this.Const.AI.Behavior.Order.PTRKataStep;
		// this.m.IsThreaded = true;		
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		this.m.TargetActor = null;
		this.m.Skill = null;
		local time = this.Time.getExactTime();

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

		local attackSkill = _entity.getSkills().getAttackOfOpportunity();

		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange() + 1, this.m.Skill.getMaxLevelDifference());
		if (targets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local score = this.getProperties().BehaviorMult[this.m.ID];
		score *= this.getFatigueScoreMult(this.m.Skill);

		local myTile = _entity.getTile();		
		local knownAllies = this.getAgent().getKnownAllies();
		local lungeSkill = _entity.getSkills().getSkillByID("actives.lunge");
		local canEngarde = false;
		local engarde = _entity.getSkills().getSkillByID("perk.ptr_en_garde");
		if (engarde != null && engarde.pickSkill() != null)
		{
			canEngarde = true;
		}

		local evaluateTarget = function( _target, _startingTile )
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("Evaluating target " + _target.getName() + " considering starting tile to be " + _startingTile.ID);
			}			
			local ret = [];
			local targetTile = _target.getTile();
			local isTargetInEnemyZoneOfControl = targetTile.hasZoneOfControlOtherThan(_target.getAlliedFactions());
			local isTargetArmedWithRangedWeapon = !isTargetInEnemyZoneOfControl && this.isRangedUnit(_target);
			local isTargetFleeing = _target.getMoraleState() == this.Const.MoraleState.Fleeing;
			local engagementsDeclared = (_target.getAIAgent().getEngagementsDeclared(_entity) + _target.getTile().getZoneOfControlCount(_entity.getFaction()) * 2) * this.Const.AI.Behavior.EngageAlreadyEngagedPenaltyMult * this.getProperties().EngageTargetAlreadyBeingEngagedMult;
			local letOthersGoScore = 0.0;
			local lockDownValue = 1.0;

			local targetValue = this.getProperties().IgnoreTargetValueOnEngage ? 0.5 : this.queryTargetValue(_entity, _target);

			if (lungeSkill != null && lungeSkill.onVerifyTarget(_startingTile, targetTile) && lungeSkill.isInRange(targetTile, _startingTile))
			{
				local lungeValue = this.getProperties().IgnoreTargetValueOnEngage ? 0.5 : this.queryTargetValue(_entity, _target, lungeSkill);				
				if (lungeValue > targetValue)
				{
					if (this.Const.AI.VerboseMode)
					{
						this.logInfo("Better to engage " + _target.getName() + " with Lunge. Lunge Value: " + lungeValue + " vs Target Value: " + targetValue);
					}
					if (_startingTile.isSameTileAs(myTile))
					{
						return ret;
					}
					else 
					{
						ret.push({
							Tile = _target.getTile(),
							Actor = _target,
							TargetValue = lungeValue,
							TileScore = 50,
							ScoreMult = 2
						});

						return ret;
					}
				}
			}

			local potentialTiles = [];
			if (_startingTile.isSameTileAs(myTile) && targetTile.getDistanceTo(_startingTile) == 1)
			{
				potentialTiles.push(_startingTile);
			}

			// These are for AI VerboseMode
			local tilesToEvaluate = [];
			local ignoredTiles = [];

			for (local i = 0; i < 6; i++)
			{
				if (targetTile.hasNextTile(i))
				{
					local nextTile = targetTile.getNextTile(i);	
				
					if (nextTile.IsEmpty && this.m.Skill.onVerifyTarget(_startingTile, nextTile) && this.m.Skill.isInRange(nextTile, _startingTile))
					{
						potentialTiles.push(nextTile);
						if (this.Const.AI.VerboseMode)
						{
							tilesToEvaluate.push(nextTile);
						}
					}
					else if (this.Const.AI.VerboseMode)
					{
						ignoredTiles.push(nextTile);
					}
				}
			}

			if (::Const.AI.VerboseMode)
			{
				local text = tilesToEvaluate.len() > 0 ? "Tiles to evaluate: " : "Tiles to evaluate: None  ";
				foreach (tile in tilesToEvaluate)
				{
					text += tile.ID + ", ";
				}
				::logInfo(text.slice(0, -2));
				if (ignoredTiles.len() != 0)
				{
					local text = "Ignored Tiles: ";
					foreach (tile in ignoredTiles)
					{
						text += tile.ID + ", ";
					}
					::logInfo(text.slice(0, -2));
					ignoredTiles.clear();
				}
			}

			if (potentialTiles.len() == 0 || (potentialTiles.len() == 1 && potentialTiles[0].isSameTileAs(myTile)))
			{
				return ret;
			}

			foreach (tile in potentialTiles)
			{
				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("Evaluating tile " + tile.ID + " for Kata use against target " + _target.getName());
				}

				if (tile == null)
				{
					continue;
				}

				if (attackSkill == null || !attackSkill.onVerifyTarget(tile, targetTile) || !attackSkill.isInRange(targetTile, tile))
				{
					if (this.Const.AI.VerboseMode)
					{
						ignoredTiles.push(tile);
					}
					continue;
				}

				if (targetTile.getZoneOfControlCount(_entity.getFaction()) == 0 && !isTargetArmedWithRangedWeapon && !isTargetFleeing && engagementsDeclared == 0)
				{
					foreach( ally in knownAllies )
					{
						if (ally.getCurrentProperties().TargetAttractionMult <= 1.0 && !this.isRangedUnit(ally))
						{
							continue;
						}

						local d = this.queryActorTurnsNearTarget(_target, ally.getTile(), _target);

						if (d.Turns <= 1.0)
						{
							lockDownValue = lockDownValue * (this.Const.AI.Behavior.EngageMeleeProtectPriorityTargetMult * this.getProperties().EngageLockDownTargetMult);
						}
					}
				}

				if (this.getProperties().IgnoreTargetValueOnEngage)
				{
					letOthersGoScore = letOthersGoScore + this.Math.abs(_startingTile.SquareCoords.Y - targetTile.SquareCoords.Y) * 20.0;
					local myDistanceToTarget = _startingTile.getDistanceTo(targetTile);
					local targets = this.getAgent().getKnownAllies();

					foreach( ally in targets )
					{
						if (ally.getMoraleState() == this.Const.MoraleState.Fleeing || ally.getCurrentProperties().RangedSkill > ally.getCurrentProperties().MeleeSkill || ally.getTile().hasZoneOfControlOtherThan(ally.getAlliedFactions()))
						{
							continue;
						}

						if (ally.getTile().getDistanceTo(targetTile) < myDistanceToTarget)
						{
							letOthersGoScore = letOthersGoScore + 2.0;
						}
					}
				}
				else
				{
					local myDistanceToTarget = _startingTile.getDistanceTo(targetTile);
					local targets = this.getAgent().getKnownAllies();

					foreach( ally in targets )
					{
						if (ally.getMoraleState() == this.Const.MoraleState.Fleeing || ally.getCurrentProperties().RangedSkill > ally.getCurrentProperties().MeleeSkill || ally.getTile().hasZoneOfControlOtherThan(ally.getAlliedFactions()))
						{
							continue;
						}

						if (ally.getTile().getDistanceTo(targetTile) < myDistanceToTarget)
						{
							letOthersGoScore = letOthersGoScore + 0.5;
						}
					}
				}

				local levelDifference = tile.Level - targetTile.Level;
				local distance = tile.getDistanceTo(_startingTile);
				local distanceFromTarget = tile.getDistanceTo(targetTile);
				local zocs = tile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
				local tileScore = -distance * this.Const.AI.Behavior.EngageDistancePenaltyMult * (1.0 + this.Math.maxf(0.0, 1.0 - _entity.getActionPointsMax() / 9.0)) * (1.0 / this.getProperties().EngageFlankingMult) - letOthersGoScore;
				local scoreMult = 1.0;

				tileScore = tileScore + targetValue * this.Const.AI.Behavior.EngageTargetValueMult;				

				tileScore = tileScore + this.Const.AI.Behavior.EngageWithSkillBonus;

				if (engagementsDeclared != 0)
				{
					tileScore = tileScore - engagementsDeclared;
				}

				if (!isTargetInEnemyZoneOfControl)
				{
					scoreMult = scoreMult * (this.Const.AI.Behavior.EngageLockdownMult * lockDownValue);
				}

				tileScore = tileScore + levelDifference * this.Const.AI.Behavior.EngageTerrainLevelBonus * this.getProperties().EngageOnGoodTerrainBonusMult;
				tileScore = tileScore + tile.TVTotal * this.Const.AI.Behavior.EngageTVValueMult * this.getProperties().EngageOnGoodTerrainBonusMult;

				if (zocs > 0)
				{
					tileScore = tileScore - zocs * this.Const.AI.Behavior.EngageMultipleOpponentsPenalty * this.getProperties().EngageTargetMultipleOpponentsMult;

					if (zocs > 1 && this.getProperties().EngageTargetMultipleOpponentsMult != 0.0)
					{
						scoreMult = scoreMult * this.Math.pow(1.0 / (this.Const.AI.Behavior.EngageTargetMultipleOpponentsMult * this.getProperties().EngageTargetMultipleOpponentsMult), zocs);
					}
				}

				local spearwallMult = this.querySpearwallValueForTile(_entity, tile);


				if (tile.isSameTileAs(myTile) && canEngarde)
				{
					if (this.Const.AI.VerboseMode)
					{
						this.logInfo("Increasing score of my tile as I have En Garde available");
					}
					tileScore += 10 + this.Const.AI.Behavior.EngageTerrainLevelBonus * this.getProperties().EngageOnGoodTerrainBonusMult;
				}

				local isSkillUsable = !tile.isSameTileAs(_startingTile);

				if (isSkillUsable && this.m.Skill.isSpearwallRelevant())
				{
					tileScore = tileScore - this.Const.AI.Behavior.EngageSpearwallTargetPenalty * spearwallMult;
				}

				if (this.getProperties().EngageEnemiesInLinePreference > 1)
				{
					for( local d = 0; d < 6; d++ )
					{
						if (tile.hasNextTile(d))
						{
							local nextTile = tile.getNextTile(d);

							for( local k = 0; k < this.getProperties().EngageEnemiesInLinePreference - 1; k++ )
							{
								if (!nextTile.hasNextTile(d))
								{
									break;
								}

								nextTile = nextTile.getNextTile(d);

								if (nextTile.IsOccupiedByActor && nextTile.getEntity().isAttackable() && !nextTile.getEntity().isAlliedWith(_entity))
								{
									local v = this.queryTargetValue(_entity, nextTile.getEntity());
									tileScore = tileScore + v * this.Const.AI.Behavior.EngageLineTargetValueMult * this.getProperties().TargetPriorityAoEMult;
								}
							}
						}
					}
				}

				if (tile.IsBadTerrain)
				{
					local mult = isTargetArmedWithRangedWeapon ? 0.5 : 1.0;
					tileScore = tileScore - this.Const.AI.Behavior.EngageBadTerrainPenalty * this.getProperties().EngageOnBadTerrainPenaltyMult * mult;
				}

				if (this.hasNegativeTileEffect(tile, _entity) || tile.Properties.IsMarkedForImpact)
				{
					tileScore = tileScore - this.Const.AI.Behavior.EngageBadTerrainEffectPenalty * this.getProperties().EngageOnBadTerrainPenaltyMult;
				}

				if (this.getProperties().OverallFormationMult != 0)
				{
					local allies = this.queryAllyMagnitude(tile, this.Const.AI.Behavior.EngageAllyFormationMaxDistance);
					local formationValue = 0.0;

					if (allies.Allies != 0)
					{
						formationValue = this.Math.pow(allies.Allies * allies.AverageDistanceScore * (allies.Magnetism / allies.Allies) * this.getProperties().OverallFormationMult * 0.5, this.getProperties().OverallFormationMult * 0.5) * this.Const.AI.Behavior.EngageFormationBonus;
					}

					tileScore = tileScore + formationValue;
				}

				ret.push({
					Tile = tile,
					Actor = _target,
					TargetValue = targetValue,
					TileScore = tileScore,
					ScoreMult = scoreMult
				});

				if (::Const.AI.VerboseMode)
				{
					if (ignoredTiles.len() != 0)
					{
						local text = "From Tile " + tile.ID + ", ignoring tiles ";
						foreach (tile in ignoredTiles)
						{
							text += tile.ID + ", ";
						}
						::logInfo(text.slice(0, -2) + " as we won\'t be able to use " + attackSkill.getName() + " against them from those tiles");
						ignoredTiles.clear();
					}
				}
			}

			return ret;
		}

		local potentialDestinations = [];

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("My tile is " + myTile.ID);
		}

		foreach (target in targets)
		{
			// if (this.isAllottedTimeReached(time))
			// {
			// 	yield null;
			// 	time = this.Time.getExactTime();
			// }

			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("Evaluating target " + target.getName());
			}

			local evaluation = evaluateTarget(target, myTile);
			if (evaluation.len() > 0)
			{
				potentialDestinations.extend(evaluation);
			}
		}

		if (potentialDestinations.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if ((this.m.Skill.getActionPointCost() + attackSkill.getActionPointCost() <= _entity.getActionPoints()) && this.m.Skill.getFatigueCost() + attackSkill.getFatigueCost() + _entity.getFatigue() <= _entity.getFatigueMax())
		{
			foreach (dest in potentialDestinations)
			{
				// if (this.isAllottedTimeReached(time))
				// {
				// 	yield null;
				// 	time = this.Time.getExactTime();
				// }

				if (!dest.Tile.isSameTileAs(myTile))
				{
					local extendedTargets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange() + 1, this.m.Skill.getMaxLevelDifference(), dest.Tile);
					local furtherDestinations = [];
					foreach (t in extendedTargets)
					{
						if (this.Const.AI.VerboseMode)
						{
							this.logInfo("Evaluating extended target " + t.getName() + " from primary target " + dest.Actor.getName());
						}
						local evaluation = evaluateTarget(t, dest.Tile);
						if (evaluation.len() > 0)
						{
							furtherDestinations.extend(evaluation);
						}
					}

					if (furtherDestinations.len() > 0)
					{
						furtherDestinations.sort(this.onSortByScore);
						local d = furtherDestinations[0];
						if (!d.Tile.isSameTileAs(myTile) && !d.Tile.isSameTileAs(dest.Tile))
						{
							if (this.Const.AI.VerboseMode)
							{
								local text = "Increasing score of Kata against " + dest.Actor.getName() + " to tile " + dest.Tile.ID + " for future ";
								if (d.TileScore == 999) text += "Lunge towards " + d.Actor.getName();
								else text += "Kata towards " + d.Actor.getName() + " to tile " + d.Tile.ID;
								this.logInfo(text);
							}
							dest.TileScore += d.TileScore;
						}
					}
				}
			}
		}

		potentialDestinations.sort(this.onSortByScore);

		if (this.Const.AI.VerboseMode)
		{
			foreach (dest in potentialDestinations)
			{
				this.logInfo("* Possible target : " + dest.Actor.getName() +
							 " at distance:" + dest.Actor.getTile().getDistanceTo(myTile) +
							 ". TargetValue is: " + dest.TargetValue +
							 ". Fromm tile : " + dest.Tile.ID +
							 ", with TileScore: " + dest.TileScore);
			}
		}

		local bestTarget;
		local bestScoreMult = 1.0;
		local actorTargeted;

		// if (this.isAllottedTimeReached(time))
		// {
		// 	yield null;
		// 	time = this.Time.getExactTime();
		// }

		if (!potentialDestinations[0].Tile.isSameTileAs(myTile))
		{
			bestTarget = potentialDestinations[0].Tile;
			bestScoreMult = potentialDestinations[0].ScoreMult;
			actorTargeted = potentialDestinations[0].Actor;
		}
		else
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("Kata Step: Returning 0 because best target is: " + potentialDestinations[0].Actor.getName() + " from tile " + potentialDestinations[0].Tile.ID + " with Kata not usable on that tile");
			}
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (bestTarget != null && bestTarget.ID != myTile.ID)
		{
			if (this.m.Skill.isSpearwallRelevant() && this.getProperties().PreferCarefulEngage && this.getProperties().EngageAgainstSpearwallMult != 0.0 && _entity.isAbleToWait() && this.querySpearwallValueForTile(_entity, bestTarget) != 0.0)
			{
				local allies = this.getAgent().getKnownAllies();

				foreach( ally in allies )
				{
					// if (this.isAllottedTimeReached(time))
					// {
					// 	yield null;
					// 	time = this.Time.getExactTime();
					// }

					if (ally.isTurnDone() || ally.getMoraleState() == this.Const.MoraleState.Fleeing || ally.getCurrentProperties().IsRooted || ally.getCurrentProperties().IsStunned || ally.getTile().hasZoneOfControlOtherThan(ally.getAlliedFactions()) || ally.getTile().getDistanceTo(bestTarget) > 5)
					{
						continue;
					}

					if (ally.isArmedWithShield())
					{
						return this.Const.AI.Behavior.Score.Zero;
					}
				}
			}

			this.m.TargetTile = bestTarget;
			this.m.TargetActor = actorTargeted;

			if (!this.getProperties().IgnoreTargetValueOnEngage && actorTargeted != null)
			{
				score = score * (1.0 + this.queryTargetValue(_entity, actorTargeted));
			}

			score = score * bestScoreMult;

			return this.Const.AI.Behavior.Score.PTRKataStep * score * this.getProperties().BehaviorMult[this.m.ID] * this.Math.minf(2.0, 1.0 / this.getProperties().OverallDefensivenessMult);
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("Kata Step: Returning 0 because it is best to stay on my tile.");
		}

		return this.Const.AI.Behavior.Score.Zero;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using " + this.m.Skill.getName() + " against " + this.m.TargetActor.getName() + "!");
			}

			local dist = _entity.getTile().getDistanceTo(this.m.TargetTile);
			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareEvaluationDelay(750);
				this.getAgent().declareAction();
			}

			this.m.TargetTile = null;
			this.m.TargetActor = null;
		}

		return true;
	}

	function onSortByScore( _a, _b )
	{
		if (_a.TileScore > _b.TileScore)
		{
			return -1;
		}
		else if (_a.TileScore < _b.TileScore)
		{
			return 1;
		}

		return 0;
	}
});
