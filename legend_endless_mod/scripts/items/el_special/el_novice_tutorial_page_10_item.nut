this.el_novice_tutorial_page_10_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "10";
		this.m.page_title_str = "精英NPC";
		this.m.page_info_str = "说明";
		this.el_novice_tutorial_page_item.create();
	}
});

