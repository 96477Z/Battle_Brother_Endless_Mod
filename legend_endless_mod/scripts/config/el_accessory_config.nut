local gt = this.getroottable();

if (!("EL_Accessory" in gt.Const))
{
	gt.Const.EL_Accessory <- {};
}

gt.Const.EL_Accessory <- {
	EL_RankValue = [
		1,
		2,
		5,
		12,
		25
	],
	EL_LevelFactor = {
		Value = 0.08,
		StaminaModifier = 0.04
	},
	EL_EquipmentEssence = {
		LevelFactor = 0.08,
		RankFactor = 3,
		UpgradeLevelFactor = [
			0.8,
			0.9,
			0.9,
			1.0
		],
		UpgradeRankFactor = [
			0.8,
			0.9,
			0.9,
			1.0
		],
		UpgradeRankNormalEssenceFactor = 10,
		DisassembleFactor = [
			1.0,
			0.9,
			0.9,
			0.8
		],
		RecraftFactor = [
			0.8,
			0.9,
			0.9,
			1.0
		],
		SeniorEquipmentEssenceMult = 0.1,
		LowerEquipmentEssenceMult = 3,
		StrengthenEntryNum = 3,
		UpgradeRankLegendaryNum = 3,
		MinCalculateWeight = -160
	},
	EL_DroppedChance = [
		4,
		10,
		40,
		100,
		100
	],
	EL_ValidAccessory = [
		"accessory/legendary/cursed_crystal_skull"
		"accessory/special/legend_oms_fate_item",
		"accessory/special/legend_oms_ledger_item",
		"accessory/special/legend_oms_paw_item",
		"accessory/special/legend_oms_rib_item",
		"accessory/special/slayer_necklace_item",
		"accessory/alp_trophy_item",
		"accessory/ghoul_trophy_item",
		"accessory/goblin_trophy_item",
		"accessory/hexen_trophy_item",
		"accessory/legend_demon_banshee_trophy_item",
		"accessory/legend_demonalp_trophy_item",
		"accessory/legend_hexen_leader_trophy_item",
		"accessory/legend_wolfsbane_necklace_item",
		"accessory/oathtaker_skull_01_item",
		"accessory/oathtaker_skull_02_item",
		"accessory/orc_trophy_item",
		"accessory/sergeant_badge_item",
		"accessory/undead_trophy_item",
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
		"el_accessory/el_win_arena_fights_ambition_item"
	],
	EL_NormalAccessoryList = [
		"accessory/alp_trophy_item",
		"accessory/hexen_trophy_item",
		"accessory/ghoul_trophy_item"
	],
	EL_SeniorAccessoryList = [
		"accessory/legend_demon_banshee_trophy_item",
		"accessory/legend_demonalp_trophy_item",
		"accessory/legend_hexen_leader_trophy_item",
		"accessory/sergeant_badge_item",
		"accessory/special/slayer_necklace_item"
	],
	EL_NoCoreEntityList = [
		this.Const.EntityType.Zombie,
		this.Const.EntityType.ZombieYeoman,
		this.Const.EntityType.ZombieKnight,
		this.Const.EntityType.ZombieBoss,
		this.Const.EntityType.ZombieBetrayer,
		this.Const.EntityType.ZombieTreasureHunter
	]
	function EL_updateRankLevelProperties( _item ) {
		_item.m.EL_BaseWithRankValue = _item.m.EL_BaseNoRankValue * gt.Const.EL_Shield.EL_RankValue[_item.m.EL_RankLevel];
	},
	EL_Entry = {
		Pool = {
			Entrys = [
                {
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_action_point_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
                // {
				// 	Scripts = "scripts/skills/el_entrys/accessory_entrys/el_bravery_entry",
				// 	function EL_ifEligible(_item) { return true; }
                //     function EL_ifNeedRemove(_entryLevel) { return false; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_combat_level_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_damage_mult_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_engrgy_shield_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_fatigue_recover_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_hitpoints_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_hitpoints_recover_daliy_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_hitpoints_recovery_rate_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_immue_bleeding_poisoned_fire_miasma_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_immue_grab_knock_twirl_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_immue_overwhelm_dazed_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_immue_stun_root_disarm_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_immue_surrounded_riposte_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				// {
				// 	Scripts = "scripts/skills/el_entrys/accessory_entrys/el_initiative_entry",
				// 	function EL_ifEligible(_item) { return true; }
                //     function EL_ifNeedRemove(_entryLevel) { return false; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_reduce_damage_received_mult_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				// {
				// 	Scripts = "scripts/skills/el_entrys/accessory_entrys/el_stamina_entry",
				// 	function EL_ifEligible(_item) { return true; }
                //     function EL_ifNeedRemove(_entryLevel) { return false; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_taunt_mult_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_value_mult_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel > 1 && _item.m.Value != 0 && !_item.isItemType(this.Const.Items.ItemType.Legendary))
						{
							return true;
						}
						return false;
					}
                    function EL_ifNeedRemove(_entryLevel) {
                        if(_entryLevel != 1)
						{
							return true;
						}
						return false;
                    }
				},
				{
					Scripts = "scripts/skills/el_entrys/accessory_entrys/el_xp_gain_mult_entry",
					function EL_ifEligible(_item) { return true; }
                    function EL_ifNeedRemove(_entryLevel) { return false; }
				}
			],
		},
		RarityEntryChane = [
			1,
			10,
			100,
			1000,
			10000
		],
		EntryNum = {
			NormalAccessory = [
				0.02,
                0.06,
                0.10,
                0.14,
				0.18
			]
		},
		EntryStrengthenMult = 2.0,
		Factor = {
            EL_ActionPoint = {
				ID = "el_accessory_entry.action_point",
				ActionPoint = 2
			},
            EL_Bravery = {
				ID = "el_accessory_entry.bravery",
				BaseBravery = 15,
				RandomMinBravery = [
					1,
					1,
					4,
					7,
					15
				],
				RandomMaxBravery = [
					6,
					9,
					12,
					15,
					15
				],
				ColourRange = [
					18,
					21,
					24,
					27,
					30
				]
			},
			EL_CombatLevel = {
				ID = "el_accessory_entry.combat_level",
				BaseCombatLevel = 1.5,
				RandomMinCombatLevel = [
					1,
					1,
					61,
					91,
					150
				],
				RandomMaxCombatLevel = [
					60,
					90,
					120,
					150,
					150
				],
				ColourRange = [
					1.8,
					2.1,
					2.4,
					2.7,
					3.0
				]
			},
			EL_DamageMult = {
				ID = "el_accessory_entry.damage_mult",
				BaseDamageMult = 15,
				RandomMinDamageMult = [
					1,
					1,
					301,
					601,
					1500
				],
				RandomMaxDamageMult = [
					600,
					900,
					1200,
					1500,
					1500
				],
				ColourRange = [
					18,
					21,
					24,
					27,
					30
				]
			},
			EL_EngrgyShield = {
				ID = "el_accessory_entry.engrgy_shield",
				StackRecoverPersentPurTurn = 0.25,
				BaseEngrgyShieldStack = 2,
				RandomMinEngrgyShieldStack = [
					0,
					0,
					1,
					1,
					2
				],
				RandomMaxEngrgyShieldStack = [
					0,
					1,
					1,
					2,
					2
				],
				ColourRange = [
					2,
					2,
					3,
					3,
					4
				]
			},
			EL_FatigueRecover = {
				ID = "el_accessory_entry.fatigue_recover",
				FatigueRecover = 6
			},
			EL_Hitpoints = {
				ID = "el_accessory_entry.hitpoints",
				BaseHitpoints = 30,
				RandomMinHitpoints = [
					1,
					1,
					601,
					1201,
					3000
				],
				RandomMaxHitpoints = [
					1200,
					1800,
					2400,
					3000,
					3000
				],
				ColourRange = [
					36,
					42,
					48,
					54,
					60
				]
			},
			EL_HitpointsRecoverDaliy = {
				ID = "el_accessory_entry.hitpoints_recovery_daily",
				BaseHitpointsRecoverDaily = 30,
				RandomMinHitpointsRecoverDaily = [
					1,
					1,
					601,
					1201,
					3000
				],
				RandomMaxHitpointsRecoverDaily = [
					1200,
					1800,
					2400,
					3000,
					3000
				],
				ColourRange = [
					36,
					42,
					48,
					54,
					60
				]

			},
			EL_HitpointsRecoveryRate = {
				ID = "el_accessory_entry.hitpoints_recovery_rate",
				BaseHitpointsRecoveryRate = 3,
				RandomMinHitpointsRecoveryRate = [
					1,
					1,
					61,
					121,
					300
				],
				RandomMaxHitpointsRecoveryRate = [
					120,
					180,
					240,
					300,
					300
				],
				ColourRange = [
					3.6,
					4.2,
					4.8,
					5.4,
					6
				]
			},
			EL_ImmueBleedingPoisonedFireMiasma = {
				ID = "el_accessory_entry.immue_bleeding_poisoned_fire_miasma",
			},
			EL_ImmueGrabKnockTwirl = {
				ID = "el_accessory_entry.immue_grab_knock_twirl",
			},
			EL_ImmueOverwhelmDazed = {
				ID = "el_accessory_entry.immue_overwhelm_dazed",
			},
			EL_ImmueStunRootDisarm = {
				ID = "el_accessory_entry.immue_stun_root_disarm",
			},
			EL_ImmueSurroundedRiposte = {
				ID = "el_accessory_entry.immue_surrounded_riposte",
			},
			EL_Initiative = {
				ID = "el_accessory_entry.initiative",
				BaseInitiative = 30,
				RandomMinInitiative = [
					1,
					1,
					7,
					13,
					30
				],
				RandomMaxInitiative = [
					12,
					18,
					24,
					30,
					30
				],
				ColourRange = [
					36,
					42,
					48,
					54,
					60
				]
			},
			EL_ReduceDamageReceivedMult = {
				ID = "el_accessory_entry.reduce_damage_received_mult",
				BaseReduceDamageReceivedMult = 15,
				RandomMinReduceDamageReceivedMult = [
					1,
					1,
					301,
					601,
					1500
				],
				RandomMaxReduceDamageReceivedMult = [
					600,
					900,
					1200,
					1500,
					1500
				],
				ColourRange = [
					18,
					21,
					24,
					27,
					30
				]
			},
			EL_Stamina = {
				ID = "el_accessory_entry.stamina",
				BaseStamina = 30,
				RandomMinStamina = [
					1,
					1,
					7,
					13,
					30
				],
				RandomMaxStamina = [
					12,
					18,
					24,
					30,
					30
				],
				ColourRange = [
					36,
					42,
					48,
					54,
					60
				]
			},
			EL_TauntMult = {
				ID = "el_accessory_entry.taunt_mult",
				BaseTauntMult = 500,
				RandomMinTauntMult = [
					1,
					1,
					101,
					201,
					500
				],
				RandomMaxTauntMult = [
					200,
					300,
					400,
					500,
					500
				],
				ColourRange = [
					600,
					700,
					800,
					900,
					1000
				]
			}
			EL_ValueMult = {
				ID = "el_accessory_entry.value_mult"
			},
			EL_XPGainMult = {
				ID = "el_accessory_entry.xp_gain_mult",
				BaseXPGainMult = 25,
				RandomMinXPGainMult = [
					1,
					1,
					501,
					1001,
					2500
				],
				RandomMaxXPGainMult = [
					1000,
					1500,
					2000,
					2500,
					2500
				],
				ColourRange = [
					30,
					35,
					40,
					45,
					50
				]
			}
		}
	},
	function EL_assignItemEntrys( _item, _entryNum ) {
		local index_pool = [];
		for(local i = 0; i < this.Const.EL_Accessory.EL_Entry.Pool.Entrys.len(); ++i) {
				if(this.Const.EL_Accessory.EL_Entry.Pool.Entrys[i].EL_ifEligible(_item)) {
				index_pool.push(i);
			}
		}
		while(_item.m.EL_EntryList.len() < _entryNum - 1 && index_pool.len() != 0)
		{
			local r = this.Math.rand(0, index_pool.len() - 1);
			local entry = this.new(this.Const.EL_Accessory.EL_Entry.Pool.Entrys[index_pool[r]].Scripts);
			index_pool.remove(r);
			if(!_item.EL_hasEntry(entry.getID()))
			{
				_item.EL_addEntryToList(entry);
			}
		}
		if(_entryNum > _item.m.EL_EntryList.len() && index_pool.len() != 0)
		{
			for(local i = index_pool.len() - 1; i > 0; --i) {
				//this.logInfo("index_pool size:"+index_pool.len()+"index_pool:"+index_pool[i]);
				if(this.Const.EL_Accessory.EL_Entry.Pool.Entrys[index_pool[i]].EL_ifNeedRemove(_entryNum - _item.m.EL_EntryList.len()))
				{
					index_pool.remove(i);
				}
			}
			local r = this.Math.rand(0, index_pool.len() - 1);
			local entry = this.new(this.Const.EL_Accessory.EL_Entry.Pool.Entrys[index_pool[r]].Scripts);
			index_pool.remove(r);
			if(!_item.EL_hasEntry(entry.getID()))
			{
				_item.EL_addEntryToList(entry);
			}
		}
	}

	function EL_assignItemRarityEntry( _item, EL_additionalRarityChance = 0 ) {
		local r = this.Math.rand(1, 100000) + EL_additionalRarityChance;
		//this.logInfo("RarityEntryChane:" + r + "EL_additionalRarityChance:" + EL_additionalRarityChance);
		if(r <= this.Const.EL_Accessory.EL_Entry.RarityEntryChane[_item.m.EL_RankLevel])
		{
			this.logInfo("!!!RarityEntry!!!" + r);
			local r = this.Math.rand(0, this.Const.EL_Rarity_Entry.Pool.Entrys.len() - 1);
			_item.EL_setRarityEntry(this.new(this.Const.EL_Rarity_Entry.Pool.Entrys[r].Scripts));
		}
	}
};