this.el_novice_tutorial_page_25_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "25";
		this.m.page_title_str = "饰品";
		this.m.page_info_str = 
		  "原版野望饰品和使用传奇野兽材料制作的饰品修改为著名饰品(初始等阶1)。\n"
		+ "所有人形敌人都将会装备饰品，装备饰品等阶与敌人等阶相同。\n"
		+ "击杀装备饰品的敌人将概率掉落他们所装备的饰品。\n"
		+ "市场将出售饰品，防具店将出售更多饰品。\n"
		+ "详情参考文档4.3。";
		this.el_novice_tutorial_page_item.create();
	}
});