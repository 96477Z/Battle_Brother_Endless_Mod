this.el_upgrade_item_ambition_1 <- this.inherit("scripts/ambitions/ambition", {
	m = {
        EL_AmountNeed = 10000
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_upgrade_item_1";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "战场局势多变，提升你的装备能大大增强战队的实力。";
		this.m.UIText = "强化你的装备, 消耗精华";
		this.m.TooltipText = "通过强化装备共计消耗" + this.m.EL_AmountNeed + "精华。";
		this.m.SuccessText = "[img]gfx/ui/events/event_82.png[/img]你成功取得了阶段性成果，战队的装备更强大了，每个兄弟脸上都洋溢着自信，他们确信在你的领导下将战无不胜！";
		this.m.SuccessButtonText = "That\'s the bottom line.";
	}

	function getUIText()
	{
        local consume_amount = this.World.Statistics.getFlags().getAsInt("UpgradeGreyEssenceConsume");
		return this.m.UIText + " (" + consume_amount + "/" + this.m.EL_AmountNeed + ")";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_upgrade_item_0").isDone())
		{
			return;
		}
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Statistics.getFlags().getAsInt("UpgradeGreyEssenceConsume") >= this.m.EL_AmountNeed)
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

