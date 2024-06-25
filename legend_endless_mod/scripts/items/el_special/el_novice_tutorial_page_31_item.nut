this.el_novice_tutorial_page_31_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "31";
		this.m.page_title_str = "野望";
		this.m.page_info_str = 
		  "增加环线野望设定。”\n"
		+ "同系列野望划分为4~5级要求递增的野望，先完成低级的才可接受高级的。\n"
		+ "系列最终环完成后额外奖励一件传奇饰品。\n"
		+ "详情参考文档6.19。";
		this.el_novice_tutorial_page_item.create();
	}
});