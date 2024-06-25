this.el_novice_tutorial_page_22_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "22";
		this.m.page_title_str = "常规精华";
		this.m.page_info_str = 
		  "击杀敌人时会获得一定数量的灰色精华。\n"
		+ "若是高阶敌人，将会获得额外的高阶精华。\n"
		+ "可在铁匠铺将无用的装备分解，获取精华。\n"
		+ "铁匠铺会直接出售大量的精华。\n"
		+ "可用于对装备的升级、升阶与重铸操作。\n"
		+ "升级仅需使用灰色精华，升阶与重铸还会有额外的高阶精华消耗。\n"
		+ "在消耗过程中，若低阶的不足，会自动将高阶精华以一定的比例进行拆分来继续装备操作。\n"
		+ "详情参考文档4.7。";
		this.el_novice_tutorial_page_item.create();
	}
});

