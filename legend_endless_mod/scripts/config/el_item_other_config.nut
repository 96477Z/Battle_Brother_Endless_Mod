local gt = this.getroottable();

if (!("EL_Item_Other" in gt.Const))
{
	gt.Const.EL_Item_Other <- {};
}

gt.Const.EL_Item_Other <- {
    MinLevelInEventAndCraft = 10,
    MaxLevelInEventAndCraft = 0,
	EquipmentEssenceRankDownFactor = [
		10,
		2,
		2
	],	
	EL_NormalNPCEquipmentRankUpChance = {
		Factor = {
			Offset = [
				0,
				-10000,
				40000
			],
			Mult = [
				0,
				1000,
				0
			],
			Range = [
				10,
				50
			]
		}
		Table = []
		function EL_getChance(_EL_Index) {
			return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_Shop.EL_ItemRankUpTwiceChance);
		}
	},
	EL_SeniorNPCEquipmentRankUpChance = {
		Factor = {
			Offset = [
				0,
				-25000,
				100000
			],
			Mult = [
				0,
				2500
				0
			],
			Range = [
				10,
				50
			]
		}
		Table = []
		function EL_getChance(_EL_Index) {
			return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_Shop.EL_ItemRankUpTwiceChance);
		}
	},
	EL_OnlyItemList = [
		"accessory/goblin_trophy_item",
		"accessory/orc_trophy_item",
		"accessory/undead_trophy_item",
		"accessory/oathtaker_skull_02_item",
		"armor/legendary/armor_of_davkul",
		"armor/legendary/emperors_armor",
		"armor/legendary/ijirok_armor",
		"helmets/legendary/emperors_countenance",
		"helmets/legendary/ijirok_helmet",
		"helmets/legendary/mask_of_davkul",
		"legend_armor/legendary/legend_armor_of_davkul",
		"legend_armor/legendary/legend_emperors_armor",
		"legend_armor/legendary/legend_ijirok_armor",
		"weapons/legend_staff_vala"
		"weapons/legendary/legend_mage_swordstaff",
		"weapons/legendary/lightbringer_sword",
		"weapons/legendary/obsidian_dagger",
		"shields/legendary/gilders_embrace_shield"
		"tools/player_banner",
		"el_accessory/el_arena_champion_item",
		"el_accessory/el_armor_ambition_item",
		"el_accessory/el_cart_ambition_item",
		"el_accessory/el_core_item",
		"el_accessory/el_disassemble_item_ambition_item",
		"el_accessory/el_have_crowns_ambition_item",
		"el_accessory/el_have_renown_ambition_item",
		"el_accessory/el_have_talent_ambition_item",
		"el_accessory/el_named_item_ambition_item",
		"el_accessory/el_taelia_present_item",
		"el_accessory/el_trade_ambition_item",
		"el_accessory/el_upgrade_item_ambition_item",
		"el_accessory/el_win_arena_fights_ambition_item",
		"el_helmet/el_crown_of_rule",
		"el_helmet/el_arena_champion_helmet",
		"el_armor/el_arena_champion_armor",
		"el_armor/el_ice_armor",
		"el_weapon/el_arena_champion_axe",
		"el_weapon/el_barbarians_chosen_mace",
		"el_weapon/el_bone_spear",
		"el_weapon/el_frostmourne",
		"el_weapon/el_goblin_tuchun_crossbow",
		"el_weapon/el_hexe_staff",
		"el_weapon/el_human_emperors_sword",
		"el_weapon/el_mummy_curse_cleaver",
		"el_weapon/el_orc_berserker_axe",
		"el_weapon/el_skyfire_cannon",
		"el_weapon/el_undead_dagger",
		"el_weapon/el_vampire_cleaver"
	],	
	EL_SpecialNamedItem = [
		"legend_armor/chain/legend_armor_hauberk_full_named",
		"legend_armor/cloth/legend_gambeson_named",
		"legend_armor/cloth/legend_tunic_noble_named",
		"legend_armor/named/legend_armor_cloak_emperors",
		"legend_armor/named/legend_armor_cloak_rich",
		"legend_armor/named/legend_armor_named_tabard",
		"legend_armor/plate/legend_armor_leather_brigandine_named",
		"legend_armor/plate/legend_armor_leather_jacket_named",
		"legend_armor/plate/legend_armor_leather_lamellar_heavy_named",
		"legend_armor/plate/legend_armor_leather_studded_jacket_named",
		"legend_armor/plate/legend_armor_plate_full_greaves_named",
		"legend_armor/plate/legend_armor_plate_full_greaves_painted",
		"legend_armor/plate/legend_armor_scale_coat_named",
		"legend_armor/plate/legend_southern_named_plates",
		"legend_helmets/helm/legend_helmet_barbute_named",
		"legend_helmets/helm/legend_helmet_bascinet_named",
		"legend_helmets/helm/legend_helmet_crude_skull_helm",
		"legend_helmets/helm/legend_helmet_deep_sallet_named",
		"legend_helmets/helm/legend_helmet_dentist_helmet",
		"legend_helmets/helm/legend_helmet_heavy_plate_helm_named",
		"legend_helmets/helm/legend_helmet_heavy_spiked_helm",
		"legend_helmets/helm/legend_helmet_italo_norman_helm_named",
		"legend_helmets/helm/legend_helmet_kettle_helm_named",
		"legend_helmets/helm/legend_helmet_legend_armet_01_named",
		"legend_helmets/helm/legend_helmet_legend_frogmouth_close",
		"legend_helmets/helm/legend_helmet_southern_named_conic",
		"legend_helmets/helm/legend_helmet_stag_helm",
		"legend_helmets/helm/legend_helmet_swan_helm",
		"legend_helmets/helm/legend_helmet_tailed_conic",
		"legend_helmets/helm/legend_helmet_wallace_sallet_named",
		"legend_helmets/hop/legend_helmet_bascinet_visor_named",
		"legend_helmets/hop/legend_helmet_faceplate_full_01_named",
		"legend_helmets/hop/legend_helmet_faceplate_full_gold",
		"legend_helmets/hop/legend_helmet_faceplate_gold",
		"legend_helmets/hop/legend_helmet_faceplate_raised",
		"legend_helmets/hop/legend_helmet_golden_helm",
		"legend_helmets/hop/legend_helmet_golden_mask",
		"legend_helmets/hop/legend_helmet_wallace_sallet_visor_named",
		"legend_helmets/hop/legend_helmet_warlock_skull",
	],

	EL_InvalidItem = [
		"tools/acid_flask_item",
		"tools/daze_bomb_item",
		"tools/faction_banner",
		"tools/fire_bomb_item",
		"tools/holy_water_item",
		"tools/legend_broken_throwing_net",
		"tools/reinforced_throwing_net",
		"tools/smoke_bomb_item",
		"tools/throwing_net",
	],

	function EL_otherItemInit( _item )
	{
		if(_item != null)
		{
			if(_item.EL_getLevel() == -1)
			{
				local EL_worldLevel = this.Math.min(this.World.Assets.m.EL_WorldLevel, _item.EL_getLevelMax());
				local level = this.Math.rand(this.Math.max(0 ,EL_worldLevel - this.Const.EL_Item_Other.MinLevelInEventAndCraft), EL_worldLevel - this.Const.EL_Item_Other.MaxLevelInEventAndCraft);
				local random = this.Math.rand(1, 100000);
				local extra_mult = this.World.Flags.get("EL_HasNamedItemAmbitionRule") ? 1.5 : 1.0;

				if(random <= this.Const.EL_Shop.EL_ItemRankUpTwiceChance.EL_getChance(EL_worldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor() * extra_mult)
				{
					_item.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Fine, level);
				}
				else if(random <= (this.Const.EL_Shop.EL_ItemRankUpTwiceChance.EL_getChance(EL_worldLevel) + this.Const.EL_Shop.EL_ItemRankUpOnceChance.EL_getChance(EL_worldLevel)) * this.World.Assets.EL_getHalfWorldDifficultFactor() * extra_mult)
				{
					_item.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Premium, level);
				}
				else
				{
					_item.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Normal, level);
				}
			}
			else
			{
				_item.EL_updateLevelProperties();
			}
		}
	},
	function EL_isNoCoreEntity( _actor )
	{
		foreach(entity in this.Const.EL_Accessory.EL_NoCoreEntityList)
		{
			if(_actor.getType() == entity)
			{
				return true;
			}
		}
		return false;
	},
	function EL_actorItemInit( _actor, _isNpc = false )
	{
		if(_actor != null)
		{
			local rank_level = _actor.EL_getRankLevel();
			local world_level = this.World.Assets.m.EL_WorldLevel;
            local main_hand = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
            local off_hand = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
            local body = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            local head = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
			local accessory = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
			//this.logInfo("_actor.ID:"+_actor.getName());
			if(_isNpc && accessory == null)
			{
				if(!this.Const.EL_Item_Other.EL_isNoCoreEntity(_actor) && main_hand == null && off_hand == null)
				{
					_actor.m.Items.equip(this.new("scripts/items/el_accessory/el_core_item"));
					accessory = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
				}
				else
				{
					local r = this.Math.rand(0, this.Const.EL_Accessory.EL_NormalAccessoryList.len() - 1);
					_actor.m.Items.equip(this.new("scripts/items/" + this.Const.EL_Accessory.EL_NormalAccessoryList[r]));
					accessory = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
				}
				//this.logInfo("generate accessory:" + accessory.getID());
			}

			local items = [];
			for( local i = 0; i < _actor.getItems().getUnlockedBagSlots(); i = i )
			{
				local bag_item = _actor.getItems().getItemAtBagSlot(i);
				if (bag_item != null)
				{
					items.push(bag_item);
				}
				i = ++i;
			}
			if(main_hand != null)
			{
				items.push(main_hand);
			}
			if(off_hand != null)
			{
				items.push(off_hand);
			}
			if(body != null)
			{
				items.push(body);
			}
			if(head != null)
			{
				items.push(head);
			}
			if(accessory != null)
			{
				accessory.EL_generateByRankAndLevel(rank_level, _actor.EL_getLevel());
				if(_isNpc)
				{
					if(_actor.m.WorldTroop != null && _actor.m.WorldTroop.EL_IsBossUnit)
					{
						if(accessory.getID() == "el_accessory.core")
						{
							accessory.EL_addRankLevel();
						}
						else
						{
							_actor.getItems().unequip(_actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory));
							local r = this.Math.rand(0, this.Const.EL_Accessory.EL_SeniorAccessoryList.len() - 1);
							_actor.m.Items.equip(this.new("scripts/items/" + this.Const.EL_Accessory.EL_SeniorAccessoryList[r]));
							accessory = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
							accessory.EL_generateByRankAndLevel(rank_level, _actor.EL_getLevel());
						}
					}
					if(rank_level == 0)
					{
						if(this.Math.rand(1, 100000) <= this.Const.EL_Item_Other.EL_NormalNPCEquipmentRankUpChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor())
						{
							accessory.EL_addRankLevel();
						}
					}
					else
					{
						if(this.Math.rand(1, 100000) <= this.Const.EL_Item_Other.EL_SeniorNPCEquipmentRankUpChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor())
						{
							accessory.EL_addRankLevel();
						}
					}
				}
			}
			foreach(item in items)
			{
				item.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Normal, _actor.EL_getLevel());
				if(_isNpc)
				{
					if(rank_level == 0)
					{
						if(this.Math.rand(1, 100000) <= this.Const.EL_Item_Other.EL_NormalNPCEquipmentRankUpChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor())
						{
							item.EL_addRankLevel();
						}
					}
					else
					{
						if(this.Math.rand(1, 100000) <= this.Const.EL_Item_Other.EL_SeniorNPCEquipmentRankUpChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor())
						{
							item.EL_addRankLevel();
						}
					}
					if(rank_level == 2)
					{
						item.EL_addRankLevel();
					}
					if(_actor.m.WorldTroop != null && _actor.m.WorldTroop.EL_IsBossUnit && !item.isItemType(this.Const.Items.ItemType.Named))
					{
						item.EL_addRankLevel();
					}
				}
			}
		}
	},

	NegativeEffectID = [
		"effects.bleeding",
		"effects.charmed",
		"effects.chilled",
		"effects.curseofyears",
		"effects.dazed",
		"effects.debilitated",
		"effects.disarmed",
		"effects.disintegrating",
		"effects.distracted",
		"effects.hex_slave",
		"effects.horrified",
		"effects.insect_swarm",
		"effects.legend_baffled",
		"effects.legend_dazed",
		"effects.legend_demon_hound_bite_effect",
		"effects.legend_grappled",
		"effects.legend_grazed_effect",
		"effects.legend_marked_target",
		"effects.legend_parried",
		"effects.legend_redback_spider_poison",
		"effects.legend_safeguarding",
		"effects.lindwurm_acid",
		"effects.mummy_curse",
		"effects.net",
		"effects.nightmare",
		"effects.overwhelmed",
		"effects.ptr_arrow_to_the_knee_debuff",
		"effects.ptr_dented_armor",
		"effects.ptr_dismantled",
		"effects.ptr_exhausted",
		"effects.ptr_exploitable_opening",
		"effects.ptr_eyes_up",
		"effects.ptr_from_all_sides",
		"effects.ptr_intimidated",
		"effects.ptr_rattled",
		"effects.smackdown_debuff_effect",
		"effects.sweeping_strikes_debuff_effect",
		"effects.ptr_worn_down",
		"effects.rooted",
		"effects.serpent_ensnare",
		"effects.shellshocked",
		"effects.sleeping",
		"effects.spider_poison",
		"effects.staggered",
		"effects.str_covering_ally",
		"effects.stunned",
		"effects.web",
		"effects.withered",
		"effects.legend_zombie_poison",
		"effects.afraid",
		"effects.exhausted",
		"effects.hangover",
		"effects.legend_headache",
		"effects.legend_irritable",
		"el_rarity_effects.temp_weaken",
		"el_rarity_effects.weaken",
	],

	NegativeEffectScripts = [
		"scripts/skills/effects/bleeding_effect",
		"scripts/skills/effects/chilled_effect",
		"scripts/skills/effects/curseofyears_effect",
		"scripts/skills/effects/dazed_effect",
		"scripts/skills/effects/debilitated_effect",
		"scripts/skills/effects/disarmed_effect",
		"scripts/skills/effects/disintegrating_effect",
		"scripts/skills/effects/distracted_effect",
		"scripts/skills/effects/horrified_effect",
		"scripts/skills/effects/insect_swarm_effect",
		"scripts/skills/effects/legend_baffled_effect",
		"scripts/skills/effects/legend_dazed_effect",
		"scripts/skills/effects/legend_demon_hound_bite_effect",
		"scripts/skills/effects/legend_grappled_effect",
		"scripts/skills/effects/legend_grazed_effect",
		"scripts/skills/effects/legend_marked_target",
		"scripts/skills/effects/legend_redback_spider_poison_effect",
		"scripts/skills/effects/lindwurm_acid_effect",
		"scripts/skills/effects/mummy_curse_effect",
		"scripts/skills/effects/nightmare_effect",
		"scripts/skills/effects/overwhelmed_effect",
		"scripts/skills/effects/ptr_arrow_to_the_knee_debuff_effect",
		"scripts/skills/effects/ptr_dented_armor_effect",
		"scripts/skills/effects/ptr_dismantled_effect",
		"scripts/skills/effects/ptr_exhausted_effect",
		"scripts/skills/effects/ptr_eyes_up_effect",
		"scripts/skills/effects/ptr_from_all_sides_effect",
		"scripts/skills/effects/ptr_intimidated_effect",
		"scripts/skills/effects/ptr_rattled_effect",
		"scripts/skills/effects/ptr_smackdown_debuff_effect",
		"scripts/skills/effects/ptr_sweeping_strikes_debuff_effect",
		"scripts/skills/effects/ptr_worn_down_effect",
		"scripts/skills/effects/rooted_effect",
		"scripts/skills/effects/shellshocked_effect",
		"scripts/skills/effects/sleeping_effect",
		"scripts/skills/effects/spider_poison_effect",
		"scripts/skills/effects/staggered_effect",
		"scripts/skills/effects/stunned_effect",
		"scripts/skills/effects/withered_effect",
		"scripts/skills/effects/zombie_poison_effect",
		"scripts/skills/effects_world/afraid_effect",
		"scripts/skills/effects_world/exhausted_effect",
		"scripts/skills/effects_world/legend_headache_effect",
		"scripts/skills/effects_world/legend_irritable_effect",
		"scripts/skills/el_effects/el_temp_weaken_effect",
		"scripts/skills/el_effects/el_weaken_effect"
	]
};

this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_Item_Other.EL_NormalNPCEquipmentRankUpChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_Item_Other.EL_SeniorNPCEquipmentRankUpChance);