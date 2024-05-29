this.el_novice_tutorial_page_02_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "02";
		this.m.page_title_str = "世界难度系数";
		this.m.page_info_str =
		  "世界难度系数可以通过50天一次事件进行微调，默认100%。\n"
		+ "世界难度系数影响如下：\n"
		+ "1.怪物的等阶，属性，掉落，类型，数量和NPCBuff数量。\n"
		+ "2.兄弟的招募等阶。\n"
		+ "3.市场和商店售卖物品的等阶，数量和质量。\n"
		+ "4.任务的奖励高高难度任务概率。\n"
		+ "5.战利品的数量和质量。\n"
		+ "详情参考文档2.3。";

		this.el_novice_tutorial_page_item.create();
	}
});

