this.agent_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.agent";
		this.m.Name = "Messenger\'s Rest";
		this.m.Description = "Through setting up a network of messengers, skilled agents can be employed to deliver information that you may find of use...after a short rest, of course.";
		this.m.Image = "ui/campfire/legend_agent_01";
		this.m.Cost = 2000;
		this.m.Effects = [
			"Reveals available contracts and active situations in the tooltip of settlements no matter where you are"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Have allied relations with a noble house or city state"
			},
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Eunuch, Messenger, Assassin (Southern or Northern)"
			}
		];
		this.m.RequiredSkills = [
			"background.eunuch",
			"background.messenger",
			"background.assassin",
			"background.assassin_southern",
			"background.legend_companion_melee",
			"background.legend_companion_ranged"
		];
	}

	function onUpdate()
	{
	}

	function onEvaluate()
	{
		local allied = false;
		local factions = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);
		factions.extend(this.World.FactionManager.getFactionsOfType(this.Const.FactionType.OrientalCityState));

		foreach( f in factions )
		{
			if (f.getPlayerRelation() >= 90.0)
			{
				this.m.Requirements[0].IsSatisfied = true;
				break;
			}
		}

		this.follower.onEvaluate();
	}

});

