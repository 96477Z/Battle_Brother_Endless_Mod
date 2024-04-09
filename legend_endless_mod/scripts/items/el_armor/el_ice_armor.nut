this.el_ice_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "el_armor.body.ice_armor";
		this.m.Name = "寒冰护甲";
		this.m.Description = "一套狰狞可怖的战甲，充满了邪恶与冰冷的力量，伴随着微不可闻的灵魂哀嚎声。凝视它时仿佛看到一个个若隐若现的灵魂在其上扭曲、挣扎。";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = true;
		this.m.IsIndestructible = true;
		//
		this.m.Variant = 51;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 600;
		this.m.ConditionMax = 600;
		this.m.StaminaModifier = -45;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Legendary;
	}

	function updateVariant()
	{
		this.armor.updateVariant();
		this.m.IconLarge = "armor/ice_armor.png";
		this.m.Icon = "armor/icon_ice_armor.png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();
		for(local i = 0; i < result.len(); ++i)
		{
			if(result[i].type == "text" && result[i].text == "——————————————")
			{
				result.insert(i, {
					id = 9,
					type = "text",
					icon = "ui/icons/special.png",
					text = "向周围散发死亡灵气，最大范围：" + EL_getSkillRange()
				});
				result.insert(i, {
					id = 8,
					type = "text",
					icon = "ui/tooltips/soul_energy.png",
					text = "灵魂能量：" + this.World.Assets.EL_getSoulEnergy() + " / " + this.World.Assets.EL_getSoulEnergyMax()
				});
				return result;
			}
		}
		result.push({
            id = 8,
            type = "text",
			icon = "ui/tooltips/soul_energy.png",
            text = "灵魂能量：" + this.World.Assets.EL_getSoulEnergy() + " / " + this.World.Assets.EL_getSoulEnergyMax()
		});
		result.push({
			id = 6,
			type = "text",
            icon = "ui/icons/special.png",
			text = "向周围散发死亡灵气，最大范围：" + EL_getSkillRange()
		});
		return result;
	}

	function EL_getSkillRange()
	{
		local range_item = this.Const.EL_LichKing.Weapon.DeathCoil.BaseSkillRangeMax + this.m.EL_RankLevel * this.Const.EL_LichKing.Weapon.DeathCoil.SkillRangeMaxRankFactor;
		local range_hitpoints = this.Const.EL_LichKing.Weapon.DeathCoil.BaseSkillRangeMax + this.Math.floor(this.getContainer().getActor().getHitpointsMax() / 100);
		return this.Math.min(range_item, range_hitpoints);
	}

	function getRepair()
	{
		return this.item.getRepairMax();
	}

	function EL_generateByRankAndLevel( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
	{
		this.armor.EL_generateByRankAndLevel(_EL_rankLevel, EL_level);
		EL_addRepairEntry();
	}

    function EL_upgradeRank()
    {
        this.armor.EL_upgradeRank();
        EL_addRepairEntry();
    }

    function EL_recraft()
    {
        this.armor.EL_recraft();
        EL_addRepairEntry();
    }

    function EL_disassemble(_itemIndex)
    {
    }

    function EL_addRepairEntry()
    {
        for(local index = 0; index < this.m.EL_EntryList.len(); ++index)
        {
            if(this.m.EL_EntryList[index].getID() == "el_special_entry.repair_by_engrgy")
            {
                this.m.EL_EntryList.remove(index);
            }
        }
        local entry = this.new("scripts/skills/el_entrys/special_entrys/el_repair_by_engrgy_entry");
        EL_addEntryToList(entry);
    }

	function EL_getUpgradeLevelSoulEnergy()
	{
		return (1 + this.EL_getLevel()) * this.Const.EL_LichKing.SoulEnergy.UpgradeLevelConsumptionFactor;
	}

	function EL_getUpgradeRankSoulEnergy()
	{
		return this.EL_getRankLevel() == this.EL_getRankLevelMax() ? 200 : this.Math.max((this.EL_getRankLevel() + 1)* this.Const.EL_LichKing.SoulEnergy.UpgradeRankConsumptionFactor, this.World.Assets.m.EL_SoulEnergy);
	}

	function EL_getRecraftSoulEnergy()
	{
		return this.Const.EL_LichKing.SoulEnergy.RecraftConsumption * (this.EL_getRankLevel() + 1);
	}
});

