this.el_novice_tutorial_page_03_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "03";
		this.m.page_title_str = "玩家单位";
		this.m.page_info_str =
		  "玩家单位分为三个等阶，等阶固定，不可更改。。\n"
		+ "等阶如下：\n"
		+ "1.普通兄弟（等阶0）。\n"
		+ "2.精英兄弟（等阶1）。\n"
		+ "3.英雄兄弟（等阶2）。\n"
		+ "详情参考文档3.1。";
		this.el_novice_tutorial_page_item.create();
	}
});

