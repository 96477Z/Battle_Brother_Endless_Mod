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
        BaseStableLevel = 100,
        BaseStableMult = 27,
        LevelUpBaseDay = 7,
        //1.1/1.085
        LevelUpMult = 1.013825,
        Table = [],
    },

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
        0.4,
        0.6,
        0.8,
        1
    ],

    EL_WorldChangeEvent = {
        DifficultyCooldown = 50,
        LevelCooldown = 30,
        OptionNum = 16,
        OptionNumPurPage = 4,
        RewardTimesPurLevel = 1,
        DefaultOption = 7,
        //DefaultOption = 15,
        DifficultyMult = [
            0.1,
            0.2,
            0.3,
            0.4,
            0.55,
            0.70,
            0.85,
            1.0,
            1.2,
            1.4,
            1.6,
            1.8,
            2,
            2.2,
            2.6,
            3
        ],
        WorldLevelOffset = [
            -1,
            0,
            1,
            2,
            3,
            4,
            5,  //1
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14
        ]
    }

};



//World level
for( local level = 0, current_level_day_needed = this.Const.EL_World.EL_WorldLevel.LevelUpBaseDay, level_day_need = 0;
    level < this.Const.EL_World.EL_WorldLevel.BaseStableLevel; ++level )
{
	level_day_need += current_level_day_needed;
    current_level_day_needed *= this.Const.EL_World.EL_WorldLevel.LevelUpMult;
    this.Const.EL_World.EL_WorldLevel.Table.push(level_day_need);
}

//World stength
this.Const.EL_Config.EL_chanceTableCalculateAXB(this.Const.EL_World.EL_WorldStrength);
