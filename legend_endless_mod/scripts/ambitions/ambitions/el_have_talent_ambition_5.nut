this.el_have_talent_ambition_5 <- this.inherit("scripts/ambitions/ambition", {
	m = {
        EL_ManNeed = 3,
        EL_TalentNeed = 32
    },
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.el_have_talent_5";
		this.m.Duration = 99999.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We need real talent to bolster our ranks further.\nWe\'ll recruit the most talented we can find and mold him into a god of war!";
		this.m.UIText = "拥有 " + this.m.EL_ManNeed + " 个天赋总星数大于 " + this.m.EL_TalentNeed + " 的人。";
		this.m.TooltipText = "拥有 " + this.m.EL_ManNeed + " 个天赋总星数大于 " + this.m.EL_TalentNeed + " 的人。 Travel the land and seek the best of the best. Consider buying the \'Pre signed contracts\' equipment for your retinue.";
		this.m.SuccessText = "[img]gfx/ui/events/event_82.png[/img]When the miner find a diamond in the mountains, it is hurried away to the royal chambers. When the fisherman hauls the fattest catch of the day, a nobleman will have it himself. Good soldiers? To the lords as generals or trainers. Talented tailors? The finest fineries require the finest fingers, to the nobles he goes to serve. Houndmaster shows a bit of skill beyond bopping noses and barking commands? He can train wardogs for the highborn armies. So it is that this world snatches the talented as fast as the hawk pounces the rabbit which reveals itself.\n\n But now you\'ve your own catch: %star%. He is a genuine talent, showing remarkable aptitude in physicality, martial skills, and courage. Even the rest of the %companyname% can sense the man\'s presence as sure as one sense destiny and greatness. %star% is everything you\'d want in a mercenary, and were the company fitted entirely with a man of his mold, well, you\'d do more than chase contracts, you\'d conquer the whole world!";
		this.m.SuccessButtonText = "Unless, of course, a stray arrow catches him next battle.";
	}

	function getUIText()
	{
		local roster = this.World.getPlayerRoster().getAll();
        local bro_num = 0;

		foreach( bro in roster )
		{
			local n = 0;
			foreach( t in bro.getTalents() )
			{
				n += t;
			}

			if (n >= this.m.EL_TalentNeed)
			{
				++bro_num;
			}
		}

		return this.m.UIText + " (" + bro_num + "/" + this.m.EL_ManNeed + ")";
	}

	function onUpdateScore()
	{
		local roster = this.World.getPlayerRoster().getAll();
        if(roster.len() < this.m.EL_ManNeed)
        {
            return;
        }
		if (!this.World.Ambitions.getAmbition("ambition.el_have_talent_4").isDone())
		{
			return;
		}
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		local roster = this.World.getPlayerRoster().getAll();
        local bro_num = 0;

		foreach( bro in roster )
		{
			local n = 0;
			foreach( t in bro.getTalents() )
			{
				n += t;
			}

			if (n >= this.m.EL_TalentNeed)
			{
				++bro_num;
			}
			if (bro_num >= this.m.EL_ManNeed)
			{
				return true;
			}
		}

		return false;
	}

	function onReward()
	{
		local item = this.new("scripts/items/el_accessory/el_have_talent_ambition_item");
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

