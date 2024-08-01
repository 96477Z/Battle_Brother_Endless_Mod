local gt = this.getroottable();

if (!("EL_Rarity_Entry" in gt.Const))
{
	gt.Const.EL_Rarity_Entry <- {};
}

gt.Const.EL_Rarity_Entry <- {
	Pool = {
		Entrys = [
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_bloody_cutting_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_bloody_knock_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_breaking_through_a_thousand_armies_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_brutal_cashing_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_circle_of_life_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_cold_lie_cashing_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_curling_immortal_sound_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_devastate_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_eye_of_death_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_faith_of_the_rock_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_fight_and_win_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_gunfire_licks_the_heavens_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_heart_triumphs_over_things_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_infinite_penetration_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_into_the_breach_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_landslide_cashing_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_massacre_desire_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_master_feat_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_natural_dismember_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_proof_of_kingly_way_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_pursuit_of_wind_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_radiance_of_magic_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_rainstorm_pear_flower_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_strong_and_heavy_vehemence_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_stun_cashing_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_take_away_by_force_or_trickery_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_the_power_of_unity_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_toxic_blade_thrust_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_unbreakable_entry"
			},
			{
				Scripts = "scripts/skills/el_entrys/rarity_entrys/el_vehemence_of_the_sky_entry"
			}
		]
	},
	Factor = {
		EL_BloodyCutting = {
			TargetHealthLossExtraDamageMultFactor = 1.0,
			BleedingFactor = 1.0
		},
		EL_BloodyKnock = {
			DamageMult = 2
		},
		EL_BrutalCashing = {
			ReplaceSkillList = [
				"actives.strike"
			]
		}
		EL_BreakingThroughThousandArmies = {
			StackPercent = 0.30,
			BraveryOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.BraveryOffset[this.Const.MoraleState.Confident],
            InitiativeOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.InitiativeOffset[this.Const.MoraleState.Confident],
            MeleeSkillOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.MeleeSkillOffset[this.Const.MoraleState.Confident],
            RangedSkillOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.RangedSkillOffset[this.Const.MoraleState.Confident],
            MeleeDefenseOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.MeleeDefenseOffset[this.Const.MoraleState.Confident],
            RangedDefenseOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.RangedDefenseOffset[this.Const.MoraleState.Confident],
            FatigueOnSkillUseOffset = this.Const.EL_PlayerNPC.EL_Morale.Effect.FatigueOnSkillUseOffset[this.Const.MoraleState.Confident],
            DamageTotalMult = this.Const.EL_PlayerNPC.EL_Morale.Effect.DamageTotalMult[this.Const.MoraleState.Confident] - 1.0,
            DamageReceivedTotalMult = 1.0 - this.Const.EL_PlayerNPC.EL_Morale.Effect.DamageReceivedTotalMult[this.Const.MoraleState.Confident],
			ReplaceSkillList = [
				"actives.split_man",
				"actives.round_swing"
			]
		}
		EL_CircleofLife = {
			HitpointsRecover = 0.15,
			FatigueRecover = 0.15,
			ArmorConditonRecover = 0.15,
			HelmetConditonRecover = 0.15,
			RiseNum = 1,
			FatigueDrainPercent = 0.30,
			HitpointsDrainPercent = 0.30,
		},
		EL_ColdLieCashing = {
			DamageMultFactor = 0.15,
			ReplaceSkillList = [
				"actives.thrust",
				"actives.prong"
			]
		},
		EL_CurlingImmortalSound = {
			SkillRange = 5,
			SkillActionPointCost = 4,
			SkillFatigueCost = 6,
			SkillScriptList = [
				"scripts/skills/el_actives/el_shake_heart_warm_ear_skill",
				"scripts/skills/el_actives/el_octave_play_skill",
				"scripts/skills/el_actives/el_horn_blowing_company_battalion_skill",
				"scripts/skills/el_actives/el_generous_and_sad_songs_skill"
			],
			SkillIDList = [
				"el_actives.shake_heart_warm_ear_skill",
				"el_actives.octave_play_skill",
				"el_actives.horn_blowing_company_battalion_skill",
				"el_actives.generous_and_sad_songs_skill"
			],
			HitpointsRecoverPercent = 0.15,
			FatigueRecover = 15,
			DamageMult = 0.15,
			DamageReceivedMult = 0.15,
			InitiativeOffset = 30,
			MeleeSkillOffset = 15,
			RangedSkillOffset = 15,
			MeleeDefenseOffset = 15,
			RangedDefenseOffset = 15
		},
		EL_Devastate = {
			ShieldDamageMult = 3,
			InjuryNum = 1,
			HealthDamageMult = 3,
			ReplaceSkillList = [
				"actives.smite",
				"actives.shatter"
			]
		},
		EL_EyeOfDeath = {
			HitHeadMult = 2
		}
		EL_FaithOfTheRock = {
			TargetAttractionMult = 9999
		},
		EL_FightAndWin = {
			WeakenBravery = 5,
			WeakenInitiative = 10,
			WeakenMeleeSkill = 5,
			WeakenRangedSkill = 5,
			WeakenMeleeDefense = 5,
			WeakenRangedDefense = 5,
			WeakenDamageReceivedTotalMult = 0.05,
			TempWeakenBravery = 15,
			TempWeakenInitiative = 15,
			TempWeakenMeleeSkill = 30,
			TempWeakenRangedSkill = 15,
			TempWeakenMeleeDefense = 15,
			TempWeakenRangedDefense = 15,
			TempWeakenDamageReceivedTotalMult = 0.15
		},
		EL_GunfireLicksTheHeavens = {
			ExplosionRangeMult = 3,
			CheckMoraleOffset = 0
		},
		EL_HeartTriumphsOverThings = {
			ExtraDamageHitpointsCiv = 1.0,
			ExtraAttackTimeInitiative = 100,
			ExtraAttackRangeBraveryoffset = 50,
			ExtraAttackRangeBraveryNeed = 10,
			ReceivedDamageMult = 0.0,
			ReceivedDamageBraveryMult = 10
		},
		EL_InfinitePenetration = {
			PenetrateNum = 20,
			RegularDamageMult = 2.0
		},
		EL_IntoTheBreach = {
			ConvertWeightIntoMeleeSkillPercent = 1.0,
			MeleeSkillChainOffset = 1.5,
			MeleeDefenseChainOffset = 1.5,
			DistanceRange = 2,
			ReplaceSkillList = [
				"actives.spearwall"
			]
		}
		EL_LandslideCashing = {
			InjuryNum = 1,
			HealthDamageMult = 1,
			ReplaceSkillList = [
				"actives.batter"
			]
		},
		EL_MassacreDesire = {
			TempDamageMult = 0.15
		},
		EL_MasterFeat = {
			DamageMultFactor = 0.01,
			MeleeSkillFactor = 1,
			MeleeDefenseFactor = 1,
			RangedDefenseFactor = 1,
			ReplaceSkillList = [
				"actives.riposte"
			]
		},
		EL_NaturalDismember = {
			SlightInjuryPercent = 0.05,
			SeriousInjuryPercent = 0.1,
			DamageMultFactor = 0.25
		},
		EL_ProofOfKinglyWay = {
			BraveryMult = 0.3
		},
		EL_PursuitOfWind = {
			DamageMult = 0.7
		},
		EL_RadianceOfMagic = {
			InfuseMagic = {
				DamageMult = 1.5,
				RangeMaxMult = 1.5,
				ActionPointCostMult = 0.67,
				FatigueCostMult = 0.67,
				MultipleChance = 40,
			},
			StagnantSpirit = {
				MultipleChance = 40,
				NegativeEffectList = [
					"scripts/skills/effects/withered_effect",
					"scripts/skills/effects/insect_swarm_effect",
					"scripts/skills/effects/debilitated_effect",
					"scripts/skills/effects/rooted_effect",
					"scripts/skills/effects/stunned_effect",
					"scripts/skills/effects/dazed_effect",
					"scripts/skills/effects/legend_dazed_effect"
				]
			}
		},
		RainstormPearFlower = {
			ReplaceSkillList = [
				"actives.sling_stone",
				"actives.legend_slingstaff_bash"
			],
		},
		EL_StrongAndHeavyVehemence = {
			FatigueDamageMult = 2,
			ReplaceSkillList = [
				"actives.bash",
				"actives.knock_out",
				"actives.strike_down",
				"actives.cudgel",
				"actives.thrust"
			]
		},
		EL_StunCashing = {
			FatigueDamageMult = 0.5,
			ReplaceSkillList = [
				"actives.crumble",
				"actives.knock_over"
			]
		},
		EL_TakeAwayByForceOrTrickery = {
			ReplaceSkillList = [
				"actives.whip",
				"actives.disarm",
				"actives.legend_flaggelate",
				"actives.legend_ninetails_disarm",
				"actives.legend_flogging"
			],
			ExtraAttackFatigueCostFactor = 0.0
		},
		EL_ToxicBladeThrust = {
			DamageMultPurEffect = 0.15,
			DebuffNum = 2
		},
		EL_VehemenceOfTheSky = {
			ConvertArmorIntoDamagePercent = 0.2,
			ShieldDamageMult = 0.4
		}
	}

	function EL_getAttackSkill( _actor )
	{
		local ret;
		local ap = 999;
        local skills = _actor.getSkills().m.Skills;
		foreach( skill in skills )
		{
			//this.logInfo("skill id:" + skill.getID());
			if (!skill.isActive() || !skill.isAttack() || !skill.isTargeted() || skill.isIgnoredAsAOO() || skill.isDisabled() || !skill.isUsable())
			{
				continue;
			}
			if (skill.getActionPointCost() < ap)
			{
			//this.logInfo("sucess skill id:" + skill.getID());
				ret = skill;
				ap = skill.getActionPointCost();
			}
		}
		return ret;
	}

	function EL_isNegativeEffect( _skill )
	{
		foreach( _id in this.Const.EL_Item_Other.NegativeEffectID)
		{
			if(_skill.getID() == _id)
			{
				return true;
			}
		}
		return false;
	}

	function EL_useFreeSplitShield( _actor, _targetEntity )
	{
		local split_shield = _actor.getSkills().getSkillByID("actives.split_shield");
		if(split_shield != null && _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
		{
			//this.logInfo("split_shield use?" + split_shield.getID());
			split_shield.useForFree(_targetEntity.getTile());
		}
	}

	function EL_ReplaceSkill( _actor, _EL_replacedSkills, _EL_replaceSkillList )
	{

		local skills = _actor.getSkills();
		foreach( skill in skills.m.Skills )
		{
			foreach(skill_id in _EL_replaceSkillList)
			{
				if(skill.getID() == skill_id)
				{
					if(!skill.EL_isRaritySkill())
					{
						_EL_replacedSkills.push(skill);
						_actor.getSkills().remove(skill);
						continue;
					}

				}
			}
		}
	}

	function EL_ReturnSkill( _actor, _EL_replacedSkills )
	{
		foreach(skill in _EL_replacedSkills)
		{
			skill.m.IsGarbage = false;
			_actor.getSkills().add(skill);
		}
		_EL_replacedSkills.clear();
	}

	function EL_addPursuitEffect( _targetEntity, _EL_sourceEntity, _EL_attackSkill )
	{
		local skill = this.new("scripts/skills/el_effects/el_pursuit_effect");
		skill.EL_setSourceActorAndAttackSkill(_EL_sourceEntity, _EL_attackSkill);
		_targetEntity.getSkills().add(skill);
	}
};