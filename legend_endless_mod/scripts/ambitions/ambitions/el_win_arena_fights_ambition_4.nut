this.el_win_arena_fights_ambition_4 <- this.inherit("scripts/ambitions/ambition", {
	m = {
		EL_ArenaLevelNeed = 5
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_win_arena_fights_4";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "Let us seek fame and fortune fighting before crowds that chant our names.\nWe\'ll draw blood in the arenas of the south!";
		this.m.UIText = "Win arena fights";
		this.m.TooltipText = "在等级 " + this.m.EL_ArenaLevelNeed  + " 的竞技场中获得胜利。";
		this.m.SuccessText = "[img]gfx/ui/events/event_22.png[/img]Having dispatched all manner of creatures that walk on two legs or more, and sometimes perhaps none at all, you\'ve come to collect a fair bit of renown for your gladiatorial prowess. Southerners speak your name as though itself were the carrier of good news, vicariously relishing in your victories and hoping to see you win more. It is an odd spin of fate, as most attend the arenas to see gladiators find as grisly a demise as possible. To have the masses cheer for you is a strange realization indeed, though you just realize that when it is you in that light, your very presence filling the stands and bannisters, that there is still an ugly end the crowd seeks: that of your opponent. And, frankly, for that much coin you\'ve no problem satiating the audience\'s bloodlust.";
		this.m.SuccessButtonText = "I still hear them chanting our names!";
	}

	function getUIText()
	{
		local d = this.World.Assets.m.EL_ArenaMaxLevel;
		return this.m.UIText + " (" + this.World.Assets.m.EL_ArenaMaxLevel + "/" + this.m.EL_ArenaLevelNeed + ")";
	}

	function onUpdateScore()
	{
		if (!this.World.Ambitions.getAmbition("ambition.el_win_arena_fights_3").isDone())
		{
			return;
		}
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Assets.m.EL_ArenaMaxLevel >= this.m.EL_ArenaLevelNeed)
		{
			return true;
		}

		return false;
	}

	function onReward()
	{
		local item = this.new("scripts/items/el_accessory/el_win_arena_fights_ambition_item");
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

