this.el_novice_tutorial_page_11_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "11";
		this.m.page_title_str = "首领NPC";
		this.m.page_info_str = 
		  "1.单位等级固定为世界等级。\n"
		+ "2.获得1个首领级NPC Buff，非人形单位额外再获得2个。\n"
		+ "3.所有装备等阶提升1。\n"
		+ "4.士气最低为1（不会逃跑）。\n"
		+ "5.行动点+3。\n"
		+ "6.基础属性（除生命值）大幅提升。\n"
		+ "7.经验+500后*5。\n"
		+ "8.额外战斗等级+5。\n"
		+ "9.伤害+50%。\n"
		+ "10.额外减伤75%。\n"
		+ "11.出现概率与世界等级相关，世界等级越高概率越高。\n"
		+ "详情参考文档3.2.f。";
		this.el_novice_tutorial_page_item.create();
	}
});

