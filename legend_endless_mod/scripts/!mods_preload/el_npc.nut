local gt = getroottable();

::mods_registerMod("el_npc", 1, "el_npc");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/racial/champion_racial", function ( o )
	{
        local create = o.create;
        o.create = function()
        {
            create();
            this.m.IsHidden = true;
        }

		o.onUpdate = function ( _properties )
		{
            local actor = this.getContainer().getActor();
            local level = this.Math.max(actor.EL_getLevel(), this.Const.EL_NPC.EL_Champion.MaxGrowthLevel);
            local rank = actor.EL_getRankLevel();

            this.m.Name = this.Const.EL_NPC.EL_Champion.Name[rank];
            this.m.Icon = this.Const.EL_NPC.EL_Champion.Icon[rank];
            this.m.IconMini = this.Const.EL_NPC.EL_Champion.IconMini[rank];
            if(actor.getFaction() == this.Const.Faction.Player || actor.getFaction() == this.Const.Faction.PlayerAnimals) {
                _properties.Bravery += this.Const.EL_NPC.EL_Champion.Attributes.Bravery[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.Bravery[rank];
                _properties.Stamina += this.Const.EL_NPC.EL_Champion.Attributes.Fatigue[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.Fatigue[rank];
                _properties.Initiative += this.Const.EL_NPC.EL_Champion.Attributes.Initiative[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.Initiative[rank];
                _properties.MeleeSkill += this.Const.EL_NPC.EL_Champion.Attributes.MeleeSkill[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.MeleeSkill[rank];
                _properties.RangedSkill += this.Const.EL_NPC.EL_Champion.Attributes.RangedSkill[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.RangedSkill[rank];
                _properties.MeleeDefense += this.Const.EL_NPC.EL_Champion.Attributes.MeleeDefense[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.MeleeDefense[rank];
                _properties.RangedDefense += this.Const.EL_NPC.EL_Champion.Attributes.RangedDefense[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.RangedDefense[rank];

                _properties.DamageReceivedTotalMult /= this.Const.EL_NPC.EL_Champion.DamageReceivedTotalDiv[rank];
                _properties.DamageTotalMult *= this.Const.EL_NPC.EL_Champion.DamageTotalMult[rank];

                _properties.ActionPoints += this.Const.EL_NPC.EL_Champion.ActionPointsOffset[rank];

                _properties.EL_CombatLevel += this.Const.EL_NPC.EL_Champion.CombatLevelOffset[rank];
            }
            else {
                _properties.Bravery += this.Const.EL_NPC.EL_Champion.Attributes.Bravery[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.Bravery[rank];
                _properties.Stamina += this.Const.EL_NPC.EL_Champion.Attributes.Fatigue[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.Fatigue[rank];
                _properties.Initiative += this.Const.EL_NPC.EL_Champion.Attributes.Initiative[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.Initiative[rank];
                _properties.MeleeSkill += this.Const.EL_NPC.EL_Champion.Attributes.MeleeSkill[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.MeleeSkill[rank];
                _properties.RangedSkill += this.Const.EL_NPC.EL_Champion.Attributes.RangedSkill[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.RangedSkill[rank];
                _properties.MeleeDefense += this.Const.EL_NPC.EL_Champion.Attributes.MeleeDefense[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.MeleeDefense[rank];
                _properties.RangedDefense += this.Const.EL_NPC.EL_Champion.Attributes.RangedDefense[rank] + level * this.Const.EL_NPC.EL_Champion.AttributesGrowthPurLevel.RangedDefense[rank];

                _properties.DamageReceivedTotalMult /= this.Const.EL_NPC.EL_Champion.DamageReceivedTotalDiv[rank];
                _properties.DamageTotalMult *= this.Const.EL_NPC.EL_Champion.DamageTotalMult[rank];

                _properties.ActionPoints += this.Const.EL_NPC.EL_Champion.ActionPointsOffset[rank];

                _properties.EL_CombatLevel += this.Const.EL_NPC.EL_Champion.CombatLevelOffset[rank];
            }

        };


	});


	::mods_hookNewObject("entity/tactical/tactical_entity_manager", function(o)
    {
        o.m.EL_EquipmentEssenceNum <- [0,0,0,0,0];

        o.EL_getEquipmentEssenceNum <- function ()
        {
            return this.m.EL_EquipmentEssenceNum;
        }

        o.EL_addEquipmentEssenceNum <- function ( _array )
        {
            for(local i = 0; i <= this.Const.EL_Item.Type.Legendary; ++i)
            {
                this.m.EL_EquipmentEssenceNum[i] += _array[i];
            }
        }

		o.setupEntity = function (_e, _t)
		{
            _e.setWorldTroop(_t);
            _e.setFaction(_t.Faction);

            if (("Callback" in _t) && _t.Callback != null)
            {
                _t.Callback(_e, "Tag" in _t ? _t.Tag : null);
            }

            if (!this.World.getTime().IsDaytime && _e.getBaseProperties().IsAffectedByNight)
            {
                _e.getSkills().add(this.new("scripts/skills/special/night_effect"));
            }

            if (("Name" in _t) && _t.Name != "")
            {
                _e.setName(_t.Name);
                _e.m.IsGeneratingKillName = false;
            }

            local npc_level = 0;
            if(_t.EL_RankLevel != 0) {
                npc_level = this.World.Assets.m.EL_WorldLevel;
            }
            else {
                npc_level = this.Math.rand(this.World.Assets.m.EL_WorldLevel + this.Const.EL_NPC.EL_Troop.MinLevelOffset, this.World.Assets.m.EL_WorldLevel + this.Const.EL_NPC.EL_Troop.MaxLevelOffset)
            }
            if(npc_level > this.Const.EL_NPC.EL_Troop.MaxLevel) {
                npc_level = this.Const.EL_NPC.EL_Troop.MaxLevel;
            }
            else if(npc_level < this.Const.EL_NPC.EL_Troop.MinLevel) {
                npc_level = this.Const.EL_NPC.EL_Troop.MinLevel;
            }

            _e.EL_buildNPCPropertiesByLevel(npc_level);
            //this.logInfo("_t.EL_ExtraCombatLevel " + _t.EL_ExtraCombatLevel);
            _e.EL_setCombatLevel(this.Math.min(this.Const.EL_NPC.EL_Troop.MaxCalculateLevel, npc_level) + _t.EL_ExtraCombatLevel);
            _e.EL_setRankLevel(_t.EL_RankLevel);
            if (_t.EL_RankLevel != 0)
            {
                _e.makeMiniboss();
            }


            if(_t.EL_UnitInfo == null) {

                _e.EL_assignRandomEquipment();
                local extra_normal_buff_num = 0;
                local extra_elite_buff_num = 0;
                local extra_leader_buff_num = 0;
                if(_t.EL_IsBossUnit == true) {
                    extra_elite_buff_num = this.Const.EL_NPC.EL_NPCBuff.Num.BossUnitExtraRank1;
                    extra_leader_buff_num = this.Const.EL_NPC.EL_NPCBuff.Num.BossUnitExtraRank2;
                }
                if(_e.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null &&
                   _e.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
                {
                    extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank0[_t.EL_RankLevel];
                    extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank1[_t.EL_RankLevel];
                    extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank2[_t.EL_RankLevel];
                }
                else
                {
                    extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank0[_t.EL_RankLevel];
                    extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank1[_t.EL_RankLevel];
                    extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank2[_t.EL_RankLevel];
                }
                local chance = this.World.Assets.EL_getWorldDifficultFactor() * 100 - 100;
                while(true) {
                    local r = this.Math.rand(1, this.Const.EL_NPC.EL_Troop.ExtraBuffRollMax);
                    if(r > chance) {
                        break;
                    }
                    chance -= this.Const.EL_NPC.EL_Troop.ExtraBuffRollMax;
                    if(_t.EL_RankLevel == 2)
                    {
                        extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[2];
                        extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[2];
                        extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[2];
                    }
                    else if(_t.EL_RankLevel == 1)
                    {
                        extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[1];
                        extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[1];
                        extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[1];
                    }
                    else
                    {
                        extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[0];
                        extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[0];
                        extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[0];
                    }
                }
                extra_normal_buff_num += _t.EL_ExtraBuffNum[0];
                extra_elite_buff_num += _t.EL_ExtraBuffNum[1];
                extra_leader_buff_num += _t.EL_ExtraBuffNum[2];
                if(_e.getFaction() != this.Const.Faction.Player && _e.getFaction() != this.Const.Faction.PlayerAnimals) {
                    this.Const.EL_NPC.EL_NPCBuff.EL_assignNPCBuffs(_e, extra_normal_buff_num, extra_elite_buff_num, extra_leader_buff_num);
                }
                _e.EL_afterEntityBuild();
            }
            else {

            }
		}

	});


    ::mods_hookNewObject("skills/skill_container", function(o) {
        //while(!("add" in o)) o = o[o.SuperName];
        o.EL_reset <- function() {
            foreach( skill in this.m.Skills )
            {
                skill.EL_reset();
            }
        }

        o.EL_onOtherSkillUesd <- function ( _skill, _targetEntity ){
            foreach( skill in this.m.Skills )
            {
                skill.EL_onOtherSkillUesd( _skill, _targetEntity );
            }
        }
    });

	::mods_hookExactClass("entity/tactical/actor", function(o){
		o.m.EL_NPCLevel <- 0;
        o.m.EL_EquipmentEssenceDrop <- [0, 0, 0, 0, 0];
        o.m.EL_IsNonHumanoid <- false;


		local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			onSerialize( _out );
			_out.writeI32(this.m.EL_NPCLevel);
            for(local i = 0; i < this.m.EL_EquipmentEssenceDrop.len(); ++i) {
                _out.writeI32(this.m.EL_EquipmentEssenceDrop[i]);
            }
            _out.writeBool(this.m.EL_IsNonHumanoid);
		}
		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize( _in );
			this.m.EL_NPCLevel = _in.readI32();
            for(local i = 0; i < this.m.EL_EquipmentEssenceDrop.len(); ++i) {
                this.m.EL_EquipmentEssenceDrop[i] = _in.readI32();
            }
            this.m.EL_IsNonHumanoid = _in.readBool();
		}

        o.isGuest <- function() {
            return true;
        }

        o.EL_isNonHumanoid <- function() {
            return this.m.EL_IsNonHumanoid;
        }

        o.EL_isBossUnit <- function() {
            return this.m.WorldTroop != null && this.m.WorldTroop.EL_IsBossUnit == true;
        }

        o.EL_getStrength <- function() {
            if(this.EL_isBossUnit()) {
                return 1000;
            }
            return this.m.EL_NPCLevel;
        }

        o.EL_getLevel <- function() {
            return this.m.EL_NPCLevel;
        }

        o.getLevel <- function() {
            return this.m.EL_NPCLevel;
        }

        o.EL_resetOtherStates <- function() {
            this.getSkills().add(this.new("scripts/skills/effects/msu_injuries_handler_effect"));
            this.getSkills().add(this.new("scripts/skills/effects/ptr_formidable_approach_debuff_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_follow_up_proccer_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_bolstered_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_polearm_hitchance_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_immersive_damage_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_inspired_by_champion_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_inspiring_presence_buff_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_armor_fatigue_recovery_effect"));
			this.getSkills().add(this.new("scripts/skills/effects/ptr_direct_damage_limiter_effect"));
            this.getSkills().add(this.new("scripts/skills/effects/battle_standard_effect"));
            this.getSkills().add(this.new("scripts/skills/effects/wms_mastery_effect"));
			this.getSkills().add(this.new("scripts/skills/el_entrys/el_total_entry"));
            this.getSkills().add(this.new("scripts/skills/el_effects/el_lichking_halo_effect"));
			local flags = this.getFlags();
			if (flags.has("undead") && !flags.has("ghost") && !flags.has("ghoul") && !flags.has("vampire"))
			{
				this.getSkills().add(this.new("scripts/skills/effects/ptr_undead_injury_receiver_effect"));
			}
            if (this.m.MoraleState != this.Const.MoraleState.Ignore)
			{
				this.getSkills().add(this.new("scripts/skills/special/morale_check"));
			}
            this.getSkills().EL_reset();
        }

		local onInit = o.onInit;
		o.onInit = function() {
			onInit();
			if (this.m.MoraleState != this.Const.MoraleState.Ignore)
			{
				this.m.Skills.add(this.new("scripts/skills/effects/battle_standard_effect"));
			}
			this.m.Skills.add(this.new("scripts/skills/el_entrys/el_total_entry"));
            this.getSkills().add(this.new("scripts/skills/el_effects/el_lichking_halo_effect"));
			return;
		}

        o.makeMiniboss = function() {
            this.m.Skills.add(this.new("scripts/skills/racial/champion_racial"));
            this.m.IsMiniboss = true;
            this.m.IsGeneratingKillName = false;
            return true;
        }

        o.EL_buildNPCPropertiesByLevel <- function( _EL_npcLevel ) {
            this.m.EL_NPCLevel = this.Math.min(_EL_npcLevel, this.Const.EL_NPC.EL_LevelUp.MaxPropertiesLevel);
            local level_ups = this.m.EL_NPCLevel;
            if(level_ups > this.Const.EL_NPC.EL_LevelUp.MaxXPLevel) {
                level_ups = this.Const.EL_NPC.EL_LevelUp.MaxXPLevel + (level_ups - this.Const.EL_NPC.EL_LevelUp.MaxXPLevel) * this.Const.EL_NPC.EL_LevelUp.PropertiesLevelUpMultAfterMaxXPLevel;
            }
            level_ups -= this.Const.EL_NPC.EL_LevelUp.LevelUpsOffset + this.Const.EL_NPC.EL_LevelUp.LevelUpsCombatLevelOffect[this.World.Assets.getCombatDifficulty()];
            if(level_ups < 0) {
                level_ups = 0;
            }
            this.m.BaseProperties.Hitpoints += this.Math.floor(this.m.BaseProperties.Hitpoints *
                                                               this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.HitpointsMult *
                                                               level_ups);
            this.m.BaseProperties.Bravery += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.Bravery * level_ups);
            this.m.BaseProperties.Stamina += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.Fatigue * level_ups);
            this.m.BaseProperties.Initiative += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.Initiative * level_ups);
            this.m.BaseProperties.MeleeSkill += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.MeleeSkill * level_ups);
            this.m.BaseProperties.RangedSkill += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.RangedSkill * level_ups);
            this.m.BaseProperties.MeleeDefense += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.MeleeDefense * level_ups);
            this.m.BaseProperties.RangedDefense += this.Math.floor(this.Const.EL_NPC.EL_LevelUp.LevelUpAttributes.RangedDefense * level_ups);
            this.m.XP += this.Const.EL_NPC.EL_Champion.XP.Offset[this.m.EL_RankLevel];
            this.m.XP *= this.Const.EL_NPC.EL_Champion.XP.Mult[this.m.EL_RankLevel];

            this.m.XP *= this.Math.pow(this.Const.EL_NPC.EL_LevelUp.XPFactor, this.Math.min(level_ups, this.Const.EL_World.EL_WorldLevel.BaseStableLevel));
            this.m.XP = this.Math.floor(this.m.XP * this.World.Assets.EL_getHalfWorldDifficultFactor());
            this.getSkills().add(this.new("scripts/skills/el_racials/el_npc_ballance_racial"));
        }

        o.EL_buildEquipmentEssenceDrop <- function() {

            local accessory = this.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
            local rank = 0;
            local rank_essence = 0;
            local normal_essence = 0;
            if(accessory == null) {
                rank = this.EL_getRankLevel();
            }
            else {
                rank = this.Math.min(3, this.Math.max(this.EL_getRankLevel(), accessory.EL_getRankLevel()));
            }
            if(this.EL_isBossUnit()) {
                this.m.EL_EquipmentEssenceDrop[4] = this.Const.EL_NPC.EL_Troop.EquipmentEssence.BossDropLengendaryNum[this.World.Assets.getCombatDifficulty()];
            }
            else if(this.EL_getRankLevel() == 2) {
                local r = this.Math.rand(1, 100);
                local chance = this.Const.EL_NPC.EL_Troop.EquipmentEssence.LeaderDropLengendaryChance * this.World.Assets.EL_getWorldDifficultFactor() * this.World.Assets.EL_getWorldDifficultFactor();
                if(r <= chance) {
                    this.m.EL_EquipmentEssenceDrop[4] = 1;
                }
            }
            local extra_combat_level = this.getBaseProperties().EL_CombatLevel - this.Math.min(this.Const.EL_NPC.EL_Troop.MaxCalculateLevel, this.EL_getLevel());
            rank_essence = this.Const.EL_NPC.EL_Troop.EquipmentEssence.DropBaseNum;
            if(extra_combat_level > 0) {
                rank_essence += extra_combat_level * this.Const.EL_NPC.EL_Troop.EquipmentEssence.DropPurExtraCombatLevelPositive;
            }
            else if(extra_combat_level < 0) {
                rank_essence += extra_combat_level * this.Const.EL_NPC.EL_Troop.EquipmentEssence.DropPurExtraCombatLevelNegative;
            }
            normal_essence = rank_essence * this.Math.pow(this.Const.EL_NPC.EL_Troop.EquipmentEssence.NormalDropMultPurRank, rank);
            normal_essence *= (1 + this.EL_getLevel() * this.Const.EL_NPC.EL_Troop.EquipmentEssence.NormalDropLevelMult);
            this.m.EL_EquipmentEssenceDrop[0] = this.Math.ceil(normal_essence * this.World.Assets.EL_getHalfWorldDifficultFactor());
            if(this.EL_getRankLevel() > 0) {
                this.m.EL_EquipmentEssenceDrop[rank] = this.Math.ceil(rank_essence * this.World.Assets.EL_getHalfWorldDifficultFactor());
            }
        }

        o.EL_afterEntityBuild <- function() {
            this.EL_buildEquipmentEssenceDrop();
            if(this.EL_isBossUnit()) {
                if(this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
                {
                    this.getSkills().add(this.new("scripts/skills/el_entrys/rarity_entrys/el_boss_entry"));
                }
            }
        }

		o.getName = function()
		{
			return this.m.Name + " - Lv" + this.Math.min(this.m.EL_NPCLevel, this.Const.EL_NPC.EL_Troop.MaxCalculateLevel) + "(" + ((this.Math.round(this.EL_getCombatLevel() * 10) * 0.1)) + ")";
		}

        local kill = o.kill;
        o.kill = function( _killer = null, _skill = null, _fatalityType = this.Const.FatalityType.None, _silent = false )
        {

            if(_killer != null && (_killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)) {
				this.World.Statistics.getFlags().set("EL_IfPlayerPartyKilled", true);
            }
            if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
            {
                if(this.World.Assets.m.EL_DropParty == null) {
                    this.World.Assets.m.EL_DropParty = this.new("scripts/entity/world/party");
                    this.World.Assets.m.EL_DropParty.EL_setFaction(this.Const.Faction.Enemy);
                    this.World.Assets.m.EL_DropParty.EL_tempPartyInit();
                    this.World.Assets.m.EL_DropParty.EL_setTroopsResourse(0);
                    this.World.Assets.m.EL_DropParty.m.Name = "EL_DropOnly";
                }
                local party = this.World.Assets.m.EL_DropParty;
                for(local i = 0; i < this.m.EL_EquipmentEssenceDrop.len(); ++i) {
                    party.EL_addEquipmentEssence(i, this.m.EL_EquipmentEssenceDrop[i]);
                }
                local items = this.getItems();
                local accessory = items == null ? null : items.getItemAtSlot(this.Const.ItemSlot.Accessory);
                if(accessory != null && accessory.getID() == "el_accessory.core") {
                    local core = this.new("scripts/items/el_misc/el_core_rank_" + accessory.EL_getRankLevel() + "_item");
                    core.EL_generateCoreXPByActorXP(this.Math.floor(this.getXP()));
                    party.EL_addLootItem(core);
                }
            }

            if (_killer != null && _killer.getFaction() == this.Const.Faction.Player && (this.Const.EL_Misc.EL_MagicStone.AllScenariosDrop || _killer.getSkills().hasSkill("el_racial.magic_thief")))
            {
                 local npc_buffs = [];
                local skills = this.getSkills().m.Skills;
                foreach(skill in skills) {
                    if(skill.EL_isNPCBuff()) {
                        npc_buffs.push(skill);
                    }
                }
                if(npc_buffs.len() != 0) {
                    local buff_level = npc_buffs[0].EL_getRankLevel();
                    if(this.Math.rand(1, 100) <= this.Const.EL_Misc.EL_MagicStone.DropChance[buff_level]) {
                        if(this.World.Assets.m.EL_DropParty == null) {
                            this.World.Assets.m.EL_DropParty = this.new("scripts/entity/world/party");
                            this.World.Assets.m.EL_DropParty.EL_setFaction(this.Const.Faction.Enemy);
                            this.World.Assets.m.EL_DropParty.EL_tempPartyInit();
                            this.World.Assets.m.EL_DropParty.EL_setTroopsResourse(0);
                            this.World.Assets.m.EL_DropParty.m.Name = "EL_DropOnly";
                        }
                        local party = this.World.Assets.m.EL_DropParty;

                        local magic_stone = this.new("scripts/items/el_misc/el_npc_buff_stone_item");
                        magic_stone.EL_generateByNPCBuffs(npc_buffs);

                        party.EL_addLootItem(magic_stone);
                    }
                }
            }

            kill(_killer, _skill, _fatalityType, _silent);
        }

	});

	::mods_hookClass("entity/world/world_entity", function(o) {
		while(!("getTroops" in o)) o = o[o.SuperName];
        o.m.EL_FinishGenerate <- false;
        o.m.EL_IsTempParty <- false;
		o.m.EL_IsBossParty <- false;
        o.m.EL_IsEliteParty <- false;
        o.m.EL_IsPlayer <- false;
        o.m.EL_HaveRandomLeader <- false;
        o.m.EL_HaveStrongestLeader <- false;
        o.m.EL_TroopsResourse <- 0;
        o.m.EL_LootEquipmentEssence <- [0, 0, 0, 0, 0];
        o.m.EL_Faction <- 0;
        o.m.EL_LootItems <- [];

        o.isAlliedWithPlayer = function()
        {
            return (this.EL_getFaction() != 0 && (this.EL_getFaction() == this.Const.FactionType.Player || this.World.FactionManager.isAlliedWithPlayer(this.EL_getFaction()))) || this.getFaction() == 0 || this.getFaction() == this.Const.FactionType.Player || this.World.FactionManager.isAlliedWithPlayer(this.getFaction());
        }


        o.EL_tempPartyInit <- function() {
            this.getFaction <- function() { return this.EL_getFaction(); };
            this.m.EL_IsTempParty = true;
        }

        o.EL_setFaction <- function( _EL_Faction )
        {
            this.m.EL_Faction = _EL_Faction;
        }

        o.EL_getFaction <- function()
        {
            return this.m.EL_Faction;
        }

        local removeTroop = o.removeTroop;
		o.removeTroop = function( _t )
        {
            if(!this.m.EL_FinishGenerate) {
                this.m.EL_FinishGenerate = true;
            }
            return removeTroop(_t);
		}

        local clearTroops = o.clearTroops;
		o.clearTroops = function()
        {
            clearTroops();
            this.m.EL_LootEquipmentEssence = [0, 0, 0, 0, 0];
            this.m.EL_LootItems = [];
            this.m.EL_FinishGenerate = false;
            local world_level = this.World.Assets.m.EL_WorldLevel;
            local resources_mult = 0.01 * this.Math.rand(this.Const.EL_NPC.EL_Troop.Resourse.MultBase, this.Const.EL_NPC.EL_Troop.Resourse.MultBase + world_level * this.Const.EL_NPC.EL_Troop.Resourse.MultPurWorldLevel);
            resources_mult = this.Math.rand(0, 1) == 1 ? resources_mult : (1 / resources_mult);
            this.m.EL_TroopsResourse = this.Math.round(this.World.Assets.m.EL_WorldStrength * resources_mult);
		}

		o.getTroopComposition = function()
        {
            if(!this.m.EL_FinishGenerate) {
                this.m.EL_FinishGenerate = true;
            }
            local entities = [];
            local champions = [];
            local entityTypes = [
                [],
                [],
                []
            ];
            entityTypes[0].resize(this.Const.EntityType.len(), 0);
            entityTypes[1].resize(this.Const.EntityType.len(), 0);
            entityTypes[2].resize(this.Const.EntityType.len(), 0);

            foreach( t in this.m.Troops )
            {
                if (t.Script.len() != "")
                {
                    if (t.EL_IsBossUnit)
                    {
                        champions.push(t);
                    }
                    else
                    {
                        ++entityTypes[t.EL_RankLevel][t.ID];
                    }
                }
            }

            foreach( c in champions )
            {
                entities.push({
                    id = 20,
                    type = "text",
                    icon = "ui/orientation/" + this.Const.EntityIcon[c.ID] + ".png",
                    text = c.Name
                });
            }
            for( local j = 1; j >= 0; --j ) {
                for( local i = 0; i < entityTypes[j].len(); ++i )
                {
                    if (entityTypes[j][i] > 0)
                    {
                        entities.push({
                            id = 20,
                            type = "text",
                            icon = "ui/orientation/" + this.Const.EntityIcon[i] + ".png",
                            text = this.Const.EL_NPC.EL_Troop.NamePrefix[j] + this.removeFromBeginningOfText("The ", this.Const.Strings.EntityName[i]) + " X " + entityTypes[j][i] + " " + this.Const.EL_NPC.EL_Troop.NameSuffix[j]
                        });
                    }
                }
            }
            return entities;
        }

		o.updateStrength = function()
        {
            if (!this.isAlive())
            {
                return;
            }
            if(this.m.EL_IsBossParty) {
                this.m.Strength = 99999999;
            }
            else {
                local unit_strength = 0;
                local unit_population = 0;
                for(local i = 0; i < this.m.Troops.len(); ++i) {
                    unit_strength += this.m.Troops[i].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[i].EL_RankLevel];
                    if(this.m.Troops[i].Strength <= 20) {
                        unit_population += this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[i].EL_RankLevel];
                    }
                    else {
                        unit_population += this.Math.ceil(this.m.Troops[i].Strength / this.Const.EL_NPC.EL_Troop.StrengthPurPopulation) * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[i].EL_RankLevel];
                    }
                }
                this.m.Strength = unit_strength * (1 + this.Math.pow(unit_population / this.Const.EL_NPC.EL_Troop.TotalResourse.Factor1, this.Const.EL_NPC.EL_Troop.TotalResourse.Factor2));
            }
            this.m.Strength = this.Math.max(this.m.Strength, this.m.EL_TroopsResourse);
            if (!this.m.EL_IsTempParty && this.hasLabel("name"))
            {
                if (!this.isPlayerControlled())
                {
                    if (this.m.Troops.len() != 0 && this.m.IsShowingStrength)
                    {
                        this.getLabel("name").Text = this.getName() + " (" + this.m.Troops.len() + ")";
                    }
                    else
                    {
                        this.getLabel("name").Text = this.getName();
                    }
                }
            }
        }

		o.dropMoney = function( _num, _lootTable )
        {
            _num = this.Math.max(0, this.Math.round(_num * this.m.LootScale * (1 + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.DropIncreaseMultPurWorldLevel.Money) * this.World.Assets.EL_getHalfWorldDifficultFactor()));

            if (_num == 0)
            {
                return;
            }

            local money = this.new("scripts/items/supplies/money_item");
            money.setAmount(_num);
            _lootTable.push(money);
		}

		o.dropFood = function( _num, _items, _lootTable )
        {
            _num = this.Math.max(0, this.Math.round(_num * this.m.LootScale * (1 + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.DropIncreaseMultPurWorldLevel.Food) * this.World.Assets.EL_getHalfWorldDifficultFactor()));

            if (_num == 0)
            {
                return;
            }

            for( local i = 0; i != _num; i = i )
            {
                local food = this.new("scripts/items/supplies/" + _items[this.Math.rand(0, _items.len() - 1)]);
                food.randomizeAmount();
                food.randomizeBestBefore();
                _lootTable.push(food);
                i = ++i;
            }
		}

		o.dropTreasure = function( _num, _items, _lootTable )
        {
            _num = this.Math.max(0, this.Math.floor(_num * this.m.LootScale * (1 + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.DropIncreaseMultPurWorldLevel.Treasure) * this.World.Assets.EL_getHalfWorldDifficultFactor()));

            if (_num == 0)
            {
                return;
            }

            for( local i = 0; i != _num; i = i )
            {
                local item = this.new("scripts/items/" + _items[this.Math.rand(0, _items.len() - 1)]);
                _lootTable.push(item);
                i = ++i;
            }
		}

		o.dropAmmo = function( _num, _lootTable )
        {
            _num = this.Math.max(0, this.Math.round(_num * this.m.LootScale * (1 + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.DropIncreaseMultPurWorldLevel.Ammo) * this.World.Assets.EL_getHalfWorldDifficultFactor()));

            if (_num == 0)
            {
                return;
            }

            local ammo = this.new("scripts/items/supplies/ammo_item");
            ammo.setAmount(_num);
            _lootTable.push(ammo);
		}

		o.dropArmorParts = function( _num, _lootTable )
        {
            _num = this.Math.max(0, this.Math.round(_num * this.m.LootScale * (1 + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.DropIncreaseMultPurWorldLevel.ArmorParts) * this.World.Assets.EL_getHalfWorldDifficultFactor()));

            if (_num == 0)
            {
                return;
            }

            local armorParts = this.new("scripts/items/supplies/armor_parts_item");
            armorParts.setAmount(_num);
            _lootTable.push(armorParts);
		}

		o.dropMedicine = function( _num, _lootTable )
        {
            _num = this.Math.max(0, this.Math.round(_num * this.m.LootScale * (1 + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.DropIncreaseMultPurWorldLevel.Medicine) * this.World.Assets.EL_getHalfWorldDifficultFactor()));

            if (_num == 0)
            {
                return;
            }

            local medicine = this.new("scripts/items/supplies/medicine_item");
            medicine.setAmount(_num);
            _lootTable.push(medicine);
		}

        local create = o.create;
		o.create = function()
        {
            create();
            if(!this.World.Flags.has("EL_WorldDifficultyChangeEvent")) {
				this.World.Flags.set("EL_WorldDifficultyChangeEvent", this.Const.EL_World.EL_WorldChangeEvent.DefaultOption);
			}
            local world_level = this.World.Assets.m.EL_WorldLevel;
            local elite_team_chance = this.Const.EL_NPC.EL_EliteTeam.EliteTeamChance.EL_getChance(world_level);
            local random_leader_chance = 0;
            local strongest_leader_chance = 0;
            local follower_exist = this.World.Retinue.hasFollower("follower.bounty_hunter");
            if(elite_team_chance * 10 >= this.Math.rand(1, 1000)) {
                this.m.EL_IsEliteParty = true;
            }
            if(this.m.EL_IsEliteParty) {
                random_leader_chance = this.Const.EL_NPC.EL_EliteTeam.RandomLeaderChance.EL_getChance(world_level);
                strongest_leader_chance = this.Const.EL_NPC.EL_EliteTeam.StrongestLeaderChance.EL_getChance(world_level);
            }
            else {
                random_leader_chance = this.Const.EL_NPC.EL_NormalTeam.RandomLeaderChance.EL_getChance(world_level);
                strongest_leader_chance = this.Const.EL_NPC.EL_NormalTeam.StrongestLeaderChance.EL_getChance(world_level);
            }
            if(follower_exist) {
                random_leader_chance = random_leader_chance * 2 + 20;
                strongest_leader_chance = strongest_leader_chance * 2 + 20;
            }
            if(random_leader_chance * 10 >= this.Math.rand(1, 1000)) {
                this.m.EL_HaveRandomLeader = true;
            }
            if(strongest_leader_chance * 10 >= this.Math.rand(1, 1000)) {
                this.m.EL_HaveStrongestLeader = true;
            }
            local resources_mult = 0.01 * this.Math.rand(this.Const.EL_NPC.EL_Troop.Resourse.MultBase, this.Const.EL_NPC.EL_Troop.Resourse.MultBase + world_level * this.Const.EL_NPC.EL_Troop.Resourse.MultPurWorldLevel);
            resources_mult = this.Math.rand(0, 1) == 1 ? resources_mult : (1 / resources_mult);
            this.m.EL_TroopsResourse = this.Math.round(this.World.Assets.m.EL_WorldStrength * resources_mult);
		}

		o.onSerialize = function( _out )
        {
            _out.writeString(this.m.Name);
            _out.writeString(this.m.Description);
            _out.writeI32(this.m.EL_Faction);
            _out.writeU8(this.Math.min(255, this.m.Troops.len()));

            foreach( t in this.m.Troops )
            {
                _out.writeU16(t.ID);
                _out.writeU8(t.Variant);
                _out.writeF32(t.Strength);
                _out.writeI8(t.Row);
                _out.writeString(t.Name);

                _out.writeF32(t.EL_EliteChance);
                _out.writeI32(t.EL_ExtraCombatLevel);
                _out.writeI32(t.EL_RankLevel);
                _out.writeI32(t.EL_RankLevelMin);
                _out.writeBool(t.EL_IsBossUnit);
                _out.writeI32(t.EL_ExtraBuffNum[0]);
                _out.writeI32(t.EL_ExtraBuffNum[1]);
                _out.writeI32(t.EL_ExtraBuffNum[2]);

                if ("Outfits" in t)
                {
                    _out.writeBool(true);
                    _out.writeU8(t.Outfits.len());

                    foreach( o in t.Outfits )
                    {
                        _out.writeU8(o.len());
                        _out.writeU8(o[0]);
                        _out.writeString(o[1]);

                        if (o.len() == 3)
                        {
                            _out.writeString(o[2]);
                        }
                    }
                }
                else
                {
                    _out.writeBool(false);
                }

                _out.writeI32(this.IO.scriptHashByFilename(t.Script));
            }

            _out.writeI32(this.m.CombatID);
            _out.writeI32(this.m.CombatSeed);
            _out.writeF32(this.m.VisionRadius);
            _out.writeF32(this.m.VisibilityMult);
            local numInventoryItems = this.m.Inventory.len();
            _out.writeI32(numInventoryItems);

            for( local i = 0; i < numInventoryItems; i = i )
            {
                _out.writeString(this.m.Inventory[i]);
                i = ++i;
            }

            _out.writeF32(this.m.LootScale);
            _out.writeBool(this.m.IsAttackable);
            _out.writeBool(this.m.IsAttackableByAI);
            _out.writeBool(this.m.IsUsingGlobalVision);
            _out.writeBool(this.m.IsShowingName);
            _out.writeBool(this.m.IsLooting);
            _out.writeBool(this.m.IsDroppingLoot);
            _out.writeU16(this.m.Resources);
            this.m.Flags.onSerialize(_out);

            _out.writeBool(this.m.EL_IsTempParty);
            _out.writeBool(this.m.EL_FinishGenerate);
            _out.writeBool(this.m.EL_IsBossParty);
            _out.writeBool(this.m.EL_IsEliteParty);
            _out.writeBool(this.m.EL_IsPlayer);
            _out.writeBool(this.m.EL_HaveRandomLeader);
            _out.writeBool(this.m.EL_HaveStrongestLeader);
            _out.writeI32(this.m.EL_TroopsResourse);


            _out.writeBool(false);
        }

		o.onDeserialize = function( _in )
        {
            this.getSprite("selection").Visible = false;
            this.setSpriteOffset("selection", this.createVec(-30, 30));
            this.m.Troops = [];
            this.m.Strength = 0;
            this.m.Inventory = [];
            this.m.Name = _in.readString();
            this.m.Description = _in.readString();
            this.m.EL_Faction = _in.readI32();
            if (this.hasLabel("name"))
            {
                this.getLabel("name").Text = this.getName();
            }

            local numTroops = _in.readU8();

            for( local i = 0; i < numTroops; i = i )
            {
                local troop = clone this.Const.World.Spawn.Unit;
                troop.ID = _in.readU16();
                troop.Variant = _in.readU8();
                troop.Strength = _in.readF32();
                troop.Row = _in.readI8();
                troop.Party = this.WeakTableRef(this);
                troop.Faction = this.getFaction();
                troop.Name = _in.readString();



                troop.EL_EliteChance = _in.readF32();
                troop.EL_ExtraCombatLevel = _in.readI32();
                troop.EL_RankLevel = _in.readI32();
                troop.EL_RankLevelMin = _in.readI32();
                troop.EL_IsBossUnit = _in.readBool();
                troop.EL_ExtraBuffNum = [0, 0, 0];
                troop.EL_ExtraBuffNum[0] = _in.readI32();
                troop.EL_ExtraBuffNum[1] = _in.readI32();
                troop.EL_ExtraBuffNum[2] = _in.readI32();
                local hasOutfits = _in.readBool();

                if (hasOutfits)
                {
                    local outfits = [];
                    local outfitLength = _in.readU8();

                    for( local i = 0; i < outfitLength; i++ )
                    {
                        if (_in.readU8() == 2)
                        {
                            outfits.push([
                                _in.readU8(),
                                _in.readString()
                            ]);
                        }
                        else
                        {
                            outfits.push([
                                _in.readU8(),
                                _in.readString(),
                                _in.readString()
                            ]);
                        }
                    }

                    troop.Outfits <- clone outfits;
                }
                local hash = _in.readI32();

                if (hash != 0)
                {
                    troop.Script = this.IO.scriptFilenameByHash(hash);
                }

                if (troop.Script == "scripts/entity/tactical/enemies/alp_illusion")
                {
                }
                else
                {
                    this.m.Troops.push(troop);
                }

                i = ++i;
            }

            this.updateStrength();
            this.m.CombatID = _in.readI32();

            if (_in.getMetaData().getVersion() >= 49)
            {
                this.m.CombatSeed = _in.readI32();
            }

            this.m.VisionRadius = _in.readF32();
            this.m.VisibilityMult = _in.readF32();
            local numInventoryItems = _in.readI32();

            for( local i = 0; i != numInventoryItems; i = i )
            {
                this.m.Inventory.push(_in.readString());
                i = ++i;
            }

            this.m.LootScale = _in.readF32();
            this.m.IsAttackable = _in.readBool();
            this.m.IsAttackableByAI = _in.readBool();
            this.m.IsUsingGlobalVision = _in.readBool();
            this.m.IsShowingName = _in.readBool();
            this.m.IsLooting = _in.readBool();
            this.m.IsDroppingLoot = _in.readBool();
            this.m.Resources = _in.readU16();

            if (this.hasLabel("name"))
            {
                this.getLabel("name").Visible = true;
            }

            this.m.Flags.onDeserialize(_in);

            this.m.EL_IsTempParty = _in.readBool();
            this.m.EL_FinishGenerate = _in.readBool();
            this.m.EL_IsBossParty = _in.readBool();
            this.m.EL_IsEliteParty = _in.readBool();
            this.m.EL_IsPlayer = _in.readBool();
            this.m.EL_HaveRandomLeader = _in.readBool();
            this.m.EL_HaveStrongestLeader = _in.readBool();
            this.m.EL_TroopsResourse = _in.readI32();


            _in.readBool();
        }

        o.EL_getTroopsResourse <- function() {
            return this.m.EL_TroopsResourse;
        }

        o.EL_setTroopsResourse <- function( _EL_troopsResourse ) {
            this.m.EL_TroopsResourse = _EL_troopsResourse;
        }

        o.EL_setHaveRandomLeader <- function( _EL_haveRandomLeader ) {
            this.m.EL_HaveRandomLeader = _EL_haveRandomLeader;
        }

        o.EL_setHaveStrongestLeader <- function( _EL_haveStrongestLeader ) {
            this.m.EL_HaveStrongestLeader = _EL_haveStrongestLeader;
        }

        o.EL_setIsBossParty <- function( _EL_IsBossParty ) {
            this.m.EL_IsBossParty = _EL_IsBossParty;
        }

        o.EL_setIsEliteParty <- function( _EL_IsEliteParty ) {
            this.m.EL_IsEliteParty = _EL_IsEliteParty;
        }

        o.EL_emptyTroops <- function() {
            this.m.Troops = [];
        }



		o.EL_addTroop <- function( _EL_troop )
        {
            if(this.m.EL_IsPlayer) {
                return;
            }
            if(_EL_troop.Strength == 0) {
                _EL_troop.Strength = this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.CrticalPoint;
            }
            local max_troop_num = 0;
            if(this.m.EL_IsBossParty) {
                max_troop_num = this.Const.EL_NPC.EL_Troop.MaxTroopNum;
            }
            else {
                max_troop_num = this.Math.min(this.Const.EL_NPC.EL_Troop.MaxTroopNum, this.Const.EL_NPC.EL_Troop.BaseMaxTroopNum + this.World.Assets.m.EL_WorldLevel * this.Const.EL_NPC.EL_Troop.MaxTroopNumAddPurWorldLevel);
            }
            if(_EL_troop.EL_RankLevelMin == 3) {
                _EL_troop.EL_IsBossUnit = true;
                _EL_troop.EL_RankLevelMin = 2;
            }
            if(this.m.EL_FinishGenerate) {
                local troop_info = this.Const.EL_NPC.EL_Troop.EL_getTroopInfo(_EL_troop);
                //Calculate ranks, level, combat level.
                if(_EL_troop.EL_RankLevel != 0) {
                }
                else if(troop_info.EL_IsBossUnit) {
                    _EL_troop.EL_RankLevel = 2;
                    _EL_troop.EL_IsBossUnit = true;
                }
                else if(troop_info.EL_IsWeakUnit) {
                    _EL_troop.EL_RankLevel = this.Math.max(0, _EL_troop.EL_RankLevelMin);
                }
                else {
                    if(this.m.EL_IsBossParty) {
                        _EL_troop.EL_RankLevel = this.Math.max(1, _EL_troop.EL_RankLevelMin);
                        if(_EL_troop.EL_RankLevel == 2) {
                            _EL_troop.EL_IsBossUnit = true;
                        }
                    }
                    else if(this.m.EL_IsEliteParty) {
                        _EL_troop.EL_RankLevel = this.Math.max(1, _EL_troop.EL_RankLevelMin);
                    }
                    else {
                        local elite_chance = this.Const.EL_NPC.EL_NormalTeam.EliteChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) + _EL_troop.EL_EliteChance;
                        elite_chance *= this.World.Assets.EL_getWorldDifficultFactor();
                        if(troop_info.EL_IsEliteUnit)
                        {
                            elite_chance *= this.Const.EL_NPC.EL_Troop.EliteUnitEliteChanceMult;
                        }
                        _EL_troop.EL_RankLevel = this.Math.max((this.Math.rand(1, 1000) >= elite_chance * 10) ? 0 : 1, _EL_troop.EL_RankLevelMin);
                    }
                }
                _EL_troop.EL_ExtraCombatLevel = troop_info.EL_ExtraCombatLevel;
                //Build names
                if(_EL_troop.EL_IsBossUnit) {
                    _EL_troop.Name = this.Const.EL_NPC.EL_Troop.NamePrefix[_EL_troop.EL_RankLevel];
                    _EL_troop.Name += this.Const.EL_NPC.EL_Troop.Name[this.Math.rand(0, this.Const.EL_NPC.EL_Troop.Name.len() - 1)];
                    _EL_troop.Name += this.Const.EL_NPC.EL_Troop.NameSuffix[_EL_troop.EL_RankLevel];
                }
                _EL_troop.EL_ExtraBuffNum[0] = 0;
                _EL_troop.EL_ExtraBuffNum[1] = 0;
                _EL_troop.EL_ExtraBuffNum[2] = 0;
                if(_EL_troop.EL_IsBossUnit) {

                }
                else if(this.m.EL_IsBossParty) {
                    _EL_troop.EL_ExtraBuffNum[_EL_troop.EL_RankLevel] = 2;
                }
                else if(this.m.EL_IsEliteParty) {
                    _EL_troop.EL_ExtraBuffNum[_EL_troop.EL_RankLevel] = 1;
                }

                local i = 0;
                for( ; i < this.m.Troops.len(); ++i) {
                    if(_EL_troop.Strength > this.m.Troops[i].Strength) {
                        this.m.Troops.insert(i, _EL_troop);
                        break;
                    }
                }
                if(i == this.m.Troops.len()) {
                    this.m.Troops.push(_EL_troop);
                }
                while(this.m.Troops.len() > max_troop_num) {
                    for(local i = this.m.Troops.len() - 1; i >= 0; --i) {
                        if(this.m.Troops[i].EL_RankLevel != 2) {
                            this.m.Troops.remove(i);
                            break;
                        }
                    }
                }
                this.updateStrength();
            }
            else {
                //Puts the troop in the temp troops.
                local i = 0;
                for(; i < this.m.Troops.len(); ++i) {
                    if(_EL_troop.Strength > this.m.Troops[i].Strength) {
                        this.m.Troops.insert(i, _EL_troop);
                        break;
                    }
                }
                if(i == this.m.Troops.len()) {
                    this.m.Troops.push(_EL_troop);
                }
                while(this.m.Troops.len() > max_troop_num) {
                    this.m.Troops.remove(max_troop_num);
                }
                //Calculate current troop info.
                local troops_info = [];
                for(local i = 0; i < this.m.Troops.len(); ++i) {
                    troops_info.push(this.Const.EL_NPC.EL_Troop.EL_getTroopInfo(this.m.Troops[i]));
                }

                //Calculate ranks, level, combat level.
                if(this.m.EL_IsBossParty) {
                    for(local i = 0; i < this.m.Troops.len(); ++i) {
                        //At least two leaders.
                        this.m.Troops[i].EL_ExtraBuffNum[0] = 0;
                        this.m.Troops[i].EL_ExtraBuffNum[1] = 0;
                        this.m.Troops[i].EL_ExtraBuffNum[2] = 0;
                        this.m.Troops[i].EL_IsBossUnit = false;
                        if(troops_info[i].EL_IsBossUnit) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(2, this.m.Troops[i].EL_RankLevelMin);
                            this.m.Troops[i].EL_IsBossUnit = true;
                        }
                        else if(i < this.Const.EL_NPC.EL_Troop.BossTroopMinLeaders) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(2, this.m.Troops[i].EL_RankLevelMin);
                            this.m.Troops[i].EL_IsBossUnit = true;
                        }
                        else if(troops_info[i].EL_IsWeakUnit) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(0, this.m.Troops[i].EL_RankLevelMin);
                        }
                        else {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(1, this.m.Troops[i].EL_RankLevelMin);
                        }
                        this.m.Troops[i].EL_ExtraCombatLevel = troops_info[i].EL_ExtraCombatLevel;
                        if(!this.m.Troops[i].EL_IsBossUnit) {
                            this.m.Troops[i].EL_ExtraBuffNum[this.m.Troops[i].EL_RankLevel] = 2;
                        }
                    }
                }
                else if(this.m.EL_IsEliteParty) {

                    local i = 0;
                    local unit_strength = 0;
                    local unit_population = 0;
                    local used_resourse = 0;
                    local random_leader_avilable_index = [];
                    if(this.m.EL_HaveStrongestLeader && !troops_info[i].EL_IsWeakUnit && this.m.Troops[i].Strength >= this.Const.EL_NPC.EL_Troop.Rank2LeastStrength) {
                        this.m.Troops[i].EL_RankLevel = this.Math.max(2, this.m.Troops[i].EL_RankLevelMin);
                        unit_strength += this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[i].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[i].EL_RankLevel]);
                        unit_population += troops_info[i].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[i].EL_RankLevel];
                        local boss_chance = this.Const.EL_NPC.EL_EliteTeam.LeaderBossChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor();
                        local follower_exist = this.World.Retinue.hasFollower("follower.bounty_hunter");
                        if(follower_exist) {
                            boss_chance = boss_chance * 2 + 20;
                        }
                        if(boss_chance >= this.Math.rand(1, 100)) {
                            this.m.Troops[i].EL_IsBossUnit = true;
                        }
                        ++i;
                    }
                    for(; i < troops_info.len(); ++i) {
                        this.m.Troops[i].EL_ExtraBuffNum[0] = 0;
                        this.m.Troops[i].EL_ExtraBuffNum[1] = 0;
                        this.m.Troops[i].EL_ExtraBuffNum[2] = 0;
                        this.m.Troops[i].EL_IsBossUnit = false;
                        if(troops_info[i].EL_IsBossUnit) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(2, this.m.Troops[i].EL_RankLevelMin);
                            this.m.Troops[i].EL_IsBossUnit = true;
                        }
                        else if(troops_info[i].EL_IsWeakUnit) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(0, this.m.Troops[i].EL_RankLevelMin);
                        }
                        else {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(1, this.m.Troops[i].EL_RankLevelMin);
                            if(this.m.Troops[i].Strength >= this.Const.EL_NPC.EL_Troop.Rank2LeastStrength) {
                                random_leader_avilable_index.push(i);
                            }
                        }

                        this.m.Troops[i].EL_ExtraCombatLevel = troops_info[i].EL_ExtraCombatLevel;
                        unit_strength += this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[i].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[i].EL_RankLevel]);
                        unit_population += troops_info[i].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[i].EL_RankLevel];
                        if(!this.m.Troops[i].EL_IsBossUnit) {
                            this.m.Troops[i].EL_ExtraBuffNum[this.m.Troops[i].EL_RankLevel] = 1;
                        }
                    }
                    if(this.m.EL_HaveRandomLeader && random_leader_avilable_index.len() != 0) {
                        local random_leader_index = random_leader_avilable_index[this.Math.rand(0, random_leader_avilable_index.len() - 1)];
                        unit_strength -= this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[random_leader_index].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[random_leader_index].EL_RankLevel]);
                        unit_population -= troops_info[random_leader_index].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[random_leader_index].EL_RankLevel];
                        this.m.Troops[random_leader_index].EL_RankLevel = this.Math.max(2, this.m.Troops[random_leader_index].EL_RankLevelMin);
                        local boss_chance = this.Const.EL_NPC.EL_EliteTeam.LeaderBossChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor();
                        local follower_exist = this.World.Retinue.hasFollower("follower.bounty_hunter");
                        if(follower_exist) {
                            boss_chance = boss_chance * 2 + 20;
                        }
                        if(boss_chance >= this.Math.rand(1, 100)) {
                            this.m.Troops[random_leader_index].EL_IsBossUnit = true;
                        }
                        if(this.m.Troops[random_leader_index].EL_IsBossUnit) {
                            this.m.Troops[random_leader_index].EL_ExtraBuffNum[0] = 0;
                            this.m.Troops[random_leader_index].EL_ExtraBuffNum[1] = 0;
                            this.m.Troops[random_leader_index].EL_ExtraBuffNum[2] = 0;
                        }
                        else {
                            this.m.Troops[random_leader_index].EL_ExtraBuffNum[2] = this.m.Troops[random_leader_index].EL_ExtraBuffNum[1] + this.m.Troops[random_leader_index].EL_ExtraBuffNum[0];
                            this.m.Troops[random_leader_index].EL_ExtraBuffNum[0] = 0;
                            this.m.Troops[random_leader_index].EL_ExtraBuffNum[1] = 0;
                        }
                        unit_strength += this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[random_leader_index].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[random_leader_index].EL_RankLevel]);
                        unit_population += troops_info[random_leader_index].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[random_leader_index].EL_RankLevel];
                    }
                    used_resourse = unit_strength * (1 + this.Math.pow(unit_population / this.Const.EL_NPC.EL_Troop.TotalResourse.Factor1, this.Const.EL_NPC.EL_Troop.TotalResourse.Factor2));
                    if(used_resourse < this.m.EL_TroopsResourse) {

                    }
                }
                else {
                    local i = 0;
                    local unit_strength = 0;
                    local unit_population = 0;
                    local used_resourse = 0;
                    local random_leader_avilable_index = [];
                    if(this.m.EL_HaveStrongestLeader && !troops_info[i].EL_IsWeakUnit) {
                        this.m.Troops[i].EL_RankLevel = this.Math.max(2, this.m.Troops[i].EL_RankLevelMin);
                        unit_strength += this.Math.min(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[i].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[i].EL_RankLevel]);
                        unit_population += troops_info[i].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[i].EL_RankLevel];
                        local boss_chance = this.Const.EL_NPC.EL_NormalTeam.LeaderBossChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor();
                        local follower_exist = this.World.Retinue.hasFollower("follower.bounty_hunter");
                        if(follower_exist) {
                            boss_chance = boss_chance * 2 + 20;
                        }
                        if(boss_chance >= this.Math.rand(1, 100)) {
                            this.m.Troops[i].EL_IsBossUnit = true;
                        }
                        ++i;
                    }
                    for(; i < troops_info.len(); ++i) {
                        this.m.Troops[i].EL_ExtraBuffNum[0] = 0;
                        this.m.Troops[i].EL_ExtraBuffNum[1] = 0;
                        this.m.Troops[i].EL_ExtraBuffNum[2] = 0;
                        this.m.Troops[i].EL_IsBossUnit = false;
                        if(troops_info[i].EL_IsBossUnit) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(2, this.m.Troops[i].EL_RankLevelMin);
                            this.m.Troops[i].EL_IsBossUnit = true;
                        }
                        else if(troops_info[i].EL_IsWeakUnit) {
                            this.m.Troops[i].EL_RankLevel = this.Math.max(0, this.m.Troops[i].EL_RankLevelMin);
                        }
                        else {
                            local elite_chance = this.Const.EL_NPC.EL_NormalTeam.EliteChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) + this.m.Troops[i].EL_EliteChance;
                            elite_chance *= this.World.Assets.EL_getWorldDifficultFactor();
                            if(troops_info[i].EL_IsEliteUnit)
                            {
                                elite_chance *= this.Const.EL_NPC.EL_Troop.EliteUnitEliteChanceMult;
                            }
                            this.m.Troops[i].EL_RankLevel = this.Math.max((this.Math.rand(1, 1000) >= elite_chance * 10) ? 0 : 1, this.m.Troops[i].EL_RankLevelMin);
                            if(this.m.Troops[i].Strength >= this.Const.EL_NPC.EL_Troop.Rank2LeastStrength) {
                                random_leader_avilable_index.push(i);
                            }
                        }

                        this.m.Troops[i].EL_ExtraCombatLevel = troops_info[i].EL_ExtraCombatLevel;
                        unit_strength += this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[i].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[i].EL_RankLevel]);
                        unit_population += troops_info[i].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[i].EL_RankLevel];
                    }
                    if(this.m.EL_HaveRandomLeader && random_leader_avilable_index.len() != 0) {
                        local random_leader_index = random_leader_avilable_index[this.Math.rand(0, random_leader_avilable_index.len() - 1)];
                        unit_strength -= this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[random_leader_index].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[random_leader_index].EL_RankLevel]);
                        unit_population -= troops_info[random_leader_index].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[random_leader_index].EL_RankLevel];
                        this.m.Troops[random_leader_index].EL_RankLevel = this.Math.max(2, this.m.Troops[random_leader_index].EL_RankLevelMin);
                        local boss_chance = this.Const.EL_NPC.EL_NormalTeam.LeaderBossChance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getWorldDifficultFactor();
                        local follower_exist = this.World.Retinue.hasFollower("follower.bounty_hunter");
                        if(follower_exist) {
                            boss_chance = boss_chance * 2 + 20;
                        }
                        if(boss_chance >= this.Math.rand(1, 100)) {
                            this.m.Troops[random_leader_index].EL_IsBossUnit = true;
                        }


                        unit_strength += this.Math.max(this.Const.EL_NPC.EL_Troop.UnitGenerateMinCalculateResourse, this.m.Troops[random_leader_index].Strength * this.Const.EL_NPC.EL_Troop.RankResouseMult[this.m.Troops[random_leader_index].EL_RankLevel]);
                        unit_population += troops_info[random_leader_index].EL_BasePopulation * this.Const.EL_NPC.EL_Troop.RankPopulationMult[this.m.Troops[random_leader_index].EL_RankLevel];
                    }
                    used_resourse = unit_strength * (1 + this.Math.pow(unit_population / this.Const.EL_NPC.EL_Troop.TotalResourse.Factor1, this.Const.EL_NPC.EL_Troop.TotalResourse.Factor2));
                    if(used_resourse < this.m.EL_TroopsResourse && this.m.Troops.len() > 0) {

                    }
                }
                // //Build names
                for(local i = 0; i < this.m.Troops.len(); ++i) {
                    if(this.m.Troops[i].EL_IsBossUnit) {
                        this.m.Troops[i].Name = this.Const.EL_NPC.EL_Troop.NamePrefix[this.m.Troops[i].EL_RankLevel];
                        this.m.Troops[i].Name += this.Const.EL_NPC.EL_Troop.Name[this.Math.rand(0, this.Const.EL_NPC.EL_Troop.Name.len() - 1)];
                        this.m.Troops[i].Name += this.Const.EL_NPC.EL_Troop.NameSuffix[this.m.Troops[i].EL_RankLevel];
                    }
                    else {
                        this.m.Troops[i].Name = "";
                    }
                }
            }
            return;
        }


		o.EL_dropEquipmentEssence <- function( _lootTable )
        {
			for(local i = 0; i < this.m.EL_LootEquipmentEssence.len(); ++i) {
                local num = this.m.EL_LootEquipmentEssence[i];
                if(num == 0) {
                    continue;
                }
                local essence = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + i + "_item");
                essence.EL_setAmount(num);
                _lootTable.push(essence);
            }
            this.m.EL_LootEquipmentEssence = [0, 0, 0, 0, 0];
		}

		o.EL_addEquipmentEssence <- function(_EL_rank, _EL_num)
        {
            this.m.EL_LootEquipmentEssence[_EL_rank] += _EL_num;
		}

		o.EL_dropLootItems <- function( _lootTable )
        {
			for(local i = 0; i < this.m.EL_LootItems.len(); ++i) {
                _lootTable.push(this.m.EL_LootItems[i]);
            }
		}


        o.EL_addLootItem <- function(_EL_LootItem)
        {
            this.m.EL_LootItems.push(_EL_LootItem);
		}


		local onDropLootForPlayer = o.onDropLootForPlayer;
		o.onDropLootForPlayer = function (_lootTable)
		{
            onDropLootForPlayer(_lootTable);
            this.EL_dropLootItems(_lootTable);
            this.EL_dropEquipmentEssence(_lootTable);
            foreach(item in _lootTable)
            {
                if(item.EL_getRankLevel() > item.EL_getRankLevelMax() && item.EL_isValid())
                {
                    item.EL_setRankLevel(item.EL_getRankLevelMax() - 1);
                    local result = item.EL_getUpgradeRankEquipmentEssenceNum();
                    for(local i = 0; i < this.m.EL_LootEquipmentEssence.len() - 1; ++i)
                    {
                        if(i == 0)
                        {
                            this.EL_addEquipmentEssence(i, result[i] * 3);
                        }
                        else if(i != 4)
                        {
                            this.EL_addEquipmentEssence(i + 1, result[i]);
                        }
                        else
                        {
                            this.logInfo("Script Error: item id:" + item.getID());
                        }
                    }
                    item.EL_setRankLevel(item.EL_getRankLevelMax());
                    item.EL_recraft();
                }
                else if(item.isConsumed())
                {
                    item.setAmount(this.Math.floor(item.getAmount() * this.Const.EL_NPC.EL_Troop.DropEconomicDifficultyFactor[this.World.Assets.getEconomicDifficulty()]));
                }

            }
		}


	});

	::mods_hookExactClass("entity/world/player_party", function(o){

		local create = o.create;
		o.create = function ()
		{
			create();
            this.m.EL_IsPlayer = true;
		}


	});

	::mods_hookExactClass("factions/settlement_faction", function ( o )
	{
        o.isReadyForContract = function()
        {
            if (this.m.Settlements.len() == 0)
            {
                return false;
            }
            local follower_factor = this.World.Retinue.hasFollower("follower.agent") ? 2.0 : 1.0;
            local delay = 1.0 * this.World.getTime().SecondsPerDay * this.Const.EL_NPC.EL_Contract.DelayTime.Settlement[this.getSettlements()[0].getSize() - 1] / this.World.Assets.EL_getHalfWorldDifficultFactor() / follower_factor;
            local max_contract_num = this.Const.EL_NPC.EL_Contract.MaxNum.Settlement[this.getSettlements()[0].getSize() - 1];
            return this.m.Contracts.len() < max_contract_num && (this.m.LastContractTime == 0 || this.World.getTime().Days <= 1 || this.Time.getVirtualTimeF() > this.m.LastContractTime + this.Math.floor(delay));
        }
	});

	::mods_hookExactClass("factions/noble_faction", function ( o )
	{
        o.isReadyForContract = function()
        {
            local follower_factor = this.World.Retinue.hasFollower("follower.agent") ? 2.0 : 1.0;
            local delay = 1.0 * this.World.getTime().SecondsPerDay * this.Const.EL_NPC.EL_Contract.DelayTime.City / this.World.Assets.EL_getHalfWorldDifficultFactor() / follower_factor;
            local max_contract_num = this.Const.EL_NPC.EL_Contract.MaxNum.City;
            return this.m.Contracts.len() <= max_contract_num && (this.m.LastContractTime == 0 || this.Time.getVirtualTimeF() > this.m.LastContractTime + this.Math.floor(delay));
        }
	});

	::mods_hookExactClass("factions/city_state_faction", function ( o )
	{
        o.isReadyForContract = function()
        {
            local follower_factor = this.World.Retinue.hasFollower("follower.agent") ? 2.0 : 1.0;
            local delay = 1.0 * this.World.getTime().SecondsPerDay * this.Const.EL_NPC.EL_Contract.DelayTime.Noble / this.World.Assets.EL_getHalfWorldDifficultFactor() / follower_factor;
            local max_contract_num = this.Const.EL_NPC.EL_Contract.MaxNum.Noble;
            return (this.m.Contracts.len() < max_contract_num) && (this.m.LastContractTime == 0 || this.Time.getVirtualTimeF() > this.m.LastContractTime + this.Math.floor(delay));
        }
	});

	::mods_hookBaseClass("contracts/contract", function ( o )
	{
        while(!("getID" in o)) o = o[o.SuperName];
		o.create = function ()
		{
            local roll_max = this.Const.EL_NPC.EL_Contract.RollMax.EL_getChance(this.World.Assets.m.EL_WorldLevel);
            local level = this.EL_getMaxContractLevel();
            while(level > 0) {
                if(100 - this.Const.EL_NPC.EL_Contract.DifficultyLevel[level].Chance * this.World.Assets.EL_getWorldDifficultFactor() < this.Math.rand(1, roll_max * 10) * 0.1) {
                    break;
                }
                --level;
            }
            this.m.DifficultyMult = this.Math.rand(this.Const.EL_NPC.EL_Contract.DifficultyLevel[level].Min, this.Const.EL_NPC.EL_Contract.DifficultyLevel[level].Max) * 0.01;
            this.m.PaymentMult = this.Math.rand(90, 110) * 0.01;
            this.m.PaymentMult *= (1 + this.Const.EL_NPC.EL_Contract.PaymentMultPurWorldLevel * this.Math.min(this.Const.EL_NPC.EL_Contract.PaymentMultMaxWorldLevel, this.World.Assets.m.EL_WorldLevel)) * this.World.Assets.EL_getHalfWorldDifficultFactor();
            this.m.PaymentMult *= this.World.Retinue.hasFollower("follower.negotiator") ? 1.5 : 1.0;
            this.m.Flags = this.new("scripts/tools/tag_collection");
            this.m.TempFlags = this.new("scripts/tools/tag_collection");
            this.createStates();
            this.createScreens();
        }

        o.isTimedOut = function()
        {
            return !this.m.IsActive && this.m.TimeOut != 0 && this.m.TimeOut <= this.Time.getVirtualTimeF();
        }

        o.EL_getMaxContractLevel <- function()
        {
            return 2;
        }

        o.getPaymentMult = function ()
		{
			local repDiffMult = this.Math.pow(this.m.DifficultyMult * this.getScaledDifficultyMult(), this.Const.EL_NPC.EL_Contract.PaymentDifficultyPowFactor);
			local broMult = this.World.State.getPlayer().getBarterMult();
			return this.m.PaymentMult * (1 + broMult) * repDiffMult * this.World.Assets.m.ContractPaymentMult;
		};

		o.getUIMiddleOverlay = function ()
		{
			if (("ShowDifficulty" in this.m.ActiveScreen) && this.m.ActiveScreen.ShowDifficulty)
			{
                return {
                    Image = "ui/el_contract/level_" + this.getDifficulty() + ".png",
                    IsProcedural = false
                };
			}
			else
			{
				return null;
			}
		};
		o.getUIDifficultySmall = function ()
		{
            return "ui/el_contract/small_level_" + this.getDifficulty();
		};
		o.getDifficulty <- function ()
		{
            local level = 0;
            while(level <= 8 && this.m.DifficultyMult * 100 > this.Const.EL_NPC.EL_Contract.DifficultyLevel[level].Max) {
                ++level;
            }
			return level;
		};
        o.addUnitsToEntity = function( _entity, _partyList, _resources )
		{
			local p;

			if (typeof _partyList == "table")
			{
				p = this.Const.World.Common.buildDynamicTroopList(_partyList, _resources);
			}
			else
			{
				local total_weight = 0;
				local potential = [];

				foreach( party in _partyList )
				{
					if (party.Cost < _resources * 0.7)
					{
						continue;
					}

					if (party.Cost > _resources)
					{
						break;
					}

					potential.push(party);
					total_weight = total_weight + party.Cost;
				}

				if (potential.len() == 0)
				{
					local best;
					local bestCost = 9000;

					foreach( party in _partyList )
					{
						if (this.Math.abs(_resources - party.Cost) <= bestCost)
						{
							best = party;
							bestCost = this.Math.abs(_resources - party.Cost);
						}
					}

					p = best;
				}
				else
				{
					local pick = this.Math.rand(1, total_weight);

					foreach( party in potential )
					{
						if (pick <= party.Cost)
						{
							p = party;
							break;
						}

						pick = pick - party.Cost;
					}
				}
			}

			local troopMbMap = {};
            local extra_elite_chance = 0;
            switch(this.getDifficulty()) {
                case 0:
                    extra_elite_chance = -33;
                    break;
                case 1:
                    extra_elite_chance = 0;
                    break;
                case 2:
                    extra_elite_chance = 10;
                    break;
                case 3:
                    extra_elite_chance = 20;
                    break;
                case 4:
                    extra_elite_chance = 30;
                    _entity.EL_setHaveRandomLeader(true);
                    break;
                case 5:
                    extra_elite_chance = 40;
                    _entity.EL_setHaveStrongestLeader(true);
                    break;
                case 6:
                    extra_elite_chance = 50;
                    _entity.EL_setHaveRandomLeader(true);
                    _entity.EL_setHaveStrongestLeader(true);
                    break;
                case 7:
                    _entity.EL_setIsEliteParty(true);
                    _entity.EL_setHaveRandomLeader(true);
                    _entity.EL_setHaveStrongestLeader(true);
                    break;
                case 8:
                    _entity.EL_setIsBossParty(true);
                    break;
            }

			foreach( t in p.Troops )
			{
				local key = "Enemy" + t.Type.ID;

				if (!(key in troopMbMap))
				{
					troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
				}

				local mb = troopMbMap[key] + extra_elite_chance;

				for( local i = 0; i != t.Num; i = i )
				{
					this.Const.World.Common.addTroop(_entity, t, false, mb);
					i = ++i;
				}
			}

			if (_entity.isLocation())
			{
				_entity.resetDefenderSpawnDay();
			}

			_entity.updateStrength();
		};

	});

	::mods_hookExactClass("states/world_state", function ( o )
	{

		o.showCombatDialog = function ( _isPlayerInitiated = true, _isCombatantsVisible = true, _allowFormationPicking = true, _properties = null, _pos = null )
        {
            local entities = [];
            local allyBanners = [];
            local enemyBanners = [];
            local hasOpponents = false;
            local listEntities = _isCombatantsVisible && (_isPlayerInitiated || this.World.Assets.getOrigin().getID() == "scenario.rangers" || this.Const.World.TerrainTypeLineBattle[this.m.Player.getTile().Type] && this.World.getTime().IsDaytime);

            if (_pos == null)
            {
                _pos = this.m.Player.getPos();
            }

            if (_properties != null)
            {
                allyBanners = _properties.AllyBanners;
                enemyBanners = _properties.EnemyBanners;
            }

            if (allyBanners.len() == 0)
            {
                allyBanners.push(this.World.Assets.getBanner());
            }

            if (!_isPlayerInitiated && this.World.Camp.isCamping())
            {
                _allowFormationPicking = false;
            }

            if (!_isPlayerInitiated && !this.Const.World.TerrainTypeLineBattle[this.m.Player.getTile().Type])
            {
                _allowFormationPicking = false;
            }

            local champions = [];
            local entityTypes = [
                [],
                [],
                []
            ];
            entityTypes[0].resize(this.Const.EntityType.len(), 0);
            entityTypes[1].resize(this.Const.EntityType.len(), 0);
            entityTypes[2].resize(this.Const.EntityType.len(), 0);

            if (_properties != null)
            {
                _properties.IsPlayerInitiated = _isPlayerInitiated;
            }

            if (_properties == null)
            {
                local parties = this.World.getAllEntitiesAtPos(_pos, this.Const.World.CombatSettings.CombatPlayerDistance);
                local isAtUniqueLocation = false;

                if (parties.len() <= 1)
                {
                    this.m.EngageCombatPos = null;
                    return;
                }

                foreach( party in parties )
                {
                    if (!party.isAlive() || party.isPlayerControlled())
                    {
                        continue;
                    }

                    if (!party.isAttackable() || party.getFaction() == 0 || party.getVisibilityMult() == 0)
                    {
                        continue;
                    }

                    if (party.isLocation() && party.isShowingDefenders() && party.getCombatLocation().Template[0] != null && party.getCombatLocation().Fortification != 0 && !party.getCombatLocation().ForceLineBattle)
                    {
                        entities.push({
                            Name = "Fortifications",
                            Icon = "palisade_01_orientation",
                            Overlay = null
                        });
                    }

                    if (party.isLocation() && party.isLocationType(this.Const.World.LocationType.Unique))
                    {
                        isAtUniqueLocation = true;
                        break;
                    }

                    if (party.isInCombat())
                    {
                        parties = this.World.getAllEntitiesAtPos(_pos, this.Const.World.CombatSettings.CombatPlayerDistance * 2.0);
                        break;
                    }
                }

                foreach( party in parties )
                {
                    if (!party.isAlive() || party.isPlayerControlled())
                    {
                        continue;
                    }

                    if (!party.isAttackable() || party.getFaction() == 0 || party.getVisibilityMult() == 0)
                    {
                        continue;
                    }

                    if (isAtUniqueLocation && (!party.isLocation() || !party.isLocationType(this.Const.World.LocationType.Unique)))
                    {
                        continue;
                    }

                    if (party.isAlliedWithPlayer())
                    {
                        if (party.getTroops().len() != 0 && allyBanners.find(party.getBanner()) == null)
                        {
                            allyBanners.push(party.getBanner());
                        }

                        continue;
                    }
                    else
                    {
                        hasOpponents = true;

                        if (!party.isLocation() || party.isShowingDefenders())
                        {
                            if (party.getTroops().len() != 0 && enemyBanners.find(party.getBanner()) == null)
                            {
                                enemyBanners.push(party.getBanner());
                            }
                        }
                    }

                    if (party.isLocation() && !party.isShowingDefenders())
                    {
                        entityTypes[0].resize(this.Const.EntityType.len(), 0);
                        entityTypes[1].resize(this.Const.EntityType.len(), 0);
                        entityTypes[2].resize(this.Const.EntityType.len(), 0);
                        break;
                    }

                    party.onBeforeCombatStarted();
                    local troops = party.getTroops();

                    foreach( t in troops )
                    {
                        if (t.Script.len() != "")
                        {
                            if (t.EL_IsBossUnit)
                            {
                                champions.push(t);
                            }
                            else
                            {
                                ++entityTypes[t.EL_RankLevel][t.ID];
                            }
                        }
                    }
                }
            }
            else
            {
                foreach( t in _properties.Entities )
                {
                    if (!hasOpponents && (!this.World.FactionManager.isAlliedWithPlayer(t.Faction) || _properties.TemporaryEnemies.find(t.Faction) != null))
                    {
                        hasOpponents = true;
                    }
                    if (t.EL_RankLevel == 2)
                    {
                        champions.push(t);
                    }
                    else
                    {
                        ++entityTypes[t.EL_RankLevel][t.ID];
                    }
                }
            }

            foreach( c in champions )
            {
                entities.push({
                    Name = c.Name,
                    Icon = this.Const.EntityIcon[c.ID],
                    Overlay = "el_icons/miniboss_rank2.png"
                });
            }
            for( local i = 0; i < entityTypes[1].len(); i = i )
            {
                if (entityTypes[1][i] > 0)
                {
                    entities.push({
                        Name = this.removeFromBeginningOfText("The ", this.Const.Strings.EntityName[i]) + " X " + entityTypes[1][i],
                        Icon = this.Const.EntityIcon[i],
                        Overlay = "el_icons/miniboss_rank1.png"
                    });
                }

                i = ++i;
            }
            for( local i = 0; i < entityTypes[0].len(); i = i )
            {
                if (entityTypes[0][i] > 0)
                {
                    entities.push({
                        Name = this.removeFromBeginningOfText("The ", this.Const.Strings.EntityName[i]) + " X " + entityTypes[0][i],
                        Icon = this.Const.EntityIcon[i],
                        Overlay = null
                    });
                }

                i = ++i;
            }
            for( local j = 1; j >= 0; --j ) {


            }


            if (!hasOpponents)
            {
                this.m.EngageCombatPos = null;
                return;
            }

            local text = "";

            if (!listEntities || entities.len() == 0)
            {
                entities = [];
                allyBanners = [];
                enemyBanners = [];

                if (!_isPlayerInitiated)
                {
                    text = "You can\'t make out who is attacking you in time.<br/>You have to defend yourself!";
                }
                else
                {
                    text = "You can\'t make out who you\'ll be facing. Attack at your own peril and be prepared to retreat if need be!";
                }
            }

            local tile = this.World.getTile(this.World.worldToTile(_pos));
            local image = this.Const.World.TerrainTacticalImage[tile.TacticalType];

            if (!this.World.getTime().IsDaytime)
            {
                image = image + "_night";
            }

            image = image + ".png";
            this.setAutoPause(true);
            this.Cursor.setCursor(this.Const.UI.Cursor.Hand);
            this.m.EngageCombatPos = _pos;
            this.m.EngageByPlayer = _isPlayerInitiated;
            this.Tooltip.hide();
            this.m.WorldScreen.hide();
            this.m.CombatDialog.show(entities, allyBanners, enemyBanners, _isPlayerInitiated || this.m.EscortedEntity != null, _allowFormationPicking, text, image, this.m.EscortedEntity != null ? "Flee!" : "Fall back!");
            this.m.MenuStack.push(function ()
            {
                this.m.EngageCombatPos = null;
                this.m.CombatDialog.hide();
                this.m.WorldScreen.show();
                this.stunPartiesNearPlayer(_isPlayerInitiated);
                this.setAutoPause(false);
            }, function ()
            {
                return !this.m.CombatDialog.isAnimating();
            }, _isPlayerInitiated);
        }

	});


    gt.Const.World.Spawn.Unit.EL_EliteChance <- 0;
    gt.Const.World.Spawn.Unit.EL_ExtraCombatLevel <- 0;
    gt.Const.World.Spawn.Unit.EL_RankLevel <- 0;
    gt.Const.World.Spawn.Unit.EL_RankLevelMin <- 0;
    gt.Const.World.Spawn.Unit.EL_ExtraBuffNum <- [0, 0, 0];
    gt.Const.World.Spawn.Unit.EL_IsBossUnit <- false;
    gt.Const.World.Spawn.Unit.EL_UnitInfo <- null;

    gt.Const.World.Common.addTroop = function ( _party, _troop, _updateStrength = true, _minibossify = 0, _EL_rankLevelMin = 0 )
    {
        local troop = clone _troop.Type;
        troop.Party <- this.WeakTableRef(_party);
        troop.Faction <- _party.getFaction();
        troop.Name <- "";
        troop.EL_EliteChance <- _minibossify + this.World.Assets.m.ChampionChanceAdditional + troop.Variant;
        troop.EL_ExtraCombatLevel <- 0;
        troop.EL_RankLevel <- 0;
        troop.EL_RankLevelMin <- _EL_rankLevelMin;
        troop.EL_ExtraBuffNum <- [0, 0, 0];
        troop.EL_IsBossUnit <- false;
        troop.EL_UnitInfo <- null;
        _party.EL_addTroop(troop);
        _party.EL_setFaction(troop.Faction);
        if (_updateStrength)
        {
            _party.updateStrength();
        }
        return troop;
    };


    gt.Const.World.Common.addUnitsToCombat = function ( _party, _partyList, _resources, _faction, _minibossify = 0 )
    {
        local p;

        if (typeof _partyList == "table")
        {
            p = this.Const.World.Common.buildDynamicTroopList(_partyList, _resources);
        }
        else
        {
            local total_weight = 0;
            local potential = [];

            foreach( party in _partyList )
            {
                if (party.Cost < _resources * 0.7)
                {
                    continue;
                }

                if (party.Cost > _resources)
                {
                    break;
                }

                potential.push(party);
                total_weight = total_weight + party.Cost;
            }

            if (potential.len() == 0)
            {
                local best;
                local bestCost = 9000;

                foreach( party in _partyList )
                {
                    if (this.Math.abs(_resources - party.Cost) <= bestCost)
                    {
                        best = party;
                        bestCost = this.Math.abs(_resources - party.Cost);
                    }
                }

                p = best;
            }
            else
            {
                local pick = this.Math.rand(1, total_weight);

                foreach( party in potential )
                {
                    if (pick <= party.Cost)
                    {
                        p = party;
                        break;
                    }

                    pick = pick - party.Cost;
                }
            }
        }

        local troopMbMap = {};

        foreach( t in p.Troops )
        {
            local key = "Enemy" + t.Type.ID;

            if (!(key in troopMbMap))
            {
                troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
            }

            local mb = troopMbMap[key];

            for( local i = 0; i != t.Num; ++i )
            {
                this.Const.World.Common.addTroop(_party, t, false);
            }
        }
    };

    gt.Const.World.Common.EL_addEntity <- function (_EL_troop, _EL_tile, _EL_faction, _EL_rank, _EL_level = -1, _EL_assignEquipments = true)
    {
        local e = this.Tactical.spawnEntity(_EL_troop.Script, _EL_tile.Coords);
        if(e == null) {
            return e;
        }
        if (!this.World.getTime().IsDaytime && e.getBaseProperties().IsAffectedByNight)
        {
            e.getSkills().add(this.new("scripts/skills/special/night_effect"));
        }

        local troop_info = this.Const.EL_NPC.EL_Troop.EL_getTroopInfo(_EL_troop);
        e.EL_setRankLevel(_EL_rank);
        if(_EL_level != -1) {

        }
        else if(_EL_rank != 0) {
            _EL_level = this.World.Assets.m.EL_WorldLevel;
        }
        else {
            _EL_level = this.Math.rand(this.World.Assets.m.EL_WorldLevel + this.Const.EL_NPC.EL_Troop.MinLevelOffset, this.World.Assets.m.EL_WorldLevel + this.Const.EL_NPC.EL_Troop.MaxLevelOffset)
        }
        if(_EL_level > this.Const.EL_NPC.EL_Troop.MaxLevel) {
            _EL_level = this.Const.EL_NPC.EL_Troop.MaxLevel;
        }
        else if(_EL_level < this.Const.EL_NPC.EL_Troop.MinLevel) {
            _EL_level = this.Const.EL_NPC.EL_Troop.MinLevel;
        }
        if (_EL_rank != 0)
        {
            e.makeMiniboss();
        }

        e.EL_buildNPCPropertiesByLevel(_EL_level);
        e.EL_setCombatLevel(this.Math.min(this.Const.EL_NPC.EL_Troop.MaxCalculateLevel, _EL_level) + troop_info.EL_ExtraCombatLevel);
        e.setFaction(_EL_faction);

        if(_EL_assignEquipments) {
            e.EL_assignRandomEquipment();
        }

        local skills = e.getSkills().m.Skills;
        foreach(skill in skills)
        {
            if(skill.EL_isNPCBuff())
            {
                skill.EL_setRankLevel(_EL_rank);
            }
        }

        local extra_normal_buff_num = 0;
        local extra_elite_buff_num = 0;
        local extra_leader_buff_num = 0;
        if(troop_info.EL_IsBossUnit == true) {
            extra_elite_buff_num = this.Const.EL_NPC.EL_NPCBuff.Num.BossUnitExtraRank1;
            extra_leader_buff_num = this.Const.EL_NPC.EL_NPCBuff.Num.BossUnitExtraRank2;
        }
        if(e.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null &&
           e.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
        {
            extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank0[_EL_rank];
            extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank1[_EL_rank];
            extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank2[_EL_rank];
        }
        else
        {
            extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank0[_EL_rank];
            extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank1[_EL_rank];
            extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank2[_EL_rank];
        }
        local chance = this.World.Assets.EL_getWorldDifficultFactor() * 100 - 100;
        while(true) {
            local r = this.Math.rand(1, this.Const.EL_NPC.EL_Troop.ExtraBuffRollMax);
            if(r > chance) {
                break;
            }
            chance -= this.Const.EL_NPC.EL_Troop.ExtraBuffRollMax;
            if(_EL_rank == 2)
            {
                extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[2];
                extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[2];
                extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[2];
            }
            else if(_EL_rank == 1)
            {
                extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[1];
                extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[1];
                extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[1];
            }
            else
            {
                extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[0];
                extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[0];
                extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[0];
            }
        }
        if(e.getFaction() != this.Const.Faction.Player && e.getFaction() != this.Const.Faction.PlayerAnimals) {
            this.Const.EL_NPC.EL_NPCBuff.EL_assignNPCBuffs(e, extra_normal_buff_num, extra_elite_buff_num, extra_leader_buff_num);
        }

        e.EL_afterEntityBuild();
        return e;
    }

    gt.Const.World.Common.EL_addEntityByScript <- function (_EL_script, _EL_tile, _EL_faction, _EL_rank, _EL_level = -1, _EL_assignEquipments = true, _EL_isBossUnit = false, _EL_extraCombatLevel = 0)
    {
        local e = this.Tactical.spawnEntity(_EL_script, _EL_tile.Coords);
        if(e == null) {
            return e;
        }
        if (!this.World.getTime().IsDaytime && e.getBaseProperties().IsAffectedByNight)
        {
            e.getSkills().add(this.new("scripts/skills/special/night_effect"));
        }

        e.EL_setRankLevel(_EL_rank);
        if(_EL_level != -1) {

        }
        else if(_EL_rank != 0) {
            _EL_level = this.World.Assets.m.EL_WorldLevel;
        }
        else {
            _EL_level = this.Math.rand(this.World.Assets.m.EL_WorldLevel + this.Const.EL_NPC.EL_Troop.MinLevelOffset, this.World.Assets.m.EL_WorldLevel + this.Const.EL_NPC.EL_Troop.MaxLevelOffset)
        }
        if(_EL_level > this.Const.EL_NPC.EL_Troop.MaxLevel) {
            _EL_level = this.Const.EL_NPC.EL_Troop.MaxLevel;
        }
        else if(_EL_level < this.Const.EL_NPC.EL_Troop.MinLevel) {
            _EL_level = this.Const.EL_NPC.EL_Troop.MinLevel;
        }
        if (_EL_rank != 0)
        {
            e.makeMiniboss();
        }

        e.EL_buildNPCPropertiesByLevel(_EL_level);
        e.EL_setCombatLevel(this.Math.min(this.Const.EL_NPC.EL_Troop.MaxCalculateLevel, _EL_level) + _EL_extraCombatLevel);
        e.setFaction(_EL_faction);

        if(_EL_assignEquipments) {
            e.EL_assignRandomEquipment();
        }

        local skills = e.getSkills().m.Skills;
        foreach(skill in skills)
        {
            if(skill.EL_isNPCBuff())
            {
                skill.EL_setRankLevel(_EL_rank);
            }
        }

        local extra_normal_buff_num = 0;
        local extra_elite_buff_num = 0;
        local extra_leader_buff_num = 0;
        if(_EL_isBossUnit == true) {
            extra_elite_buff_num = this.Const.EL_NPC.EL_NPCBuff.Num.BossUnitExtraRank1;
            extra_leader_buff_num = this.Const.EL_NPC.EL_NPCBuff.Num.BossUnitExtraRank2;
        }
        if(e.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null &&
           e.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
        {
            extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank0[_EL_rank];
            extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank1[_EL_rank];
            extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.NonHumanoidRank2[_EL_rank];
        }
        else
        {
            extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank0[_EL_rank];
            extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank1[_EL_rank];
            extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.HumanoidRank2[_EL_rank];
        }
        local chance = this.World.Assets.EL_getWorldDifficultFactor() * 100 - 100;
        while(true) {
            local r = this.Math.rand(1, this.Const.EL_NPC.EL_Troop.ExtraBuffRollMax);
            if(r > chance) {
                break;
            }
            chance -= this.Const.EL_NPC.EL_Troop.ExtraBuffRollMax;
            if(_EL_rank == 2)
            {
                extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[2];
                extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[2];
                extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[2];
            }
            else if(_EL_rank == 1)
            {
                extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[1];
                extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[1];
                extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[1];
            }
            else
            {
                extra_leader_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank2[0];
                extra_elite_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank1[0];
                extra_normal_buff_num += this.Const.EL_NPC.EL_NPCBuff.Num.ExtraBuffRank0[0];
            }
        }
        if(e.getFaction() != this.Const.Faction.Player && e.getFaction() != this.Const.Faction.PlayerAnimals) {
            this.Const.EL_NPC.EL_NPCBuff.EL_assignNPCBuffs(e, extra_normal_buff_num, extra_elite_buff_num, extra_leader_buff_num);
        }
        e.EL_afterEntityBuild();
        return e;
    }

    gt.Const.LegendMod.GetFavEnemyBossChance <- function ( _id )
    {
        if (!this.Const.DLC.Wildmen)
        {
            return 0;
        }

        local perks = this.Const.LegendMod.FavEnemyPerkMap.getPerks(_id);

        if (perks.len() == 0)
        {
            return 0;
        }

        local bonus = 0;
        local roster = this.World.getPlayerRoster().getAll();

        foreach( bro in roster )
        {
            foreach( perk in perks )
            {
                if (!bro.getSkills().hasSkill(perk))
                {
                    continue;
                }
                bonus += 15;
                break;
            }
        }
        return bonus;
    };


});

