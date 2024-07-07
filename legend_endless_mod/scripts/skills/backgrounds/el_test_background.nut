this.el_test_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {
		Tattoo = 0
	},
	function create()
	{
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.NeutralMin;
		this.character_background.create();
		this.m.ID = "background.el_test";
		this.m.Name = "Test BackGround Name";
		this.m.Icon = "ui/backgrounds/background_58.png";
		this.m.BackgroundDescription = "";
		this.m.GoodEnding = "Test good ending.";
		this.m.BadEnding = "Test bad ending.";
		this.m.HiringCost = 6666;
		this.m.DailyCost = 66;
		this.m.Excluded = [
			//"trait.weasel"
		];
		this.m.Faces = this.Const.Faces.WildMale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.WildExtended;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = 1;
		this.m.BackgroundType = this.Const.BackgroundType.Combat;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Notorious;
		this.m.Modifiers.Ammo = 10;
		this.m.Modifiers.ArmorParts = 11;
		this.m.Modifiers.Meds = 12;
		this.m.Modifiers.Stash = 50;
		this.m.Modifiers.Hunting = 14;
		this.m.Modifiers.Scout = 15;
		this.m.Modifiers.Gathering = 16;
		this.m.Modifiers.Terrain = [
			4.00,
			4.01,
			4.02,
			4.03,
			4.04,
			4.05,
			4.06,
			4.07,
			4.08,
			4.09,
			4.10,
			4.11,
			4.12,
			4.13,
			4.14,
			4.15,
			4.16,
			4.17,
			4.18
		];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.AxeTree,
				// this.Const.Perks.HammerTree,
				// this.Const.Perks.MaceTree,
				// this.Const.Perks.CleaverTree,
               	// this.Const.Perks.TwoHandedTree

			],
			Defense = [
				this.Const.Perks.HeavyArmorTree,
				this.Const.Perks.MediumArmorTree,
                this.Const.Perks.LightArmorTree
			],
			Traits = [
 				this.Const.Perks.ViciousTree,
				this.Const.Perks.FitTree,
				this.Const.Perks.CalmTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.TalentedTree,
                this.Const.Perks.LargeTree,
                this.Const.Perks.IntelligentTree,
                this.Const.Perks.IndestructibleTree,
               	this.Const.Perks.SturdyTree
			],
			Enemy = [],
			Class = [this.Const.Perks.WildlingProfessionTree],
			Magic = []
		};


	}

	function setGender( _gender = -1 )
	{
		if (_gender == -1)
		{
			_gender = 0;
		}

		if (_gender != 1)
		{
			return;
		}

		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.GoodEnding = "Test Backgrond good ending.";
		this.m.BadEnding = "Test Backgrond bad ending.";
	}

	function onBuildDescription()
	{
		return "Test backgrond build description";
		// if (this.isBackgroundType(this.Const.BackgroundType.Female))
		// {
		// 	return "{%name% survived the battle between yourself and her own tribe of warriors. She offered herself to your company or to your sword. Impressed by his bravery, you chose to take her in. A foreign brute, she hardly speaks your native tongue and she is not well liked by the rest of the company. But if anything can bond two people it is fighting beside one another, killing when it counts, and drinking the night away at the tavern.}";
		// }
		// else
		// {
		// 	return "{%name% survived the battle between yourself and his own tribe of warriors. He offered himself to your company or to your sword. Impressed by his bravery, you chose to take him in. A foreign brute, he hardly speaks your native tongue and he is not well liked by the rest of the company. But if anything can bond two men it is fighting beside one another, killing when it counts, and drinking the night away at the tavern.}";
		// }
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoos = [
			3,
			4,
			5,
			6
		];

		if (this.Math.rand(1, 100) <= 66)
		{
			this.m.Tattoo = tattoos[this.Math.rand(0, tattoos.len() - 1)];
			local tattoo_body = actor.getSprite("tattoo_body");
			local body = actor.getSprite("body");
			tattoo_body.setBrush("tattoo_0" + this.m.Tattoo + "_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 66)
		{
			local tattoo_head = actor.getSprite("tattoo_head");
			tattoo_head.setBrush("tattoo_0" + tattoos[this.Math.rand(0, tattoos.len() - 1)] + "_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("tattoo_0" + this.m.Tattoo + "_" + body.getBrush().Name);
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				1016,
				1015
			],
			Bravery = [
				1014,
				1013
			],
			Stamina = [
				1012,
				1011
			],
			MeleeSkill = [
				1010,
				1009
			],
			RangedSkill = [
				1008,
				1007
			],
			MeleeDefense = [
				1006,
				1005
			],
			RangedDefense = [
				1004,
				1003
			],
			Initiative = [
				1002,
				1001
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
	}

	function onSerialize( _out )
	{
		this.character_background.onSerialize(_out);
		_out.writeU8(this.m.Tattoo);
	}

	function onDeserialize( _in )
	{
		this.character_background.onDeserialize(_in);
		this.m.Tattoo = _in.readU8();
	}

});

