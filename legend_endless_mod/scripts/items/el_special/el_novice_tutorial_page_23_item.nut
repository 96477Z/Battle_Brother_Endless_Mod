this.el_novice_tutorial_page_23_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "23";
		this.m.page_title_str = "橙色精华";
		this.m.page_info_str = 
		  "击杀boss敌人时才会掉落少量。\n"
		+ "初次通关高等级竞技场和世界竞技场会获得额外的橙色精华奖励。\n"
		+ "可在武器店或盔甲店将无用的装备分解，获取精华。\n"
		+ "武器店和盔甲店有极小概率出售橙色精华。\n"
		+ "可用于强化词条与100%获得稀有词条。\n"
		+ "不会在低阶精华不足时自动拆解来填补消耗。";
		this.el_novice_tutorial_page_item.create();
	}
});

