this.el_novice_tutorial_page_26_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "26";
		this.m.page_title_str = "魔核";
		this.m.page_info_str = 
		  "击杀野兽单位会掉落魔核，魔核等阶与野兽等阶相同。\n"
		+ "魔核储存相当于其来源生物一定比例的经验值，魔核等阶越高，比例越高。\n"
		+ "魔核附加属性经验，属性经验会给玩家提供额外的属性，第n点属性需要n点属性经验。\n"
		+ "市场也将出售魔核，高阶魔核的出售概率将随着世界等级的提高而提高。\n"
		+ "详情参考文档4.5。";
		this.el_novice_tutorial_page_item.create();
	}
});
