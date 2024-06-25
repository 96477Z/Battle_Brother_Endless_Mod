this.el_novice_tutorial_page_05_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "05";
		this.m.page_title_str = "普通兄弟";
		this.m.page_info_str = 
		  "最基础的玩家单位，前期的主力。\n"
		+ "1.没有额外的属性加成，但也没有额外的经验惩罚。\n"
		+ "2.11级后每8级获得1个技能点。";
		this.el_novice_tutorial_page_item.create();
	}
});

