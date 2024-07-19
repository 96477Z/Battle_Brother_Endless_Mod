local gt = this.getroottable();

gt.PTR.modCharacterInjuries <- function()
{
	this.Const.Injury.ExcludedInjuries.add(
		"PTRUndead",
		[
			"injury.bruised_leg",
			"injury.broken_nose",
			"injury.severe_concussion",
			"injury.crushed_windpipe",
			"injury.cut_artery",
			"injury.exposed_ribs",
			"injury.ripped_ear",
			"injury.split_nose",
			"injury.pierced_cheek",
			"injury.grazed_neck",
			"injury.cut_throat",
			"injury.grazed_kidney",
			"injury.pierced_lung",
			"injury.grazed_neck",
			"injury.cut_throat",
			"injury.crushed_windpipe",
			"injury.inhaled_flames"
		]
	);

	this.Const.Injury.ExcludedInjuries.add(
		"PTRSkeleton",
		[
			"injury.sprained_ankle",
			"injury.deep_abdominal_cut",
			"injury.cut_leg_muscles",
			"injury.cut_achilles_tendon",
			"injury.deep_chest_cut",
			"injury.pierced_leg_muscles",
			"injury.pierced_chest",
			"injury.pierced_side",
			"injury.pierced_arm_muscles",
			"injury.stabbed_guts",
		],
		[
			this.Const.Injury.ExcludedInjuries.PTRUndead
		]
	);
}
