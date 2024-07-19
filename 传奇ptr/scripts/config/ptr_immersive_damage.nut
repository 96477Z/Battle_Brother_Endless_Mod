local gt = this.getroottable();

if (!("PTR" in gt))
{
	gt.PTR <- {};
}

gt.PTR.ImmersiveDamage <- {};

gt.PTR.ImmersiveDamage.MinDamageMult <- 0.4;
gt.PTR.ImmersiveDamage.MaxDamageMult <- 1.0;
gt.PTR.ImmersiveDamage.MinHitChance <- 35;
gt.PTR.ImmersiveDamage.MaxHitChance <- 70;
gt.PTR.ImmersiveDamage.ChanceCriticalFailure <- 0;
gt.PTR.ImmersiveDamage.ChanceFullDamage <- 20;

gt.PTR.ImmersiveDamage.GoodnessThresholds <- [
	"Perfect",
	"Good",
	"Decent",
	"Poor",
	"Clumsy",
	"Pathetic"
];

gt.PTR.ImmersiveDamage.GoodnessThreshold <- {
	Perfect = { 
		Threshold = 1.0,
		FluffMelee = [
			" swung perfectly",
			" got a perfect hit",
			" struck true"
		],
		FluffRanged = [
			" hit the mark perfectly",
			" landed a perfect shot"
		]
	},
	Good = { 
		Threshold = 0.8,
		FluffMelee = [
			"\'s attack was impressive but not quite perfect",
			" almost got a perfect hit"
		],
		FluffRanged = [
			" almost hit the bullseye",
			" almost got the perfect shot"
		]
	},
	Decent = { 
		Threshold = 0.6,
		FluffMelee = [
			" managed to get a decent hit in",
			" managed a glancing hit"
		],
		FluffRanged = [
			" made a decent shot",
			"\'s shot was nothing to be ashamed of",
		]
	},
	Poor = { 
		Threshold = 0.4,
		FluffMelee = [
			" could not get a good angle on the attack",
			"\'s attack manages to scrape target"			
		],
		FluffRanged = [
			" could not get enough power in the shot"
		]
	},
	Clumsy = { 
		Threshold = 0.2,
		FluffMelee = [
			"\'s attack was clumsy",
			" just barely managed to get a hit"
		],
		FluffRanged = [
			" almost missed target"
		]
	},
	Pathetic = { 
		Threshold = 0,
		FluffMelee = [
			"\'s swing was poorly directed",
			"\'s attack was pathetic"
		],
		FluffRanged = [
			"\'s shot was poorly aimed",
			"\'s shot barely grazed target"
		]
	},
};