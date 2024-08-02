this.el_world_difficulty_change_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.el_world_difficulty_change";
		this.m.Title = "世界难度选择";
		this.m.Cooldown = this.Const.EL_World.EL_WorldChangeEvent.DifficultyCooldown * this.World.getTime().SecondsPerDay;
	}

	function onUpdateScore()
	{
		if (this.World.getTime().Days < this.Const.EL_World.EL_WorldChangeEvent.DifficultyCooldown)
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
		local option_start_index = this.Const.EL_World.EL_WorldChangeEvent.DifficultyMinOption[this.World.Assets.getCombatDifficulty()];
		if(this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary) {
			option_start_index += this.Math.floor(this.World.Flags.get("EL_LegendaryItemMaxNum") / 3);
		}
		if(option_start_index >= this.Const.EL_World.EL_WorldChangeEvent.OptionNum) {
			option_start_index = this.Const.EL_World.EL_WorldChangeEvent.OptionNum - 1;
		}
		local total_option_num = this.Const.EL_World.EL_WorldChangeEvent.OptionNum - option_start_index;
		local select_screen_num = ((total_option_num + this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage - 1) / this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage);
		for(local page = 0; page < select_screen_num; ++page) {
			local screen = {
				ID = "el_world_difficulty_change_event_select_page_" + page,
				Text = "没有什么事情发生，请选择世界难度以获得更好的游戏体验。\n\n",
				Image = "",
				List = [],
				Characters = [],
				Options = [],
				function start( _event )
				{
				}
			}
			local current_page_option_num = this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage;
			if((page + 1) * this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage > total_option_num) {
				current_page_option_num = total_option_num % this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage;
			}
			for(local option_num = 0; option_num < current_page_option_num; ++option_num) {
				local option_index = page * this.Const.EL_World.EL_WorldChangeEvent.OptionNumPurPage + option_num + option_start_index;
				local mult_persent = this.Const.EL_World.EL_WorldChangeEvent.DifficultyMult[option_index] * 100;
				local option = {
					Text = "世界难度 " + mult_persent + "%",
					Index = option_index,
					function getResult( _event )
					{
						this.World.Flags.set("EL_WorldDifficultyChangeEvent", this.Index);
						this.World.Assets.EL_UpdateWorldStrengthAndLevel();
						return "el_world_difficulty_change_event_result_page_" + this.Index;
					}
				}
				screen.Options.push(option);
			}
			if(select_screen_num > 1) {
				local next_page_option = {
					Text = "下一页。",
					Index = (page + 1) % select_screen_num,
					function getResult( _event )
					{
						return "el_world_difficulty_change_event_select_page_" + this.Index;
					}
				}
				local previous_page_option = {
					Text = "上一页。",
					Index = (page + select_screen_num - 1) % select_screen_num,
					function getResult( _event )
					{
						return "el_world_difficulty_change_event_select_page_" + this.Index;
					}
				}
				screen.Options.push(next_page_option);
				screen.Options.push(previous_page_option);
			}
			this.m.Screens.push(screen);
		}
		for(local page = 0; page < this.Const.EL_World.EL_WorldChangeEvent.OptionNum; ++page) {
			local screen = {
				ID = "el_world_difficulty_change_event_result_page_" + page,
				Index = page,
				Text = "旅途愉快。\n",
				Image = "",
				List = [],
				Characters = [],
				Options = [
					{
						Text = "让我们继续我们旅程。",
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
						local info = brother.getName() + " 获得:[color=" + this.Const.UI.Color.PositiveEventValue + "]";
						local if_add = false;
						if(hitpoints > 0){
							if_add = true;
							info += " 血量+" + hitpoints;
						}
						if(bravery > 0){
							if_add = true;
							info += " 决心+" + bravery;
						}
						if(stamina > 0){
							if_add = true;
							info += " 疲劳+" + stamina;
						}
						if(initiative > 0){
							if_add = true;
							info += " 主动+" + initiative;
						}
						if(melee_skill > 0){
							if_add = true;
							info += " 近攻+" + melee_skill;
						}
						if(ranged_skill > 0){
							if_add = true;
							info += " 远攻+" + ranged_skill;
						}
						if(melee_defense > 0){
							if_add = true;
							info += " 近防+" + melee_defense;
						}
						if(ranged_defense > 0){
							if_add = true;
							info += " 远防+" + ranged_defense;
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

	function onDetermineStartScreen()
	{
		local page_index = 0;
		return "el_world_difficulty_change_event_select_page_" + page_index;
	}

});

