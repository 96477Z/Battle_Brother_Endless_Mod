this.el_novice_tutorial_page_25_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "25";
		this.m.Description = "饰品相关";
		this.m.page_info_str = "说明";
		this.el_novice_tutorial_page_item.create();
	}
});

