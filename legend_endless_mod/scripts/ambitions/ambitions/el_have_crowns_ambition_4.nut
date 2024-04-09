this.el_have_crowns_ambition_4 <- this.inherit("scripts/ambitions/ambition", {
	m = {
        EL_CrownsNeed = 2000000
    },
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_have_crowns_4";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "Should a battle or two go against us we may find ourselves out of pocket and\nshort of equipment. The company will therefore build a reserve of " + this.m.EL_CrownsNeed + " crowns.";
		this.m.UIText = "Have at least " + this.m.EL_CrownsNeed + " crowns";
		this.m.TooltipText = "Have at least " + this.m.EL_CrownsNeed + " crowns as a reserve, in order to persevere when things may turn bad in the future. You can make money by completing contracts, looting camps and ruins, or trading.";
		this.m.SuccessText = "[img]gfx/ui/events/event_04.png[/img]Your increased store of coin and other valuables lets you sleep easier. The men do too, knowing that they won\'t have to chase you across the steppe when payroll is due. You\'ll no longer be at a disadvantage when it comes to contract negotiations, and you\'ll not end up short on men or equipment should a battle or two go against you.\n\nYour new reserve also begins to open doors for the %companyname%. Merchants, money lenders and nobles have one thing in common: they prefer to rub elbows with their own kind. Merely getting an audience can be a chore if they suspect you have empty pockets. But now that you\'ve proven yourself to be a man of resource, the company has become more attractive to wealthy individuals and decision makers.";
		this.m.SuccessButtonText = "Excellent!";
	}

	function getUIText()
	{
		return this.m.UIText + " (" + this.World.Assets.getMoney() + "/" + this.m.EL_CrownsNeed + ")";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_have_crowns_3").isDone())
		{
			return;
		}

		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Assets.getMoney() >= this.m.EL_CrownsNeed)
		{
			return true;
		}

		return false;
	}

	function onReward()
	{
		local item = this.new("scripts/items/el_accessory/el_have_crowns_ambition_item");
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
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
	}

});
