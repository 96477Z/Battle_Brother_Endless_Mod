this.el_named_item_ambition_1 <- this.inherit("scripts/ambitions/ambition", {
	m = {
		EL_RankNeed = this.Const.EL_Item.Type.Fine
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_named_item_1";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "A respectable company is recognized by their equipment. We should head out\nand claim either a famed weapon, shield, armor or helmet to increase our renown.";
		this.m.RewardTooltip = "Gain an additional 100 renown for your victory.";
		this.m.UIText = "拥有至少1件2阶装备";
		this.m.TooltipText = "拥有至少1件2阶装备，武器、盾牌、盔甲或头盔。 Follow rumors in taverns to learn where famed items can be found, purchase them at specialized shops in large cities and castles, or go out on your own to explore and raid ruins and camps. The further away from civilization, the higher the chance of finding rare items.";
		this.m.SuccessText = "[img]gfx/ui/events/event_28.png[/img]It was no easy task seeking out one of those rare items recognized as a talisman of fighting men, but the %nameditem% is truly remarkable. The men fairly glow with pride after acquiring it. Around the fire, some of the brothers even grow maudlin and teary-eyed when in their cups, pawing it like a favorite hound.%SPEECH_ON%Isn\'t it beautiful?%SPEECH_OFF%%randombrother% asks while admiring it in the glow of the campfire, quickly cut off by another of the men.%SPEECH_ON%Turn it this way so I can have a proper peek!%SPEECH_OFF%In the days that follow your men are parading the %nameditem% around like the trophy head of some fearsome beast. Usually in taverns or at festivals, and near other sources of mead and beer, the brothers make a habit of showing their prize off everywhere you go.";
		this.m.SuccessButtonText = "This will serve us well.";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_named_item_0").isDone())
		{
			return;
		}
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		local items = this.World.Assets.getStash().getItems();

		foreach( item in items )
		{
			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				return true;
			}
		}

		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				return true;
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				return true;
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				return true;
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				return true;
			}
		}

		return false;
	}

	function onPrepareVariables( _vars )
	{
		local nameditem;
		local items = this.World.Assets.getStash().getItems();

		foreach( item in items )
		{
			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				nameditem = item;
				break;
			}
		}

		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				nameditem = item;
				break;
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (item != null && item != "-1" && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				nameditem = item;
				break;
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				nameditem = item;
				break;
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);

			if (item != null && item.EL_getRankLevel() >= this.m.EL_RankNeed)
			{
				nameditem = item;
				break;
			}
		}

		_vars.push([
			"nameditem",
			nameditem != null ? nameditem.getName() : "Famous Greatsword"
		]);
	}

	function onReward()
	{
		this.World.Assets.addBusinessReputation(100);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/icons/special.png",
			text = "You gain additional renown for having a famed item"
		});
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
