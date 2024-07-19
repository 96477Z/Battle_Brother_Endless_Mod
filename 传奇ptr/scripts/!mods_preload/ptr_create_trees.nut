local gt = this.getroottable();

gt.PTR.createStylesTrees <- function()
{
	gt.Const.Perks.OneHandedTree <- {
		ID = "OneHandedTree",
		Descriptions = [
			"one-handed weapons"
		],
		Name = "One-Handed Weapons",
		Tree = [
			[],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.PTROffhandTraining
			],
			[
				gt.Const.Perks.PerkDefs.DoubleStrike	
			],
			[
				gt.Const.Perks.PerkDefs.Duelist
			],
			[
				gt.Const.Perks.PerkDefs.PTRWeaponMaster
			]
		]
	};

	gt.Const.Perks.TwoHandedTree <- {
		ID = "TwoHandedTree",
		Descriptions = [
			"two-handed weapons"
		],
		Name = "Two-Handed Weapons",
		Tree = [
			[],
			[
				gt.Const.Perks.PerkDefs.PTRBloodyHarvest
			],
			[
				gt.Const.Perks.PerkDefs.PTRFormidableApproach
			],
			[],
			[
				gt.Const.Perks.PerkDefs.ReachAdvantage
			],
			[
				gt.Const.Perks.PerkDefs.PTRSweepingStrikes
			],
			[]
		]
	};

	gt.Const.Perks.RangedTree <- {
		ID = "RangedTree",
		Descriptions = [
			"ranged weapons"
		],
		Name = "Ranged Weapons",
		Tree = [
			[
				gt.Const.Perks.PerkDefs.BagsAndBelts
			],
			[
				gt.Const.Perks.PerkDefs.Bullseye
			],
			[],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.Ballistics
			],
			[]
		]
	};

	gt.Const.Perks.StylesTrees <- {
		Tree = [
			gt.Const.Perks.OneHandedTree,
			gt.Const.Perks.TwoHandedTree,
			gt.Const.Perks.RangedTree
		],
		function getRandom( _exclude )
		{
			local L = [];

			foreach( i, t in this.Tree )
			{
				if (_exclude != null && _exclude.find(t.ID))
				{
					continue;
				}

				L.push(i);
			}

			local r = this.Math.rand(0, L.len() - 1);
			return this.Tree[L[r]];
		}

		function getRandomPerk()
		{
			local tree = this.getRandom(null);
			local L = [];

			foreach( row in tree.Tree )
			{
				foreach( p in row )
				{
					L.push(p);
				}
			}

			local r = this.Math.rand(0, L.len() - 1);
			return L[r];
		}

	};
}

gt.PTR.createProfessionTrees <- function()
{
	gt.Const.Perks.AssassinProfessionTree <- {
		ID = "AssassinProfessionTree",
		Descriptions = [
			"took lives in exchange for gold",
			"claims to have assassinated several men of import",
			"has the eyes and temperament of a cold blooded killer"
		],
		Name = "Assassin",
		PerkGroupMultipliers = [
			[-1, ::Const.Perks.CivilizationTree],
			[3, ::Const.Perks.AgileTree],
			[3, ::Const.Perks.FastTree],
			[2, ::Const.Perks.ViciousTree],
			[2, ::Const.Perks.DeviousTree],
			[0, ::Const.Perks.OrganisedTree],
			[0.5, ::Const.Perks.LargeTree],
			[0.5, ::Const.Perks.SturdyTree],
			[3, ::Const.Perks.TrapperClassTree],
			[-1, ::Const.Perks.LightArmorTree],
			[5, ::Const.Perks.MediumArmorTree],
			[0.5, ::Const.Perks.ShieldTree],
			[-1, ::Const.Perks.OneHandedTree],
			[-1, ::Const.Perks.DaggerTree],
			[2, ::Const.Perks.SwordTree],
			[0, ::Const.Perks.BowTree],
			[0, ::Const.Perks.SlingTree],
			[0, ::Const.Perks.CrossbowTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistKnifeSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistKnifeDamage
			],
			[
				gt.Const.Perks.PerkDefs.Rotation			
			],
			[
				gt.Const.Perks.PerkDefs.LegendTwirl
			],
			[
				gt.Const.Perks.PerkDefs.LegendHidden
			],
			[
				gt.Const.Perks.PerkDefs.LegendAssassinate
			]
		]
	};

	gt.Const.Perks.ButcherProfessionTree <- {
		ID = "ButcherProfessionTree",
		Descriptions = [
			"worked at a butcher\'s shop",
			"butchered animals and sold meat to make a livelihood",
			"claims to be well-experienced in butchering animals"
		],
		Name = "Butcher",
		PerkGroupMultipliers = [
			[3, ::Const.Perks.ViciousTree],
			[2, ::Const.Perks.OrganisedTree],
			[5, ::Const.Perks.ChefClassTree],
			[-1, ::Const.Perks.OneHandedTree],
			[-1, ::Const.Perks.CleaverTree],
			[2, ::Const.Perks.SwordTree],
			[3, ::Const.Perks.AxeTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistButcherSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistButcherDamage
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendPrepareBleed
			],
			[
				gt.Const.Perks.PerkDefs.LegendPrepareGraze
			],
			[
				gt.Const.Perks.PerkDefs.LegendSlaughter
			]
		]
	};

	gt.Const.Perks.BlacksmithProfessionTree <- {
		ID = "BlacksmithProfessionTree",
		Descriptions = [
			"worked at a blacksmith\'s shop",
			"worked metal at a smithy",
			"used to make tools and weapons at a smithy"
		],
		Name = "Blacksmith",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.LargeTree],
			[3, ::Const.Perks.OrganisedTree],
			[1.25, ::Const.Perks.ResilientTree],
			[2, ::Const.Perks.SturdyTree],
			[-1, ::Const.Perks.MenderClassTree],
			[2, ::Const.Perks.HeavyArmorTree],
			[1.5, ::Const.Perks.MediumArmorTree],			
			[-1, ::Const.Perks.HammerTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistHammerSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistHammerDamage
			],
			[],
			[
				gt.Const.Perks.PerkDefs.SunderingStrikes
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRPersonalArmor
			]
		]
	};

	gt.Const.Perks.MilitiaProfessionTree <- {
		ID = "MilitiaProfessionTree",
		Descriptions = [
			"served in the local militia",
			"was a member of local militia",
			"has had experience with some weapons serving in the militia"
		],
		Name = "Militia",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.OutlandersTree],
			[-1, ::Const.Perks.TrainedTree],
			[0.8, ::Const.Perks.HealerClassTree],
			[2, ::Const.Perks.TacticianClassTree],
			[2, ::Const.Perks.LightArmorTree],
			[-1, ::Const.Perks.SpearTree],
			[-1, ::Const.Perks.ShieldTree]	
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistMilitiaSkill
			],
			[
				gt.Const.Perks.PerkDefs.PTRStrengthInNumbers
			],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistMilitiaDamage
			],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.MinerProfessionTree <- {
		ID = "MinerProfessionTree",
		Descriptions = [
			"worked at a quarry",
			"worked in a mine"
		],
		Name = "Miner",
		PerkGroupMultipliers = [
			[3, ::Const.Perks.LargeTree],
			[2, ::Const.Perks.ResilientTree],
			[3, ::Const.Perks.SturdyTree],
			[-1, ::Const.Perks.HammerTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistPickaxeSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistPickaxeDamage
			],
			[],
			[
				gt.Const.Perks.PerkDefs.SunderingStrikes
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRTunnelVision
			]
		]
	};

	gt.Const.Perks.FarmerProfessionTree <- {
		ID = "FarmerProfessionTree",
		Descriptions = [
			"worked at a ranch",
			"ploughed the fields"
		],
		Name = "Farmer",
		PerkGroupMultipliers = [
			[3, ::Const.Perks.LargeTree],
			[2, ::Const.Perks.ResilientTree],
			[3, ::Const.Perks.SturdyTree],
			[-1, ::Const.Perks.OrganisedTree],
			[2, ::Const.Perks.TrapperClassTree],
			[2, ::Const.Perks.ChefClassTree],
			[2, ::Const.Perks.MenderClassTree],
			[2, ::Const.Perks.HoundmasterClassTree],
			[2, ::Const.Perks.TwoHandedTree],
			[3, ::Const.Perks.PolearmTree],
			[1.5, ::Const.Perks.SpearTree],
			[1.5, ::Const.Perks.SlingTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistPitchforkSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistPitchforkDamage
			],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.HunterProfessionTree <- {
		ID = "HunterProfessionTree",
		Descriptions = [
			"hunted in the forests",
			"claims to have experience in hunting animals"
		],
		Name = "Hunter",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.DeviousTree],
			[0.66, ::Const.Perks.ShieldTree],		
			[5, ::Const.Perks.LightArmorTree],		
			[9, ::Const.Perks.BowTree],
			[3, ::Const.Perks.CrossbowTree],
			[3, ::Const.Perks.SlingTree],
			[3, ::Const.Perks.ThrowingTree],
			[-1, ::Const.Perks.RangedTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistShortbowSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistShortbowDamage
			],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.DiggerProfessionTree <- {
		ID = "DiggerProfessionTree",
		Descriptions = [
			"used a shovel to earn coin",
			"dug holes and moved dirt to make a living"
		],
		Name = "Digger",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.LargeTree],
			[1.5, ::Const.Perks.ResilientTree],
			[2, ::Const.Perks.SturdyTree],
			[0.5, ::Const.Perks.ClerkClassTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistShovelSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistShovelDamage
			],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.LumberjackProfessionTree <- {
		ID = "LumberjackProfessionTree",
		Descriptions = [
			"fell trees in the local forest",
			"claims that chopping through men is just like chopping through trees",
			"appears to have the hands of a lumberjack"
		],
		Name = "Lumberjack",
		PerkGroupMultipliers = [
			[-1, ::Const.Perks.SchratTree],
			[2, ::Const.Perks.LargeTree],
			[1.5, ::Const.Perks.ResilientTree],
			[2, ::Const.Perks.SturdyTree],
			[1.5, ::Const.Perks.UnstoppableTree],
			[0.5, ::Const.Perks.ClerkClassTree],
			[2, ::Const.Perks.ScoutClassTree],		
			[2, ::Const.Perks.TwoHandedTree],
			[-1, ::Const.Perks.AxeTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistWoodaxeSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistWoodaxeDamage
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendWoodworking
			],
			[],
			[]
		]
	};

	gt.Const.Perks.ApothecaryProfessionTree <- {
		ID = "ApothecaryProfessionTree",
		Descriptions = [
			"collected herbs and made potions",
			"was the local herbalist of a nearby village",
			"claims to have experience with potions and herbs"
		],
		Name = "Apothecary",
		PerkGroupMultipliers = [
			[5, ::Const.Perks.OrganisedTree],
			[5, ::Const.Perks.TalentedTree],
			[2.5, ::Const.Perks.CalmTree],
			[-1, ::Const.Perks.HealerClassTree],
			[-1, ::Const.Perks.SwordTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistSickleSkill
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistSickleDamage
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendGatherer
			],
			[
				gt.Const.Perks.PerkDefs.LegendHerbcraft
			],
			[
				gt.Const.Perks.PerkDefs.LegendPotionBrewer
			]
		]
	};

	gt.Const.Perks.JugglerProfessionTree <- {
		ID = "JugglerProfessionTree",
		Descriptions = [
			"performed in a circus",
			"was a member of a troupe, performing tricks with various objects",
			"is keen to show you some of his juggling tricks"
		],
		Name = "Juggler",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.AgileTree],
			[2, ::Const.Perks.FastTree],
			[0.5, ::Const.Perks.SlingTree],
			[0.8, ::Const.Perks.CrossbowTree],
			[0.75, ::Const.Perks.PolearmTree],
			[0.33, ::Const.Perks.ShieldTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendHairSplitter
			],
			[
				gt.Const.Perks.PerkDefs.LegendLeap				
			],
			[
				gt.Const.Perks.PerkDefs.Rotation
			],
			[
				gt.Const.Perks.PerkDefs.LegendTwirl				
			],
			[
				gt.Const.Perks.PerkDefs.Footwork				
			],
			[
				gt.Const.Perks.PerkDefs.LegendBackflip							
			],
			[
				gt.Const.Perks.PerkDefs.LegendTumble
			]
		]
	};

	gt.Const.Perks.MinstrelProfessionTree <- {
		ID = "MinstrelProfessionTree",
		Descriptions = [
			"performed music at a tavern",
			"claims to have some skill with musical instruments",	
			"is known around these parts to be quite the musician"
		],
		Name = "Minstrel",
		PerkGroupMultipliers = [
			[-1, ::Const.Perks.TalentedTree],
			[-1, ::Const.Perks.EntertainerClassTree]
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistLuteSkill
			],
			[
				gt.Const.Perks.PerkDefs.LegendDaze
			],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistLuteDamage
			],
			[
				gt.Const.Perks.PerkDefs.LegendEntice
			],
			[
				gt.Const.Perks.PerkDefs.LegendPush
			],
			[
				gt.Const.Perks.PerkDefs.LegendDrumsOfWar
			],
			[
				gt.Const.Perks.PerkDefs.LegendDrumsOfLife
			]
		]
	};

	gt.Const.Perks.HolyManProfessionTree <- {
		ID = "HolyManProfessionTree",
		Descriptions = [
			"preached the word of the gods",
			"claims to be a true servant of the gods",
			"wants nothing more in life than to serve the gods"
		],
		Name = "Holy Man",
		PerkGroupMultipliers = [
			[-1, ::Const.Perks.UndeadTree],
			[-1, ::Const.Perks.CalmTree],
			[5, ::Const.Perks.HealerClassTree],
			[5, ::Const.Perks.SergeantClassTree],
			[0.25, ::Const.Perks.DeviousTree],
		],
		Tree = [
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendTrueBeliever
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendPrayerOfFaith
			],
			[
				gt.Const.Perks.PerkDefs.LegendPrayerOfLife
			],
			[
				gt.Const.Perks.PerkDefs.LegendHolyFlame
			]
		]
	};

	gt.Const.Perks.CultistProfessionTree <- {
		ID = "CultistProfessionTree",
		Descriptions = [
			"took part in cultist rituals",
			"believes in strange otherworldly powers",
			"belongs to a local cult pledged to a strange god"
		],
		Name = "Cultist",
		PerkGroupMultipliers = [
			[0.25, ::Const.Perks.TrainedTree],
			[0, ::Const.Perks.EntertainerClassTree],
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistNinetailsSkill

			],
			[
				gt.Const.Perks.PerkDefs.LegendSpecCultHood
			],
			[
				gt.Const.Perks.PerkDefs.LegendSpecialistNinetailsDamage				
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendPrepareGraze
			],
			[
				gt.Const.Perks.PerkDefs.LegendSpecCultArmor
			],
			[
				gt.Const.Perks.PerkDefs.LegendLacerate
			]
		]
	};

	gt.Const.Perks.TraderProfessionTree <- {
		ID = "TraderProfessionTree",
		Descriptions = [
			"traded goods",
			"ran trading caravans",
			"earned coin through trade",
			"claims to have experience in trading and bartering"
		],
		Name = "Trader",
		PerkGroupMultipliers = [
			[5, ::Const.Perks.TalentedTree],
			[1.5, ::Const.Perks.CalmTree],
			[-1, ::Const.Perks.OrganisedTree],
			[-1, ::Const.Perks.ClerkClassTree]
		],
		Tree = [
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendBarterConvincing
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendBarterTrustworthy
			],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendBarterGreed
			]
		]
	};

	gt.Const.Perks.PauperProfessionTree <- {
		ID = "PauperProfessionTree",
		Descriptions = [
			"is a dreg of society",
			"looks utterly beaten down",
			"is a pitiful pile of flesh and bones"
		],
		Name = "Pauper",
		PerkGroupMultipliers = [
			[0.75, ::Const.Perks.SturdyTree],
			[0.75, ::Const.Perks.LargeTree],
			[2, ::Const.Perks.ResilientTree],
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.PTRPromisedPotential
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRPunchingBag
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRTraumaSurvivor
			],
			[],
			[]
		]
	};

	gt.Const.Perks.LaborerProfessionTree <- {
		ID = "LaborerProfessionTree",
		Descriptions = [
			"did hard labor to make a living",
			"has strong, calloused hands, just like those of a laborer"
		],
		Name = "Laborer",
		PerkGroupMultipliers = [
			[1.5, ::Const.Perks.ResilientTree],
			[2, ::Const.Perks.LargeTree],
			[2, ::Const.Perks.SturdyTree],
			[0.5, ::Const.Perks.TalentedTree],
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.PTRFruitsOfLabor
			],
			[],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRWearsItWell
			],
			[
				gt.Const.Perks.PerkDefs.PTRHaleAndHearty
			],
			[]
		]
	};

	gt.Const.Perks.ServiceProfessionTree <- {
		ID = "ServiceProfessionTree",
		Descriptions = [
			"performed and provided services"
		],
		Name = "Service",
		PerkGroupMultipliers = [
			[1.5, ::Const.Perks.CalmTree],
			[2, ::Const.Perks.OrganisedTree],
			[0.75, ::Const.Perks.ViciousTree],
			[0.75, ::Const.Perks.UnstoppableTree],
			[3, ::Const.Perks.ClerkClassTree]
		],
		Tree = [
			[],
			[],
			[],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.RaiderProfessionTree <- {
		ID = "RaiderProfessionTree",
		Descriptions = [
			"raided villages and caravans",
			"is a well-known raider and looter in this area"
		],
		Name = "Raider",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.CaravanTree],
			[2, ::Const.Perks.NoblesTree],
			[3, ::Const.Perks.ViciousTree],
			[0.25, ::Const.Perks.CalmTree]
		],
		Tree = [
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRMenacing
			],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRBully
			],
			[]
		]
	};

	gt.Const.Perks.SoldierProfessionTree <- {
		ID = "SoldierProfessionTree",
		Descriptions = [
			"served in the military",
			"has had professional military experience",
			"claims to have served in a professional army"
		],
		Name = "Soldier",
		PerkGroupMultipliers = [
			[-1, ::Const.Perks.TrainedTree],
			[2, ::Const.Perks.ShieldTree],
		],
		Tree = [
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRExudeConfidence
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRPatternRecognition
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRProfessional
			]
		]
	};

	gt.Const.Perks.WildlingProfessionTree <- {
		ID = "WildlingProfessionTree",
		Descriptions = [
			"hails from the wild",
			"is wild and savage",
			"looks like a feral predator"
		],
		Name = "Wildling",
		PerkGroupMultipliers = [
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.Pathfinder
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRSavageStrength
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRBestialVigor
			],
			[
				gt.Const.Perks.PerkDefs.LegendGatherer
			],
			[
				gt.Const.Perks.PerkDefs.PTRFeralRage
			]
		]
	};

	gt.Const.Perks.NobleProfessionTree <- {
		ID = "NobleProfessionTree",
		Descriptions = [
			"is of noble birth",
			"hails from a noble family",
			"has noble blood in his veins"
		],
		Name = "Noble",
		PerkGroupMultipliers = [
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.PTRFamilyTies
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRFamilyPride
			],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.SwordmasterProfessionTree <- {
		ID = "SwordmasterProfessionTree",
		Descriptions = [
			"is a masterful swordsman",
			"is a renowned swordmaster",
			"is a master of the sword"
		],
		Name = "Swordmaster",
		PerkGroupMultipliers = [
		],
		Tree = [
			[],
			[],
			[],
			[
				::Const.Perks.PerkDefs.PTRSwordmasterBladeDancer,
				::Const.Perks.PerkDefs.PTRSwordmasterReaper,
				::Const.Perks.PerkDefs.PTRSwordmasterMetzger,
				::Const.Perks.PerkDefs.PTRSwordmasterVersatileSwordsman,
				::Const.Perks.PerkDefs.PTRSwordmasterPrecise,
				::Const.Perks.PerkDefs.PTRSwordmasterGrappler,
				::Const.Perks.PerkDefs.PTRSwordmasterJuggernaut
			],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.ProfessionTrees <- {
		Tree = [
			gt.Const.Perks.AssassinProfessionTree,
			gt.Const.Perks.ButcherProfessionTree,
			gt.Const.Perks.BlacksmithProfessionTree,
			gt.Const.Perks.MilitiaProfessionTree,
			gt.Const.Perks.MinerProfessionTree,
			gt.Const.Perks.FarmerProfessionTree,
			gt.Const.Perks.FistsClassTree,		
			gt.Const.Perks.HunterProfessionTree,
			gt.Const.Perks.DiggerProfessionTree,
			gt.Const.Perks.LumberjackProfessionTree,
			gt.Const.Perks.ApothecaryProfessionTree,
			gt.Const.Perks.JugglerProfessionTree,
			gt.Const.Perks.MinstrelProfessionTree,
			gt.Const.Perks.HolyManProfessionTree,
			gt.Const.Perks.CultistProfessionTree,
			gt.Const.Perks.TraderProfessionTree,
			gt.Const.Perks.PauperProfessionTree,
			gt.Const.Perks.LaborerProfessionTree,
			gt.Const.Perks.ServiceProfessionTree,
			gt.Const.Perks.RaiderProfessionTree,
			gt.Const.Perks.SoldierProfessionTree,
			gt.Const.Perks.WildlingProfessionTree,
			gt.Const.Perks.NobleProfessionTree,
			gt.Const.Perks.SwordmasterProfessionTree,
		],
		function getRandom( _exclude )
		{
			local L = [];

			foreach( i, t in this.Tree )
			{
				if (_exclude != null && _exclude.find(t.ID))
				{
					continue;
				}

				L.push(i);
			}

			local r = this.Math.rand(0, L.len() - 1);
			return this.Tree[L[r]];
		}

		function getRandomPerk()
		{
			local tree = this.getRandom(null);
			local L = [];

			foreach( row in tree.Tree )
			{
				foreach( p in row )
				{
					L.push(p);
				}
			}

			local r = this.Math.rand(0, L.len() - 1);
			return L[r];
		}
	};
}

gt.PTR.createSpecialTrees <- function()
{
	gt.Const.Perks.SpecialTrees <- {
		Tree = [],
		Perks = [],

		function addSpecialPerk( _chance, _perk, _tier, _desc, _func = null )
		{
			this.Perks.push({
				Perk = _perk,
				Chance = _chance,
				Desc = "[color=" + this.Const.UI.Color.NegativeValue + "]" + _desc + "[/color]"
				Func = _func != null ? _func : @(a, b) _chance,
				Row = _tier - 1
			});

			local i = 0;			
			while (true)
			{
				local name = "Special" + i;
				if (!(name in this.Const.Perks))
				{
					this.Const.Perks[name] <- {
						ID = name,
						Descriptions = [""],
						Name = "Special Perks",
						Tree = [
							[], [], [], [], [], [], []
						]
					};

					this.Const.Perks.SpecialTrees.Tree.push(this.Const.Perks[name]);
				}

				if (this.Const.Perks[name].Tree[_tier-1].len() > 1)
				{
					local totalPerksInTree = 0;					
					foreach (row in this.Const.Perks[name].Tree)
					{
						totalPerksInTree += row.len();
					}
					if (totalPerksInTree >= 7)
					{
						i++;
						continue;					
					}
				}

				this.Const.Perks[name].Tree[_tier-1].push(_perk);
				break;
			}
		}

		function getRandom( _exclude )
		{
			local L = [];

			foreach( i, t in this.Tree )
			{
				if (_exclude != null && _exclude.find(t.ID))
				{
					continue;
				}

				L.push(i);
			}

			local r = this.Math.rand(0, L.len() - 1);
			return this.Tree[L[r]];
		}

		function getRandomPerk()
		{
			local tree = this.getRandom(null);
			local L = [];

			foreach( row in tree.Tree )
			{
				foreach( p in row )
				{
					L.push(p);
				}
			}

			local r = this.Math.rand(0, L.len() - 1);
			return L[r];
		}
	};

	gt.Const.Perks.SpecialTrees.addSpecialPerk(25, gt.Const.Perks.PerkDefs.BFFencer, 7, "Has all the makings of a capable fencer.", function( _player, _chance ) {
		if (!_player.getBackground().hasPerkGroup(::Const.Perks.SwordTree))
		{
			return 0;
		}

		local talents = _player.getTalents();

		_chance = talents.len() == 0 ? 0 : _chance * talents[this.Const.Attributes.Initiative] * talents[this.Const.Attributes.MeleeSkill];

		if (_player.getInitiative() + (this.Math.max(0, _player.getBaseProperties().Stamina - _player.getCurrentProperties().Stamina)) < 100)
		{
			return 0;
		}

		return _chance;		
	});

	gt.Const.Perks.SpecialTrees.addSpecialPerk(2, gt.Const.Perks.PerkDefs.PTRRisingStar, 7, "Has the talent to rise and shine above all others!");

	gt.Const.Perks.SpecialTrees.addSpecialPerk(10, gt.Const.Perks.PerkDefs.LegendBigGameHunter, 7, "Has a penchant for hunting big game.", function( _player, _chance ) {
		if (!_player.getBackground().hasPerkGroup(::Const.Perks.RangedTree) || !_player.getBackground().hasPerkGroup(::Const.Perks.BowTree) || !_player.getBackground().hasPerkGroup(::Const.Perks.CrossbowTree))
		{
			return 0;
		}

		local talents = _player.getTalents();
		if (talents.len() == 0 || talents[this.Const.Attributes.RangedSkill] < 2)
		{
			return 0;
		}
		else
		{
			_chance *= talents[this.Const.Attributes.RangedSkill];
		}

		return _chance;
	});

	gt.Const.Perks.SpecialTrees.addSpecialPerk(5, gt.Const.Perks.PerkDefs.PTRMarksmanship, 7, "Has the talent to become a formidable marksman.", function( _player, _chance ) {
		if (!_player.getBackground().hasPerkGroup(::Const.Perks.RangedTree))
		{
			return 0;
		}

		local talents = _player.getTalents();
		if (talents.len() == 0 || talents[this.Const.Attributes.RangedSkill] < 2)
		{
			return 0;
		}
		else
		{
			_chance *= talents[this.Const.Attributes.RangedSkill];
		}

		return _chance;
	});

	gt.Const.Perks.SpecialTrees.addSpecialPerk(25, gt.Const.Perks.PerkDefs.PTRManOfSteel, 7, "Is tough as if made of steel!", function( _player, _chance ) {
		if (!_player.getBackground().hasPerkGroup(::Const.Perks.HeavyArmorTree))
		{
			return 0;
		}

		local talents = _player.getTalents();
		return talents.len() == 0 ? 0 : _chance * talents[this.Const.Attributes.Fatigue];
	});
}
