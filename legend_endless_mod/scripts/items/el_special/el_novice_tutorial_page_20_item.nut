this.el_novice_tutorial_page_20_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "20";
		this.m.page_title_str = "装备词条";
		this.m.page_info_str = 
		  "为装备新增了词条概念，可为穿戴者提供额外的加成。\n"
		+ "不同部位的词条类型和数量不相同。\n"
		+ "强度和数量受限于装备等阶，1阶装备起才拥有词条。\n"
		+ "可在武器店或盔甲店可对一个等阶已至上限的饰品再次使用升阶操作，消耗橙色精华来顺位强化词条。\n"
		+ "强化词条显示为红色，强度为常规词条效果最大值的2倍。\n"
		+ "可在武器店或盔甲店消耗精华进行重铸，来重新随机拥有的词条。\n"
		+ "详情参考文档4.6。";
		this.el_novice_tutorial_page_item.create();
	}
});

