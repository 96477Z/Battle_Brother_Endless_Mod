this.el_novice_tutorial_page_32_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "32";
		this.m.Description = "平衡调整";
		this.m.page_info_str = "说明";
		this.el_novice_tutorial_page_item.create();
	}
});

