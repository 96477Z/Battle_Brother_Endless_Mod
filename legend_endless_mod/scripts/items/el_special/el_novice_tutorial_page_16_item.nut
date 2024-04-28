this.el_novice_tutorial_page_16_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "16";
		this.m.page_title_str = "士气";
		this.m.page_info_str = "说明";
		this.el_novice_tutorial_page_item.create();
	}
});

