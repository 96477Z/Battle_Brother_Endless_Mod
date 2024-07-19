this.brigand_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.brigand";
		this.m.Name = "Stolen Documents";
		this.m.Description = "The nobles and merchants are sloppy with their security and their underlings are easily intimidated. A well placed bribe, brawl or a set of light fingers can keep you informed on who is taking what where.";
		this.m.Image = "ui/campfire/legend_brigand_01";
		this.m.Cost = 2500;
		this.m.Effects = [
			"Makes you see the position of some caravans at all times and even if outside your sight radius"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Raider, Barbarian, Deserter"
			}
		];
		this.m.RequiredSkills = [
			"background.raider",
			"background.barbarian",
			"background.deserter",
			"background.legend_companion_melee",
			"background.legend_companion_ranged"
		];
	}

	function onUpdate()
	{
		if ("IsBrigand" in this.World.Assets.m)
		{
			this.World.Assets.m.IsBrigand = true;
		}
	}

});

