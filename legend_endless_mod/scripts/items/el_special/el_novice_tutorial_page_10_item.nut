this.el_novice_tutorial_page_10_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "10";
		this.m.page_title_str = "精英NPC";
		this.m.page_info_str = 
		  "1.单位等级固定为世界等级。\n"
		+ "2.获得一个精英级NPC Buff，非人形单位额外再获得2个。\n"
		+ "3.行动点+1。\n"
		+ "4.基础属性（除生命值）小幅提升。\n"
		+ "5.经验+200后*2。\n"
		+ "6.额外战斗等级+2。\n"
		+ "7.伤害+20%。\n"
		+ "8.额外减伤45%。\n"
		+ "9.出现概率与世界等级相关，世界等级越高概率越高。\n"
		+ "详情参考文档3.2.f。";
		this.el_novice_tutorial_page_item.create();
	}
});