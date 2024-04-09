local gt = this.getroottable();

if (!("EL_NPC" in gt.Const))
{
	gt.Const.EL_NPC <- {};
}

gt.Const.EL_NPC <- {

    EL_DifficultBallance = {

        DamageTotalMult = 1,
        DamageReceivedTotalDiv = 1.0,
        Attributes = {
            Bravery = 25,
            Fatigue = 25,
            Initiative = 25,
            MeleeSkill = 25,
            RangedSkill = 25,
            MeleeDefense = 25,
            RangedDefense = 25,
        },
        AttributesGrowthPurLevel = {
            Bravery = 0.25,
            Fatigue = 0.25,
            Initiative = 0.25,
            MeleeSkill = 0.25,
            RangedSkill = 0.25,
            MeleeDefense = 0.25,
            RangedDefense = 0.25,
        },
    }

    EL_Champion = {
        MaxGrowthLevel = 50,

        XP = {
            Offset = [
                0,
                200,
                500
            ],
            Mult = [
                1,
                2,
                5
            ]
        },
        CombatLevelOffset = [
            0,
            2,
            5
        ],
        ActionPointsOffset = [
            0,
            1,
            3
        ],
        DamageTotalMult = [
            1,
            1.2,
            1.5
        ],
        DamageReceivedTotalDiv = [
            1,
            1.8,
            3
        ]
        Attributes = {
            Bravery = [0, 20, 50],
            Fatigue = [0, 30, 75],
            Initiative = [0, 20, 50],
            MeleeSkill = [0, 20, 50],
            RangedSkill = [0, 20, 50],
            MeleeDefense = [0, 20, 50],
            RangedDefense = [0, 20, 50],
        },
        AttributesGrowthPurLevel = {
            Bravery = [0, 0.4, 1],
            Fatigue = [0, 0.6, 1.5],
            Initiative = [0, 0.4, 1],
            MeleeSkill = [0, 0.4, 1],
            RangedSkill = [0, 0.4, 1],
            MeleeDefense = [0, 0.4, 1],
            RangedDefense = [0, 0.4, 1],
        },

        Name = [
            "普通",
            "精英",
            "首领"
        ],
        Icon = [
            "el_skills/champion_rank_0.png",
            "el_skills/champion_rank_1.png",
            "el_skills/champion_rank_2.png"
        ],
        IconMini = [
            "champion_rank_0_mini",
            "champion_rank_1_mini",
            "champion_rank_2_mini"
        ]
    },

    EL_LevelUp = {
        LevelUpsOffset = 15,
        LevelUpsCombatLevelOffect = [
            3,
            2,
            1,
            0
        ],
        LevelUpAttributes = {
            HitpointsMult = 0.08,
            Bravery = 0.5,
            Fatigue = 0.5,
            Initiative = 2,
            MeleeSkill = 3,
            RangedSkill = 3,
            MeleeDefense = 3,
            RangedDefense = 3,
        },

        LevelUpDamageMult = 0.08,
        LevelUpArmorMult = 0.08,
        MaxXPLevel = 50,
        PropertiesLevelUpMultAfterMaxXPLevel = 0.5,
        MaxPropertiesLevel = 100,
        XPFactor = 1.085
    },

    EL_Troop = {
        StrengthPurPopulation = 20,
        WeakUnitPopulationMult = 3,
        Rank2LeastStrength = 20,
        MinLevel = 0,
        MaxLevel = 100,
        BaseMaxTroopNum = 20,
        MaxTroopNumAddPurWorldLevel = 1,
        MaxTroopNum = 50,
        MaxCalculateLevel = 50,
        MinLevelOffset = -5,
        MaxLevelOffset = 0,
        BossTroopMinLeaders = 5,
        BossChance = 1,
        UnitGenerateMinCalculateResourse = 20,
        ExtraBuffRollMax = 50,
        ExtraBuffStrengthMultPurTime = 2,
        EliteUnitEliteChanceMult = 2

        EquipmentEssence = {
            BossDropLengendaryNum = 1,
            DropBaseNum = 10,
            DropPurExtraCombatLevelNegative = 1,
            DropPurExtraCombatLevelPositive = 10,
            NormalDropLevelMult = 0.08,
            NormalDropMultPurRank = 3
        },
        DropEconomicDifficultyFactor = [
            1.331,
            1.21,
            1.1,
            1.0
        ],


        ExtraCombatLevel = {
            BossLevel = 10,
            ExtraCombatLevelMax = 5,
            CrticalPoint = 10,
            MultPart1 = 1,
            MultPart2 = 0.1,
            RandomMin = -100,
            RandomMax = 100,
            RandomMult = 0.01
        },

        RankResouseMult = [
            1,
            2,
            5
        ],

        RankPopulationMult = [
            1,
            2,
            5
        ],

        TotalResourse = {
            Factor1 = 100,
            Factor2 = 5
        }

        Resourse = {
            MultPurWorldLevel = 0.5,
            MultBase = 100
         },

        BossUnit = [
            this.Const.EntityType.TricksterGod,
            this.Const.EntityType.Kraken,
            this.Const.EntityType.KrakenTentacle,
            this.Const.EntityType.SkeletonLich,
            this.Const.EntityType.SkeletonLichMirrorImage,
            this.Const.EntityType.FlyingSkull,
            this.Const.EntityType.LegendHexeLeader
        ],

        EliteUnit = [
            this.Const.EntityType.BanditWarlord,
            this.Const.EntityType.BanditLeader,
            this.Const.EntityType.BarbarianChosen,
            this.Const.EntityType.BarbarianMadman,
            this.Const.EntityType.LegendSkinGhoul,
            this.Const.EntityType.LegendWhiteDirewolf,
            this.Const.EntityType.LegendWhiteWarwolf,
            this.Const.EntityType.LegendRedbackSpider,
            this.Const.EntityType.LegendRockUnhold,
            this.Const.EntityType.LegendDemonAlp,
            this.Const.EntityType.LegendStollwurm,
            this.Const.EntityType.LegendGreenwoodSchrat,
            this.Const.EntityType.LegendGreenwoodSchratSmall,
            this.Const.EntityType.LegendHexeLeader,
            this.Const.EntityType.Swordmaster,
            this.Const.EntityType.MasterArcher,
            this.Const.EntityType.LegendOrcElite,
            this.Const.EntityType.LegendOrcBehemoth,
            this.Const.EntityType.OrcWarlord,
            this.Const.EntityType.GoblinLeader,
            this.Const.EntityType.NomadLeader,
            this.Const.EntityType.SkeletonBoss,
            this.Const.EntityType.ZombieBoss,
            this.Const.EntityType.LegendVampireLord,
            this.Const.EntityType.LegendMummyQueen,
        ],

        WeakUnit = [
            this.Const.EntityType.Peasant,
            this.Const.EntityType.PeasantSouthern,
            this.Const.EntityType.Slave,
            this.Const.EntityType.CaravanDonkey,
            this.Const.EntityType.MilitaryDonkey,
            this.Const.EntityType.SkeletonPhylactery
        ]

        Name = [
            "Shadowstrike", "Thunderbolt", "Nightshade", "Ironclad", "Phoenix", "Viper", "Stormbringer", "Warhawk", "Frostbite", "Sentinel",
            "Silverfox", "Havoc", "Spectre", "Blackout", "Razorback", "Serpent", "Thunderstorm", "Crimson Fury", "Ghostwalker", "Avalanche",
            "Nightfall", "Bloodhound", "Stormcrow", "Sabertooth", "Phantom", "Wildfire", "Wraith", "Venom", "Warlock", "Swiftstrike",
            "Omega", "Frostfang", "Ironwolf", "Inferno", "Banshee", "Deathbringer", "Frostfire", "Warpath", "Bladewind", "Thunderclaw",
            "Darkstar", "Nightblade", "Steelheart", "Shadowhunter", "Phoenixfire", "Thunderstrike", "Nightstalker", "Ironhide", "Seraph",
            "Vortex", "Warthog", "Frostnova", "Silverfang", "Spectral", "Blackhawk", "Razorwind", "Havocblade", "Shadowrider", "Stormshadow",
            "Bloodraven", "Thunderwing", "Crimson Viper", "Ghostfire", "Avalanche", "Nightshade", "Sabretooth", "Phantom", "Wildstrike",
            "Wraith", "Warlock", "Swiftshadow", "Omega", "Frostbite", "Ironclaw", "Inferno", "Banshee", "Deathstrike", "Frostfire",
            "Warpath", "Bladefang", "Thunderclaw", "Darkstrike", "Nightshroud", "Steelstorm", "Shadowblade", "Phoenixflare", "Thunderstrike",
            "Nightstalker", "Ironheart", "Seraphim", "Vortex", "Warthog", "Frostnova", "Silverclaw", "Spectral", "Blackfang", "Razorhawk",
            "Havocrider", "Shadowfire", "Thunderstorm", "Shadowstrike", "Thunderbolt", "Nightshade", "Ironclad", "Phoenix", "Viper", "Stormbringer",
            "Silverfox", "Havoc", "Spectre", "Blackout", "Razorback", "Serpent", "Thunderstorm", "Crimson Fury", "Ghostwalker", "Avalanche",
            "Nightfall", "Bloodhound", "Stormcrow", "Sabertooth", "Phantom", "Wildfire", "Wraith", "Venom", "Warlock", "Swiftstrike",
            "Omega", "Frostfang", "Ironwolf", "Inferno", "Banshee", "Deathbringer", "Frostfire", "Warpath", "Bladewind", "Thunderclaw",
            "Darkstar", "Nightblade", "Steelheart", "Shadowhunter", "Phoenixfire", "Thunderstrike", "Nightstalker", "Ironhide", "Seraph",
            "Vortex", "Warthog", "Frostnova", "Silverfang", "Spectral", "Blackhawk", "Razorwind", "Havocblade", "Shadowrider", "Stormshadow",
            "Bloodraven", "Thunderwing", "Crimson Viper", "Ghostfire", "Avalanche", "Nightshade", "Sabretooth", "Phantom", "Wildstrike",
            "Wraith", "Warlock", "Swiftshadow", "Omega", "Frostbite", "Ironclaw", "Inferno", "Banshee", "Deathstrike", "Frostfire",
            "Warpath", "Bladefang", "Thunderclaw", "Darkstrike", "Nightshroud", "Steelstorm", "Shadowblade", "Phoenixflare", "Thunderstrike",
            "Nightstalker", "Ironheart", "Seraphim", "Vortex", "Warthog", "Frostnova", "Silverclaw", "Spectral", "Blackfang", "Razorhawk",
            "Havocrider", "Shadowfire", "Thunderstorm", "Shadowstrike", "Thunderbolt", "Nightshade", "Ironclad", "Phoenix", "Viper",
            "Stormbringer", "Warhawk", "Frostbite", "Sentinel", "Silverfox", "Havoc", "Spectre", "Blackout", "Razorback", "Serpent",
            "Thunderstorm", "Crimson Fury", "Ghostwalker", "Avalanche", "Nightfall", "Bloodhound", "Stormcrow", "Sabertooth", "Phantom",
            "Wildfire", "Wraith", "Venom", "Warlock", "Swiftstrike", "Omega", "Frostfang", "Ironwolf", "Inferno", "Banshee",
            "Deathbringer", "Frostfire", "Warpath", "Bladewind", "Thunderclaw", "Darkstar", "Nightblade", "Steelheart", "Shadowhunter",
            "Phoenixfire", "Thunderstrike", "Nightstalker", "Ironhide", "Seraph", "Vortex", "Warthog", "Frostnova", "Silverfang",
            "Spectral", "Blackhawk", "Razorwind", "Havocblade", "Shadowrider", "Stormshadow", "Bloodraven", "Thunderwing", "Crimson Viper",
            "Ghostfire", "Avalanche", "Nightshade", "Sabretooth", "Phantom", "Wildstrike", "Wraith", "Warlock", "Swiftshadow",
            "Omega", "Frostbite", "Ironclaw", "Inferno", "Banshee", "Deathstrike", "Frostfire", "Warpath", "Bladefang",
            "Thunderclaw", "Darkstrike", "Nightshroud", "Steelstorm", "Shadowblade", "Phoenixflare", "Thunderstrike", "Nightstalker",
            "Ironheart", "Seraphim", "Vortex", "Warthog", "Frostnova", "Silverclaw", "Spectral", "Blackfang", "Razorhawk",
            "Havocrider", "Shadowfire", "Thunderstorm", "Warhawk", "Frostbite", "Sentinel"
        ],
        NamePrefix = [
            "",
            "*",
            "***"
        ],
        NameSuffix = [
            "",
            "*",
            "***"
        ],

        DropIncreaseMultPurWorldLevel = {
            Money = 0.08,
            Food = 0.01,
            Treasure = 0.08,
            Ammo = 0.01,
            ArmorParts = 0.08,
            Medicine = 0.08
        }

        function EL_getTroopInfo(_EL_troop) {
            local ret = {
                troop = _EL_troop,
                EL_BasePopulation = 0,
                EL_ExtraCombatLevel = 0,
                EL_IsBossUnit = false,
                EL_IsEliteUnit = false,
                EL_IsWeakUnit = false
            };
            if(_EL_troop.Strength <= this.Const.EL_NPC.EL_Troop.StrengthPurPopulation) {
                ret.EL_BasePopulation = 1;
            }
            else {
                ret.EL_BasePopulation = this.Math.ceil(_EL_troop.Strength / this.Const.EL_NPC.EL_Troop.StrengthPurPopulation);
            }
            if(this.Const.EL_NPC.EL_Troop.BossUnit.find(_EL_troop.ID)) {
                ret.EL_IsBossUnit = true;
                ret.EL_ExtraCombatLevel = this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.BossLevel;
                return ret;
            }
            if(this.Const.EL_NPC.EL_Troop.EliteUnit.find(_EL_troop.ID)) {
                ret.EL_IsEliteUnit = true;
            }
            else if(this.Const.EL_NPC.EL_Troop.EliteUnit.find(_EL_troop.ID)) {
                ret.EL_IsWeakUnit = true;
            }
            if(_EL_troop.Strength < this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.CrticalPoint) {
                ret.EL_ExtraCombatLevel = -this.Math.pow((this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.CrticalPoint - _EL_troop.Strength) * this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.MultPart1, 0.5);
            }
            else {
                ret.EL_ExtraCombatLevel = this.Math.pow((_EL_troop.Strength - this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.CrticalPoint) * this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.MultPart2, 0.5);
            }
            ret.EL_ExtraCombatLevel = this.Math.min(this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.ExtraCombatLevelMax, this.Math.rand(this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.RandomMin, this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.RandomMax) * this.Const.EL_NPC.EL_Troop.ExtraCombatLevel.RandomMult + ret.EL_ExtraCombatLevel);
            return ret;
        }
    }

    EL_NormalTeam = {
        EliteChance = {
            Factor = {
                Offset = [
                    0,
                    -10,
                    30
                ],
                Mult = [
                    0,
                    1,
                    0
                ],
                Range = [
                    10,
                    40
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_NormalTeam.EliteChance);
            }
        },
        RandomLeaderChance = {
            Factor = {
                Offset = [
                    0,
                    -20,
                    15
                ],
                Mult = [
                    0,
                    1,
                    0
                ],
                Range = [
                    20,
                    35
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_NormalTeam.RandomLeaderChance);
            }
        }
        StrongestLeaderChance = {
            Factor = {
                Offset = [
                    0,
                    -25,
                    15
                ],
                Mult = [
                    0,
                    1,
                    0
                ],
                Range = [
                    25,
                    40
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_NormalTeam.StrongestLeaderChance);
            }
        }
    },

    EL_EliteTeam = {
        EliteTeamChance = {
            Factor = {
                Offset = [
                    0,
                    -25,
                    15
                ],
                Mult = [
                    0,
                    1,
                    0
                ],
                Range = [
                    25,
                    40
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_EliteTeam.EliteTeamChance);
            }
        },
        RandomLeaderChance = {
            Factor = {
                Offset = [
                    0,
                    -30,
                    15
                ],
                Mult = [
                    0,
                    1,
                    0
                ],
                Range = [
                    30,
                    45
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_EliteTeam.RandomLeaderChance);
            }
        }
        StrongestLeaderChance = {
            Factor = {
                Offset = [
                    0,
                    -20,
                    -45,
                    15
                ],
                Mult = [
                    0,
                    0.5,
                    1,
                    0
                ],
                Range = [
                    40,
                    50,
                    60
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_EliteTeam.StrongestLeaderChance);
            }
        }
    }

    EL_NPCBuff = {
        EligibleFunction = {
            function EL_ifGhost(_EL_npc) {
                return _EL_npc.getSkills().hasSkill("racial.ghost");
            }
            function EL_ifRanged(_EL_npc) {
                local main_hand = _EL_npc.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
                return main_hand != null && main_hand.isItemType(this.Const.Items.ItemType.RangedWeapon);
            }
            function EL_ifAttackDistanceOne(_EL_npc) {
                local main_hand = _EL_npc.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
                return main_hand == null || main_hand.m.RangeMax == 1;
            }
            function EL_ifKraken(_EL_npc) {
                return _EL_npc.getType() == this.Const.EntityType.Kraken;
            }
            function EL_ifMoraleStateIgnore(_EL_npc) {
                return _EL_npc.getMoraleState() == this.Const.MoraleState.Ignore;
            }
            function EL_ifNoBuff(_EL_npc) {
                return _EL_npc.getType() == this.Const.EntityType.SkeletonPhylactery ||
                       _EL_npc.getType() == this.Const.EntityType.SpiderEggs ||
                       _EL_npc.getType() == this.Const.EntityType.CaravanDonkey ||
                       _EL_npc.getType() == this.Const.EntityType.MilitaryDonkey;
            }



        }

        Pool = [
            {
                Scripts = "scripts/skills/el_npc_buffs/el_berserker_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            // {
            //     Scripts = "scripts/skills/el_npc_buffs/el_charge_npc_buff",
            //     function EL_ifEligible(_EL_npc) {
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
            //         return true;
            //     }
            // },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_concentrate_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_cripple_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_encourage_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifMoraleStateIgnore(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_endurance_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_energy_drain_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_energy_shield_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_evasion_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            // {
            //     Scripts = "scripts/skills/el_npc_buffs/el_gravitation_npc_buff",
            //     function EL_ifEligible(_EL_npc) {
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
            //         if(!this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifAttackDistanceOne(_EL_npc)) { return false; }
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
            //         if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
            //         return true;
            //     }
            // },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_growth_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_hawk_eye_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(!this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_intimidate_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_life_drain_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_lightning_speed_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_multiple_attacks_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_oscillation_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return true; }
                    if(!this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_poisoned_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_phoenix_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_recovery_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_revenge_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_self_destruct_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_stamp_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_strength_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_stunning_strike_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_tank_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_thick_skin_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifGhost(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_thron_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_veteran_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_weapon_master_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            },
            {
                Scripts = "scripts/skills/el_npc_buffs/el_wither_npc_buff",
                function EL_ifEligible(_EL_npc) {
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifRanged(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifKraken(_EL_npc)) { return false; }
                    if(this.Const.EL_NPC.EL_NPCBuff.EligibleFunction.EL_ifNoBuff(_EL_npc)) { return false; }
                    return true;
                }
            }
        ],

        Num = {
            HumanoidRank0 = [0, 0, 0],
            HumanoidRank1 = [0, 1, 0],
            HumanoidRank2 = [0, 0, 1],
            //HumanoidRank2 = [99, 99, 99],
            NonHumanoidRank0 = [0, 0, 0],
            NonHumanoidRank1 = [0, 3, 0],
            NonHumanoidRank2 = [0, 0, 3],
            //NonHumanoidRank2 = [99, 99, 99],
            ExtraBuffRank0 = [1, 0, 0],
            ExtraBuffRank1 = [0, 1, 0],
            ExtraBuffRank2 = [0, 0, 1],
            BossUnitExtraRank1 = 0,
            BossUnitExtraRank2 = 2

        }

        Factor = {
            Berserker = {
                DamageMultPurStack = [0.04, 0.08, 0.2],
                MeleeSkillOffsetPurStack = [4 ,8, 20],
                RangedSkillOffsetPurStack = [4 ,8, 20]
            },
            Charge = {
                Chance = [50, 100, 100],
                InjuryNum = [1, 1, 2],
                DazeEffect = [
                    "scripts/skills/effects/dazed_effect",
                    "scripts/skills/effects/dazed_effect",
                    "scripts/skills/effects/legend_dazed_effect"
                ]
            },
            Concentrate = {
                DamageMultPurStack = [0.04, 0.08, 0.2],
                MeleeSkillOffsetPurStack = [4 ,8, 20],
                RangedSkillOffsetPurStack = [4 ,8, 20]
            },
            Cripple = {
                Chance = [50, 100, 100],
                InjuryNum = [1, 1, 2]
            },
            Encourage = {
                BraveryOffset = [10, 20, 50],
                MoraleCheckChance = [50, 100, 100],
                MoraleCheckTimes = [1, 1, 2],
                BaseOffset = -50,
                RankFactor = 0,
                CombatLevelFactor = 1.08,
                DistanceFactor = 3
            },
            Endurance = {
            },
            EnergyDrain = {
                FatiguePurActionPoint = [2, 4, 10]
            },
            EnergyShield = {
                MaxStack = [2, 4, 10],
                StackRecoverPersentPurTurn = 0.25
            }
            Evasion = {
                MeleeState = 1,
                RangeState = 2,
                DefenseOffset = [8, 16, 40],
                DefenseOffsetSelectedMult = 5,
            },
            Gravitation = {
                MaxDistance = [2, 4, 6],
                MaxMoveTime = [1, 2, 3]
            },
            Growth = {
                DamageMultPurStack = [0.02, 0.04, 0.1],
                DamageReceivedMultPurStack = [0.02, 0.04, 0.1],
                MeleeSkillOffsetPurStack = [0.4 ,0.8, 2],
                RangedSkillOffsetPurStack = [0.4 ,0.8, 2],
                MeleeDefenseOffsetPurStack = [0.4 ,0.8, 2],
                RangedDefenseOffsetPurStack = [0.4 ,0.8, 2],
            },
            HawkEye = {
                MaxRangeMult = [1.2, 1.4, 2],
                VisionMult = [1.4, 1.8, 3.0],
                HeadHitChanceOffset = [10, 20, 50]
            },
            Intimidate = {
                BraveryOffset = [10, 20, 50],
                MoraleCheckChance = [20, 40, 100],
                BaseOffset = 50,
                RankFactor = 0,
                CombatLevelFactor = 1.08,
                DistanceFactor = 3
            },
            LifeDrain = {
                HitpointsPurActionPoint = [2, 4, 10],
                HitpointsMultPurCombatLevel = 0.04,
                RecoverMult = 10,
            }
            LightningSpeed = {
                InitiativeOffset = [40, 80, 200],
                ActionPointsMult = [1.2, 1.4, 2]
            },
            MultipleAttacks = {
                DamageTotalMult = [0.2, 0.4, 1]
            }
            Oscillation = {
                MaxDistance = [1, 2, 3]
            },
            Phoenix = {
                RiseTimes = [1, 2, 3]
            },
            Poisoned = {
                Chance = [50, 100, 100],
                PoisonNum = [1, 1, 2]
            },
            Recovery = {
                HitpointsRecoveryRate = [0.04, 0.08, 0.20],
                FatigueRecoveryRate = [4, 8, 20],
                ArmorRecoveryRate = [0.04, 0.08, 0.20]
            },
            Revenge = {
                DamageMultPurStack = [0.04, 0.08, 0.2],
                MeleeSkillOffsetPurStack = [4 ,8, 20],
                RangedSkillOffsetPurStack = [4 ,8, 20]
            },
            SelfDestruct = {
                DamageBase = 200,
                DamageMultPurCombatLevel = 0.04,
                DamageRate = [0.2, 0.4, 1],
                DamageDecayRatePurTile = 0.5,
                MaxDistance = 4
            },
            Stamp = {
                DamageBase = 100,
                DamageMultPurWorldLevel = 0.04,
                StackPurHit = [1, 2, 5],
                ExplodeStackNum = 5,
                ExplodeStackGain = 1,
                MaxDistance = 1
            },
            Strength = {
                DamageTotalMult = [0.4, 0.8, 2]
            },
            StunningStrike = {
                Chance = [50, 100, 100],
                StunTurns = [1, 1, 2]
            },
            Tank = {
                HitpointsMult = [1.4, 1.8, 3],
                Stamina = [40, 80, 200],
                ArmorMult = [1.4, 1.8, 3]
            },
            ThickSkin = {
                DamageReceivedMult = [0.4, 0.8, 2.0]
            },
            Thron = {
                DamageBase = 20,
                DamageMultPurCombatLevel = 0.04,
                DamageRate = [0.2, 0.4, 1]
            },
            Veteran = {
                CombatLevelOffset = [1, 2, 5]
            },
            WeaponMaster = {
                MeleeSkillOffset = [20, 40, 100],
                RangedSkillOffset = [20, 40, 100]
            },
            Wither = {
                DamageBase = 20,
                DamageMultPurCombatLevel = 0.04,
                DamageRate = [0.2, 0.4, 1],
                DamageDecayRatePurTile = 0.5,
                MaxDistance = 4
            }
        }

        function EL_assignNPCBuffs(_EL_npc, _EL_rank0Num, _EL_rank1Num, _EL_rank2Num) {
            local index_pool = [];
            local skills = _EL_npc.getSkills();
            for(local i = 0; i < this.Const.EL_NPC.EL_NPCBuff.Pool.len(); ++i) {
                if(this.Const.EL_NPC.EL_NPCBuff.Pool[i].EL_ifEligible(_EL_npc)) {
                    index_pool.push(i);
                }
            }
            for(local i = 0; i < _EL_rank2Num && index_pool.len() != 0; ++i) {
                local r = this.Math.rand(0, index_pool.len() - 1);
                local skill = this.new(this.Const.EL_NPC.EL_NPCBuff.Pool[index_pool[r]].Scripts);
                if(skills.getSkillByID(skill.getID()) == null)
                {
                    skill.EL_setRankLevel(2);
                    skills.add(skill);
                }
                else
                {
                    --i;
                }
                index_pool.remove(r);
            }
            for(local i = 0; i < _EL_rank1Num && index_pool.len() != 0; ++i) {
                local r = this.Math.rand(0, index_pool.len() - 1);
                local skill = this.new(this.Const.EL_NPC.EL_NPCBuff.Pool[index_pool[r]].Scripts);
                if(skills.getSkillByID(skill.getID()) == null)
                {
                    skill.EL_setRankLevel(1);
                    skills.add(skill);
                }
                else
                {
                    --i;
                }
                index_pool.remove(r);
            }
            for(local i = 0; i < _EL_rank0Num && index_pool.len() != 0; ++i) {
                local r = this.Math.rand(0, index_pool.len() - 1);
                local skill = this.new(this.Const.EL_NPC.EL_NPCBuff.Pool[index_pool[r]].Scripts);
                if(skills.getSkillByID(skill.getID()) == null)
                {
                    skill.EL_setRankLevel(0);
                    skills.add(skill);
                }
                else
                {
                    --i;
                }
                index_pool.remove(r);
            }
        }
    }

    EL_Contract = {
        DifficultyLevel = [
            {
                Min = 50,
                Max = 60,
                Chance = 10000,
                Image = "ui/el_contract/level_0.png",
                ImageSmall = ""
            },
            {
                Min = 70,
                Max = 80,
                Chance = 80
            },
            {
                Min = 90,
                Max = 110,
                Chance = 50
            },
            {
                Min = 120,
                Max = 140,
                Chance = 35
            },
            {
                Min = 150,
                Max = 200,
                Chance = 15
            },
            {
                Min = 300,
                Max = 400,
                Chance = 10
            },
            {
                Min = 500,
                Max = 600,
                Chance = 6
            },
            {
                Min = 700,
                Max = 800,
                Chance = 3
            },
            {
                Min = 900,
                Max = 1000,
                Chance = 1
            }
        ],

        RollMaxOffset = 50,
        RollMax = {
            Factor = {
                Offset = [
                    50,
                    65,
                    77.5,
                    100
                ],
                Mult = [
                    2,
                    1,
                    0.5,
                    0
                ],
                Range = [
                    15,
                    25,
                    45
                ]
            }
            Table = []
            function EL_getChance(_EL_Index) {
                return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_NPC.EL_Contract.RollMax);
            }
        },
        MaxNum = {
            Settlement = [2, 3, 4],
            City = 4,
            Noble = 2,
        }
        DelayTime = {
            Settlement = [6.0, 4.5, 3.0],
            City = 3.0,
            Noble = 6.0,
        }
        PaymentDifficultyPowFactor = 0.2,
        PaymentMultPurWorldLevel = 0.08,
        PaymentMultMaxWorldLevel = 100
    }
};

this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_NormalTeam.EliteChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_NormalTeam.RandomLeaderChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_NormalTeam.StrongestLeaderChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_EliteTeam.EliteTeamChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_EliteTeam.RandomLeaderChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_EliteTeam.StrongestLeaderChance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_NPC.EL_Contract.RollMax);

