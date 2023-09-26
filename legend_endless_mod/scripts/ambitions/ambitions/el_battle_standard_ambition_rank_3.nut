this.el_battle_standard_ambition_rank_3 <- this.inherit("scripts/ambitions/ambition", {
	m = {},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_battle_standard_ambition_rank_3";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "Our battle standard needs an upgrade, so we shall gather 100,000 crowns for this.";
		this.m.RewardTooltip = "The battle standard rank will +1, and the level will reset, don't worry, the essence spent on the standard will return.";
		this.m.UIText = "Have at least 100,000 crowns";
		this.m.TooltipText = "Gather the amount of 100,000 crowns or more, so that you can upgrade your battle standard. You can make money by completing contracts, looting camps and ruins, or trading.";
		this.m.SuccessText = "[img]gfx/ui/events/event_65.png[/img]Your battle standard have been upgraded.";
		this.m.SuccessButtonText = "Yeah!";
	}

	function onUpdateScore()
	{
		if (this.World.Ambitions.getDone() < 1)
		{
			return;
		}
		if (!this.World.Ambitions.getAmbition("ambition.el_battle_standard_ambition_rank_2").isDone())
		{
			return;
		}
		this.m.Score = 10;
	}

	function onCheckSuccess()
	{
		if (this.World.Assets.getMoney() >= 100000 && this.World.Assets.getStash().hasEmptySlot())
		{
			return true;
		}
		return false;
	}

	function onReward()
	{
		local stash = this.World.Assets.getStash();
		local standard = stash.getItemByID("weapon.player_banner");
		if(standard == null) {
			local roster = this.World.getPlayerRoster().getAll();
			foreach( bro in roster )
			{
				local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

				if (item != null && item.getID() == "weapon.player_banner")
				{
					standard = item;
				}

				for( local i = 0; i < bro.getItems().getUnlockedBagSlots(); i = i )
				{
					item = bro.getItems().getItemAtBagSlot(i);

					if (item != null && item.getID() == "weapon.player_banner")
					{
						standard = item;
					}
					i = ++i;
				}
			}

		}
		local level = standard.EL_getLevel();
		local payment = 50000 - level * 250;
		this.World.Assets.addMoney(-payment);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/icons/asset_money.png",
			text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + payment + "[/color] Crowns"
		});
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/items/" + standard.getIcon(),
			text = "Your standard is now more stronger."
		});
		standard.EL_setRankLevel(3);
		standard.EL_setLevel(0);
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
	}

});
