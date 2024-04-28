this.el_novice_tutorial_page_33_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "33";
		this.m.page_title_str = "鸣谢";
		this.m.page_info_str =
		  "如果您愿意支持作者，可以通过扫描二维码来赞助，这将为未来的更新提供重要的动力。\n"
		+ "感谢赞助！！！\n"
		+ "当前赞助人（排名不分先后）：\n"
		+ "沃尔夫冈，往事。，夕拾，mandarina，谁知道，枫，夕林，北极融化，帅豪，^_^，无名氏，叠个甲，讨口子，流年，小嘿嘿，ACcike，走心，大力熊，三鼠，亡灵之手，洗碗精，Hamilityx";
		this.el_novice_tutorial_page_item.create();
	}
});

