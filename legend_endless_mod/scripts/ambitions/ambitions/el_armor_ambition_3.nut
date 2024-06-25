this.el_armor_ambition_3 <- this.inherit("scripts/ambitions/ambition", {
	m = {
        EL_RankNeed = this.Const.EL_Item.Type.Epic,
        EL_ConditionMaxNeed = 300
    },
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_armor_3";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We shall outfit a contingent of at least three men with heavy armor\nto act as a bulwark against dangerous opponents.";
		this.m.UIText = "拥有3件300+基础耐久的3阶盔甲和头盔";
		this.m.TooltipText = "拥有3件至少3阶的盔甲和头盔，每件装备都有300或以上的基础耐久。 Whether you buy them or loot them off of the battlefield, they will protect your men equally well.";
		this.m.SuccessText = "[img]gfx/ui/events/event_35.png[/img]Spirits rise with the acquisition of more heavy armor and helmets for the %companyname%.%SPEECH_ON%Feel that? That is craftsmanship.%SPEECH_OFF%%randombrother% says, rapping a hardwood pommel against his fellow brother\'s newly armored head.%SPEECH_ON%Think of all the well-paid contracts we missed out on because of our crummy armor and pathetic equipment before.%SPEECH_OFF%From now on, the backline can breathe easier going into battle, knowing that their heavily armored brothers will be there to take the brunt of the assault. Should they fall, their unwieldy bulk will at least delay the enemy, giving their lightly armored companions a chance to swiftly retreat.";
		this.m.SuccessButtonText = "This will serve us well in the battles to come.";
	}

	function getArmor()
	{
		local ret = {
			Armor = 0,
			Helmet = 0
		};
		local items = this.World.Assets.getStash().getItems();

		foreach( item in items )
		{
			if (item != null)
			{
				if (item.isItemType(this.Const.Items.ItemType.Armor) && item.getArmorMax() / (1 + this.Const.EL_Armor.EL_LevelFactor.Condition * item.m.EL_CurrentLevel) >= this.m.EL_ConditionMaxNeed && item.EL_getRankLevel() >= this.m.EL_RankNeed)
				{
					++ret.Armor;
				}
				else if (item.isItemType(this.Const.Items.ItemType.Helmet) && item.getArmorMax() / (1 + this.Const.EL_Armor.EL_LevelFactor.Condition * item.m.EL_CurrentLevel) >= this.m.EL_ConditionMaxNeed && item.EL_getRankLevel() >= this.m.EL_RankNeed)
				{
					++ret.Helmet;
				}
			}
		}

		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (item != null)
			{
				if (item.EL_getBaseWithRankConditionMax() >= this.m.EL_ConditionMaxNeed && item.EL_getRankLevel() >= this.m.EL_RankNeed)
				{
					++ret.Helmet;
				}
			}

			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);

			if (item != null)
			{
				if (item.EL_getBaseWithRankConditionMax() >= this.m.EL_ConditionMaxNeed && item.EL_getRankLevel() >= this.m.EL_RankNeed)
				{
					++ret.Armor;
				}
			}
		}
		return ret;
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_armor_2").isDone())
		{
			return;
		}

		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		local armor = this.getArmor();

		if (armor.Armor >= 3 && armor.Helmet >= 3)
		{
			return true;
		}

		return false;
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
