this.trader_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.trader";
		this.m.Name = "Secure Chests";
		this.m.Description = "While not common, some companies have special goods stashed away to tell on the road to travellers. These goods are always kept in the most fortified chests the company has to offer, to prevent prying fingers from outside and inside the camp.";
		this.m.Image = "ui/campfire/legend_trader_01";
		this.m.Cost = 3500;
		this.m.Effects = [
			"Increases the amount of trade goods for sale by 1 for each location that produces them, like salt near salt mines, allowing you to trade at higher volumes"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = ""
			},
			{
				IsSatisfied = false,
				Text = "Have at least one of the following backgrounds: Caravan Hand, Peddler, Trader, Donkey"
			}
		];
		this.m.RequiredSkills = [
			"background.caravan_hand",
			"background.legend_trader",
			"background.legend_commander_trader",
			"background.legend_donkey_background",
			"background.peddler",
			"background.legend_companion_melee",
			"background.legend_companion_ranged"
		];
	}

	function onEvaluate()
	{
		this.m.Requirements[0].Text = "Sold " + this.Math.min(25, this.World.Statistics.getFlags().getAsInt("TradeGoodsSold")) + "/25 trade goods.";

		if (this.World.Statistics.getFlags().getAsInt("TradeGoodsSold") >= 25)
		{
			this.m.Requirements[0].IsSatisfied = true;
		}

		this.follower.onEvaluate();
	}

});

