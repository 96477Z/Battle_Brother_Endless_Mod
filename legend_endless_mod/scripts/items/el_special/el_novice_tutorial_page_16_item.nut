this.el_novice_tutorial_page_16_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "16";
		this.m.page_title_str = "士气";
		this.m.page_info_str = 
		  "士气相关修改：\n"
		+ "1.若自身周围6格内敌军数量大于友军，降低决心。\n"
		+ "2.士气判定概率修改，加入等阶差和战斗等级差作为影响因素。\n"
		+ "3.被贴身时周围每个敌人都会对其触发一次士气判定，每次概率单独计算。\n"
		+ "4.受伤触发士气判定的阈值修改为最大血量的20%，单次伤害过高会触发触发士气判定。\n"
		+ "5.每层士气影响属性修改为10决心，10主动，10攻防，1技能额外消耗疲劳，10%伤害，10%减伤。\n"
		+ "6.当最终进行判定的计算决心大于100时，每次判定结果不利，都会减去100再进行一次判定，直到判定结果有利或者计算决心小于0。\n"
		+ "详情参考文档6.9。";
		this.el_novice_tutorial_page_item.create();
	}
});