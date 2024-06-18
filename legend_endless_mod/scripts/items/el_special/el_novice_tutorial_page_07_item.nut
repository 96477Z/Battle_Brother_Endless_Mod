this.el_novice_tutorial_page_07_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "07";
		this.m.page_title_str = "英雄兄弟";
		this.m.page_info_str = 
		  "1.招募价格*10再加100000。\n"
		+ "2.工资*5再加500。\n"
		+ "3.食物消耗*5。\n"
		+ "4.升级所需经验*5。\n"
		+ "5.全属性天赋+2。\n"
		+ "6.士气最低为1（不会逃跑）。\n"
		+ "7.额外战斗等级+5。\n"
		+ "8.初始属性在背景允许范围内达到最高。\n"
		+ "9.特技树中额外添加随机约50个特技。\n"
		+ "10.每级额外获得5点属性值（自动随机分配）。\n"
		+ "11.11级后每4级获得1个技能点。\n"
		+ "12.出现概率与世界等级相关，世界等级21时开始出现（0.5%），世界等级40时达到最高概率（10%）。\n"
		+ "详情参考文档3.1.p。";
		this.el_novice_tutorial_page_item.create();
	}
});