this.ptr_young_swordmaster_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.ptr_young_swordmaster_commander";
		this.m.Name = "Young Swordmaster";
		this.m.Icon = "ui/backgrounds/background_30.png";
		this.m.BackgroundDescription = "A swordmaster excels in melee combat like no other, but may be vulnerable at range. Age may have taken a toll on his physical attributes and may continue to do so.";
		this.m.GoodEnding = "The finest swordsman you\'d ever seen, %name% the old swordmaster was a natural addition to the %companyname%. But a man can\'t fight forever. Despite the company\'s growing success, it was becoming readily obvious that the swordmaster just could not physically do it anymore. He retired to a nice plot of land and is enjoying some time to himself. Or so you thought. You went out to go see the man and found him secretly training a nobleman\'s daughter. You promised to keep it a secret.";
		this.m.BadEnding = "A shame that %name% the swordmaster had to spend his twilight years in a declining mercenary company. He retired, stating he just could not physically do it anymore. You think he was just letting the %companyname% down easy, because a week later he slew ten would-be brigands on the side of a road without breaking a sweat. Last you heard, he was training ungrateful princes in the art of swordfighting.";
		this.m.HiringCost = 400;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_nobles",
			"trait.paranoid",
			"trait.clubfooted",
			"trait.irrational",
			"trait.gluttonous",
			"trait.dumb",			
			"trait.clumsy",
			"trait.tiny",
			"trait.insecure",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.hesitant",
			"trait.fragile",			
			"trait.double_tongued",
			"trait.slack",
			"trait.asthmatic",
			"trait.brute",
			"trait.fat",
			"trait.pessimist",
			"trait.frail"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.Fatigue,
			this.Const.Attributes.RangedDefense,
		];
		this.m.Titles = [
			"the Legend",
			"the Master",
			"the Singing Blade",
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
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
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.UnstoppableTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.TrainedTree,				
				this.Const.Perks.SwordTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.CleaverTree,
				this.Const.Perks.SpearTree,
				this.Const.Perks.TwoHandedTree,
			]
		);

		addPerksToCustomPerkTree(1, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRPatternRecognition,
				this.Const.Perks.PerkDefs.PTRMenacing
			]
		);

		addPerksToCustomPerkTree(2, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRVigorousAssault,
				this.Const.Perks.PerkDefs.PTROffhandTraining
			]
		);

		addPerksToCustomPerkTree(3, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRExudeConfidence
			]
		);
		
		addPerksToCustomPerkTree(4, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster,			
				this.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner
			]
		);

		addPerksToCustomPerkTree(5, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.DoubleStrike		
			]
		);

		addPerksToCustomPerkTree(6, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.PTRKnowTheirWeakness,
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.Duelist
			]
		);

		addPerksToCustomPerkTree(7, this.m.CustomPerkTree, [
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.LastStand,
				this.Const.Perks.PerkDefs.BFFencer
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
				0,
				0
			],
			Bravery = [
				5,
				7
			],
			Stamina = [
				5,
				10
			],
			MeleeSkill = [
				25,
				20
			],
			RangedSkill = [
				-5,
				-5
			],
			MeleeDefense = [
				10,
				15
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				10,
				20
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
		local r;

		if (this.Const.DLC.Unhold)
		{
			r = this.Math.rand(0, 2);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/noble_sword"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
			else if (r == 2)
			{
				items.equip(this.new("scripts/items/weapons/fencing_sword"));
			}
		}
		else
		{
			r = this.Math.rand(0, 1);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/noble_sword"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
		}
		items.equip(this.Const.World.Common.pickArmor([
			[1, "padded_leather"],
			[1, "leather_tunic"],
			[1, "linen_tunic"],
			[1, "padded_surcoat"]
		]))
		items.equip(this.Const.World.Common.pickHelmet([
			[67, ""],
			[33, "greatsword_hat"]
		]));
	}
});

