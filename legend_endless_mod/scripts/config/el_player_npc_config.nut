local gt = this.getroottable();

if (!("EL_PlayerNPC" in gt.Const))
{
	gt.Const.EL_PlayerNPC <- {};
}

gt.Const.EL_PlayerNPC <- {
    EL_XPValue = {
        Offset = 300,
        Mult = 30,
    },

    EL_ArmorDirectDamageMitigationMult = 0.1,

    EL_ShieldDamage = {
        Base = 1,
        MultPurCombatLevel = 0.08
    }

    EL_ExtraFatigueRecovery = {
        DivFactor = 20,
        Offset = -5,
    },

    EL_RankToMoraleMin = [
        0,
        0,
        1
    ]

    EL_CombatLevel = {
        HitChanceMult = 1,
        HitChangeFactor = 1.04,
        DamageFactor = 1.04
    }

    EL_Morale = {
        HeadCount = {
            Factor1 = 2,
            Factor2 = 2,
            Factor3 = 2
        },
        Hit = {
            PersentPurCheck = 20,
            Factor1 = 10,
            Factor2 = 0.5,
            Factor3 = 2
        },
        Death = {
            BaseOffset = 0,
            RankFactor = 0,
            CombatLevelFactor = 1.08,
            DistanceFactor = 3
        },
        Move = {
            BaseOffset = 50,
            RankFactor = 0,
            CombatLevelFactor = 1.08,
        },
        Fleeing = {
            BaseOffset = 25,
            RankFactor = 0,
            CombatLevelFactor = 1.08,
            DistanceFactor = 3
        },

        Effect = {
            BraveryOffset = [-30, -20, -10, 0, 10, 0],
            InitiativeOffset = [-30, -20, -10, 0, 10, 0],
            MeleeSkillOffset = [-30, -20, -10, 0, 10, 0],
            RangedSkillOffset = [-30, -20, -10, 0, 10, 0],
            MeleeDefenseOffset = [-30, -20, -10, 0, 10, 0],
            RangedDefenseOffset = [-30, -20, -10, 0, 10, 0],
            FatigueOnSkillUseOffset = [3, 2, 1, 0, -1, 0],
            DamageTotalMult = [0.7, 0.8, 0.9, 1, 1.1, 1],
            DamageReceivedTotalMult = [1.3, 1.2, 1.1, 1, 0.9, 1],
        }
    }
};


gt.Const.CharacterProperties.EL_CombatLevel <- 0;
local onSerialize = gt.Const.CharacterProperties.onSerialize;
gt.Const.CharacterProperties.onSerialize = function ( _out )
{
    onSerialize( _out );
    _out.writeF32(this.EL_CombatLevel);
    _out.writeI16(this.ActionPoints);
    //this.logInfo("this.EL_CombatLevel : " + this.EL_CombatLevel);
}
local onDeserialize = gt.Const.CharacterProperties.onDeserialize;
gt.Const.CharacterProperties.onDeserialize = function ( _in )
{
    onDeserialize( _in );
    this.EL_CombatLevel = _in.readF32();
    this.ActionPoints = _in.readI16();
    //this.logInfo("this.EL_CombatLevel : " + this.EL_CombatLevel);
}
