local gt = getroottable();

if (!("EL_World" in gt.Const))
{
	gt.Const.EL_World <- {};
}

gt.Const.EL_World <- {

    EL_EquipmentEssence = {
        RankNums = 5
    }

    EL_WorldLevel = {
        Min = 0,
        Max = 100,
        FastGrowLevel = 10,
        BaseStableLevel = 50,
        BaseStableMult = 18,
        LevelUpBaseDay = 10,
        //1.1/1.085
        LevelUpMult = 1.013825,
        Table = [],
    },

    EL_SoulEnergy = {
        Min = 10
    },

    EL_CombatDifficultFactor = [
        0,
        1,
        2,
        3
    ],

    EL_WorldStrength = {
        Min = 40,
        Factor = {
            Mult = [
                6,
                5,
                4,
                3,
                2,
                1
            ],
            Offset = [
                0,
                25,
                75,
                175,
                375,
                775
            ],
            Range = [
                25,
                50,
                100,
                200,
                400
            ]
        },
        Table = []

        function getWorldStrength(_EL_Index) {
            return this.Const.EL_Config.EL_chanceTableReadAXB(_EL_Index, this.Const.EL_World.EL_WorldStrength);
        }
    },

    EL_WorldStartMult = [
        0.7,
        0.8,
        0.9,
        1
    ],

    EL_WorldChangeEvent = {
        DifficultyCooldown = 50,
        LevelCooldown = 30,
        OptionNum = 12,
        OptionNumPurPage = 4,
        RewardTimesPurLevel = 1,
        DefaultOption = 3,
        DifficultyMinOption = [0, 1, 2, 3],
        DifficultyMult = [
            0.5,
            0.6,
            0.85,
            1.0,
            1.15,
            1.3,
            1.5,
            1.75,
            2,
            2.25,
            2.5,
            3
        ],
        WorldLevelMinOption = [0, 1, 2, 3],
        WorldLevelOffset = [
            -3,
            -2,
            -1,
            0,
            1,
            2,
            3,  //1
            4,
            5,
            6,
            7,
            8
        ]
    }

};



//World level
local level_day_need = 0;
for( local level = 0, current_level_day_needed = 1;
    level < this.Const.EL_World.EL_WorldLevel.FastGrowLevel; ++level )
{
    level_day_need += current_level_day_needed;
    current_level_day_needed += 1;
    this.Const.EL_World.EL_WorldLevel.Table.push(level_day_need);
}
for( local level = this.Const.EL_World.EL_WorldLevel.FastGrowLevel, current_level_day_needed = this.Const.EL_World.EL_WorldLevel.LevelUpBaseDay;
    level < this.Const.EL_World.EL_WorldLevel.BaseStableLevel; ++level )
{
    level_day_need += current_level_day_needed;
    current_level_day_needed *= this.Const.EL_World.EL_WorldLevel.LevelUpMult;
    this.Const.EL_World.EL_WorldLevel.Table.push(level_day_need);
}

//World stength
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_World.EL_WorldStrength);
