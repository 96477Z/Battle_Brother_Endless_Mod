local gt = getroottable();

::mods_registerMod("el_accessory", 1, "el_accessory");
::mods_queue(null, "el_item", function ()
{
    ::mods_hookExactClass("items/accessory/accessory", function ( o )
	{
		o.m.EL_RarityEntry <- null;//this.new(this.Const.EL_Rarity_Entry.Pool.Entrys[1].Scripts);//

		local onEquip = o.onEquip;
		o.onEquip = function ()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/el_items/el_item_level_check_skill"));
			foreach(entry in this.m.EL_EntryList)
			{
				this.EL_addEntry(entry);
			}
			if(this.m.EL_RarityEntry != null && this.getContainer().getActor().getFaction() == this.Const.Faction.Player)
			{
				this.logInfo("Rarity entry is equip:" + this.m.EL_RarityEntry.getID());
				this.addSkill(this.m.EL_RarityEntry);
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
			_out.writeBool(this.m.EL_RarityEntry != null);
			if(this.m.EL_RarityEntry != null)
			{
				_out.writeI32(this.m.EL_RarityEntry.ClassNameHash);
				this.m.EL_RarityEntry.onSerialize(_out);
			}
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize(_in);
			local has_rarity_entry = _in.readBool();
			if(has_rarity_entry)
			{
				this.m.EL_RarityEntry = this.new(this.IO.scriptFilenameByHash(_in.readI32()));
				this.m.EL_RarityEntry.onDeserialize(_in);
			}
			if(this.m.EL_Level != -1)
			{
				EL_updateLevelProperties();
			}
		}

		o.EL_setRarityEntry <- function ( _EL_rarityEntry )
		{
		}

		o.EL_getRankLevel <- function()
		{
			return 0;
		}

		o.EL_isValid <- function ()
		{
			return false;
		}
	});

	for(local i = 0; i < this.Const.EL_Accessory.EL_ValidAccessory.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Accessory.EL_ValidAccessory[i], function ( o )
		{
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
				if (this.m.EL_Level > 0 || this.m.EL_RarityEntry != null)
				{
					result.push({
						id = 60,
						type = "text",
						text = "——————————————"
					});
					if(this.m.EL_RarityEntry != null)
					{
						result.push({
							id = 61,
							type = "text",
							text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare] + "]" + this.m.EL_RarityEntry.getName() + "[/color]"
						});
					}
					local tool_tip_id = 62;
					foreach(entry in this.m.EL_EntryList)
					{
						local tool_tip = entry.getTooltip(tool_tip_id);
						if(tool_tip != null && entry.m.EL_CurrentLevel != 0)
						{
							result.push(tool_tip);
							++tool_tip_id;
						}
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

			o.isAmountShown <- function()
			{
				return true;
			}

			o.getAmountString <- function()
			{
				this.Const.EL_Item_Other.EL_otherItemInit(this);
				return "lv" + this.m.EL_Level;
			}

			o.getAmountColor <- function()
			{
				if(this.m.EL_RarityEntry == null)
				{
					return this.Const.EL_Item.Colour[this.m.EL_RankLevel];
				}
				else
				{
					return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
				}
			}

			o.EL_getRankLevel <- function()
			{
				return this.m.EL_RankLevel;
			}

			o.EL_getRankLevelMax <- function()
			{
				return this.Const.EL_Item.MaxRankLevel.Normal;
			}
			
			//EL_additionalRarityChance
			o.EL_generateByRankAndLevel <- function( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
			{
				if(this.m.EL_Level == -1)
				{
					this.m.EL_RankLevel = this.Math.min(this.m.EL_RankLevel + _EL_rankLevel, this.EL_getRankLevelMax());
					this.m.EL_Level = this.Math.min(EL_getLevelMax(), EL_level);
					EL_recordBaseNoRankProperties();
					this.Const.EL_Accessory.EL_assignItemRarityEntry(this, EL_additionalRarityChance);
					this.Const.EL_Accessory.EL_updateRankLevelProperties(this);
					this.Const.EL_Accessory.EL_assignItemEntrys(this, this.Const.EL_Accessory.EL_Entry.EntryNum.NormalAccessory[this.m.EL_RankLevel] * this.m.EL_Level);
				}
				this.m.EL_CurrentLevel = this.m.EL_Level;
				EL_updateLevelProperties();
			}

			o.EL_addRankLevel <- function()
			{
				if(EL_getRankLevel() <= this.Const.EL_Item.Type.Legendary)
				{
					++this.m.EL_RankLevel;
					EL_init();
					foreach(entry in this.m.EL_EntryList)
					{
						entry.EL_onUpgradeRank();
					}
					this.Const.EL_Accessory.EL_updateRankLevelProperties(this);
					this.Const.EL_Accessory.EL_assignItemEntrys(this, this.Const.EL_Accessory.EL_Entry.EntryNum.NormalAccessory[this.m.EL_RankLevel] * this.m.EL_Level);
					if(this.m.EL_RarityEntry == null)
					{
						this.Const.EL_Accessory.EL_assignItemRarityEntry(this);
					}
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
					this.Const.EL_Accessory.EL_assignItemEntrys(this, this.Const.EL_Accessory.EL_Entry.EntryNum.NormalAccessory[this.m.EL_RankLevel] * this.m.EL_Level);
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
					this.Const.EL_Accessory.EL_updateRankLevelProperties(this);
					this.Const.EL_Accessory.EL_assignItemEntrys(this, this.Const.EL_Accessory.EL_Entry.EntryNum.NormalAccessory[this.m.EL_RankLevel] * this.m.EL_Level);
					if(this.m.EL_RarityEntry == null)
					{
						this.Const.EL_Accessory.EL_assignItemRarityEntry(this);
					}
				}
				else if(this.m.EL_RarityEntry == null)
				{
					this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
					local r = this.Math.rand(0, this.Const.EL_Rarity_Entry.Pool.Entrys.len() - 1);
					this.EL_setRarityEntry(this.new(this.Const.EL_Rarity_Entry.Pool.Entrys[r].Scripts));
					
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
				local rarity_stone = null;
				if(this.m.EL_RarityEntry != null)
				{
					rarity_stone = this.new("scripts/items/el_misc/el_rarity_entry_stone_item");
					rarity_stone.EL_setRarityEntry(this.m.EL_RarityEntry);
				}
				local stash = this.World.Assets.getStash();
				stash.remove(this);
				if(rarity_stone != null)
				{
					stash.insert(rarity_stone, _itemIndex);
				}
			}

			o.EL_recraft <- function()
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				EL_init();
				if(this.m.EL_RarityEntry == null)
				{
					this.Const.EL_Accessory.EL_assignItemRarityEntry(this);
				}
				this.m.EL_EntryList.clear();
				this.Const.EL_Accessory.EL_updateRankLevelProperties(this);
				this.Const.EL_Accessory.EL_assignItemEntrys(this, this.Const.EL_Accessory.EL_Entry.EntryNum.NormalAccessory[this.m.EL_RankLevel] * this.m.EL_Level);
				EL_updateLevelProperties();
			}

			o.EL_updateLevelProperties <- function()
			{
				this.m.Value = this.Math.ceil(this.m.EL_BaseWithRankValue * (1 + this.Const.EL_Accessory.EL_LevelFactor.Value * this.m.EL_Level));
				local entryNum = this.Const.EL_Accessory.EL_Entry.EntryNum.NormalAccessory[this.m.EL_RankLevel] * this.m.EL_CurrentLevel;
				for(local num = 0.0; num < this.m.EL_EntryList.len(); ++num)
				{
					this.m.EL_EntryList[num].EL_setCurrentLevel(entryNum - num);
				}
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
			}

			o.EL_isValid <- function()
			{
				return true;
			}

			o.EL_init <- function()
			{
				this.m.EL_BaseWithRankValue = this.m.EL_BaseNoRankValue;
			}

			o.EL_recordBaseNoRankProperties <- function()
			{
				this.m.EL_BaseNoRankValue = this.m.Value;
				this.m.EL_BaseWithRankValue = this.m.Value;
			}

			o.isDroppedAsLoot <- function()
			{
				if (!this.item.isDroppedAsLoot())
				{
					return false;
				}
				if (this.m.EL_RarityEntry != null || this.Math.rand(1, 100) <= this.Const.EL_Accessory.EL_DroppedChance[this.m.EL_RankLevel])
				{
					return true;
				}
				return false;
			}

			o.EL_setRarityEntry <- function ( _EL_rarityEntry )
			{
				this.m.EL_RarityEntry = _EL_rarityEntry;
			}

			o.EL_isValid <- function ()
			{
				return true;
			}

			o.EL_isNeedRarityEntry <- function ()
			{
				return this.m.EL_RarityEntry == null && this.EL_getRankLevel() >= this.EL_getRankLevelMax();
			}

			o.EL_getUpgradeLevelEquipmentEssenceNum <- function()
			{
				local result = [0, 0, 0, 0, 0];
				if(this.m.EL_Level < EL_getLevelMax())
				{
					local min_calculate_weight = this.Const.EL_Accessory.EL_EquipmentEssence.MinCalculateWeight;
					result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Accessory.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * this.Const.EL_Accessory.EL_EquipmentEssence.UpgradeLevelFactor[this.World.Assets.getEconomicDifficulty()] 
															* this.Math.abs(min_calculate_weight * (1 + this.Const.EL_Accessory.EL_LevelFactor.StaminaModifier * this.m.EL_Level)));
				}
				return result;
			}

			o.EL_getUpgradeRankEquipmentEssenceNum <- function()
			{
				local result = [0, 0, 0, 0, 0];
				if(EL_getRankLevel() < EL_getRankLevelMax())
				{
					local rank_level = EL_getRankLevel() + 1;
					local min_calculate_weight = this.Const.EL_Accessory.EL_EquipmentEssence.MinCalculateWeight;
					if(rank_level == this.Const.EL_Item.Type.Legendary)
					{
						result[this.Const.EL_Item.Type.Legendary] += this.Const.EL_Accessory.EL_EquipmentEssence.UpgradeRankLegendaryNum;
					}
					else
					{
						result[rank_level] += this.Math.ceil(this.Const.EL_Accessory.EL_EquipmentEssence.UpgradeRankFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.abs(min_calculate_weight));
						result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Accessory.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * this.Const.EL_Accessory.EL_EquipmentEssence.UpgradeLevelFactor[this.World.Assets.getEconomicDifficulty()] 
																* this.Math.abs(min_calculate_weight * (1 + this.Const.EL_Accessory.EL_LevelFactor.StaminaModifier * this.m.EL_Level)) * this.Const.EL_Accessory.EL_EquipmentEssence.UpgradeRankNormalEssenceFactor);	
					}
				}
				else if(this.m.EL_RarityEntry == null)
				{
					result[this.Const.EL_Item.Type.Legendary] += 3;
				}
				else if(this.m.EL_StrengthenEntryNum < this.m.EL_EntryList.len())
				{
					result[this.Const.EL_Item.Type.Legendary] += this.Const.EL_Accessory.EL_EquipmentEssence.StrengthenEntryNum;
				}
				return result;
			}

			o.EL_getDisassembleEquipmentEssenceNum <- function()
			{
				local result = [0, 0, 0, 0, 0];
				local extra_mult = this.World.Flags.get("EL_HasUpgradeItemAmbitionRule") ? 0.2 : 0.0;
				local min_calculate_weight = this.Const.EL_Accessory.EL_EquipmentEssence.MinCalculateWeight;
				result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Accessory.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) 
														* (this.Const.EL_Accessory.EL_EquipmentEssence.DisassembleFactor[this.World.Assets.getEconomicDifficulty()] + extra_mult)
														* this.Math.abs(min_calculate_weight * (1 + this.Const.EL_Accessory.EL_LevelFactor.StaminaModifier * this.m.EL_Level)));
				if(this.m.EL_RankLevel == this.Const.EL_Item.Type.Legendary)
				{
					++result[this.Const.EL_Item.Type.Legendary];
				}
				else if(this.m.EL_RankLevel != this.Const.EL_Item.Type.Normal)
				{
					result[this.m.EL_RankLevel] += this.Math.ceil(this.Const.EL_Accessory.EL_EquipmentEssence.DisassembleFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.abs(min_calculate_weight));
				}
				return result;
			}

			o.EL_getRecraftEquipmentEssenceNum <- function()
			{
				local result = [0, 0, 0, 0, 0];
				local rank_level = this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic);
				local min_calculate_weight = this.Const.EL_Accessory.EL_EquipmentEssence.MinCalculateWeight;
				result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Accessory.EL_EquipmentEssence.RankFactor, rank_level) * this.Const.EL_Accessory.EL_EquipmentEssence.RecraftFactor[this.World.Assets.getEconomicDifficulty()] 
														* this.Math.abs(min_calculate_weight * (1 + this.Const.EL_Accessory.EL_LevelFactor.StaminaModifier * this.World.Assets.m.EL_WorldLevel)));
				result[rank_level] += this.Math.ceil(this.Const.EL_Accessory.EL_EquipmentEssence.SeniorEquipmentEssenceMult * this.Const.EL_Accessory.EL_EquipmentEssence.RecraftFactor[this.Const.Difficulty.Legendary] 
												   * this.Math.abs(min_calculate_weight));
				return result;
			}
		});
	}

	for(local i = 0; i < this.Const.EL_Accessory.EL_SeniorAccessoryList.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Accessory.EL_SeniorAccessoryList[i], function ( o )
		{
			o.m.EL_RankLevel <- 1;

			o.isDroppedAsLoot <- function()
			{
				return true;
			}

			o.EL_getRankLevelMax <- function()
			{
				return this.Const.EL_Item.MaxRankLevel.Named;
			}
		});
	}

	::mods_hookExactClass("items/accessory/sergeant_badge_item", function ( o )
	{
		o.getBuyPrice = function()
		{
			if (this.isSold())
			{
				return this.getSellPrice();
			}

			if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
			{
				return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getBuyPriceMult() * this.getPriceMult() * this.World.State.getCurrentTown().getBuyPriceMult() * this.Const.Difficulty.BuyPriceMult[this.World.Assets.getEconomicDifficulty()]));
			}
			else
			{
				return this.Math.ceil(this.getValue() * this.getPriceMult());
			}
		}
	});
});
