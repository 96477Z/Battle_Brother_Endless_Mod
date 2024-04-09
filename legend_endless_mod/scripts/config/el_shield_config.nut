local gt = this.getroottable();

if (!("EL_Shield" in gt.Const))
{
	gt.Const.EL_Shield <- {};
}

gt.Const.EL_Shield <- {
	MinDamageReceived = 8,
	EL_RankValue = [
		1,
		2,
		5,
		12,
		25
	]
	EL_RankFactor = {
		MeleeDefenseMult = 1.1,
		MeleeDefenseMultHalf = 1.0488,
		RangedDefenseMult = 1.1,
		RangedDefenseMultHalf = 1.0488,
		FatigueOnSkillUse = 2,
		StaminaModifierMult = 0.85,
		StaminaModifierMultHalf = 0.92195,
		ConditionMult = 1.5,
		ConditionMultHalf = 1.224744,
		DamageShieldReduction = 8
	},
	EL_LevelFactor = {
		Condition = 0.08,
		Value = 0.08,
		MeleeDefense = 0.01,
		RangedDefense = 0.01,
		StaminaModifier = 0.04,
		DamageShieldReduction = 0.08
	},
	EL_EquipmentEssence = {
		LevelFactor = 0.08,
		RankFactor = 3,
		UpgradeLevelFactor = [
			2.4,
			2.7,
			2.7,
			3.0
		],
		UpgradeRankFactor = [
			2.4,
			2.7,
			2.7,
			3.0
		],
		UpgradeRankNormalEssenceFactor = 10,
		DisassembleFactor = [
			3.0,
			2.7,
			2.7,
			2.4
		],
		RecraftFactor = [
			2.4,
			2.7,
			2.7,
			3.0
		],
		SeniorEquipmentEssenceMult = 0.1,
		LowerEquipmentEssenceMult = 3,
		StrengthenEntryNum = 3,
		UpgradeRankLegendaryNum = 3,
		MinCalculateWeight = -1
	},
	EL_RankPropertiesInitFunctions = [
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Shield.EL_RankFactor.MeleeDefenseMultHalf : this.Const.EL_Shield.EL_RankFactor.MeleeDefenseMult;
				_item.m.EL_BaseWithRankMeleeDefense = this.Math.ceil(_item.m.EL_BaseWithRankMeleeDefense * bonus);
				_item.m.EL_BaseWithRankRangedDefense = this.Math.ceil(_item.m.EL_BaseWithRankRangedDefense * bonus);
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Shield.EL_RankFactor.FatigueOnSkillUse / 2 : this.Const.EL_Shield.EL_RankFactor.FatigueOnSkillUse;
				_item.m.FatigueOnSkillUse -= bonus;
				_item.m.EL_BaseWithRankFatigueOnSkillUse = _item.m.FatigueOnSkillUse;
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Shield.EL_RankFactor.ConditionMultHalf : this.Const.EL_Shield.EL_RankFactor.ConditionMult;
				_item.m.EL_BaseWithRankConditionMax = this.Math.ceil(_item.m.EL_BaseWithRankConditionMax * bonus);
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Shield.EL_RankFactor.StaminaModifierMultHalf : this.Const.EL_Shield.EL_RankFactor.StaminaModifierMult;
				_item.m.EL_BaseWithRankStaminaModifier = _item.m.EL_BaseWithRankStaminaModifier * bonus;
			},
			weight = 1
		},
		{
			ifUsable = function( _item ) { return true; },
			changeValues = function( _item, _isHalfEffect = false )
			{
				local bonus = _isHalfEffect ? this.Const.EL_Shield.EL_RankFactor.DamageShieldReduction / 2 : this.Const.EL_Shield.EL_RankFactor.DamageShieldReduction;
				_item.m.EL_BaseWithRankDamageShieldReduction += bonus;
			},
			weight = 1
		}
	],
	function EL_updateRankLevelProperties( _item ) {
		_item.m.EL_BaseWithRankValue = _item.m.EL_BaseNoRankValue * gt.Const.EL_Shield.EL_RankValue[_item.m.EL_RankLevel];
		if(_item.m.EL_RankLevel == this.Const.EL_Item.Type.Fine)
		{
			foreach	(func in gt.Const.EL_Shield.EL_RankPropertiesInitFunctions)
			{
				if(func.ifUsable(_item))
				{
					func.changeValues(_item, true);
				}
			}
		}
		for(local index = this.Const.EL_Item.Type.Fine; index < _item.m.EL_RankLevel; ++index)
		{
			foreach	(func in gt.Const.EL_Shield.EL_RankPropertiesInitFunctions)
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
			foreach	(func in gt.Const.EL_Shield.EL_RankPropertiesInitFunctions)
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
		EL_BaseFactor =  0.5,
		Pool = {
			Entrys = [
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_action_point_entry",
					function EL_ifEligible(_item) 
					{ 
						if(_item.m.EL_RankLevel > 1)
						{
							return true;
						} 
						return false;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_combat_level_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_condition_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_condition_recover_daliy_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_condition_recover_rate_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_damage_shield_reduction_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_fatigue_recover_entry",
					function EL_ifEligible(_item) {
						if(_item.m.EL_RankLevel <= 1) { return false; }
						return true;
					}
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_hitpoints_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_hitpoints_recover_daliy_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_hitpoints_recovery_rate_entry",
					function EL_ifEligible(_item) { return true; }
				},
				// {
				// 	Scripts = "scripts/skills/el_entrys/shield_entrys/el_melee_defense_entry",
				// 	function EL_ifEligible(_item) { return true; }
				// },
				// {
				// 	Scripts = "scripts/skills/el_entrys/shield_entrys/el_ranged_defense_entry",
				// 	function EL_ifEligible(_item) { return true; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_shield_double_defense_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_shield_melee_defense_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_shield_ranged_defense_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_shield_reduce_damage_received_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				// {
				// 	Scripts = "scripts/skills/el_entrys/shield_entrys/el_stamina_entry",
				// 	function EL_ifEligible(_item) { return true; }
				// },
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_stamina_modifier_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_taunt_mult_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_use_skill_fatigue_entry",
					function EL_ifEligible(_item) { return true; }
				},
				{
					Scripts = "scripts/skills/el_entrys/shield_entrys/el_value_mult_entry",
					function EL_ifEligible(_item) 
					{ 
						if(_item.m.EL_RankLevel > 1 && _item.m.Value != 0 && !_item.isItemType(this.Const.Items.ItemType.Legendary))
						{
							return true;
						} 						
						return false;
					}
				}
			],
		},
		EntryNum = {
			NormalShield = [
				0,
				1,
				2,
				3,
				4
			]
		},
		EntryStrengthenMult = 2.0,
		Factor = {
			EL_ActionPoint = {
				ID = "el_shield_entry.action_point",
				ActionPoint = 2
			},
			EL_CombatLevel = {
				ID = "el_shield_entry.combat_level",
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
			EL_ConditionMult = {
				ID = "el_shield_entry.condition_mult",
				BaseConditionMult = 25,
				RandomMinConditionMult = [
					1,
					1,
					501,
					1001,
					2500
				],
				RandomMaxConditionMult = [
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
			},
			EL_ConditionRecoverDaliy = {
				ID = "el_shield_entry.condition_recover_daliy",
				BaseConditionRecoverDaliy = 30,
				RandomMinConditionRecoverDaliy = [
					1,
					1,
					1201,
					1801,
					3000
				],
				RandomMaxConditionRecoverDaliy = [
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
			EL_ConditionRecoverRate = {
				ID = "el_shield_entry.condition_recover_rate",
				BaseConditionRecoverRate = 3,
				RandomMinConditionRecoverRate = [
					1,
					1,
					61,
					121,
					300
				],
				RandomMaxConditionRecoverRate = [
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
			EL_DamageShieldReduction = {
				ID = "el_shield_entry.damage_shield_reduction",
				BaseDamageShieldReduction = 4,
				RandomMinDamageShieldReduction = [
					1,
					1,
					9,
					17,
					40
				],
				RandomMaxDamageShieldReduction = [
					16,
					24,
					32,
					40,
					40
				],
				ColourRange = [
					4.8,
					5.6,
					6.4,
					7.2,
					8
				]
			}
			EL_FatigueRecover = {
				ID = "el_shield_entry.fatigue_recover",
				FatigueRecover = 6
			},
			EL_Hitpoints = {
				ID = "el_shield_entry.hitpoints",
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
				ID = "el_shield_entry.hitpoints_recovery_daily",
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
				ID = "el_shield_entry.hitpoints_recovery_rate",
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
			EL_MeleeDefense = {
				ID = "el_shield_entry.melee_defense",
				BaseMeleeDefense = 15,
				RandomMinMeleeDefense = [
					1,
					1,
					4,
					7,
					15
				],
				RandomMaxMeleeDefense = [
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
			EL_RangedDefense = {
				ID = "el_shield_entry.ranged_defense",
				BaseRangedDefense = 15,
				RandomMinRangedDefense = [
					1,
					1,
					4,
					7,
					15
				],
				RandomMaxRangedDefense = [
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
			EL_ShieldDoubleDefense = {
				ID = "el_shield_entry.shield_double_defense",
				BaseShieldDoubleDefense = 6,
				RandomMinShieldDoubleDefense = [
					1,
					1,
					3,
					5,
					10
				],
				RandomMaxShieldDoubleDefense = [
					4,
					6,
					8,
					10,
					10
				],
				ColourRange = [
					8,
					10,
					12,
					14,
					16
				]
			},
			EL_ShieldMeleeDefense = {
				ID = "el_shield_entry.shield_melee_defense",
				BaseShieldMeleeDefense = 10,
				RandomMinShieldMeleeDefense = [
					1,
					1,
					3,
					5,
					10
				],
				RandomMaxShieldMeleeDefense = [
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
			EL_ShieldRangedDefense = {
				ID = "el_shield_entry.shield_ranged_defense",
				BaseShieldRangedDefense = 10,
				RandomMinShieldRangedDefense = [
					1,
					1,
					3,
					5,
					10
				],
				RandomMaxShieldRangedDefense = [
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
			EL_ShieldDamageReceivedMult = {
				ID = "el_shield_entry.shield_reduce_damage_received_mult",
				BaseShieldDamageReceivedMult = 25,
				RandomMinShieldDamageReceivedMult = [
					1,
					1,
					501,
					1001,
					2500
				],
				RandomMaxShieldDamageReceivedMult = [
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
			},
			EL_Stamina = {
				ID = "el_shield_entry.stamina",
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
			EL_StaminaModifierMult = {
				ID = "el_shield_entry.stamina_modifier_mult",
				BaseStaminaModifierMult = 15,
				RandomMinStaminaModifierMult = [
					1,
					1,
					301,
					601,
					1500
				],
				RandomMaxStaminaModifierMult = [
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
			EL_TauntMult = {
				ID = "el_shield_entry.taunt_mult",
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
			},
			EL_UseSkillfatigue = {
				ID = "el_shield_entry.use_skill_fatigue",
				BaseUseSkillfatigue = 1,
				RandomMinUseSkillfatigue = [
					1,
					1,
					2,
					2,
					3
				],
				RandomMaxUseSkillfatigue = [
					1,
					2,
					2,
					3,
					3
				],
				ColourRange = [
					2,
					2,
					3,
					3,
					4
				]
			},
			EL_ValueMult = {
				ID = "el_shield_entry.value_mult"
			}
		}
	},
	function EL_assignItemEntrys( _item, _entryNum ) {
		local index_pool = [];
		for(local i = 0; i < this.Const.EL_Shield.EL_Entry.Pool.Entrys.len(); ++i) {
				if(this.Const.EL_Shield.EL_Entry.Pool.Entrys[i].EL_ifEligible(_item)) {
				index_pool.push(i);
			}
		}
		while(_item.m.EL_EntryList.len() < _entryNum && index_pool.len() != 0)
		{
			local r = this.Math.rand(0, index_pool.len() - 1);
			local entry = this.new(this.Const.EL_Shield.EL_Entry.Pool.Entrys[index_pool[r]].Scripts);
			index_pool.remove(r);
			if(!_item.EL_hasEntry(entry.getID()))
			{
				_item.EL_addEntryToList(entry);
			}
		}
	}
};