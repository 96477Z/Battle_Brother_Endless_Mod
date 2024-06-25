this.el_novice_tutorial_page_14_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "14";
		this.m.page_title_str = "NPC修改";
		this.m.page_info_str = 
		  "NPC新增等级设定。\n"
		+ "NPC等级受限于世界等级，每级会提供额外属性（16级开始）。\n"
		+ "击杀NPC所获得的经验量会随NPC等级的提升而提升。\n"
		+ "NPC单位穿戴的装备等级与NPC等级一致。\n"
		+ "详情参考文档3.2。";
		this.el_novice_tutorial_page_item.create();
	}
});

