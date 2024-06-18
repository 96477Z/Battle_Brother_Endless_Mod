this.el_novice_tutorial_page_32_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "32";
		this.m.page_title_str = "平衡调整";
		this.m.page_info_str = 
		  "  技    能：”\n"
		+ "1.所有除生命值外的基础属性相关的加成，技能，buff全部去除百分号。\n"
		+ "2.生命值增幅，中毒伤害，流血伤害改为基础生命值的百分比。\n"
		+ "3.召唤生物等阶与召唤者等阶相同，等级与召唤者战斗等级相同。\n"
		+ "  背    包——————实际背包容量根据理论背包容量进行递减式计算。尽可能减少由于背包过大导致游戏极卡的现象。\n"
		+ "  任    务——————任务的克朗收益随世界等级的增长而增长（系数0.08）。\n"
		+ "  物    品：\n"
		+ "1.商店出售物品数量随世界等级的增长而增长，每级增加（系数0.01）。\n"
		+ "2.战旗最高可升阶至传说等阶，光环效果大幅提升。\n"
		+ "3.装备中所有的基础属性百分比效果全部去除百分号。\n"
		+ "4.盾牌新增效果：降低装备者受到的伤害，具体降低幅度视盾牌双防和而定。\n"
		+ "5.盾牌修改：装备者受击时也会触发盾牌耐久损耗，损耗量与盾牌被击中相同。\n"
		+ "6.原版传奇装备获取时均设为传说等阶0级，且附加效果增加。\n"
		+ "  战 利 品——————战后掉落的金钱（系数0.08）、食物（系数0.01）、宝物（系数0.08）、弹药（系数0.01）、工具（系数0.08）、药品（系数0.08）数量随世界等级的增长而增长。\n"
		+ "  招    募——————雇佣地中的新兄弟等级在1~世界等级间随机，重平衡了招募费和试用费。\n"
		+ "  损伤治疗——————现在可在神殿中治疗永久伤，基础价格10000，实际治疗价格随着被治疗角色等级提升而提升（系数0.08）。\n"
		+ "  船    坞——————出海费用重平衡，人多与距离较远时将会消耗更多克朗。\n"
		+ "详情参考文档6。";
		this.el_novice_tutorial_page_item.create();
	}
});
