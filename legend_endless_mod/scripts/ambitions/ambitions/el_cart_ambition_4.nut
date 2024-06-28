this.el_cart_ambition_4 <- this.inherit("scripts/ambitions/ambition", {
	m = {
        EL_SlotGiven = 100,
        EL_MoneyNeed = 400000,
        EL_MoneyCost = 200000
    },
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_cart_4";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We can barely carry any more equipment or spoils of war.\n让我们存个" + this.m.EL_MoneyNeed + "克朗买辆货车来减轻负担吧！";
		this.m.RewardTooltip = "You\'ll unlock an additional " + this.m.EL_SlotGiven + " slots in your inventory.奖励一件传奇饰品。";
		this.m.UIText = "Have at least " + this.m.EL_MoneyNeed + " crowns";
		this.m.TooltipText = "Gather the amount of " + this.m.EL_MoneyNeed + " crowns or more, so that you can afford to buy a cart for additional inventory space. You can make money by completing contracts, looting camps and ruins, or trading.";
		this.m.SuccessText = "[img]gfx/ui/events/event_158.png[/img]Gathering enough crowns to pay the cartmaker for his work did cost you an arm and a leg, quite literally in some cases. Now the proud owner of a new wagon, you\'re able to carry both more equipment and more spoils of war, be it silverware and golden crowns, or the half-torn and lice filled gambeson of a random thug.\n\nAfter traveling the first miles with the new wheels you notice that %randombrother% seems to be missing. Looking around, you eventually find him hidden behind some grain bags on the wagon, snoring away peacefully. Some cold water to the head and a boot to the butt quickly get the sluggard back on his feet and walking like the others. Still, you better make sure the men know their place.%SPEECH_ON%I won\'t have any of this! The only way anyone of the %companyname% will ever find himself on this wagon is carrying his own head under the arm! Be ever watchful and have your arms at the ready when we travel these lands!%SPEECH_OFF%The men grumble and continue on.";
		this.m.SuccessButtonText = "Get moving!";
	}

	function getUIText()
	{
		return this.m.UIText + " (" + this.World.Assets.getMoney() + "/" + this.m.EL_MoneyNeed + ")";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_cart_3").isDone())
		{
			return;
		}
		this.m.Score = 2 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Assets.getMoney() >= this.m.EL_MoneyNeed)
            {
                return true;
            }
            return false;
	}

	function onReward()
	{
        local stash = this.World.Assets.getStash();
        this.World.Assets.addMoney(-this.m.EL_MoneyCost);
        this.m.SuccessList.push({
            id = 10,
            icon = "ui/icons/asset_money.png",
            text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + this.m.EL_MoneyCost + "[/color] Crowns"
        });
        if(!this.World.Flags.has("EL_ExtraStash")) {
            this.World.Flags.set("EL_ExtraStash", 0);
        }
        this.World.Flags.set("EL_ExtraStash", this.World.Flags.get("EL_ExtraStash") + this.m.EL_SlotGiven);
        this.m.SuccessList.push({
            id = 10,
            icon = "ui/icons/special.png",
            text = "You gain " + this.m.EL_SlotGiven + " additional inventory slots"
        });
		local item = this.new("scripts/items/el_accessory/el_cart_ambition_item");
		stash.add(item);
		this.m.SuccessList.push({
			id = 10,
			icon = "ui/items/" + item.getIcon(),
			text = "You gain " + item.getName()
		});
        this.World.State.getPlayer().calculateStashModifier();
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

