this.el_novice_tutorial_page_18_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "18";
		this.m.page_title_str = "装备等阶";
		this.m.page_info_str = "说明";
		this.el_novice_tutorial_page_item.create();
	}
});

