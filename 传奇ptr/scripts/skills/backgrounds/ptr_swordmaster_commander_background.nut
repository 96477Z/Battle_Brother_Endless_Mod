this.ptr_swordmaster_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.ptr_swordmaster_commander";
		this.m.Name = "Old Swordmaster";
		this.m.Icon = "ui/backgrounds/background_30.png";
		this.m.BackgroundDescription = "A swordmaster excels in melee combat like no other, but may be vulnerable at range. Age may have taken a toll on his physical attributes and may continue to do so.";
		this.m.GoodEnding = "The finest swordsman you\'d ever seen, %name% the old swordmaster was a natural addition to the %companyname%. But a man can\'t fight forever. Despite the company\'s growing success, it was becoming readily obvious that the swordmaster just could not physically do it anymore. He retired to a nice plot of land and is enjoying some time to himself. Or so you thought. You went out to go see the man and found him secretly training a nobleman\'s daughter. You promised to keep it a secret.";
		this.m.BadEnding = "A shame that %name% the swordmaster had to spend his twilight years in a declining mercenary company. He retired, stating he just could not physically do it anymore. You think he was just letting the %companyname% down easy, because a week later he slew ten would-be brigands on the side of a road without breaking a sweat. Last you heard, he was training ungrateful princes in the art of swordfighting.";
		this.m.HiringCost = 400;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.huge",
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_nobles",
			"trait.paranoid",
			"trait.impatient",
			"trait.clubfooted",
			"trait.irrational",
			"trait.athletic",
			"trait.gluttonous",
			"trait.dumb",
			"trait.bright",
			"trait.clumsy",
			"trait.tiny",
			"trait.insecure",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.hesitant",
			"trait.fragile",
			"trait.iron_lungs",
			"trait.tough",
			"trait.strong",
			"trait.bloodthirsty",
			"trait.double_tongued",
			"trait.slack",
			"trait.seductive",
			"trait.loyal",
			"trait.disloyal",
			"trait.asthmatic",
			"trait.greedy",
			"trait.brute",
			"trait.swift",
			"trait.fat",
			"trait.pessimist",
			"trait.frail"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.Fatigue,
			this.Const.Attributes.RangedDefense,
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Legend",
			"the Master",
			"the Singing Blade",
			"the Old"
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = 3;
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Ranger | this.Const.BackgroundType.Crusader | this.Const.BackgroundType.Educated;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Good;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[3];
		this.m.CustomPerkTree = [
			[],
			[],
			[],
			[],
			[],
			[],
			[]
		];
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

		addPerkTreesToCustomPerkTree(this.m.CustomPerkTree,
			[
				this.Const.Perks.SwordmasterProfessionTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.TrapperClassTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree
			]
		);

		addPerksToCustomPerkTree(1, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRMenacing,
				this.Const.Perks.PerkDefs.LegendHairSplitter,
				this.Const.Perks.PerkDefs.PTRFamilyTies,
				this.Const.Perks.PerkDefs.LegendAlert,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.LegendCheerOn,
				this.Const.Perks.PerkDefs.PTRDeepCuts,
				this.Const.Perks.PerkDefs.PTRSmallTarget,
				this.Const.Perks.PerkDefs.LoneWolf,
				this.Const.Perks.PerkDefs.PTRPatternRecognition,
				this.Const.Perks.PerkDefs.PTRVigilant
			]
		);

		addPerksToCustomPerkTree(2, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.LegendOnslaught,
				this.Const.Perks.PerkDefs.PTRSanguinary,
				this.Const.Perks.PerkDefs.PTRHeadSmasher,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.LegendShieldsUp,
				this.Const.Perks.PerkDefs.ShieldExpert,
				this.Const.Perks.PerkDefs.PTRBloodyHarvest
			]
		);

		addPerksToCustomPerkTree(3, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRFormidableApproach,
				this.Const.Perks.PerkDefs.PTRExudeConfidence,
				this.Const.Perks.PerkDefs.PTRFamilyPride,
				this.Const.Perks.PerkDefs.PTRDismemberment,
				this.Const.Perks.PerkDefs.PTRThroughTheGaps,
				this.Const.Perks.PerkDefs.FortifiedMind,			
				this.Const.Perks.PerkDefs.RallyTheTroops,
				this.Const.Perks.PerkDefs.LegendHoldTheLine
			]
		);
		
		addPerksToCustomPerkTree(4, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner,
				this.Const.Perks.PerkDefs.LegendForwardPush,
			]
		);

		addPerksToCustomPerkTree(5, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTROffhandTraining,
				this.Const.Perks.PerkDefs.Taunt,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.PTRBetweenTheEyes,
				this.Const.Perks.PerkDefs.LegendBattleheart,
				this.Const.Perks.PerkDefs.Berserk,			
				this.Const.Perks.PerkDefs.PTRVigorousAssault,			
				this.Const.Perks.PerkDefs.PTRUnstoppable,
				this.Const.Perks.PerkDefs.PTRTheRushOfBattle,
				this.Const.Perks.PerkDefs.DoubleStrike
			]
		);

		addPerksToCustomPerkTree(6, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.PTRSweepingStrikes,
				this.Const.Perks.PerkDefs.LegendMindOverBody,
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.LegendClarity,
				this.Const.Perks.PerkDefs.PushTheAdvantage,
				this.Const.Perks.PerkDefs.PTRBloodbath,
				this.Const.Perks.PerkDefs.Duelist
			]
		);

		addPerksToCustomPerkTree(7, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.BFFencer,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.KillingFrenzy,
				this.Const.Perks.PerkDefs.Inspire,
				this.Const.Perks.PerkDefs.PTRBlitzkrieg,
				this.Const.Perks.PerkDefs.PTRFreshAndFurious,
				this.Const.Perks.PerkDefs.PTRWeaponMaster
			]
		);
	}

	function onBuildDescription()
	{
		return "{%name% fights like a fish practices swimming. | %name% isn\'t just a man\'s handle, it\'s a myth. A name used in place of words like war, combat, and death. | To say, \'You move like %name%\' is, perhaps, the greatest honor a man can bestow upon a fellow warrior. | %name% is considered to be one of the most dangerous swordsmen to have ever walked the earth.} {Much of his life is founded in myth: stories like how he dismantled a realm by challenging a king and all his guardsmen to a duel - and besting them with one hand. | Supposedly, he fought twenty men in his own garden, slowly picking and pruning his tomatoes with the same blade he was using to kill. | Some say he was left to sea for three-hundred days and there he learned - balancing on a piece of flotsam - how to move, how to fight, and how to survive. | A story goes that his family was murdered and he knew not by whom. Wanting to be ready if he came across those responsible, he taught himself to be good enough with a blade to kill anyone. | Raised by a one-armed father, he first learned how to fight with limitations. By the time he started using both hands he could already kill anybody with just one.} {Unfortunately, time and age have withered %name% into a shell of his former self. | During the orc invasions, %name% managed to kill a dozen greenskins singlehandedly. Sadly, an impossible feat does not come without a price: his sword-hand lost three fingers and his lead foot\'s achilles was severed. | Sadly, a horde of drunks fell upon his home, each hoping to become infamous by killing the famous swordsman. He slew them all, but not before taking irreversible injuries. | Legend has it that he quarreled with a foul beast of monstrous proportions. He waves the notion away with a fingerless hand and a scarred wink. | While teaching royalty how to fight, a coup that swept the entire realm had him running for his life. | Hired to teach noble heirs fighting skills, it wasn\'t long until he was embroiled in a web of intrigue and backstabbing, and had to leave as long as he still could.} {Now the old swordsman just looks to spend the rest of his fighting knowledge on the field. | While he\'s lost his edge, the man is still plenty dangerous and some say he\'s looking to find a student before he dies. | A master in the martial arts he may be, every movement he makes is echoed by the cracking of old bones. | Depressed and without purpose, %name% now finds meaning in simply blending in with the very men he used to teach. | The man makes it impossible to get through his defense, countering everything offered, but he no longer has the jump in his step to attack back. Admirable, but sad. | Given a sword, the old guard spins and twirls it in an impressive demonstration. When he plants it in the ground, he leans on the pommel to catch his breath. Not so impressive. | The man has been robbed of his athleticism, but his knowledge has turned swordfighting into mathematics.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-12,
				-12
			],
			Bravery = [
				12,
				10
			],
			Stamina = [
				-15,
				-10
			],
			MeleeSkill = [
				30,
				25
			],
			RangedSkill = [
				-5,
				-5
			],
			MeleeDefense = [
				25,
				30
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				-10,
				-10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		if (this.Math.rand(0, 3) == 3)
		{
			local actor = this.getContainer().getActor();
			actor.setTitle(this.m.Titles[this.Math.rand(0, this.m.Titles.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/arming_sword"));
		items.equip(this.Const.World.Common.pickArmor([
			[1, "noble_mail_armor"]
		]));

		items.equip(this.Const.World.Common.pickHelmet([
				[1, "greatsword_hat"]
		]));
	}
});

