this.el_test_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.el_test";
		this.m.Name = "仅测试用";
		this.m.Description = "Test description.";
		this.m.Difficulty = 1;
		this.m.Order = 99999;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(12);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(21);
		this.m.StartingBusinessReputation = 1000;
	}

	function isValid()
	{
		return true;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local bro = roster.create("scripts/entity/tactical/player");
		bro.m.HireTime = this.Time.getVirtualTimeF();
		bro.setName("Test Name 0");
		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"el_test_background"
		], true, -1, true, 2);
		bros[0].m.HireTime = this.Time.getVirtualTimeF();
		bros[0].getBackground().buildDescription(true);
		bros[0].setTitle("测试");
		bros[0].setName("Test Name 0");
		bros[0].setPlaceInFormation(4);
		bros[0].getFlags().set("IsPlayerCharacter", true);
		//		bros[0].getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
		//		bros[0].setVeteranPerks(2);
		bros[0].m.BaseProperties.ActionPoints = 1000;
		bros[0].m.BaseProperties.Hitpoints = 1000;
		bros[0].m.BaseProperties.Bravery = 1000;
		bros[0].m.BaseProperties.Stamina = 1000;
		bros[0].m.BaseProperties.Initiative = 1000;
		bros[0].m.BaseProperties.MeleeSkill = 1000;
		bros[0].m.BaseProperties.RangedSkill = 1000;
		bros[0].m.BaseProperties.MeleeDefense = 1000;
		bros[0].m.BaseProperties.RangedDefense = 1000;
		this.Const.EL_Player.EL_PerkTree.EL_AddRandomPerkTreeToPlayer(bros[0], 999);
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Flags.set("HasLegendCampTraining", true);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_arena_champion_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_armor_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_cart_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_disassemble_item_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_have_crowns_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_have_renown_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_have_talent_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_named_item_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_trade_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_upgrade_item_ambition_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/el_accessory/el_win_arena_fights_ambition_item"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor/legend_armor_hexe_leader_cloak_upgrade"));
		// this.World.Assets.getStash().add(this.new("scripts/items/helmets/legendary/ijirok_helmet"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_armor_mountain_named"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_armor_mountain"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_armor_named_warlock_cloak"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_armor_of_davkul"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_emperors_armor"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_ijirok_armor"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legendary/legend_skin_armor"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/legendary/lightbringer_sword"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_shovel"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_cat_o_nine_tails"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/oriental/handgonne"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/named_warbow"));
		// this.World.Assets.getStash().add(this.new("scripts/items/armor/named/named_bronze_armor"));
		// this.World.Assets.getStash().add(this.new("scripts/items/armor/named/named_bronze_armor"));
		// this.World.Assets.getStash().add(this.new("scripts/items/armor_upgrades/leather_shoulderguards_upgrade"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/armor_upgrades/legend_leather_shoulderguards_upgrade"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/named/named_goblin_spear"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_armor/el_arena_champion_armor"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_helmet/el_arena_champion_helmet"));
		// this.World.Assets.getStash().add(this.new("scripts/items/shields/legendary/gilders_embrace_shield"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_arena_champion_axe"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_goblin_tuchun_crossbow"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_human_emperors_sword"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_orc_berserker_axe"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_barbarians_chosen_mace"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_undead_dagger"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_vampire_cleaver"));
		// this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_staff_vala"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_bone_spear"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_hexe_staff"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_mummy_curse_cleaver"));
		// this.World.Assets.getStash().add(this.new("scripts/items/el_weapon/el_skyfire_cannon"));
		local npc_buffs = [];
		local skill = this.new("scripts/skills/el_npc_buffs/el_lightning_speed_npc_buff");
		skill.EL_setRankLevel(2);
		npc_buffs.push(skill);
		local magic_stone = this.new("scripts/items/el_misc/el_npc_buff_stone_item");
        magic_stone.EL_generateByNPCBuffs(npc_buffs);
		this.World.Assets.getStash().add(magic_stone);


		local item = this.new("scripts/items/accessory/orc_trophy_item");
		item.EL_generateByRankAndLevel(2,100);
		this.World.Assets.getStash().add(item);
		this.World.Assets.EL_addEquipmentEssence(0, 999999);
		this.World.Assets.EL_addEquipmentEssence(1, 999999);
		this.World.Assets.EL_addEquipmentEssence(2, 999999);
		this.World.Assets.EL_addEquipmentEssence(3, 999999);
		this.World.Assets.EL_addEquipmentEssence(4, 999999);
		this.World.Assets.m.Money = 999999;
		this.World.Assets.m.ArmorParts = 99;
		this.World.Assets.m.Medicine = 99;
		this.World.Assets.m.Ammo = 99;
		bros[0].m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));
		
		bros[0].m.Skills.add(this.new("scripts/skills/perks/perk_legend_cascade"));
	}

	function onSpawnPlayer()
	{
		local randomVillage;
		local northernmostY = 0;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			local v = this.World.EntityManager.getSettlements()[i];

			if (v.getTile().SquareCoords.Y > northernmostY && !v.isMilitary() && !v.isIsolatedFromRoads() && v.getSize() <= 2)
			{
				northernmostY = v.getTile().SquareCoords.Y;
				randomVillage = v;
			}
		}
		randomVillage.setLastSpawnTimeToNow();
		local randomVillageTile = randomVillage.getTile();

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 2), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 2));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 2), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 2));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) == 0)
				{
				}
				else if (!tile.HasRoad)
				{
				}
				else
				{
					randomVillageTile = tile;
					break;
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(6);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BusinessReputationRate = 0.3;
	}

	function onCombatFinished()
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}


});

