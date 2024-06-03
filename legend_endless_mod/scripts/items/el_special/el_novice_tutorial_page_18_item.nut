this.el_novice_tutorial_page_18_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "18";
		this.m.page_title_str = "装备等阶";
		this.m.page_info_str = 
		  "加入装备等阶设定，装备等阶会给装备带来大额提升，并解锁词条数量。\n"
		+ "同时，词条强度的最大最小值浮动也受限于装备等阶。\n"
		+ "原版的著名装备拥有额外的最小等阶和最大等阶。\n"
		+ "可在武器店或盔甲店消耗精华来对装备进行升阶。\n"
		+ "详情参考文档4.2。";
		this.el_novice_tutorial_page_item.create();
	}
});

