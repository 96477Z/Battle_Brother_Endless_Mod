local gt = getroottable();

::mods_registerMod("el_item_other", 1, "el_item_other");
::mods_queue(null, "el_item", function ()
{
	::mods_hookExactClass("skills/backgrounds/character_background", function ( o )
	{
		o.addEquipment = function ()
		{
			this.onAddEquipment();
			this.Const.EL_Item_Other.EL_actorItemInit(this.getContainer().getActor());
			this.adjustHiringCostBasedOnEquipment();
		}
	});

	::mods_hookExactClass("entity/tactical/actor", function(o){
        o.EL_assignRandomEquipment <- function() {
			this.assignRandomEquipment();
			this.Const.EL_Item_Other.EL_actorItemInit(this, true);
        }
	});

	::mods_hookNewObjectOnce("states/world/asset_manager", function ( o )
	{
        local setCampaignSettings = o.setCampaignSettings;
		o.setCampaignSettings = function( _settings )
		{
			setCampaignSettings(_settings);
			local bros = this.World.getPlayerRoster().getAll();

			foreach( bro in bros )
			{
				this.Const.EL_Item_Other.EL_actorItemInit(bro);
			}
		}
	});

	::mods_hookNewObject("ui/screens/character/character_screen", function ( o )
	{
		local removePaperdollItemUpgrades = o.removePaperdollItemUpgrades;
		o.removePaperdollItemUpgrades = function( _data )
		{
			local bro = this.Tactical.getEntityByID(_data[0]);
			local item = bro.m.Items.getItemByInstanceID(_data[1]);
			if(item.EL_canUpgradeLevelInBagOrStash() && !this.Tactical.isActive())
			{
				return EL_recraftItemInBagOrStash(_data);
			}
			return removePaperdollItemUpgrades(_data);
		}

		o.onDropPaperdollItem = function( _data )
		{
			local bro = this.Tactical.getEntityByID(_data[0]);
			local item = bro.m.Items.getItemByInstanceID(_data[1]);
			if(item.EL_canUpgradeLevelInBagOrStash() && !this.Tactical.isActive())
			{
				return EL_upgradeItemLevelInBagOrStash(_data);
			}
			if (this.Tactical.isActive())
			{
				if (this.m.InventoryMode == this.Const.CharacterScreen.InventoryMode.Ground)
				{
					return this.tactical_onDropItemToGround(_data);
				}
				else
				{
					return this.general_onDropItemIntoStash(_data);
				}
			}
			else
			{
				return this.general_onDropItemIntoStash(_data);
			}
		}
		
		o.EL_recraftItemInBagOrStash <- function( _data )
		{
			local bro = this.Tactical.getEntityByID(_data[0]);
			local item = bro.m.Items.getItemByInstanceID(_data[1]);
			if(item.EL_canRecraftInBagOrStash())
			{
				local equipment_essence_need = item.EL_getRecraftEquipmentEssenceNum();
				for(local rank = 0; rank < this.Const.EL_Item.Type.Epic; ++rank)
				{
					if(equipment_essence_need[rank] > this.World.Assets.EL_getEquipmentEssence(rank))
					{
						local num = this.Math.ceil((equipment_essence_need[rank] - this.World.Assets.EL_getEquipmentEssence(rank)) / this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank]);
						equipment_essence_need[rank + 1] += num;
						equipment_essence_need[rank] -= num * this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank];
					}
				}

				if (equipment_essence_need[this.Const.EL_Item.Type.Legendary] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Legendary) &&
					equipment_essence_need[this.Const.EL_Item.Type.Epic] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Epic) && 
					item.EL_getRecraftSoulEnergy() <= this.World.Assets.EL_getSoulEnergy())
				{
					for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
					{
						this.World.Assets.EL_addEquipmentEssence(rank, -equipment_essence_need[rank]);
					}
					this.World.Assets.EL_addSoulEnergy(-item.EL_getRecraftSoulEnergy());
					item.EL_recraft();
					item.onUnequip();
					item.onEquip();
				}
			}
			return this.UIDataHelper.convertStashAndEntityToUIData(bro, null, false, this.m.InventoryFilter);
		}
		
		o.EL_upgradeItemLevelInBagOrStash <- function( _data )
		{
			local bro = this.Tactical.getEntityByID(_data[0]);
			local item = bro.m.Items.getItemByInstanceID(_data[1]);
			if(item.EL_canUpgradeLevelInBagOrStash())
			{
				local limited_level = this.Const.EL_Item.MaxLevel;
				if(this.World.Flags.get("EL_HasUpgradeItemAmbitionRule"))
				{
					limited_level += 10;
				}
				if(!item.isItemType(this.Const.Items.ItemType.Accessory))
				{
					local accessory = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
					limited_level = accessory.EL_getLevel();
				}
				if(limited_level < item.EL_getLevel())
				{
					return this.UIDataHelper.convertStashAndEntityToUIData(bro, null, false, this.m.InventoryFilter);
				}
				
				local equipment_essence_need = item.EL_getUpgradeLevelEquipmentEssenceNum();
				local gray_equipment_essence_consume = equipment_essence_need[this.Const.EL_Item.Type.Normal];
				for(local rank = 0; rank < this.Const.EL_Item.Type.Epic; ++rank)
				{
					if(equipment_essence_need[rank] > this.World.Assets.EL_getEquipmentEssence(rank))
					{
						local num = this.Math.ceil((equipment_essence_need[rank] - this.World.Assets.EL_getEquipmentEssence(rank)) / this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank]);
						equipment_essence_need[rank + 1] += num;
						equipment_essence_need[rank] -= num * this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank];
					}
				}
				if (equipment_essence_need[this.Const.EL_Item.Type.Legendary] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Legendary) &&
					equipment_essence_need[this.Const.EL_Item.Type.Epic] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Epic) && 
					item.EL_getUpgradeLevelSoulEnergy() <= this.World.Assets.EL_getSoulEnergy())
				{
					for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
					{
						this.World.Assets.EL_addEquipmentEssence(rank, -equipment_essence_need[rank]);
					}
					this.World.Assets.EL_addSoulEnergy(-item.EL_getUpgradeLevelSoulEnergy());
					this.World.Statistics.getFlags().increment("UpgradeGreyEssenceConsume", gray_equipment_essence_consume);
					item.EL_upgradeLevel();
					item.onUnequip();
					item.onEquip();
				}
			}
			return this.UIDataHelper.convertStashAndEntityToUIData(bro, null, false, this.m.InventoryFilter);
		}

		o.EL_upgradeItemRankInBagOrStash <- function( _data )
		{
			local bro = this.Tactical.getEntityByID(_data[0]);
			local item = bro.m.Items.getItemByInstanceID(_data[1]);
			if(item.EL_canUpgradeRankInBagOrStash() && !this.Tactical.isActive())
			{
				local limited_rank = EL_getLevelMax();
				if(!item.isItemType(this.Const.Items.ItemType.Accessory))
				{
					local accessory = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
					limited_rank = accessory.EL_getRankLevel();
				}
				if(limited_rank < item.EL_getRankLevel())
				{
					return this.UIDataHelper.convertStashAndEntityToUIData(bro, null, false, this.m.InventoryFilter);
				}
				local equipment_essence_need = item.EL_getUpgradeRankEquipmentEssenceNum();
				for(local rank = 0; rank < this.Const.EL_Item.Type.Epic; ++rank)
				{
					if(equipment_essence_need[rank] > this.World.Assets.EL_getEquipmentEssence(rank))
					{
						local num = this.Math.ceil((equipment_essence_need[rank] - this.World.Assets.EL_getEquipmentEssence(rank)) / this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank]);
						equipment_essence_need[rank + 1] += num;
						equipment_essence_need[rank] -= num * this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank];
					}
				}

				if (equipment_essence_need[this.Const.EL_Item.Type.Legendary] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Legendary) &&
					equipment_essence_need[this.Const.EL_Item.Type.Epic] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Epic) && 
					item.EL_getUpgradeRankSoulEnergy() <= this.World.Assets.EL_getSoulEnergy())
				{
					for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
					{
						this.World.Assets.EL_addEquipmentEssence(rank, -equipment_essence_need[rank]);
					}
					//this.World.Assets.EL_addSoulEnergy(-item.EL_getUpgradeRankSoulEnergy());
					item.EL_upgradeRank();
					item.onUnequip();
					item.onEquip();
				}
			}
			return this.UIDataHelper.convertStashAndEntityToUIData(bro, null, false, this.m.InventoryFilter);
		}
	});

	::mods_hookNewObject("items/item_container", function(o) {
		o.unequip = function( _item )
		{
			if (_item == null || _item == -1)
			{
				return false;
			}
			if (_item.EL_canDropIntoBagOrStash())
			{
				return false;
			}

			if (_item.getCurrentSlotType() == this.Const.ItemSlot.None || _item.getCurrentSlotType() == this.Const.ItemSlot.Bag)
			{
				this.logWarning("Attempted to unequip item " + _item.getName() + ", but is not equipped");
				return false;
			}
			if(_item.getSlotType() == -1) {
				this.logWarning("attempt to unequip none slot item " + _item.getID());
				return false;
			}

			if (_item != null && _item != -1 && _item.getCurrentSlotType() != ::Const.ItemSlot.None && _item.getCurrentSlotType() != ::Const.ItemSlot.Bag && !::MSU.isNull(this.m.Actor) && this.m.Actor.isAlive())
			{
				foreach (item in this.m.Items[_item.getSlotType()])
				{
					if (item == _item)
					{
						this.m.Actor.getSkills().onUnequip(_item);
						break;
					}
				}
			}

			for( local i = 0; i < this.m.Items[_item.getSlotType()].len(); i = i )
			{
				if (this.m.Items[_item.getSlotType()][i] == _item)
				{
					_item.onUnequip();
					_item.setContainer(null);
					_item.setCurrentSlotType(this.Const.ItemSlot.None);
					this.m.Items[_item.getSlotType()][i] = null;

					if (_item.getBlockedSlotType() != null)
					{
						for( local i = 0; i < this.m.Items[_item.getBlockedSlotType()].len(); i = i )
						{
							if (this.m.Items[_item.getBlockedSlotType()][i] == -1)
							{
								this.m.Items[_item.getBlockedSlotType()][i] = null;
								break;
							}

							i = ++i;
						}
					}

					if (this.m.Actor != null && !this.m.Actor.isNull() && this.m.Actor.isAlive())
					{
						this.m.Actor.getSkills().update();
					}

					return true;
				}

				i = ++i;
			}

			return false;
		}

		local swap = o.swap;
		o.swap = function( _itemA, _itemB )
		{
			if(_itemA.EL_canDropIntoBagOrStash() || _itemB.EL_canDropIntoBagOrStash())
			{
				return false;
			}
			return swap(_itemA, _itemB);
		}
	});

    ::mods_hookClass("items/stash_container", function(o) {
		//while(!("add" in o)) o = o[o.SuperName];
        // local add = o.add;
        // o.add = function( _item )
        // {
		// 	this.Const.EL_Item_Other.EL_otherItemInit(_item);
		// 	return add(_item);
        // }
		o.getActor <- function()
		{
			return null;
		}

		o.onItemCompare = function( _item1, _item2 )
		{
			if (_item1 == null && _item2 == null)
			{
				return 0;
			}
			else if (_item1 == null && _item2 != null)
			{
				return 1;
			}
			else if (_item1 != null && _item2 == null)
			{
				return -1;
			}
			else if (_item1.getItemType() > _item2.getItemType())
			{
				return -1;
			}
			else if (_item1.getItemType() < _item2.getItemType())
			{
				return 1;
			}
			else if (_item1.getCategories() > _item2.getCategories())
			{
				return -1;
			}
			else if (_item1.getCategories() < _item2.getCategories())
			{
				return 1;
			}
			else if (_item1.getID() > _item2.getID())
			{
				return -1;
			}
			else if (_item1.getID() < _item2.getID())
			{
				return 1;
			}
			//OVERRIDE
			else if (_item1.EL_getRankLevel() > _item2.EL_getRankLevel())
			{
				return -1;
			}
			else if (_item1.EL_getRankLevel() < _item2.EL_getRankLevel())
			{
				return 1;
			}
			else if (_item1.EL_getLevel() > _item2.EL_getLevel())
			{
				return -1;
			}
			else if (_item1.EL_getLevel() < _item2.EL_getLevel())
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
	});

	// ::mods_hookClass("entity/world/world_entity", function(o) {
	// 	while(!("getTroops" in o)) o = o[o.SuperName];

	// 	local onDropLootForPlayer = o.onDropLootForPlayer;
	// 	o.onDropLootForPlayer = function (_lootTable)
	// 	{
    //         onDropLootForPlayer(_lootTable);
	// 		foreach(item in _lootTable)
	// 		{
	// 			this.Const.EL_Item_Other.EL_otherItemInit(item);
	// 		}
	// 	}
	// });

    ::mods_hookNewObject("ui/screens/tooltip/tooltip_events", function(o) {
		local tactical_helper_addHintsToTooltip = o.tactical_helper_addHintsToTooltip;
		o.tactical_helper_addHintsToTooltip = function( _activeEntity, _entity, _item, _itemOwner, _ignoreStashLocked = false )
		{
			local tooltip = tactical_helper_addHintsToTooltip(_activeEntity, _entity, _item, _itemOwner, _ignoreStashLocked);
            switch(_itemOwner)
            {
			case "entity":
			if(!(_item.getCurrentSlotType() == this.Const.ItemSlot.Bag && _item.getSlotType() != this.Const.ItemSlot.None) && !this.Tactical.isActive() &&
				(_item.EL_canDropIntoBagOrStash() || _item.EL_canUpgradeLevelInBagOrStash() || _item.EL_canUpgradeRankInBagOrStash() || _item.EL_canRecraftInBagOrStash()))
			{
				if(_item.EL_canDropIntoBagOrStash())
				{
					tooltip.remove(tooltip.len() - 1);
					tooltip.push({
						id = 5,
						type = "text",
						icon = "ui/tooltips/warning.png",
						text = "[color=" + this.Const.UI.Color.NegativeValue + "]该物品无法卸下，并且无法通过工具进行修理！[/color]"
					});
				}
				local equipment_essence_upgrade_level_num = _item.EL_getUpgradeLevelEquipmentEssenceNum();
				local equipment_essence_upgrade_rank_num = _item.EL_getUpgradeRankEquipmentEssenceNum();
				local equipment_essence_recraft_num = _item.EL_getRecraftEquipmentEssenceNum();
				local special_energy_upgrade_level_num = 0;
				local special_energy_upgrade_rank_num = 0;
				local special_energy_recraft_num = 0;
				local special_image_path = "";
				if(this.Const.EL_LichKing.IsLichKingSuit(_item))
				{
					special_energy_upgrade_level_num = _item.EL_getUpgradeLevelSoulEnergy();
					special_energy_upgrade_rank_num = _item.EL_getUpgradeRankSoulEnergy();
					special_energy_recraft_num = _item.EL_getRecraftSoulEnergy();
					special_image_path = "[img]gfx/ui/tooltips/soul_energy.png[/img]";
				}
				local upgrade_level_index_pool = [];
				local upgrade_rank_index_pool = [];
				local recraft_index_pool = [];
				for(local rank = 0; rank < equipment_essence_upgrade_level_num.len(); ++rank)
				{
					if(equipment_essence_upgrade_level_num[rank] != 0)
					{
						upgrade_level_index_pool.push(rank);
					}
					if(equipment_essence_upgrade_rank_num[rank] != 0)
					{
						upgrade_rank_index_pool.push(rank);
					}
					if(equipment_essence_recraft_num[rank] != 0)
					{
						recraft_index_pool.push(rank);
					}
				}
				local limited_level = this.Const.EL_Item.MaxLevel;
				if(this.World.Flags.get("EL_HasUpgradeItemAmbitionRule"))
				{
					limited_level += 10;
				}
				local limited_rank = this.Const.EL_Item.Type.Legendary;
				if(!_item.isItemType(this.Const.Items.ItemType.Accessory))
				{
					local accessory = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
					limited_level = accessory.EL_getLevel();
					limited_rank = accessory.EL_getRankLevel();
				}
				local upgrade_rank_string = _item.EL_getRankLevel() == _item.EL_getRankLevelMax() ? " 将它的词条强化" : " 将它升阶";
				if(_item.EL_canUpgradeLevelInBagOrStash() && _item.EL_getLevel() < limited_level)
				{
					switch(upgrade_level_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 " + special_image_path + special_energy_upgrade_level_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 " + special_image_path + special_energy_upgrade_level_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 " + special_image_path + special_energy_upgrade_level_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 " + special_image_path + special_energy_upgrade_level_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 " + special_image_path + special_energy_upgrade_level_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[4] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					}
				}
				else
				{
					tooltip.push({
						id = 4,
						type = "hint",
						icon = "ui/tooltips/warning.png",
						text = "须先升级饰品才可对其进行升级"
					});
				}
				if(_item.EL_canUpgradeRankInBagOrStash() && (_item.EL_getRankLevel() < limited_rank || upgrade_rank_string == " 将它的词条强化"))
				{
					switch(upgrade_rank_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 " + special_image_path + special_energy_upgrade_rank_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
									+ upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 " + special_image_path + special_energy_upgrade_rank_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 " + special_image_path + special_energy_upgrade_rank_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ upgrade_rank_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 " + special_image_path + special_energy_upgrade_rank_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ upgrade_rank_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 " + special_image_path + special_energy_upgrade_rank_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ upgrade_rank_index_pool[4] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					}
				}
				else
				{
					tooltip.push({
						id = 4,
						type = "hint",
						icon = "ui/tooltips/warning.png",
						text = "须先升阶饰品才可对其进行升阶"
					});
				}
				if(_item.EL_canRecraftInBagOrStash())
				{
					switch(recraft_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 " + special_image_path + special_energy_recraft_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 " + special_image_path + special_energy_recraft_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 " + special_image_path + special_energy_recraft_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ recraft_index_pool[2] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 " + special_image_path + special_energy_recraft_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ recraft_index_pool[3] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[2] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 " + special_image_path + special_energy_recraft_num + "[img]gfx/ui/tooltips/equipment_essence_rank_" 
							+ recraft_index_pool[4] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[3] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[2] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					}
					if(_item.EL_canDisassembleInBagOrStash())
					{

					}
				}
				
			}
			break;


            case "camp-screen-repair-dialog-module.stash":
			case "camp-screen-workshop-dialog-module.stash":
			case "world-town-screen-shop-dialog-module.stash":
                if(this.World.State.getCurrentTown().getCurrentBuilding().isRepairOffered() && _item.m.EL_Level != -1)
                {
					local equipment_essence_upgrade_level_num = _item.EL_getUpgradeLevelEquipmentEssenceNum();
					local equipment_essence_upgrade_rank_num = _item.EL_getUpgradeRankEquipmentEssenceNum();
					local equipment_essence_recraft_num = _item.EL_getRecraftEquipmentEssenceNum();
					local equipment_essence_disassemble_num = _item.EL_getDisassembleEquipmentEssenceNum();
					local upgrade_level_index_pool = [];
					local upgrade_rank_index_pool = [];
					local recraft_index_pool = [];
					local disassemble_index_pool = [];
					for(local rank = 0; rank < equipment_essence_upgrade_level_num.len(); ++rank)
					{
						if(equipment_essence_upgrade_level_num[rank] != 0)
						{
							upgrade_level_index_pool.push(rank);
						}
						if(equipment_essence_upgrade_rank_num[rank] != 0)
						{
							upgrade_rank_index_pool.push(rank);
						}
						if(equipment_essence_recraft_num[rank] != 0)
						{
							recraft_index_pool.push(rank);
						}
						if(equipment_essence_disassemble_num[rank] != 0)
						{
							disassemble_index_pool.push(rank);
						}
					}
					local upgrade_rank_string = _item.EL_getRankLevel() == _item.EL_getRankLevelMax() ? " 将它的词条强化" : " 将它升阶";
					if(_item.EL_isNeedRarityEntry())
					{
						upgrade_rank_string = "来获取稀有词条";
					}
					switch(upgrade_level_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[4] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_level_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_level_num[upgrade_level_index_pool[0]] + " 将它升级"
						});
						break;
					}
					switch(upgrade_rank_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_alt.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[4] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[3] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[2] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[1] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + upgrade_rank_index_pool[0] + ".png[/img]" + equipment_essence_upgrade_rank_num[upgrade_rank_index_pool[0]] + upgrade_rank_string
						});
						break;
					}
					switch(recraft_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[2] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[3] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[2] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_shift.png",
							text = "支付 [img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[4] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[3] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[2] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[1] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + recraft_index_pool[0] + ".png[/img]" + equipment_essence_recraft_num[recraft_index_pool[0]] + " 将它重铸"
						});
						break;
					}
					switch(disassemble_index_pool.len())
					{
					case 0:
						break;
					case 1:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_shift.png",
							text = "将它分解，获得[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[0] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[0]]
						});
						break;
					case 2:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_shift.png",
							text = "将它分解，获得[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[1] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[0] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[0]]
						});
						break;
					case 3:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_shift.png",
							text = "将它分解，获得[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[2] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[1] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[0] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[0]]
						});
						break;
					case 4:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_shift.png",
							text = "将它分解，获得[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[3] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[2] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[1] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[0] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[0]]
						});
						break;
					case 5:
						tooltip.push({
							id = 4,
							type = "hint",
							icon = "ui/icons/mouse_right_button_ctrl_and_shift.png",
							text = "将它分解，获得[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[4] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[4]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[3] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[3]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[2] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[2]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[1] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[1]]
							+ "[img]gfx/ui/tooltips/equipment_essence_rank_" + disassemble_index_pool[0] + ".png[/img]" + equipment_essence_disassemble_num[disassemble_index_pool[0]]
						});
						break;
					}
                }
            }
			return tooltip;
		}
	});

	::mods_hookExactClass("ui/screens/world/modules/world_town_screen/town_shop_dialog_module", function(o){
		o.EL_onUpgradeLevelItem <- function( _itemIndex )
		{
			local item = this.Stash.getItemAtIndex(_itemIndex).item;
			if (!this.m.Shop.isRepairOffered() && item != null)
			{
				return null;
			}
			if(item == null)
			{
				return null;
			}

			local equipment_essence_need = item.EL_getUpgradeLevelEquipmentEssenceNum();
			local gray_equipment_essence_consume = equipment_essence_need[this.Const.EL_Item.Type.Normal];
			for(local rank = 0; rank < this.Const.EL_Item.Type.Epic; ++rank)
			{
				if(equipment_essence_need[rank] > this.World.Assets.EL_getEquipmentEssence(rank))
				{
					local num = this.Math.ceil((equipment_essence_need[rank] - this.World.Assets.EL_getEquipmentEssence(rank)) / this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank]);
					equipment_essence_need[rank + 1] += num;
					equipment_essence_need[rank] -= num * this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank];
				}
			}

			if(equipment_essence_need[this.Const.EL_Item.Type.Legendary] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Legendary) &&
			   equipment_essence_need[this.Const.EL_Item.Type.Epic] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Epic))
			{
				for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
				{
					this.World.Assets.EL_addEquipmentEssence(rank, -equipment_essence_need[rank]);
				}
				this.World.Statistics.getFlags().increment("UpgradeGreyEssenceConsume", gray_equipment_essence_consume);
				item.EL_upgradeLevel();
			}

			local result = {
				Item = this.UIDataHelper.convertItemToUIData(item, true, this.Const.UI.ItemOwner.Stash),
				Assets = this.m.Parent.queryAssetsInformation()
			};
			return result;
		}

		o.EL_onUpgradeRankItem <- function( _itemIndex )
		{
			local item = this.Stash.getItemAtIndex(_itemIndex).item;
			if (!this.m.Shop.isRepairOffered() && item != null)
			{
				return null;
			}
			if(item == null)
			{
				return null;
			}

			local equipment_essence_need = item.EL_getUpgradeRankEquipmentEssenceNum();
			for(local rank = 0; rank < this.Const.EL_Item.Type.Epic; ++rank)
			{
				if(equipment_essence_need[rank] > this.World.Assets.EL_getEquipmentEssence(rank))
				{
					local num = this.Math.ceil((equipment_essence_need[rank] - this.World.Assets.EL_getEquipmentEssence(rank)) / this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank]);
					equipment_essence_need[rank + 1] += num;
					equipment_essence_need[rank] -= num * this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank];
				}
			}

			if(equipment_essence_need[this.Const.EL_Item.Type.Legendary] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Legendary) &&
			   equipment_essence_need[this.Const.EL_Item.Type.Epic] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Epic))
			{
				for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
				{
					this.World.Assets.EL_addEquipmentEssence(rank, -equipment_essence_need[rank]);
				}
				item.EL_upgradeRank();
			}

			local result = {
				Item = this.UIDataHelper.convertItemToUIData(item, true, this.Const.UI.ItemOwner.Stash),
				Assets = this.m.Parent.queryAssetsInformation()
			};
			return result;
		}

		o.EL_onRecraftItem <- function( _itemIndex )
		{
			local item = this.Stash.getItemAtIndex(_itemIndex).item;
			if (!this.m.Shop.isRepairOffered() && item != null)
			{
				return null;
			}
			if(item == null)
			{
				return null;
			}
			local equipment_essence_need = item.EL_getRecraftEquipmentEssenceNum();
			for(local rank = 0; rank < this.Const.EL_Item.Type.Epic; ++rank)
			{
				if(equipment_essence_need[rank] > this.World.Assets.EL_getEquipmentEssence(rank))
				{
					local num = this.Math.ceil((equipment_essence_need[rank] - this.World.Assets.EL_getEquipmentEssence(rank)) / this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank]);
					equipment_essence_need[rank + 1] += num;
					equipment_essence_need[rank] -= num * this.Const.EL_Item_Other.EquipmentEssenceRankDownFactor[rank];
				}
			}
			
			if(equipment_essence_need[this.Const.EL_Item.Type.Legendary] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Legendary) &&
			   equipment_essence_need[this.Const.EL_Item.Type.Epic] <= this.World.Assets.EL_getEquipmentEssence(this.Const.EL_Item.Type.Epic))
			{
				for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
				{
					this.World.Assets.EL_addEquipmentEssence(rank, -equipment_essence_need[rank]);
				}
				item.EL_recraft();
			}

			local result = {
				Item = this.UIDataHelper.convertItemToUIData(item, true, this.Const.UI.ItemOwner.Stash),
				Assets = this.m.Parent.queryAssetsInformation()
			};
			return result;
		}

		o.EL_onDisassembleItem <- function( _itemIndex )
		{
			local item = this.Stash.getItemAtIndex(_itemIndex).item;
			if (!this.m.Shop.isRepairOffered() && item != null)
			{
				return null;
			}
			if(item == null)
			{
				return null;
			}
			local equipment_essence_need = item.EL_getDisassembleEquipmentEssenceNum();
			for(local rank = 0; rank <= this.Const.EL_Item.Type.Legendary; ++rank)
			{
				this.World.Assets.EL_addEquipmentEssence(rank, equipment_essence_need[rank]);
			}
			this.World.Statistics.getFlags().increment("DisassembleGreyEssenceGain", equipment_essence_need[this.Const.EL_Item.Type.Normal]);
			item.EL_disassemble(_itemIndex);

			local result = {
				Result = 0,
				Assets = this.m.Parent.queryAssetsInformation(),
				Shop = [],
				Stash = [],
				StashSpaceUsed = this.Stash.getNumberOfFilledSlots(),
				StashSpaceMax = this.Stash.getCapacity(),
				IsRepairOffered = this.m.Shop.isRepairOffered()
			};
			this.UIDataHelper.convertItemsToUIData(this.m.Shop.getStash().getItems(), result.Shop, this.Const.UI.ItemOwner.Shop);
			result.Stash = this.UIDataHelper.convertStashToUIData(false, this.m.InventoryFilter);
			return result;
		}
	});
});