local gt = getroottable();

::mods_registerMod("el_item", 1, "el_item");
::mods_queue(null, "el_world", function ()
{
    ::mods_hookClass("items/item", function(o) {
		while(!("onEquip" in o)) o = o[o.SuperName];
		o.m.EL_EntryList <- [];
		o.m.EL_StrengthenEntryNum <- 0;
		o.m.EL_Level <- -1;
		o.m.EL_CurrentLevel <- -1;
		o.m.EL_RankLevel <- 0;
		o.m.EL_RankPropertiesImproveIndex <- [];
		o.m.EL_BaseNoRankConditionMax <- 0;
		o.m.EL_BaseWithRankConditionMax <- 0;
		o.m.EL_BaseNoRankValue <- 0;
		o.m.EL_BaseWithRankValue <- 0;

		local onSerialize = o.onSerialize;
		o.onSerialize = function( _out )
		{
			onSerialize(_out);
			_out.writeU8(this.m.EL_EntryList.len());
			if(this.m.EL_EntryList.len() != 0)
			{
				foreach(entry in this.m.EL_EntryList)
				{
					_out.writeI32(entry.ClassNameHash);
					entry.onSerialize(_out);
				}
			}
			_out.writeU8(this.m.EL_RankPropertiesImproveIndex.len());
			for(local i = 0; i < this.m.EL_RankPropertiesImproveIndex.len(); ++i)
			{
				_out.writeU16(this.m.EL_RankPropertiesImproveIndex[i]);
			}
			_out.writeI32(this.m.EL_StrengthenEntryNum);
			_out.writeI32(this.m.EL_Level);
			_out.writeI32(this.m.EL_CurrentLevel);
			_out.writeI32(this.m.EL_RankLevel);
			_out.writeI32(this.m.EL_BaseNoRankConditionMax);
			_out.writeI32(this.m.EL_BaseWithRankConditionMax);
			_out.writeI32(this.m.EL_BaseNoRankValue);
			_out.writeI32(this.m.EL_BaseWithRankValue);
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function( _in )
		{
			onDeserialize(_in);
			this.m.EL_EntryList.clear();
			local entry_list_len = _in.readU8();
			for( local i = 0; i != entry_list_len; ++i )
			{
				local script = this.IO.scriptFilenameByHash(_in.readI32());
				local entry = this.new(script);
				entry.onDeserialize(_in);
				this.m.EL_EntryList.push(entry);
			}
			local rank_properties_improve_index_len = _in.readU8();
			for(local i = 0; i < rank_properties_improve_index_len; ++i)
			{
				local index = _in.readU16();
				this.m.EL_RankPropertiesImproveIndex.push(index);
			}
			this.m.EL_StrengthenEntryNum = _in.readI32();
			this.m.EL_Level = _in.readI32();
			this.m.EL_CurrentLevel = _in.readI32();
			this.m.EL_RankLevel = _in.readI32();
			this.m.EL_BaseNoRankConditionMax = _in.readI32();
			this.m.EL_BaseWithRankConditionMax = _in.readI32();
			this.m.EL_BaseNoRankValue = _in.readI32();
			this.m.EL_BaseWithRankValue = _in.readI32();
		}

		o.getSellPrice = function()
		{
			if (this.isBought())
			{
				return this.getBuyPrice();
			}
			if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
			{
				foreach(entry in this.m.EL_EntryList)
				{
					if(entry.getID() == "el_weapon_entry.value_mult" || entry.getID() == "el_shield_entry.value_mult" || entry.getID() == "el_armor_entry.value_mult" && entry.m.EL_CurrentLevel == 1 || 
					   entry.getID() == "el_helmet_entry.value_mult" && entry.m.EL_CurrentLevel == 1 || entry.getID() == "el_accessory_entry.value_mult" && entry.m.EL_CurrentLevel == 1)
					{
						//this.logInfo("SellPriceTradeMult:"+this.World.Assets.m.SellPriceTradeMult+" SellPriceNotProducedHere:"+this.Const.World.Assets.SellPriceNotProducedHere+" SellPriceNotLocalCulture:"+this.Const.World.Assets.SellPriceNotLocalCulture)
						return this.Math.floor(this.getValue() * this.getSellPriceMult() * this.World.Assets.m.SellPriceTradeMult * this.World.State.getCurrentTown().getSellPriceMult() 
															   * this.Const.World.Assets.SellPriceNotProducedHere * this.Const.World.Assets.SellPriceNotLocalCulture);
					}
				}
				return this.Math.floor(this.getValue() * this.getSellPriceMult() * this.Const.World.Assets.BaseSellPrice * this.World.State.getCurrentTown().getSellPriceMult() 
													   * this.Const.Difficulty.SellPriceMult[this.World.Assets.getEconomicDifficulty()]);
			}
			else
			{
				return this.Math.floor(this.getValue() * this.Const.World.Assets.BaseSellPrice);
			}
		}

		o.isWeaponType <- function( _t, _any = true, _only = false )
		{
			return false;
		}

		o.EL_canUpgradeLevelInBagOrStash <- function()
		{
			if(!this.Const.EL_LichKing.IsLichKingSuit(this))
			{
				return false;
			}
			return true;
		}

		o.EL_canUpgradeRankInBagOrStash <- function()
		{
			if(!this.Const.EL_LichKing.IsLichKingSuit(this))
			{
				return false;
			}
			return true;
		}

		o.EL_canRecraftInBagOrStash <- function()
		{
			if(!this.Const.EL_LichKing.IsLichKingSuit(this))
			{
				return false;
			}
			return true;
		}

		o.EL_canDisassembleInBagOrStash <- function()
		{
			if(1)
			{
				return false;
			}
			return true;
		}

		o.EL_canDropIntoBagOrStash <- function()
		{
			if(!this.Const.EL_LichKing.IsLichKingSuit(this))
			{
				return false;
			}
			return true;
		}

		o.EL_hasEntry <- function( _id )
		{
			foreach(entry in this.m.EL_EntryList)
			{
				if(_id == entry.getID())
				{
					return true;
				}
			}
			return false;
		}

		o.EL_addEntryToList <- function( _entry )
		{
			_entry.setItem(this);
			this.m.EL_EntryList.push(_entry);
		}

		o.EL_addEntry <- function( _entry )
		{
			this.m.SkillPtrs.push(_entry);
			this.getContainer().getActor().getSkills().add(_entry);
		}

		o.EL_getEntryListLen <- function()
		{
			local reuslt = this.m.EL_EntryList.len();
			for(local index = 0; index < this.m.EL_EntryList.len(); ++index)
			{
				if(this.m.EL_EntryList[index].getID() == "el_special_entry.repair_by_engrgy" || this.m.EL_EntryList[index].getID() == "el_rarity_entry.vehemence_of_the_sky_subsidiary")
				{
					--reuslt;
				}
			}
			return reuslt;
		}

		o.EL_getStrengthenEntryNum <- function()
		{
			return this.m.EL_StrengthenEntryNum;
		}

		o.EL_setStrengthenEntryNum <- function( _EL_StrengthenEntryNum )
		{
			this.m.EL_StrengthenEntryNum = _EL_StrengthenEntryNum;
		}

		o.EL_getBaseNoRankConditionMax <- function()
		{
			return this.m.EL_BaseNoRankConditionMax;
		}

		o.EL_setBaseNoRankConditionMax <- function( _EL_baseNoRankConditionMax )
		{
			this.m.EL_BaseNoRankConditionMax = _EL_baseNoRankConditionMax;
		}

		o.EL_getBaseWithRankConditionMax <- function()
		{
			return this.m.EL_BaseWithRankConditionMax;
		}

		o.EL_setBaseWithRankConditionMax <- function( _EL_baseWithRankConditionMax )
		{
			this.m.EL_BaseWithRankConditionMax = _EL_baseWithRankConditionMax;
		}

		o.EL_getBaseNoRankValue <- function()
		{
			return this.m.EL_BaseNoRankValue;
		}

		o.EL_setBaseNoRankValue <- function( _EL_baseNoRankValue )
		{
			this.m.EL_BaseNoRankValue = _EL_baseNoRankValue;
		}

		o.EL_getLevelAddtionStaminaModifier <- function()
		{
			return 0;
		}

		o.EL_getLevel <- function()
		{
			return this.m.EL_Level;
		}

		o.EL_getLevelMax <- function()
		{
			if(this.World.Flags.get("EL_HasUpgradeItemAmbitionRule"))
			{
				return this.Const.EL_Item.MaxLevel + 10;
			}
			return this.Const.EL_Item.MaxLevel;
		}

		o.EL_setLevel <- function( _EL_level )
		{
			if(this.m.EL_Level != -1)
			{
				this.m.EL_Level = this.Math.max(0, this.Math.min(this.m.EL_Level, _EL_level));
				this.m.EL_CurrentLevel = this.m.EL_Level;
				EL_updateLevelProperties();
				this.m.Condition = (this.m.Condition > this.m.ConditionMax) ? this.m.ConditionMax : this.m.Condition;
			}
		}

		o.EL_getCurrentLevel <- function()
		{
			return this.m.EL_CurrentLevel;
		}

		o.EL_setCurrentLevel <- function( _EL_level )
		{
			if(this.m.EL_Level != -1)
			{
				this.m.EL_CurrentLevel = this.Math.max(0, this.Math.min(this.m.EL_Level, _EL_level));
				EL_updateLevelProperties();
				this.m.Condition = (this.m.Condition > this.m.ConditionMax) ? this.m.ConditionMax : this.m.Condition;
			}
		}

		o.EL_getRankLevel <- function()
		{
			return this.m.EL_RankLevel;
		}

		o.EL_setRankLevel <- function( _EL_rankLevel )
		{
			this.m.EL_RankLevel = _EL_rankLevel;
			EL_recraft();
		}

		o.EL_addRankLevel <- function()
		{
		}
		
		o.EL_getArmorType <- function()
		{
			return this.Const.EL_Item.ArmorType.UnlayeredArmor;
		}

		o.EL_getRankLevelMax <- function()
		{
			return 0;
		}

		o.EL_isNeedRarityEntry <- function()
		{
			return false;
		}

		o.EL_generateByRankAndLevel <- function( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
		{
		}

		o.EL_updateLevelProperties <- function()
		{
		}

		o.EL_updateRankLevelProperties <- function()
		{
		}

		o.EL_isValid <- function()
		{
			return false;
		}

        o.EL_init <- function()
		{
		}

		o.EL_recordBaseNoRankProperties <- function()
		{
		}

		o.EL_upgradeLevel <- function()
		{
		}

		o.EL_upgradeRank <- function()
		{
		}

		o.EL_disassemble <- function(_itemIndex)
		{
		}

		o.EL_recraft <- function()
		{
		}

		o.EL_getUpgradeLevelEquipmentEssenceNum <- function()
		{
			return [0, 0, 0, 0, 0];
		}

		o.EL_getUpgradeRankEquipmentEssenceNum <- function()
		{
			return [0, 0, 0, 0, 0];
		}

		o.EL_getDisassembleEquipmentEssenceNum <- function()
		{
			return [0, 0, 0, 0, 0];
		}

		o.EL_getRecraftEquipmentEssenceNum <- function()
		{
			return [0, 0, 0, 0, 0];
		}
	});


	for(local i = 0; i < this.Const.EL_Item_Other.EL_InvalidItem.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Item_Other.EL_InvalidItem[i], function ( o )
		{
			o.EL_generateByRankAndLevel <- function( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
			{
			}

			o.EL_updateLevelProperties <- function()
			{
			}

			o.isAmountShown <- function()
			{
				return false;
			}
		});
	}

	::mods_hookExactClass("items/supplies/food_item", function ( o )
	{
		o.getBestBeforeTime = function()
		{
			return this.m.BestBefore * (("State" in this.World) && this.World.State != null && this.World.Retinue.hasFollower("follower.cook") ? 2 : 1);
		}
	});

	::mods_hookExactClass("items/supplies/legend_usable_food", function ( o )
	{
		o.getBestBeforeTime = function()
		{
			return this.m.BestBefore * (("State" in this.World) && this.World.State != null && this.World.Retinue.hasFollower("follower.cook") ? 2 : 1);
		}
	});

	::mods_hookClass("crafting/blueprint", function(o) {
		
		while(!("craft" in o)) o = o[o.SuperName];
		local craft = o.craft;
		o.craft = function()
		{
			craft();
			local has_alchemist = this.World.Retinue.hasFollower("follower.alchemist");
			while(has_alchemist && this.Math.rand(1, 100) <= 25)
			{
				this.onCraft(this.World.Assets.getStash());
			}
		}
	});
});