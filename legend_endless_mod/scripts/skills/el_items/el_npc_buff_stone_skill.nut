this.el_npc_buff_stone_skill <- this.inherit("scripts/skills/skill", {
	m = {
		EL_RankLevel = 0,
		EL_DecreaseLevelCount = 3
	},
	function create()
	{
		this.m.ID = "el_items.npc_buff_stone_skill";
		this.m.Name = "魔法石";
		this.m.Description = "通过魔法石获取力量。";
		this.m.Type = this.Const.SkillType.Trait;
		this.m.Icon = "el_skills/el_npc_buff_stone_0.png";
		this.m.Order = this.Const.SkillOrder.First;
	}

    function EL_updateRankLevel() {
		local skills = this.getContainer().getActor().getSkills().m.Skills;
		foreach(skill in skills) {
			if(skill.EL_isNPCBuff()) {
				this.m.EL_RankLevel = skill.EL_getRankLevel();
				break;
			}
		}
    }

	function onAfterUpdate( _properties )
	{
		local skills = this.getContainer().getActor().getSkills().m.Skills;
		foreach(skill in skills) {
			if(skill.EL_isNPCBuff()) {
				this.m.Icon = "el_skills/el_npc_buff_stone_" + skill.m.EL_RankLevel + ".png";
				break;
			}
		}
	}

	function onCombatFinished()
	{
		if(this.m.EL_RankLevel > this.getContainer().getActor().EL_getRankLevel())
		{
			--this.m.EL_DecreaseLevelCount;
			--this.m.EL_RankLevel;
			if(this.m.EL_DecreaseLevelCount == 0)
			{
				this.m.EL_DecreaseLevelCount = 3;
				local skills = this.getContainer().getActor().getSkills().m.Skills;
				foreach(skill in skills) {
					if(skill.EL_isNPCBuff()) {
						skill.EL_setRankLevel(skill.EL_getRankLevel() - 1);
					}
				}
			}
		}
		this.skill.onCombatFinished();
	}


	function getTooltip()
	{
		local name = this.getName();
		if(this.m.EL_RankLevel == 0) {
			name = name + " - 普通";
		}
		else if(this.m.EL_RankLevel == 1) {
			name = name + " - 精英";
		}
		else if(this.m.EL_RankLevel == 2) {
			name = name + " - 首领";
		}
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		local skills = this.getContainer().getActor().getSkills().m.Skills;
		foreach(skill in skills) {
			if(skill.EL_isNPCBuff()) {
				local names = this.split(skill.getName(), "(");
				local name = names[0];
				ret.push({
					id = 10,
					type = "text",
					icon = "ui/el_icons/magic_stone_rank_" + skill.EL_getRankLevel() + ".png",
					text = name
				});
				ret.push({
					id = 10,
					type = "text",
					text = skill.getDescription()
				});
			}
		}
		if(this.m.EL_RankLevel > this.getContainer().getActor().EL_getRankLevel())
		{
			ret.push({
				id = 10,
				type = "text",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]角色等阶不足，将在 " + this.m.EL_DecreaseLevelCount + " 场战斗后降阶！[/color]"
			});
		}

		return ret;
	}


});

