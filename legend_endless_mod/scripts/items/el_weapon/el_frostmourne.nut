this.el_frostmourne <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 0
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "el_weapon.frostmourne";
		this.m.Name = "霜之哀伤";
		this.m.Description = "一把吞噬灵魂的魔剑。霜之哀伤本是巫妖王阿尔萨斯的手中利器，死亡骑士的代表之剑。如同其名字，这是一把带着邪恶的强大力量，却又带着哀伤的悲剧色彩的神器。在灰烬圣裁军攻破冰冠堡垒后，霜之哀伤被灰烬使者所摧毁，阿尔萨斯也被杀死。伯瓦尔命令黑锋骑士团将其重铸，用于将寒冷和死亡带给来自异界的恶魔大军。";
		this.m.IconLarge = "weapons/melee/frostmourne.png";
		this.m.Icon = "weapons/melee/frostmourne_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Sword;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.IsDroppedAsLoot = false;
		this.m.ArmamentIcon = "icon_legend_crusader_sword_01";
		this.m.ShieldDamage = 32;
		this.m.Condition = 72.0;
		this.m.ConditionMax = 72.0;
		this.m.StaminaModifier = -26;
		this.m.RegularDamage = 85;
		this.m.RegularDamageMax = 100;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.35;
		this.m.ChanceToHitHead = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skillToAdd = this.new("scripts/skills/el_actives/el_lichking_overhead_strike");
		skillToAdd.setStunChance(this.m.StunChance);
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
        local skillToAdd = this.new("scripts/skills/el_actives/el_lichking_split");
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
        skillToAdd = this.new("scripts/skills/el_actives/el_lichking_swing");
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 5);
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/el_actives/el_lichking_swing");
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/el_actives/el_lichking_strengthen");
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/el_actives/el_lichking_death_summon");
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/el_actives/el_lichking_death_coil");
        skillToAdd.EL_setRankLevel(this.m.EL_RankLevel);
		this.addSkill(skillToAdd);
		this.addSkill(this.new("scripts/skills/el_effects/el_soul_energy_state_effect"));		
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();		
		for(local i = 0; i < result.len(); ++i)
		{
			if(result[i].type == "text" && result[i].text == "——————————————")
			{
				result.insert(i, {
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "灵魂能量的上限会随着灵魂能量的获取而逐渐提升，但上限的最大值由霜之哀伤的等阶决定"
				});
				result.insert(i, {
					id = 9,
					type = "text",
					icon = "ui/tooltips/soul_energy.png",
					text = "灵魂能量：" + this.World.Assets.EL_getSoulEnergy() + " / " + this.World.Assets.EL_getSoulEnergyMax()
				});
				result.insert(i, {
					id = 8,
					type = "text",
					icon = "ui/icons/special.png",
					text = "周围 " + EL_getAffectRange() + " 格内有敌方单位死亡时获取灵魂能量。"
				});
				return result;
			}
		}
		result.push({
			id = 8,
			type = "text",
			icon = "ui/icons/special.png",
			text = "周围 " + EL_getAffectRange() + " 格内有敌方单位死亡时获取灵魂能量。"
		});
		result.push({
			id = 9,
			type = "text",
			icon = "ui/icons/special.png",
			text = "灵魂能量：" + this.World.Assets.EL_getSoulEnergy() + " / " + this.World.Assets.EL_getSoulEnergyMax()
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "灵魂能量的上限会随着灵魂能量的获取而逐渐提升，但上限的最大值由霜之哀伤的等阶决定"
		});
		return result;
	}

	function getRepair()
	{
		return this.item.getRepairMax();
	}

	function EL_getAffectRange()
	{
		local range_item = this.Const.EL_LichKing.Weapon.DeathCoil.BaseSkillRangeMax + this.m.EL_RankLevel * this.Const.EL_LichKing.Weapon.DeathCoil.SkillRangeMaxRankFactor;
		local range_hitpoints = this.Const.EL_LichKing.Weapon.DeathCoil.BaseSkillRangeMax + this.Math.floor(this.getContainer().getActor().getHitpointsMax() / 100);
		return this.Math.min(range_item, range_hitpoints);
	}

	function EL_generateByRankAndLevel( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
	{
		this.weapon.EL_generateByRankAndLevel(_EL_rankLevel, EL_level);
		EL_addRepairEntry();
	}

    function EL_upgradeRank()
    {
        this.weapon.EL_upgradeRank();
        EL_addRepairEntry();
    }

    function EL_recraft()
    {
        this.weapon.EL_recraft();
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

