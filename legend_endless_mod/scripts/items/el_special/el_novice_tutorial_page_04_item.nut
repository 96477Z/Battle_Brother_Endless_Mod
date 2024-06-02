this.el_novice_tutorial_page_04_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "04";
		this.m.page_title_str = "NPC单位";
		this.m.page_info_str =
		  "NPC单位分为三个等阶，等阶固定，不可更改。。\n"
		+ "等阶如下：\n"
		+ "1.普通NPC（等阶0）。\n"
		+ "2.精英NPC（等阶1）。\n"
		+ "3.首领NPC（等阶2）。\n"
		+ "3.Boss级别的首领NPC（等阶2，会额外掉落橙色精华）。\n"
		+ "详情参考文档3.2。";
		this.el_novice_tutorial_page_item.create();
	}
});

