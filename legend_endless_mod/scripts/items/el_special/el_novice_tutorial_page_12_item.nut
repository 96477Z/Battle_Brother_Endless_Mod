this.el_novice_tutorial_page_12_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "12";
		this.m.page_title_str = "战斗等级";
		this.m.page_info_str = 
		  "新增战斗等级属性，根据双方战斗等级不同，影响伤害和命中率。\n"
		+ "战斗等级带来的补正为指数级，等级差越大，每级造成的影响也越大。\n"
		+ "敌人名称将会显示战斗等级，为末尾括号中的数字。\n"
		+ "角色基础战斗等级为角色等级。\n"
		+ "NPC根据单位质量拥有额外的战斗等级。\n"
		+ "详情参考文档3.3。";
		this.el_novice_tutorial_page_item.create();
	}
});
