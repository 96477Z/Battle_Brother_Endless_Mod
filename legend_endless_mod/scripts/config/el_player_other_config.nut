local gt = this.getroottable();

if (!("EL_PlayerOther" in gt.Const))
{
	gt.Const.EL_PlayerOther <- {};
}

gt.Const.EL_PlayerOther <- {

    EL_Donkey = {
        Ammo = [
            100,
            200,
            500
        ],
        ArmorParts = [
            60,
            120,
            300
        ],
        Meds = [
            60,
            120,
            300
        ],
        Stash = [
            60,
            120,
            300
        ],
        Terrain = [
            0.1,
            0.2,
            0.5
        ]
    },

    EL_Animal = {
        DamageMultPurLevel = 0.08,
        ArmorMultPurLevel = 0.08,
    }
};
