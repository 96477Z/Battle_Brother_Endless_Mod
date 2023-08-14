local gt = getroottable();

if (!("EL_World" in gt.Const))
{
	gt.Const.EL_World <- {};
}

gt.Const.EL_World <- {

    EL_WorldSelectDistanceDay = 40,

    EL_WorldLevelMin = 0,
    EL_BaseWorldLevelStableLevel = 100,
    EL_BaseWorldLevelStableGrowthMultFactor = 27,
    EL_WorldLevelLevelUpBaseDay = 7,
    //1.1/1.085
    EL_WorldLevelLevelUpMultFactor = 1.013825,

    EL_WorldStrengthMin = 40,
    EL_WorldStrengthOffsetBase = 0,

    EL_BaseWorldLevelDay = [],

    EL_WorldStrengthAddSpeed = [
        10,
        6,
        4,
        3
    ],

    EL_WorldStrengthAddSpeedChangeDay = [
        0,
        15,
        50,
        100
    ],

    EL_WorldStrengthOffset = [],

    EL_WorldStartMultFactor = [
        0.4,
        0.6,
        0.8,
        1
    ],

    EL_WorldEventDifficultyMultFactor = [
        0.1,
        0.4,
        0.7,
        1,
        1.5,
        2.2,
        3.3,
        5,
        7.5,
        10
    ],

    EL_WorldChangeEventWorldLevelOffset = [
        -3,
        -2,
        -1,
        0,
        1,
        2,
        3,
        4,
        5,
        6
    ]

};

//World level
for( local level = 0, current_level_day_needed = this.Const.EL_World.EL_WorldLevelLevelUpBaseDay, level_day_need = 0;
    level < this.Const.EL_World.EL_BaseWorldLevelStableLevel; ++level )
{
	level_day_need += current_level_day_needed;
    current_level_day_needed *= this.Const.EL_World.EL_WorldLevelLevelUpMultFactor;
    this.Const.EL_World.EL_BaseWorldLevelDay.push(level_day_need);
}

//World stength
this.Const.EL_World.EL_WorldStrengthOffset.push(this.Const.EL_World.EL_WorldStrengthOffsetBase);
for( local count = 0, offset = this.Const.EL_World.EL_WorldStrengthOffsetBase;
	 count < this.Const.EL_World.EL_WorldStrengthAddSpeed.len() - 1; ++count )
{

    offset += this.Const.EL_World.EL_WorldStrengthAddSpeed[count] *
              this.Const.EL_World.EL_WorldStrengthAddSpeedChangeDay[count + 1]
                               this.Const.EL_World.EL_WorldLevelLevelUpMultFactor;
	this.Const.EL_World.EL_WorldStrengthOffset.push(offset);
}