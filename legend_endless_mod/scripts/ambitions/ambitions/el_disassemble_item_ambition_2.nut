this.el_disassemble_item_ambition_2 <- this.inherit("scripts/ambitions/ambition", {
	m = {
        EL_AmountNeed = 10000
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_disassemble_item_2";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "强化装备需要大量的精华，仅靠战场掉落的蚊子腿太少了，让我们去武器店或盔甲店将不用的装备分解，获取更多精华！。";
		this.m.UIText = "分解你的装备, 获取精华";
		this.m.TooltipText = "依靠分解装备共计获取" + this.m.EL_AmountNeed + "精华。";
		this.m.SuccessText = "[img]gfx/ui/events/event_13.png[/img]一件又一件的装备伴随着捶打化作粉末，但他们的残留物被你们精心保管了起来。一开始很多人不解你的判断，这些粉尘能有什么用？但你知道，他们才是保证你们不被时代所抛弃的关键。";
		this.m.SuccessButtonText = "That\'s the bottom line.";
	}

	function getUIText()
	{
        local consume_amount = this.World.Statistics.getFlags().getAsInt("DisassembleGreyEssenceGain");
		return this.m.UIText + " (" + consume_amount + "/" + this.m.EL_AmountNeed + ")";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_disassemble_item_1").isDone())
		{
			return;
		}
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Statistics.getFlags().getAsInt("DisassembleGreyEssenceGain") >= this.m.EL_AmountNeed)
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

