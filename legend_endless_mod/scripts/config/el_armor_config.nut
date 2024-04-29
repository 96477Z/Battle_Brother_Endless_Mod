local gt = this.getroottable();

if (!("EL_Armor" in gt.Const))
{
	gt.Const.EL_Armor <- {};
}

gt.Const.EL_Armor <- {
	EL_RankValue = [
		1,
		2,
		5,
		12,
		25
	]
	EL_RankFactor = {
		StaminaModifierMult = 0.85,
		StaminaModifierMultHalf = 0.92195,
		ConditionMult = 1.3,
		ConditionMultHalf = 1.14017,
		Vision = 2,
		DamageBodyRegularReduction = 1,
		DamageBodyArmorReduction = 1
	},
	EL_LevelFactor = {
		Condition = 0.08,
		Value = 0.08,
		StaminaModifier = 0.04,
		DamageBodyRegularReduction = 0.08,
		DamageBodyArmorReduction = 0.08
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
		StrengthenEntryNum = 1,
		UnlayeredUpgradeRankLegendaryNum = 3,
		LayeredUpgradeRankLegendaryNum = 1,
		MinCalculateWeight = -1
	},
	EL_DecorativeUpgrade = [
		5//this.Const.Items.ArmorUpgrades.Rune
	],//this.Const.Items.ArmorUpgrades.Attachment is special, it can get level properties but not have rank properties, and its entry rules are equivalent to accessory
	function EL_isDecorativeUpgrade( _item )
	{
		foreach(upgrade_type in this.Const.EL_Armor.EL_DecorativeUpgrade)
		{
			if(_item.getType() == upgrade_type)
			{
				return true;
			}
			return false;
		}
	},
	EL_RankPropertiesInitFunctions = [
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Armor.EL_RankFactor.ConditionMultHalf : this.Const.EL_Armor.EL_RankFactor.ConditionMult;
				_item.m.EL_BaseWithRankConditionMax = this.Math.ceil(_item.m.EL_BaseWithRankConditionMax * bonus);
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Armor.EL_RankFactor.StaminaModifierMultHalf : this.Const.EL_Armor.EL_RankFactor.StaminaModifierMult;
				_item.m.EL_BaseWithRankStaminaModifier = _item.m.EL_BaseWithRankStaminaModifier * bonus;
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Math.floor(this.Const.EL_Armor.EL_RankFactor.DamageBodyRegularReduction / 2.0) : this.Const.EL_Armor.EL_RankFactor.DamageBodyRegularReduction;
				// switch (_item.EL_getArmorType())
				// {
				// 	case this.Const.EL_Item.ArmorType.UnlayeredArmor:
				// 		bonus *= 5;
				// 		break;
				// 	case this.Const.EL_Item.ArmorType.BaseArmor:
				// 		break;
				// 	case this.Const.EL_Item.ArmorType.ArmorUpgrade:
				// 		break;
				// }
				_item.m.EL_BaseWithRankDamageBodyRegularReduction += this.Math.abs(_item.m.EL_BaseNoRankStaminaModifier * bonus);
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Math.floor(this.Const.EL_Armor.EL_RankFactor.DamageBodyArmorReduction / 2.0) : this.Const.EL_Armor.EL_RankFactor.DamageBodyArmorReduction;
				// switch (_item.EL_getArmorType())
				// {
				// 	case this.Const.EL_Item.ArmorType.UnlayeredArmor:
				// 		bonus *= 5;
				// 		break;
				// 	case this.Const.EL_Item.ArmorType.BaseArmor:
				// 		break;
				// 	case this.Const.EL_Item.ArmorType.ArmorUpgrade:
				// 		break;
				// }
				_item.m.EL_BaseWithRankDamageBodyArmorReduction += this.Math.abs(_item.m.EL_BaseNoRankStaminaModifier * bonus);
			},
			weight = 1
		}
	],
	function EL_updateRankLevelProperties( _item ) {
		if(this.Const.EL_Armor.EL_isDecorativeUpgrade(_item))
		{
			return;
		}
		_item.m.EL_BaseWithRankValue = _item.m.EL_BaseNoRankValue * gt.Const.EL_Armor.EL_RankValue[_item.m.EL_RankLevel];
		if(_item.m.EL_RankLevel == this.Const.EL_Item.Type.Fine)
		{
			foreach	(func in gt.Const.EL_Armor.EL_RankPropertiesInitFunctions)
			{
				if(func.ifUsable(_item))
				{
					func.changeValues(_item, true);
				}
			}
		}
		for(local index = this.Const.EL_Item.Type.Fine; index < _item.m.EL_RankLevel; ++index)
		{
			foreach	(func in gt.Const.EL_Armor.EL_RankPropertiesInitFunctions)
			{
				if(func.ifUsable(_item))
				{
					func.changeValues(_item);
				}
			}
		}
		if(_item.m.EL_RankLevel >= this.Const.EL_Item.Type.Premium && _item.m.EL_RankLevel != this.Const.EL_Item.Type.Legendary)
		{
			local available = [];
			local weightList = [];
			local weightSum = 0;
			foreach	(func in gt.Const.EL_Armor.EL_RankPropertiesInitFunctions)
			{
				if(func.ifUsable(_item))
				{
					available.push(func.changeValues);
					weightList.push(func.weight);
					weightSum += func.weight;
				}
			}
			if(_item.m.EL_RankPropertiesImproveIndex.len())
			{
				foreach(index in _item.m.EL_RankPropertiesImproveIndex)
				{
					available[index](_item);
					available.remove(index);
				}
			}
			else
			{
				for( local count = 2; count != 0 && available.len() != 0; --count )
				{
					local roll = this.Math.rand(0, weightSum - weightList[0]);
					local number = 0;
					for( local index = 0; index < weightList.len(); ++index )
					{
						if(roll > weightList[index])
						{
							++number;
							roll -= weightList[index];
						}
						else
						{
							break;
						}
					}
					weightSum -= weightList[number];
					weightList.remove(number);
					available[number](_item);
					available.remove(number);
					_item.m.EL_RankPropertiesImproveIndex.push(number);
				}
			}
		}
	},
	EL_Entry = {
		Pool = {
			Entrys = [
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_combat_level_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_condition_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_condition_recover_daliy_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_condition_recover_rate_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_damage_body_reduction_entry",
					function EL_ifEligible(_item) {
						//if(_item.m.EL_BaseNoRankStaminaModifier <= 1) { return false; }
						//if(_item.EL_hasEntry(this.Const.EL_Armor.EL_Entry.Factor.EL_DamageBodyArmorReduction.ID)) { return false; }
						return true;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_damage_regular_reduction_entry",
					function EL_ifEligible(_item) {
						//if(_item.m.EL_BaseNoRankStaminaModifier <= 1) { return false; }
						//if(_item.EL_hasEntry(this.Const.EL_Armor.EL_Entry.Factor.EL_DamageBodyRegularReduction.ID)) { return false; }
						return true;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_fatigue_recover_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel <= 1) { return false; }
						return true;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_hitpoints_recover_daliy_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_hitpoints_recovery_rate_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_hitpoints_entry",
					function EL_ifEligible(_item) { return true; }
				},
				// {
				// 	Scripts = "scripts/skills/el_entrys/armor_entrys/el_melee_defense_entry",
				// 	function EL_ifEligible(_item) { return true; }
				// },
				// {
				// 	Scripts = "scripts/skills/el_entrys/armor_entrys/el_ranged_defense_entry",
				// 	function EL_ifEligible(_item) { return true; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_reduce_damage_received_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_reduce_direct_damage_received_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_reflect_entry",
					function EL_ifEligible(_item) { return true; }
				},
				// {
				// 	Scripts = "scripts/skills/el_entrys/armor_entrys/el_stamina_entry",
				// 	function EL_ifEligible(_item) { return true; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_stamina_modifier_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_value_mult_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel <= 1) { return false; }
						if(_item.m.Value == 0) { return false; }
						if(_item.isItemType(this.Const.Items.ItemType.Legendary)) { return false; }
						return true;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_beast_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_greenskin_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_northerner_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_north_noble_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_southerner_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_south_noble_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_special_defense_undead_entry",
					function EL_ifEligible(_item) { return true; }
				}
			],
		},
		EntryNum = {
			NormalArmor = [
				0,
				1,
				2,
				3,
				4
			],
			DecorativeArmor = [
				0,
				0.02,
				0.04,
				0.06,
				0.08,
			]
		},
		EntryStrengthenMult = 2.0,
		Factor = {
			EL_CombatLevel = {
				ID = "el_armor_entry.combat_level",
				BaseCombatLevel = 0.5,
				RandomMinCombatLevel = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxCombatLevel = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					0.6,
					0.7,
					0.8,
					0.9,
					1.0
				]
			},
			EL_ConditionMult = {
				ID = "el_armor_entry.condition_mult",
				BaseConditionMult = 5,
				RandomMinConditionMult = [
					1,
					1,
					101,
					201,
					500
				],
				RandomMaxConditionMult = [
					200,
					300,
					400,
					500,
					500
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				]
			},
			EL_ConditionRecoverDaliy = {
				ID = "el_armor_entry.condition_recover_daliy",
				BaseConditionRecoverDaliy = 10,
				RandomMinConditionRecoverDaliy = [
					1,
					1,
					201,
					401,
					1000
				],
				RandomMaxConditionRecoverDaliy = [
					400,
					600,
					800,
					1000,
					1000
				],
				ColourRange = [
					12,
					14,
					16,
					18,
					20
				]
			},
			EL_ConditionRecoverRate = {
				ID = "el_armor_entry.condition_recover_rate",
				BaseConditionRecoverRate = 1,
				RandomMinConditionRecoverRate = [
					1,
					1,
					21,
					41,
					100
				],
				RandomMaxConditionRecoverRate = [
					40,
					60,
					80,
					100,
					100
				],
				ColourRange = [
					1.2,
					1.4,
					1.6,
					1.8,
					2
				]
			},
			EL_DamageBodyArmorReduction = {
				ID = "el_armor_entry.damage_head_reduction",
				BaseDamageBodyArmorReduction = 25,
				RandomMinDamageBodyArmorReduction = [
					1,
					1,
					6,
					11,
					25
				],
				RandomMaxDamageBodyArmorReduction = [
					10,
					15,
					20,
					25,
					25
				],
				ColourRange = [
					3,
					3.5,
					4,
					4.5,
					5
				]
			}
			EL_DamageBodyRegularReduction = {
				ID = "el_armor_entry.damage_regular_reduction",
				BaseDamageBodyRegularReduction = 25,
				RandomMinDamageBodyRegularReduction = [
					1,
					1,
					6,
					11,
					25
				],
				RandomMaxDamageBodyRegularReduction = [
					10,
					15,
					20,
					25,
					25
				],
				ColourRange = [
					3,
					3.5,
					4,
					4.5,
					5
				]
			},
			EL_FatigueRecover = {
				ID = "el_armor_entry.fatigue_recover",
				FatigueRecover = 2
			},
			EL_Hitpoints = {
				ID = "el_armor_entry.hitpoints",
				BaseHitpoints = 10,
				RandomMinHitpoints = [
					1,
					1,
					201,
					401,
					1000
				],
				RandomMaxHitpoints = [
					400,
					600,
					800,
					1000,
					1000
				],
				ColourRange = [
					12,
					14,
					16,
					18,
					20
				]
			},
			EL_HitpointsRecoverDaliy = {
				ID = "el_armor_entry.hitpoints_recovery_daily",
				BaseHitpointsRecoverDaily = 10,
				RandomMinHitpointsRecoverDaily = [
					1,
					1,
					201,
					401,
					1000
				],
				RandomMaxHitpointsRecoverDaily = [
					400,
					600,
					800,
					1000,
					1000
				],
				ColourRange = [
					12,
					14,
					16,
					18,
					20
				]

			},
			EL_HitpointsRecoveryRate = {
				ID = "el_armor_entry.hitpoints_recovery_rate",
				BaseHitpointsRecoveryRate = 1,
				RandomMinHitpointsRecoveryRate = [
					1,
					1,
					21,
					41,
					100
				],
				RandomMaxHitpointsRecoveryRate = [
					40,
					60,
					80,
					100,
					100
				],
				ColourRange = [
					1.2,
					1.4,
					1.6,
					1.8,
					2
				]
			},
			EL_MeleeDefense = {
				ID = "el_armor_entry.melee_defense",
				BaseMeleeDefense = 5,
				RandomMinMeleeDefense = [
					1,
					1,
					2,
					3,
					5
				],
				RandomMaxMeleeDefense = [
					2,
					3,
					4,
					5,
					5
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				]
			},
			EL_RangedDefense = {
				ID = "el_armor_entry.ranged_defense",
				BaseRangedDefense = 5,
				RandomMinRangedDefense = [
					1,
					1,
					2,
					3,
					5
				],
				RandomMaxRangedDefense = [
					2,
					3,
					4,
					5,
					5
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				]
			},
			EL_Stamina = {
				ID = "el_armor_entry.stamina",
				BaseStamina = 10,
				RandomMinStamina = [
					1,
					1,
					3,
					5,
					10
				],
				RandomMaxStamina = [
					4,
					6,
					8,
					10,
					10
				],
				ColourRange = [
					12,
					14,
					16,
					18,
					20
				]
			},
			EL_ReduceDamageReceivedMult = {
				ID = "el_armor_entry.reduce_damage_received_mult",
				BaseReduceDamageReceivedMult = 5,
				RandomMinReduceDamageReceivedMult = [
					1,
					1,
					101,
					201,
					500
				],
				RandomMaxReduceDamageReceivedMult = [
					200,
					300,
					400,
					500,
					500
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				]
			},
			EL_ReduceDirectDamageReceivedMult = {
				ID = "el_armor_entry.reduce_direct_damage_received_mult",
				BaseReduceDirectDamageReceivedMult = 15,
				RandomMinReduceDirectDamageReceivedMult = [
					1,
					1,
					301,
					601,
					1500
				],
				RandomMaxReduceDirectDamageReceivedMult = [
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
			EL_Reflect = {
				ID = "el_armor_entry.reflect",
				BaseReflectPercent = 5,
				RandomMinReflectPercent = [
					1,
					1,
					101,
					201,
					500
				],
				RandomMaxReflectPercent = [
					200,
					300,
					400,
					500,
					500
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				]
			},
			EL_StaminaModifierMult = {
				ID = "el_armor_entry.stamina_modifier_mult",
				BaseStaminaModifierMult = 5,
				RandomMinStaminaModifierMult = [
					1,
					1,
					101,
					201,
					500
				],
				RandomMaxStaminaModifierMult = [
					200,
					300,
					400,
					500,
					500
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				]
			},
			EL_ValueMult = {
				ID = "el_armor_entry.value_mult"
			},
			EL_SpecialDefenseBeast = {
				ID = "el_armor_entry.special_defense_beast",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.Ghoul,
					this.Const.EntityType.Wolf,
					this.Const.EntityType.Wardog,
					this.Const.EntityType.ArmoredWardog,
					this.Const.EntityType.Direwolf,
					this.Const.EntityType.Lindwurm,
					this.Const.EntityType.Unhold,
					this.Const.EntityType.UnholdFrost,
					this.Const.EntityType.UnholdBog,
					this.Const.EntityType.Spider,
					this.Const.EntityType.SpiderEggs,
					this.Const.EntityType.Alp,
					this.Const.EntityType.Hexe,
					this.Const.EntityType.Schrat,
					this.Const.EntityType.SchratSmall,
					this.Const.EntityType.Kraken,
					this.Const.EntityType.KrakenTentacle,
					this.Const.EntityType.AlpShadow,
					this.Const.EntityType.BarbarianUnhold,
					this.Const.EntityType.BarbarianUnholdFrost,
					this.Const.EntityType.Warhound,
					this.Const.EntityType.TricksterGod,
					this.Const.EntityType.Serpent,
					this.Const.EntityType.SandGolem,
					this.Const.EntityType.Hyena,
					this.Const.EntityType.LegendCat,
					this.Const.EntityType.LegendWhiteDirewolf,
					this.Const.EntityType.LegendSkinGhoul,
					this.Const.EntityType.LegendStollwurm,
					this.Const.EntityType.LegendRockUnhold,
					this.Const.EntityType.LegendRedbackSpider,
					this.Const.EntityType.LegendDemonAlp,
					this.Const.EntityType.LegendHexeLeader,
					this.Const.EntityType.LegendGreenwoodSchrat,
					this.Const.EntityType.LegendGreenwoodSchratSmall,
					this.Const.EntityType.LegendWhiteWarwolf,
					this.Const.EntityType.LegendBear,
					this.Const.EntityType.LegendHorse
				]
			},
			EL_SpecialDefenseGreenskin = {
				ID = "el_armor_entry.special_defense_greenskin",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.OrcBerserker,
					this.Const.EntityType.OrcYoung,
					this.Const.EntityType.OrcWarrior,
					this.Const.EntityType.OrcWarlord,
					this.Const.EntityType.LegendOrcBehemoth,
					this.Const.EntityType.LegendOrcElite,
					this.Const.EntityType.GoblinFighter,
					this.Const.EntityType.GoblinAmbusher,
					this.Const.EntityType.GoblinLeader,
					this.Const.EntityType.GoblinShaman,
					this.Const.EntityType.GoblinWolfrider,
					this.Const.EntityType.KoboldWolfrider,
					this.Const.EntityType.KoboldFighter,
					this.Const.EntityType.GreenskinCatapult
				]
			},
			EL_SpecialDefenseNortherner = {
				ID = "el_armor_entry.special_defense_northerner",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.BanditThug,
					this.Const.EntityType.BanditPoacher,
					this.Const.EntityType.BanditMarksman,
					this.Const.EntityType.BanditRaider,
					this.Const.EntityType.BanditLeader,
					this.Const.EntityType.Swordmaster,
					this.Const.EntityType.HedgeKnight,
					this.Const.EntityType.MasterArcher,
					this.Const.EntityType.Cultist,
					this.Const.EntityType.Wildman,
					this.Const.EntityType.BarbarianThrall,
					this.Const.EntityType.BarbarianMarauder,
					this.Const.EntityType.BarbarianChampion,
					this.Const.EntityType.BarbarianDrummer,
					this.Const.EntityType.BarbarianBeastmaster,
					this.Const.EntityType.BarbarianChosen,
					this.Const.EntityType.BarbarianMadman,
					this.Const.EntityType.BanditRabble,
					this.Const.EntityType.BanditVeteran,
					this.Const.EntityType.BanditWarlord,
					this.Const.EntityType.BanditOutrider,
					this.Const.EntityType.BanditRabblePoacher,
					this.Const.EntityType.BanditVermes,
					this.Const.EntityType.Oathbringer,
				]
			},
			EL_SpecialDefenseNorthNoble = {
				ID = "el_armor_entry.special_defense_north_noble",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.Militia,
					this.Const.EntityType.MilitiaRanged,
					this.Const.EntityType.MilitiaVeteran,
					this.Const.EntityType.MilitiaCaptain,
					this.Const.EntityType.BountyHunter,
					this.Const.EntityType.Peasant,
					this.Const.EntityType.CaravanHand,
					this.Const.EntityType.CaravanGuard,
					this.Const.EntityType.Footman,
					this.Const.EntityType.Greatsword,
					this.Const.EntityType.Billman,
					this.Const.EntityType.Arbalester,
					this.Const.EntityType.StandardBearer,
					this.Const.EntityType.Sergeant,
					this.Const.EntityType.Knight,
					this.Const.EntityType.Mercenary,
					this.Const.EntityType.MercenaryRanged,
					this.Const.EntityType.Swordmaster,
					this.Const.EntityType.HedgeKnight,
					this.Const.EntityType.MasterArcher,
					this.Const.EntityType.LegendPeasantButcher,
					this.Const.EntityType.LegendPeasantBlacksmith,
					this.Const.EntityType.LegendPeasantMonk,
					this.Const.EntityType.LegendPeasantFarmhand,
					this.Const.EntityType.LegendPeasantMinstrel,
					this.Const.EntityType.LegendPeasantPoacher,
					this.Const.EntityType.LegendPeasantWoodsman,
					this.Const.EntityType.LegendPeasantMiner,
					this.Const.EntityType.LegendPeasantSquire,
					this.Const.EntityType.LegendPeasantWitchHunter,
					this.Const.EntityType.LegendHalberdier,
					this.Const.EntityType.LegendSlinger,
					this.Const.EntityType.LegendFencer,
					this.Const.EntityType.LegendCatapult,
					this.Const.EntityType.BanditRabblePoacher,
					this.Const.EntityType.BanditVermes,
					this.Const.EntityType.FreeCompanySpearman,
					this.Const.EntityType.FreeCompanySlayer,
					this.Const.EntityType.FreeCompanyFootman,
					this.Const.EntityType.FreeCompanyArcher,
					this.Const.EntityType.FreeCompanyCrossbow,
					this.Const.EntityType.FreeCompanyLongbow,
					this.Const.EntityType.FreeCompanyBillman,
					this.Const.EntityType.FreeCompanyPikeman,
					this.Const.EntityType.FreeCompanyInfantry,
					this.Const.EntityType.FreeCompanyLeader,
					this.Const.EntityType.FreeCompanyLeaderLow,
				]
			},
			EL_SpecialDefenseSoutherner = {
				ID = "el_armor_entry.special_defense_southerner",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.SatoManhunter,
					this.Const.EntityType.SatoManhunterVeteran,
					this.Const.EntityType.DesertStalker,
					this.Const.EntityType.Executioner,
					this.Const.EntityType.DesertDevil
				]
			},
			EL_SpecialDefenseSouthNoble = {
				ID = "el_armor_entry.special_defense_south_noble",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.Conscript,
					this.Const.EntityType.Gunner,
					this.Const.EntityType.Officer,
					this.Const.EntityType.Engineer,
					this.Const.EntityType.Assassin,
					this.Const.EntityType.Gladiator,
					this.Const.EntityType.PeasantSouthern,
					this.Const.EntityType.Mortar,
					this.Const.EntityType.Slave,
					this.Const.EntityType.NomadCutthroat,
					this.Const.EntityType.NomadOutlaw,
					this.Const.EntityType.NomadSlinger,
					this.Const.EntityType.NomadArcher,
					this.Const.EntityType.NomadLeader,
				]
			},
			EL_SpecialDefenseUndead = {
				ID = "el_armor_entry.special_defense_undead",
				BaseDamageBodyReduction = 50,
				RandomMinDamageBodyReduction = [
					1,
					1,
					11,
					21,
					50
				],
				RandomMaxDamageBodyReduction = [
					20,
					30,
					40,
					50,
					50
				],
				ColourRange = [
					6,
					7,
					8,
					9,
					10
				],
				ValidEntity = [
					this.Const.EntityType.Necromancer,
					this.Const.EntityType.Zombie,
					this.Const.EntityType.ZombieYeoman,
					this.Const.EntityType.ZombieKnight,
					this.Const.EntityType.ZombieBoss,
					this.Const.EntityType.SkeletonLight,
					this.Const.EntityType.SkeletonMedium,
					this.Const.EntityType.SkeletonHeavy,
					this.Const.EntityType.SkeletonPriest,
					this.Const.EntityType.SkeletonBoss,
					this.Const.EntityType.Vampire,
					this.Const.EntityType.Ghost,
					this.Const.EntityType.ZombieBetrayer,
					this.Const.EntityType.SkeletonLich,
					this.Const.EntityType.SkeletonLichMirrorImage,
					this.Const.EntityType.SkeletonPhylactery,
					this.Const.EntityType.ZombieTreasureHunter,
					this.Const.EntityType.FlyingSkull,
					this.Const.EntityType.LegendBanshee,
					this.Const.EntityType.LegendDemonHound,
					this.Const.EntityType.LegendVampireLord,
					this.Const.EntityType.SkeletonGladiator,
					this.Const.EntityType.LegendMummyLight,
					this.Const.EntityType.LegendMummyMedium,
					this.Const.EntityType.LegendMummyHeavy,
					this.Const.EntityType.LegendMummyQueen,
					this.Const.EntityType.LegendMummyPriest
				]
			}
		}
	},
	function EL_assignItemEntrys( _item, _entryNum ) {
		local blocked_num = _item.EL_getBlockedSlotNum() + 1;
		local index_pool = [];
		for(local i = 0; i < this.Const.EL_Armor.EL_Entry.Pool.Entrys.len(); ++i) {
				if(this.Const.EL_Armor.EL_Entry.Pool.Entrys[i].EL_ifEligible(_item)) {
				index_pool.push(i);
			}
		}
		while(_item.m.EL_EntryList.len() < _entryNum && index_pool.len() != 0)
		{
			local r = this.Math.rand(0, index_pool.len() - 1);
			local entry = this.new(this.Const.EL_Armor.EL_Entry.Pool.Entrys[index_pool[r]].Scripts);
			index_pool.remove(r);
			if(!_item.EL_hasEntry(entry.getID()))
			{
				entry.EL_setStrengthLevel(blocked_num);
				_item.EL_addEntryToList(entry);
			}
		}
	}
};