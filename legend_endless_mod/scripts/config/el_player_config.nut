local gt = this.getroottable();

if (!("EL_Player" in gt.Const))
{
	gt.Const.EL_Player <- {};
}

gt.Const.EL_Player <- {

    EL_PlayerLevel = {
        Max = 50,
        Part1 = 11,
        //Part1(level < 11), XP = 200 * level ^ 2
        Part1Factor = 200,
        //Part2, XP(level) = XP(level - 1) * 1.1
        Part2Factor = 1.1,
        MaxLevelImproveOnce = 5
    }

    EL_CombatXP = {
        MaxWorldLevel = 50,
        WorldLevelCombatLevelOffset = [
            3,
            2,
            1,
            0
        ]
        MaxDiv = 8.0,
        // XP * (1 + (WorldLevel - Level - 5) * 0.2) ^ 3 (Level < WorldLevel - 5)
        BelowOffset = 5,
        BelowMult = 0.2,
        BelowMultMax = 10,
        // XP / (1 + (Level - WorldLevel - 0) * 0.2) ^ 3 (Level > WorldLevel - 0)
        OverOffset = 0,
        OverMult = 0.2,
        OverMultMin = 0.1
    }

    EL_LevelUpsPurTime = 5,

    EL_PlayerStatesBoard = {
        BraveryMax = 200,
        InitiativeMax = 500,
        MeleeSkillMax = 300,
        RangeSkillMax = 300,
        MeleeDefenseMax = 300,
        RangeDefenseMax = 300,
        RegularDamageMax = 5000,
        CrushingDamageMax = 300,
        ChanceToHitHeadMax = 100,
        SightDistanceMax = 20
    }

    EL_PlayerAddAttributesBoard = {
        HitpointsMax = 400,
        BraveryMax = 200,
        FatigueMax = 400,
        InitiativeMax = 500,
        MeleeSkillMax = 300,
        RangeSkillMax = 300,
        MeleeDefenseMax = 300,
        RangeDefenseMax = 300
    },

    EL_HealInjury = {
        LevelMult = 0.08,
        PermanentMult = 20,
    }

    EL_Hiring = {
        EL_TryoutCostMult = 7.0,
        EL_ItemCostMult = 1.0,
        EL_LevelMult = 0.08,
        EL_WorldLevelOffset = 5,
    }

    EL_DailyCostLevelMult = 0.08,

    EL_Champion = {
        XPMult = [
            1,
            0.5,
            0.2
        ],
        HiringCostMult = [
            1,
            4,
            10
        ],
        HiringCostOffset = [
            0,
            16000,
            100000
        ],
        DailyCostMult = [
            1,
            2,
            5
        ],
        DailyCostOffset = [
            0,
            80,
            500
        ],
        DailyFoodMult = [
            1,
            2,
            5
        ],
        CombatLevelOffset = [
            0,
            2,
            5
        ],
        PerkPointsOffset = [
            0,
            2,
            5
        ],
        PerkPointFrequency = [
            8,
            6,
            4
        ],
        PerksOffset = [
            0,
            20,
            50
        ],
        ExtraLevelUpPoints = [0, 2 ,5],
        ExtraLevelUpPointsWeight = [
            200,
            210,
            310,
            410,
            440,
            440,
            470,
            500
        ]
    }

    EL_LevelUpAttributes = [
        {//Hitpoints
            Min = [2, 3, 4, 4, 5],
            Max = [4, 4, 4, 5, 5]
        },
        {//Bravery
            Min = [1, 1, 2, 2, 3],
            Max = [1, 2, 2, 3, 3]
        },
        {//Fatigue
            Min = [2, 3, 4, 4, 5],
            Max = [4, 4, 4, 5, 5]
        },
        {//Initiative
            Min = [3, 4, 5, 5, 6],
            Max = [5, 5, 5, 6, 6]
        },
        {//MeleeSkill
            Min = [1, 2, 3, 3, 4],
            Max = [3, 3, 3, 4, 4]
        },
        {//RangedSkill
            Min = [1, 2, 3, 3, 4],
            Max = [3, 3, 3, 4, 4]
        },
        {//MeleeDefense
            Min = [1, 2, 3, 3, 4],
            Max = [3, 3, 3, 4, 4]
        },
        {//RangedDefense
            Min = [1, 2, 3, 3, 4],
            Max = [3, 3, 3, 4, 4]
        }
    ],

    EL_Talent = {
        Max = [
            3,
            3,
            4
        ],
        Chance = [
            40,
            70,
            90,
            100
        ],
        RankBonus = [
            0,
            1,
            2
        ],
    }

    EL_Rank1Chance = {
        Factor = {
            Mult = [
                0,
                2,
                0
            ],
            Offset = [
                0,
                -10,
                30
            ],
            Range = [
                5,
                20
            ],
        },
        Table = []

        function EL_getChance(_EL_Index) {
            return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_Player.EL_Rank1Chance);
        }
    },

    EL_Rank2Chance = {
        Factor = {
            Mult = [
                0,
                1,
                0
            ],
            Offset = [
                0,
                -10,
                10,
            ],
            Range = [
                10,
                20
            ]
        },
        Table = []

        function EL_getChance(_EL_Index) {
            return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_Player.EL_Rank2Chance);
        }

    },

    EL_PerkTree = {
        RankNeeded = [
            1,//Style
            2,//Perfession
            2,//Special
            1,//Class
            1,//Defense
            0,//enemy
            2,//magic
            0,//Traits
            0 //Weapon
        ]

        function EL_AddRandomPerkTreeToPlayer(_player, _perk_num) {
            local type_tree_len = [];
            local type_tree_offset = [];
            local excluded_list = [
                //this.Const.Perks.SwordmasterProfessionTree
            ];
            local total_weight = 0;
            local rank = _player.EL_getRankLevel();
            local background = _player.getBackground();
            type_tree_len.push(gt.Const.Perks.StylesTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.ProfessionTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.SpecialTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.ClassTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.DefenseTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.EnemyTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.MagicTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.TraitsTrees.Tree.len());
            type_tree_len.push(gt.Const.Perks.WeaponTrees.Tree.len());
            if(background.m.CustomPerkTreeMap != null) {
                foreach (category in background.m.CustomPerkTreeMap)
                {
                    foreach (tree_in_map in category)
                    {
                        excluded_list.push(tree_in_map.ID);
                    }
                }
            }

            for(local type_count = 0; type_count < type_tree_len.len(); ++type_count) {
                type_tree_offset.push(total_weight);
                if(rank >= this.RankNeeded[type_count]) {
                    total_weight += type_tree_len[type_count];
                }
            }
            type_tree_offset.push(total_weight);
            if(total_weight == 0){
                return;
            }
            while( _perk_num > 0 ) {
                local roll = this.Math.rand(0, total_weight - 1);
                local tree_list = null;
                local add_tree = null;

                local add_tree_list = [];
                if(roll >= type_tree_offset[0] && roll < type_tree_offset[1]) {
                    tree_list = this.Const.Perks.StylesTrees.Tree;
                }
                else if(roll >= type_tree_offset[1] && roll < type_tree_offset[2]) {
                    tree_list = this.Const.Perks.ProfessionTrees.Tree;
                }
                else if(roll >= type_tree_offset[2] && roll < type_tree_offset[3]) {
                    tree_list = this.Const.Perks.SpecialTrees.Tree;
                }
                else if(roll >= type_tree_offset[3] && roll < type_tree_offset[4]) {
                    tree_list = this.Const.Perks.ClassTrees.Tree;
                }
                else if(roll >= type_tree_offset[4] && roll < type_tree_offset[5]) {
                    tree_list = this.Const.Perks.DefenseTrees.Tree;
                }
                else if(roll >= type_tree_offset[5] && roll < type_tree_offset[6]) {
                    tree_list = this.Const.Perks.EnemyTrees.Tree;
                }
                else if(roll >= type_tree_offset[6] && roll < type_tree_offset[7]) {
                    tree_list = this.Const.Perks.MagicTrees.Tree;
                }
                else if(roll >= type_tree_offset[7] && roll < type_tree_offset[8]) {
                    tree_list = this.Const.Perks.TraitsTrees.Tree;
                }
                else if(roll >= type_tree_offset[8] && roll < type_tree_offset[9]) {
                    tree_list = this.Const.Perks.WeaponTrees.Tree;
                }
                if(tree_list != null){
                    foreach (tree in tree_list)
                    {
                        if (excluded_list.find(tree.ID) == null)
                        {
                            add_tree_list.push(tree);
                        }
                    }
                    if (add_tree_list.len() != 0)
                    {
                        add_tree = add_tree_list[this.Math.rand(0, add_tree_list.len() - 1)];
                        if (add_tree.Tree.len() != 0)
                        {
                            foreach( perk_level, perk_list in add_tree.Tree )
                            {
                                foreach( perk in perk_list )
                                {
                                    if(background.addPerk(perk, perk_level) == true) {
                                        _perk_num -= 1;
                                         //this.logInfo("_perk_num : " + _perk_num);
                                    }
                                    else {
                                        //this.logInfo("add failed");
                                    }
                                }
                            }

                            // background.addPerkGroup(add_tree.Tree);
                            // _perk_num -= add_tree.Tree.len();

                            excluded_list.push(add_tree.ID);

                        }
                    }
                    else {
                        break;
                    }
                }
                else {
                    break;
                }
            }
        }
    }

    EL_Modifiers = {
        ResourceModifiersMult = {
            Ammo = 0.01,
            ArmorParts = 0.04,
            Meds = 0.04,
            Stash = 0.01,
            Healing = 0.08,
            Injury = 0.08,
            Repair = 0.08,
            Salvage = 0.08,
            Crafting = 0.08,
            Barter = 0.08,
            ToolConsumption = 0.08,
            MedConsumption = 0.08,
            Hunting = 0.08,
            Fletching = 0.08,
            Scout = 0.08,
            Gathering = 0.08,
            Training = 0.08
        },

        function EL_setModifiersLevel(_EL_level, _EL_background) {
            if(_EL_background == null) {
                return;
            }
            _EL_background.m.Modifiers.Ammo = this.Math.floor(_EL_background.m.BaseModifiers.Ammo * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Ammo));
            _EL_background.m.Modifiers.ArmorParts = this.Math.floor(_EL_background.m.BaseModifiers.ArmorParts * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.ArmorParts));
            _EL_background.m.Modifiers.Meds = this.Math.floor(_EL_background.m.BaseModifiers.Meds * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Meds));
            _EL_background.m.Modifiers.Stash = this.Math.floor(_EL_background.m.BaseModifiers.Stash * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Stash));
            _EL_background.m.Modifiers.Healing = this.Math.floor(_EL_background.m.BaseModifiers.Healing * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Healing) * 100) / 100;
            _EL_background.m.Modifiers.Injury = this.Math.floor(_EL_background.m.BaseModifiers.Injury * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Injury) * 100) / 100;
            _EL_background.m.Modifiers.Repair = this.Math.floor(_EL_background.m.BaseModifiers.Repair * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Repair) * 100) / 100;
            _EL_background.m.Modifiers.Salvage = this.Math.floor(_EL_background.m.BaseModifiers.Salvage * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Salvage) * 100) / 100;
            _EL_background.m.Modifiers.Crafting = this.Math.floor(_EL_background.m.BaseModifiers.Crafting * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Crafting) * 100) / 100;
            _EL_background.m.Modifiers.Barter = this.Math.floor(_EL_background.m.BaseModifiers.Barter * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Barter) * 100) / 100;
            _EL_background.m.Modifiers.ToolConsumption = this.Math.floor(_EL_background.m.BaseModifiers.ToolConsumption * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.ToolConsumption) * 100) / 100;
            _EL_background.m.Modifiers.MedConsumption = this.Math.floor(_EL_background.m.BaseModifiers.MedConsumption * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.MedConsumption) * 100) / 100;
            _EL_background.m.Modifiers.Hunting = this.Math.floor(_EL_background.m.BaseModifiers.Hunting * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Hunting) * 100) / 100;
            _EL_background.m.Modifiers.Fletching = this.Math.floor(_EL_background.m.BaseModifiers.Fletching * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Fletching) * 100) / 100;
            _EL_background.m.Modifiers.Scout = this.Math.floor(_EL_background.m.BaseModifiers.Scout * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Scout) * 100) / 100;
            _EL_background.m.Modifiers.Gathering = this.Math.floor(_EL_background.m.BaseModifiers.Gathering * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Gathering) * 100) / 100;
            _EL_background.m.Modifiers.Training = this.Math.floor(_EL_background.m.BaseModifiers.Training * (1 + _EL_level * this.Const.EL_Player.EL_Modifiers.ResourceModifiersMult.Training) * 100) / 100;
            if(this.World.State.getPlayer() != null) {
                this.World.State.getPlayer().calculateStashModifier();
            }
        }
    }


};

while (gt.Const.LevelXP.len() != 0)
{
    gt.Const.LevelXP.pop();
}

for( local level = 1, current_level_exp = 0, level_exp = 0; level <= gt.Const.EL_Player.EL_PlayerLevel.Max; ++level )
{
    level_exp += current_level_exp;
    if(level < gt.Const.EL_Player.EL_PlayerLevel.Part1) {
        current_level_exp = (2 * level - 1) * gt.Const.EL_Player.EL_PlayerLevel.Part1Factor;
    }
    else {
        current_level_exp *= gt.Const.EL_Player.EL_PlayerLevel.Part2Factor;
    }
	gt.Const.LevelXP.push(gt.Math.floor(level_exp));
}

this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_Player.EL_Rank1Chance);
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_Player.EL_Rank2Chance);
