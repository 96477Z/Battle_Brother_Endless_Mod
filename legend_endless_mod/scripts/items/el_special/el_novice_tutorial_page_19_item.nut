this.el_novice_tutorial_page_19_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "19";
		this.m.page_title_str = "传奇装备";
		this.m.page_info_str = 
		  "基础效果增强。\n"
		+ "仅有传奇装备可达到4阶的装备等阶上限。\n"
		+ "拥有的词条效果固定为可随机的最大值。\n"
		+ "无法进行分解，且价值设定为零，所以，好好使用它们吧少年。";
		this.el_novice_tutorial_page_item.create();
	}
});

