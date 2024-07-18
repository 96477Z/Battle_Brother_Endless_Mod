local gt = this.getroottable();

gt.PTR.modCharacterBackgrounds <- function()
{
	local addPerkTreesToCustomPerkTree = function (_customPerkTree, _treesToAdd)
	{
		foreach (tree in _treesToAdd)
		{
			for (local i = 0; i < tree.Tree.len(); i++)
			{
				foreach (perk in tree.Tree[i])
				{
					_customPerkTree[i].push(perk);
				}
			}
		}
	};

	local addPerksToCustomPerkTree = function ( _tier, _customPerkTree, _perks)
	{
		local row = _tier - 1;
		foreach (perk in _perks)
		{
			_customPerkTree[row].push(perk);
		}
	}

	local clearCustomPerkTree = function(_customPerkTree)
	{
		if (_customPerkTree == null)
		{			
			_customPerkTree = [];
		}
		else
		{
			_customPerkTree.clear();
		}
		
		for (local i = 0; i < 7; i++)
		{
			local emptyArray = [];
			_customPerkTree.push(emptyArray);
		}

		return _customPerkTree;
	};

	::mods_hookNewObject("skills/backgrounds/adventurous_noble_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[0.33, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[2, this.Const.Perks.PolearmTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree],
			[1.25, this.Const.Perks.TrainedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.NobleProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.TacticianClassTree]
				])
			],
			Defense = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.MediumArmorTree],
					[50, ::Const.Perks.HeavyArmorTree]
				])
			],
			Weapon = [
				::Const.Perks.SwordTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/anatomist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.5, this.Const.Perks.SturdyTree],
			[3, this.Const.Perks.TalentedTree],
			[0, this.Const.Perks.EntertainerClassTree],
			[3, this.Const.Perks.HealerClassTree],
			[0, this.Const.Perks.HoundmasterClassTree],
			[0, this.Const.Perks.BowTree],
			[0.4, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.RangedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ApothecaryProfessionTree
			],
			Enemy = [
				::MSU.Class.WeightedContainer([
					[8, ::Const.Perks.DirewolfTree],
					[8, ::Const.Perks.GhoulTree],
					[9, ::Const.Perks.LindwurmTree],
					[8, ::Const.Perks.GoblinTree],
					[8, ::Const.Perks.OrcTree],
					[8, ::Const.Perks.UnholdTree],
					[8, ::Const.Perks.AlpTree],
					[9, ::Const.Perks.HexenTree],
					[9, ::Const.Perks.SchratTree],
					[8, ::Const.Perks.SkeletonTree],
					[9, ::Const.Perks.VampireTree],
					[8, ::Const.Perks.ZombieTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/apprentice_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.TalentedTree ]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[12, ::Const.Perks.ButcherProfessionTree],
					[12, ::Const.Perks.BlacksmithProfessionTree],
					[12, ::Const.Perks.TraderProfessionTree],
					[12, ::Const.Perks.ApothecaryProfessionTree],
					[12, ::Const.Perks.LaborerProfessionTree],
					[12, ::Const.Perks.ServiceProfessionTree],
					[28, ::Const.Perks.NoTree]
				])
			],
		};
	});

	::mods_hookNewObject("skills/backgrounds/assassin_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.AssassinProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/assassin_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.AssassinProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/barbarian_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.CalmTree],
			[0, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.UnstoppableTree],
			[2, this.Const.Perks.ViciousTree],
			[0.2, this.Const.Perks.ClerkClassTree],
			[0, this.Const.Perks.EntertainerClassTree],
			[0.2, this.Const.Perks.ShieldTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[2, this.Const.Perks.AxeTree],
			[2, this.Const.Perks.HammerTree],
			[2, this.Const.Perks.MaceTree],
			[2, this.Const.Perks.CleaverTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0.5, this.Const.Perks.PolearmTree],
			[0.66, this.Const.Perks.SpearTree],
			[0.5, this.Const.Perks.StaffTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.RaiderProfessionTree],
					[50, ::Const.Perks.WildlingProfessionTree]
				])
			],
			Traits = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.LargeTree],
					[50, ::Const.Perks.AgileTree]
				])
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/bastard_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.NoblesTree],
			[1.5, this.Const.Perks.HeavyArmorTree],
			[0.5, this.Const.Perks.CalmTree],
			[0.5, this.Const.Perks.OrganisedTree],
			[2, this.Const.Perks.TacticianClassTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.BowTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Weapon = [
				::Const.Perks.SwordTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/beast_hunter_background", function(o) {
		o.m.SpecialPerkMultipliers = [
			[5, ::Const.Perks.PerkDefs.LegendBigGameHunter]
		];

		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.ViciousTree],
			[0.33, this.Const.Perks.ShieldTree],
			[0.5, this.Const.Perks.FlailTree],
			[0.5, this.Const.Perks.HammerTree],
			[0.5, this.Const.Perks.MaceTree],
			[0.5, this.Const.Perks.StaffTree],
			[0.25, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.ApothecaryProfessionTree],
			[0, this.Const.Perks.MinstrelProfessionTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[90, ::Const.Perks.NoTree],
					[10, ::Const.Perks.RandomTree]
				])
			],
			Enemy = [
				::Const.Perks.BeastsTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[90, ::Const.Perks.TrapperClassTree],
					[5, ::Const.Perks.ScoutClassTree],
					[5, ::Const.Perks.NoTree]
				])
			],
			Weapon = [
				::Const.Perks.SpearTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/beggar_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.TalentedTree],
			[0.25, this.Const.Perks.ClerkClassTree],
			[0, this.Const.Perks.EntertainerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			],
			Weapon = [
				::Const.Perks.StaffTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/beggar_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.TalentedTree],
			[0.25, this.Const.Perks.ClerkClassTree],
			[0, this.Const.Perks.EntertainerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			],
			Weapon = [
				::Const.Perks.StaffTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/belly_dancer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.ResilientTree],
			[0.25, this.Const.Perks.LargeTree],
			[0.25, this.Const.Perks.SturdyTree],
			[1.5, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.MediumArmorTree],
			[4, this.Const.Perks.LightArmorTree]
		];

		o.m.PerkTreeDynamic = {
			Traits = [
				::Const.Perks.FastTree
			],
			Class = [
				::Const.Perks.EntertainerClassTree
			],
			Defense = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.LightArmorTree],
					[50, ::Const.Perks.MediumArmorTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/bowyer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.NoTree],
					[50, ::Const.Perks.MenderClassTree]
				])
			],
			Defense = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.LightArmorTree],
					[50, ::Const.Perks.MediumArmorTree]
				])
			],
			Weapon = [
				::Const.Perks.BowTree
			]			
		};
	});

	::mods_hookNewObject("skills/backgrounds/brawler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.TalentedTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[2, this.Const.Perks.SergeantClassTree],
			[2, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.UnstoppableTree],
			[1.5, this.Const.Perks.HeavyArmorTree]
		];

		o.m.PerkTreeDynamic = {};
	});

	::mods_hookNewObject("skills/backgrounds/butcher_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ButcherProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/butcher_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ButcherProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/caravan_hand_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.OutlandersTree],
			[2, this.Const.Perks.MenderClassTree],
			[2, this.Const.Perks.ChefClassTree],
			[2, this.Const.Perks.ClerkClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			],
			Traits = [
				::Const.Perks.OrganisedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/caravan_hand_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.OutlandersTree],
			[2, this.Const.Perks.MenderClassTree],
			[2, this.Const.Perks.ChefClassTree],
			[2, this.Const.Perks.ClerkClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			],
			Traits = [
				::Const.Perks.OrganisedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/companion_1h_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.TrainedTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.SergeantClassTree],
			[2, this.Const.Perks.TacticianClassTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[3, this.Const.Perks.MediumArmorTree],
			[2, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.TwoHandedTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.CrossbowTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[6, ::Const.Perks.MilitiaProfessionTree],
					[6, ::Const.Perks.ButcherProfessionTree],
					[6, ::Const.Perks.BlacksmithProfessionTree],
					[6, ::Const.Perks.MinerProfessionTree],
					[6, ::Const.Perks.FarmerProfessionTree],
					[6, ::Const.Perks.DiggerProfessionTree],
					[6, ::Const.Perks.LumberjackProfessionTree],
					[6, ::Const.Perks.LaborerProfessionTree],
					[6, ::Const.Perks.SoldierProfessionTree],
					[1, ::Const.Perks.JugglerProfessionTree],
					[43, ::Const.Perks.NoTree]
				])
			],
			Weapon = [
				::Const.Perks.SpearTree
			],
			Defense = [
				::Const.Perks.ShieldTree
			],
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/companion_1h_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.TrainedTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.SergeantClassTree],
			[2, this.Const.Perks.TacticianClassTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[3, this.Const.Perks.MediumArmorTree],
			[2, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.TwoHandedTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.CrossbowTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[6, ::Const.Perks.MilitiaProfessionTree],
					[6, ::Const.Perks.ButcherProfessionTree],
					[6, ::Const.Perks.BlacksmithProfessionTree],
					[6, ::Const.Perks.MinerProfessionTree],
					[6, ::Const.Perks.FarmerProfessionTree],
					[6, ::Const.Perks.DiggerProfessionTree],
					[6, ::Const.Perks.LumberjackProfessionTree],
					[6, ::Const.Perks.LaborerProfessionTree],
					[6, ::Const.Perks.SoldierProfessionTree],
					[1, ::Const.Perks.JugglerProfessionTree],
					[43, ::Const.Perks.NoTree]
				])
			],
			Weapon = [
				::Const.Perks.SpearTree
			],
			Defense = [
				::Const.Perks.ShieldTree
			],
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/companion_2h_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.CalmTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[0.5, this.Const.Perks.FastTree],
			[0.5, this.Const.Perks.AgileTree],
			[0, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[6, ::Const.Perks.MilitiaProfessionTree],
					[6, ::Const.Perks.ButcherProfessionTree],
					[6, ::Const.Perks.BlacksmithProfessionTree],
					[6, ::Const.Perks.MinerProfessionTree],
					[6, ::Const.Perks.FarmerProfessionTree],
					[6, ::Const.Perks.DiggerProfessionTree],
					[6, ::Const.Perks.LumberjackProfessionTree],
					[6, ::Const.Perks.LaborerProfessionTree],
					[6, ::Const.Perks.SoldierProfessionTree],
					[1, ::Const.Perks.JugglerProfessionTree],
					[43, ::Const.Perks.NoTree]
				])
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/companion_2h_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.CalmTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[0.5, this.Const.Perks.FastTree],
			[0.5, this.Const.Perks.AgileTree],
			[0, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[6, ::Const.Perks.MilitiaProfessionTree],
					[6, ::Const.Perks.ButcherProfessionTree],
					[6, ::Const.Perks.BlacksmithProfessionTree],
					[6, ::Const.Perks.MinerProfessionTree],
					[6, ::Const.Perks.FarmerProfessionTree],
					[6, ::Const.Perks.DiggerProfessionTree],
					[6, ::Const.Perks.LumberjackProfessionTree],
					[6, ::Const.Perks.LaborerProfessionTree],
					[6, ::Const.Perks.SoldierProfessionTree],
					[1, ::Const.Perks.JugglerProfessionTree],
					[43, ::Const.Perks.NoTree]
				])
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/companion_ranged_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.ResilientTree],
			[0.5, this.Const.Perks.CalmTree],
			[0, this.Const.Perks.SturdyTree],
			[0.25, this.Const.Perks.LargeTree],
			[0, this.Const.Perks.TrainedTree],
			[0, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.ShieldTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::MSU.Class.WeightedContainer([
					[25, ::Const.Perks.BowTree],
					[25, ::Const.Perks.CrossbowTree],
					[25, ::Const.Perks.SlingTree],
					[25, ::Const.Perks.ThrowingTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/companion_ranged_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.ResilientTree],
			[0.5, this.Const.Perks.CalmTree],
			[0, this.Const.Perks.SturdyTree],
			[0.25, this.Const.Perks.LargeTree],
			[0, this.Const.Perks.TrainedTree],
			[0, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.ShieldTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::MSU.Class.WeightedContainer([
					[25, ::Const.Perks.BowTree],
					[25, ::Const.Perks.CrossbowTree],
					[25, ::Const.Perks.SlingTree],
					[25, ::Const.Perks.ThrowingTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/converted_cultist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.CultistProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/cripple_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.FastTree],
			[0.5, this.Const.Perks.AgileTree],
			[0.5, this.Const.Perks.SturdyTree],
			[2, this.Const.Perks.ResilientTree],
			[0, this.Const.Perks.EntertainerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[99, ::Const.Perks.PauperProfessionTree],
					[0.25, ::Const.Perks.ApothecaryProfessionTree],
					[0.25, ::Const.Perks.JugglerProfessionTree],
					[0.25, ::Const.Perks.MinstrelProfessionTree],
					[0.25, ::Const.Perks.AssassinProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/cripple_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.FastTree],
			[0.5, this.Const.Perks.AgileTree],
			[0.5, this.Const.Perks.SturdyTree],
			[2, this.Const.Perks.ResilientTree],
			[0, this.Const.Perks.EntertainerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[99, ::Const.Perks.PauperProfessionTree],
					[0.25, ::Const.Perks.ApothecaryProfessionTree],
					[0.25, ::Const.Perks.JugglerProfessionTree],
					[0.25, ::Const.Perks.MinstrelProfessionTree],
					[0.25, ::Const.Perks.AssassinProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/crucified_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.ResilientTree],
			[0.25, this.Const.Perks.ViciousTree],
			[0, this.Const.Perks.DeviousTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.LightArmorTree],
			[1.33, this.Const.Perks.ShieldTree],
			[0.5, this.Const.Perks.DaggerTree],
			[2, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.MaceTree],
			[2, this.Const.Perks.FlailTree],
			[2, this.Const.Perks.HammerTree],
			[0.33, this.Const.Perks.PolearmTree],
			[0, this.Const.Perks.ThrowingTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[70, ::Const.Perks.HolyManProfessionTree],
					[30, ::Const.Perks.SoldierProfessionTree]
				])
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/crusader_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.ResilientTree],
			[0.25, this.Const.Perks.ViciousTree],
			[0, this.Const.Perks.DeviousTree],
			[0, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.ShieldTree],
			[0.5, this.Const.Perks.DaggerTree],
			[2, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.MaceTree],
			[2, this.Const.Perks.FlailTree],
			[2, this.Const.Perks.HammerTree],
			[0.33, this.Const.Perks.PolearmTree],
			[0, this.Const.Perks.ThrowingTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[70, ::Const.Perks.HolyManProfessionTree],
					[30, ::Const.Perks.SoldierProfessionTree]
				])
			],
			Enemy = [
				::Const.Perks.UndeadTree
			],
			Traits = [
				::Const.Perks.CalmTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/cultist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.CalmTree],
			[1.5, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.ViciousTree],
			[1.5, this.Const.Perks.UnstoppableTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.CultistProfessionTree
			],
			Weapon = [
				::Const.Perks.CleaverTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/daytaler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.TalentedTree],
			[0.5, this.Const.Perks.TrainedTree],
			[1.25, this.Const.Perks.OrganisedTree],
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[51, ::Const.Perks.LaborerProfessionTree],
					[7, ::Const.Perks.ButcherProfessionTree],
					[7, ::Const.Perks.BlacksmithProfessionTree],
					[7, ::Const.Perks.MinerProfessionTree],
					[7, ::Const.Perks.FarmerProfessionTree],
					[7, ::Const.Perks.HunterProfessionTree],
					[7, ::Const.Perks.DiggerProfessionTree],
					[7, ::Const.Perks.LumberjackProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/daytaler_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.TalentedTree],
			[0.5, this.Const.Perks.TrainedTree],
			[1.25, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[51, ::Const.Perks.LaborerProfessionTree],
					[7, ::Const.Perks.ButcherProfessionTree],
					[7, ::Const.Perks.BlacksmithProfessionTree],
					[7, ::Const.Perks.MinerProfessionTree],
					[7, ::Const.Perks.FarmerProfessionTree],
					[7, ::Const.Perks.HunterProfessionTree],
					[7, ::Const.Perks.DiggerProfessionTree],
					[7, ::Const.Perks.LumberjackProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/deserter_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.CalmTree],
			[0.75, this.Const.Perks.DeviousTree],
			[0.25, this.Const.Perks.SergeantClassTree],
			[2, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0.5, this.Const.Perks.LightArmorTree],
			[2, this.Const.Perks.PolearmTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/disowned_noble_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.CalmTree],
			[0.5, this.Const.Perks.OrganisedTree],
			[0.5, this.Const.Perks.SergeantClassTree],
			[1.5, this.Const.Perks.TacticianClassTree],
			[0.8, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Weapon = [
				::Const.Perks.SwordTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/eunuch_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.HexenTree],
			[3, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/eunuch_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.HexenTree],
			[3, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/farmhand_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[8.33, ::Const.Perks.ButcherProfessionTree],
					[8.33, ::Const.Perks.BlacksmithProfessionTree],
					[8.33, ::Const.Perks.LaborerProfessionTree],
					[75, ::Const.Perks.FarmerProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_adventurous_noble_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.ResilientTree],
			[0.25, this.Const.Perks.LargeTree],
			[0.25, this.Const.Perks.SturdyTree],
			[0.5, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.MediumArmorTree],
			[3, this.Const.Perks.CrossbowTree],
			[0.33, this.Const.Perks.SlingTree],
			[1.5, this.Const.Perks.PolearmTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.NobleProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.TacticianClassTree]
				])
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.BowTree
			],
			Styles = [
				::Const.Perks.RangedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_beggar_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.TalentedTree],
			[0.25, this.Const.Perks.ClerkClassTree],
			[0, this.Const.Perks.EntertainerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			],
			Weapon = [
				::Const.Perks.StaffTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_bowyer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.NoTree],
					[50, ::Const.Perks.MenderClassTree]
				])
			],
			Defense = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.LightArmorTree],
					[50, ::Const.Perks.MediumArmorTree]
				])
			],
			Weapon = [
				::Const.Perks.BowTree
			]			
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_butcher_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ButcherProfessionTree,
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_daytaler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.TalentedTree],
			[0.5, this.Const.Perks.TrainedTree],
			[1.25, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[51, ::Const.Perks.LaborerProfessionTree],
					[7, ::Const.Perks.ButcherProfessionTree],
					[7, ::Const.Perks.BlacksmithProfessionTree],
					[7, ::Const.Perks.MinerProfessionTree],
					[7, ::Const.Perks.FarmerProfessionTree],
					[7, ::Const.Perks.HunterProfessionTree],
					[7, ::Const.Perks.DiggerProfessionTree],
					[7, ::Const.Perks.LumberjackProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_disowned_noble_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.NoblesTree],
			[0.5, this.Const.Perks.CalmTree],
			[0.5, this.Const.Perks.OrganisedTree],
			[0.5, this.Const.Perks.SergeantClassTree],
			[1.5, this.Const.Perks.TacticianClassTree],
			[0.8, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Weapon = [
				::Const.Perks.SwordTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]

		};
	});

	::mods_hookNewObject("skills/backgrounds/female_farmhand_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.TalentedTree],
			[0.5, this.Const.Perks.LightArmorTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[8.33, ::Const.Perks.ButcherProfessionTree],
					[8.33, ::Const.Perks.BlacksmithProfessionTree],
					[8.33, ::Const.Perks.LaborerProfessionTree],
					[75, ::Const.Perks.FarmerProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_miller_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.LargeTree],
			[1.5, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.SturdyTree],
			[0.5, this.Const.Perks.TrainedTree],
			[1.5, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_minstrel_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.MinstrelProfessionTree
			],
			Class = [
				::Const.Perks.EntertainerClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_servant_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.25, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_slave_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.SouthernersTree],
			[1.5, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.FlailTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_slave_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.SouthernersTree],
			[1.5, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.FlailTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_tailor_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.TalentedTree],
			[1.5, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.MenderClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Class = [
				::Const.Perks.MenderClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_thief_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.5, this.Const.Perks.SturdyTree],
			[0.75, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.FastTree],
			[1.5, this.Const.Perks.AgileTree],
			[1.25, this.Const.Perks.TalentedTree],
			[0.66, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.OneHandedTree],
			[3, this.Const.Perks.DaggerTree]
		];

		o.m.PerkTreeDynamic = {
			Traits = [
				::Const.Perks.DeviousTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/female_thief_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.5, this.Const.Perks.SturdyTree],
			[0.75, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.FastTree],
			[1.5, this.Const.Perks.AgileTree],
			[1.25, this.Const.Perks.TalentedTree],
			[0.66, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.OneHandedTree],
			[3, this.Const.Perks.DaggerTree]
		];

		o.m.PerkTreeDynamic = {
			Traits = [
				::Const.Perks.DeviousTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/fisherman_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.75, this.Const.Perks.ResilientTree],
			[0.5, this.Const.Perks.SturdyTree],
			[1.5, this.Const.Perks.OrganisedTree],
			[1.5, this.Const.Perks.ChefClassTree],
			[1.25, this.Const.Perks.SpearTree],
			[0.66, this.Const.Perks.ThrowingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[30, ::Const.Perks.ButcherProfessionTree],
					[30, ::Const.Perks.LaborerProfessionTree],
					[10, ::Const.Perks.TraderProfessionTree],
					[30, ::Const.Perks.NoTree]
				])
			],
			Class = [
				::Const.Perks.TrapperClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/fisherman_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.75, this.Const.Perks.ResilientTree],
			[0.5, this.Const.Perks.SturdyTree],
			[1.5, this.Const.Perks.OrganisedTree],
			[1.5, this.Const.Perks.ChefClassTree],
			[1.25, this.Const.Perks.SpearTree],
			[0.66, this.Const.Perks.ThrowingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[30, ::Const.Perks.ButcherProfessionTree],
					[30, ::Const.Perks.LaborerProfessionTree],
					[10, ::Const.Perks.TraderProfessionTree],
					[30, ::Const.Perks.NoTree]
				])
			],
			Class = [
				::Const.Perks.TrapperClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/flagellant_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.ResilientTree],
			[3, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.SturdyTree],
			[0.2, this.Const.Perks.HealerClassTree],
			[0.1, this.Const.Perks.ShieldTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.CleaverTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/gambler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.TalentedTree],
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.ClerkClassTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/gambler_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.ClerkClassTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/gladiator_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[2, this.Const.Perks.ViciousTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[0.8, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[20, ::Const.Perks.RaiderProfessionTree],
					[10, ::Const.Perks.SoldierProfessionTree],
					[70, ::Const.Perks.NoTree]
				])
			],
			Class = [
				::Const.Perks.TrapperClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/gladiator_origin_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[2, this.Const.Perks.ViciousTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[0.8, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[20, ::Const.Perks.RaiderProfessionTree],
					[10, ::Const.Perks.SoldierProfessionTree],
					[70, ::Const.Perks.NoTree]
				])
			],
			Class = [
				::Const.Perks.TrapperClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});


	::mods_hookNewObject("skills/backgrounds/gravedigger_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.SkeletonTree],
			[1.5, this.Const.Perks.ZombieTree],
			[1.5, this.Const.Perks.VampireTree],
			[2, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.SergeantClassTree],
			[0.5, this.Const.Perks.TalentedTree],
			[1.5, this.Const.Perks.TwoHandedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.DiggerProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/graverobber_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.SkeletonTree],
			[1.5, this.Const.Perks.ZombieTree],
			[1.5, this.Const.Perks.VampireTree],
			[2, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.SergeantClassTree]
		];

		o.m.PerkTreeDynamic = {};
	});

	::mods_hookNewObject("skills/backgrounds/hedge_knight_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.AgileTree],
			[0.25, this.Const.Perks.FastTree],
			[0.1, this.Const.Perks.DeviousTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[0.5, this.Const.Perks.TalentedTree],
			[0.5, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.TacticianClassTree],
			[2, this.Const.Perks.MediumArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0.1, this.Const.Perks.LightArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.SlingTree],
			[0.16, this.Const.Perks.SpearTree],
			[0.25, this.Const.Perks.StaffTree],
			[0.25, this.Const.Perks.ThrowingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[20, ::Const.Perks.RaiderProfessionTree],
					[10, ::Const.Perks.SoldierProfessionTree],
					[70, ::Const.Perks.NoTree]
				])
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			],
			Enemy = [
				::Const.Perks.SwordmastersTree
			]

		};
	});

	::mods_hookNewObject("skills/backgrounds/historian_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.66, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.TrapperClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PhilosophyMagicTree
			],
			Traits = [
				::Const.Perks.TalentedTree,
				::Const.Perks.CalmTree
			],
			Class = [
				::Const.Perks.TacticianClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/historian_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.66, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.TrapperClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PhilosophyMagicTree
			],
			Traits = [
				::Const.Perks.TalentedTree,
				::Const.Perks.CalmTree
			],
			Class = [
				::Const.Perks.TacticianClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/houndmaster_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.AlpTree]
		];

		o.m.PerkTreeDynamic = {
			Class = [
				::Const.Perks.HoundmasterClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/hunter_background", function(o) {
		o.m.SpecialPerkMultipliers = [
			[2, ::Const.Perks.PerkDefs.LegendBigGameHunter],
			[2, ::Const.Perks.PerkDefs.PTRMarksmanship]
		];

		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.ResilientTree],
			[0.5, this.Const.Perks.LargeTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Class = [
				::Const.Perks.ScoutClassTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.BowTree
			]			
		};
	});

	::mods_hookNewObject("skills/backgrounds/juggler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.JugglerProfessionTree
			],
			Traits = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.AgileTree],
					[50, ::Const.Perks.FastTree]
				])
			],
			Class = [
				::Const.Perks.EntertainerClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/juggler_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.JugglerProfessionTree
			],
			Traits = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.AgileTree],
					[50, ::Const.Perks.FastTree]
				])
			],
			Class = [
				::Const.Perks.EntertainerClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/killer_on_the_run_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[5, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.UnstoppableTree],
			[0.1, this.Const.Perks.CalmTree],
			[0.5, this.Const.Perks.SergeantClassTree],
			[0.5, this.Const.Perks.HealerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[6, ::Const.Perks.MilitiaProfessionTree],
					[6, ::Const.Perks.ButcherProfessionTree],
					[6, ::Const.Perks.BlacksmithProfessionTree],
					[6, ::Const.Perks.MinerProfessionTree],
					[6, ::Const.Perks.FarmerProfessionTree],
					[6, ::Const.Perks.DiggerProfessionTree],
					[6, ::Const.Perks.LumberjackProfessionTree],
					[6, ::Const.Perks.LaborerProfessionTree],
					[6, ::Const.Perks.SoldierProfessionTree],
					[6, ::Const.Perks.ServiceProfessionTree],
					[0.25, ::Const.Perks.JugglerProfessionTree],
					[0.25, ::Const.Perks.MinstrelProfessionTree],
					[0.25, ::Const.Perks.AssassinProfessionTree],
					[0.25, ::Const.Perks.ApothecaryProfessionTree],
					[39, ::Const.Perks.NoTree]
				])
			],
			Enemy = [
				::Const.Perks.CivilizationTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/kings_guard_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.DeviousTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.RangedTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			],
			Traits = [
				::Const.Perks.TrainedTree
			],
			Class = [
				::Const.Perks.TacticianClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	// ::mods_hookNewObject("skills/backgrounds/legend_ancient_summoner_background", function(o) {
	// 	o.m.PerkTreeDynamic = {			
	// 			[0.5, ::Const.Perks.SwordTree],
	// 			[0.25, ::Const.Perks.AxeTree],
	// 			[2, ::Const.Perks.DaggerTree],
	// 			[0.2, ::Const.Perks.ChefClassTree],
	// 		],

	// 	o.m.PerkTreeDynamic = {
	//		Profession = [
	// 			::Const.Perks.ButcherProfessionTree,
	// 		],
	// 		Traits = [
	// 			::Const.Perks.ViciousTree,,
	// 			::Const.Perks.CalmTree,,
	// 			::Const.Perks.TalentedTree,,
	// 			::Const.Perks.UnstoppableTree,
	// 		],
	// 		Class = [
	// 			::Const.Perks.HealerClassTree,
	// 		],
	// 		Defense = [
	// 			::Const.Perks.LightArmorTree,,
	// 			::Const.Perks.MediumArmorTree,,
	// 		],
	// 		Weapon = [
	// 			::Const.Perks.StaffTree,
	// 		],
	// 		Styles = [
	// 			::Const.Perks.OneHandedTree,,
	// 			::Const.Perks.TwoHandedTree,
	// 		],
	// 		Magic = [
	// 			::Const.Perks.BasicNecroMagicTree,
	// 		]
	// 	};
	// });

	::mods_hookNewObject("skills/backgrounds/legend_assassin_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);
		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.AgileTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.UnstoppableTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.TrapperClassTree,
				this.Const.Perks.MaceTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecialistKnifeSkill,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.PTRSmallTarget,
				this.Const.Perks.PerkDefs.PTRDeepCuts,
				this.Const.Perks.PerkDefs.NineLives
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBetweenTheEyes,
				this.Const.Perks.PerkDefs.LegendSpecialistKnifeDamage,
				this.Const.Perks.PerkDefs.LegendHairSplitter,
				this.Const.Perks.PerkDefs.PTRTunnelVision			
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHidden,
				this.Const.Perks.PerkDefs.PTRVigilant,							
				this.Const.Perks.PerkDefs.PTRPatternRecognition,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.PTRTraumaSurvivor
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTROffhandTraining,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster,
				this.Const.Perks.PerkDefs.BoondockBlade,
				this.Const.Perks.PerkDefs.LegendBackflip				
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.DoubleStrike,
				this.Const.Perks.PerkDefs.HeadHunter,				
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness				
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.PTRPrimalFear,
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.LegendTwirl
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVanguardDeployment,
				this.Const.Perks.PerkDefs.BFFencer,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendAssassinate,
				this.Const.Perks.PerkDefs.LegendTumble				
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_assassin_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.UnstoppableTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.TrapperClassTree,
				this.Const.Perks.MaceTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecialistKnifeSkill,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendHairSplitter,
				this.Const.Perks.PerkDefs.PTRDeepCuts,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.NineLives
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBetweenTheEyes,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.LegendSpecialistKnifeDamage,
				this.Const.Perks.PerkDefs.PTRSmallTarget,
				this.Const.Perks.PerkDefs.PTRMenacing,
				this.Const.Perks.PerkDefs.FortifiedMind
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.PTRPatternRecognition,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.Overwhelm
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTROffhandTraining,
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.LegendHidden,
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.BoondockBlade,
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,
				this.Const.Perks.PerkDefs.LegendBackflip
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRTraumaSurvivor,
				this.Const.Perks.PerkDefs.PTRFreshAndFurious,
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.LegendTwirl				
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.LegendAssassinate,
				this.Const.Perks.PerkDefs.PTRPrimalFear,
				this.Const.Perks.PerkDefs.LegendTumble
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVanguardDeployment,
				this.Const.Perks.PerkDefs.BFFencer,	
				this.Const.Perks.PerkDefs.PTRBully,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.PTRTunnelVision,			
				this.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_astrologist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[5, this.Const.Perks.TalentedTree],
			[1.66, this.Const.Perks.OrganisedTree],
			[5, this.Const.Perks.StaffTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Magic = [
				::Const.Perks.PremonitionMagicTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_beggar_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.SlingTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBearDown,
				this.Const.Perks.PerkDefs.PTRPushIt,
				this.Const.Perks.PerkDefs.PTRRattle,
				this.Const.Perks.PerkDefs.LegendSmackdown,
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.PTRSwordlike,
				this.Const.Perks.PerkDefs.PTRVersatileWeapon,
				this.Const.Perks.PerkDefs.PTRSmallTarget,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.BagsAndBelts

			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRPointyEnd,
				this.Const.Perks.PerkDefs.PTRBloodyHarvest,
				this.Const.Perks.PerkDefs.PTRDeepCuts,
				this.Const.Perks.PerkDefs.Bullseye,
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.PTRHybridization,
				this.Const.Perks.PerkDefs.LegendSmashingShields,
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.LegendOnslaught
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTREntrenched,
				this.Const.Perks.PerkDefs.PTRHeadSmasher,
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.STRPhalanx,
				this.Const.Perks.PerkDefs.PTRDeepImpact,
				this.Const.Perks.PerkDefs.SteelBrow,
				this.Const.Perks.PerkDefs.LegendEfficientPacking,
				this.Const.Perks.PerkDefs.PTRThroughTheGaps,
				this.Const.Perks.PerkDefs.PTRSurvivalInstinct,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Rotation
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.PTRLeverage,
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.SpecDagger,
				this.Const.Perks.PerkDefs.PTRFormidableApproach,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.PTRPunchingBag,
				this.Const.Perks.PerkDefs.Steadfast,
				this.Const.Perks.PerkDefs.SpecSpear,
				this.Const.Perks.PerkDefs.SpecSword,
				this.Const.Perks.PerkDefs.PTRPowerShot,
				this.Const.Perks.PerkDefs.Relentless
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.SpecHammer,
				this.Const.Perks.PerkDefs.SpecFlail,
				this.Const.Perks.PerkDefs.SpecMace,
				this.Const.Perks.PerkDefs.SpecPolearm,
				this.Const.Perks.PerkDefs.LegendMasteryStaves,
				this.Const.Perks.PerkDefs.SpecCrossbow,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.SpecThrowing,
				this.Const.Perks.PerkDefs.SpecAxe,
				this.Const.Perks.PerkDefs.SpecCleaver,
				this.Const.Perks.PerkDefs.LegendSkillfulStacking
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTROffhandTraining,
				this.Const.Perks.PerkDefs.PTRSweepingStrikes,
				this.Const.Perks.PerkDefs.PTRSoftMetal,
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.PTRIronSights,
				this.Const.Perks.PerkDefs.PTRConcussiveStrikes,
				this.Const.Perks.PerkDefs.ReachAdvantage,
				this.Const.Perks.PerkDefs.LegendWindReader,
				this.Const.Perks.PerkDefs.PTRTraumaSurvivor,
				this.Const.Perks.PerkDefs.Underdog,
				this.Const.Perks.PerkDefs.SunderingStrikes,
				this.Const.Perks.PerkDefs.Nimble
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PushTheAdvantage,
				this.Const.Perks.PerkDefs.PTRUtilitarian,
				this.Const.Perks.PerkDefs.LegendSpecSpearWall,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.Ballistics,
				this.Const.Perks.PerkDefs.PTRNailedIt,
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.PTRMarksmanship,
				this.Const.Perks.PerkDefs.PTRMuscleMemory,
				this.Const.Perks.PerkDefs.PTRStrengthInNumbers,
				this.Const.Perks.PerkDefs.Fearsome
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_beggar_commander_op_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.BeastsTree,
				this.Const.Perks.MysticTree,
				this.Const.Perks.UndeadTree,
				this.Const.Perks.CivilizationTree,
				this.Const.Perks.OutlandersTree,
				this.Const.Perks.OrcsTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.FastAdaption,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Recover
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRSurvivalInstinct,
				this.Const.Perks.PerkDefs.Backstabber
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.Rotation
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.RallyTheTroops

			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRDynamicDuo,
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.Steadfast
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendMindOverBody,
				this.Const.Perks.PerkDefs.PTRTheRushOfBattle,
				this.Const.Perks.PerkDefs.InspiringPresence
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyArcher,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster,
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.Indomitable,
				this.Const.Perks.PerkDefs.PerfectFocus
			]
		);

		o.onTargetKilled = function( _targetEntity, _skill )
		{
			local actor = this.getContainer().getActor();

			if (actor.isAlliedWith(_targetEntity))
			{
				return;
			}

			actor.getBaseProperties().Hitpoints += (actor.getBaseProperties().Hitpoints < _targetEntity.getBaseProperties().Hitpoints ? 1 : 0);
			actor.getBaseProperties().Bravery += (actor.getBaseProperties().Bravery < _targetEntity.getBaseProperties().Bravery ? 1 : 0);
			actor.getBaseProperties().Stamina += (actor.getBaseProperties().Stamina < _targetEntity.getBaseProperties().Stamina ? 1 : 0);
			actor.getBaseProperties().MeleeSkill += (actor.getBaseProperties().MeleeSkill < _targetEntity.getBaseProperties().MeleeSkill ? 1 : 0);
			actor.getBaseProperties().RangedSkill += (actor.getBaseProperties().RangedSkill < _targetEntity.getBaseProperties().RangedSkill ? 1 : 0);
			actor.getBaseProperties().MeleeDefense += (actor.getBaseProperties().MeleeDefense < _targetEntity.getBaseProperties().MeleeDefense ? 1 : 0);
			actor.getBaseProperties().RangedDefense += (actor.getBaseProperties().RangedDefense < _targetEntity.getBaseProperties().RangedDefense ? 1 : 0);
			actor.getBaseProperties().Initiative += (actor.getBaseProperties().Initiative < _targetEntity.getBaseProperties().Initiative ? 1 : 0);

			local target_skills = _targetEntity.getSkills().getSkillsByFunction(@(skill) skill.isType(::Const.SkillType.Perk));
			local potentialPerks = [];

			foreach (perk in target_skills)
			{
				local id = perk.getID();
				if (id == "perk.stalwart" || id == "perk.legend_composure" || id == "perk.battering_ram")
				{
					continue;
				}

				if (!actor.getSkills().hasSkill(id))
				{
					potentialPerks.push(perk);
				}
			}

			if (potentialPerks.len() == 0)
			{
				return;
			}

			local perk = potentialPerks[this.Math.rand(0, potentialPerks.len() - 1)];
			
			foreach( i, v in this.Const.Perks.PerkDefObjects )
			{
				if (perk.getID() == v.ID)
				{
					if (v.Script != "")
					{
						this.Tactical.EventLog.log("The framed beggar learned [color=" + this.Const.UI.Color.NegativeValue + "]" + perk.getName() + "[/color] from " + _targetEntity.getName());
						actor.getSkills().add(this.new(v.Script));
						local rowToAddPerk = 0;
						local length = actor.getBackground().getPerkTree()[0].len();
						foreach (i, row in actor.getBackground().getPerkTree())
						{
							if (row.len() < length) rowToAddPerk = i;
						}
						actor.getBackground().addPerk(i, rowToAddPerk);
						break;
					}
				}
			}
		}
	});

	::mods_hookNewObject("skills/backgrounds/legend_berserker_background", function(o) {		
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);
		
		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.AxeTree,
				this.Const.Perks.CleaverTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.ResilientTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.UnstoppableTree,
				this.Const.Perks.HammerTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.PTRFruitsOfLabor
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRSavageStrength,
				this.Const.Perks.PerkDefs.PTRMenacing,
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.PTRBestialVigor
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin,
				this.Const.Perks.PerkDefs.PTRHaleAndHearty,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,			
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.PTRTheRushOfBattle,
				this.Const.Perks.PerkDefs.PTRBully
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
			this.Const.Perks.PerkDefs.BattleFlow,
			this.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRFreshAndFurious,
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBlitzkrieg,			
				this.Const.Perks.PerkDefs.PTRFeralRage,
				this.Const.Perks.PerkDefs.Rebound
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_berserker_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);
		
		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.AxeTree,
				this.Const.Perks.CleaverTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.ResilientTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.UnstoppableTree,
				this.Const.Perks.HammerTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.PTRFruitsOfLabor
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRSavageStrength,
				this.Const.Perks.PerkDefs.PTRMenacing,
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.PTRBestialVigor
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin,
				this.Const.Perks.PerkDefs.PTRHaleAndHearty,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,			
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.PTRTheRushOfBattle,
				this.Const.Perks.PerkDefs.PTRBully
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
			this.Const.Perks.PerkDefs.BattleFlow,
			this.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRFreshAndFurious,
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBlitzkrieg,			
				this.Const.Perks.PerkDefs.LegendBerserkerRage,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.LegendUberNimble
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_blacksmith_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.AgileTree],
			[0.1, this.Const.Perks.DeviousTree],
			[0.5, this.Const.Perks.FastTree],
			[1.5, this.Const.Perks.LargeTree],
			[1.5, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.SturdyTree],
			[2, this.Const.Perks.OrganisedTree],
			[0.33, this.Const.Perks.LightArmorTree],
			[0, this.Const.Perks.BowTree],
			[0.1, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.BlacksmithProfessionTree
			],
			Class = [
				::Const.Perks.MenderClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_cannibal_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ButcherProfessionTree
			],
			Traits = [
				::Const.Perks.ViciousTree
			],
			Class = [
				::Const.Perks.ChefClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_conjurer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_crusader_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.ResilientTree],
			[0.25, this.Const.Perks.ViciousTree],
			[0, this.Const.Perks.DeviousTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.ShieldTree],
			[0.5, this.Const.Perks.DaggerTree],
			[2, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.MaceTree],
			[2, this.Const.Perks.FlailTree],
			[2, this.Const.Perks.HammerTree],
			[0.33, this.Const.Perks.PolearmTree],
			[0, this.Const.Perks.ThrowingTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[70, ::Const.Perks.HolyManProfessionTree],
					[30, ::Const.Perks.SoldierProfessionTree]
				])
			],
			Enemy = [
				::Const.Perks.UndeadTree
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});


	::mods_hookNewObject("skills/backgrounds/legend_crusader_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.HeavyArmorTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.SturdyTree
			]
		);

		local trees = [
			this.Const.Perks.AxeTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.SwordTree
		];

		for (local i = 0; i < 4; ++i)
		{
			addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [trees.remove(this.Math.rand(0, trees.len()-1))]);			
		}

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.STRPhalanx,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyZombie,
				this.Const.Perks.PerkDefs.LegendHairSplitter,
				this.Const.Perks.PerkDefs.PTRExploitOpening,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.PTRSmallTarget
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.RallyTheTroops,
				this.Const.Perks.PerkDefs.STRCoverAlly,
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.PTRExudeConfidence,
				this.Const.Perks.PerkDefs.PTRSanguinary,
				this.Const.Perks.PerkDefs.QuickHands
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendShieldsUp,
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.Steadfast,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.PTRFormidableApproach
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemySkeleton,
				this.Const.Perks.PerkDefs.STRLineBreaker,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyVampire,
				this.Const.Perks.PerkDefs.SunderingStrikes,
				this.Const.Perks.PerkDefs.PTRTheRushOfBattle,				
				this.Const.Perks.PerkDefs.LegendHoldTheLine,			
				this.Const.Perks.PerkDefs.LegendPrayerOfFaith,
				this.Const.Perks.PerkDefs.PTRVigilant,				
				this.Const.Perks.PerkDefs.LegendPrayerOfLife

			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.DoubleStrike,				
				this.Const.Perks.PerkDefs.LegendSecondWind,	
				this.Const.Perks.PerkDefs.LegendBattleheart,							
				this.Const.Perks.PerkDefs.Berserk,
				this.Const.Perks.PerkDefs.PTRPatternRecognition
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendMindOverBody,				
				this.Const.Perks.PerkDefs.LegendHolyFlame,
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.PTRSweepingStrikes
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BattleFlow,		
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.Inspire,								
				this.Const.Perks.PerkDefs.PTRProfessional,
				this.Const.Perks.PerkDefs.PerfectFocus,				
				this.Const.Perks.PerkDefs.Rebound
			]
		);
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_death_summoner_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_diviner_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_donkey_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_druid_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.HoundmasterClassTree,
				this.Const.Perks.AgileTree,				
				this.Const.Perks.ResilientTree,
				this.Const.Perks.CalmTree,				
				this.Const.Perks.LightArmorTree,				
				this.Const.Perks.MediumArmorTree,							
				this.Const.Perks.StaffTree,
				this.Const.Perks.TwoHandedTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendBlendIn,
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.LegendWither,
				this.Const.Perks.PerkDefs.LegendSummonHound,
				this.Const.Perks.PerkDefs.PTRFruitsOfLabor,
				this.Const.Perks.PerkDefs.Student				
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendScryTrance,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.LegendNightvision,
				this.Const.Perks.PerkDefs.LegendGatherer,
				this.Const.Perks.PerkDefs.Gifted			
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendRoots,
				this.Const.Perks.PerkDefs.LegendHerbcraft,
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.Sprint				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.LegendSummonWolf,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.PTRBearDown,
				this.Const.Perks.PerkDefs.PTRDiscoveredTalent,
				this.Const.Perks.PerkDefs.PTRTunnelVision,
				this.Const.Perks.PerkDefs.PTRDynamicDuo,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin				
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHidden,
				this.Const.Perks.PerkDefs.PTRHaleAndHearty,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.LegendWoodworking,
				this.Const.Perks.PerkDefs.LegendInsects,
				this.Const.Perks.PerkDefs.LegendPotionBrewer,
				this.Const.Perks.PerkDefs.LegendReadOmensTrance				
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.LegendUntouchable,
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendSummonStorm,
				this.Const.Perks.PerkDefs.LegendDrumsOfLife,				
				this.Const.Perks.PerkDefs.LegendDistantVisions
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.PTRRisingStar,
				this.Const.Perks.PerkDefs.LegendQuartermaster,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendSummonBear,
				this.Const.Perks.PerkDefs.LegendMiasma,
				this.Const.Perks.PerkDefs.LegendDrumsOfWar				
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_druid_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.HoundmasterClassTree,
				this.Const.Perks.AgileTree,				
				this.Const.Perks.ResilientTree,
				this.Const.Perks.CalmTree,				
				this.Const.Perks.LightArmorTree,				
				this.Const.Perks.MediumArmorTree,							
				this.Const.Perks.StaffTree,
				this.Const.Perks.TwoHandedTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendBlendIn,
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.LegendWither,
				this.Const.Perks.PerkDefs.LegendSummonHound,
				this.Const.Perks.PerkDefs.PTRFruitsOfLabor,
				this.Const.Perks.PerkDefs.Student				
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendScryTrance,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.LegendNightvision,
				this.Const.Perks.PerkDefs.LegendGatherer,
				this.Const.Perks.PerkDefs.Gifted			
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendRoots,
				this.Const.Perks.PerkDefs.LegendHerbcraft,
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.Sprint				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.LegendSummonWolf,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.PTRBearDown,
				this.Const.Perks.PerkDefs.PTRDiscoveredTalent,
				this.Const.Perks.PerkDefs.PTRTunnelVision,
				this.Const.Perks.PerkDefs.PTRDynamicDuo,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin				
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHidden,
				this.Const.Perks.PerkDefs.PTRHaleAndHearty,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.LegendWoodworking,
				this.Const.Perks.PerkDefs.LegendInsects,
				this.Const.Perks.PerkDefs.LegendPotionBrewer,
				this.Const.Perks.PerkDefs.LegendReadOmensTrance				
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.LegendUntouchable,
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendSummonStorm,
				this.Const.Perks.PerkDefs.LegendDrumsOfLife,				
				this.Const.Perks.PerkDefs.LegendDistantVisions
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.PTRRisingStar,
				this.Const.Perks.PerkDefs.LegendQuartermaster,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendSummonBear,
				this.Const.Perks.PerkDefs.LegendMiasma,
				this.Const.Perks.PerkDefs.LegendDrumsOfWar				
			]
		);
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_enchanter_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_entrancer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_female_beggar_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.SlingTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBearDown,
				this.Const.Perks.PerkDefs.PTRPushIt,
				this.Const.Perks.PerkDefs.PTRRattle,
				this.Const.Perks.PerkDefs.LegendSmackdown,
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.PTRSwordlike,
				this.Const.Perks.PerkDefs.PTRVersatileWeapon,
				this.Const.Perks.PerkDefs.PTRSmallTarget,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.BagsAndBelts

			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRPointyEnd,
				this.Const.Perks.PerkDefs.PTRBloodyHarvest,
				this.Const.Perks.PerkDefs.PTRDeepCuts,
				this.Const.Perks.PerkDefs.Bullseye,
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.PTRHybridization,
				this.Const.Perks.PerkDefs.LegendSmashingShields,
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.LegendOnslaught
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTREntrenched,
				this.Const.Perks.PerkDefs.PTRHeadSmasher,
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.STRPhalanx,
				this.Const.Perks.PerkDefs.PTRDeepImpact,
				this.Const.Perks.PerkDefs.SteelBrow,
				this.Const.Perks.PerkDefs.LegendEfficientPacking,
				this.Const.Perks.PerkDefs.PTRThroughTheGaps,
				this.Const.Perks.PerkDefs.PTRSurvivalInstinct,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Rotation
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.PTRLeverage,
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.SpecDagger,
				this.Const.Perks.PerkDefs.PTRFormidableApproach,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.PTRPunchingBag,
				this.Const.Perks.PerkDefs.Steadfast,
				this.Const.Perks.PerkDefs.SpecSpear,
				this.Const.Perks.PerkDefs.SpecSword,
				this.Const.Perks.PerkDefs.PTRPowerShot,
				this.Const.Perks.PerkDefs.Relentless
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.SpecHammer,
				this.Const.Perks.PerkDefs.SpecFlail,
				this.Const.Perks.PerkDefs.SpecMace,
				this.Const.Perks.PerkDefs.SpecPolearm,
				this.Const.Perks.PerkDefs.LegendMasteryStaves,
				this.Const.Perks.PerkDefs.SpecCrossbow,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.SpecThrowing,
				this.Const.Perks.PerkDefs.SpecAxe,
				this.Const.Perks.PerkDefs.PTRVigorousAssault,				
				this.Const.Perks.PerkDefs.SpecCleaver,
				this.Const.Perks.PerkDefs.LegendSkillfulStacking
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTROffhandTraining,
				this.Const.Perks.PerkDefs.PTRSweepingStrikes,
				this.Const.Perks.PerkDefs.PTRSoftMetal,
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.PTRIronSights,
				this.Const.Perks.PerkDefs.PTRConcussiveStrikes,
				this.Const.Perks.PerkDefs.ReachAdvantage,
				this.Const.Perks.PerkDefs.LegendWindReader,
				this.Const.Perks.PerkDefs.PTRTraumaSurvivor,
				this.Const.Perks.PerkDefs.Underdog,
				this.Const.Perks.PerkDefs.SunderingStrikes,
				this.Const.Perks.PerkDefs.Nimble
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PushTheAdvantage,
				this.Const.Perks.PerkDefs.PTRUtilitarian,
				this.Const.Perks.PerkDefs.LegendSpecSpearWall,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.Ballistics,
				this.Const.Perks.PerkDefs.PTRNailedIt,
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.PTRMuscleMemory,
				this.Const.Perks.PerkDefs.PTRStrengthInNumbers,
				this.Const.Perks.PerkDefs.Fearsome
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_female_inventor_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.TalentedTree,
				this.Const.Perks.OneHandedTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.RangedTree,
				this.Const.Perks.InventorMagicTree,
				this.Const.Perks.PhilosophyMagicTree,
				this.Const.Perks.MenderClassTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.TrapperClassTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendBackToBasics
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.PTRSurvivalInstinct
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.LegendBlendIn				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecBandage,
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.LegendMasteryNets
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.PTRDynamicDuo,
				this.Const.Perks.PerkDefs.LegendEscapeArtist
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,
				this.Const.Perks.PerkDefs.LegendClarity							
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFieldTriage,
				this.Const.Perks.PerkDefs.PTRRisingStar,				
				this.Const.Perks.PerkDefs.PerfectFocus				
			]
		);
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_healer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_herbalist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ApothecaryProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_husk_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.TalentedTree],
			[0, this.Const.Perks.DeviousTree],
			[0, this.Const.Perks.CalmTree],
			[0, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.TrainedTree],
			[0, this.Const.Perks.SergeantClassTree],
			[0, this.Const.Perks.HealerClassTree],
			[0, this.Const.Perks.TrapperClassTree],
			[0, this.Const.Perks.ChefClassTree],
			[0, this.Const.Perks.ClerkClassTree],
			[0, this.Const.Perks.HoundmasterClassTree],
			[0, this.Const.Perks.TacticianClassTree],
			[0, this.Const.Perks.ScoutClassTree],
			[0, this.Const.Perks.EntertainerClassTree],
			[0, this.Const.Perks.RangedTree],
			[0, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.PolearmTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.ThrowingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.CultistProfessionTree
			],
			Weapon = [
				::Const.Perks.CleaverTree,
				::Const.Perks.FlailTree
			]
		};
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_horse", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_horserider", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_horse_courser", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_horse_destrier", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	/* ::mods_hookNewObject("skills/backgrounds/legend_horse_rouncey", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	// ::mods_hookNewObject("skills/backgrounds/legend_illusionist_background", function(o) {
	// 	o.m.PerkTreeDynamic = {			
	// 			[3, ::Const.Perks.DeviousTree]
	// 		],
	// 		Magic = [
	// 			::Const.Perks.IllusionistMagicTree,
	// 		],
	// 		Traits = [
	// 			::Const.Perks.FastTree,,
	// 			::Const.Perks.TalentedTree,
	// 		],
	// 		Weapon = [
	// 			::Const.Perks.StaffTree,,
	// 			::Const.Perks.ThrowingTree,
	// 		]
	// 		Defense = [
	// 			::Const.Perks.LightArmorTree,
	// 		],
	// 		Styles = [
	// 			::Const.Perks.TwoHandedTree,,
	// 			::Const.Perks.RangedTree,
	// 		]
	// 	};
	// });

	::mods_hookNewObject("skills/backgrounds/legend_inventor_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.InventorMagicTree
			],
			Traits = [
				::Const.Perks.OrganisedTree,
				::Const.Perks.TalentedTree
			],
			Class = [
				::Const.Perks.MenderClassTree
			]
			Magic = [
				::Const.Perks.InventorMagicTree,
				::Const.Perks.PhilosophyMagicTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_inventor_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.TalentedTree,
				this.Const.Perks.OneHandedTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.RangedTree,
				this.Const.Perks.InventorMagicTree,
				this.Const.Perks.PhilosophyMagicTree,
				this.Const.Perks.MenderClassTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.TrapperClassTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendBackToBasics
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.PTRSurvivalInstinct
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.LegendBlendIn				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecBandage,
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.LegendMasteryNets
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.PTRDynamicDuo,
				this.Const.Perks.PerkDefs.LegendEscapeArtist
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness				
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFieldTriage,
				this.Const.Perks.PerkDefs.PerfectFocus				
			]
		);
	});


	::mods_hookNewObject("skills/backgrounds/legend_ironmonger_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.BlacksmithProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_leech_peddler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ApothecaryProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_lonewolf_companion_melee_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.BowTree],
			[0.4, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.RangedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[10, ::Const.Perks.BlacksmithProfessionTree],
					[10, ::Const.Perks.LaborerProfessionTree],
					[10, ::Const.Perks.MilitiaProfessionTree],
					[10, ::Const.Perks.RaiderProfessionTree],
					[10, ::Const.Perks.SoldierProfessionTree],
					[5, ::Const.Perks.AssassinProfessionTree],
					[5, ::Const.Perks.JugglerProfessionTree],
					[5, ::Const.Perks.NobleProfessionTree],
					[5, ::Const.Perks.WildlingProfessionTree],
					[3, ::Const.Perks.CultistProfessionTree],
					[2, ::Const.Perks.HolyManProfessionTree],
					[1, ::Const.Perks.ApothecaryProfessionTree],
					[1, ::Const.Perks.ButcherProfessionTree],
					[1, ::Const.Perks.MinstrelProfessionTree],
					[1, ::Const.Perks.LumberjackProfessionTree],
					[1, ::Const.Perks.TraderProfessionTree],
					[20, ::Const.Perks.NoTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_lonewolf_companion_ranged_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.HeavyArmorTree]
		];

			local trees = [
				this.Const.Perks.BowTree,
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.SlingTree,
				this.Const.Perks.ThrowingTree
			];

			for (local i = 0; i < 1; ++i)
			{
				addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [trees.remove(this.Math.rand(0, trees.len()-1))]);			
			}

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[10, ::Const.Perks.ApothecaryProfessionTree],
					[10, ::Const.Perks.JugglerProfessionTree],
					[10, ::Const.Perks.LaborerProfessionTree],
					[10, ::Const.Perks.MilitiaProfessionTree],
					[10, ::Const.Perks.NobleProfessionTree],
					[5, ::Const.Perks.MinstrelProfessionTree],
					[5, ::Const.Perks.TraderProfessionTree],
					[40, ::Const.Perks.NoTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_lurker_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.SergeantClassTree],
			[3, this.Const.Perks.ScoutClassTree],
			[3, this.Const.Perks.MediumArmorTree],
			[9, this.Const.Perks.BowTree],
			[2.4, this.Const.Perks.CrossbowTree],
			[3, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.StaffTree],
			[3, this.Const.Perks.ThrowingTree],
			[2, this.Const.Perks.OneHandedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.CultistProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::MSU.Class.WeightedContainer([
					[25, ::Const.Perks.BowTree],
					[25, ::Const.Perks.CrossbowTree],
					[25, ::Const.Perks.SlingTree],
					[25, ::Const.Perks.ThrowingTree]
				])
			],
			Styles = [
				::Const.Perks.RangedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_magister_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.ThrowingTree],
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.CultistProfessionTree
			],
			Traits = [
				::Const.Perks.CalmTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Weapon = [
				::Const.Perks.CleaverTree,
				::Const.Perks.PolearmTree
			],
			Magic = [
				::Const.Perks.PremonitionMagicTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_master_archer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.66, this.Const.Perks.ShieldTree],
			[3, this.Const.Perks.MediumArmorTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Enemy = [
				::Const.Perks.ArchersTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Class = [
				::Const.Perks.ScoutClassTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.BowTree,
				::Const.Perks.CrossbowTree,
				::Const.Perks.SlingTree,
				::Const.Perks.ThrowingTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_man_at_arms_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.8, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.SlingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[80, ::Const.Perks.SergeantClassTree],
					[20, ::Const.Perks.TacticianClassTree]
				])
			]
		};
	});

 // 	::mods_hookNewObject("skills/backgrounds/legend_necromancer_background", function(o) {
	// 	o.m.PerkGroupMultipliers <- [
	// 			[3, this.Const.Perks.ViciousTree],
	// 			[3, this.Const.Perks.CalmTree],
	// 			[3, this.Const.Perks.TalentedTree],
	// 			[2, this.Const.Perks.UnstoppableTree],
	// 			[0.5, this.Const.Perks.SwordTree],
	// 			[0.25, this.Const.Perks.AxeTree],
	// 			[2, this.Const.Perks.DaggerTree],
	// 			[0.2, this.Const.Perks.ChefClassTree]
	// 		],

	// 	o.m.PerkTreeDynamic = {
	//		Profession = [
	// 			::Const.Perks.BasicNecroMagicTree,
	// 		],
	// 		Class = [
	// 			::Const.Perks.HealerClassTree,
	// 		],
	// 		Defense = [
	// 			::Const.Perks.LightArmorTree,
	// 		],
	// 		Weapon = [
	// 			::Const.Perks.StaffTree,
	// 		],
	// 		Styles = [
	// 			::Const.Perks.TwoHandedTree,
	// 		],
	// 	};
	// });

	::mods_hookNewObject("skills/backgrounds/legend_necrosavant_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.2, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.FastTree],
			[3, this.Const.Perks.AgileTree],
			[3, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.UnstoppableTree],
			[2, this.Const.Perks.ResilientTree],
			[0.2, this.Const.Perks.ChefClassTree],
			[0, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.HeavyArmorTree],
			[3, this.Const.Perks.DaggerTree],
			[2, this.Const.Perks.SwordTree],
			[0.5, this.Const.Perks.AxeTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.VampireMagicTree
			],
			Traits = [
				::Const.Perks.ViciousTree,
				::Const.Perks.UnstoppableTree,
				::Const.Perks.ResilientTree
			],
			Class = [
				::Const.Perks.HealerClassTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			],
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_necro_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.CleaverTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.OneHandedTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.ResilientTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.HoundmasterClassTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.TalentedTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.LegendSpawnZombieLow,
				this.Const.Perks.PerkDefs.LegendSpawnSkeletonLow,
				this.Const.Perks.PerkDefs.LegendSpecialistNinetailsSkill,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheSkill
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendPrepareBleed,
				this.Const.Perks.PerkDefs.LegendRust,
				this.Const.Perks.PerkDefs.LegendMedPackages
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
				this.Const.Perks.PerkDefs.LegendPrepareGraze,
				this.Const.Perks.PerkDefs.LegendLacerate
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGhoul,
				this.Const.Perks.PerkDefs.LegendExtendendAura,
				this.Const.Perks.PerkDefs.LegendSpecialistNinetailsDamage,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheDamage,
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.LegendSpawnZombieMed,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
				this.Const.Perks.PerkDefs.LegendSpawnZombieMed
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendReclamation,
				this.Const.Perks.PerkDefs.LegendBrinkOfDeath,
				this.Const.Perks.PerkDefs.LegendConservation,
				this.Const.Perks.PerkDefs.LegendSlaughter
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendPossession,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendChanneledPower

			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpawnSkeletonHigh,
				this.Const.Perks.PerkDefs.LegendViolentDecomposition,
				this.Const.Perks.PerkDefs.LegendSpawnZombieHigh,
				this.Const.Perks.PerkDefs.PTRRisingStar	
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_necro_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.CleaverTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.OneHandedTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.ResilientTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.HoundmasterClassTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.TalentedTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.LegendSpawnZombieLow,
				this.Const.Perks.PerkDefs.LegendSpawnSkeletonLow,
				this.Const.Perks.PerkDefs.LegendSpecialistNinetailsSkill,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheSkill
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendPrepareBleed,
				this.Const.Perks.PerkDefs.LegendRust,
				this.Const.Perks.PerkDefs.LegendMedPackages
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
				this.Const.Perks.PerkDefs.LegendPrepareGraze,
				this.Const.Perks.PerkDefs.LegendLacerate
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendExtendendAura,
				this.Const.Perks.PerkDefs.LegendSpecialistNinetailsDamage,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheDamage,
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.LegendSpawnZombieMed,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
				this.Const.Perks.PerkDefs.LegendSpawnZombieMed
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendReclamation,
				this.Const.Perks.PerkDefs.LegendBrinkOfDeath,
				this.Const.Perks.PerkDefs.LegendConservation,
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendPossession,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendChanneledPower

			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpawnSkeletonHigh,
				this.Const.Perks.PerkDefs.LegendViolentDecomposition,
				this.Const.Perks.PerkDefs.LegendSpawnZombieHigh
			]
		);
	});

 	::mods_hookNewObject("skills/backgrounds/legend_nightwatch_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.TrainedTree],
			[2, this.Const.Perks.CalmTree],
			[0.5, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.SergeantClassTree],
			[2, this.Const.Perks.ScoutClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.MilitiaProfessionTree
			]
		};
	});

 	::mods_hookNewObject("skills/backgrounds/legend_noble_2h", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.DeviousTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0.33, this.Const.Perks.ThrowingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			],
			Styles = [
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_noble_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.NobleProfessionTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.SergeantClassTree,
				this.Const.Perks.TacticianClassTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.TalentedTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.MediumArmorTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.BagsAndBelts
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRPatternRecognition
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBandit,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBarbarian
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRExudeConfidence,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.PTRBetweenTheEyes
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBully
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendRelax,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.BattleFlow
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_noble_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.NobleProfessionTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.SergeantClassTree,
				this.Const.Perks.TacticianClassTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.TalentedTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.MediumArmorTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.BagsAndBelts
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRPatternRecognition
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBandit,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBarbarian
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRExudeConfidence,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.PTRBetweenTheEyes
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBully
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendRelax,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.BattleFlow
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_noble_event_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.CalmTree],
			[3, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.TrainedTree],
			[2, this.Const.Perks.ViciousTree],
			[0, this.Const.Perks.DeviousTree],
			[0, this.Const.Perks.ShieldTree],
			[3, this.Const.Perks.SwordTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.NobleProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.TacticianClassTree]
				])
			],
			Weapon = [
				::Const.Perks.PolearmTree
			],
			Styles = [
				::Const.Perks.TwoHandedTree,
				::Const.Perks.OneHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_noble_ranged", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.MediumArmorTree],
			[9, this.Const.Perks.BowTree],
			[0.5, this.Const.Perks.PolearmTree],
			[0.5, this.Const.Perks.StaffTree],
			[3, this.Const.Perks.SlingTree],
			[3, this.Const.Perks.ThrowingTree]
		];

		o.m.PerkTreeDynamic = {
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.CrossbowTree
			],			
			Styles = [
				::Const.Perks.RangedTree,
				::Const.Perks.OneHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_noble_shield", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.DeviousTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			],
			Defense = [
				::Const.Perks.ShieldTree
			]
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_nun_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.UnstoppableTree],
			[3, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.HealerClassTree]
				])

			],
			Weapon = [
				::Const.Perks.StaffTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_peddler_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

	 	addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			 [
			 	 this.Const.Perks.CrossbowTree,
				 this.Const.Perks.SwordTree,
				 this.Const.Perks.SpearTree,
				 this.Const.Perks.OneHandedTree,
				 this.Const.Perks.TwoHandedTree,
				 this.Const.Perks.RangedTree,
				 this.Const.Perks.LightArmorTree,
				 this.Const.Perks.MediumArmorTree,
				 this.Const.Perks.ShieldTree,
				 this.Const.Perks.DeviousTree,
				 this.Const.Perks.TalentedTree,
				 this.Const.Perks.EntertainerClassTree,
				 this.Const.Perks.OrganisedTree,
				 this.Const.Perks.ClerkClassTree,
				 this.Const.Perks.TraderProfessionTree
			 ]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendCheerOn,
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.LegendMealPreperation,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.FastAdaption
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.LegendPeaceful,
				this.Const.Perks.PerkDefs.LegendShieldsUp
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.Underdog
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHoldTheLine
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_philosopher_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.66, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.TrapperClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PhilosophyMagicTree
			],
			Traits = [
				::Const.Perks.TalentedTree
			]
		};
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_premonitionist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_preserver_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [
				this.Const.Perks.AgileTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.SlingTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.RangedTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.LegendMedPackages,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.LegendSpecialistSickleSkill,
				this.Const.Perks.PerkDefs.PTRDeepCuts
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.Gifted,
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.LegendGatherer,
				this.Const.Perks.PerkDefs.RallyTheTroops,
				this.Const.Perks.PerkDefs.LegendPrepareBleed
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.LegendSpecialistSickleDamage,
				this.Const.Perks.PerkDefs.Debilitate,		
				this.Const.Perks.PerkDefs.LegendHerbcraft,
				this.Const.Perks.PerkDefs.Lookout,
				this.Const.Perks.PerkDefs.LegendPrepareGraze,											
				this.Const.Perks.PerkDefs.LegendBloodbath
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.PTRDiscoveredTalent,
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.LegendSpecBandage,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGhoul,				
				this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
				this.Const.Perks.PerkDefs.LegendPoisonImmunity,
				this.Const.Perks.PerkDefs.LegendPotionBrewer
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [				
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.LegendSlaughter,
				this.Const.Perks.PerkDefs.Duelist,				
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.LegendBlendIn,
				this.Const.Perks.PerkDefs.LegendConservation				
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.LegendMindOverBody,
				this.Const.Perks.PerkDefs.LegendAssuredConquest,
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,				
				this.Const.Perks.PerkDefs.InspiringPresence,				
				this.Const.Perks.PerkDefs.LegendReclamation
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.PTRRisingStar,
				this.Const.Perks.PerkDefs.Fearsome,								
				this.Const.Perks.PerkDefs.LegendFieldTriage,
				this.Const.Perks.PerkDefs.Inspire,	
				this.Const.Perks.PerkDefs.PerfectFocus,							
				this.Const.Perks.PerkDefs.PTRTunnelVision			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_puppet_background", function(o) {
		o.m.PerkGroupMultipliers <- [
				[0.5, this.Const.Perks.CaravanTree],
				[0.5, this.Const.Perks.NoblesTree],
				[0.33, this.Const.Perks.ViciousTree],
				[0, this.Const.Perks.DeviousTree],
				[0, this.Const.Perks.TalentedTree],
				[0, this.Const.Perks.CalmTree],
				[0, this.Const.Perks.OrganisedTree],
				[0, this.Const.Perks.TrainedTree],
				[0, this.Const.Perks.BowTree],
				[0, this.Const.Perks.CrossbowTree],
				[0, this.Const.Perks.SlingTree],
				[0, this.Const.Perks.ThrowingTree],
				[0, this.Const.Perks.RangedTree]
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.RaiderProfessionTree
			],
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_puppet_master_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [
				this.Const.Perks.ResilientTree,
				this.Const.Perks.TalentedTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.HeavyArmorTree,
				this.Const.Perks.CleaverTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.TwoHandedTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheSkill,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.PTRDeepImpact,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.PTRRattle,
				this.Const.Perks.PerkDefs.LegendPossession	
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.LegendWither,
				this.Const.Perks.PerkDefs.LegendPrepareBleed,
				this.Const.Perks.PerkDefs.LegendPrepareGraze,
				this.Const.Perks.PerkDefs.PTRMenacing
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendSpecialistScytheDamage,
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.Steadfast,		
				this.Const.Perks.PerkDefs.LegendRust,
				this.Const.Perks.PerkDefs.LegendBloodbath
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendLacerate,
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNomad,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendMasteryStaves,
				this.Const.Perks.PerkDefs.LegendEfficientPacking,				
				this.Const.Perks.PerkDefs.SunderingStrikes
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Underdog,				
				this.Const.Perks.PerkDefs.LegendInsects,
				this.Const.Perks.PerkDefs.PTRUtilitarian,
				this.Const.Perks.PerkDefs.LegendSlaughter,				
				this.Const.Perks.PerkDefs.LegendSkillfulStacking,
				this.Const.Perks.PerkDefs.PTRBully
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.SunderingStrikes,
				this.Const.Perks.PerkDefs.Berserk,
				this.Const.Perks.PerkDefs.LegendSiphon,				
				this.Const.Perks.PerkDefs.Fearsome
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRTunnelVision,
				this.Const.Perks.PerkDefs.LegendMuscularity,
				this.Const.Perks.PerkDefs.PerfectFocus,								
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.LegendMiasma,	
				this.Const.Perks.PerkDefs.LegendDeathtouch,
				this.Const.Perks.PerkDefs.PTRRisingStar
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_ranger_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.BowTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.RangedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.AgileTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.BeastsTree,
				this.Const.Perks.OrcsTree,
				this.Const.Perks.ArchersTree,
				this.Const.Perks.HoundmasterClassTree,				
				this.Const.Perks.CrossbowTree			
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.FastAdaption,			
				this.Const.Perks.PerkDefs.LegendMarkTarget,
				this.Const.Perks.PerkDefs.Adrenaline,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.LegendSummonHound,
				this.Const.Perks.PerkDefs.PTRSmallTarget
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendOnslaught,
				this.Const.Perks.PerkDefs.SpecSpear,				
				this.Const.Perks.PerkDefs.Rotation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [		
				this.Const.Perks.PerkDefs.PTRPatience,
				this.Const.Perks.PerkDefs.LegendSummonFalcon,
				this.Const.Perks.PerkDefs.LegendAmmoBinding
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Berserk,			
				this.Const.Perks.PerkDefs.LegendSummonWolf,
				this.Const.Perks.PerkDefs.LegendAmmoBundles
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendCascade,
				this.Const.Perks.PerkDefs.PTRUnstoppable,				
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,	
				this.Const.Perks.PerkDefs.LegendHidden			
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendHairSplitter,
				this.Const.Perks.PerkDefs.LegendBigGameHunter,
				this.Const.Perks.PerkDefs.KillingFrenzy,		
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.PTRDeathFromAfar
			]
		);
	});


	::mods_hookNewObject("skills/backgrounds/legend_ranger_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.BowTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.RangedTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.AgileTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.BeastsTree,
				this.Const.Perks.OrcsTree,
				this.Const.Perks.ArchersTree,
				this.Const.Perks.HoundmasterClassTree,				
				this.Const.Perks.CrossbowTree			
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.FastAdaption,			
				this.Const.Perks.PerkDefs.LegendMarkTarget,
				this.Const.Perks.PerkDefs.Adrenaline,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.LegendSummonHound,
				this.Const.Perks.PerkDefs.PTRSmallTarget
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendOnslaught,
				this.Const.Perks.PerkDefs.SpecSpear,			
				this.Const.Perks.PerkDefs.Rotation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHairSplitter,			
				this.Const.Perks.PerkDefs.PTRPatience,
				this.Const.Perks.PerkDefs.LegendSummonFalcon,
				this.Const.Perks.PerkDefs.LegendAmmoBinding
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Berserk,			
				this.Const.Perks.PerkDefs.LegendSummonWolf,
				this.Const.Perks.PerkDefs.LegendAmmoBundles
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendCascade,
				this.Const.Perks.PerkDefs.PTRUnstoppable,				
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,	
				this.Const.Perks.PerkDefs.LegendHidden			
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.LegendBigGameHunter,
				this.Const.Perks.PerkDefs.KillingFrenzy,				
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.PTRDeathFromAfar
			]
		);
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_runesmith_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_shieldmaiden_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.FastTree],
			[0.25, this.Const.Perks.AgileTree],
			[0.1, this.Const.Perks.LightArmorTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[90, ::Const.Perks.LaborerProfessionTree],
					[10, ::Const.Perks.WildlingProfessionTree]
				])
			],
			Defense = [
				::Const.Perks.ShieldTree
			],
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});

	/* ::mods_hookNewObject("skills/backgrounds/legend_spiritualist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			]
		};
	}); */

	::mods_hookNewObject("skills/backgrounds/legend_taxidermist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[5, this.Const.Perks.TrapperClassTree],
			[2, this.Const.Perks.HoundmasterClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Enemy = [
				::Const.Perks.BeastsTree
			],
		 	Traits = [
				::Const.Perks.OrganisedTree
			],
			Class = [
				::Const.Perks.MenderClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_trader_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

	 	addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			 [
			 	 this.Const.Perks.CrossbowTree,
				 this.Const.Perks.SwordTree,
				 this.Const.Perks.SpearTree,
				 this.Const.Perks.OneHandedTree,
				 this.Const.Perks.TwoHandedTree,
				 this.Const.Perks.RangedTree,
				 this.Const.Perks.LightArmorTree,
				 this.Const.Perks.MediumArmorTree,
				 this.Const.Perks.ShieldTree,
				 this.Const.Perks.DeviousTree,
				 this.Const.Perks.TalentedTree,
				 this.Const.Perks.EntertainerClassTree,
				 this.Const.Perks.OrganisedTree,
				 this.Const.Perks.ClerkClassTree,
				 this.Const.Perks.TraderProfessionTree
			 ]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendCheerOn,
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.LegendMealPreperation,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.FastAdaption
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.LegendPeaceful,
				this.Const.Perks.PerkDefs.LegendShieldsUp				
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.Underdog
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHoldTheLine
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_trader_commander_background", function(o) {
	 	o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

	 	addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			 [
			 	 this.Const.Perks.CrossbowTree,
				 this.Const.Perks.SwordTree,
				 this.Const.Perks.SpearTree,
				 this.Const.Perks.OneHandedTree,
				 this.Const.Perks.TwoHandedTree,
				 this.Const.Perks.RangedTree,
				 this.Const.Perks.LightArmorTree,
				 this.Const.Perks.MediumArmorTree,
				 this.Const.Perks.ShieldTree,
				 this.Const.Perks.DeviousTree,
				 this.Const.Perks.TalentedTree,
				 this.Const.Perks.EntertainerClassTree,
				 this.Const.Perks.OrganisedTree,
				 this.Const.Perks.ClerkClassTree,
				 this.Const.Perks.TraderProfessionTree
			 ]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.LegendCheerOn,
				this.Const.Perks.PerkDefs.LegendMedIngredients,
				this.Const.Perks.PerkDefs.LegendMealPreperation,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.FastAdaption
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Anticipation
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.LegendPeaceful,
				this.Const.Perks.PerkDefs.LegendShieldsUp				
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.Underdog
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendHoldTheLine
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound
			]
		);
	});


 	::mods_hookNewObject("skills/backgrounds/legend_vala_background", function(o) {

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			 [
			 	 this.Const.Perks.ValaSpiritMagicTree,
				 this.Const.Perks.ValaChantMagicTree,
				 this.Const.Perks.ValaTranceMagicTree,
				 this.Const.Perks.CalmTree,
				 this.Const.Perks.TalentedTree,
				 this.Const.Perks.SergeantClassTree,
				 this.Const.Perks.LightArmorTree,
				 this.Const.Perks.TwoHandedTree,
				 this.Const.Perks.StaffTree,
			 ]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRRisingStar
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/legend_vala_commander_background", function(o) {

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
	 		[
		 		this.Const.Perks.ValaSpiritMagicTree,
		 		this.Const.Perks.ValaChantMagicTree,
		 		this.Const.Perks.ValaTranceMagicTree,
		 		this.Const.Perks.CalmTree,
		 		this.Const.Perks.TalentedTree,
		 		this.Const.Perks.SergeantClassTree,
		 		this.Const.Perks.LightArmorTree,
		 		this.Const.Perks.TwoHandedTree,
		 		this.Const.Perks.StaffTree,
	 		]
	 	);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRRisingStar
			]
		);	 	
	});

	// ::mods_hookNewObject("skills/backgrounds/legend_warlock_background", function(o) {
	// 	o.m.PerkGroupMultipliers <- [
	// 			[0, this.Const.Perks.OrganisedTree],
	// 			[0, this.Const.Perks.ViciousTree],
	// 			[0, this.Const.Perks.CalmTree],
	// 			[0, this.Const.Perks.TalentedTree],
	// 			[0, this.Const.Perks.UnstoppableTree],
	// 			[0.2, this.Const.Perks.ChefClassTree],
	// 			[0.5, this.Const.Perks.SwordTree],
	// 			[0.25, this.Const.Perks.AxeTree]
	// 		],

	// 	o.m.PerkTreeDynamic = {
	//		Profession = [
	// 			::Const.Perks.WarlockMagicTree,
	// 		],
	// 		Class = [
	// 			::Const.Perks.HealerClassTree,
	// 		],
	// 		Weapon = [
	// 			::Const.Perks.StaffTree,
	// 		],
	// 		Defense = [
	// 			::Const.Perks.LightArmorTree,
	// 		],
	// 		Styles = [
	// 			::Const.Perks.TwoHandedTree,
	// 		],
	// 	};
	// });

	::mods_hookNewObject("skills/backgrounds/legend_warlock_summoner_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [
				this.Const.Perks.TalentedTree,
				this.Const.Perks.ChefClassTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.CleaverTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.StaffTree,
				this.Const.Perks.TwoHandedTree
			]
		);


		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.LegendSpawnZombieLow,
				this.Const.Perks.PerkDefs.NineLives,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheSkill
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.LegendPrepareBleed,
				this.Const.Perks.PerkDefs.LegendPrepareGraze,
				this.Const.Perks.PerkDefs.QuickHands
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.HoldOut,
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.LegendEfficientPacking,		
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.LegendSpecialistScytheDamage,
				this.Const.Perks.PerkDefs.LegendBloodbath				
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.LegendLacerate,
				this.Const.Perks.PerkDefs.LegendSpawnZombieMed,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,				
				this.Const.Perks.PerkDefs.LegendFavouredEnemyBandit,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble				
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendBlendIn,				
				this.Const.Perks.PerkDefs.Underdog,
				this.Const.Perks.PerkDefs.LegendSkillfulStacking,
				this.Const.Perks.PerkDefs.LegendReclamation,				
				this.Const.Perks.PerkDefs.LegendSlaughter
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Duelist,
				this.Const.Perks.PerkDefs.LegendHidden
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Fearsome,
				this.Const.Perks.PerkDefs.PTRTunnelVision,
				this.Const.Perks.PerkDefs.PerfectFocus,								
				this.Const.Perks.PerkDefs.LegendSpawnZombieHigh,
				this.Const.Perks.PerkDefs.LegendExtendendAura,
				this.Const.Perks.PerkDefs.PTRRisingStar
			]
		);
	});

	// ::mods_hookNewObject("skills/backgrounds/legend_witch_background", function(o) {
	// 	o.m.PerkTreeDynamic = {			
	// 		],
	// 		Traits = [
	// 			::Const.Perks.TalentedTree,,
	// 			::Const.Perks.CalmTree,
	// 		],
	// 		Defense = [
	// 			::Const.Perks.LightArmorTree,
	// 		],
	// 		Weapon = [
	// 			::Const.Perks.StaffTree,
	// 		],
	// 		Styles = [
	// 			::Const.Perks.TwoHandedTree,
	// 		],
	// 		Magic = [
	// 			::Const.Perks.PremonitionMagicTree,,
	// 			::Const.Perks.PhilosophyMagicTree,,
	// 			::Const.Perks.InventorMagicTree,
	// 		]
	// 	};
	// });

	::mods_hookNewObject("skills/backgrounds/legend_witch_commander_background", function(o) {

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
	 		[
	 			this.Const.Perks.TalentedTree,
	 			this.Const.Perks.StaffTree,
	 			this.Const.Perks.TwoHandedTree
	 		]
	 	);

	 	addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemyAlps,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyVampire				
			]
		);

	 	addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRRisingStar				
			]
		);		
	});

	::mods_hookNewObject("skills/backgrounds/lumberjack_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LumberjackProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/mage_background", function(o) {
		o.m.PerkTreeDynamic = null;

		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.StaffTree,
				this.Const.Perks.TalentedTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBloodyHarvest
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRFormidableApproach
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRSweepingStrikes,
				this.Const.Perks.PerkDefs.ReachAdvantage,
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [		
				this.Const.Perks.PerkDefs.PTRRisingStar				
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/mage_legend_mage_commander_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

	 	addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.StaffTree,
				this.Const.Perks.TalentedTree
			]
		);

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [

			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBloodyHarvest
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRFormidableApproach
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRSweepingStrikes,
				this.Const.Perks.PerkDefs.ReachAdvantage,
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [	
				this.Const.Perks.PerkDefs.PTRRisingStar						
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/lindwurm_slayer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.DeviousTree],
			[0, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.LightArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.RangedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			],
			Enemy = [
				::Const.Perks.LindwurmTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_lonewolf_background", function(o) {
		o.m.CustomPerkTree = clearCustomPerkTree(o.m.CustomPerkTree);

		addPerkTreesToCustomPerkTree(o.m.CustomPerkTree,
			[
				this.Const.Perks.LargeTree,
				this.Const.Perks.ResilientTree,
				this.Const.Perks.SturdyTree,			
				this.Const.Perks.UnstoppableTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.HeavyArmorTree
			]
		);

		local trees = [
			this.Const.Perks.AxeTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.HammerTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.SpearTree,
			this.Const.Perks.SwordTree
		];

		for (local i = 0; i < 3; ++i)
		{
			addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [trees.remove(this.Math.rand(0, trees.len()-1))]);			
		}

		addPerksToCustomPerkTree(1, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.STRPhalanx,
				this.Const.Perks.PerkDefs.PTRProfessional,
				this.Const.Perks.PerkDefs.PTRMenacing
			]
		);

		addPerksToCustomPerkTree(2, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.FortifiedMind,
				this.Const.Perks.PerkDefs.PTRExudeConfidence,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.STRCoverAlly,
				this.Const.Perks.PerkDefs.Gifted
			]
		);

		addPerksToCustomPerkTree(3, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRBully,
				this.Const.Perks.PerkDefs.PTRPatternRecognition,
				this.Const.Perks.PerkDefs.PTRFormidableApproach
			]
		);

		addPerksToCustomPerkTree(4, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Underdog,
				this.Const.Perks.PerkDefs.PTRWearsItWell,
				this.Const.Perks.PerkDefs.PTRPersonalArmor,
				this.Const.Perks.PerkDefs.PTRVigilant,
				this.Const.Perks.PerkDefs.STRLineBreaker
			]
		);

		addPerksToCustomPerkTree(5, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.DoubleStrike
			]
		);

		addPerksToCustomPerkTree(6, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,				
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.PTRSweepingStrikes
			]
		);

		addPerksToCustomPerkTree(7, o.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Rebound,				
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.PTRManOfSteel
			]
		);
	});

	::mods_hookNewObject("skills/backgrounds/manhunter_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.NomadsTree],
			[0.5, this.Const.Perks.OrganisedTree],
			[0.5, this.Const.Perks.HealerClassTree],
			[2, this.Const.Perks.TacticianClassTree],
			[2, this.Const.Perks.MaceTree],
			[4, this.Const.Perks.CleaverTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.SlingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.RaiderProfessionTree
			],
			Class = [
				::Const.Perks.TrapperClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/mason_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.LargeTree],
			[1.5, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.SturdyTree],
			[6, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.HeavyArmorTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/messenger_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.LargeTree],
			[1.5, this.Const.Perks.FastTree],
			[6, this.Const.Perks.AgileTree],
			[2, this.Const.Perks.UnstoppableTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.LaborerProfessionTree],
					[50, ::Const.Perks.ServiceProfessionTree]
				])
			],
			Class = [
				::Const.Perks.ScoutClassTree
			],
			Weapon = [
				::Const.Perks.SlingTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/militia_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.MilitiaProfessionTree
			],
			Traits = [
				::Const.Perks.TrainedTree
			]	
		};
	});

	::mods_hookNewObject("skills/backgrounds/miller_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.LargeTree],
			[1.5, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.SturdyTree],
			[0.5, this.Const.Perks.TrainedTree],
			[1.5, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/miner_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.MinerProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/minstrel_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.MinstrelProfessionTree
			],
			Class = [
				::Const.Perks.EntertainerClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/monk_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.UnstoppableTree],
			[3, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.TalentedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Weapon = [
				::Const.Perks.StaffTree
			]
		};
	});

	 ::mods_hookNewObject("skills/backgrounds/monk_turned_flagellant_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.SturdyTree],
			[3, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.ViciousTree],
			[3, this.Const.Perks.LightArmorTree],
			[0.33, this.Const.Perks.ShieldTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Weapon = [
				::Const.Perks.CleaverTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/nomad_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.SouthernersTree],
			[2, this.Const.Perks.ResilientTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[2, this.Const.Perks.ScoutClassTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.RaiderProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/nomad_ranged_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.SouthernersTree],
			[5, this.Const.Perks.ViciousTree],
			[0.5, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.ScoutClassTree],
			[0.33, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.MediumArmorTree],
			[0.25, this.Const.Perks.CalmTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::MSU.Class.WeightedContainer([
					[25, ::Const.Perks.BowTree],
					[25, ::Const.Perks.CrossbowTree],
					[25, ::Const.Perks.SlingTree],
					[25, ::Const.Perks.ThrowingTree]
				])
			]			
		};
	});

	::mods_hookNewObject("skills/backgrounds/old_gladiator_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.TacticianClassTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[20, ::Const.Perks.RaiderProfessionTree],
					[10, ::Const.Perks.SoldierProfessionTree],
					[70, ::Const.Perks.NoTree]
				])
			],
			Class = [
				::Const.Perks.TrapperClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/old_paladin_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0, this.Const.Perks.DeviousTree],
			[0, this.Const.Perks.OrganisedTree],
			[1.33, this.Const.Perks.TrainedTree],
			[0, this.Const.Perks.LightArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.RangedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree,
				::Const.Perks.LaborerProfessionTree
			],
			Class = [ 
				::Const.Perks.SergeantClassTree
			],
			Weapon = [
				::Const.Perks.PolearmTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/orc_slayer_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.AgileTree],
			[0.1, this.Const.Perks.DeviousTree],
			[0.5, this.Const.Perks.CalmTree],
			[0.5, this.Const.Perks.FastTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[0.33, this.Const.Perks.LightArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Enemy = [
				::Const.Perks.OrcTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Defense = [
				::Const.Perks.HeavyArmorTree
			],
			Weapon = [
				::Const.Perks.HammerTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	 ::mods_hookNewObject("skills/backgrounds/pacified_flagellant_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.SturdyTree],
			[2, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.LightArmorTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/paladin_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.2, this.Const.Perks.AgileTree],
			[0, this.Const.Perks.DeviousTree],
			[1.2, this.Const.Perks.FastTree],
			[0, this.Const.Perks.OrganisedTree],
			[1.33, this.Const.Perks.TrainedTree],
			[1.5, this.Const.Perks.MenderClassTree],
			[1.5, this.Const.Perks.SergeantClassTree],
			[1.5, this.Const.Perks.TacticianClassTree],
			[0, this.Const.Perks.LightArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.5, this.Const.Perks.DaggerTree],
			[0, this.Const.Perks.RangedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[5, ::Const.Perks.SoldierProfessionTree],
					[5, ::Const.Perks.MilitiaProfessionTree],
					[3, ::Const.Perks.RaiderProfessionTree],
					[1, ::Const.Perks.NobleProfessionTree],
					[1, ::Const.Perks.WildlingProfessionTree],
					[1, ::Const.Perks.JugglerProfessionTree],
					[5, ::Const.Perks.ButcherProfessionTree],
					[5, ::Const.Perks.DiggerProfessionTree],
					[5, ::Const.Perks.FarmerProfessionTree],
					[5, ::Const.Perks.LaborerProfessionTree],
					[5, ::Const.Perks.LumberjackProfessionTree],
					[5, ::Const.Perks.MinerProfessionTree],
					[54, ::Const.Perks.NoTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/peddler_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.TraderProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/peddler_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.TraderProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_pilgrim_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[4, this.Const.Perks.DeviousTree],
			[0.2, this.Const.Perks.SergeantClassTree],
			[0.2, this.Const.Perks.HealerClassTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/pimp_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Class = [
				::Const.Perks.ClerkClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/poacher_background", function(o) {
		o.m.SpecialPerkMultipliers = [
			[1.5, ::Const.Perks.PerkDefs.LegendBigGameHunter],
			[1.5, ::Const.Perks.PerkDefs.PTRMarksmanship]
		];
		o.m.PerkGroupMultipliers <- [
			[0.5, ::Const.Perks.AgileTree],
			[0.5, ::Const.Perks.ResilientTree],
			[0.5, ::Const.Perks.LargeTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Class = [
				::Const.Perks.ScoutClassTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.BowTree
			]			
		};
	});

	::mods_hookNewObject("skills/backgrounds/raider_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[2, this.Const.Perks.MediumArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.RaiderProfessionTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/ratcatcher_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[5, this.Const.Perks.FastTree],
			[5, this.Const.Perks.AgileTree],
			[2, this.Const.Perks.ViciousTree]
		];

		o.m.PerkTreeDynamic = {
			Class = [
				::Const.Perks.TrapperClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/refugee_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.CalmTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/retired_soldier_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.66, this.Const.Perks.AgileTree],
			[0.66, this.Const.Perks.FastTree],
			[0.25, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.TalentedTree],
			[0.66, this.Const.Perks.LightArmorTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SoldierProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.SergeantClassTree],
					[50, ::Const.Perks.TacticianClassTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/regent_in_absentia_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.1, this.Const.Perks.OrganisedTree],
			[0, this.Const.Perks.DeviousTree],
			[0, this.Const.Perks.BowTree],
			[0.4, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree],
			[1.25, this.Const.Perks.TrainedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.NobleProfessionTree
			],
			Weapon = [
				::Const.Perks.SwordTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/sellsword_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.MercenaryTree],
			[0.1, this.Const.Perks.OrganisedTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[60, ::Const.Perks.RaiderProfessionTree],
					[25, ::Const.Perks.SoldierProfessionTree],
					[15, ::Const.Perks.NoTree]
				])
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/servant_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/servant_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.TalentedTree],
			[2, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/shepherd_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			],
			Weapon = [
				::Const.Perks.SlingTree,
				::Const.Perks.StaffTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/shepherd_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			],
			Weapon = [
				::Const.Perks.SlingTree,
				::Const.Perks.StaffTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/slave_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.SouthernersTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/slave_barbarian_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.SouthernersTree],
			[0.4, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.CalmTree],
			[5, this.Const.Perks.ResilientTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[50, ::Const.Perks.RaiderProfessionTree],
					[50, ::Const.Perks.WildlingProfessionTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/slave_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.SouthernersTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.PauperProfessionTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/squire_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.CalmTree],
			[0.2, this.Const.Perks.OrganisedTree],
			[0.25, this.Const.Perks.DeviousTree],
			[0.5, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.HeavyArmorTree],
			[0.5, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::MSU.Class.WeightedContainer([
					[30, ::Const.Perks.SoldierProfessionTree],
					[70, ::Const.Perks.NoTree]
				])
			],
			Traits = [
				::Const.Perks.TrainedTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[75, ::Const.Perks.SergeantClassTree],
					[25, ::Const.Perks.TacticianClassTree]
				])
			],
			Weapon = [
				::Const.Perks.PolearmTree,
				::Const.Perks.SwordTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/swordmaster_background", function(o) {
		o.m.IsSet <- false;

		o.m.SpecialPerkMultipliers = [
			[-1, ::Const.Perks.PerkDefs.BFFencer]
		];

		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.AgileTree],
			[2, this.Const.Perks.CalmTree],
			[3, this.Const.Perks.ViciousTree],
			[0.5, this.Const.Perks.FastTree],
			[0.5, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.UnstoppableTree],
			[0, this.Const.Perks.HeavyArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree],
			[0, this.Const.Perks.ThrowingTree],
			[2, this.Const.Perks.PolearmTree],
			[0.66, this.Const.Perks.SpearTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.SwordmasterProfessionTree
			]
			Enemy = [
				::Const.Perks.SwordmastersTree
			],
			Traits = [
				::Const.Perks.TalentedTree
			],
			Weapon = [
				::Const.Perks.SwordTree
			],
			Styles = [
				::Const.Perks.OneHandedTree,
				::Const.Perks.TwoHandedTree
			],
			Enemy = [
				::Const.Perks.SwordmastersTree
			]
		};

		local onAdded = o.onAdded;
		o.onAdded = function()
		{
			onAdded();
			this.getContainer().add(this.new("scripts/skills/effects/ptr_swordmasters_finesse_effect"));
		}

		local buildPerkTree = o.buildPerkTree;
		o.buildPerkTree = function()
		{
			if (this.m.CustomPerkTree == null)
			{
				local ret = buildPerkTree();
				local masteryRow = this.getPerkTree()[3];
				for (local i = masteryRow.len() - 1; i >= 0; i--)
				{
					if (masteryRow[i].ID != "perk.mastery.sword" && masteryRow[i].ID.find("mastery") != null)
					{
						this.removePerk(::Const.Perks.PerkDefs[masteryRow[i].Const]);
					}
				}

				return ret;
			}

			return buildPerkTree();
		}
	});

	::mods_hookNewObject("skills/backgrounds/tailor_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.TalentedTree],
			[1.5, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Class = [
				::Const.Perks.MenderClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/tailor_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[1.5, this.Const.Perks.TalentedTree],
			[1.5, this.Const.Perks.OrganisedTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ServiceProfessionTree
			],
			Class = [
				::Const.Perks.MenderClassTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/thief_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.5, this.Const.Perks.SturdyTree],
			[0.75, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.FastTree],
			[1.5, this.Const.Perks.AgileTree],
			[1.25, this.Const.Perks.TalentedTree],
			[0.66, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.OneHandedTree],
			[3, this.Const.Perks.DaggerTree]
		];

		o.m.PerkTreeDynamic = {
			Traits = [
				::Const.Perks.DeviousTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/thief_southern_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[0.5, this.Const.Perks.SturdyTree],
			[0.75, this.Const.Perks.ResilientTree],
			[1.5, this.Const.Perks.FastTree],
			[1.5, this.Const.Perks.AgileTree],
			[1.25, this.Const.Perks.TalentedTree],
			[0.66, this.Const.Perks.ShieldTree],
			[2, this.Const.Perks.OneHandedTree],
			[3, this.Const.Perks.DaggerTree]
		];

		o.m.PerkTreeDynamic = {
			Traits = [
				::Const.Perks.DeviousTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/vagabond_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[0.5, this.Const.Perks.LargeTree],
			[2, this.Const.Perks.UnstoppableTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.LaborerProfessionTree
			],
			Class = [
				::MSU.Class.WeightedContainer([
					[75, ::Const.Perks.ScoutClassTree],
					[25, ::Const.Perks.NoTree]
				])
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/wildman_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.ViciousTree],
			[0.4, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.LargeTree],
			[2, this.Const.Perks.SturdyTree],
			[2, this.Const.Perks.UnstoppableTree],
			[0.4, this.Const.Perks.TrainedTree],
			[0.5, this.Const.Perks.MenderClassTree],
			[2, this.Const.Perks.ScoutClassTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[3, this.Const.Perks.MaceTree],
			[3, this.Const.Perks.HammerTree],
			[2, this.Const.Perks.AxeTree],
			[0.66, this.Const.Perks.SpearTree],
			[0.5, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.StaffTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.WildlingProfessionTree
			],			
			Styles = [
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/wildwoman_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.ResilientTree],
			[2, this.Const.Perks.ViciousTree],
			[0.4, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.LargeTree],
			[2, this.Const.Perks.SturdyTree],
			[2, this.Const.Perks.UnstoppableTree],
			[0.4, this.Const.Perks.TrainedTree],
			[0.5, this.Const.Perks.MenderClassTree],
			[2, this.Const.Perks.ScoutClassTree],
			[3, this.Const.Perks.HeavyArmorTree],
			[3, this.Const.Perks.MaceTree],
			[3, this.Const.Perks.HammerTree],
			[2, this.Const.Perks.AxeTree],
			[0.66, this.Const.Perks.SpearTree],
			[0.5, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.StaffTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.WildlingProfessionTree
			],			
			Styles = [
				::Const.Perks.TwoHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/witchhunter_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.CalmTree],
			[2, this.Const.Perks.AgileTree],
			[3, this.Const.Perks.ViciousTree],
			[0, this.Const.Perks.DeviousTree],
			[2, this.Const.Perks.TalentedTree],
			[0, this.Const.Perks.OrganisedTree],
			[3, this.Const.Perks.BowTree]
		];

		o.m.PerkTreeDynamic = {
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Defense = [
				::Const.Perks.LightArmorTree
			],
			Weapon = [
				::Const.Perks.CrossbowTree
			]
			Styles = [
				::Const.Perks.RangedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_alchemist_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.ApothecaryProfessionTree
			],
			Enemy = [
				::Const.Perks.MysticTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_dervish_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.BarbarianTree],
			[2, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.UnstoppableTree],
			[2, this.Const.Perks.TrainedTree],
			[1.5, this.Const.Perks.LightArmorTree],
			[1.5, this.Const.Perks.MediumArmorTree],
			[2, this.Const.Perks.TwoHandedTree],
			[2, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.CleaverTree],
			[0, this.Const.Perks.BowTree],
			[0, this.Const.Perks.CrossbowTree],
			[0, this.Const.Perks.SlingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HolyManProfessionTree
			],
			Class = [
				::Const.Perks.SergeantClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_muladi_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[2, this.Const.Perks.ResilientTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.HunterProfessionTree
			],
			Traits = [
				::Const.Perks.AgileTree
			],
			Class = [
				::Const.Perks.ScoutClassTree
			],
			Weapon = [
				::MSU.Class.WeightedContainer([
					[25, ::Const.Perks.BowTree],
					[25, ::Const.Perks.CrossbowTree],
					[25, ::Const.Perks.SlingTree],
					[25, ::Const.Perks.ThrowingTree]
				])
			]			
		};
	});

	::mods_hookNewObject("skills/backgrounds/legend_qiyan_background", function(o) {
		o.m.PerkGroupMultipliers <- [
			[3, this.Const.Perks.ViciousTree],
			[2, this.Const.Perks.AgileTree],
			[2, this.Const.Perks.FastTree],
			[3, this.Const.Perks.LightArmorTree],
			[0.66, this.Const.Perks.ShieldTree],
			[3, this.Const.Perks.DaggerTree],
			[2, this.Const.Perks.SwordTree],
			[2, this.Const.Perks.ThrowingTree]
		];

		o.m.PerkTreeDynamic = {
			Profession = [
				::Const.Perks.MinstrelProfessionTree
			],
			Class = [
				::Const.Perks.EntertainerClassTree
			],
			Styles = [
				::Const.Perks.OneHandedTree
			]
		};
	});
}
