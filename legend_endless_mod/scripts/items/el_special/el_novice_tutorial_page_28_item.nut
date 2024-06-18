this.el_novice_tutorial_page_28_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "28";
		this.m.page_title_str = "世界竞技场";
		this.m.page_info_str = 
		  "将传奇MOD的“骑士比武”重置为“世界竞技场”\n"
		+ "世界竞技场难度极高，推荐拥有稀有词条后再存档进行尝试。\n"
		+ "进入竞技场会与随机种族的队伍进行对战，每个种族出现的顺序随机。\n"
		+ "每个种族的队伍首次挑战成功时获得对应传奇武器。\n"
		+ "全部种族挑战成功时继续挑战会开启新一轮，难度提升，奖励提升。\n"
		+ "奖励：橙色精华、橙色魔核、大量克朗。\n"
		+ "详情参考文档6.17。";
		this.el_novice_tutorial_page_item.create();
	}
});
