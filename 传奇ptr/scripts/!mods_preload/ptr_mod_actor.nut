local gt = this.getroottable();

gt.PTR.modActor <- function()
{
	::mods_hookExactClass("entity/tactical/actor", function(o)
	{
		local oldOnDeath = o.onDeath;
		o.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
			oldOnDeath(_killer, _skill, _tile, _fatalityType);
			if (_fatalityType != this.Const.FatalityType.None && _killer != null && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == _killer.getID())
			{
				if (_skill != null && _skill.isAttack() && !_skill.isRanged())
				{
					if (_killer.getSkills().hasSkill("perk.ptr_bloodbath"))
					{
						_killer.setActionPoints(this.Math.min(_killer.getActionPointsMax(), _killer.getActionPoints() + 3));
						_killer.setDirty(true);
						_skill.spawnIcon("perk_ptr_bloodbath", _killer.getTile());
					}

					local sanguinaryPerk = _killer.getSkills().getSkillByID("perk.ptr_sanguinary");
					if (sanguinaryPerk != null)
					{
						local fatigueCostRefund = this.Math.floor(_skill.getFatigueCost() * sanguinaryPerk.m.FatigueCostRefundPercentage * 0.01);
						_killer.setFatigue(this.Math.max(0, _killer.getFatigue() - fatigueCostRefund));
						if (_killer.getMoraleState() < this.Const.MoraleState.Confident && _killer.getMoraleState() != this.Const.MoraleState.Fleeing)
						{
							_killer.setMoraleState(this.Const.MoraleState.Confident);
							_skill.spawnIcon("perk_ptr_sanguinary", _killer.getTile());
						}
					}
				}
			}
		}

		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.getSkills().add(this.new("scripts/skills/effects/ptr_formidable_approach_debuff_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_follow_up_proccer_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_bolstered_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_polearm_hitchance_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_immersive_damage_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_inspired_by_champion_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_inspiring_presence_buff_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_armor_fatigue_recovery_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_direct_damage_limiter_effect"));

			local flags = this.getFlags();
			if (flags.has("undead") && !flags.has("ghost") && !flags.has("ghoul") && !flags.has("vampire"))
			{
				this.getSkills().add(this.new("scripts/skills/effects/ptr_undead_injury_receiver_effect"));
				if (flags.has("skeleton"))
				{
					this.m.ExcludedInjuries.extend(this.Const.Injury.ExcludedInjuries.get(this.Const.Injury.ExcludedInjuries.PTRSkeleton));
				}
				else
				{
					this.m.ExcludedInjuries.extend(this.Const.Injury.ExcludedInjuries.get(this.Const.Injury.ExcludedInjuries.PTRUndead));
				}
			}
		}

		o.getSurroundedCount = function()
		{
			local tile = this.getTile();
			local c = 0;

			for( local i = 0; i < 6; i++ )
			{
				if (tile.hasNextTile(i))
				{
					local next = tile.getNextTile(i);

					if (next.IsOccupiedByActor && this.Math.abs(next.Level - tile.Level) <= 1 && !next.getEntity().isNonCombatant() && !next.getEntity().isAlliedWith(this) && !next.getEntity().getCurrentProperties().IsStunned && !next.getEntity().isArmedWithRangedWeapon())
					{
						c++;
					}
				}
			}

			local enemiesAtTwoTilesDistance = ::Tactical.Entities.getHostileActors(this.getFaction(), this.getTile(), 2, true);

			foreach (enemy in enemiesAtTwoTilesDistance)
			{
				if (!enemy.hasZoneOfControl())
				{
					continue;
				}

				local enemySkill = enemy.getSkills().getSkillByID("perk.ptr_long_reach");
				if (enemySkill != null && enemySkill.isEnabled())
				{
					c++;
				}
			}

			return this.Math.max(0, c - 1 - this.m.CurrentProperties.StartSurroundCountAt);
		}

		local checkMorale = o.checkMorale;
		o.checkMorale = function( _change, _difficulty, _type = this.Const.MoraleCheckType.Default, _showIconBeforeMoraleIcon = "", _noNewLine = false )
		{
			if (this.isPlayerControlled())
			{
				_difficulty -= 5;
			}

			if (this.isAlive() && !this.isDying())
			{
				if (_change > 0)
				{
					local acSkill = this.m.Skills.getSkillByID("perk.legend_assured_conquest");
					if (acSkill != null)
					{
						_difficulty += acSkill.getBonusResAtPositiveMoraleCheck();
					}
				}

				if (_change < 0)
				{
					local familyPride = this.m.Skills.getSkillByID("perk.ptr_family_pride");
					if (familyPride != null && this.m.MoraleState <= familyPride.getMinMoraleState())
					{
						return false;
					}
					
					if (_type == this.Const.MoraleCheckType.MentalAttack)
					{
						local tsSkill = this.m.Skills.getSkillByID("perk.ptr_trauma_survivor");
						if (tsSkill != null)
						{
							_difficulty += tsSkill.getBonusRes();
						}
					}
					else
					{
						local bulwark = this.m.Skills.getSkillByID("perk.ptr_bulwark");
						if (bulwark != null)
						{
							_difficulty += bulwark.getBonus();
						}
					}
				}
			}

			return checkMorale(_change, _difficulty, _type, _showIconBeforeMoraleIcon, _noNewLine);
		}

		local resetPerks = o.resetPerks;
		o.resetPerks = function()
		{
			// Get all items that are adding skills to this character and unequip them to remove those skills
			// Necessary, as some items may add perks
			local items = this.getItems().getAllItems().filter(@(idx, item) item.getSkills().len() != 0);
			foreach (item in items)
			{
				this.getItems().unequip(item);
			}

			local hasDiscoveredTalent = false;
			if (this.getSkills().hasSkill("perk.ptr_discovered_talent"))
			{
				hasDiscoveredTalent = true;
			}

			local risingStar = this.getSkills().getSkillByID("perk.ptr_rising_star");
			local risingStarStartLevel = risingStar != null ? risingStar.m.StartLevel : null;

			local hasPromisedPotential = false;
			local promisedPotentialSkill = this.getSkills().getSkillByID("perk.ptr_promised_potential");
			local promisedPotentialDetails = {};
			if (promisedPotentialSkill != null)
			{
				hasPromisedPotential = true;
				promisedPotentialDetails.IsSpent <- promisedPotentialSkill.m.IsSpent;
				promisedPotentialDetails.WillSucceed <- promisedPotentialSkill.m.WillSucceed;
				if (promisedPotentialSkill.m.IsSpent && promisedPotentialSkill.m.WillSucceed)
				{
					promisedPotentialDetails.hasPunchingBag <- this.getSkills().hasSkill("perk.ptr_punching_bag");
					promisedPotentialDetails.hasTraumaSurvivor <- this.getSkills().hasSkill("perk.ptr_trauma_survivor");
				}
			}

			local hasProfessional = false;
			local professionalPerk = this.getSkills().getSkillByID("perk.ptr_professional");
			local numProfessionalAddedPerks = 0;
			if (professionalPerk != null)
			{
				hasProfessional = true;
				numProfessionalAddedPerks = professionalPerk.m.PerksAdded.len();
			}

			resetPerks();

			if (hasDiscoveredTalent)
			{
				this.m.PerkPoints -= 1;
				local dtPerk = this.new("scripts/skills/perks/perk_ptr_discovered_talent");
				dtPerk.m.IsApplied = true;
				this.getSkills().add(dtPerk);
			}

			if (risingStarStartLevel != null)
			{
				this.m.PerkPoints -= 1;
				local perk = ::new("scripts/skills/perks/perk_ptr_rising_star");
				perk.m.StartLevel = risingStarStartLevel;
				perk.m.IsSet = true;
				this.getSkills().add(perk);
			}

			if (hasPromisedPotential)
			{
				this.m.PerkPoints -= 1;
				this.m.PerkPointsSpent += 1;
				local p = this.new("scripts/skills/perks/perk_ptr_promised_potential");
				p.m.IsSet = true;
				p.m.IsSpent = promisedPotentialDetails.IsSpent;
				p.m.WillSucceed = promisedPotentialDetails.WillSucceed;
				this.getSkills().add(p);

				if (promisedPotentialDetails.IsSpent && promisedPotentialDetails.WillSucceed)
				{
					if (promisedPotentialDetails.hasPunchingBag)
					{
						this.getSkills().add(this.new("scripts/skills/perks/perk_ptr_punching_bag"));
					}

					if (promisedPotentialDetails.hasTraumaSurvivor)
					{
						this.getSkills().add(this.new("scripts/skills/perks/perk_ptr_trauma_survivor"));
					}
				}
			}

			if (hasProfessional)
			{
				this.m.PerkPoints -= numProfessionalAddedPerks;
			}

			foreach (item in items)
			{
				this.getItems().equip(item);
			}
		}

		local getActionPointCosts = o.getActionPointCosts;
		o.getActionPointCosts = function()
		{
			local ret = getActionPointCosts();

			local skirmisher = this.getSkills().getSkillByID("perk.ptr_skirmisher");
			if (skirmisher != null && skirmisher.m.TurnCount == 1)
			{
				for (local i = 1; i < ret.len(); i++)
				{
					if (ret[i] < 1)
					{
						ret[i] = 1;
					}
				}
			}

			return ret;
		}

		local getFatigueCosts = o.getFatigueCosts;
		o.getFatigueCosts = function()
		{
			local ret = getFatigueCosts();

			local skirmisher = this.getSkills().getSkillByID("perk.ptr_skirmisher");
			if (skirmisher != null && skirmisher.m.TurnCount == 1)
			{
				for (local i = 1; i < ret.len(); i++)
				{
					if (ret[i] < 0)
					{
						ret[i] = 0;
					}
				}
			}

			return ret;
		}
	});
}
