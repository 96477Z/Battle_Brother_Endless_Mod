::PTR.modTraits <- function()
{
	::mods_hookExactClass("skills/traits/character_trait", function(o) {
		o.m.SpecialPerkMultipliers <- [];
		o.m.PerkGroupMultipliers <- [];
	});

	::mods_hookExactClass("skills/traits/asthmatic_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.UnstoppableTree],
				[0, ::Const.Perks.FastTree],
				[0, ::Const.Perks.AgileTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/athletic_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.AgileTree],
				[2, ::Const.Perks.FastTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/bleeder_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.SturdyTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/bloodthirsty_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.CleaverTree],
				[2, ::Const.Perks.AxeTree],
				[0.5, ::Const.Perks.SpearTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/brave_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ViciousTree],
				[2, ::Const.Perks.SergeantClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/bright_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar]
			];

			this.m.PerkGroupMultipliers = [
				[4, ::Const.Perks.TalentedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/brute_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[4, ::Const.Perks.FlailTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/clubfooted_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.AgileTree],
				[0.5, ::Const.Perks.FastTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/cocky_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.UnstoppableTree],
				[2, ::Const.Perks.SergeantClassTree],
				[1.5, ::Const.Perks.EntertainerClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/dastard_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.SergeantClassTree],
				[0, ::Const.Perks.CalmTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/deathwish_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.ResilientTree],
				[2, ::Const.Perks.SturdyTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/determined_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar],
				[2, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.SergeantClassTree],
				[2, ::Const.Perks.ViciousTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/dexterous_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.TrainedTree],
				[2, ::Const.Perks.TalentedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/disloyal_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0.5, ::Const.Perks.SergeantClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/double_tongued_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0.5, ::Const.Perks.SergeantClassTree],
				[2, ::Const.Perks.ClerkClassTree],
				[2, ::Const.Perks.EntertainerClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/dumb_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.TalentedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/slack_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar],
				[0.5, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];
		}
	});

	::mods_hookExactClass("skills/traits/clumsy_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar],
				[0, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];
		}
	});

	::mods_hookExactClass("skills/traits/drunkard_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar],
				[0.5, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];
		}
	});

	::mods_hookExactClass("skills/traits/eagle_eyes_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.LegendBigGameHunter],
				[4, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.BowTree],
				[4, ::Const.Perks.ScoutClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/fainthearted_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar],
				[0.5, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.CalmTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/fat_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.AgileTree],
				[0.5, ::Const.Perks.FastTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/fearless_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.CalmTree],
				[4, ::Const.Perks.SergeantClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/firm_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.LargeTree],
				[2, ::Const.Perks.ViciousTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/fragile_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.SturdyTree],
				[0, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/frail_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar]
			];

			this.m.PerkGroupMultipliers = [
				[0.25, ::Const.Perks.SturdyTree],
				[0, ::Const.Perks.LargeTree],
				[0.25, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/gift_of_people_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.SergeantClassTree],
				[4, ::Const.Perks.EntertainerClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/gluttonous_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.OrganisedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/greedy_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ClerkClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/heavy_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0 ::Const.Perks.FastTree],
				[0.25, ::Const.Perks.AgileTree],
				[-1, ::Const.Perks.LargeTree],
				[2, ::Const.Perks.SturdyTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/hesitant_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.FastTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/huge_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.LargeTree],
				[4, ::Const.Perks.HeavyArmorTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/impatient_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.FastTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/fear_beasts_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];
		}
	});

	::mods_hookExactClass("skills/traits/hate_beasts_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[4, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];
		}
	});

	::mods_hookExactClass("skills/traits/insecure_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRRisingStar],
				[0.5, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.SergeantClassTree],
				[0.25, ::Const.Perks.ViciousTree],
				[0.5, ::Const.Perks.CalmTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/iron_jaw_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[-1, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.SturdyTree],
				[-1, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/iron_lungs_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.UnstoppableTree],
				[2, ::Const.Perks.ViciousTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/irrational_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.CalmTree],
				[0.5, ::Const.Perks.SergeantClassTree],
				[2, ::Const.Perks.EntertainerClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/legend_cannibalistic", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.CleaverTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/legend_diurnal_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ScoutClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/legend_peaceful_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.ViciousTree],
				[0, ::Const.Perks.UnstoppableTree],
				[-1, ::Const.Perks.CalmTree],
				[4, ::Const.Perks.SergeantClassTree],
				[2, ::Const.Perks.OrganisedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/light_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.RangedTree],
				[4, ::Const.Perks.FastTree],
				[4, ::Const.Perks.AgileTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/loyal_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/lucky_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar],
				[2, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/natural_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar]
			];

			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.TalentedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/night_blind_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.ScoutClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/night_owl_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ScoutClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/optimist_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ViciousTree],
				[2, ::Const.Perks.SergeantClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/paranoid_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.ResilientTree],
				[0, ::Const.Perks.CalmTree],
				[0.5, ::Const.Perks.SergeantClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/pessimist_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.SergeantClassTree],
				[0.5, ::Const.Perks.CalmTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/pragmatic_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0.25, ::Const.Perks.FlailTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/predictable_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[0.75, ::Const.Perks.FastTree],
				[0.5, ::Const.Perks.FlailTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/quick_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.SwordTree],
				[-1, ::Const.Perks.FastTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/short_sighted_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.ScoutClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/spartan_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0.75, ::Const.Perks.ResilientTree],
				[0.5, ::Const.Perks.SturdyTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/steady_hands_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[4, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.RangedTree],
				[2, ::Const.Perks.BowTree],
				[2, ::Const.Perks.CrossbowTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/strong_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.UnstoppableTree],
				[2, ::Const.Perks.LargeTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/superstitious_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.CalmTree],
				[0.5, ::Const.Perks.SergeantClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/sure_footing_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.TrainedTree],
				[2, ::Const.Perks.SturdyTree],
				[2, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/sureshot_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[-1, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.BowTree],
				[-1, ::Const.Perks.CrossbowTree],
				[-1, ::Const.Perks.RangedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/survivor_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.ResilientTree],
				[2, ::Const.Perks.SturdyTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/swift_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[4, ::Const.Perks.AgileTree],
				[2, ::Const.Perks.UnstoppableTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/teamplayer_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.SergeantClassTree],
				[4, ::Const.Perks.EntertainerClassTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/tiny_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.LargeTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/tough_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[-1, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[4, ::Const.Perks.LargeTree],
				[-1, ::Const.Perks.SturdyTree],
				[2, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/unpredictable_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar],
				[2, ::Const.Perks.PerkDefs.PTRMarksmanship]
			];

			this.m.PerkGroupMultipliers = [
				[4, ::Const.Perks.FlailTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/frail_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0.25, ::Const.Perks.SturdyTree],
				[0, ::Const.Perks.LargeTree],
				[2.25, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/weasel_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.FastTree],
				[2, ::Const.Perks.AgileTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/aggressive_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[-1, ::Const.Perks.ViciousTree],
				[-1, ::Const.Perks.UnstoppableTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/ailing_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[0.5, ::Const.Perks.PerkDefs.PTRManOfSteel]
			];

			this.m.PerkGroupMultipliers = [
				[0.5, ::Const.Perks.ResilientTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/ambitious_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.SpecialPerkMultipliers = [
				[2, ::Const.Perks.PerkDefs.PTRRisingStar],
				[2, ::Const.Perks.PerkDefs.LegendBigGameHunter]
			];

			this.m.PerkGroupMultipliers = [
				[2, ::Const.Perks.SergeantClassTree],
				[2, ::Const.Perks.OrganisedTree],
				[2, ::Const.Perks.TrainedTree]
			];
		}
	});

	::mods_hookExactClass("skills/traits/irrational_trait", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.PerkGroupMultipliers = [
				[0, ::Const.Perks.CalmTree],
				[0.5, ::Const.Perks.SergeantClassTree],
				[2, ::Const.Perks.EntertainerClassTree]
			];
		}
	});
}
