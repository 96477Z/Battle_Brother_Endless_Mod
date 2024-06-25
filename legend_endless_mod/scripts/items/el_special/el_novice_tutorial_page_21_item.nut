this.el_novice_tutorial_page_21_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "21";
		this.m.page_title_str = "稀有词条";
		this.m.page_info_str = 
		  "饰品每次进行词条随机时都有小概率产生一个稀有词条。\n"
		+ "稀有词条颜色为红色，仅针对指定武器进行加成。\n"
		+ "仅会在饰品位的装备上产生且一个饰品最多容纳一个稀有词条。\n"
		+ "0阶饰品有0.001%的概率出现稀有词条，此后每提升1阶，概率提升10倍。\n"
		+ "稀有词条不会因在铁匠铺进行重铸而被改变。\n"
		+ "稀有词条效果只对玩家生效。\n"
		+ "在铁匠铺将拥有稀有词条的饰品分解时，会额外获得一个稀有词条石，使用它可以将保存的稀有词条装配到另一饰品之上。\n"
		+ "在铁匠铺可对一个等阶已至上限的饰品再次使用升阶操作，消耗橙色精华来100%获取稀有词条。\n"
		+ "具体效果详见文档4.6.o。";
		this.el_novice_tutorial_page_item.create();
	}
});

