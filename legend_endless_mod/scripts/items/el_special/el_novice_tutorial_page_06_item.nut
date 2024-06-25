this.el_novice_tutorial_page_06_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "06";
		this.m.page_title_str = "精英兄弟";
		this.m.page_info_str = 
		  "1.招募价格*4再加16000。\n"
		+ "2.工资*2再加80。\n"
		+ "3.食物消耗*2。\n"
		+ "4.升级所需经验*2。\n"
		+ "5.全属性天赋+1。\n"
		+ "6.额外战斗等级+2。\n"
		+ "7.初始属性更强。\n"
		+ "8.特技树中额外添加随机约20个特技（不包含部分职业，特殊，魔法）。\n"
		+ "9.每级额外获得2点属性值（自动随机分配）。\n"
		+ "10.11级后每6级获得1个技能点。\n"
		+ "11.出现概率与世界等级相关，世界等级11时开始出现（1%），世界等级40时达到最高概率（30%）。\n"
		+ "详情参考文档3.1.p。";
		this.el_novice_tutorial_page_item.create();
	}
});
