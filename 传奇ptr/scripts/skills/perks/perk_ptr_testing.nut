this.perk_ptr_testing <- this.inherit("scripts/skills/skill", {
	m = {
		TestSkills = [
			"scripts/skills/perks/perk_ptr_dismemberment",
			"scripts/skills/perks/perk_ptr_heft",
			"scripts/skills/perks/perk_ptr_between_the_eyes",
			"scripts/skills/perks/perk_ptr_cull",

			"scripts/skills/perks/perk_ptr_arrow_to_the_knee",
			"scripts/skills/perks/perk_ptr_ranged_supremacy",
			"scripts/skills/perks/perk_ptr_flaming_arrows",
			"scripts/skills/perks/perk_ptr_hip_shooter",

			"scripts/skills/perks/perk_ptr_deep_cuts",
			"scripts/skills/perks/perk_ptr_bloodlust",
			"scripts/skills/perks/perk_ptr_bloodbath",
			"scripts/skills/perks/perk_ptr_mauler",

			"scripts/skills/perks/perk_ptr_take_aim",
			"scripts/skills/perks/perk_ptr_entrenched",
			"scripts/skills/perks/perk_ptr_power_shot",
			"scripts/skills/perks/perk_ptr_iron_sights",
			"scripts/skills/perks/perk_ptr_muscle_memory",

			"scripts/skills/perks/perk_ptr_between_the_ribs",
			"scripts/skills/perks/perk_ptr_light_weapon",
			"scripts/skills/perks/perk_ptr_swift_stabs",

			"scripts/skills/perks/perk_ptr_small_target",
			"scripts/skills/perks/perk_ptr_head_smasher",
			"scripts/skills/perks/perk_ptr_deadly_precision",
			"scripts/skills/perks/perk_ptr_from_all_sides",
			"scripts/skills/perks/perk_ptr_flail_spinner",

			"scripts/skills/perks/perk_ptr_rattle",
			"scripts/skills/perks/perk_ptr_deep_impact",
			"scripts/skills/perks/perk_ptr_soft_metal",
			"scripts/skills/perks/perk_ptr_dismantle",
			"scripts/skills/perks/perk_ptr_dent_armor",

			"scripts/skills/perks/perk_ptr_push_it",
			"scripts/skills/perks/perk_ptr_heavy_strikes",
			"scripts/skills/perks/perk_ptr_bear_down",
			"scripts/skills/perks/perk_ptr_concussive_strikes",
			"scripts/skills/perks/perk_ptr_bone_breaker",

			"scripts/skills/perks/perk_ptr_bolster",
			"scripts/skills/perks/perk_ptr_leverage",
			"scripts/skills/perks/perk_ptr_formidable_approach",
			"scripts/skills/perks/perk_ptr_follow_up",
			"scripts/skills/perks/perk_ptr_long_reach",

			"scripts/skills/perks/perk_ptr_patience",
			"scripts/skills/perks/perk_ptr_heavy_projectiles",
			"scripts/skills/perks/perk_ptr_death_from_afar",

			"scripts/skills/perks/perk_ptr_pointy_end",
			"scripts/skills/perks/perk_ptr_through_the_gaps",
			"scripts/skills/perks/perk_ptr_two_for_one",
			"scripts/skills/perks/perk_ptr_a_better_grip",
			"scripts/skills/perks/perk_ptr_king_of_all_weapons",

			"scripts/skills/perks/perk_ptr_versatile_weapon",
			"scripts/skills/perks/perk_ptr_fluid_weapon",
			"scripts/skills/perks/perk_ptr_tempo",
			"scripts/skills/perks/perk_ptr_kata",
			"scripts/skills/perks/perk_ptr_en_garde",

			"scripts/skills/perks/perk_ptr_easy_target",
			"scripts/skills/perks/perk_ptr_wear_them_down",
			"scripts/skills/perks/perk_ptr_whack_a_smack",

			"scripts/skills/perks/perk_ptr_hybridization",
			"scripts/skills/perks/perk_ptr_momentum",
			"scripts/skills/perks/perk_ptr_opportunist",
			"scripts/skills/perks/perk_ptr_nailed_it",

			"scripts/skills/perks/perk_reach_advantage",
			"scripts/skills/perks/perk_ptr_bloody_harvest",
			"scripts/skills/perks/perk_ptr_sweeping_strikes",

			"scripts/skills/perks/perk_ptr_fresh_and_furious",
			"scripts/skills/perks/perk_ptr_know_their_weakness",
			"scripts/skills/perks/perk_ptr_personal_armor",
			"scripts/skills/perks/perk_ptr_strength_in_numbers",
			"scripts/skills/perks/perk_ptr_the_rush_of_battle",
			"scripts/skills/perks/perk_ptr_tunnel_vision",
			"scripts/skills/perks/perk_ptr_unstoppable",
		]
	},
	function create()
	{
		this.m.ID = "perk.ptr_testing";
		this.m.Name = this.Const.Strings.PerkName.PTRTesting;
		this.m.Description = this.Const.Strings.PerkDescription.PTRTesting;
		this.m.Icon = "ui/perks/ptr_testing.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();

		/* foreach (skill in this.getContainer().getAllSkillsOfType(this.Const.SkillType.Perk))
		{
			if (skill.getID() != this.getID())
			{
				this.getContainer().removeByID(skill.getID());
			}

		} */

		foreach (skill in this.m.TestSkills)
		{
			actor.getSkills().add(this.new(skill));
		}
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();

		foreach (skill in this.m.TestSkills)
		{
			actor.getSkills().removeByID(skill);
		}
	}
});
