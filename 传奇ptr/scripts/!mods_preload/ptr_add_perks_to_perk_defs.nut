local gt = this.getroottable();

gt.PTR.addPerksToPerkDefs <- function()
{
	gt.Const.Strings.PerkName.PTRTesting <- "Testing perk";
	gt.Const.Strings.PerkDescription.PTRTesting <- "Will add other perks for testing them.";

	this.Const.Perks.PerkDefObjects.push({
		ID = "perk.ptr_testing",
		Script = "scripts/skills/perks/perk_ptr_testing",
		Name = this.Const.Strings.PerkName.PTRTesting,
		Tooltip = this.Const.Strings.PerkDescription.PTRTesting,
		Icon = "ui/perks/ptr_testing.png",
		IconDisabled = "ui/perks/ptr_testing_bw.png",
		Const = "PTRTesting"
	});

	local perks = [
		{
			ID = "perk.ptr_dismemberment",
			Script = "scripts/skills/perks/perk_ptr_dismemberment",
			Name = this.Const.Strings.PerkName.PTRDismemberment,
			Tooltip = this.Const.Strings.PerkDescription.PTRDismemberment,
			Icon = "ui/perks/ptr_dismemberment.png",
			IconDisabled = "ui/perks/ptr_dismemberment_bw.png",
			Const = "PTRDismemberment"
		},
		{
			ID = "perk.ptr_heft",
			Script = "scripts/skills/perks/perk_ptr_heft",
			Name = this.Const.Strings.PerkName.PTRHeft,
			Tooltip = this.Const.Strings.PerkDescription.PTRHeft,
			Icon = "ui/perks/ptr_heft.png",
			IconDisabled = "ui/perks/ptr_heft_bw.png",
			Const = "PTRHeft"
		},
		{
			ID = "perk.ptr_between_the_eyes",
			Script = "scripts/skills/perks/perk_ptr_between_the_eyes",
			Name = this.Const.Strings.PerkName.PTRBetweenTheEyes,
			Tooltip = this.Const.Strings.PerkDescription.PTRBetweenTheEyes,
			Icon = "ui/perks/ptr_between_the_eyes.png",
			IconDisabled = "ui/perks/ptr_between_the_eyes_bw.png",
			Const = "PTRBetweenTheEyes"
		},
		{
			ID = "perk.ptr_cull",
			Script = "scripts/skills/perks/perk_ptr_cull",
			Name = this.Const.Strings.PerkName.PTRCull,
			Tooltip = this.Const.Strings.PerkDescription.PTRCull,
			Icon = "ui/perks/ptr_cull.png",
			IconDisabled = "ui/perks/ptr_cull_bw.png",
			Const = "PTRCull"
		},
		{
			ID = "perk.ptr_arrow_to_the_knee",
			Script = "scripts/skills/perks/perk_ptr_arrow_to_the_knee",
			Name = this.Const.Strings.PerkName.PTRArrowToTheKnee,
			Tooltip = this.Const.Strings.PerkDescription.PTRArrowToTheKnee,
			Icon = "ui/perks/ptr_arrow_to_the_knee.png",
			IconDisabled = "ui/perks/ptr_arrow_to_the_knee_bw.png",
			Const = "PTRArrowToTheKnee"
		},
		{
			ID = "perk.ptr_flaming_arrows",
			Script = "scripts/skills/perks/perk_ptr_flaming_arrows",
			Name = this.Const.Strings.PerkName.PTRFlamingArrows,
			Tooltip = this.Const.Strings.PerkDescription.PTRFlamingArrows,
			Icon = "ui/perks/ptr_flaming_arrows.png",
			IconDisabled = "ui/perks/ptr_flaming_arrows_bw.png",
			Const = "PTRFlamingArrows"
		},
		{
			ID = "perk.ptr_death_from_afar",
			Script = "scripts/skills/perks/perk_ptr_death_from_afar",
			Name = this.Const.Strings.PerkName.PTRDeathFromAfar,
			Tooltip = this.Const.Strings.PerkDescription.PTRDeathFromAfar,
			Icon = "ui/perks/ptr_death_from_afar.png",
			IconDisabled = "ui/perks/ptr_death_from_afar_bw.png",
			Const = "PTRDeathFromAfar"
		},
		{
			ID = "perk.ptr_hip_shooter",
			Script = "scripts/skills/perks/perk_ptr_hip_shooter",
			Name = this.Const.Strings.PerkName.PTRHipShooter,
			Tooltip = this.Const.Strings.PerkDescription.PTRHipShooter,
			Icon = "ui/perks/ptr_hip_shooter.png",
			IconDisabled = "ui/perks/ptr_hip_shooter_bw.png",
			Const = "PTRHipShooter"
		},
		{
			ID = "perk.ptr_deep_cuts",
			Script = "scripts/skills/perks/perk_ptr_deep_cuts",
			Name = this.Const.Strings.PerkName.PTRDeepCuts,
			Tooltip = this.Const.Strings.PerkDescription.PTRDeepCuts,
			Icon = "ui/perks/ptr_deep_cuts.png",
			IconDisabled = "ui/perks/ptr_deep_cuts_bw.png",
			Const = "PTRDeepCuts"
		},
		{
			ID = "perk.ptr_bloodlust",
			Script = "scripts/skills/perks/perk_ptr_bloodlust",
			Name = this.Const.Strings.PerkName.PTRBloodlust,
			Tooltip = this.Const.Strings.PerkDescription.PTRBloodlust,
			Icon = "ui/perks/ptr_bloodlust.png",
			IconDisabled = "ui/perks/ptr_bloodlust_bw.png",
			Const = "PTRBloodlust"
		},
		{
			ID = "perk.ptr_bloodbath",
			Script = "scripts/skills/perks/perk_ptr_bloodbath",
			Name = this.Const.Strings.PerkName.PTRBloodbath,
			Tooltip = this.Const.Strings.PerkDescription.PTRBloodbath,
			Icon = "ui/perks/ptr_bloodbath.png",
			IconDisabled = "ui/perks/ptr_bloodbath_bw.png",
			Const = "PTRBloodbath"
		},
		{
			ID = "perk.ptr_mauler",
			Script = "scripts/skills/perks/perk_ptr_mauler",
			Name = this.Const.Strings.PerkName.PTRMauler,
			Tooltip = this.Const.Strings.PerkDescription.PTRMauler,
			Icon = "ui/perks/ptr_mauler.png",
			IconDisabled = "ui/perks/ptr_mauler_bw.png",
			Const = "PTRMauler"
		},
		{
			ID = "perk.ptr_take_aim",
			Script = "scripts/skills/perks/perk_ptr_take_aim",
			Name = this.Const.Strings.PerkName.PTRTakeAim,
			Tooltip = this.Const.Strings.PerkDescription.PTRTakeAim,
			Icon = "ui/perks/ptr_take_aim.png",
			IconDisabled = "ui/perks/ptr_take_aim_bw.png",
			Const = "PTRTakeAim"
		},
		{
			ID = "perk.ptr_entrenched",
			Script = "scripts/skills/perks/perk_ptr_entrenched",
			Name = this.Const.Strings.PerkName.PTREntrenched,
			Tooltip = this.Const.Strings.PerkDescription.PTREntrenched,
			Icon = "ui/perks/ptr_entrenched.png",
			IconDisabled = "ui/perks/ptr_entrenched_bw.png",
			Const = "PTREntrenched"
		},
		{
			ID = "perk.ptr_power_shot",
			Script = "scripts/skills/perks/perk_ptr_power_shot",
			Name = this.Const.Strings.PerkName.PTRPowerShot,
			Tooltip = this.Const.Strings.PerkDescription.PTRPowerShot,
			Icon = "ui/perks/ptr_power_shot.png",
			IconDisabled = "ui/perks/ptr_power_shot_bw.png",
			Const = "PTRPowerShot"
		},
		{
			ID = "perk.ptr_iron_sights",
			Script = "scripts/skills/perks/perk_ptr_iron_sights",
			Name = this.Const.Strings.PerkName.PTRIronSights,
			Tooltip = this.Const.Strings.PerkDescription.PTRIronSights,
			Icon = "ui/perks/ptr_iron_sights.png",
			IconDisabled = "ui/perks/ptr_iron_sights_bw.png",
			Const = "PTRIronSights"
		},
		{
			ID = "perk.ptr_muscle_memory",
			Script = "scripts/skills/perks/perk_ptr_muscle_memory",
			Name = this.Const.Strings.PerkName.PTRMuscleMemory,
			Tooltip = this.Const.Strings.PerkDescription.PTRMuscleMemory,
			Icon = "ui/perks/ptr_muscle_memory.png",
			IconDisabled = "ui/perks/ptr_muscle_memory_bw.png",
			Const = "PTRMuscleMemory"
		},
		{
			ID = "perk.ptr_between_the_ribs",
			Script = "scripts/skills/perks/perk_ptr_between_the_ribs",
			Name = this.Const.Strings.PerkName.PTRBetweenTheRibs,
			Tooltip = this.Const.Strings.PerkDescription.PTRBetweenTheRibs,
			Icon = "ui/perks/ptr_between_the_ribs.png",
			IconDisabled = "ui/perks/ptr_between_the_ribs_bw.png",
			Const = "PTRBetweenTheRibs"
		},
		{
			ID = "perk.ptr_light_weapon",
			Script = "scripts/skills/perks/perk_ptr_light_weapon",
			Name = this.Const.Strings.PerkName.PTRLightWeapon,
			Tooltip = this.Const.Strings.PerkDescription.PTRLightWeapon,
			Icon = "ui/perks/ptr_light_weapon.png",
			IconDisabled = "ui/perks/ptr_light_weapon_bw.png",
			Const = "PTRLightWeapon"
		},
		{
			ID = "perk.ptr_swift_stabs",
			Script = "scripts/skills/perks/perk_ptr_swift_stabs",
			Name = this.Const.Strings.PerkName.PTRSwiftStabs,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwiftStabs,
			Icon = "ui/perks/ptr_swift_stabs.png",
			IconDisabled = "ui/perks/ptr_swift_stabs_bw.png",
			Const = "PTRSwiftStabs"
		},
		{
			ID = "perk.ptr_small_target",
			Script = "scripts/skills/perks/perk_ptr_small_target",
			Name = this.Const.Strings.PerkName.PTRSmallTarget,
			Tooltip = this.Const.Strings.PerkDescription.PTRSmallTarget,
			Icon = "ui/perks/ptr_small_target.png",
			IconDisabled = "ui/perks/ptr_small_target_bw.png",
			Const = "PTRSmallTarget"
		},
		{
			ID = "perk.ptr_head_smasher",
			Script = "scripts/skills/perks/perk_ptr_head_smasher",
			Name = this.Const.Strings.PerkName.PTRHeadSmasher,
			Tooltip = this.Const.Strings.PerkDescription.PTRHeadSmasher,
			Icon = "ui/perks/ptr_head_smasher.png",
			IconDisabled = "ui/perks/ptr_head_smasher_bw.png",
			Const = "PTRHeadSmasher"
		},
		{
			ID = "perk.ptr_flail_spinner",
			Script = "scripts/skills/perks/perk_ptr_flail_spinner",
			Name = this.Const.Strings.PerkName.PTRFlailSpinner,
			Tooltip = this.Const.Strings.PerkDescription.PTRFlailSpinner,
			Icon = "ui/perks/ptr_flail_spinner.png",
			IconDisabled = "ui/perks/ptr_flail_spinner_bw.png",
			Const = "PTRFlailSpinner"
		},
		{
			ID = "perk.ptr_deadly_precision",
			Script = "scripts/skills/perks/perk_ptr_deadly_precision",
			Name = this.Const.Strings.PerkName.PTRDeadlyPrecision,
			Tooltip = this.Const.Strings.PerkDescription.PTRDeadlyPrecision,
			Icon = "ui/perks/ptr_deadly_precision.png",
			IconDisabled = "ui/perks/ptr_deadly_precision_bw.png",
			Const = "PTRDeadlyPrecision"
		},
		{
			ID = "perk.ptr_from_all_sides",
			Script = "scripts/skills/perks/perk_ptr_from_all_sides",
			Name = this.Const.Strings.PerkName.PTRFromAllSides,
			Tooltip = this.Const.Strings.PerkDescription.PTRFromAllSides,
			Icon = "ui/perks/ptr_from_all_sides.png",
			IconDisabled = "ui/perks/ptr_from_all_sides_bw.png",
			Const = "PTRFromAllSides"
		},
		{
			ID = "perk.ptr_rattle",
			Script = "scripts/skills/perks/perk_ptr_rattle",
			Name = this.Const.Strings.PerkName.PTRRattle,
			Tooltip = this.Const.Strings.PerkDescription.PTRRattle,
			Icon = "ui/perks/ptr_rattle.png",
			IconDisabled = "ui/perks/ptr_rattle_bw.png",
			Const = "PTRRattle"
		},
		{
			ID = "perk.ptr_deep_impact",
			Script = "scripts/skills/perks/perk_ptr_deep_impact",
			Name = this.Const.Strings.PerkName.PTRDeepImpact,
			Tooltip = this.Const.Strings.PerkDescription.PTRDeepImpact,
			Icon = "ui/perks/ptr_deep_impact.png",
			IconDisabled = "ui/perks/ptr_deep_impact_bw.png",
			Const = "PTRDeepImpact"
		},
		{
			ID = "perk.ptr_soft_metal",
			Script = "scripts/skills/perks/perk_ptr_soft_metal",
			Name = this.Const.Strings.PerkName.PTRSoftMetal,
			Tooltip = this.Const.Strings.PerkDescription.PTRSoftMetal,
			Icon = "ui/perks/ptr_soft_metal.png",
			IconDisabled = "ui/perks/ptr_soft_metal_bw.png",
			Const = "PTRSoftMetal"
		},
		{
			ID = "perk.ptr_dismantle",
			Script = "scripts/skills/perks/perk_ptr_dismantle",
			Name = this.Const.Strings.PerkName.PTRDismantle,
			Tooltip = this.Const.Strings.PerkDescription.PTRDismantle,
			Icon = "ui/perks/ptr_dismantle.png",
			IconDisabled = "ui/perks/ptr_dismantle_bw.png",
			Const = "PTRDismantle"
		},
		{
			ID = "perk.ptr_dent_armor",
			Script = "scripts/skills/perks/perk_ptr_dent_armor",
			Name = this.Const.Strings.PerkName.PTRDentArmor,
			Tooltip = this.Const.Strings.PerkDescription.PTRDentArmor,
			Icon = "ui/perks/ptr_dent_armor.png",
			IconDisabled = "ui/perks/ptr_dent_armor_bw.png",
			Const = "PTRDentArmor"
		},
		{
			ID = "perk.ptr_push_it",
			Script = "scripts/skills/perks/perk_ptr_push_it",
			Name = this.Const.Strings.PerkName.PTRPushIt,
			Tooltip = this.Const.Strings.PerkDescription.PTRPushIt,
			Icon = "ui/perks/ptr_push_it.png",
			IconDisabled = "ui/perks/ptr_push_it_bw.png",
			Const = "PTRPushIt"
		},
		{
			ID = "perk.ptr_heavy_strikes",
			Script = "scripts/skills/perks/perk_ptr_heavy_strikes",
			Name = this.Const.Strings.PerkName.PTRHeavyStrikes,
			Tooltip = this.Const.Strings.PerkDescription.PTRHeavyStrikes,
			Icon = "ui/perks/ptr_heavy_strikes.png",
			IconDisabled = "ui/perks/ptr_heavy_strikes_bw.png",
			Const = "PTRHeavyStrikes"
		},
		{
			ID = "perk.ptr_bear_down",
			Script = "scripts/skills/perks/perk_ptr_bear_down",
			Name = this.Const.Strings.PerkName.PTRBearDown,
			Tooltip = this.Const.Strings.PerkDescription.PTRBearDown,
			Icon = "ui/perks/ptr_bear_down.png",
			IconDisabled = "ui/perks/ptr_bear_down_bw.png",
			Const = "PTRBearDown"
		},
		{
			ID = "perk.ptr_concussive_strikes",
			Script = "scripts/skills/perks/perk_ptr_concussive_strikes",
			Name = this.Const.Strings.PerkName.PTRConcussiveStrikes,
			Tooltip = this.Const.Strings.PerkDescription.PTRConcussiveStrikes,
			Icon = "ui/perks/ptr_concussive_strikes.png",
			IconDisabled = "ui/perks/ptr_concussive_strikes_bw.png",
			Const = "PTRConcussiveStrikes"
		},
		{
			ID = "perk.ptr_bone_breaker",
			Script = "scripts/skills/perks/perk_ptr_bone_breaker",
			Name = this.Const.Strings.PerkName.PTRBoneBreaker,
			Tooltip = this.Const.Strings.PerkDescription.PTRBoneBreaker,
			Icon = "ui/perks/ptr_bone_breaker.png",
			IconDisabled = "ui/perks/ptr_bone_breaker_bw.png",
			Const = "PTRBoneBreaker"
		},
		{
			ID = "perk.ptr_bolster",
			Script = "scripts/skills/perks/perk_ptr_bolster",
			Name = this.Const.Strings.PerkName.PTRBolster,
			Tooltip = this.Const.Strings.PerkDescription.PTRBolster,
			Icon = "ui/perks/ptr_bolster.png",
			IconDisabled = "ui/perks/ptr_bolster_bw.png",
			Const = "PTRBolster"
		},
		{
			ID = "perk.ptr_leverage",
			Script = "scripts/skills/perks/perk_ptr_leverage",
			Name = this.Const.Strings.PerkName.PTRLeverage,
			Tooltip = this.Const.Strings.PerkDescription.PTRLeverage,
			Icon = "ui/perks/ptr_leverage.png",
			IconDisabled = "ui/perks/ptr_leverage_bw.png",
			Const = "PTRLeverage"
		},
		{
			ID = "perk.ptr_intimidate",
			Script = "scripts/skills/perks/perk_ptr_intimidate",
			Name = this.Const.Strings.PerkName.PTRIntimidate,
			Tooltip = this.Const.Strings.PerkDescription.PTRIntimidate,
			Icon = "ui/perks/ptr_intimidate.png",
			IconDisabled = "ui/perks/ptr_intimidate_bw.png",
			Const = "PTRIntimidate"
		},
		{
			ID = "perk.ptr_formidable_approach",
			Script = "scripts/skills/perks/perk_ptr_formidable_approach",
			Name = this.Const.Strings.PerkName.PTRFormidableApproach,
			Tooltip = this.Const.Strings.PerkDescription.PTRFormidableApproach,
			Icon = "ui/perks/ptr_formidable_approach.png",
			IconDisabled = "ui/perks/ptr_formidable_approach_bw.png",
			Const = "PTRFormidableApproach"
		},
		{
			ID = "perk.ptr_follow_up",
			Script = "scripts/skills/perks/perk_ptr_follow_up",
			Name = this.Const.Strings.PerkName.PTRFollowUp,
			Tooltip = this.Const.Strings.PerkDescription.PTRFollowUp,
			Icon = "ui/perks/ptr_follow_up.png",
			IconDisabled = "ui/perks/ptr_follow_up_bw.png",
			Const = "PTRFollowUp"
		},
		{
			ID = "perk.ptr_long_reach",
			Script = "scripts/skills/perks/perk_ptr_long_reach",
			Name = this.Const.Strings.PerkName.PTRLongReach,
			Tooltip = this.Const.Strings.PerkDescription.PTRLongReach,
			Icon = "ui/perks/ptr_long_reach.png",
			IconDisabled = "ui/perks/ptr_long_reach_bw.png",
			Const = "PTRLongReach"
		},
		{
			ID = "perk.ptr_patience",
			Script = "scripts/skills/perks/perk_ptr_patience",
			Name = this.Const.Strings.PerkName.PTRPatience,
			Tooltip = this.Const.Strings.PerkDescription.PTRPatience,
			Icon = "ui/perks/ptr_patience.png",
			IconDisabled = "ui/perks/ptr_patience_bw.png",
			Const = "PTRPatience"
		},
		{
			ID = "perk.ptr_heavy_projectiles",
			Script = "scripts/skills/perks/perk_ptr_heavy_projectiles",
			Name = this.Const.Strings.PerkName.PTRHeavyProjectiles,
			Tooltip = this.Const.Strings.PerkDescription.PTRHeavyProjectiles,
			Icon = "ui/perks/ptr_heavy_projectiles.png",
			IconDisabled = "ui/perks/ptr_heavy_projectiles_bw.png",
			Const = "PTRHeavyProjectiles"
		},
		{
			ID = "perk.ptr_pointy_end",
			Script = "scripts/skills/perks/perk_ptr_pointy_end",
			Name = this.Const.Strings.PerkName.PTRPointyEnd,
			Tooltip = this.Const.Strings.PerkDescription.PTRPointyEnd,
			Icon = "ui/perks/ptr_pointy_end.png",
			IconDisabled = "ui/perks/ptr_pointy_end_bw.png",
			Const = "PTRPointyEnd"
		},
		{
			ID = "perk.ptr_through_the_gaps",
			Script = "scripts/skills/perks/perk_ptr_through_the_gaps",
			Name = this.Const.Strings.PerkName.PTRThroughTheGaps,
			Tooltip = this.Const.Strings.PerkDescription.PTRThroughTheGaps,
			Icon = "ui/perks/ptr_through_the_gaps.png",
			IconDisabled = "ui/perks/ptr_through_the_gaps_bw.png",
			Const = "PTRThroughTheGaps"
		},
		{
			ID = "perk.ptr_two_for_one",
			Script = "scripts/skills/perks/perk_ptr_two_for_one",
			Name = this.Const.Strings.PerkName.PTRTwoForOne,
			Tooltip = this.Const.Strings.PerkDescription.PTRTwoForOne,
			Icon = "ui/perks/ptr_two_for_one.png",
			IconDisabled = "ui/perks/ptr_two_for_one_bw.png",
			Const = "PTRTwoForOne"
		},
		{
			ID = "perk.ptr_a_better_grip",
			Script = "scripts/skills/perks/perk_ptr_a_better_grip",
			Name = this.Const.Strings.PerkName.PTRABetterGrip,
			Tooltip = this.Const.Strings.PerkDescription.PTRABetterGrip,
			Icon = "ui/perks/ptr_a_better_grip.png",
			IconDisabled = "ui/perks/ptr_a_better_grip_bw.png",
			Const = "PTRABetterGrip"
		},
		{
			ID = "perk.ptr_king_of_all_weapons",
			Script = "scripts/skills/perks/perk_ptr_king_of_all_weapons",
			Name = this.Const.Strings.PerkName.PTRKingOfAllWeapons,
			Tooltip = this.Const.Strings.PerkDescription.PTRKingOfAllWeapons,
			Icon = "ui/perks/ptr_king_of_all_weapons.png",
			IconDisabled = "ui/perks/ptr_king_of_all_weapons_bw.png",
			Const = "PTRKingOfAllWeapons"
		},
		{
			ID = "perk.ptr_easy_target",
			Script = "scripts/skills/perks/perk_ptr_easy_target",
			Name = this.Const.Strings.PerkName.PTREasyTarget,
			Tooltip = this.Const.Strings.PerkDescription.PTREasyTarget,
			Icon = "ui/perks/ptr_easy_target.png",
			IconDisabled = "ui/perks/ptr_easy_target_bw.png",
			Const = "PTREasyTarget"
		},
		{
			ID = "perk.ptr_wear_them_down",
			Script = "scripts/skills/perks/perk_ptr_wear_them_down",
			Name = this.Const.Strings.PerkName.PTRWearThemDown,
			Tooltip = this.Const.Strings.PerkDescription.PTRWearThemDown,
			Icon = "ui/perks/ptr_wear_them_down.png",
			IconDisabled = "ui/perks/ptr_wear_them_down_bw.png",
			Const = "PTRWearThemDown"
		},
		{
			ID = "perk.ptr_whack_a_smack",
			Script = "scripts/skills/perks/perk_ptr_whack_a_smack",
			Name = this.Const.Strings.PerkName.PTRWhackASmack,
			Tooltip = this.Const.Strings.PerkDescription.PTRWhackASmack,
			Icon = "ui/perks/ptr_whack_a_smack.png",
			IconDisabled = "ui/perks/ptr_whack_a_smack_bw.png",
			Const = "PTRWhackASmack"
		},
		{
			ID = "perk.ptr_fluid_weapon",
			Script = "scripts/skills/perks/perk_ptr_fluid_weapon",
			Name = this.Const.Strings.PerkName.PTRFluidWeapon,
			Tooltip = this.Const.Strings.PerkDescription.PTRFluidWeapon,
			Icon = "ui/perks/ptr_fluid_weapon.png",
			IconDisabled = "ui/perks/ptr_fluid_weapon_bw.png",
			Const = "PTRFluidWeapon"
		},
		{
			ID = "perk.ptr_bloody_harvest",
			Script = "scripts/skills/perks/perk_ptr_bloody_harvest",
			Name = this.Const.Strings.PerkName.PTRBloodyHarvest,
			Tooltip = this.Const.Strings.PerkDescription.PTRBloodyHarvest,
			Icon = "ui/perks/ptr_bloody_harvest.png",
			IconDisabled = "ui/perks/ptr_bloody_harvest_bw.png",
			Const = "PTRBloodyHarvest"
		},
		{
			ID = "perk.ptr_sweeping_strikes",
			Script = "scripts/skills/perks/perk_ptr_sweeping_strikes",
			Name = this.Const.Strings.PerkName.PTRSweepingStrikes,
			Tooltip = this.Const.Strings.PerkDescription.PTRSweepingStrikes,
			Icon = "ui/perks/ptr_sweeping_strikes.png",
			IconDisabled = "ui/perks/ptr_sweeping_strikes_bw.png",
			Const = "PTRSweepingStrikes"
		},
		{
			ID = "perk.ptr_hybridization",
			Script = "scripts/skills/perks/perk_ptr_hybridization",
			Name = this.Const.Strings.PerkName.PTRHybridization,
			Tooltip = this.Const.Strings.PerkDescription.PTRHybridization,
			Icon = "ui/perks/ptr_hybridization.png",
			IconDisabled = "ui/perks/ptr_hybridization_bw.png",
			Const = "PTRHybridization"
		},
		{
			ID = "perk.ptr_momentum",
			Script = "scripts/skills/perks/perk_ptr_momentum",
			Name = this.Const.Strings.PerkName.PTRMomentum,
			Tooltip = this.Const.Strings.PerkDescription.PTRMomentum,
			Icon = "ui/perks/ptr_momentum.png",
			IconDisabled = "ui/perks/ptr_momentum_bw.png",
			Const = "PTRMomentum"
		},
		{
			ID = "perk.ptr_opportunist",
			Script = "scripts/skills/perks/perk_ptr_opportunist",
			Name = this.Const.Strings.PerkName.PTROpportunist,
			Tooltip = this.Const.Strings.PerkDescription.PTROpportunist,
			Icon = "ui/perks/ptr_opportunist.png",
			IconDisabled = "ui/perks/ptr_opportunist_bw.png",
			Const = "PTROpportunist"
		},
		{
			ID = "perk.ptr_nailed_it",
			Script = "scripts/skills/perks/perk_ptr_nailed_it",
			Name = this.Const.Strings.PerkName.PTRNailedIt,
			Tooltip = this.Const.Strings.PerkDescription.PTRNailedIt,
			Icon = "ui/perks/ptr_nailed_it.png",
			IconDisabled = "ui/perks/ptr_nailed_it_bw.png",
			Const = "PTRNailedIt"
		},
		{
			ID = "perk.ptr_fresh_and_furious",
			Script = "scripts/skills/perks/perk_ptr_fresh_and_furious",
			Name = this.Const.Strings.PerkName.PTRFreshAndFurious,
			Tooltip = this.Const.Strings.PerkDescription.PTRFreshAndFurious,
			Icon = "ui/perks/ptr_fresh_and_furious.png",
			IconDisabled = "ui/perks/ptr_fresh_and_furious_bw.png",
			Const = "PTRFreshAndFurious"
		},
		{
			ID = "perk.ptr_unstoppable",
			Script = "scripts/skills/perks/perk_ptr_unstoppable",
			Name = this.Const.Strings.PerkName.PTRUnstoppable,
			Tooltip = this.Const.Strings.PerkDescription.PTRUnstoppable,
			Icon = "ui/perks/ptr_unstoppable.png",
			IconDisabled = "ui/perks/ptr_unstoppable_bw.png",
			Const = "PTRUnstoppable"
		},
		{
			ID = "perk.ptr_know_their_weakness",
			Script = "scripts/skills/perks/perk_ptr_know_their_weakness",
			Name = this.Const.Strings.PerkName.PTRKnowTheirWeakness,
			Tooltip = this.Const.Strings.PerkDescription.PTRKnowTheirWeakness,
			Icon = "ui/perks/ptr_know_their_weakness.png",
			IconDisabled = "ui/perks/ptr_know_their_weakness_bw.png",
			Const = "PTRKnowTheirWeakness"
		},
		{
			ID = "perk.ptr_the_rush_of_battle",
			Script = "scripts/skills/perks/perk_ptr_the_rush_of_battle",
			Name = this.Const.Strings.PerkName.PTRTheRushOfBattle,
			Tooltip = this.Const.Strings.PerkDescription.PTRTheRushOfBattle,
			Icon = "ui/perks/ptr_the_rush_of_battle.png",
			IconDisabled = "ui/perks/ptr_the_rush_of_battle_bw.png",
			Const = "PTRTheRushOfBattle"
		},
		{
			ID = "perk.ptr_personal_armor",
			Script = "scripts/skills/perks/perk_ptr_personal_armor",
			Name = this.Const.Strings.PerkName.PTRPersonalArmor,
			Tooltip = this.Const.Strings.PerkDescription.PTRPersonalArmor,
			Icon = "ui/perks/ptr_personal_armor.png",
			IconDisabled = "ui/perks/ptr_personal_armor_bw.png",
			Const = "PTRPersonalArmor"
		},
		{
			ID = "perk.ptr_strength_in_numbers",
			Script = "scripts/skills/perks/perk_ptr_strength_in_numbers",
			Name = this.Const.Strings.PerkName.PTRStrengthInNumbers,
			Tooltip = this.Const.Strings.PerkDescription.PTRStrengthInNumbers,
			Icon = "ui/perks/ptr_strength_in_numbers.png",
			IconDisabled = "ui/perks/ptr_strength_in_numbers_bw.png",
			Const = "PTRStrengthInNumbers"
		},
		{
			ID = "perk.ptr_tunnel_vision",
			Script = "scripts/skills/perks/perk_ptr_tunnel_vision",
			Name = this.Const.Strings.PerkName.PTRTunnelVision,
			Tooltip = this.Const.Strings.PerkDescription.PTRTunnelVision,
			Icon = "ui/perks/ptr_tunnel_vision.png",
			IconDisabled = "ui/perks/ptr_tunnel_vision_bw.png",
			Const = "PTRTunnelVision"
		},
		{
			ID = "perk.ptr_versatile_weapon",
			Script = "scripts/skills/perks/perk_ptr_versatile_weapon",
			Name = this.Const.Strings.PerkName.PTRVersatileWeapon,
			Tooltip = this.Const.Strings.PerkDescription.PTRVersatileWeapon,
			Icon = "ui/perks/ptr_versatile_weapon.png",
			IconDisabled = "ui/perks/ptr_versatile_weapon_bw.png",
			Const = "PTRVersatileWeapon"
		},
		{
			ID = "perk.ptr_tempo",
			Script = "scripts/skills/perks/perk_ptr_tempo",
			Name = this.Const.Strings.PerkName.PTRTempo,
			Tooltip = this.Const.Strings.PerkDescription.PTRTempo,
			Icon = "ui/perks/ptr_tempo.png",
			IconDisabled = "ui/perks/ptr_tempo_bw.png",
			Const = "PTRTempo"
		},
		{
			ID = "perk.ptr_kata",
			Script = "scripts/skills/perks/perk_ptr_kata",
			Name = this.Const.Strings.PerkName.PTRKata,
			Tooltip = this.Const.Strings.PerkDescription.PTRKata,
			Icon = "ui/perks/ptr_kata.png",
			IconDisabled = "ui/perks/ptr_kata_bw.png",
			Const = "PTRKata"
		},
		{
			ID = "perk.ptr_en_garde",
			Script = "scripts/skills/perks/perk_ptr_en_garde",
			Name = this.Const.Strings.PerkName.PTREnGarde,
			Tooltip = this.Const.Strings.PerkDescription.PTREnGarde,
			Icon = "ui/perks/ptr_en_garde.png",
			IconDisabled = "ui/perks/ptr_en_garde_bw.png",
			Const = "PTREnGarde"
		},
		{
			ID = "perk.ptr_ranged_supremacy",
			Script = "scripts/skills/perks/perk_ptr_ranged_supremacy",
			Name = this.Const.Strings.PerkName.PTRRangedSupremacy,
			Tooltip = this.Const.Strings.PerkDescription.PTRRangedSupremacy,
			Icon = "ui/perks/ptr_ranged_supremacy.png",
			IconDisabled = "ui/perks/ptr_ranged_supremacy_bw.png",
			Const = "PTRRangedSupremacy"
		},
		{
			ID = "perk.ptr_marksmanship",
			Script = "scripts/skills/perks/perk_ptr_marksmanship",
			Name = this.Const.Strings.PerkName.PTRMarksmanship,
			Tooltip = this.Const.Strings.PerkDescription.PTRMarksmanship,
			Icon = "ui/perks/ptr_marksmanship.png",
			IconDisabled = "ui/perks/ptr_marksmanship_bw.png",
			Const = "PTRMarksmanship"
		},
		{
			ID = "perk.ptr_rising_star",
			Script = "scripts/skills/perks/perk_ptr_rising_star",
			Name = this.Const.Strings.PerkName.PTRRisingStar,
			Tooltip = this.Const.Strings.PerkDescription.PTRRisingStar,
			Icon = "ui/perks/ptr_rising_star.png",
			IconDisabled = "ui/perks/ptr_rising_star_bw.png",
			Const = "PTRRisingStar"
		},
		{
			ID = "perk.ptr_target_practice",
			Script = "scripts/skills/perks/perk_ptr_target_practice",
			Name = this.Const.Strings.PerkName.PTRTargetPractice,
			Tooltip = this.Const.Strings.PerkDescription.PTRTargetPractice,
			Icon = "ui/perks/ptr_target_practice.png",
			IconDisabled = "ui/perks/ptr_target_practice_bw.png",
			Const = "PTRTargetPractice"
		},
		{
			ID = "perk.ptr_swordlike",
			Script = "scripts/skills/perks/perk_ptr_swordlike",
			Name = this.Const.Strings.PerkName.PTRSwordlike,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordlike,
			Icon = "ui/perks/ptr_swordlike.png",
			IconDisabled = "ui/perks/ptr_swordlike_bw.png",
			Const = "PTRSwordlike"
		},
		{
			ID = "perk.ptr_sanguinary",
			Script = "scripts/skills/perks/perk_ptr_sanguinary",
			Name = this.Const.Strings.PerkName.PTRSanguinary,
			Tooltip = this.Const.Strings.PerkDescription.PTRSanguinary,
			Icon = "ui/perks/ptr_sanguinary.png",
			IconDisabled = "ui/perks/ptr_sanguinary_bw.png",
			Const = "PTRSanguinary"
		},
		{
			ID = "perk.ptr_discovered_talent",
			Script = "scripts/skills/perks/perk_ptr_discovered_talent",
			Name = this.Const.Strings.PerkName.PTRDiscoveredTalent,
			Tooltip = this.Const.Strings.PerkDescription.PTRDiscoveredTalent,
			Icon = "ui/perks/ptr_discovered_talent.png",
			IconDisabled = "ui/perks/ptr_discovered_talent_bw.png",
			Const = "PTRDiscoveredTalent"
		},
		{
			ID = "perk.ptr_survival_instinct",
			Script = "scripts/skills/perks/perk_ptr_survival_instinct",
			Name = this.Const.Strings.PerkName.PTRSurvivalInstinct,
			Tooltip = this.Const.Strings.PerkDescription.PTRSurvivalInstinct,
			Icon = "ui/perks/ptr_survival_instinct.png",
			IconDisabled = "ui/perks/ptr_survival_instinct_bw.png",
			Const = "PTRSurvivalInstinct"
		},
		{
			ID = "perk.ptr_utilitarian",
			Script = "scripts/skills/perks/perk_ptr_utilitarian",
			Name = this.Const.Strings.PerkName.PTRUtilitarian,
			Tooltip = this.Const.Strings.PerkDescription.PTRUtilitarian,
			Icon = "ui/perks/ptr_utilitarian.png",
			IconDisabled = "ui/perks/ptr_utilitarian_bw.png",
			Const = "PTRUtilitarian"
		},		
		{
			ID = "perk.ptr_promised_potential",
			Script = "scripts/skills/perks/perk_ptr_promised_potential",
			Name = this.Const.Strings.PerkName.PTRPromisedPotential,
			Tooltip = this.Const.Strings.PerkDescription.PTRPromisedPotential,
			Icon = "ui/perks/ptr_promised_potential.png",
			IconDisabled = "ui/perks/ptr_promised_potential_bw.png",
			Const = "PTRPromisedPotential"
		},
		{
			ID = "perk.ptr_punching_bag",
			Script = "scripts/skills/perks/perk_ptr_punching_bag",
			Name = this.Const.Strings.PerkName.PTRPunchingBag,
			Tooltip = this.Const.Strings.PerkDescription.PTRPunchingBag,
			Icon = "ui/perks/ptr_punching_bag.png",
			IconDisabled = "ui/perks/ptr_punching_bag_bw.png",
			Const = "PTRPunchingBag"
		},
		{
			ID = "perk.ptr_trauma_survivor",
			Script = "scripts/skills/perks/perk_ptr_trauma_survivor",
			Name = this.Const.Strings.PerkName.PTRTraumaSurvivor,
			Tooltip = this.Const.Strings.PerkDescription.PTRTraumaSurvivor,
			Icon = "ui/perks/ptr_trauma_survivor.png",
			IconDisabled = "ui/perks/ptr_trauma_survivor_bw.png",
			Const = "PTRTraumaSurvivor"
		},
		{
			ID = "perk.ptr_man_of_steel",
			Script = "scripts/skills/perks/perk_ptr_man_of_steel",
			Name = this.Const.Strings.PerkName.PTRManOfSteel,
			Tooltip = this.Const.Strings.PerkDescription.PTRManOfSteel,
			Icon = "ui/perks/ptr_man_of_steel.png",
			IconDisabled = "ui/perks/ptr_man_of_steel_bw.png",
			Const = "PTRManOfSteel"
		},
		{
			ID = "perk.ptr_fruits_of_labor",
			Script = "scripts/skills/perks/perk_ptr_fruits_of_labor",
			Name = this.Const.Strings.PerkName.PTRFruitsOfLabor,
			Tooltip = this.Const.Strings.PerkDescription.PTRFruitsOfLabor,
			Icon = "ui/perks/ptr_fruits_of_labor.png",
			IconDisabled = "ui/perks/ptr_fruits_of_labor_bw.png",
			Const = "PTRFruitsOfLabor"
		},
		{
			ID = "perk.ptr_professional",
			Script = "scripts/skills/perks/perk_ptr_professional",
			Name = this.Const.Strings.PerkName.PTRProfessional,
			Tooltip = this.Const.Strings.PerkDescription.PTRProfessional,
			Icon = "ui/perks/ptr_professional.png",
			IconDisabled = "ui/perks/ptr_professional_bw.png",
			Const = "PTRProfessional"
		},
		{
			ID = "perk.ptr_offhand_training",
			Script = "scripts/skills/perks/perk_ptr_offhand_training",
			Name = this.Const.Strings.PerkName.PTROffhandTraining,
			Tooltip = this.Const.Strings.PerkDescription.PTROffhandTraining,
			Icon = "ui/perks/ptr_offhand_training.png",
			IconDisabled = "ui/perks/ptr_offhand_training_bw.png",
			Const = "PTROffhandTraining"
		},
		{
			ID = "perk.ptr_exude_confidence",
			Script = "scripts/skills/perks/perk_ptr_exude_confidence",
			Name = this.Const.Strings.PerkName.PTRExudeConfidence,
			Tooltip = this.Const.Strings.PerkDescription.PTRExudeConfidence,
			Icon = "ui/perks/ptr_exude_confidence.png",
			IconDisabled = "ui/perks/ptr_exude_confidence_bw.png",
			Const = "PTRExudeConfidence"
		},
		{
			ID = "perk.ptr_exploit_opening",
			Script = "scripts/skills/perks/perk_ptr_exploit_opening",
			Name = this.Const.Strings.PerkName.PTRExploitOpening,
			Tooltip = this.Const.Strings.PerkDescription.PTRExploitOpening,
			Icon = "ui/perks/ptr_exploit_opening.png",
			IconDisabled = "ui/perks/ptr_exploit_opening_bw.png",
			Const = "PTRExploitOpening"
		},
		{
			ID = "perk.ptr_pattern_recognition",
			Script = "scripts/skills/perks/perk_ptr_pattern_recognition",
			Name = this.Const.Strings.PerkName.PTRPatternRecognition,
			Tooltip = this.Const.Strings.PerkDescription.PTRPatternRecognition,
			Icon = "ui/perks/ptr_pattern_recognition.png",
			IconDisabled = "ui/perks/ptr_pattern_recognition_bw.png",
			Const = "PTRPatternRecognition"
		},
		{
			ID = "perk.ptr_weapon_master",
			Script = "scripts/skills/perks/perk_ptr_weapon_master",
			Name = this.Const.Strings.PerkName.PTRWeaponMaster,
			Tooltip = this.Const.Strings.PerkDescription.PTRWeaponMaster,
			Icon = "ui/perks/ptr_weapon_master.png",
			IconDisabled = "ui/perks/ptr_weapon_master_bw.png",
			Const = "PTRWeaponMaster"
		},
		{
			ID = "perk.ptr_bully",
			Script = "scripts/skills/perks/perk_ptr_bully",
			Name = this.Const.Strings.PerkName.PTRBully,
			Tooltip = this.Const.Strings.PerkDescription.PTRBully,
			Icon = "ui/perks/ptr_bully.png",
			IconDisabled = "ui/perks/ptr_bully_bw.png",
			Const = "PTRBully"
		},
		{
			ID = "perk.ptr_vigilant",
			Script = "scripts/skills/perks/perk_ptr_vigilant",
			Name = this.Const.Strings.PerkName.PTRVigilant,
			Tooltip = this.Const.Strings.PerkDescription.PTRVigilant,
			Icon = "ui/perks/ptr_vigilant.png",
			IconDisabled = "ui/perks/ptr_vigilant_bw.png",
			Const = "PTRVigilant"
		},
		{
			ID = "perk.ptr_wears_it_well",
			Script = "scripts/skills/perks/perk_ptr_wears_it_well",
			Name = this.Const.Strings.PerkName.PTRWearsItWell,
			Tooltip = this.Const.Strings.PerkDescription.PTRWearsItWell,
			Icon = "ui/perks/ptr_wears_it_well.png",
			IconDisabled = "ui/perks/ptr_wears_it_well_bw.png",
			Const = "PTRWearsItWell"
		},
		{
			ID = "perk.ptr_menacing",
			Script = "scripts/skills/perks/perk_ptr_menacing",
			Name = this.Const.Strings.PerkName.PTRMenacing,
			Tooltip = this.Const.Strings.PerkDescription.PTRMenacing,
			Icon = "ui/perks/ptr_menacing.png",
			IconDisabled = "ui/perks/ptr_menacing_bw.png",
			Const = "PTRMenacing"
		},
		{
			ID = "perk.ptr_bulwark",
			Script = "scripts/skills/perks/perk_ptr_bulwark",
			Name = this.Const.Strings.PerkName.PTRBulwark,
			Tooltip = this.Const.Strings.PerkDescription.PTRBulwark,
			Icon = "ui/perks/ptr_bulwark.png",
			IconDisabled = "ui/perks/ptr_bulwark_bw.png",
			Const = "PTRBulwark"
		},
		{
			ID = "perk.ptr_always_an_entertainer",
			Script = "scripts/skills/perks/perk_ptr_always_an_entertainer",
			Name = this.Const.Strings.PerkName.PTRAlwaysAnEntertainer,
			Tooltip = this.Const.Strings.PerkDescription.PTRAlwaysAnEntertainer,
			Icon = "ui/perks/ptr_always_an_entertainer.png",
			IconDisabled = "ui/perks/ptr_always_an_entertainer_bw.png",
			Const = "PTRAlwaysAnEntertainer"
		},
		{
			ID = "perk.ptr_paint_a_smile",
			Script = "scripts/skills/perks/perk_ptr_paint_a_smile",
			Name = this.Const.Strings.PerkName.PTRPaintASmile,
			Tooltip = this.Const.Strings.PerkDescription.PTRPaintASmile,
			Icon = "ui/perks/ptr_paint_a_smile.png",
			IconDisabled = "ui/perks/ptr_paint_a_smile_bw.png",
			Const = "PTRPaintASmile"
		},
		{
			ID = "perk.ptr_dynamic_duo",
			Script = "scripts/skills/perks/perk_ptr_dynamic_duo",
			Name = this.Const.Strings.PerkName.PTRDynamicDuo,
			Tooltip = this.Const.Strings.PerkDescription.PTRDynamicDuo,
			Icon = "ui/perks/ptr_dynamic_duo.png",
			IconDisabled = "ui/perks/ptr_dynamic_duo_bw.png",
			Const = "PTRDynamicDuo"
		},
		{
			ID = "perk.ptr_primal_fear",
			Script = "scripts/skills/perks/perk_ptr_primal_fear",
			Name = this.Const.Strings.PerkName.PTRPrimalFear,
			Tooltip = this.Const.Strings.PerkDescription.PTRPrimalFear,
			Icon = "ui/perks/ptr_primal_fear.png",
			IconDisabled = "ui/perks/ptr_primal_fear_bw.png",
			Const = "PTRPrimalFear"
		},
		{
			ID = "perk.ptr_through_the_ranks",
			Script = "scripts/skills/perks/perk_ptr_through_the_ranks",
			Name = this.Const.Strings.PerkName.PTRThroughTheRanks,
			Tooltip = this.Const.Strings.PerkDescription.PTRThroughTheRanks,
			Icon = "ui/perks/ptr_through_the_ranks.png",
			IconDisabled = "ui/perks/ptr_through_the_ranks_bw.png",
			Const = "PTRThroughTheRanks"
		},
		{
			ID = "perk.ptr_vigorous_assault",
			Script = "scripts/skills/perks/perk_ptr_vigorous_assault",
			Name = this.Const.Strings.PerkName.PTRVigorousAssault,
			Tooltip = this.Const.Strings.PerkDescription.PTRVigorousAssault,
			Icon = "ui/perks/ptr_vigorous_assault.png",
			IconDisabled = "ui/perks/ptr_vigorous_assault_bw.png",
			Const = "PTRVigorousAssault"
		},
		{
			ID = "perk.ptr_skirmisher",
			Script = "scripts/skills/perks/perk_ptr_skirmisher",
			Name = this.Const.Strings.PerkName.PTRSkirmisher,
			Tooltip = this.Const.Strings.PerkDescription.PTRSkirmisher,
			Icon = "ui/perks/ptr_skirmisher.png",
			IconDisabled = "ui/perks/ptr_skirmisher_bw.png",
			Const = "PTRSkirmisher"
		},
		{
			ID = "perk.ptr_eyes_up",
			Script = "scripts/skills/perks/perk_ptr_eyes_up",
			Name = this.Const.Strings.PerkName.PTREyesUp,
			Tooltip = this.Const.Strings.PerkDescription.PTREyesUp,
			Icon = "ui/perks/ptr_eyes_up.png",
			IconDisabled = "ui/perks/ptr_eyes_up_bw.png",
			Const = "PTREyesUp"
		},
		{
			ID = "perk.ptr_hale_and_hearty",
			Script = "scripts/skills/perks/perk_ptr_hale_and_hearty",
			Name = this.Const.Strings.PerkName.PTRHaleAndHearty,
			Tooltip = this.Const.Strings.PerkDescription.PTRHaleAndHearty,
			Icon = "ui/perks/ptr_hale_and_hearty.png",
			IconDisabled = "ui/perks/ptr_hale_and_hearty_bw.png",
			Const = "PTRHaleAndHearty"
		},
		{
			ID = "perk.ptr_internal_hemorrhage",
			Script = "scripts/skills/perks/perk_ptr_internal_hemorrhage",
			Name = this.Const.Strings.PerkName.PTRInternalHemorrhage,
			Tooltip = this.Const.Strings.PerkDescription.PTRInternalHemorrhage,
			Icon = "ui/perks/ptr_internal_hemorrhage.png",
			IconDisabled = "ui/perks/ptr_internal_hemorrhage_bw.png",
			Const = "PTRInternalHemorrhage"
		},
		{
			ID = "perk.ptr_blitzkrieg",
			Script = "scripts/skills/perks/perk_ptr_blitzkrieg",
			Name = this.Const.Strings.PerkName.PTRBlitzkrieg,
			Tooltip = this.Const.Strings.PerkDescription.PTRBlitzkrieg,
			Icon = "ui/perks/ptr_blitzkrieg.png",
			IconDisabled = "ui/perks/ptr_blitzkrieg_bw.png",
			Const = "PTRBlitzkrieg"
		},
		{
			ID = "perk.ptr_savage_strength",
			Script = "scripts/skills/perks/perk_ptr_savage_strength",
			Name = this.Const.Strings.PerkName.PTRSavageStrength,
			Tooltip = this.Const.Strings.PerkDescription.PTRSavageStrength,
			Icon = "ui/perks/ptr_savage_strength.png",
			IconDisabled = "ui/perks/ptr_savage_strength_bw.png",
			Const = "PTRSavageStrength"
		},
		{
			ID = "perk.ptr_bestial_vigor",
			Script = "scripts/skills/perks/perk_ptr_bestial_vigor",
			Name = this.Const.Strings.PerkName.PTRBestialVigor,
			Tooltip = this.Const.Strings.PerkDescription.PTRBestialVigor,
			Icon = "ui/perks/ptr_bestial_vigor.png",
			IconDisabled = "ui/perks/ptr_bestial_vigor_bw.png",
			Const = "PTRBestialVigor"
		},
		{
			ID = "perk.ptr_feral_rage",
			Script = "scripts/skills/perks/perk_ptr_feral_rage",
			Name = this.Const.Strings.PerkName.PTRFeralRage,
			Tooltip = this.Const.Strings.PerkDescription.PTRFeralRage,
			Icon = "ui/perks/ptr_feral_rage.png",
			IconDisabled = "ui/perks/ptr_feral_rage_bw.png",
			Const = "PTRFeralRage"
		},
		{
			ID = "perk.ptr_vanguard_deployment",
			Script = "scripts/skills/perks/perk_ptr_vanguard_deployment",
			Name = this.Const.Strings.PerkName.PTRVanguardDeployment,
			Tooltip = this.Const.Strings.PerkDescription.PTRVanguardDeployment,
			Icon = "ui/perks/ptr_vanguard_deployment.png",
			IconDisabled = "ui/perks/ptr_vanguard_deployment_bw.png",
			Const = "PTRVanguardDeployment"
		},
		{
			ID = "perk.ptr_vengeful_spite",
			Script = "scripts/skills/perks/perk_ptr_vengeful_spite",
			Name = this.Const.Strings.PerkName.PTRVengefulSpite,
			Tooltip = this.Const.Strings.PerkDescription.PTRVengefulSpite,
			Icon = "ui/perks/ptr_vengeful_spite.png",
			IconDisabled = "ui/perks/ptr_vengeful_spite_bw.png",
			Const = "PTRVengefulSpite"
		},
		{
			ID = "perk.ptr_family_ties",
			Script = "scripts/skills/perks/perk_ptr_family_ties",
			Name = this.Const.Strings.PerkName.PTRFamilyTies,
			Tooltip = this.Const.Strings.PerkDescription.PTRFamilyTies,
			Icon = "ui/perks/ptr_family_ties.png",
			IconDisabled = "ui/perks/ptr_family_ties_bw.png",
			Const = "PTRFamilyTies"
		},
		{
			ID = "perk.ptr_family_pride",
			Script = "scripts/skills/perks/perk_ptr_family_pride",
			Name = this.Const.Strings.PerkName.PTRFamilyPride,
			Tooltip = this.Const.Strings.PerkDescription.PTRFamilyPride,
			Icon = "ui/perks/ptr_family_pride.png",
			IconDisabled = "ui/perks/ptr_family_pride_bw.png",
			Const = "PTRFamilyPride"
		},
		{
			ID = "perk.ptr_swordmaster_blade_dancer",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_blade_dancer",
			Name = this.Const.Strings.PerkName.PTRSwordmasterBladeDancer,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterBladeDancer,
			Icon = "ui/perks/ptr_swordmaster_blade_dancer.png",
			IconDisabled = "ui/perks/ptr_swordmaster_blade_dancer_bw.png",
			Const = "PTRSwordmasterBladeDancer"
		},
		{
			ID = "perk.ptr_swordmaster_reaper",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_reaper",
			Name = this.Const.Strings.PerkName.PTRSwordmasterReaper,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterReaper,
			Icon = "ui/perks/ptr_swordmaster_reaper.png",
			IconDisabled = "ui/perks/ptr_swordmaster_reaper_bw.png",
			Const = "PTRSwordmasterReaper"
		},
		{
			ID = "perk.ptr_swordmaster_metzger",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_metzger",
			Name = this.Const.Strings.PerkName.PTRSwordmasterMetzger,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterMetzger,
			Icon = "ui/perks/ptr_swordmaster_metzger.png",
			IconDisabled = "ui/perks/ptr_swordmaster_metzger_bw.png",
			Const = "PTRSwordmasterMetzger"
		},
		{
			ID = "perk.ptr_swordmaster_precise",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_precise",
			Name = this.Const.Strings.PerkName.PTRSwordmasterPrecise,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterPrecise,
			Icon = "ui/perks/ptr_swordmaster_precise.png",
			IconDisabled = "ui/perks/ptr_swordmaster_precise_bw.png",
			Const = "PTRSwordmasterPrecise"
		},
		{
			ID = "perk.ptr_swordmaster_versatile_swordsman",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_versatile_swordsman",
			Name = this.Const.Strings.PerkName.PTRSwordmasterVersatileSwordsman,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterVersatileSwordsman,
			Icon = "ui/perks/ptr_swordmaster_versatile_swordsman.png",
			IconDisabled = "ui/perks/ptr_swordmaster_versatile_swordsman_bw.png",
			Const = "PTRSwordmasterVersatileSwordsman"
		},
		{
			ID = "perk.ptr_swordmaster_juggernaut",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_juggernaut",
			Name = this.Const.Strings.PerkName.PTRSwordmasterJuggernaut,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterJuggernaut,
			Icon = "ui/perks/ptr_swordmaster_juggernaut.png",
			IconDisabled = "ui/perks/ptr_swordmaster_juggernaut_bw.png",
			Const = "PTRSwordmasterJuggernaut"
		},
		{
			ID = "perk.ptr_swordmaster_grappler",
			Script = "scripts/skills/perks/perk_ptr_swordmaster_grappler",
			Name = this.Const.Strings.PerkName.PTRSwordmasterGrappler,
			Tooltip = this.Const.Strings.PerkDescription.PTRSwordmasterGrappler,
			Icon = "ui/perks/ptr_swordmaster_grappler.png",
			IconDisabled = "ui/perks/ptr_swordmaster_grappler_bw.png",
			Const = "PTRSwordmasterGrappler"
		}
	];

	this.Const.Perks.addPerkDefObjects(perks);
}
