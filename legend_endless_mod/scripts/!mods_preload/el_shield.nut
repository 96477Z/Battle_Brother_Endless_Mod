local gt = getroottable();

::mods_registerMod("el_shield", 1, "el_shield");
::mods_queue(null, "el_item", function ()
{
    ::mods_hookExactClass("items/shields/shield", function ( o )
	{
		o.m.EL_BaseNoRankMeleeDefense <- 0;
		o.m.EL_BaseNoRankRangedDefense <- 0;
		o.m.EL_BaseNoRankStaminaModifier <- 0;
        o.m.EL_BaseWithRankMeleeDefense <- 0;
		o.m.EL_BaseWithRankRangedDefense <- 0;
		o.m.EL_BaseWithRankStaminaModifier <- 0.0;
		o.m.EL_BaseNoRankFatigueOnSkillUse <- 0;
		o.m.EL_BaseWithRankFatigueOnSkillUse <- 0;
		o.m.EL_DamageShieldReduction <- 0;
		o.m.EL_BaseWithRankDamageShieldReduction <- 0;

		local getTooltip = o.getTooltip;
		o.getTooltip = function ()
		{
			local result = getTooltip();
			if(this.m.EL_RankLevel == 0)
			{
				result[0] = {
					id = 1,
					type = "title",
					text = this.getName()
				};
			}
			else
			{
				result[0] = {
					id = 1,
					type = "title",
					text = "[color=" + this.Const.EL_Item.Colour[this.m.EL_RankLevel] +"]" + this.getName() + "[/color]"
				};
			}
			result.insert(4, {
				id = 22,
				type = "text",
				text = "等阶: " + this.m.EL_RankLevel + "/" + this.EL_getRankLevelMax()
			});
			if(this.m.EL_CurrentLevel < this.m.EL_Level)
			{
				result.insert(5, {
					id = 23,
					type = "text",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]等级: " + this.m.EL_CurrentLevel + "/" + this.m.EL_Level + "[/color]"
				});
			}
			else
			{
				result.insert(5, {
					id = 23,
					type = "text",
					text = "等级: " + this.m.EL_Level
				});
			}
			result.insert(9, {
				id = 25,
				type = "text",
				text = "装备者仅承受" + this.Math.round(1 / (1.0 + this.m.MeleeDefense * 0.01 + this.m.RangedDefense * 0.01) * 10000) * 0.01 + "%伤害"
			});
			if(this.m.EL_DamageShieldReduction)
			{
				result.insert(9, {
					id = 24,
					type = "text",
					icon = "ui/icons/sturdiness.png",
					text = "盾牌固定减伤: " + this.m.EL_DamageShieldReduction
				});
			}
			if (this.m.EL_EntryList.len() != 0)
			{
				result.push({
					id = 60,
					type = "text",
					text = "——————————————"
				});
				local tool_tip_id = 61;
				foreach(entry in this.m.EL_EntryList)
				{
					local tool_tip = entry.getTooltip(tool_tip_id);
					if(tool_tip != null)
					{
						result.push(tool_tip);
						++tool_tip_id;
					}
				}
			}
			for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].id == 5 && result[i].icon == "ui/icons/melee_defense.png") 
				{
					result[i] = {
						id = 5,
						type = "text",
						icon = "ui/icons/melee_defense.png",
						text = "Melee Defense [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.MeleeDefense + "[/color] (" + this.m.EL_BaseNoRankMeleeDefense + ")"
					};
				}
				else if(result[i].id == 6 && result[i].icon == "ui/icons/ranged_defense.png")
				{
					result[i] = {
						id = 6,
						type = "text",
						icon = "ui/icons/ranged_defense.png",
						text = "Ranged Defense [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.RangedDefense + "[/color] (" + this.m.EL_BaseNoRankRangedDefense + ")"
					};
				}
				else if(result[i].id == 7 && result[i].icon == "ui/icons/fatigue.png")
				{
					result[i] = {
						id = 7,
						type = "text",
						icon = "ui/icons/fatigue.png",
						text = "Maximum Fatigue [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.StaminaModifier + "[/color] (" + this.m.EL_BaseNoRankStaminaModifier + ")"
					};
					break;
				}
			}
			if(this.m.EL_CurrentLevel < this.m.EL_Level)
			{
				result.push({
					id = 75,
					type = "text",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]当前人物的战斗等级无法发挥装备全部性能。[/color]"
				});
			}
			return result;
		}

		local onUpdateProperties = o.onUpdateProperties;
		o.onUpdateProperties = function ( _properties )
		{
			if (this.m.Condition == 0)
			{
				return;
			}
			local mult = 1.0;
			if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInShields)
			{
				mult = 1.25;
			}
			_properties.MeleeDefense += this.Math.floor(this.m.MeleeDefense * mult);
			_properties.RangedDefense += this.Math.floor(this.m.RangedDefense * mult);
			local staminaMult = this.getContainer().getActor().getSkills().hasSkill("perk.brawny") ? 0.7 : 1.0;
			_properties.Stamina += this.Math.floor(this.m.StaminaModifier * staminaMult);
		}

		local onEquip = o.onEquip;
		o.onEquip = function ()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/el_items/el_item_level_check_skill"));
			this.addSkill(this.new("scripts/skills/el_items/el_shield_reduce_damage_received_mult"));
            foreach(entry in this.m.EL_EntryList)
			{
				this.EL_addEntry(entry);
			}
		}

		local onUnequip = o.onUnequip;
		o.onUnequip = function ()
		{
			onUnequip();
			this.m.EL_CurrentLevel = this.m.EL_Level;
			EL_updateLevelProperties();
		}

        local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			onSerialize(_out);
			_out.writeI32(this.m.FatigueOnSkillUse);
			_out.writeI32(this.m.EL_BaseNoRankFatigueOnSkillUse);
			_out.writeI32(this.m.EL_BaseWithRankFatigueOnSkillUse);

			_out.writeI32(this.m.EL_BaseNoRankMeleeDefense);
			_out.writeI32(this.m.EL_BaseNoRankRangedDefense);
			_out.writeI32(this.m.EL_BaseNoRankStaminaModifier);
			_out.writeI32(this.m.EL_BaseWithRankMeleeDefense);
			_out.writeI32(this.m.EL_BaseWithRankRangedDefense);
			_out.writeF32(this.m.EL_BaseWithRankStaminaModifier);
			_out.writeI32(this.m.EL_DamageShieldReduction);
			_out.writeI32(this.m.EL_BaseWithRankDamageShieldReduction);
			_out.writeF32(this.m.Condition);
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize(_in);
			this.m.FatigueOnSkillUse = _in.readI32();
			this.m.EL_BaseNoRankFatigueOnSkillUse = _in.readI32();
			this.m.EL_BaseWithRankFatigueOnSkillUse = _in.readI32();

			this.m.EL_BaseNoRankMeleeDefense = _in.readI32();
			this.m.EL_BaseNoRankRangedDefense = _in.readI32();
			this.m.EL_BaseNoRankStaminaModifier = _in.readI32();
            this.m.EL_BaseWithRankMeleeDefense = _in.readI32();
			this.m.EL_BaseWithRankRangedDefense = _in.readI32();
			this.m.EL_BaseWithRankStaminaModifier = _in.readF32();
			this.m.EL_DamageShieldReduction = _in.readI32();
			this.m.EL_BaseWithRankDamageShieldReduction = _in.readI32();
			if(this.m.EL_Level != -1)
			{
				this.m.ConditionMax = this.Math.ceil(this.m.EL_BaseWithRankConditionMax * (1 + this.Const.EL_Armor.EL_LevelFactor.Condition * this.m.EL_CurrentLevel));
			}
            this.m.Condition = _in.readF32();
		}

		local applyShieldDamage = o.applyShieldDamage;
		o.applyShieldDamage = function ( _damage, _playHitSound = true )
		{
			if(this.getCondition() == 0)
			{
				return;
			}
			local container = this.getContainer();
			if(container == null)
			{
				return;
			}
			local skill = container.getActor().getSkills().getSkillByID("el_rarity_entry.faith_of_the_rock");
			if(skill != null && skill.EL_isUsable())
			{
				return;
			}
			applyShieldDamage(_damage, _playHitSound);
		}

		o.isAmountShown = function()
		{
			return true;
		}

		o.getAmountString = function()
		{
			this.Const.EL_Item_Other.EL_otherItemInit(this);
			if(this.m.Condition < this.m.ConditionMax)
			{
				return "lv" + this.m.EL_Level + ":" + this.Math.floor(this.m.Condition / (this.m.ConditionMax * 1.0) * 100) + "%";
			}
			return "lv" + this.m.EL_Level;
		}

		o.getAmountColor = function()
		{
			return this.Const.EL_Item.Colour[this.m.EL_RankLevel];
		}

		o.EL_getBaseNoRankStaminaModifier <- function()
        {
			return this.m.EL_BaseNoRankStaminaModifier;
        }
		o.EL_setBaseNoRankStaminaModifier <- function( _EL_baseNoRankStaminaModifier )
        {
			this.m.EL_BaseNoRankStaminaModifier = _EL_baseNoRankStaminaModifier;
        }
		o.EL_getBaseWithRankStaminaModifier <- function()
        {
			return this.m.EL_BaseWithRankStaminaModifier;
        }
		o.EL_setBaseWithRankStaminaModifier <- function( _EL_baseWithRankStaminaModifier )
        {
			this.m.EL_BaseWithRankStaminaModifier = _EL_baseWithRankStaminaModifier;
        }
		o.EL_getDamageShieldReduction <- function()
        {
			return this.m.EL_DamageShieldReduction;
        }
		o.EL_setDamageShieldReduction <- function( _EL_damageShieldReduction )
        {
			this.m.EL_DamageShieldReduction = _EL_damageShieldReduction;
        }
		o.EL_getBaseWithRankDamageShieldReduction <- function()
        {
			return this.m.EL_BaseWithRankDamageShieldReduction;
        }
		o.EL_setBaseWithRankDamageShieldReduction <- function( _EL_baseWithRankDamageShieldReduction )
        {
			this.m.EL_BaseWithRankDamageShieldReduction = _EL_baseWithRankDamageShieldReduction;
        }
		o.EL_getLevelAddtionStaminaModifier <- function()
		{
			//local stamina_mult = this.getContainer().getActor().getSkills().hasSkill("perk.brawny") ? 0.7 : 1.0;
			return this.m.StaminaModifier - this.m.EL_BaseWithRankStaminaModifier;// * stamina_mult
		}
		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Normal;
		}

        o.EL_generateByRankAndLevel <- function( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
        {
			local percent = (this.m.Condition * 1.0)/ this.m.ConditionMax;
			if(this.m.EL_Level == -1)
			{
				this.m.EL_RankLevel = this.Math.min(this.m.EL_RankLevel + _EL_rankLevel, this.EL_getRankLevelMax());
				this.m.EL_Level = this.Math.min(EL_getLevelMax(), EL_level);
				EL_recordBaseNoRankProperties();
				this.Const.EL_Shield.EL_updateRankLevelProperties(this);
				this.Const.EL_Shield.EL_assignItemEntrys(this, this.Const.EL_Shield.EL_Entry.EntryNum.NormalShield[this.m.EL_RankLevel]);
			}
			this.m.EL_CurrentLevel = this.m.EL_Level;
			EL_updateLevelProperties();
			this.m.Condition = this.m.ConditionMax * percent;
        }

		o.EL_addRankLevel <- function()
		{
			if(EL_getRankLevel() < this.Const.EL_Item.Type.Legendary)
			{
				++this.m.EL_RankLevel;
				EL_init();
				foreach(entry in this.m.EL_EntryList)
				{
					entry.EL_onUpgradeRank();
				}
				this.Const.EL_Shield.EL_updateRankLevelProperties(this);
				this.Const.EL_Shield.EL_assignItemEntrys(this, this.Const.EL_Shield.EL_Entry.EntryNum.NormalShield[this.m.EL_RankLevel]);
				this.setCondition(this.getConditionMax());
			}
		}

        o.EL_upgradeLevel <- function()
        {
			if(this.m.EL_Level < EL_getLevelMax())
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				this.m.EL_Level += 1;
				this.m.EL_CurrentLevel = this.m.EL_Level;
				EL_updateLevelProperties();
			}
        }

        o.EL_upgradeRank <- function()
        {
			if(EL_getRankLevel() < EL_getRankLevelMax())
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				++this.m.EL_RankLevel;
				EL_init();
				foreach(entry in this.m.EL_EntryList)
				{
					entry.EL_onUpgradeRank();
				}
				this.Const.EL_Shield.EL_updateRankLevelProperties(this);
				this.Const.EL_Shield.EL_assignItemEntrys(this, this.Const.EL_Shield.EL_Entry.EntryNum.NormalShield[this.m.EL_RankLevel]);
			}
			else if(this.m.EL_StrengthenEntryNum < this.m.EL_EntryList.len())
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				++this.m.EL_StrengthenEntryNum;
			}
			EL_updateLevelProperties();
        }

		o.EL_disassemble <- function(_itemIndex)
		{
			this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
			local stash = this.World.Assets.getStash();
			stash.remove(this);
		}

		o.EL_recraft <- function()
        {
			if(this.m.EL_RankLevel && this.m.EL_Level != -1)
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				EL_init();
				this.m.EL_EntryList.clear();
				this.m.EL_RankPropertiesImproveIndex.clear();
				this.Const.EL_Shield.EL_updateRankLevelProperties(this);
				this.Const.EL_Shield.EL_assignItemEntrys(this, this.Const.EL_Shield.EL_Entry.EntryNum.NormalShield[this.m.EL_RankLevel]);				
				EL_updateLevelProperties();
			}
        }

		o.EL_updateLevelProperties <- function()
        {
			this.m.ConditionMax = this.Math.ceil(this.m.EL_BaseWithRankConditionMax * (1 + this.Const.EL_Shield.EL_LevelFactor.Condition * this.m.EL_CurrentLevel));
			this.m.MeleeDefense = this.Math.ceil(this.m.EL_BaseWithRankMeleeDefense * (1 + this.Const.EL_Shield.EL_LevelFactor.MeleeDefense * this.m.EL_CurrentLevel));
			this.m.RangedDefense = this.Math.ceil(this.m.EL_BaseWithRankRangedDefense * (1 + this.Const.EL_Shield.EL_LevelFactor.RangedDefense * this.m.EL_CurrentLevel));
			this.m.EL_DamageShieldReduction = this.Math.ceil(this.m.EL_BaseWithRankDamageShieldReduction * (1 + this.Const.EL_Shield.EL_LevelFactor.DamageShieldReduction * this.m.EL_CurrentLevel));
			this.m.Value = this.Math.ceil(this.m.EL_BaseWithRankValue * (1 + this.Const.EL_Shield.EL_LevelFactor.Value * this.m.EL_Level));
			this.m.StaminaModifier = this.Math.floor(this.m.EL_BaseWithRankStaminaModifier * (1 + this.Const.EL_Shield.EL_LevelFactor.StaminaModifier * this.m.EL_Level));
			if(this.m.EL_EntryList.len() != 0)
			{
				for( local index = 0; index < this.m.EL_StrengthenEntryNum && index < this.m.EL_EntryList.len(); ++index )
				{
					this.m.EL_EntryList[index].EL_strengthen();
				}
				foreach(entry in this.m.EL_EntryList)
				{
					entry.EL_onItemUpdate(this);
				}
			}
			this.m.Condition = this.m.Condition > this.m.ConditionMax ? this.m.ConditionMax : this.m.Condition;
		}

        o.EL_isValid <- function()
		{
			return true;
		}

        o.EL_init <- function()
	    {
			this.m.FatigueOnSkillUse = this.m.EL_BaseNoRankFatigueOnSkillUse;
			this.m.EL_BaseWithRankMeleeDefense = this.m.EL_BaseNoRankMeleeDefense;
			this.m.EL_BaseWithRankRangedDefense = this.m.EL_BaseNoRankRangedDefense;
			this.m.EL_BaseWithRankStaminaModifier = this.m.EL_BaseNoRankStaminaModifier;
			this.m.EL_BaseWithRankConditionMax = this.m.EL_BaseNoRankConditionMax;
			this.m.EL_BaseWithRankValue = this.m.EL_BaseNoRankValue;
			this.m.EL_BaseWithRankDamageShieldReduction = 0;
        }

		o.EL_recordBaseNoRankProperties <- function()
		{
			this.m.EL_BaseNoRankFatigueOnSkillUse = this.m.FatigueOnSkillUse;
			this.m.EL_BaseWithRankFatigueOnSkillUse = this.m.FatigueOnSkillUse;
			this.m.EL_BaseNoRankConditionMax = this.m.ConditionMax;
		    this.m.EL_BaseNoRankValue = this.m.Value;
			this.m.EL_BaseNoRankMeleeDefense = this.m.MeleeDefense;
			this.m.EL_BaseNoRankRangedDefense = this.m.RangedDefense;
		    this.m.EL_BaseNoRankStaminaModifier = this.m.StaminaModifier;
			this.m.EL_BaseWithRankConditionMax = this.m.ConditionMax;
			this.m.EL_BaseWithRankValue = this.m.Value;
			this.m.EL_BaseWithRankMeleeDefense = this.m.MeleeDefense;
			this.m.EL_BaseWithRankRangedDefense = this.m.RangedDefense;
		    this.m.EL_BaseWithRankStaminaModifier = this.m.StaminaModifier;
		}

		o.EL_getUpgradeLevelEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			if(this.m.EL_Level < EL_getLevelMax())
			{
				local min_calculate_weight = this.Const.EL_Shield.EL_EquipmentEssence.MinCalculateWeight;
				local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
				calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
				result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Shield.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * this.Const.EL_Shield.EL_EquipmentEssence.UpgradeLevelFactor[this.World.Assets.getEconomicDifficulty()] 
														* this.Math.abs(calculate_weight * (1 + this.Const.EL_Shield.EL_LevelFactor.StaminaModifier * this.m.EL_Level)));
			}
			return result;
		}

		o.EL_getUpgradeRankEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			if(EL_getRankLevel() < EL_getRankLevelMax())
			{
				local rank_level = EL_getRankLevel() + 1;
				local min_calculate_weight = this.Const.EL_Shield.EL_EquipmentEssence.MinCalculateWeight;
				local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
				calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
				if(rank_level == this.Const.EL_Item.Type.Legendary)
				{
					result[this.Const.EL_Item.Type.Legendary] += this.Const.EL_Shield.EL_EquipmentEssence.UpgradeRankLegendaryNum;
				}
				else
				{
					result[rank_level] += this.Math.ceil(this.Const.EL_Shield.EL_EquipmentEssence.UpgradeRankFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.abs(calculate_weight));
					result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Const.EL_Armor.EL_EquipmentEssence.UpgradeRankFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.pow(this.Const.EL_Shield.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * this.Const.EL_Shield.EL_EquipmentEssence.UpgradeLevelFactor[this.World.Assets.getEconomicDifficulty()] 
															* this.Math.abs(calculate_weight * (1 + this.Const.EL_Shield.EL_LevelFactor.StaminaModifier * this.m.EL_Level)) * this.Const.EL_Shield.EL_EquipmentEssence.UpgradeRankNormalEssenceFactor);	
				}			
			}
			else if(this.m.EL_StrengthenEntryNum < this.m.EL_EntryList.len())
			{
				result[this.Const.EL_Item.Type.Legendary] += this.Const.EL_Shield.EL_EquipmentEssence.StrengthenEntryNum;
			}
			return result;
		}

		o.EL_getDisassembleEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			local min_calculate_weight = this.Const.EL_Shield.EL_EquipmentEssence.MinCalculateWeight;
			local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
			calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
			local extra_mult = this.World.Flags.get("EL_HasUpgradeItemAmbitionRule") ? 0.6 : 0.0;
			result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Shield.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * (this.Const.EL_Shield.EL_EquipmentEssence.DisassembleFactor[this.World.Assets.getEconomicDifficulty()] + extra_mult)
													* this.Math.abs(calculate_weight * (1 + this.Const.EL_Shield.EL_LevelFactor.StaminaModifier * this.m.EL_Level)));
			if(this.m.EL_RankLevel == this.Const.EL_Item.Type.Legendary)
			{
				result[this.Const.EL_Item.Type.Legendary] += this.Const.EL_Shield.EL_EquipmentEssence.UpgradeRankLegendaryNum;
			}
			else if(this.m.EL_RankLevel != this.Const.EL_Item.Type.Normal)
			{
				result[this.m.EL_RankLevel] += this.Math.ceil(this.Const.EL_Shield.EL_EquipmentEssence.DisassembleFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.abs(calculate_weight));
			}
			return result;
		}

		o.EL_getRecraftEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			if(this.m.EL_RankLevel)
			{
				local rank_level = this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic);
				local min_calculate_weight = this.Const.EL_Shield.EL_EquipmentEssence.MinCalculateWeight;
				local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
				calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
				result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Shield.EL_EquipmentEssence.RankFactor, rank_level) * this.Const.EL_Shield.EL_EquipmentEssence.RecraftFactor[this.World.Assets.getEconomicDifficulty()] 
														* this.Math.abs(calculate_weight * (1 + this.Const.EL_Shield.EL_LevelFactor.StaminaModifier * this.World.Assets.m.EL_WorldLevel)));
				result[rank_level] += this.Math.ceil(this.Const.EL_Shield.EL_EquipmentEssence.SeniorEquipmentEssenceMult * this.Const.EL_Shield.EL_EquipmentEssence.RecraftFactor[this.Const.Difficulty.Legendary] 
											 * this.Math.abs(calculate_weight));
			}
			return result;
		}
	});

	::mods_hookExactClass("items/shields/legendary/gilders_embrace_shield", function ( o ){
        local create = o.create;
        o.create = function()
        {
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

		o.getTooltip = function()
		{
			local result = this.shield.getTooltip();
			for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 8,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Everyone striking this shield receives the \'Dazed\' effect"
					});
					result.insert(i, {
						id = 8,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Is indestructible"
					});
					break;
				}
			}
			return result;
		}
	});

	::mods_hookExactClass("skills/actives/split_shield", function(o){
        o.onUse = function( _user, _targetTile )
        {
            local target = _targetTile.getEntity();
			local shield = target.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (shield != null)
			{
				this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSplitShield);
				local damage = _user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getShieldDamage();

				//EL_OVERRIDE
				damage -= shield.m.EL_DamageShieldReduction;
				local skill = target.getSkills().getSkillByID("el_shield_entry.shield_reduce_damage_received_mult");
				if(skill != null)
				{
					damage *= 1.0 - skill.m.EL_ShieldDamageReceivedMult * 0.01;
				}


				if (this.m.ApplyAxeMastery && _user.getCurrentProperties().IsSpecializedInAxes)
				{
					damage = damage + this.Math.max(1, damage / 2);
				}

				if (shield.getID() == "weapon.legend_parrying_dagger")
				{
					damage = damage * 0.1;
				}
				else if (shield.getID() == "shield.legend_named_parrying_dagger")
				{
					damage = damage * 0.2;
				}
				damage = this.Math.max(damage, this.Const.EL_Shield.MinDamageReceived);

				local conditionBefore = shield.getCondition();
				shield.applyShieldDamage(damage);

				if (shield.getCondition() == 0)
				{
					if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Split Shield and destroys " + this.Const.UI.getColorizedEntityName(target) + "\'s shield");
					}
				}
				else
				{
					if (this.m.SoundOnHit.len() != 0)
					{
						this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, target.getPos());
					}

					if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Split Shield and hits " + this.Const.UI.getColorizedEntityName(target) + "\'s shield for [b]" + (conditionBefore - shield.getCondition()) + "[/b] damage");
					}
				}

				if (!this.Tactical.getNavigator().isTravelling(target))
				{
					this.Tactical.getShaker().shake(target, _user.getTile(), 2, this.Const.Combat.ShakeEffectSplitShieldColor, this.Const.Combat.ShakeEffectSplitShieldHighlight, this.Const.Combat.ShakeEffectSplitShieldFactor, 1.0, [
						"shield_icon"
					], 1.0);
				}

				local overwhelm = this.getContainer().getSkillByID("perk.overwhelm");

				if (overwhelm != null)
				{
					overwhelm.onTargetHit(this, _targetTile.getEntity(), this.Const.BodyPart.Body, 0, 0);
				}
			}

			return true;
        }
	});
});


