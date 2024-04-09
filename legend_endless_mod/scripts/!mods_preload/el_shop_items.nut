local gt = getroottable();

::mods_registerMod("el_shop_items", 1, "el_shop_items");
::mods_queue(null, "el_item", function ()
{
    ::mods_hookDescendants("entity/world/settlement", function(obj)
	{
		while (!("onUpdateShopList" in obj))
		{
			obj = obj[obj.SuperName];
		}

		local onUpdateShopListFunc = obj.onUpdateShopList;
		obj.onUpdateShopList <- function( _id, _list )
		{
			if ( _id == "building.marketplace")
			{
				_list.extend([
					{
                        R = 85,
                        P = 1.0,
                        S = "accessory/alp_trophy_item"
                    },
                    {
                        R = 90,
                        P = 1.0,
                        S = "accessory/hexen_trophy_item"
                    },
                    {
                        R = 85,
                        P = 1.0,
                        S = "accessory/ghoul_trophy_item"
                    },
                    {
                        R = 0,
                        P = 1.0,
                        S = "el_misc/el_core_item"
                    }
				]);
			}
			if ( _id == "building.armorsmith") 
			{
				_list.extend([
					{
                        R = 80,
                        P = 1.0,
                        S = "accessory/alp_trophy_item"
                    },
                    {
                        R = 85,
                        P = 1.0,
                        S = "accessory/hexen_trophy_item"
                    },
                    {
                        R = 80,
                        P = 1.0,
                        S = "accessory/ghoul_trophy_item"
                    },
                    {
                        R = 95,
                        P = 3.0,
                        S = "accessory/sergeant_badge_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    }
				]);
			}
			if ( _id == "building.weaponsmith") 
			{
				_list.extend([
					{
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    }
				]);
			}
            if ( _id == "building.armorsmith_oriental")
            {
				_list.extend([
					{
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    }
				]);
			}
            if ( _id == "building.weaponsmith_oriental")
            {
				_list.extend([
					{
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 10,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    },
                    {
                        R = 50,
                        P = 1.0,
                        S = "el_supplies/el_equipment_essence_rank_0_item"
                    }
				]);
			}
			foreach( loc in this.m.AttachedLocations )
			{
				if (loc.isActive())
				{
					loc.onUpdateShopList(_id, _list);
				}
			}
			onUpdateShopListFunc( _id, _list );
		}
	});
    
    ::mods_hookBaseClass("entity/world/settlements/buildings/building", function(o) {
		while(!("fillStash" in o)) o = o[o.SuperName];
		o.fillStash = function( _list, _stash, _priceMult, _allowDamagedEquipment = false )
        {
            _stash.clear();
            local rarityMult = this.getSettlement().getModifiers().RarityMult;
            local foodRarityMult = this.getSettlement().getModifiers().FoodRarityMult;
            local medicineRarityMult = this.getSettlement().getModifiers().MedicalPriceMult;
            local mineralRarityMult = this.getSettlement().getModifiers().MineralRarityMult;
            local buildingRarityMult = this.getSettlement().getModifiers().BuildingRarityMult;
            local isTrader = this.World.Retinue.hasFollower("follower.trader");
            
            local follower_exist = this.World.Retinue.hasFollower("follower.cook");
            local EL_worldLevel = this.Math.min(this.World.Assets.m.EL_WorldLevel, this.Const.EL_Shop.EL_ShopLevelMax);
            //this.logInfo("当前世界等级" + EL_worldLevel);
            local EL_coreMaxNum = this.Const.EL_Shop.EL_Core.EL_ShopMaxNum * (1 + EL_worldLevel * this.Const.EL_Shop.EL_ItemNumberLevelFactor);
            local EL_maxNumitems = this.Const.EL_Shop.EL_ShopMaxNumitems * (1 + EL_worldLevel * this.Const.EL_Shop.EL_ItemNumberLevelFactor);
            local EL_maxNum = this.Const.EL_Shop.EL_ShopMaxNum * (1 + EL_worldLevel * this.Const.EL_Shop.EL_ItemNumberLevelFactor);
            local EL_hasEssence = false;

            foreach( i in _list )
            {
                local r = i.R;
                local p = this.Math.rand(0, 100) * rarityMult;
                //this.logInfo(i.S+" r:"+r+" p:"+p);
                if( p >= r )
                {
                    r = r + p;
                    for( local num = 1; true;  )
                    {
                        p = this.Math.rand(0, 100) * rarityMult;
                        local item;
                        local isHelm = false;
                        local isArmor = false;
                        local isUpgrade = false;
                        local script = i.S;
                        if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
                        {
                            local index = script.find("helmets/");

                            if (index != null && script.find("legend_helmets") == null)
                            {
                                isHelm = true;
                                script = script.slice(index + "helmets/".len());
                            }

                            index = script.find("armor/");

                            if (index != null && script.find("legend_armor") == null)
                            {
                                isArmor = true;
                                script = script.slice(index + "armor/".len());
                            }

                            index = script.find("armor_upgrades/");

                            if (index != null && script.find("legend_armor") == null)
                            {
                                isUpgrade = true;
                                script = script.slice(index + "armor_upgrades/".len());
                            }
                        }


                        if (isHelm)
                        {
                            item = this.Const.World.Common.pickHelmet([
                                [
                                    1,
                                    script
                                ]
                            ]);
                        }
                        else if (isArmor)
                        {
                            item = this.Const.World.Common.pickArmor([
                                [
                                    1,
                                    script
                                ]
                            ]);
                        }
                        else if (isUpgrade)
                        {
                            item = this.Const.World.Common.pickArmorUpgrade([
                                [
                                    1,
                                    script
                                ]
                            ]);
                        }
                        else
                        {
                            item = this.new("scripts/items/" + i.S);
                        }
                        
                        local EL_isEssence = false;
                        if(item.getID() == "el_supplies.equipment_essence_rank_0")
                        {
                            EL_isEssence = true;
                            EL_hasEssence = true;
                        }
                        local EL_isCore = item.getName() == "Core";
                        local isFood = item.isItemType(this.Const.Items.ItemType.Food);
                        local isMedicine = item.getID() == "supplies.medicine";
                        local isMineral = item.getID() == "misc.uncut_gems" || item.getID() == "misc.copper_ingots" || item.getID() == "misc.gold_ingots" || item.getID() == "misc.iron_ingots";
                        local isBuilding = item.getID() == "misc.quality_wood" || item.getID() == "misc.copper_ingots" || item.getID() == "misc.tin_ingots" || item.getID() == "misc.iron_ingots";
                        //this.logInfo(" isFood："+isFood+" p："+p+" r:"+r);
                        while (p >= r && num < EL_coreMaxNum)
                        {
                            ++num;
                            //this.logInfo("生成运算中finalNum" + num);
                            //this.logInfo("p=" + p + "r=" + r);
                            if (r != 0 || rarityMult < 1.0 || isFood && foodRarityMult < 1.0 || isMedicine && medicineRarityMult < 1.0 || isMineral && mineralRarityMult < 1.0 || isBuilding && buildingRarityMult < 1.0)
                            {
                                r = r + p;
                            }
                        }
                        if(EL_isCore)
                        {
                            ++num;
                        }
                        
                        //this.logInfo("final p："+p+" r:"+r);
                        num += p / r;
                        if(EL_isCore || isFood || isMedicine || isMineral || isBuilding || item.isItemType(this.Const.Items.ItemType.TradeGood))
                        {
                            num = this.Math.round(num * (1 + EL_worldLevel * this.Const.EL_Shop.EL_ItemNumberLevelFactor) * this.World.Assets.EL_getHalfWorldDifficultFactor());
                        }
                        //this.logInfo("EL_getHalfWorldDifficultFactor:" + this.World.Assets.EL_getHalfWorldDifficultFactor());
                        EL_maxNum = (!isTrader && item.isItemType(this.Const.Items.ItemType.TradeGood)) ? EL_maxNumitems : EL_maxNum;
                        EL_maxNum = EL_isCore ? EL_coreMaxNum : EL_maxNum;
                        EL_maxNum = (num > EL_maxNum) ? EL_maxNum : num;
                        if(isFood && follower_exist)
                        {
                            EL_maxNum = this.Math.round(EL_maxNum * this.Const.EL_Shop.EL_FoodNumMult);
                        }
                        else if(item.isItemType(this.Const.Items.ItemType.TradeGood) && isTrader)
                        {
                            EL_maxNum *= 2;
                        }
                        
                        //this.logInfo("生成运算中EL_maxNum" + EL_maxNum);
                        for(local index = 0; index < EL_maxNum; ++index)
                        {
                            if (isHelm)
                            {
                                item = this.Const.World.Common.pickHelmet([
                                    [
                                        1,
                                        script
                                    ]
                                ]);
                            }
                            else if (isArmor)
                            {
                                item = this.Const.World.Common.pickArmor([
                                    [
                                        1,
                                        script
                                    ]
                                ]);
                            }
                            else if (isUpgrade)
                            {
                                item = this.Const.World.Common.pickArmorUpgrade([
                                    [
                                        1,
                                        script
                                    ]
                                ]);
                            }
                            else if (EL_isCore)
                            {
			                    local xp_level = EL_worldLevel;
                                local r = this.Math.rand(1, 100000);
                                local core_rank = 0;
                                if(r <= this.Const.EL_Shop.EL_EpicCoreChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    core_rank = 3;
                                }
                                else if(r <= this.Const.EL_Shop.EL_FineCoreChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    core_rank = 2;
                                }
                                else if(r <= this.Const.EL_Shop.EL_PremiumCoreChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    core_rank = 1;
                                }
                                else
                                {
                                    core_rank = 0;
                                    xp_level = this.Math.rand(this.Math.max(1 ,EL_worldLevel - this.Const.EL_Item_Other.MinLevelInEventAndCraft), EL_worldLevel - this.Const.EL_Item_Other.MaxLevelInEventAndCraft);
                                }
                                item = this.new("scripts/items/el_misc/el_core_rank_" + core_rank + "_item");
                                local core_xp = this.Const.EL_Shop.EL_Core.XPOffset - this.Math.pow(this.Math.rand(this.Math.pow(this.Const.EL_Shop.EL_Core.XPMin[core_rank], 4), this.Math.pow(this.Const.EL_Shop.EL_Core.XPMax[core_rank], 4)), 0.25);
                                //this.logInfo("core_xp:" + core_xp);
                                core_xp *= this.Math.pow(this.Const.EL_NPC.EL_LevelUp.XPFactor, this.Math.max(0, xp_level - this.Const.EL_NPC.EL_LevelUp.LevelUpsOffset));
                                //this.logInfo("xp_level:" + xp_level);
                                //this.logInfo("mult:" + this.Math.pow(this.Const.EL_NPC.EL_LevelUp.XPFactor, this.Math.max(1, xp_level - this.Const.EL_NPC.EL_LevelUp.LevelUpsOffset)));
                                item.EL_generateCoreXPByActorXP(10 * core_xp);
                            }
                            else if(EL_isEssence)
                            {                                
                                local r = this.Math.rand(1, 100000);
                                local essence_rank = 0;
                                if(r <= this.Const.EL_Shop.EL_LegendaryEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    essence_rank = 4;
                                }
                                else if(r <= this.Const.EL_Shop.EL_EpicEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    essence_rank = 3;
                                }
                                else if(r <= this.Const.EL_Shop.EL_FineEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    essence_rank = 2;
                                }
                                else if(r <= this.Const.EL_Shop.EL_PremiumEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
                                {
                                    essence_rank = 1;
                                }
                                item = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + essence_rank + "_item");
                                item.EL_setAmount(this.Const.EL_Shop.EL_EquipmentEssence.NumEachGroup[essence_rank]);
                                item.setValue(item.EL_getAmount() * this.Const.EL_Shop.EL_EquipmentEssence.PriceEachOne[essence_rank]);
                            }
                            else
                            {
                                item = this.new("scripts/items/" + i.S);
                            }
                            //this.logInfo("item ID:"+item.getID());
                            
                            if (!isFood || p * foodRarityMult >= i.R)
                            {
                                if (!isMedicine || p * medicineRarityMult >= i.R)
                                {
                                    if (!isMineral || p * mineralRarityMult >= i.R)
                                    {
                                        if (!isBuilding || p * buildingRarityMult >= i.R)
                                        {
                                            local items = [
                                                item
                                            ];

                                            if (isArmor || isHelm)
                                            {
                                                local upgrades = item.getUpgrades();

                                                foreach( i, u in upgrades )
                                                {
                                                    if (u != 1)
                                                    {
                                                        continue;
                                                    }

                                                    local upgrade = item.getUpgrade(i);
                                                    upgrade.m.Armor = null;
                                                    items.push(upgrade);
                                                    item.m.Upgrades[i] = null;
                                                }
                                            }
                                        
                                            foreach( item in items )
                                            {
                                                if (_allowDamagedEquipment && item.getConditionMax() > 1)
                                                {
                                                    local random = this.Math.rand(1, 100);
                                                    if (random <= 50)
                                                    {
                                                        local condition = this.Math.rand(item.getConditionMax() * 0.4, item.getConditionMax() * 0.9);
                                                        item.setCondition(condition);
                                                    }
                                                }
                                                item.setPriceMult(i.P * _priceMult);
                                                _stash.add(item);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        break;
                        
                    }
                }
            }
            // if(EL_hasEssence)
            // {
            //     local r = this.Math.rand(1, 100000);
            //     local item;
            //     local essence_rank = 0;
            //     if(r <= this.Const.EL_Shop.EL_LegendaryEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
            //     {
            //         essence_rank = 4;
            //         item = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + essence_rank + "_item");
            //         item.EL_setAmount(this.Const.EL_Shop.EL_EquipmentEssence.NumEachGroup[essence_rank]);
            //         item.setValue(item.EL_getAmount() * this.Const.EL_Shop.EL_EquipmentEssence.PriceEachOne[essence_rank]);
            //         item.setPriceMult(_priceMult);
            //         _stash.add(item);
            //     }
            //     if(r <= this.Const.EL_Shop.EL_EpicEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
            //     {
            //         essence_rank = 3;
            //         item = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + essence_rank + "_item");
            //         item.EL_setAmount(this.Const.EL_Shop.EL_EquipmentEssence.NumEachGroup[essence_rank]);
            //         item.setValue(item.EL_getAmount() * this.Const.EL_Shop.EL_EquipmentEssence.PriceEachOne[essence_rank]);
            //         item.setPriceMult(_priceMult);
            //         _stash.add(item);
            //     }
            //     if(r <= this.Const.EL_Shop.EL_FineEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
            //     {
            //         essence_rank = 2;
            //         item = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + essence_rank + "_item");
            //         item.EL_setAmount(this.Const.EL_Shop.EL_EquipmentEssence.NumEachGroup[essence_rank]);
            //         item.setValue(item.EL_getAmount() * this.Const.EL_Shop.EL_EquipmentEssence.PriceEachOne[essence_rank]);
            //         item.setPriceMult(_priceMult);
            //         _stash.add(item);
            //     }
            //     if(r <= this.Const.EL_Shop.EL_PremiumEquipmentEssenceChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
            //     {
            //         essence_rank = 1;
            //         item = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + essence_rank + "_item");
            //         item.EL_setAmount(this.Const.EL_Shop.EL_EquipmentEssence.NumEachGroup[essence_rank]);
            //         item.setValue(item.EL_getAmount() * this.Const.EL_Shop.EL_EquipmentEssence.PriceEachOne[essence_rank]);
            //         item.setPriceMult(_priceMult);
            //         _stash.add(item);
            //     }
            // }
            _stash.sort();
        }
	});
});
