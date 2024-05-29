this.el_novice_tutorial_page_01_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "01";
		this.m.page_title_str = "世界等级";
		this.m.page_info_str =
		  "世界等级只与当前存档的游戏时间相关，与玩家战力无关，可以通过30天一次事件进行微调。\n"
		+ "世界等级影响如下：\n"
		+ "1.怪物的等级，等阶，属性，装备品质，类型和数量。\n"
		+ "2.兄弟的招募等级，招募等阶和经验补正（基于兄弟等级和世界等级的差）。\n"
		+ "3.市场和商店售卖物品的等级，等阶，数量和质量。\n"
		+ "4.任务的奖励高高难度任务概率。\n"
		+ "5.战利品的数量和质量。\n"
		+ "详情参考文档2.1。";
		this.el_novice_tutorial_page_item.create();
	}
});

