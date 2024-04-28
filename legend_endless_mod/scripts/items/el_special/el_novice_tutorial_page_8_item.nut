this.el_novice_tutorial_page_8_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "08";
		this.m.Description = "玩家单位修改部分";
		this.m.page_info_str = "说明";
		this.el_novice_tutorial_page_item.create();
	}
});

