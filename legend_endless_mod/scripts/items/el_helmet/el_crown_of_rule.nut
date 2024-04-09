this.el_crown_of_rule <- this.inherit("scripts/items/helmets/helmet", {
	m = {
		EL_ControlList = []
	},
	function create()
	{
		this.helmet.create();
		this.m.ID = "el_armor.head.crown_of_rule";
		this.m.Name = "统御之冠";
		this.m.Description = "一个利用暗影界的至臻技艺打造而成的头盔，代表了死者之王的身份。将没有亡灵能抵抗它的意志。";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = false;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.IsIndestructible = true;
		this.m.HideHelmetIfDestroyed = false;
        //
		this.m.Variant = 60;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 600.0;
		this.m.ConditionMax = 600.0;
		this.m.StaminaModifier = -35;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Legendary;
	}

	function updateVariant()
	{
		this.helmet.updateVariant();
		this.m.Icon = "helmets/crown_of_rule.png";
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();
		for(local i = 0; i < result.len(); ++i)
		{
			if(result[i].type == "text" && result[i].text == "——————————————")
			{
				result.insert(i, {
					id = 9,
					type = "text",
					icon = "ui/icons/special.png",
					text = "支配能力：" + EL_getControlAbility() + " / " + EL_getControlAbilityMax()
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
			id = 9,
			type = "text",
			text = "支配能力：" + EL_getControlAbility() + " / " + EL_getControlAbilityMax()
		});
		return result;
	}

	function onEquip()
	{
		this.helmet.onEquip();
		local skillToAdd = this.new("scripts/skills/el_actives/el_lichking_dominate");
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
		
	}
    
	function EL_getControlAbility()
	{
		local result = 0;
		for(local i = 0; i < this.m.EL_ControlList.len(); ++i)
		{
			if(this.m.EL_ControlList[i].Entity != null && this.m.EL_ControlList[i].Entity.isAlive() && !this.m.EL_ControlList[i].Entity.isDying())
			{
				result += this.m.EL_ControlList[i].Strength;
			}
			else
			{
				this.m.EL_ControlList.remove(i);
				--i;
			}
		}
        return result;
	}
    
	function EL_getControlAbilityMax()
	{
		local actor = null;
		if (this.getContainer() != null)
		{
			if (this.getContainer().getActor() != null)
			{
				actor = this.getContainer().getActor();
			}
		}
		if(actor == null) {
			return 0;
		}
		return this.Math.min(actor.getBravery(), 50 + this.m.EL_Level * this.Const.EL_LichKing.Helmet.ControlAbilityMaxLevelFactor);
	}

	function EL_addEntityToControlList( _actor, _strength, _AIagent )
	{
		this.m.EL_ControlList.push({
			Entity = _actor,
			Strength = _strength,
			OriginalAgent = _AIagent
		});
		EL_updateEntityControlList()
	}

	function EL_updateEntityControlList()
	{
		while(EL_getControlAbility() > EL_getControlAbilityMax())
		{
			this.m.EL_ControlList[0].Entity.setAIAgent(this.m.EL_ControlList[0].OriginalAgent);
			this.m.EL_ControlList[0].Entity.setFaction(this.Const.Faction.Enemy);
			this.m.EL_ControlList[0].Entity.m.IsControlledByPlayer = false;
			this.m.EL_ControlList[0].Entity.m.IsSummoned = false;
			this.Tactical.EventLog.logEx(this.m.EL_ControlList[0].Entity.getName() + " 脱离了统御之冠的控制");
			this.m.EL_ControlList.remove(0);
		}
	}

	function getRepair()
	{
		return this.item.getRepairMax();
	}

	function EL_generateByRankAndLevel( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
	{
		this.helmet.EL_generateByRankAndLevel(_EL_rankLevel, EL_level);
		EL_addRepairEntry();
	}

    function EL_upgradeRank()
    {
        this.helmet.EL_upgradeRank();
        EL_addRepairEntry();
    }

    function EL_recraft()
    {
        this.helmet.EL_recraft();
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

