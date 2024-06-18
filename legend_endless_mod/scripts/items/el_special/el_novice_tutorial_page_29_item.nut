this.el_novice_tutorial_page_29_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "29";
		this.m.page_title_str = "合同";
		this.m.page_info_str = 
		  "难度重置为0~8星。”\n"
		+ "难度越高，奖励的克朗越高。\n"
		+ "高星合同的出现概率随着世界等级的提高而提高。\n"
		+ "合同刷新速度与同时存在上限与聚集地规模相关，规模越大，刷新速度与同时存在上限越高。\n"
		+ "详情参考文档6.17。";
		this.el_novice_tutorial_page_item.create();
	}
});