this.el_trade_ambition_4 <- this.inherit("scripts/ambitions/ambition", {
	m = {
		AmountToBuy = 0,
		AmountToSell = 0
        EL_AmountNeed = 1000
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_trade_4";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "There\'s lots of crowns to be made with trading between towns.\nLet\'s earn us a fortune!";
		this.m.UIText = "Buy and sell trading goods";
		this.m.TooltipText = "Buy and sell " + this.m.EL_AmountNeed + " items of trading goods, such as furs, salt or spices. Buying them in small villages that produce them and selling them in big cities will earn you the most coin. Some trading goods are also exclusive to certain regions, like the southern deserts, and selling them in other parts of the world can further increase your profit margin.";
		this.m.SuccessText = "[img]gfx/ui/events/event_55.png[/img]The thought bore down on you from the start, and it is one that escapes many a mercenary captain. A thought so simple that perhaps its very simplicity camouflages it from a sword wielding leader\'s ego. If the %companyname% is to be traveling from city to city looking for sellsword work, it may as already have one foot in another vocation altogether: that of trade. You picked up on it quick, realizing that goods carry a different sort of currency than which appears at face, a value hidden from the eye, and hidden in the ripples of time and location themselves. Now you spend evenings struggling to tabulate the crowns. For once, it\'s a good problem to have.";
		this.m.SuccessButtonText = "That\'s the bottom line.";
        this.m.AmountToBuy = this.m.EL_AmountNeed;
        this.m.AmountToSell = this.m.EL_AmountNeed;
	}

	function getUIText()
	{
		local bought = this.m.EL_AmountNeed - (this.m.AmountToBuy - this.World.Statistics.getFlags().getAsInt("TradeGoodsBought"));
		local sold = this.m.EL_AmountNeed - (this.m.AmountToSell - this.World.Statistics.getFlags().getAsInt("TradeGoodsSold"));
		local d = this.Math.min(this.m.EL_AmountNeed, this.Math.min(bought, sold));
		return this.m.UIText + " (" + d + "/" + this.m.EL_AmountNeed + ")";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_trade_3").isDone())
		{
			return;
		}
		this.m.AmountToBuy = this.World.Statistics.getFlags().getAsInt("TradeGoodsBought") + this.m.EL_AmountNeed;
		this.m.AmountToSell = this.World.Statistics.getFlags().getAsInt("TradeGoodsSold") + this.m.EL_AmountNeed;
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Statistics.getFlags().getAsInt("TradeGoodsBought") >= this.m.AmountToBuy && this.World.Statistics.getFlags().getAsInt("TradeGoodsSold") >= this.m.AmountToSell)
		{
			return true;
		}

		return false;
	}

	function onReward()
	{
		local item = this.new("scripts/items/el_accessory/el_trade_ambition_item");
		stash.add(item);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/items/" + item.getIcon(),
			text = "You gain " + item.getName()
		});
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
		_out.writeU32(this.m.AmountToBuy);
		_out.writeU32(this.m.AmountToSell);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);

		if (_in.getMetaData().getVersion() >= 63)
		{
			this.m.AmountToBuy = _in.readU32();
			this.m.AmountToSell = _in.readU32();
		}
	}

});

