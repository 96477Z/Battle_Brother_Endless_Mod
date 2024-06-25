this.el_novice_tutorial_page_24_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "24";
		this.m.page_title_str = "铁匠铺";
		this.m.page_info_str = 
		  "武器店与盔甲店统称为铁匠铺。\n"
		+ "在铁匠铺中可进行维修、装备分解、装备升级、装备升阶、装备重铸等操作。\n"
		+ "铁匠铺会直接出售大量的精华。"
		this.el_novice_tutorial_page_item.create();
	}
});

