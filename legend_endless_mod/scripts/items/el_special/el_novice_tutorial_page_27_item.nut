this.el_novice_tutorial_page_27_item <- this.inherit("scripts/items/el_special/el_novice_tutorial_page_item", {
	m = {
    },
	function create()
	{
		this.m.page_num_str = "27";
		this.m.page_title_str = "竞技场";
		this.m.page_info_str = 
		  "无尽mod调整：\n"
		+ "1.每天挑战次数不限，竞技场项圈变为消耗品不占用饰品位。\n"
		+ "2.新增竞技场层数设定，同一天再次挑战会提高层数，隔天重置为之前挑战成功最高场次的前一场。\n"
		+ "3.竞技场层数越高，难度越高，同时挑战成功获得的奖励越好。\n"
		+ "4.第五层胜利时奖励一套竞技场套装（传奇/唯一）。\n"
		+ "5.第五层往后每次首通额外奖励橙色精华。\n"
		+ "奖励：精华、魔核、克朗。\n"
		+ "详情参考文档6.13。";
		this.el_novice_tutorial_page_item.create();
	}
});