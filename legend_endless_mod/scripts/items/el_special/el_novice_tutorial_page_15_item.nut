this.el_novice_tutorial_page_15_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "15";
		this.m.page_title_str = "战斗";
		this.m.page_info_str = 
		  "1.命中计算时不再将大于50的部分收益减半。"
		  "2.击中盾牌造成的耐久损耗改为1+战斗等级*0.08（向下取整）。"
		  "3.疲劳每回合恢复改为10+当前疲劳上限/20（向下取整）。"
		this.el_novice_tutorial_page_item.create();
	}
});
