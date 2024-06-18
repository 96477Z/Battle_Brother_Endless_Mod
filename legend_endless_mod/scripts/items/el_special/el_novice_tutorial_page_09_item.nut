this.el_novice_tutorial_page_09_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "09";
		this.m.page_title_str = "普通NPC";
		this.m.page_info_str = 
		  "1.单位等级在[世界等级-5] ~ [世界等级范围]内随机。\n"
		+ "2.最普通的敌人，约等于原版的普通敌人，没有任何特色。\n"
		+ "详情参考文档3.2。";
		this.el_novice_tutorial_page_item.create();
	}
});