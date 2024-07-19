this.ai_ptr_arrow_to_the_knee <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		Target = null,
		AttackSkill = null,
		Skill = null,
		PossibleSkills = [
			# "actives.ptr_arrow_to_the_knee"
		],
		UsableWithSkills = [
			"actives.quick_shot",
			"actives.aimed_shot",
			"actives.shoot_bolt",
			"actives.shoot_stake"
		]
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.PTRArrowToTheKnee;
		this.m.Order = this.Const.AI.Behavior.Order.PTRArrowToTheKnee;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Target = null;
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

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local e = _entity.getSkills().getSkillByID("effects.ptr_arrow_to_the_knee_attack");
		if (e != null)
		{
			if (this.Const.AI.VerboseMode)
			{
				::PTR.Mod.Debug.printLog("Checking pre-existing arrow to the knee buff and setting its parameters to null");
			}
			e.m.AIForcedTarget = null;
			e.m.AIForcedSkill = null;
		}

		local skills = [];
		foreach (s in this.m.UsableWithSkills)
		{
			local skill = _entity.getSkills().getSkillByID(s);
			if (skill != null)
			{
				skills.push(skill);
			}
		}

		if (skills.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		score = score * this.getFatigueScoreMult(this.m.Skill);

		local bestTarget = this.getBestTarget(_entity, skills);

		if (bestTarget.Target == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Target = bestTarget.Target;

		if (this.Const.AI.VerboseMode)
		{
			::PTR.Mod.Debug.printLog("Chosen best target for arrow to the knee: " + this.m.Target.getName());
		}

		if (this.m.Target.getCurrentProperties().getMeleeSkill() < 80)
		{
			score = score * 0.5;
		}

		return this.Const.AI.Behavior.Score.PTRArrowToTheKnee * score;
	}

	function onExecute( _entity )
	{
		this.m.Skill.use(_entity.getTile());
		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		if (this.m.Target != null && this.getAgent().getForcedOpponent() == null)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using " + this.m.Skill.getName() + " against " + this.m.Target.getName() + "!");
				this.logInfo("* Remaining Action Points: " + _entity.getActionPoints());
			}
			local e = _entity.getSkills().getSkillByID("effects.ptr_arrow_to_the_knee_attack");
			if (e != null)
			{
				e.m.AIForcedTarget = this.m.Target;
				e.m.AIForcedSkill = this.m.AttackSkill;
			}
		}

		this.m.Target = null;
		this.m.Skill = null;
		this.m.AttackSkill = null;
		return true;
	}

	function getBestTarget( _entity, _skills )
	{
		local ret = {
			Target = null,
			Score = null
		};

		this.m.AttackSkill = this.selectSkill(this.m.UsableWithSkills);
		if (this.m.AttackSkill == null)
		{
			return ret;
		}

		if (this.Const.AI.VerboseMode)
		{
			::PTR.Mod.Debug.printLog("Chosen attack skill for arrow to the knee: " + this.m.AttackSkill.getID());
		}

		local apRequiredForAttack = this.m.AttackSkill != null ? this.m.AttackSkill.getActionPointCost() : 4;
		if (this.m.Skill.getActionPointCost() + apRequiredForAttack > _entity.getActionPoints())
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + "No point in using Arrow to the Knee because I will not have any AP left to attack");
			}
			return ret;
		}
		local myTile = _entity.getTile();
		local targets = this.queryTargetsInMeleeRange(this.m.AttackSkill.getMinRange(), this.m.AttackSkill.getMaxRange() + (this.m.AttackSkill.isRanged() ? myTile.Level : 0), this.m.AttackSkill.getMaxLevelDifference());
		local bestTarget;
		local bestScore = 0.0;

		foreach( target in targets )
		{
			if (target.isNonCombatant())
			{
				continue;
			}

			if (target.isArmedWithShield() || target.isArmedWithRangedWeapon())
			{
				continue;
			}

			if (target.getSkills().hasSkill("effects.ptr_arrow_to_the_knee_debuff") || target.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				continue;
			}

			if (target.getCurrentProperties().getMeleeSkill() < 70)
			{
				continue;
			}

			if (this.m.AttackSkill.onVerifyTarget(_entity.getTile(), target.getTile()))
			{
				if (target.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					continue;
				}

				if (target.getCurrentProperties().IsStunned || !target.getCurrentProperties().IsAbleToUseWeaponSkills || target.getSkills().hasSkill("effects.dazed") || target.getSkills().hasSkill("effects.distracted"))
				{
					continue;
				}

				local zoc = target.getTile().getZoneOfControlCountOtherThan(target.getAlliedFactions());

				if (zoc > 0)
				{
					continue;
				}

				local score = target.getHitpoints() / target.getHitpointsMax();
				score = score * (this.m.AttackSkill.getHitchance(target) * 0.01);

				if (this.m.AttackSkill != null)
				{
					local damage = this.m.AttackSkill.getExpectedDamage(target);

					if (target.getHitpoints() <= damage.HitpointDamage + damage.DirectDamage)
					{
						continue;
					}

					if (damage.HitpointDamage >= this.Const.Combat.InjuryMinDamage)
					{
						local threshold = _entity.getCurrentProperties().ThresholdToInflictInjuryMult * this.Const.Combat.InjuryThresholdMult * target.getCurrentProperties().ThresholdToReceiveInjuryMult;
						local dmg = damage.HitpointDamage / (target.getHitpointsMax() * 1.0);

						if (threshold * 0.25 <= dmg)
						{
							score = score * this.Const.AI.Behavior.DistractPreferInjuryMult;
						}
					}
				}

				score = score * (0.5 + target.getCurrentProperties().getMeleeSkill() * 0.01 * 0.5);
				score = score * (0.5 + target.getCurrentProperties().getRegularDamageAverage() * 0.01 * 0.5);
				score = score * this.Math.maxf(0.5, 1.5 - target.getCurrentProperties().TargetAttractionMult);

				if (!target.isTurnDone())
				{
					score = score * this.Const.AI.Behavior.DistractYetToActMult;
				}

				local targetWeapon = target.getMainhandItem();

				if (targetWeapon != null && targetWeapon.isItemType(this.Const.Items.ItemType.TwoHanded) && targetWeapon.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					score = score * this.Const.AI.Behavior.DistractPriorityMult;
					if (targetWeapon.getRangeMax() > 1)
					{
						if (::Tactical.Entities.getHostileActors(target.getFaction(), target.getTile(), 2).len() > 0)
						{
							continue;
						}
						score *= 0.5;
					}
				}

				if (targetWeapon != null && targetWeapon.isAoE())
				{
					score = score * this.Const.AI.Behavior.DistractPriorityMult;
				}

				if (target.getSkills().hasSkill("perk.overwhelm") || target.getSkills().hasSkill("actives.lunge"))
				{
					score = score * this.Const.AI.Behavior.DistractInitiativeMult;
				}

				if (target.getSkills().hasSkill("perk.berserk") || target.getSkills().hasSkill("effects.killing_frenzy"))
				{
					score = score * this.Const.AI.Behavior.DistractInitiativeMult;
				}

				score = score * target.getCurrentProperties().DamageReceivedTotalMult;

				if (apRequiredForAttack <= _entity.getActionPoints() && _entity.getXPValue() >= 300)
				{
					score = score * this.Const.AI.Behavior.DistractAsEliteMult;
				}

				local targetTile = target.getTile();

				for( local i = 0; i < 6; i++ )
				{
					if (targetTile.hasNextTile(i))
					{
						local adjacent = targetTile.getNextTile(i);

						if (adjacent.IsOccupiedByActor && adjacent.getEntity().isAlliedWith(_entity))
						{
							if (adjacent.getEntity().getCurrentProperties().TargetAttractionMult > 1.0)
							{
								score = score * this.Const.AI.Behavior.DistractPriorityMult;
							}
						}
					}
				}

				# if (target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && target.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE() && zoc > 1)
				# {
				# 	score = score * this.Math.pow(this.Const.AI.Behavior.DistractSurroundedTargetMult, zoc - 1);
				# }

				if (this.getStrategy().getStats().AlliesVSEnemiesRatio < 1.0)
				{
					score = score * this.Math.maxf(0.5, this.getStrategy().getStats().AlliesVSEnemiesRatio);
				}

				local targetTile = target.getTile();
				local myAlliesInTargetsRange = this.queryEnemiesInMeleeRange(2, 3, target);

				local isClosestAllyRanged = false;
				local distanceToClosestAlly = 99;
				foreach (ally in myAlliesInTargetsRange)
				{
					local distance = ally.getTile().getDistanceTo(targetTile);
					if (distance <= distanceToClosestAlly && !(distance == distanceToClosestAlly && isClosestAllyRanged))
					{
						isClosestAllyRanged = false;
						distanceToClosestAlly = distance;
						if (ally.isArmedWithRangedWeapon())
						{
							isClosestAllyRanged = true;
						}
					}
				}

				if (isClosestAllyRanged)
				{
					score *= 2;
				}

				if (distanceToClosestAlly > 2)
				{
					score *= 2;
				}

				if (score > bestScore)
				{
					bestTarget = target;
					bestScore = score;
				}
			}
		}

		ret.Target = bestTarget;
		ret.Score = bestScore;

		return ret;
	}

});
