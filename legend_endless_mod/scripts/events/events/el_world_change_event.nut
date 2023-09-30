this.el_world_change_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.el_world_change";
		this.m.Title = "Difficulty Customization";
		this.m.Cooldown = this.Const.EL_World.EL_WorldChangeEvent.Cooldown * this.World.getTime().SecondsPerDay;
		local select_screen_num = this.Math.ceil(this.Const.EL_World.EL_WorldChangeEvent.OptionNum / this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage);
		for(local page = 0; page < select_screen_num; ++page) {
			local screen = {
				ID = "el_world_change_event_select_page_" + page,
				Text = "Nothing in particular but a periodical event for you to optimize the strength difficulty after played a fair long time, aiming to help you have a better experience.\n\n",
				Image = "",
				List = [],
				Characters = [],
				Options = [],
				function start( _event )
				{
				}
			}
			local current_page_option_num = this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage;
			if((page + 1) * this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage > this.Const.EL_World.EL_WorldChangeEvent.OptionNum) {
				current_page_option_num = this.Const.EL_World.EL_WorldChangeEvent.OptionNum % this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage;
			}
			for(local option_num = 0; option_num < current_page_option_num; ++option_num) {
				local option_index = page * this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage + option_num;
				local world_level_offset = this.Const.EL_World.EL_WorldChangeEvent.WorldLevelOffset[option_index];
				local mult_persent = this.Const.EL_World.EL_WorldChangeEvent.DifficultyMult[option_index] * 100;
				local option = {
					Text = "World Difficulty " + mult_persent + "%, ",
					Index = option_index,
					function getResult( _event )
					{
						this.World.Flags.set("EL_WorldChangeEvent", this.Index);
						this.World.Assets.m.EL_WorldLevelOffset += this.Const.EL_World.EL_WorldChangeEvent.WorldLevelOffset[this.World.Flags.get("EL_WorldChangeEvent")];
						this.World.Assets.EL_UpdateWorldStrengthAndLevel();
						return "el_world_change_event_result_page_" + this.Index;
					}
				}
				if(world_level_offset >= 0) {
					option.Text += "World Level + " + world_level_offset + ".";
				}
				else if(world_level_offset < 0){
					option.Text += "World Level - " + -world_level_offset + ".";
				}
				screen.Options.push(option);
			}
			if(select_screen_num > 1) {
				local next_page_option = {
					Text = "Next Page.",
					Index = (page + 1) % select_screen_num,
					function getResult( _event )
					{
						return "el_world_change_event_select_page_" + this.Index;
					}
				}
				local previous_page_option = {
					Text = "Previous Page.",
					Index = (page + select_screen_num - 1) % select_screen_num,
					function getResult( _event )
					{
						return "el_world_change_event_select_page_" + this.Index;
					}
				}
				screen.Options.push(next_page_option);
				screen.Options.push(previous_page_option);
			}
			this.m.Screens.push(screen);
		}
		for(local page = 0; page < this.Const.EL_World.EL_WorldChangeEvent.OptionNum; ++page) {
			local screen = {
				ID = "el_world_change_event_result_page_" + page,
				Index = page,
				Text = "Have a nice game.\n",
				Image = "",
				List = [],
				Characters = [],
				Options = [
					{
						Text = "Let us continue on with our journey。",
						function getResult( _event )
						{
							return 0;
						}
					}
				],
				function start( _event )
				{
					local brothers = this.World.getPlayerRoster().getAll();
					foreach( brother in brothers )
					{
						local hitpoints = 0;
						local bravery = 0;
						local stamina = 0;
						local initiative = 0;
						local melee_skill = 0;
						local ranged_skill = 0;
						local melee_defense = 0;
						local ranged_defense = 0;
						local total_reward_times = this.Const.EL_World.EL_WorldChangeEvent.RewardTimesPurLevel * this.Index;
						for(local reward_times = 0; reward_times < total_reward_times; ++reward_times) {
							local attribute_type = this.Math.rand(0, this.Const.Attributes.COUNT - 1);
							switch (attribute_type)
							{
								case this.Const.Attributes.Hitpoints:
									hitpoints += 1;
									break;
								case this.Const.Attributes.Bravery:
									bravery += 1;
									break;
								case this.Const.Attributes.Fatigue:
									stamina += 1;
									break;
								case this.Const.Attributes.Initiative:
									initiative += 1;
									break;
								case this.Const.Attributes.MeleeSkill:
									melee_skill += 1;
									break;
								case this.Const.Attributes.RangedSkill:
									ranged_skill += 1;
									break;
								case this.Const.Attributes.MeleeDefense:
									melee_defense += 1;
									break;
								case this.Const.Attributes.RangedDefense:
									ranged_defense += 1;
									break;
							}
						}
						brother.getBaseProperties().Initiative += initiative;
						brother.getBaseProperties().Bravery += bravery;
						brother.getBaseProperties().Stamina += stamina;
						brother.getBaseProperties().Hitpoints += hitpoints;
						brother.getBaseProperties().RangedDefense += ranged_defense;
						brother.getBaseProperties().MeleeDefense += melee_defense;
						brother.getBaseProperties().RangedSkill += ranged_skill;
						brother.getBaseProperties().MeleeSkill += melee_skill;
						brother.getSkills().update();
						local info = brother.getName() + " gains:[color=" + this.Const.UI.Color.PositiveEventValue + "]";
						local if_add = false;
						if(hitpoints > 0){
							if_add = true;
							info += " Hitp+" + hitpoints;
						}
						if(bravery > 0){
							if_add = true;
							info += " Brav+" + bravery;
						}
						if(stamina > 0){
							if_add = true;
							info += " Stan+" + stamina;
						}
						if(initiative > 0){
							if_add = true;
							info += " Init+" + initiative;
						}
						if(melee_skill > 0){
							if_add = true;
							info += " MeSk+" + melee_skill;
						}
						if(ranged_skill > 0){
							if_add = true;
							info += " RgSk+" + ranged_skill;
						}
						if(melee_defense > 0){
							if_add = true;
							info += " MeDf+" + melee_defense;
						}
						if(ranged_defense > 0){
							if_add = true;
							info += " RgDf+" + ranged_defense;
						}
						info += "[/color]";
						if(if_add == true){
							this.List.push({
								id = 16,
								text = info
							});
						}
					}
				}
			}
			this.m.Screens.push(screen);
		}
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < this.Const.EL_World.EL_WorldChangeEvent.Cooldown)
		{
			this.m.Score = 0;
			return;
		}
		if(this.Time.getVirtualTimeF() < this.m.CooldownUntil)
		{
			this.m.Score = 0;
			return;
		}
		this.m.Score = 9999;
	}



	function onPrepare()
	{
	}

	function onDetermineStartScreen()
	{
		local page_index = this.Math.floor(this.World.Flags.get("EL_WorldChangeEvent") / this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage);
		return "el_world_change_event_select_page_" + page_index;
	}

});
