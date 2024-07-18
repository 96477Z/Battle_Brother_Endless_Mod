this.ai_bf_attack_lunge <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		TargetActor = null,
		PossibleSkills = [
			"actives.lunge"			
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.BFAttackLunge;
		this.m.Order = this.Const.AI.Behavior.Order.BFAttackLunge;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;
		this.m.TargetActor = null;
		this.m.Skill = null;
		local time = this.Time.getExactTime();
		
		local score = this.getProperties().BehaviorMult[this.m.ID];

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
		
		score = score * this.getFatigueScoreMult(this.m.Skill);
		
		local targets = this.queryTargetsInMeleeRange(this.m.Skill.getMinRange(), this.m.Skill.getMaxRange(), this.m.Skill.getMaxLevelDifference());
		if (targets.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}
		
		local myTile = _entity.getTile();
		local inZonesOfControl = myTile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
		local knownAllies = this.getAgent().getKnownAllies();				
		local targetsInMelee = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax));		
		local AlreadyEngagedWithNum = targetsInMelee.len();		
		
		targets.extend(targetsInMelee);		
				
		local potentialDestinations = [];
		foreach (target in targets)
		{	
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}
			
			local targetTile = target.getTile();
			local isTargetInEnemyZoneOfControl = targetTile.hasZoneOfControlOtherThan(target.getAlliedFactions());
			local isTargetArmedWithRangedWeapon = !isTargetInEnemyZoneOfControl && this.isRangedUnit(target);
			local isTargetFleeing = target.getMoraleState() == this.Const.MoraleState.Fleeing;
			local engagementsDeclared = (target.getAIAgent().getEngagementsDeclared(_entity) + target.getTile().getZoneOfControlCount(_entity.getFaction()) * 2) * this.Const.AI.Behavior.EngageAlreadyEngagedPenaltyMult * this.getProperties().EngageTargetAlreadyBeingEngagedMult;
			local letOthersGoScore = 0.0;
			local isSkillUsable = false;
			local lockDownValue = 1.0;
			local tile = null;
			
			local targetValue = this.getProperties().IgnoreTargetValueOnEngage ? 0.5 : this.queryTargetValue(_entity, target);
			if (this.m.Skill.isUsableOn(targetTile))
			{
				isSkillUsable = true;
				targetValue = this.getProperties().IgnoreTargetValueOnEngage ? 0.5 : this.queryTargetValue(_entity, target, this.m.Skill);				
			}
			else 
			{
				local attackSkill = _entity.getSkills().getAttackOfOpportunity();
				if (attackSkill == null || !attackSkill.isUsableOn(targetTile))
				{
					continue;
				}
			}
			
			if (targetTile.getZoneOfControlCount(_entity.getFaction()) == 0 && !isTargetArmedWithRangedWeapon && !isTargetFleeing && engagementsDeclared == 0)
			{
				foreach( ally in knownAllies )
				{
					if (ally.getCurrentProperties().TargetAttractionMult <= 1.0 && !this.isRangedUnit(ally))
					{
						continue;
					}

					local d = this.queryActorTurnsNearTarget(target, ally.getTile(), target);

					if (d.Turns <= 1.0)
					{
						lockDownValue = lockDownValue * (this.Const.AI.Behavior.EngageMeleeProtectPriorityTargetMult * this.getProperties().EngageLockDownTargetMult);
					}
				}
			}
			
			if (this.getProperties().IgnoreTargetValueOnEngage)
			{
				letOthersGoScore = letOthersGoScore + this.Math.abs(myTile.SquareCoords.Y - targetTile.SquareCoords.Y) * 20.0;
				local myDistanceToTarget = myTile.getDistanceTo(targetTile);
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
				local myDistanceToTarget = myTile.getDistanceTo(targetTile);
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
			
			if (isSkillUsable)
			{
				tile = this.m.Skill.getDestinationTile(targetTile);
				// if (inZonesOfControl != 0 && targetsInMelee.len() > 0)
				// {
					// score = score * this.Math.pow(this.Const.AI.Behavior.EngageWithSkillToDisengagePOW, inZonesOfControl);
					
					// local accumulatedAOO = 0;					

					// for( local i = 0; i < 6; i++ )
					// {
						// if (myTile.hasNextTile(i))
						// {
							// local nextTile = myTile.getNextTile(i);

							// if (nextTile.IsOccupiedByActor)
							// {
								// local e = nextTile.getEntity();

								// if (e.isExertingZoneOfControl() && this.Math.abs(nextTile.Level - myTile.Level) <= 1 && !e.isAlliedWith(_entity))
								// {
									// local aooSkill = e.getSkills().getAttackOfOpportunity();

									// if (aooSkill != null)
									// {
										// accumulatedAOO = accumulatedAOO + aooSkill.getHitchance(_entity);
									// }
								// }
							// }
						// }
					// }
					
					// local accumulatedAOODestination = 0;
					
					// for( local i = 0; i < 6; i++ )
					// {
						// if (tile.hasNextTile(i))
						// {
							// local nextTile = tile.getNextTile(i);

							// if (nextTile.IsOccupiedByActor)
							// {
								// local e = nextTile.getEntity();

								// if (e.isExertingZoneOfControl() && this.Math.abs(nextTile.Level - tile.Level) <= 1 && !e.isAlliedWith(_entity))
								// {
									// local aooSkill = e.getSkills().getAttackOfOpportunity();

									// if (aooSkill != null)
									// {
										// accumulatedAOODestination = accumulatedAOODestination + aooSkill.getHitchance(_entity);
									// }
								// }
							// }
						// }
					// }
					
					// this.logInfo("target is " + target.getName() + ", accumulatedAOO = " + accumulatedAOO + ", accumulatedAOODestination = " + accumulatedAOODestination);
					// // if (accumulatedAOODestination > accumulatedAOO)
					// // {
						// // accumulatedAOO += accumulatedAOODestination;	
					// // }
					// // else
					// // {
						// // local targetsInMeleeAtDest = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax), this.m.Skill.getMaxLevelDifference(), tile);
						// // accumulatedAOO = accumulatedAOODestination;
					// // }
					
					// this.logInfo("targetValue before: " + targetValue);
					// //score = score * this.Math.maxf(0.0, 1.0 - accumulatedAOO * 0.01 * 1.0 / (this.getProperties().EngageWhenAlreadyEngagedMult * 2.0));			
					// targetValue = targetValue * this.Math.maxf(0.0, 1.0 - accumulatedAOO * 0.01 * 1.0 / (this.getProperties().EngageWhenAlreadyEngagedMult * 2.0));			
					// this.logInfo("targetValue after: " + targetValue);

					// // if (score <= 0)
					// // {
						// // this.logInfo("returning because disengagegment score is 0");
						// // return this.Const.AI.Behavior.Score.Zero;
					// // }
				// }
				// else if (AlreadyEngagedWithNum != 0)
				// {
					// targetValue = targetValue * this.Math.pow(this.Const.AI.Behavior.EngageWhenAlreadyInRangeMult, targetsInMelee.len());
				// }
			}
			else
			{
				tile = myTile;
			}
			
			if (tile == null)
			{
				continue;
			}
						
			local levelDifference = tile.Level - targetTile.Level;
			local distance = tile.getDistanceTo(myTile);
			local distanceFromTarget = tile.getDistanceTo(targetTile);
			local zocs = tile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
			local tileScore = -distance * this.Const.AI.Behavior.EngageDistancePenaltyMult * (1.0 + this.Math.maxf(0.0, 1.0 - _entity.getActionPointsMax() / 9.0)) * (1.0 / this.getProperties().EngageFlankingMult) - letOthersGoScore;
			local scoreBonus = 0 - letOthersGoScore;
			local scoreMult = 1.0;
			
			tileScore = tileScore + targetValue * this.Const.AI.Behavior.EngageTargetValueMult;
			scoreBonus = scoreBonus + targetValue * this.Const.AI.Behavior.EngageTargetValueMult;
			
			tileScore = tileScore + this.Const.AI.Behavior.EngageWithSkillBonus;
			
			if (engagementsDeclared != 0)
			{
				tileScore = tileScore - engagementsDeclared;
				scoreBonus = scoreBonus - engagementsDeclared;
			}
			
			if (!isTargetInEnemyZoneOfControl)
			{
				scoreMult = scoreMult * (this.Const.AI.Behavior.EngageLockdownMult * lockDownValue);
				scoreBonus = scoreBonus + this.Const.AI.Behavior.EngageLockOpponentBonus * lockDownValue;
			}
			
			tileScore = tileScore + levelDifference * this.Const.AI.Behavior.EngageTerrainLevelBonus * this.getProperties().EngageOnGoodTerrainBonusMult;
			tileScore = tileScore + tile.TVTotal * this.Const.AI.Behavior.EngageTVValueMult * this.getProperties().EngageOnGoodTerrainBonusMult;
			scoreBonus = scoreBonus + (levelDifference * this.Const.AI.Behavior.EngageTerrainLevelBonus + tile.TVTotal * this.Const.AI.Behavior.EngageTVValueMult) * this.getProperties().EngageOnGoodTerrainBonusMult;
			
			if (zocs > 0)
			{
				tileScore = tileScore - zocs * this.Const.AI.Behavior.EngageMultipleOpponentsPenalty * this.getProperties().EngageTargetMultipleOpponentsMult;
				scoreBonus = scoreBonus - zocs * this.Const.AI.Behavior.EngageMultipleOpponentsPenalty * this.getProperties().EngageTargetMultipleOpponentsMult;

				if (zocs > 1 && this.getProperties().EngageTargetMultipleOpponentsMult != 0.0)
				{
					scoreMult = scoreMult * this.Math.pow(1.0 / (this.Const.AI.Behavior.EngageTargetMultipleOpponentsMult * this.getProperties().EngageTargetMultipleOpponentsMult), zocs);
				}
			}
			
			local spearwallMult = this.querySpearwallValueForTile(_entity, tile);

			if (isSkillUsable && this.m.Skill.isSpearwallRelevant())
			{
				tileScore = tileScore - this.Const.AI.Behavior.EngageSpearwallTargetPenalty * spearwallMult;
				scoreBonus = scoreBonus - this.Const.AI.Behavior.EngageSpearwallTargetPenalty * spearwallMult;
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
								scoreBonus = scoreBonus + v * this.Const.AI.Behavior.EngageLineTargetValueMult * this.getProperties().TargetPriorityAoEMult;
							}
						}
					}
				}
			}
			
			if (tile.IsBadTerrain)
			{
				local mult = isTargetArmedWithRangedWeapon ? 0.5 : 1.0;
				tileScore = tileScore - this.Const.AI.Behavior.EngageBadTerrainPenalty * this.getProperties().EngageOnBadTerrainPenaltyMult * mult;
				scoreBonus = scoreBonus - this.Const.AI.Behavior.EngageBadTerrainPenalty * this.getProperties().EngageOnBadTerrainPenaltyMult * mult;
			}
			
			if (this.hasNegativeTileEffect(tile, _entity) || tile.Properties.IsMarkedForImpact)
			{
				tileScore = tileScore - this.Const.AI.Behavior.EngageBadTerrainEffectPenalty * this.getProperties().EngageOnBadTerrainPenaltyMult;
				scoreBonus = scoreBonus - this.Const.AI.Behavior.EngageBadTerrainEffectPenalty * this.getProperties().EngageOnBadTerrainPenaltyMult;
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
				scoreBonus = scoreBonus + formationValue;
			}
			
			potentialDestinations.push({
				Tile = tile,
				Actor = target,
				TargetValue = targetValue,
				IsSkillUsable = isSkillUsable,
				IsTargetLocked = isTargetInEnemyZoneOfControl,
				IsTargetLockable = distanceFromTarget == 1,
				TileScore = tileScore,
				ScoreMult = scoreMult,
				Distance = distance
			});
		}
		
		if (potentialDestinations.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}
		
		potentialDestinations.sort(this.onSortByScore);		
		
		if (this.Const.AI.VerboseMode)
		{
			foreach (dest in potentialDestinations)
			{
				this.logInfo("* Possible target : " + dest.Actor.getName() + 
							 " at distance:" + dest.Actor.getTile().getDistanceTo(myTile) + 
							 " and is lungeable: " + dest.IsSkillUsable + 
							 ". TargetValue is: " + dest.TargetValue + 
							 ", TileScore is: " + dest.TileScore);
			}			
		}
		
		local bestTarget;
		local bestTargetDistance = 0;
		local bestIntermediateTile;
		local bestLocked = false;
		local bestLockable = false;
		local bestScoreMult = 1.0;
		local bestComplete = false;
		local actorTargeted;		
		
		if (potentialDestinations[0].IsSkillUsable)
		{
			bestTarget = potentialDestinations[0].Actor.getTile();
			bestIntermediateTile = null;
			bestLocked = potentialDestinations[0].IsTargetLocked;
			bestLockable = potentialDestinations[0].IsTargetLockable;
			bestScoreMult = potentialDestinations[0].ScoreMult;
			bestComplete = true;
			actorTargeted = potentialDestinations[0].Actor;
			// this.logInfo("we want to use skill on potential destination");
		}
		else 
		{
			// this.logInfo("returning 0 because best target is: " + potentialDestinations[0].Actor.getName());
			return this.Const.AI.Behavior.Score.Zero;
		}		
		
		if (this.isAllottedTimeReached(time))
		{
			yield null;
			time = this.Time.getExactTime();
		}
		
		if (bestTarget != null && bestTarget.ID != myTile.ID)
		{
			if (this.m.Skill.isSpearwallRelevant() && this.getProperties().PreferCarefulEngage && this.getProperties().EngageAgainstSpearwallMult != 0.0 && _entity.isAbleToWait() && this.querySpearwallValueForTile(_entity, bestTarget) != 0.0)	
			{
				local allies = this.getAgent().getKnownAllies();

				foreach( ally in allies )
				{
					if (this.isAllottedTimeReached(time))
					{
						yield null;
						time = this.Time.getExactTime();
					}
					
					if (ally.isTurnDone())
					{
						continue;
					}

					if (ally.getMoraleState() == this.Const.MoraleState.Fleeing || ally.getCurrentProperties().IsRooted || ally.getCurrentProperties().IsStunned)
					{
						continue;
					}

					if (ally.getTile().hasZoneOfControlOtherThan(ally.getAlliedFactions()))
					{
						continue;
					}

					if (ally.getTile().getDistanceTo(bestTarget) > 5)
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
			
			if (!this.getProperties().IgnoreTargetValueOnEngage && bestComplete && actorTargeted != null)
			{
				score = score * (1.0 + this.queryTargetValue(_entity, actorTargeted, this.m.Skill));
			}
			
			score = score * bestScoreMult;
			
			// if (actorTargeted != null)
			// {
				// local actorTile = actorTargeted.getTile();
				
				// score = score * this.Const.AI.Behavior.EngageWithSkillMult;

				// if (this.getProperties().EngageOnGoodTerrainBonusMult != 0.0)
				// {
					// if (bestTarget.Level - actorTile.Level > 0)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnLevelDifferenceMult;
					// }
					// else if (bestTarget.Level - actorTile.Level < 0)
					// {
						// score = score * (1.0 / this.Const.AI.Behavior.EngageOnLevelDifferenceMult);
					// }

					// if (!bestLocked && bestLockable && bestTarget.Level - myTile.Level < 0)
					// {
						// score = score * (1.0 / this.Const.AI.Behavior.EngageOnLevelDifferenceMult);
					// }
					// else if (!bestLocked && bestLockable && bestTarget.Level - myTile.Level > 0)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnLevelDifferenceMult;
					// }
				// }

				// if (this.getProperties().EngageOnBadTerrainPenaltyMult != 0.0)
				// {
					// if (bestTarget.IsBadTerrain)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnBadTerrainMult;
					// }

					// if (!myTile.IsBadTerrain && bestTarget.IsBadTerrain)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnBadTerrainMult;
					// }
				// }

				// if (this.getProperties().EngageOnGoodTerrainBonusMult != 0.0)
				// {
					// if (!this.m.TargetTile.IsBadTerrain && this.m.TargetActor.getTile().IsBadTerrain)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnTerrainAdvantage;
					// }

					// if (myTile.IsBadTerrain && !bestTarget.IsBadTerrain)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnTerrainAdvantage;
					// }
				// }

				// if (this.getProperties().EngageOnGoodTerrainBonusMult != 0.0)
				// {
					// if (this.hasNegativeTileEffect(myTile, _entity) && !this.hasNegativeTileEffect(this.m.TargetTile, _entity) || myTile.Properties.IsMarkedForImpact && !this.m.TargetTile.Properties.IsMarkedForImpact)
					// {
						// score = score * this.Const.AI.Behavior.EngageOnTerrainAdvantage;
					// }
				// }

				// // if (this.isAllottedTimeReached(time))
				// // {
					// // yield null;
					// // time = this.Time.getExactTime();
				// // }

				// if (this.m.Skill.isSpearwallRelevant())
				// {
					// local spearwallMult = this.querySpearwallValueForTile(_entity, this.m.TargetTile);

					// score = score * this.Math.maxf(0.1, 1.0 - spearwallMult * 0.5);
				// }
			// }

			return this.Const.AI.Behavior.Score.BFAttackLunge * score * this.getProperties().BehaviorMult[this.m.ID] * this.Math.minf(2.0, 1.0 / this.getProperties().OverallDefensivenessMult);
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

		if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using " + this.m.Skill.getName() + " against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			local dist = _entity.getTile().getDistanceTo(this.m.TargetTile);
			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareAction();

				if (dist > 1 && this.m.Skill.isShowingProjectile())
				{
					this.getAgent().declareEvaluationDelay(750);
				}
				else if (this.m.Skill.getDelay() != 0)
				{
					this.getAgent().declareEvaluationDelay(this.m.Skill.getDelay());
				}
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

