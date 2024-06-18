this.el_novice_tutorial_page_17_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "17";
		this.m.page_title_str = "装备等级";
		this.m.page_info_str = 
		  "加入装备等级设定，每级装备等级都会根据百分比提升装备一定的属性值。\n"
		+ "但注意，身穿的装备最多只能发挥出当前战斗等级的属性，但装备重量不受战斗等级影响。\n"
		+ "NPC角色身上的装备等级与其自身等级相同。\n"
		+ "可在铁匠铺消耗精华来对装备进行升级。\n"
		+ "详情参考文档4.1。";
		this.el_novice_tutorial_page_item.create();
	}
});

