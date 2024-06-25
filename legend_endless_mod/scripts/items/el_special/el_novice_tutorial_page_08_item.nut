this.el_novice_tutorial_page_08_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "08";
		this.m.page_title_str = "玩家修改";
		this.m.page_info_str = 
		  "1.每次升级可成长属性提升为4项。\n"
		+ "2.不再限定仅3项属性可能存在天赋，每项属性单独判定是否天赋高低。\n"
		+ "3.新增4星天赋设定，每级期望成长再3星基础上再加0.5，局内显示为3颗红色星星。\n"
		+ "4.可使用技能点代替属性点进行属性成长。\n"
		+ "5.老兵状态（大于11级）时属性成长不再限定为1，且会根据兄弟等阶每n级获得1技能点。\n"
		+ "6.人物附属属性加成(额外背包格子、修理效率、巡逻效率等)将随角色等级的增加而增加。\n"
		+ "7.决心成长速度削弱，远攻成长削弱至与远防成长相同水平。\n"
		+ "8.新增攻防的平衡特性，近远攻的基础值如果超过50，则默认弱的一项会补全至强的一项减少50后的值，近远防的平衡同理。\n"
		+ "详情参考文档3.1。";
		this.el_novice_tutorial_page_item.create();
	}
});