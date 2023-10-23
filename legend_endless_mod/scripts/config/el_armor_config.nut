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
		DamageRegularReduction = 2,
		DamageBodyArmorReduction = 4
	},
	EL_LevelFactor = {
		Condition = 0.04,
		Value = 0.04,
		StaminaModifier = 0.04,
		DamageRegularReduction = 0.04,
		DamageBodyArmorReduction = 0.04
	},
	EL_EquipmentEssence = {
		LevelFactor = 0.04,
		RankFactor = 3,
		UpgradeLevelFactor = 1,
		UpgradeRankFactor = 1,
		DisassembleFactor = 0.8,
		RecraftFactor = 1,
		SeniorEquipmentEssenceMult = 0.1,
		StrengthenEntryNum = 1,
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
				_item.m.EL_BaseWithRankStaminaModifier = this.Math.floor(_item.m.EL_BaseWithRankStaminaModifier * bonus);
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Math.floor(this.Const.EL_Armor.EL_RankFactor.DamageRegularReduction / 2) : this.Const.EL_Armor.EL_RankFactor.DamageRegularReduction;
				switch (_item.EL_getArmorType())
				{
					case this.Const.EL_Item.ArmorType.UnlayeredArmor:
						bonus *= 5;
						break;
					case this.Const.EL_Item.ArmorType.BaseArmor:
						break;
					case this.Const.EL_Item.ArmorType.ArmorUpgrade:
						break;
				}
				_item.m.EL_BaseWithRankDamageRegularReduction += bonus;
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Math.floor(this.Const.EL_Armor.EL_RankFactor.DamageBodyArmorReduction / 2) : this.Const.EL_Armor.EL_RankFactor.DamageBodyArmorReduction;
				switch (_item.EL_getArmorType())
				{
					case this.Const.EL_Item.ArmorType.UnlayeredArmor:
						bonus *= 5;
						break;
					case this.Const.EL_Item.ArmorType.BaseArmor:
						break;
					case this.Const.EL_Item.ArmorType.ArmorUpgrade:
						break;
				}
				_item.m.EL_BaseWithRankDamageBodyArmorReduction += bonus;
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
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_damage_regular_reduction_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_fatigue_recover_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel <= 1) { return false; }
						return true;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_hitpoints_recovery_rate_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_hitpoints_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_melee_defense_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_ranged_defense_entry",
					function EL_ifEligible(_item) { return true; }
				},
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
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_stamina_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_stamina_modifier_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/armor_entrys/el_value_mult_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel <= 1) { return false; }
						return true;
					}
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
				0.01,
				0.02,
				0.03,
				0.04,
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
				BaseDamageBodyArmorReduction = 2,
				RandomMinDamageBodyArmorReduction = [
					1,
					1,
					5,
					9,
					20
				],
				RandomMaxDamageBodyArmorReduction = [
					8,
					12,
					16,
					20,
					20
				],
				ColourRange = [
					2.4,
					2.8,
					3.2,
					3.6,
					4
				]
			}
			EL_DamageRegularReduction = {
				ID = "el_armor_entry.damage_regular_reduction",
				BaseDamageRegularReduction = 1,
				RandomMinDamageRegularReduction = [
					1,
					1,
					3,
					5,
					10
				],
				RandomMaxDamageRegularReduction = [
					4,
					6,
					8,
					10,
					10
				],
				ColourRange = [
					1.2,
					1.4,
					1.6,
					1.8,
					2
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
			EL_ReduceDirectDamageReceivedMult = {
				ID = "el_armor_entry.reduce_direct_damage_received_mult",
				BaseReduceDirectDamageReceivedMult = 5,
				RandomMinReduceDirectDamageReceivedMult = [
					1,
					1,
					101,
					201,
					500
				],
				RandomMaxReduceDirectDamageReceivedMult = [
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
			}
		}
	},
	function EL_assignItemEntrys( _item, _entryNum ) {
		local blocked_num = _item.EL_getBlockedSlotNum();
		for(local index = 0; index <= blocked_num; ++index)
		{
			local index_pool = [];
			for(local i = 0; i < this.Const.EL_Armor.EL_Entry.Pool.Entrys.len(); ++i) {
					if(this.Const.EL_Armor.EL_Entry.Pool.Entrys[i].EL_ifEligible(_item)) {
					index_pool.push(i);
				}
			}
			while(_item.m.EL_EntryList.len() < _entryNum && index_pool.len() != 0)
			{
				local r = this.Math.rand(0, index_pool.len() - 1);
				_item.EL_addEntryToList(this.new(this.Const.EL_Armor.EL_Entry.Pool.Entrys[index_pool[r]].Scripts));
				index_pool.remove(r);
			}
			_entryNum += this.Const.EL_Armor.EL_Entry.EntryNum.NormalArmor[_item.m.EL_RankLevel];
		}
	}
};