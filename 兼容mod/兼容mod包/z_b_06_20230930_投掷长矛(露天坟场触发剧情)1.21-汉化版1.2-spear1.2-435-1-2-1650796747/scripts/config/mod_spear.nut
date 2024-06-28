local gt = this.getroottable();


gt.Const.EntityType.SkeletonCenturion <- gt.Const.EntityType.len() -3
gt.Const.Strings.EntityName.push("Centurion Longinus")
gt.Const.Strings.EntityNamePlural.push("Centurion Longinus")
gt.Const.EntityIcon.push("skeleton_01_orientation")

gt.Const.World.Spawn.Troops.SkeletonCenturion <-
	{
		ID = this.Const.EntityType.SkeletonCenturion,
		Variant = 1,
		Strength = 40,
		Cost = 40,
		Row = 1,
		Script = "scripts/entity/tactical/enemies/skeleton_centurion",
		NameList = "Centurion Longinus",
		TitleList = null
	}
gt.Const.Tactical.Actor.SkeletonCenturion <- {
	XP = 1000,
	ActionPoints = 9,
	Hitpoints = 20,
	Bravery = 100,
	Stamina = 100,
	MeleeSkill = 5,
	RangedSkill = 0,
	MeleeDefense = 3,
	RangedDefense = 30,
	Initiative = 110,
	FatigueEffectMult = 0.0,
	MoraleEffectMult = 0.0,
	Armor = [
		0,
		0
	]
	
}
gt.Const.Tactical.Actor.Totem <- {
	XP = 0,
	ActionPoints = 8,
	Hitpoints = 100,
	Bravery = 100,
	Stamina = 100,
	MeleeSkill = 60,
	RangedSkill = 80,
	MeleeDefense = 0,
	RangedDefense = 0,
	Initiative = 50,
	FatigueEffectMult = 0.0,
	MoraleEffectMult = 0.0,
	Armor = [
		50,
		50
	]
	
}

gt.Const.ProjectileType.SpearofLonginus <- gt.Const.ProjectileType.COUNT;
gt.Const.ProjectileType.COUNT = gt.Const.ProjectileType.COUNT + 1;
/*
gt.Const.ProjectileType <- {
	None = 0,
	Arrow = 1,
	Javelin = 2,
	Bola = 3,
	Axe = 4,
	Flask = 5,
	Flask2 = 6,
	Stone = 7,
	Rock = 8,
	Bomb1 = 9,
	Bomb2 = 10,
	SpearofLonginus = 11,
	COUNT = 12
};
*/
//local SpearofLonginusDecals = [];
gt.Const.ProjectileDecals.push("SpearofLonginus_missed_01");
gt.Const.ProjectileSprite.push("projectile_SpearofLonginus");
/*
gt.Const.ProjectileDecals <- [
	[],
	[
		"arrow_missed_01",
		"arrow_missed_02",
		"arrow_missed_03",
		"arrow_missed_04",
		"arrow_missed_05",
		"arrow_missed_06",
		"arrow_missed_07",
		"arrow_missed_08"
	],
	[
		"javelin_missed_10",
		"javelin_missed_11",
		"javelin_missed_12"
	],
	[
		"balls_missed_01",
		"balls_missed_02"
	],
	[
		"axe_missed_01",
		"axe_missed_02",
		"axe_missed_03"
	],
	[],
	[],
	[
		"detail_stone_00",
		"detail_stone_01",
		"detail_stone_02",
		"detail_stone_03",
		"detail_stone_04"
	],
	[],
	[],
	[],
	[],
];
gt.Const.ProjectileSprite <- [
	"",
	"projectile_01",
	"projectile_02",
	"projectile_03",
	"projectile_04",
	"projectile_05",
	"projectile_06",
	"projectile_07",
	"projectile_08",
	"projectile_09",
	"projectile_10",
	"projectile_SpearofLonginus"
];
*/