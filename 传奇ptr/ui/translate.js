function disptime0()
{
	var today = new Date();//获得当前时间
	var hh = today.getHours();//获得小时、分钟、秒
	var mm = today.getMinutes();
	var ss = today.getSeconds();
	if (hh<10){ hh = '0' + hh;}
	if (mm<10){ mm = '0' + mm;}
	if (ss<10){ ss = '0' + ss;}
	var myTime = hh+":"+mm+":"+ss;
	return myTime;
}

function disptime1()
{
	var today = new Date();//获得当前时间
	var hh = today.getHours();//获得小时、分钟
	var mm = today.getMinutes();
	if (hh<10){ hh = '0' + hh;}
	if (mm<10){ mm = '0' + mm;}
	var myTime = hh+":"+mm;
	return myTime;
}

var TranslateTopbarEventLogModule = function(text)
{
	text = text.replace("resists being charmed thanks to his resolve", "因为他的决心，抵抗了魅惑");
	text = text.replace("resists the urge to sleep thanks to his resolve", "因为他的决心，抵抗了催眠");
	text = text.replace("resists being hexed thanks to his unnatural physiology", "因为他非自然的生理机能，抵抗了妖术");
	text = text.replace("resists being charmed thanks to his unnatural physiology", "因为他非自然的生理机能，抵抗了魅惑");
	text = text.replace("resists being frozen with fear thanks to his unnatural physiology", "因为他非自然的生理机能，他才不会被吓僵");
	text = text.replace("resists being overwhelmed thanks to his unnatural physiology", "因为他非自然的生理机能，抵抗了压制");
	text = text.replace("resists being shellshocked thanks to his unnatural physiology", "因为他非自然的生理机能，抵抗了炮弹冲击");
	text = text.replace("shook off being dazed thanks to his unnatural physiology", "因为他非自然的生理机能，摆脱了茫然");
	text = text.replace("shook off being staggered thanks to his unnatural physiology", "因为他非自然的生理机能，摆脱了趔趄");
	text = text.replace("shook off being stunned thanks to his unnatural physiology", "因为他非自然的生理机能，摆脱了昏迷");
	text = text.replace("quickly recovers from being disarmed thanks to his unnatural physiology", "因为他非自然的生理机能，很快从缴械中恢复过来");
	text = text.replace("quickly recovered from withering thanks to his unnatural physiology", "因为他非自然的生理机能，很快从凋零中恢复过来");
	text = text.replace("had his bleeding wound quickly close thanks to his unnatural physiology", "因为他非自然的生理机能，流血的伤口很快就愈合了");
	text = text.replace("is unaffected by the cold thanks to his unnatural physiology", "因为他非自然的生理机能，不受寒冷的影响");
	text = text.replace("is unaffected by acid thanks to his unnatural physiology", "因为他非自然的生理机能，不受酸的影响");
	text = text.replace("regained his focus thanks to his unnatural physiology", "因为他非自然的生理机能，重新集中了注意力");
	text = text.replace("repels insects with his unnatural physiology", "因为他非自然的生理机能，驱除了昆虫");
	text = text.replace("wakes up thanks to his unnatural physiology", "因为他非自然的生理机能，醒来了");
	text = text.replace("eats  Strange Mushrooms", "吃奇怪的蘑菇");
	text = text.replace("gives Strange Mushrooms to", "把奇怪的蘑菇给");
	text = text.replace(/breaks free \(Chance: (.*?), Rolled: (.*?)\)/, "挣脱（机率： $1，掷骰： $2）");
	text = text.replace(/fails to break free \(Chance: (.*?), Rolled: (.*?)\)/, "未能挣脱（机率： $1，掷骰： $2）");
	text = text.replace("charges and is repelled", "冲击并排斥");
	text = text.replace("charges and stuns", "冲击并击晕");
	text = text.replace("charges", "冲击");
	text = text.replace("resists being charmed thanks to his resolve", "因为他的决心抵抗了魅惑");
	text = text.replace("resists the urge to sleep thanks to his resolve", "因为他的决心抵抗了催眠");
	text = text.replace("resists being hexed thanks to his unnatural physiology", "因为他不自然的生理机能抵抗了妖术");
	text = text.replace("resists being charmed thanks to his unnatural physiology", "因为他不自然的生理机能抵抗了魅惑");
	
	text = text.replace("is charmed", "被魅惑了");
	text = text.replace("Cleaved", "劈开了");
	text = text.replace("Cudgeled to death", "重棒打死");
	text = text.replace("drinks Antidote", "喝解毒剂");
	text = text.replace("gives Antidote to", "把解毒剂给");
	text = text.replace("drinks Cat Potion", "喝猫药剂");
	text = text.replace("gives Cat Potion to", "把猫药剂给");
	text = text.replace("drinks Iron Will Potion", "喝钢铁意志药剂");
	text = text.replace("gives Iron Will Potion to", "把钢铁意志药剂给");
	text = text.replace("drinks Lionheart Potion", "喝狮心药剂");
	text = text.replace("gives Lionheart Potion to", "把狮心药剂给");
	text = text.replace("drinks Night Owl Elixir", "喝夜鹰灵药");
	text = text.replace("gives Night Owl Elixir to", "把夜鹰灵药给");
	text = text.replace("drinks Second Wind Potion", "喝第二呼吸药剂");
	text = text.replace("gives Second Wind Potion to", "把第二呼吸药剂给");
	text = text.replace("Smashed", "碎裂");
	text = text.replace("Chopped up", "切碎");
	text = text.replace("flings back", "抛回");
	text = text.replace("Frightened to death", "吓死");
	text = text.replace("Split in two", "劈成两半");
	text = text.replace("casts Grant Night Vision", "使授予夜间视野");
	text = text.replace("feasts on a corpse", "吃尸体");
	text = text.replace("Pummeled to death", "被击毙");
	text = text.replace("hexes", "妖术");
	text = text.replace("hooks in", "钩住");
	text = text.replace("is horrified", "惊骇");
	text = text.replace("Impaled", "被刺穿");
	text = text.replace("has knocked back", "撞退了");
	text = text.replace(/struck a blow that leaves (.*?) dazed/, "击茫然了 $1");
	text = text.replace(/struck a hit that leaves (.*?) dazed/, "打茫然了 $1");
	text = text.replace(/has stunned (.*?) for one turn/, "昏迷 $1 一回合");
	text = text.replace(/has stunned (.*?) for two turns/, "昏迷 $1 两回合");
	text = text.replace(/has disarmed (.*?) for one turn/, "缴械 $1 一回合");
	text = text.replace(/has dazed (.*?) for two turns/, "茫然 $1 两回合");
	text = text.replace(/has staggered (.*?) for one turn/, "趔趄 $1 一回合");
	text = text.replace("Mangled", "撕烂");
	text = text.replace("Devoured", "吞没");
	text = text.replace("devours", "吞食");
	text = text.replace("is dragged towards certain death", "被拖向死亡");
	text = text.replace("moves", "移动");
	text = text.replace("pushes through", "推动通过");
	text = text.replace("Sliced up", "切片");
	text = text.replace("lunges and is repelled", "突刺并被排斥");
	text = text.replace("moves its tail", "移动尾巴");
	text = text.replace("enters a world of nightmares", "进入噩梦世界");
	text = text.replace("Died of terror", "死于恐惧");
	text = text.replace("possesses", "占据");
	text = text.replace("Pronged", "叉");
	text = text.replace("Stabbed", "刺伤");
	text = text.replace("Carved up", "切开");
	text = text.replace("Cut down", "砍倒");
	text = text.replace("resists the urge to sleep thanks to his resolve", "因为他的决心而不被催眠");
	text = text.replace("falls to sleep", "被催眠");
	text = text.replace(/uses Split Shield and destroys (.*?)\'s shield/, "使用劈盾并摧毁 $1的盾牌");
	text = text.replace(/uses Split Shield and hits (.*?)\'s shield for (.*?) damage/, "使用劈盾对 $1的盾牌造成 $2 伤害");
	text = text.replace("sprints and is repelled", "冲刺并排斥");
	text = text.replace("sprints", "冲刺");
	text = text.replace(/throws dirt in (.*?)\'s face to distract them/, "往 $1的脸上扔沙土来分散他们的注意力");
	text = text.replace(/\'s (.*?) is hit for (.*?) damage and has been destroyed!/, "的 $1 被击中受到 $2 伤害，损毁了！");
	text = text.replace(/\'s (.*?) is hit for (.*?) damage and suffers/, "的 $1 被击中受到 $2 伤害，遭受到");
	text = text.replace(/\'s shield is hit for (.*?) damage/, "的盾牌被击中受到 $1 伤害");
	text = text.replace(/\'s (.*?) is hit for (.*?) damage/, "的 $1 被击中受到 $2 伤害");
	text = text.replace("destroyed!", "损毁了！");
	text = text.replace("Bitten", "咬了");
	text = text.replace("has rallied", "振作起来");
	text = text.replace("is unconscious.", "是无意识的。");
	text = text.replace("has died.", "死亡。");
	text = text.replace("has killed", "杀死");
	text = text.replace("has struck down", "击倒");
	text = text.replace("is struck down", "被击倒");
	text = text.replace("has retreated from battle", "已经退出战斗");
	text = text.replace("Not enough Action Points!", "行动点不足！");
	text = text.replace("Too much fatigue!", "太疲劳了！");
	text = text.replace("chance to hit", "命中几率");
	text = text.replace("Surrounded", "包围");
	text = text.replace("Height advantage", "高度优势");
	text = text.replace("Target on bad terrain", "恶劣地形上的目标");
	text = text.replace("Fast Adaption", "快速适应");
	text = text.replace("Oath of Wrath", "愤怒誓言");
	text = text.replace("Too close", "太近");
	text = text.replace("Height disadvantage", "高度劣势");
	text = text.replace("On bad terrain", "处于恶劣地形");
	text = text.replace("Armed with shield", "装备盾牌");
	text = text.replace("Distance of", "距离");
	text = text.replace("Line of fire blocked","阻挡射击线");
	text = text.replace("Resistance against ranged weapons", "远程抗性");
	text = text.replace("Resistance against piercing attacks","穿刺抗性");
	text = text.replace("Immune to stun", "免疫击晕");
	text = text.replace("免疫 to stun", "免疫击晕");
//	text = text.replace("Cannot be equipped until fixed", "在修好之前不能装备");
	text = text.replace("Immune to being rooted", "免疫定身");
	text = text.replace("Immune to being knocked back or hooked", "免疫撞退或钩拉");
	text = text.replace(/uses (.*?) and the shot goes astray and hits (.*?) \(Chance: (.*?), Rolled: (.*?)\)/, "使用 $1 射击误入歧途，命中 $2 （机率： $3，掷骰： $4）");
	text = text.replace(/uses (.*?) and the shot goes astray and misses (.*?) \(Chance: (.*?), Rolled: (.*?)\)/, "使用 $1 射击未命中 $2 （机率： $3，掷骰： $4）");
	text = text.replace(/uses (.*?) and the shot goes astray and hits/, "使用 $1 射击命中");
	text = text.replace(/uses (.*?) and hits (.*?) \(Chance: (.*?), Rolled: (.*?)\)/, "使用 $1 击中 $2 （机率： $3，掷骰： $4）");
	text = text.replace(/uses (.*?) and misses (.*?) \(Chance: (.*?), Rolled: (.*?)\)/, "使用 $1 未击中 $2 （机率： $3，掷骰： $4）");
	text = text.replace(/uses (.*?) and hits/, "使用 $1 击中");
	text = text.replace(/has destroyed (.*?)\'s shield/, "摧毁 $1的盾牌");
	text = text.replace(/has hit (.*?)\'s shield for 1 damage/, "击中 $1的盾牌造成1伤害");
	text = text.replace("uses skill", "使用技能");
	text = text.replace("uses Spearwall", "使用矛墙");
	text = text.replace("uses Riposte", "使用还击");
	text = text.replace("uses", "使用");

	text = text.replace(/Skill (.*?) removed from (.*?)/, "技能 $1 移除被 $2");
	text = text.replace("Showing skills of", "显示的技能");

	text = text.replace("\'s body has been sprayed with acid", "的身体上喷了酸。");
	text = text.replace("is now sick", "现在生病了");
	text = text.replace("gains rage!", "获得愤怒！");
	text = text.replace("\'s body has been sprayed with holy water", "的身体被洒上了圣水。");
	text = text.replace("Died in his sleep", "在睡梦中死去");
	text = text.replace("is poisoned", "中毒了");
	text = text.replace("lost concentration", "神情恍惚");
	text = text.replace("Died from poison", "死于中毒");
	text = text.replace("Taunted", "被嘲讽");

	text = text.replace("Left to die", "任其死去");
	text = text.replace("Sacrificed to Davkul", "献祭给达库尔");

	text = text.replace("inspiring presence: on combat started!", "鼓舞人心的存在：战斗开始了！");
	text = text.replace(/heals for (.*?) points/, "治疗 $1 点");
	text = text.replace(/\'s (.*?) has broken!/, "的 $1 破损了！");
	text = text.replace("has nine lives!", "有九命！");
	text = text.replace("has risen from the dead", "从死亡中复活");

	text = text.replace("is fleeing", "逃跑中");
	text = text.replace("is breaking", "溃散中");
	text = text.replace("is wavering", "动摇中");
	text = text.replace("\'s morale is now steady", "的士气现在是稳定的");
	text = text.replace("is confident", "自信了");

	text = text.replace("Breaking Free!", "打破自由！");
	text = text.replace("Other Werewolves in range to howl with", "其他冰原狼在范围内嚎叫");
	text = text.replace("Waiting until others have moved!", "等待别人行动！");
	text = text.replace("Going for defensive position.", "准备防守姿势。");
	text = text.replace("Holding defensive position.", "处于防守姿势。");
	text = text.replace("Disengaging!", "脱开！");
	text = text.replace("Engaging to melee range with", "近战范围交战");
	text = text.replace("not visible", "不可见");
	text = text.replace("visible", "可见");
	text = text.replace("Failed to execute path for Melee Engage - No path found", "执行近战攻击路径失败，未找到路径");
	text = text.replace("Reached engage destination", "到达交战地点");
	text = text.replace("Stopped before reaching destination", "到达目的地前停止");
	text = text.replace("It\'s important that I get some distance from my opponents.", "我和对手保持一定距离很重要。");
	text = text.replace("Considering improving position since a clearly better one is right next to me.", "考虑提高位置，因为一个明显更好的位置就在我旁边。");
	text = text.replace("Taking cover.", "采取掩护。");
	text = text.replace("Engaging into firing range over", "进入射击范围");
	text = text.replace("tiles at", "格子");
	text = text.replace("In fact, I would prefer to remain where I am", "事实上，我宁愿呆在我现在的地方");
	text = text.replace("(new)", "（新的）");
	text = text.replace("Failed to execute path for Gruesome Feast - No path found!", "为阴森悚宴执行路径失败，找不到路径！");
	text = text.replace("Moving into range to use Gruesome Feast", "进入射程使用阴森悚宴");
	text = text.replace("hide after numbers advantage", "隐藏在数字之后的优势");
	text = text.replace("hide after opponent close enough", "在对手靠近后隐藏");
	text = text.replace("hide after everyone engaged", "所有人忙碌后隐藏");
	text = text.replace("score", "分数");
	text = text.replace("Holding hidden position.", "保持隐藏位置。");
	text = text.replace("Waiting with (.*?) of (.*?) AP left.", "等待 $1 的 $2 AP恢复。");
	text = text.replace("Ending Turn with (.*?) of (.*?) AP left.", "结束回合 $1 的 $2 AP恢复。");
	text = text.replace("Moving into safer position", "移动到更安全的位置");
	text = text.replace("Moving tail.", "移动尾部。");
	text = text.replace("Moving to engage.", "移动交战。");
	text = text.replace("Picking up melee weapon!", "拿起近战武器");
	text = text.replace("Moving into range to use Possess Undead", "移动到范围使用支配亡灵");
	text = text.replace("Going for protective position.", "去保护位置。");
	text = text.replace("Moving into range to use Raise Undead", "移动到范围使用复活亡灵");
	text = text.replace("Reloading!", "装填！");
	text = text.replace("Retreated!", "撤退！");
	text = text.replace("Retreating.", "撤退。");
	text = text.replace("Roaming.", "漫步。");
	text = text.replace("Switching Position", "互换位置");
	text = text.replace("Switching to melee weapon!", "切换到近战武器！");
	text = text.replace("Switching to ranged weapon!", "切换到远程武器！");
	text = text.replace("Wakes Up Allies!", "唤醒盟友！");
	text = text.replace("Invalid target!", "无效的目标！");
	text = text.replace("fires a shell high in the air", "向空中发射炮弹");
	text = text.replace("A mortar shell impacts on the battlefield", "臼炮炮弹冲击战场");
	text = text.replace("is dazed by the Gilder\'s Embrace", "被镀金者的拥抱茫然了");
	text = text.replace("gores", "顶伤");
	text = text.replace("uses Spirit Walk", "使用灵魂漫步");
	text = text.replace("has mastered death!", "已经掌握了死亡！");
	text = text.replace("raises the earth!", "提起大地！");
	text = text.replace("explodes into shrapnel of bone!", "爆炸成骨头碎片!");
	text = text.replace("summons lightning", "召唤闪电");
	text = text.replace("Lightning strikes the battlefield", "闪电击中战场");
	text = text.replace("withers", "幻灭");
	text = text.replace("drags in", "拖进");

	text = text.replace("The earth lowers again", "大地又降低了");
	text = text.replace("IsKrakenDefeated", "克拉肯战败");

	text = text.replace("unable to find unique name: ", "找不到唯一名称：");

	text = text.replace("discovered!", "被发现了！");
	text = text.replace("Using", "使用");
	text = text.replace("against", "对");

	text = TranslateToolTip0(text);

	text = text.replace("Shot", "射击");

	return text;
}

//MSU addPage  EnumSetting
var TranslateMSUButton = function(text)
{
	text = text.replace("Reduced", "简略");
	text = text.replace("None", "无");
	text = text.replace("Blue", "蓝色");
	text = text.replace("Red", "红色");
	text = text.replace("Vanilla", "原版设置");
	text = text.replace("Full", "完整");
	text = text.replace("All Ingredients Available", "有全部材料时显示");
	text = text.replace("全部 Ingredients Available", "有全部材料时显示");
	text = text.replace("One Ingredient Available", "有一种材料时显示");
	text = text.replace("Always", "总是显示");
	return text;
}

//MSU
var TranslateMSUToolTip0 = function(text)
{
//VSE
	text = text.replace("Visual Skill Effects", "视觉技能效果");
	text = text.replace("Killing Frenzy Eyes", "杀戮狂暴眼睛特效");
	text = text.replace("Head Hunter Puppet", "猎头者傀儡特效");
	text = text.replace("Eye Color", "眼睛颜色");
	text = text.replace("Main", "主页");
	text = text.replace("Misc", "杂项");
	
//传奇
	text = text.replace("Autorepair Layer", "自动修复卸下的盔甲层");
	text = text.replace("Show Blueprints when", "显示制作蓝图");
	text = text.replace("Custom Socket By Bigmap", "定制角色底座");
	text = text.replace("End's Inventory Management Overhaul", "战利品管理");
	text = text.replace("Weapon Maths", "武器真实伤害");
	text = text.replace("No Follow Camera", "战场不跟随镜头");
	text = text.replace("Legendary Kriegsgeist Location", "传奇战魂地点");
	text = text.replace("Modding Standards & Utilities ", "模组标准组件");
	text = text.replace("Map Options", "模组选项");
	text = text.replace("Plan your Perks", "计划特技树");
	text = text.replace("New Campaign", "新战役");
	text = text.replace("Campaign Options", "战役选项");
	text = text.replace("Item Spawner", "物品编辑器");
	text = text.replace("Woditor", "世界编辑器");
	text = text.replace("Turn Order Numbers", "回合顺序数字显示");
	text = text.replace("Legends Mod", "传奇模组");
	text = text.replace("Battle Sisters", "战争姐妹");
	text = text.replace("Decked Out Citadels", "城堡满配建筑");
	text = text.replace("(Debug) Show Entire Map", "(调试)显示整个地图");
	text = text.replace("Dynamic Perks", "动态特技树");
	text = text.replace("Distance Scaling", "距离缩放");
	text = text.replace("Skip Camp Tutorial", "跳过营地教程");
	text = text.replace("Recruit Scaling", "招募缩放");
	text = text.replace("Bleeds Count As Kills", "流血算作击杀");
	text = text.replace("All Crafting Recipes Unlocked", "解锁所有制作配方");
	text = text.replace("Unlayered Armor[LEGACY]", "分层护甲[遗留]");
	text = text.replace("Enhanced Enemy Tooltips", "增强敌人提示栏");
	text = text.replace("All trade buildings available", "生成所有贸易建筑");
	text = text.replace("Gaurantee Citadels Have Everything", "城堡将会生成所有建筑");
//MSU
	text = text.replace("Vanilla", "原版设置");
	text = text.replace("Close Character Screen", "关闭角色屏幕");
	text = text.replace("Open Character Screen", "打开角色屏幕");
	text = text.replace("开放 Character Screen", "打开角色屏幕");
	text = text.replace("Switch to Previous Brother", "切换到上一个队友");
	text = text.replace("Switch to Next Brother", "切换到下一个队友");
	text = text.replace("Toggle Menu Screen", "切换菜单屏幕");
	text = text.replace("World Keybinds", "世界快捷键");
	text = text.replace("Close Campfire Screen", "关闭随从屏幕");
	text = text.replace("Close 扎营fire Screen", "关闭随从屏幕");
	text = text.replace("Toggle Relations Screen", "切换派系和关系屏幕");
	text = text.replace("Toggle 关系 Screen", "切换派系和关系屏幕");
	text = text.replace("Toggle Obituary Screen", "切换讣告屏幕	");
	text = text.replace("Toggle Camping", "切换扎营状态");
	text = text.replace("Toggle 扎营ing", "切换扎营状态");
	text = text.replace("Toggle Retinue SCreen", "切换随从屏幕");
	text = text.replace("Pause World", "暂停游戏");
	text = text.replace("Normal World Speed", "正常速度");
	text = text.replace("Fast World Speed", "加快速度");
	text = text.replace("Toggle Tracks", "切换跟踪足迹");
	text = text.replace("Lock Camera on Party", "锁定相机到队伍");
	text = text.replace("Quicksave", "快速保存");
	text = text.replace("Quickload", "快速读取");
	text = text.replace("Select Event Option 1", "选择事件选项一");
	text = text.replace("Select Event Option 2", "选择事件选项二");
	text = text.replace("Select Event Option 3", "选择事件选项三");
	text = text.replace("Select Event Option 4", "选择事件选项四");
	text = text.replace("Toggle Forced Attack", "切换强制攻击");
	text = text.replace("Combat Keybinds", "战斗快捷键");
	text = text.replace("Close Character Screen", "关闭角色屏幕");
	text = text.replace("Toggle Stats Overlay", "切换生命显示条");
	text = text.replace("Toggle Trees", "切换树显示");
	text = text.replace("Toggle 树s", "切换树显示");
	text = text.replace("Toggle Highlighting Blocked Tiles", "切换高亮显示阻档地块");
	text = text.replace("End Turn for Character", "结束回合");
	text = text.replace("End Turn for All Characters", "结束所有回合");
	text = text.replace("Wait Character Turn", "等待回合");
	text = text.replace("Focus on Active Character", "相机居中活动角色");
	text = text.replace("Focus on 主动 Character", "相机居中活动角色");
	text = text.replace("General", "常规");
	text = text.replace("Expanded Skill Tooltips", "扩展技能提示栏");
	text = text.replace("Expanded Item Tooltips", "扩展物品提示栏");
	text = text.replace("Global Logging", "全局日志");
	text = text.replace("AI Behavior logging", "AI行为日志");
	text = text.replace("All mod logging", "所有MOD日志");
	text = text.replace("Logging", "日志");
	text = text.replace("Change Keybing", "更改快捷键");
//Prepare For Battle
	text = text.replace("Show Prepare For Battle When Ambushed", "被伏击时可以战斗准备");
	text = text.replace("Prepare For Battle", "战斗准备");
//Modular Damage Notifications
	text = text.replace("Hitpoint Threshold", "生命阀值");
	text = text.replace("Armor Threshold", "护甲阀值");
	text = text.replace("Hitpoint 脱粒old", "生命阀值");
	text = text.replace("盔甲 脱粒old", "护甲阀值");
	text = text.replace("Modular Damage Notifications", "模块化损坏通知");
//mod_weapon_maths
	text = text.replace("Shorten Tooltip", "缩短提示栏");
//CustomFight
	text = text.replace("Custom Fight", "定制战斗");
	text = text.replace("Allow Settings", "允许设置");
	text = text.replace("toggleFovTactical", "切换视野");
	text = text.replace("togglePauseTactical", "切换暂停");
	text = text.replace("initNextTurn", "进入下一回合");
	text = text.replace("toggleCustomFightSpawnScreen", "切换定制战斗生成屏幕");
	text = text.replace("toggleCustomFightScreen", "切换定制战斗屏幕");
//settlement price
	text = text.replace("settlement prices", "城镇价格显示");
	text = text.replace("named weapon perks", "红武特技");
	text = text.replace("Swifter", "更快的速度和事件");
	text = text.replace("Settlement Situations", "城镇情况提示");
	text = text.replace("Extra Keybinds", "扩展快捷键");
	text = text.replace("Choice Champion", "冠军生成调节");
	text = text.replace("Town Management", "无尽竞技场");
	text = text.replace("Cavalry", "骑兵");
	text = text.replace("Autopilot", "自动战斗");
	text = text.replace("Locked for stability.", "为了稳定性将其锁定。");
	text = text.replace("Locked", "已锁定");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = TranslateToolTip0_events(text);
	return text;
}

var TranslateMSUToolTip1 = function(text)
{
	
	text = text.replace("Define how Blueprints are shown: \'All Ingredients Available\' is the Vanilla behavior; \'One Ingredient Available\' shows recipes when one ingredient is fully satisfied; \'Always\' shows all recipes at all time", "定义制作蓝图的显示方式：\n‘有全部材料时显示’--是原版设置，有全部材料时才显示对应的制作配方；\n‘有一种材料时显示’--有任意一种材料时显示对应制作配方；\n‘始终显示’--不管有没有材料，始终显示所有制作配方。");
	text = text.replace("Any Body or Helmet Layer that you strip from a piece of armor is automatically marked as \'to be repaired\'.", "从盔甲上卸下的任何身体或头盔层都会自动标记为“待修复”。");
	//VSE
	text = text.replace("Change the eye color displayed when the human gets killing frenzy", "改变人类疯狂杀戮时显示的眼睛颜色");
	text = text.replace("Enables the glowing eyes when killing frenzy is activated.", "启用时，杀戮狂暴人物会有发光的眼睛特效。");
	text = text.replace("Enables the puppet effect when head hunter is activated.", "启用时，猎头者时启用傀儡特效。");
	//MSU
	text = text.replace("Click the fourth button from the top in a world event", "在事件选择选项中选择第四个");
	text = text.replace("Click the third button from the top in a world event", "在事件选择选项中选择第三个");
	text = text.replace("Click the second button from the top in a world event", "在事件选择选项中选择第二个");
	text = text.replace("Click the first button from the top in a world event", "在事件选择选项中选择第一个");
	text = text.replace("If enabled, considers every debug flag for every mod enabled, regardless of flag status.", "如果启用，则考虑启用每个MOD的每个调试标志，而不管调试标志状态如何。");
	text = text.replace("If enabled, sets ::Const.AI.VerboseMode to true for AI related debugging.", "如果允许，将设置 ::Const.AI.VerboseMode 为 true 记录AI的相关调试信息。");
	text = text.replace("Show MSU-based information in item tooltips e.g. Item Type.", "在物品提示栏中显示基于MSU的信息，例如物品类型。");
	text = text.replace("IMPORTANT: ", "重要:");
	text = text.replace("If this setting is enabled automatically, DO NOT disable it as it has been enabled by a mod you are using and is required by that mod.", "如果此设置是自动启用的，请不要禁用它，因为它已由您使用的mod启用，并且是该mod所必需的。");
	text = text.replace("Show MSU-based information in skill tooltips e.g. Damage Type.", "在技能提示栏中显示基于MSU的信息，例如伤害类型。");
	text = text.replace("Don't save changes.", "不保存改变");
	text = text.replace("Save changes.", "保存改变");
	text = text.replace("Add another keybind.", "增加另外的快捷键");
	text = text.replace("Modify this keybind.", "修改这个快捷键");
	text = text.replace("Delete this keybind.", "删除这个快捷键");
//Prepare For Battle
	text = text.replace("Shows the prepare for battle button even when ambushed.", "在遭遇伏击时，显示“准备战斗”按钮。");
//Modular Damage Notifications
	text = text.replace("The armor symbol will only be shown if this percentage of total armor is missing.", "当护甲损失此百分比时，护甲符号才会显示。");
	text = text.replace("The hitpoint symbol will only be shown if this percentage of life is missing.", "当生命损失此百分比时，生命值符号才会显示。");
//mod_weapon_maths	
	text = text.replace("Shorten the tooltip by taking the average of the minimum and maximum values for each stat.", "通过计算属性最小值和最大值的平均值来缩短工具栏提示。");
//custom fights
	text = text.replace("Allow the topbar buttons and the spawner screen to work in normal fights, outside of custom fights.", "允许控制栏按钮在常规战斗中显示，自定义战斗除外。");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	
	
	
	text = TranslateToolTip1_events(text);
	text = TranslateMSUToolTip0(text);
	return text;
}

var TranslateButton = function(text)
{
//增加传奇
	text = text.replace("Butcher Tent", "屠夫帐篷");
	text = text.replace("Rest", "休息帐篷");
	text = text.replace("Healing", "治疗帐篷");
	text = text.replace("Repair Tent", "修理帐篷");
	text = text.replace("Salvage Tent", "回收帐篷");
	text = text.replace("Patrol Station", "巡逻帐篷");
	text = text.replace("Training Grounds", "训练场");
	text = text.replace("Fletcher", "弹药帐篷");
	text = text.replace("Gatherer", "采集帐篷");
	text = text.replace("Hunting", "狩猎帐篷");
	text = text.replace("Enchanter", "铭刻帐篷");
	text = text.replace("Craft Forever", "重复制作");
	text = text.replace("Map Options", "模组选项");
	text = text.replace("New Campaign", "新战役");
	text = text.replace("Load Campaign", "载入战役");
	text = text.replace("Tutorial Videos", "教程视频");
	text = text.replace("Save Campaign", "保存战役");
	text = text.replace("Save & Quit", "保存并退出");
	text = text.replace("Statistics", "统计数据");
	text = text.replace("Mod Options", "模组选项");
	text = text.replace("Options", "选项");
	text = text.replace("Audio", "音频");
	text = text.replace("Controls", "控制");
	text = text.replace("Gameplay", "游戏性");
	text = text.replace("Ok", "确定");
	text = text.replace("Apply", "应用");
	text = text.replace("Cancel", "取消");
	text = text.replace("Perks", "特技");
	text = text.replace("Stash", "仓库");
	text = text.replace("Formations", "编队");
	text = text.replace("Ground", "地面");
	text = text.replace("Try out", "测验");
	text = text.replace("Hire", "雇用");
	text = text.replace("Pay", "付款");
	text = text.replace("Leave", "离开");
	text = text.replace("Retreat!", "撤退！");
	text = text.replace("Retreat", "撤退");
	text = text.replace("It\'s over", "结束了");
	text = text.replace("Run them down!", "赶尽杀绝！");
	text = text.replace("Accept", "接受");
	text = text.replace("Craft", "手工制作");
	text = text.replace("Delete", "删除");
	text = text.replace("Next", "下一步");
	text = text.replace("Start Battle", "开始战斗");
	text = text.replace("Start", "开始");
	text = text.replace("Play", "开玩");
	text = text.replace("Previous", "返回");
	text = text.replace("Save", "保存");
	text = text.replace("Load", "载入");
	text = text.replace("Scenarios", "场景");
	text = text.replace("Video", "视频");
	text = text.replace("Credits", "制作组");
	text = text.replace("Quit", "退出");
	text = text.replace("Resume", "继续");
	text = text.replace("Retire", "退休");
	text = text.replace("Loot", "战利品");
	text = text.replace("Yes", "是");
	text = text.replace("No", "否");
	text = text.replace("Close", "关闭");
	text = text.replace("Travel", "旅行");
	text = text.replace("Engage!", "开战！");
	text = text.replace("Flee!", "逃走！");
	text = text.replace("To Arms!", "拿起武器！");
	text = text.replace("Fall back!", "撤退！");
	text = text.replace("Continue", "继续");
	text = text.replace("All", "全部");
	text = text.replace("Disabled", "禁止");
	text = text.replace("Specific", "特有");
	text = text.replace("Combat", "战斗");
	text = text.replace("Keybinds", "快捷键");
	text = text.replace("Modify", "修改");
	text = text.replace("Prepare", "准备");
	text = text.replace("Legends Mod", "传奇模组");
	text = text.replace("Add", "增加");
	text = text.replace("OK", "确定");
	text = TranslateMSUButton(text);
	return text;
}

var TranslateDialog = function(text)
{
	text = text.replace(/The enemy was destroyed in (.*?) rounds?/, "敌人在 $1 轮内被消灭");
	text = text.replace(/The enemy retreated after (.*?) rounds?/, "敌人在 $1 轮后撤退");
	text = text.replace(/You lost after (.*?) rounds?/, "你在 $1 轮后被打败");
	text = text.replace(/You retreated after (.*?) rounds?/, "你在 $1 轮后撤退");
	text = text.replace("Retreat From Combat", "从战斗中撤退");
	text = text.replace("Are you sure?", "你确定吗？");
	text = text.replace("The Enemy Retreats", "敌人撤退了");

	text = text.replace("Are you sure?", "你确定吗？");
	text = text.replace("Sometimes it\'s better to do a tactical retreat in order to live and fight another day.", "有时候，为了生存和另一天的战斗，最好做一次战术撤退。");
	text = text.replace("The men will attempt to reach the edges of the map by themselves and then safely retreat.", "这些人将试图自己到达地图的边缘，然后安全撤退。");
	text = text.replace("However, the enemy may catch up, and anyone currently engaged may not be able to get away unscathed or even alive.", "但是，敌人可能会追上来，任何正在交战的人都可能无法不受伤害，甚至无法生还。");
	text = text.replace("The enemy is battered and beaten.", "敌人被打败了。");
	text = text.replace("Those few still alive scatter away in all directions.", "那几个还活着的人四散而去。");
	text = text.replace("Will you hunt them down to claim their heads and possessions, or declare the battle won?", "你要追捕他们，夺取他们的头颅和财物，还是宣布战争胜利？");

	text = text.replace("You can\'t make out who is attacking you in time.", "你不知道是谁在攻击你。");
	text = text.replace("You have to defend yourself!", "你必须保护自己！");
	text = text.replace("You can\'t make out who you\'ll be facing.", "你不知道你将面对谁。");
	text = text.replace("Attack at your own peril and be prepared to retreat if need be!", "自担风险地攻击，必要时随时准备撤退！");

	text = text.replace("Obituary", "讣告");
	text = text.replace("Hire", "雇用");
	text = text.replace("Factions & Relations", "派系和关系");
	text = text.replace("Load Campaign", "载入战役");
	text = text.replace("New Campaign", "新战役");
	text = text.replace("Save Campaign", "保存战役");
	text = text.replace("Choose a Scenario", "选择一个场景");
	text = text.replace("Victory", "胜利");
	text = text.replace("Defeat", "失败");
	text = text.replace("Retreat", "撤退");
	text = text.replace("Options", "选项");

	return text;
}

var TranslatePopupDialog = function(text)
{
	text = text.replace("Unlock Perk", "解锁特技");
	text = text.replace("Dismiss", "解雇");
	text = text.replace("Change Name & Title", "更改名称和头衔");
	text = text.replace("Leveled Up", "升级");
	text = text.replace("Level Up", "升级");
	text = text.replace("Retire", "退休");
	text = text.replace("Stash Size Changed", "仓库大小已经改变");
	
	return text;
}

var TranslateDialogScreen = function(text)
{
	text = text.replace(/By continuing you would delete the last (.*?) items in your stash\./, "如果继续，仓库里最后位置的 $1 件物品会丢失。");

	text = text.replace("Cancelling an active contract will adversely affect your reputation as a reliable sword for hire, as well as the relation to your current employer - especially if you received any payment in advance.", "取消一份有效的合同将对你作为一把可靠的雇佣之剑的声誉以及与你当前雇主的关系产生不利影响，尤其是如果你收到了预付款。");
	text = text.replace("Are you sure you want to cancel?", "你确定要取消吗？");
	text = text.replace("Cancelling an ambition will allow you to choose a new one, but it will also leave your men disappointed in you as a leader.", "取消一个野心会让你选择一个新的野心，但也会让你的手下对你的领导失望。");
	text = text.replace("Are you sure you want to quit this battle and return to the main menu?", "你确定要退出这场战斗并返回主菜单吗？");
	text = text.replace("Any progress made in battle will be lost, but there was an autosave made right before the battle started.", "在战斗中取得的任何进展都将丢失，如果可以的话在战斗开始前会自动保存。");
	text = text.replace("Are you sure you want to quit this battle and thereby forfeit your ironman run and retire from your company?", "你确定你想退出这场战斗，从而失去你的铁人模式和退出你的战队？");
	text = text.replace("Your save will be deleted and you won\'t be able to continue.", "你的存档将被删除，你将无法继续。");
	text = text.replace("This campaign was created before you activated the \'Beasts & Exploration\' DLC.", "此战役是在激活“野兽与探险”DLC之前创建的。");
	text = text.replace("Please be aware that even though you can continue to play this campaign, you won\'t have access to all of the new content unless you start a new campaign.", "请注意，即使你可以继续玩此战役，除非你开始新的战役，否则你将无法访问所有新内容。");
	text = text.replace("This campaign was created before you activated the \'Warriors of the North\' DLC.", "此战役是在激活“北方的勇士”DLC之前创建的。");
	text = text.replace("Have all your characters skip their turn until the next round starts?", "你所有的角色都跳过他们的回合直到下一轮开始？");
	text = text.replace(/You can choose to (.*?) in order to gain 27 more inventory slots for the cost of (.*?) crowns\./, "你可以选择 $1 获得27个仓库空间，需要花费 $2 克朗。");
	text = text.replace("Is this what you want to do?", "你想这样做吗？");
	text = text.replace(/Sadly, you can not afford the (.*?) crowns necessary to (.*?) and gain more inventory space at this time\./, "遗憾的是，此时你无法负担 $1 克朗，这是 $2 所必须的，暂时无法获得更多仓库空间。");

	text = text.replace("Cancel Contract", "取消合同");
	text = text.replace("Cancel Ambition", "取消野心");
	text = text.replace("Quit to Main Menu", "退出到主菜单");
	text = text.replace("Quit & Retire", "退出并退休");
	text = text.replace("Quit", "退出");
	text = text.replace("Old Campaign Loaded", "老战役已加载");
	text = text.replace("End Round", "结束回合");
	text = text.replace("Buy a Cart", "购买货车");
	text = text.replace("Buy a Big Wagon", "购买大型载重货车");
	text = text.replace("Buy a Wagon", "购买载重货车");
	text = text.replace("buy a cart", "购买货车");
	text = text.replace("buy a big wagon", "购买大型载重货车");
	text = text.replace("buy a wagon", "购买载重货车");

	return text;
}

var TranslateCharacterScreenLeftPanelHeaderModule = function(text)
{
	text = text.replace("Click here to level up!", "点击此处升级！");

	return text;
}

var TranslateCharacterScreenPerksModule0 = function(text)
{
//骑马MOD
	text = text.replace("You can\'t ride any pet while fighting as dual-wield style.", "在骑乘时，不能以双持方式战斗。");
	text = text.replace("While Riding any pet,", "当你骑乘任何宠物时，");
	text = text.replace("you can get 3 more additional Action point,", "你可以获得3个额外的行动点，");
	text = text.replace("however you need 1 more action point to use any skill.", "但是你需要1个额外的行动点才能使用任何技能。");
	text = text.replace("Also, Mounted character is immune to grab or knock back.", "此外，骑乘角色不会被抓或击退");
	text = text.replace("Rotation or barbarian can't be used with mounted character", "换位或野蛮人不能影响骑乘角色");
	text = text.replace("Hold weapons in both hands and fight against the enemy. You can\'t fight as dual-wield style while riding any pet.", "双手拿着武器与敌人作战。在骑乘时，不能以双持方式战斗。");
	text = text.replace("When you attack the enemy, there is Chance to attack the enemy once again with other hand\’s weapon.", "当你攻击敌人时，有机会用另一只手的武器再次攻击敌人。");
	text = text.replace("When you attack the enemy,", "当你攻击敌人时，");
//	text = text.replace("there is Chance to attack the enemy once again with other hand的 weapon.", "有机会用另一只手的武器再次攻击敌人。");
	text = text.replace("there is Chance to attack the enemy once again with other hand\'s weapon.", "有机会用另一只手的武器再次攻击敌人。");
	text = text.replace("Offhand Attack power", "副手攻击力");
	text = text.replace("Now you can equip the onehanded Weapon in the offhand. Click right mouse the weapon in the stash or brother\'s bag slot with pressing Shift button.", "现在副手可以装备单手武器。按Shift键，然后用鼠标右键单击仓库或队友包裹中的武器(仓库快捷键与战利品管理MOD冲突，可把装备放在人物包裹里再装备)。");
	text = text.replace("Only sword, dagger, cleaver, axe, mace and hammer can be equipped as offhand weapon.", "只有剑、匕首、砍刀、斧头、棍棒和锤子可以作为副手武器装备。");
	text = text.replace("Also, you can use only basic skill as offhand weapon.", "此外，你只能使用副手武器的基本技能。");
	text = text.replace(/Duelist perk works but effect is (.*?) instead of (.*?)\./, "决斗者特技有效，但效果是$1，而不是$2。");
	text = text.replace("Mainhand Attack probability", "主手攻击概率");
	text = text.replace(/There is (.*?) to attack the enemy 1 more time when you use offhand basic skill\./, "当使用副手武器的基本技能时，有$1的几率主手再攻击敌人1次。");
	text = text.replace("Offhand Attack probability", "副手攻击概率");
	text = text.replace(/There is (.*?) to attack the enemy 1 more time when you use Mainhand basic skill\./, "当使用主手武器的基本技能时，有$1的几率副手再攻击敌人1次。");
	text = text.replace("Advanced Riding", "高级骑术");
	text = text.replace(/Now this character is veteran rider. When mounted, (.*?) of base melee defense of rider will be added. Ranged defense is same too\./, "现在这个角色是熟练骑兵了。骑乘时，骑手将增加$1的基础近程和远程的防御。");
	text = text.replace("Riding", "骑术");
	text = text.replace("Let\'s be a mounted soldier! You need this skill to ride the horse.", "成为一名骑兵吧！骑马需要这种技巧。");
	text = text.replace("Additionaly, you can get 20 Initiative bonus when mounted. Also, breakthrough chnace will be increased.", "另外，骑乘时可以增加20主动值、冲破几率也将增加。");
	text = text.replace("At last, it reduces the probability of falling from the mount.", "最后，降低从坐骑上坠落的概率。");
	text = text.replace("Dual Wield", "双持武器");
	text = text.replace("It allows you to put weapons on both hands.", "可以让你双手都装备武器。");
	text = text.replace("Swift Attack", "迅捷攻击");
	text = text.replace("Let\'s attack the enemy quickly. The higher the initiative, the higher the probability of additional attacks.", "可以快速攻击敌人。主动值越高，发动额外攻击的概率越高。");
	text = text.replace("Max Bonus is with 150 initiative", "150主动值时几率最高");
	text = text.replace("Strong Grip", "强力握持");
	text = text.replace("With strong grip left-handed attack will be more effectively.", "用强力握紧的左手武器进攻时会更大的几率发动额外攻击");
	text = text.replace("Horseback Archery", "骑射");
	text = text.replace("No more ranged attack penalty exists when mounted.", "骑乘时不再有远程攻击惩罚。");
	text = text.replace("Charge Training", "冲锋训练");
	text = text.replace("Charge damage and Knockback chance will be increased when you use horse charge skill. ALso you can get 20 Initiative bonus when mounted.", "当你使用骑乘冲锋技能时，冲锋伤害和击退几率会增加。此外，骑乘时获得20点主动值加成。");
	text = text.replace("Charge damage 和 Knockback chance will be increased when you use horse charge skill. ALso you can get 20 主动值 bonus when mounted.", "当你使用骑乘冲锋技能时，冲锋伤害和击退几率会增加。此外，骑乘时获得20点主动值加成。");
	text = text.replace("Charge damage 和 Knockback chance will be increased when you use horse charge skill.", "当你使用骑乘冲锋技能时，冲锋伤害和击退几率会增加。");
	text = text.replace("ALso you can get 20 主动值 bonus when mounted.", "此外，骑乘时获得20点主动值加成。");
	text = text.replace("Deadly Charge", "致命冲锋");
	text = text.replace("Charge and terrorize the enemy! Horse charge has a chance to checkmorale for target and adjacent enemies to the target.", "冲锋恐吓敌人！骑乘冲锋时有机会检查目标和目标附近敌人的士气。");
	text = text.replace("Charge 和 terrorize the enemy! Horse charge has a chance to checkmorale for target and adjacent enemies to the target.", "冲锋恐吓敌人！骑乘冲锋时有机会检查目标和目标附近敌人的士气。");
//	text = text.replace("Charge 和 terrorize the enemy!", "冲锋恐吓敌人！");
//	text = text.replace("Horse charge has a chance to checkmorale for target and adjacent enemies to the target.", "骑乘冲锋时有机会检查目标和目标附近敌人的士气。");
	text = text.replace(/Also, there is (.*?) chance to stuen the enemy\. At last, there is (.*?) initiative bonus when mounted and small damage bonus for horse charge\./, "此外，有$1的几率击溃敌人。最后，骑乘时获得$2点主动值加成，骑乘冲锋时有小的伤害加成。");
	text = text.replace("Off-Book Deal", "私下交易");
	//SS
	text = text.replace("Retrofit Hooks", "改装挂钩");
	text = text.replace("Thriving in Chaos", "浑中求进");
	text = text.replace("Honor Heritage", "荣誉传承");
	text = text.replace("Irresistible Impulse", "无法抗拒的冲动");
	text = text.replace("Audacious Charge", "无畏冲锋");
	text = text.replace("Normal Block", "格挡训练");
	text = text.replace("Battle Rhaposdy", "战斗狂想曲");
	text = text.replace("Before the Storm", "风暴前夕");
	text = text.replace("Rapid March", "急行军");
    text = text.replace("Splitman", "分裂人");	
    text = text.replace("Flurry of Blows", "两仪回风");	
    text = text.replace("Total Cover", "全面掩护");
    text = text.replace("The Guardian", "守护者");
    text = text.replace("Grand Slam", "巨力猛击");
    text = text.replace("Backswing", "回摆");
    text = text.replace("Crainte Vomir", "恐惧喷涌");
    text = text.replace("Light Armor Mastery", "轻甲精通");
    text = text.replace("Medium Armor Mastery", "中甲精通");
    text = text.replace("Heavy Armor Mastery", "重甲精通");
    text = text.replace("Scintillating", "才华横溢");
    text = text.replace("Once More Unto the Breach", "再次突破");
    text = text.replace("In Delay There Lies No Plenty", "时不待我");
    text = text.replace("Too Stubborn to Die", "小强附身");
    text = text.replace("A Waking Chant", "唤醒吟唱");
    text = text.replace("Strive for Perfection", "追求完美");
    text = text.replace("A Hit to End All", "一鸣惊人");
    text = text.replace("Born to Be Surrounded", "天生被包围");
    text = text.replace("Wrong Door", "错误之门");
	
//start
//魔法起源
	text = text.replace("Phase Through", "分段通过");
	text = text.replace("Seductive Appearance", "诱人外表");
	text = text.replace("Enthralled Beast - Arachnids", "魅惑野兽-蛛形纲");
	text = text.replace("Enthralled Beast - Canines", "魅惑野兽-犬科");
	text = text.replace("Enthralled Beast - Alps", "魅惑野兽-梦魇");
	text = text.replace("Enthralled Beast - Nachzehrers", "魅惑野兽-食尸鬼");
	text = text.replace("Enthralled Beast - Unholds", "魅惑野兽-巨魔");
	text = text.replace("Enthralled Beast - Schrats", "魅惑野兽-树人");
	text = text.replace("Enthralled Beast - Lindwurms", "魅惑野兽-林德虫");
	text = text.replace("Captive Brute - Orks", "俘虏猛兽-兽人");
	text = text.replace("Captive Trickter - Goblins", "俘虏骗子-哥布林");
	text = text.replace("Charm 101", "魅惑101");
	text = text.replace("Nudist", "裸体诱惑");
	text = text.replace("Charm Mastery", "魅惑精通");
	text = text.replace("Puncturing Bite", "刺咬");
	text = text.replace("Poison Mastery", "毒药精通");
	text = text.replace("Weave Web Mastery", "织网精通");
	text = text.replace("Prisoners Rush", "囚徒突袭");
	text = text.replace("Constricting Grip", "紧握");
	text = text.replace("Knife Fighting", "短刀术");
	text = text.replace("Venom Gland", "毒腺");
	text = text.replace("Oversized Snake", "大蛇");
	text = text.replace("Strong Canine Jaw", "强壮犬齿颚");
	text = text.replace("Meat-Tearing Bite", "肉撕咬");
	text = text.replace("Thick Fur", "厚毛");
	text = text.replace("Overwhelm Your Prey", "制伏猎物");
	text = text.replace("Frenziness", "疯狂");
	text = text.replace("Dream Eater", "食梦者");
	text = text.replace("Overslept", "睡过头");
	text = text.replace("Horrified Wake Up", "惊醒");
	text = text.replace("Afterimage", "残留影像");
	text = text.replace("Living Nightmare", "活的梦魇");
//	text = text.replace("Mind Break", "aaaa");
	text = text.replace("Fire Bender", "发动机器");
	text = text.replace("Scorch", "烧焦");
	text = text.replace("Inferno", "地獄火");
//	text = text.replace("Shadow Copy", "aaaa");
	text = text.replace("Petting Mastery", "爱抚精通");
	text = text.replace("Naughty Luft", "淘气洛夫特");
	text = text.replace("Innocent Face", "天真面孔");
	text = text.replace("Ghoulish Beauty", "食尸鬼的美");
	text = text.replace("Ghoul", "食尸鬼");
	text = text.replace("Strengthening Meal", "强化餐");
	text = text.replace("Frenzy", "狂暴");
//	text = text.replace("Throw Up", "aaaa");
	text = text.replace("Big Tummy", "大肚子");
	text = text.replace("Hand To Hand Combat Training", "肉搏训练");
	text = text.replace("Forceful Throw", "强力投掷");
	text = text.replace("Grow Shield Mastery", "生长盾牌精通");
	text = text.replace("Obedient Sapling", "顺从的树苗");
	text = text.replace("Strong Root", "强力生根");
//	text = text.replace("Shatter The Earth", "aaaa");
//	text = text.replace("Spit Acid Blood", "aaaa");
	text = text.replace("Intimidated", "被恐吓");
//	text = text.replace("Powerful Constitution", "aaaa");
	text = text.replace("Mounted Training", "骑乘训练");
	text = text.replace("Mounted Archery", "骑乘射击");
	text = text.replace("Breeding Machine", "育种机");
	text = text.replace("Inheriting", "继承");
	text = text.replace("Natural Selection", "自然选择");
	text = text.replace("I Need an Uber", "我需要滴滴");
//	text = text.replace("Line Breaker", "aaaa");
	text = text.replace("The Champion", "冠军");
	text = text.replace("Endure The Light", "忍受阳光");
//	text = text.replace("Nocturnal", "aaaa");
	text = text.replace("Fair Game", "公平竞争");
	text = text.replace("Rupturing Bite", "咬合破裂");
	text = text.replace("Insatiable Hunger", "极度饥渴");
	text = text.replace("Bone Shattering Grip", "粉碎抓握");
	text = text.replace("Slippery Tentacle", " 圆滑触手");
	text = text.replace("Tentacle Sweep", "触角横扫");
	text = text.replace("Rubbering Skin", "弹性皮肤");
	text = text.replace("Undying Life", "永生");
	text = text.replace("Feast On Flesh", "饕餮盛宴");
	text = text.replace("Infectious Bite", "咬伤感染");
	text = text.replace("Puppet", "傀儡");
	text = text.replace("Fallen Hero", "堕落英雄");
	text = text.replace("Lego-Like", "乐高玩具");
	text = text.replace("Strong Bone", "强壮骨头");
	text = text.replace("Death Touch", "死亡之触");
	text = text.replace("Phantom", "幽灵");
	text = text.replace("Vanish", "消失");
//	text = text.replace("Phase Through", "aaaa");
	text = text.replace("Soul Eater", "食魂者");
	text = text.replace("Cursed Body", "诅咒躯体;");
	text = text.replace("Ancient Knowledge", "远古知识");
//	text = text.replace("Insects Breath", "aaaa");
	text = text.replace("Long Fangs", "长牙");
	text = text.replace("Blood Frenzy", "血腥狂暴");
	text = text.replace("Lustful Words", "淫语");

//PTR ss

	text = text.replace("Furinkazan", "风火山林");
	text = text.replace("Signature Move", "拿手好戏");
	text = text.replace("Ore Hunter", "找矿者");
	text = text.replace("Militia Practice", "民兵实习");
	text = text.replace("Militia Training", "民兵训练");
	text = text.replace("Born With a Board", "天生护盾");
	text = text.replace("Through the Ranks", "穿行而过");
	text = text.replace("Tunnel Vision", "井底之蛙");
	text = text.replace("Weapon Master", "武器大师");
	text = text.replace("Hale and Hearty", "精力充沛");
	text = text.replace("Scry Area (Trance)", "占卜区域(通灵)");
	text = text.replace(/Vengeful Spite/, "复仇的怨恨");
	text = text.replace(/Savage Strength/, "野蛮的力量");
	text = text.replace(/Feral Rage/, "野性狂暴");
	text = text.replace(/Family Ties/, "家族关系");
	text = text.replace(/Family Pride/, "家族自豪");
	text = text.replace("The Apprentice", "学徒");
	text = text.replace("The Bodyguards", "保镖");
	text = text.replace("The Team", "团队");
	text = text.replace("The Squad", "小队");
	text = text.replace("The Section", "部门");
	text = text.replace("The Platoon", "物流");
	text = text.replace("The Company", "战队");
	text = text.replace("Eyes Up", "抬头看");
	text = text.replace("Deep Cuts", "深度切割");
	text = text.replace("Internal Hemorrhage", "内出血");
	text = text.replace("Blitzkrieg", "闪电战");
	text = text.replace("Vanguard Deployment", "先锋部署");
	text = text.replace("Fencer", "剑师");
	text = text.replace("Between the Ribs", "深入骨间");
	text = text.replace("Light Weapon", "轻便武器");
	text = text.replace("Small Target", "小小目标");
	text = text.replace("Swift Stabs", "迅捷刺击");
	text = text.replace("Head Smasher", "头颅粉碎者");
	text = text.replace("From all Sides", "十面埋伏");
	text = text.replace("Deadly Precision", "致命精准");
	text = text.replace("Flail Spinner", "连枷回旋");
	text = text.replace("Rattle", "骚扰");
	text = text.replace("Deep Impact", "深层冲击");
	text = text.replace("Soft Metal", "软金属");
	text = text.replace("Dismantle", "解体");
	text = text.replace("Dismemberment", "肢解");
	text = text.replace("Dent Armor", "凿坏盔甲");
	text = text.replace("Heft", "巨力");
	text = text.replace("Cull", "屠宰");
	text = text.replace("Target Practice", "瞄准训练");
	text = text.replace("Ranged Supremacy", "远程霸权");
	text = text.replace("Arrow To TheKnee", "射向膝盖");
	text = text.replace("Flaming Arrows", "火焰箭矢");
	text = text.replace("Marksmanship", "射击术");
	text = text.replace("Hip Shooter", "左右开弓");
	text = text.replace("Swordlike", "像剑一样");
	text = text.replace("Sanguinary", "血腥");
	text = text.replace("Bloodlust", "嗜血");
	text = text.replace("Bloodbath", "血浴");
	text = text.replace("Mauler", "缠斗专家");
	text = text.replace("Through The Ranks", "穿过队列");
	text = text.replace("Take Aim", "瞄准");
	text = text.replace("Entrenched", "固守");
	text = text.replace("Power Shot", "强力射击");
	text = text.replace("Iron Sights", "机械瞄具");
	text = text.replace("Primal Fear", "本能恐惧");
	text = text.replace("Muscle Memory", "肌肉记忆");
	text = text.replace("Push It", "给点压力");
    text = text.replace("Heavy Strikes", "重击");	
	text = text.replace("Bear Down", "压倒");
	text = text.replace("Concussive Strikes", "震荡打击");
	text = text.replace("Bone Breaker", "骨头破坏者");
	text = text.replace("Bolster", "鼓励");
	text = text.replace("Leverage", "杠杆");
	text = text.replace("Intimidate", "恐吓");
	text = text.replace("Utilitarian", "功利主义者");
	text = text.replace("Follow Up", "跟进");
	text = text.replace("Long Reach", "长距接触");
	text = text.replace("Patience", "耐心");
	text = text.replace("Heavy Projectiles", "重型抛物");
	text = text.replace("Death From Afar", "远距死神");
	text = text.replace("Pointy End", "尖端");
	text = text.replace("Through the Gaps", "见缝插针");
	text = text.replace("Two for One", "买一送一");
	text = text.replace("A Better Grip", "更好的握法");
	text = text.replace("Spear Advantage", "长矛优势");
	text = text.replace("King of all Weapons", "百兵之王");
	text = text.replace("Versatile Weapon", "通用武器");
	text = text.replace("Exploit Opening", "破绽百出");
	text = text.replace("Fluid Weapon", "流体武器");
	text = text.replace("Tempo", "速度节拍");
	text = text.replace("Kata", "剑道");
	text = text.replace("En garde", "实战姿势");
	text = text.replace("Formidable Approach", "恐怖威压");
	text = text.replace("Sweeping Strikes", "横扫挥击");
	text = text.replace("Easy Target", "容易瞄准");
	text = text.replace("Wear them Down", "精疲力竭");
	text = text.replace("Whack a\' Smack", "猛击");
	text = text.replace("Hybridization", "混合风格");
	text = text.replace("Momentum", "动量");
	text = text.replace("Skirmisher", "散兵");
	text = text.replace("Opportunist", "机会主义者");
	text = text.replace("Nailed It", "钉牢它");
	text = text.replace("Survival Instinct", "生存本能");
	text = text.replace("Discovered Talent", "发掘潜力");
	text = text.replace("Know their Weakness", "知己知彼");
	text = text.replace("Rising Star", "冉冉新星");
	text = text.replace("Dynamic Duo", "活力二人组");
	text = text.replace("Vigorous Assault", "猛烈进攻");
	text = text.replace("Fresh and Furious", "迅雷不及掩耳之势");
	text = text.replace("Unstoppable", "势不可挡");
	text = text.replace("Vigilant", "警惕");
	text = text.replace("The Rush of Battle", "战争洪流");
	text = text.replace("Personal Armor", "私人盔甲");
	text = text.replace("Promised Potential", "应允潜能");
	text = text.replace("Realized Potential", "实现潜能");
	text = text.replace("Failed Potential", "未曾实现的潜能");
	text = text.replace("Punching Bag", "受气包");
	text = text.replace("Trauma Survivor", "创伤幸存者");
	text = text.replace("Bulwark", "壁垒");
	text = text.replace("Man of Steel", "铁人");
	text = text.replace("Offhand Training", "副手训练");
	text = text.replace("Fruits of Labor", "劳动果实");
	text = text.replace("Wears it Well", "穿好制服");
	text = text.replace("Menacing", "穷凶极恶");
	text = text.replace("Bully", "欺凌弱小");
	text = text.replace("Pattern Recognition", "模式识别");
	text = text.replace("Exude Confidence", "信心洋溢");
	text = text.replace("Professional", "职业军人");
	text = text.replace("Always An Entertainer", "时刻都是艺人");
	text = text.replace("Paint a Smile", "保持笑容");
	text = text.replace("Strength in Numbers", "人多力量大");
//sundries
    text = text.replace("Phalanx", "方阵");
	text = text.replace("Line Breaker", "阵线破坏者");
	text = text.replace("Cover Ally", "掩护友军");
	text = text.replace("In the Zone", "全神贯注");
	text = text.replace("Perfect Fit", "完美定制");
	text = text.replace("Staff Defense", "法杖防御");
	text = text.replace("Perseverance", "坚忍");
	text = text.replace("Navigator", "领航员");
	text = text.replace("Anchor", "锚定");
//legend mod
	text = text.replace("Blade Dancer", "刀锋舞者");
	text = text.replace("Reaper", "死神");
	text = text.replace("Metzger", "屠夫");
	text = text.replace("Precise", "穿针引线");
	text = text.replace("Versatile Swordsman", "全能剑客");
	text = text.replace("Juggernaut", "主宰者");
	text = text.replace("Grappler", "缠斗术");
	text = text.replace("Killing Frenzy", "杀戮狂暴");
	text = text.replace("Flesh Mortification", "肉身苦行");
	text = text.replace("Favoured Enemy - Nachzehrers", " 偏好敌人——食尸鬼");
	text = text.replace("Favoured Enemy - Hexen", " 偏好敌人——女巫");
	text = text.replace("Favoured Enemy - Orcs", " 偏好敌人——兽人");
	text = text.replace("Favoured Enemy - Alps", " 偏好敌人——梦魇");
	text = text.replace("Favoured Enemy - Unholds", " 偏好敌人——巨魔");
	text = text.replace("Favoured Enemy - Lindwurms", " 偏好敌人——林德虫");
	text = text.replace("Favoured Enemy - Direwolf", " 偏好敌人——冰原狼");
	text = text.replace("Favoured Enemy - Spiders", " 偏好敌人——蜘蛛");
	text = text.replace("Favoured Enemy - Schrats", " 偏好敌人——树人");
	text = text.replace("Favoured Enemy - Orks", " 偏好敌人——兽人");
	text = text.replace("Favoured Enemy - Goblins", " 偏好敌人——哥布林");
	text = text.replace("Favoured Enemy - Necrosavants", " 偏好敌人——吸血鬼");
	text = text.replace("Favoured Enemy - Ancient dead", " 偏好敌人——古代亡灵");
	text = text.replace("Favoured Enemy - Wiedergänger", " 偏好敌人——僵尸");
	text = text.replace("Favoured Enemy - Noble", " 偏好敌人——贵族");
	text = text.replace("Favoured Enemy - Bandit", " 偏好敌人——强盗");
	text = text.replace("Favoured Enemy - Barbarian", " 偏好敌人——野蛮人");
	text = text.replace("Favoured Enemy - Archer", " 偏好敌人——弓箭手");
	text = text.replace("Favoured Enemy - Sword Master", " 偏好敌人——剑士");
	text = text.replace("Favoured Enemy - Mercenary", " 偏好敌人——雇佣兵");
	text = text.replace("Favoured Enemy - Caravan", " 偏好敌人——平民");
	text = text.replace("Favoured Enemy - Southerner", " 偏好敌人——南方人");
	text = text.replace("Favoured Enemy - Nomad", " 偏好敌人——游牧民");
	text = text.replace("Favoured Enemy -", " 偏好敌人——");
	text = text.replace("Whites of their Eyes", "他们的眼白");
	text = text.replace("Slinger's Spins", "投石器回旋");
	text = text.replace("Heavy Rocks", "重石");
	text = text.replace("Arrow to the Knee", "射向膝盖");
	text = text.replace("Berserker Rage", "狂战士之怒");
	text = text.replace("Powerful Constitution", "超强体质");
	text = text.replace("Spit Acid Blood", "喷射酸液");
	text = text.replace("Tail Thresh", "尾巴锤击");
	text = text.replace("Tail Sweep", "尾巴横扫");
	text = text.replace("Tail Split", "尾巴劈裂");
	text = text.replace("Trophy Hunter", " 宝藏猎手");
	text = text.replace("Bruiser", " 斗士");
	text = text.replace("Crusher", " 粉碎者");
	text = text.replace("Close Combat Archer", " 抵近射击");
	text = text.replace("Bullseye", " 精准射击");
	text = text.replace("Ballistics", " 弹道学");
	text = text.replace("Berserk", " 狂战士");
	text = text.replace("Slaughterer", " 屠宰者");
	text = text.replace("Between the Eyes", " 瞄准眉心");
	text = text.replace("Devastating Strikes", " 毁灭打击");
	text = text.replace("Backflip", "后翻");
	text = text.replace("Twirl", "旋转");
	text = text.replace("Shield Bash", " 盾牌猛击");
	text = text.replace("Brawny", " 健壮");
	text = text.replace("Stalwart", " 坚定");
	text = text.replace("Taunt", " 嘲讽");
	text = text.replace("Steadfast", " 稳固");
	text = text.replace("Colossus", " 巨人");
	text = text.replace("Deflect", " 偏转");
	text = text.replace("Evade", " 闪避");
	text = text.replace("Shield Expert", " 盾牌精通");
	text = text.replace("Nine Lives", " 九命猫");
	text = text.replace("Battering Ram", " 重槌轰击");
	text = text.replace("Last Stand", " 背水一战");
	text = text.replace("Ironside", " 铁皮");
	text = text.replace("Battle Forged", " 战斗锻造");
	text = text.replace("Bags and Belts", " 背包挎带");
	text = text.replace("背包s and Belts", " 背包挎带");
	text = text.replace("Rebound", " 触底反弹");
	text = text.replace("Feint", " 佯攻");
	text = text.replace("Student", " 好学生");
	text = text.replace("Lookout", " 守望");
	text = text.replace("Zweihander", " 双手剑士");
	text = text.replace("Pathfinder", " 探路者");
	text = text.replace("Fortified Mind", " 意志坚定");
	text = text.replace("Sergeant", " 中士");
	text = text.replace("Boondock Blade", " 处刑刀刃");
	text = text.replace("Artful Dodger", " 巧妙躲闪");
	text = text.replace("Inspiring Presence", " 振奋军心");
	text = text.replace("Quick Hands", " 快手");
	text = text.replace("Crippling Strikes", " 致残打击");
	text = text.replace("Duelist", " 决斗者");
	text = text.replace("Vengeance", " 复仇");
	text = text.replace("Double Strike", " 双重打击");
	text = text.replace("Nimble", " 轻灵");
	text = text.replace("Dodge", " 躲闪");
	text = text.replace("Resilient", " 坚韧");
	text = text.replace("Anticipation", " 预判");
	text = text.replace("Steel Brow", " 钢头");
	text = text.replace("Executioner", " 行刑者");
	text = text.replace("Weaponmaster", " 武器大师");
	text = text.replace("Immovable Object", " 不可撼动");
	text = text.replace("Fast Adaptation", " 快速适应");
	text = text.replace("Bloody Harvest", " 血腥收割");
	text = text.replace("Sundering Strikes", " 破甲打击");
	text = text.replace("Battle Flow", " 战斗不息");
	text = text.replace("Head Hunter", " 猎头者");
	text = text.replace("Rally the Troops", " 集结部队");
	text = text.replace("Fearsome", " 可畏");
	text = text.replace("Indomitable", " 不屈");
	text = text.replace("Furor", " 狂热");
	text = text.replace("Debilitate", " 虚弱");
	text = text.replace("Footwork", " 步法");
	text = text.replace("Rotation", " 换位");
	text = text.replace("Perfect Focus", " 专心致志");
	text = text.replace("Return Favor", " 以牙还牙");
	text = text.replace("Underdog", " 落单狗");
	text = text.replace("Sprint", " 冲刺");
	text = text.replace("Recover", " 恢复");
	text = text.replace("Inspire", " 激励");
	text = text.replace("Gifted", " 天赋异禀");
	text = text.replace("First Move", " 先发制人");
	text = text.replace("First Aid", " 急救");
	text = text.replace("Adrenaline", " 肾上腺素");
	text = text.replace("Backstabber", " 背刺");
	text = text.replace("Lone Wolf", " 孤狼");
	text = text.replace("Reach Advantage", " 双手优势");
	text = text.replace("Overwhelm", " 压制");
	text = text.replace("Relentless", " 不懈");
	text = text.replace("Bow Mastery", " 弓精通");
	text = text.replace("Crossbow & Firearms Mastery", " 弩精通");
	text = text.replace("Throwing Mastery", " 投掷精通");
	text = text.replace("Axe Mastery", " 斧精通");
	text = text.replace("Cleaver Mastery", " 砍刀精通");
	text = text.replace("Dagger Mastery", " 匕首精通");
	text = text.replace("Sword Mastery", " 剑精通");
	text = text.replace("One Handed Sword Mastery", " 单手剑精通");
	text = text.replace("Spear Mastery", " 矛精通");
	text = text.replace("Polearm Mastery", " 长柄精通");
	text = text.replace("Hammer Mastery", " 锤精通");
	text = text.replace("Mace Mastery", " 棍棒精通");
	text = text.replace("Flail Mastery", " 链枷精通");
	text = text.replace("Poison Mastery", " 毒药精通");
	text = text.replace("Cascade strikes", "倾泻打击");
	text = text.replace("Evasion", "回避");
	text = text.replace("Rust", "腐锈");
	text = text.replace("Wither", "枯萎");
	text = text.replace("Hex", "巫术");
	text = text.replace("Miasma", "瘴气");
	text = text.replace("Darkflight", "黑暗飞行");
	text = text.replace("Daze", "茫然");
	text = text.replace("Stun", "眩晕");
	text = text.replace("Horrify", "惊骇");
	text = text.replace("Revolt", "恶臭攻击");
	text = text.replace("Entice", "引诱");
	text = text.replace("Sleep", "催眠");
	text = text.replace("Fire Pot", "火焰弹");
	text = text.replace("Possess Undead", "支配亡灵");
	text = text.replace("Bandage Mastery", "绷带精通");
	text = text.replace("Hold the line", "维持阵线");
	text = text.replace("Coordinated Volleys", "协同射击");
	text = text.replace("Raise the Dead", "复活死尸");
	text = text.replace("Push Forward", "向前推进");
	text = text.replace("Insect Swarm", "虫群");
	text = text.replace("Chain Lightning", "闪电链");
	text = text.replace("Composure", "沉着");
	text = text.replace("Nightvision", "夜视术");
	text = text.replace("Staff Mastery", "法杖精通");
	text = text.replace("Relax", "放松");
	text = text.replace("Gruesome Feast", " 阴森悚宴");
	text = text.replace("Nudist", "裸体主义者");
	text = text.replace("Muscularity", "肌肉发达");
	text = text.replace("Battleheart", "战斗之心");
	text = text.replace("True Believer", "真正的信仰者");
	text = text.replace("Poison Immunity", "毒素免疫");
	text = text.replace("Summon Familiar", "召唤仆人");
	text = text.replace("Mold Carrion", "腐肉塑模");
	text = text.replace("Fashion Body", "塑造身体");
	text = text.replace("Remake Man", "重塑人体");
	text = text.replace("Arrange Bones", "糅合尸骨");
	text = text.replace("Align Joints", "排列关节");
	text = text.replace("Rebuild Skeleton", "重造骨架");
	text = text.replace("Extended Aura", " 扩展光环");
	text = text.replace("Channeled Power", " 通灵能量");
	text = text.replace("Reclamation", " 再利用");
	text = text.replace("Conservation", " 保育");
	text = text.replace("Enthrall", " 魅惑");
	text = text.replace("Violent Decomposition", " 剧烈腐败");
	text = text.replace("Possession", " 占据");
	text = text.replace("Siphon", " 虹吸");
	text = text.replace("Inscription Mastery", " 符文精通");
	text = text.replace("Rune Sigils: Weapons", " 符文印记: 武器");
	text = text.replace("Rune Sigils: Helmets", " 符文印记: 头盔");
	text = text.replace("Rune Sigils: Armors", " 符文印记: 护甲");
	text = text.replace("Rune Sigils: Shields", " 符文印记: 盾牌");
	text = text.replace("Chanting Mastery", " 吟咏专精");
	text = text.replace("Disharmony (Chant)", " 乖离(吟咏)");
	text = text.replace("Fury (Chant)", " 狂怒(吟咏)");
	text = text.replace("Heightened Senses (Chant)", " 激化感官(吟咏)");
	text = text.replace("Trance Mastery", " 通灵精通");
	text = text.replace("Incorporeal Perspective (Trance)", " 灵视(通灵)");
	text = text.replace("Malevolent Spirits (Trance)", " 恶毒怨灵(通灵)");
	text = text.replace("Warden", " 守望者");
	text = text.replace("Spiritual Bond", " 精神纽带");
	text = text.replace("Threads of Fate", " 命运线");
	text = text.replace("Premonition", " 预感");
	text = text.replace("Anatomical Studies", " 解剖学研究");
	text = text.replace("Guide Steps", " 指引道路");
	text = text.replace("Harvest Swathes", "长条收割");
	text = text.replace("Slicing Arcs", "弧形切割");
	text = text.replace("Assured Conquest", " 必然征服");
	text = text.replace("Taste the Pain", " 品尝痛苦");
	text = text.replace("Become Berserker", " 变身狂战士");
	text = text.replace("Skillful Stacking", " 熟练整理");
	text = text.replace("Efficient Packing", " 高效整理");
	text = text.replace("Ammunition Binding", " 装订弹药");
	text = text.replace("Ammunition Bundles", " 弹药打包");
	text = text.replace("Medicine Packages", " 药品包装");
	text = text.replace("Medicine Ingredients", " 药性鉴别");
	text = text.replace("Tools Drawers", " 工具抽屉");
	text = text.replace("Spare Parts", " 备用零件");
	text = text.replace("Convincing Proposals", " 令人信服的建议");
	text = text.replace("Trustworthy Demeanour", " 值得信赖的举止");
	text = text.replace("Bribe", " 贿赂");
	text = text.replace("Butchers Strikes", " 屠宰打击");
	text = text.replace("Butchers Fillet", " 屠宰切片");
	text = text.replace("Blacksmiths Heavy Hammer", " 铁匠重锤");
	text = text.replace("Blacksmiths Technique", " 铁匠技术");
	text = text.replace("Knife fighting", " 白刃战");
	text = text.replace("Prisoners rush", " 囚徒冲击");
	text = text.replace("Lute Solo", " 鲁特琴独奏");
	text = text.replace("Entrancing Song", " 迷人乐章");
	text = text.replace("Militia training", " 民兵训练");
	text = text.replace("Militia practice", " 民兵实训");
	text = text.replace("Miners Strikes", " 矿工打击");
	text = text.replace("Ore hunter", " 矿石猎人");
	text = text.replace("Stable Shoveler", " 稳定挖掘");
	text = text.replace("Hay Bailing", " 干草叉击");
	text = text.replace("Small Game", " 小把戏");
	text = text.replace("Poachers Arm", " 偷猎者武装");
	text = text.replace("Dig deep", " 深入挖掘");
	text = text.replace("Gravesman", " 掘墓人");
	text = text.replace("Timber!", " 树倒啦！");
	text = text.replace("Woodsman\'s Cuts", " 伐木劈砍");
	text = text.replace("Gatherer\'s cuts", " 采集切割");
	text = text.replace("Harvest twist", " 收割扭击");
	text = text.replace("Heavy rocks", " 重型投石");
	text = text.replace("Slinger\'s spins", " 投石器回旋");
	text = text.replace("Big Game Hunter", " 王牌猎人");
	text = text.replace("Second Wind", " 复苏之风");
	text = text.replace("Mark Target", " 标记目标");
	text = text.replace("Field Triage", " 紧急验伤");
	text = text.replace("Field Repairs", " 战地维修");
	text = text.replace("Danger Pay", " 风险津贴");
	text = text.replace("Harvest Twist", "收割扭击");
	text = text.replace("Gatherer\'s Cuts", " 采集切割");

	
	
	text = text.replace("Prepare For Anything", " 准备万全");
	text = text.replace("Brink of Death", " 生死一线");
	text = text.replace("Strict Sermons", " 严厉布道");
	text = text.replace("InfectiousRage", " 愤怒效应");
	text = text.replace("Teacher", " 老师");
	text = text.replace("Resurrectionist", " 盗尸者");
	text = text.replace("Scry", " 占卜");
	text = text.replace("Piercing Shot", " 穿透射击");
	text = text.replace("Levitate", " 漂浮术");
	text = text.replace("Teleport", " 传送术");
	text = text.replace("Born with a board", " 天生盾卫");
	text = text.replace("Push it", " 猛推");
	text = text.replace("Net Mastery", " 投网精通");
	text = text.replace("Harvest swathes", " 大片收割");
	text = text.replace("Slicing arcs", " 弧形切割");
	text = text.replace("Sling Mastery", " 弹弓精通");
	text = text.replace("Flesh mortification", " 受难血肉");
	text = text.replace("Scourging", " 鞭打");
	text = text.replace("Two Handed Sword Mastery", " 双手剑精通");
	text = text.replace("Forceful Swing", " 大力挥击");
	text = text.replace("Spearwaller", " 矛阵");
	text = text.replace("Thrust Master", " 刺击精通");
	text = text.replace("Balance", " 平衡");
	text = text.replace("Matching Set", " 组合配对");
	text = text.replace("Lithe", " 柔韧");
	text = text.replace("Camouflage", " 伪装");
	text = text.replace("Blend in", " 隐匿");
	text = text.replace("Staff Spins", " 法杖回旋");
	text = text.replace("Staff Block", " 法杖格挡");
	text = text.replace("War Chant", " 战争之鼓");
	text = text.replace("Unarmed Mastery", " 徒手精通");
	text = text.replace("Kicking", " 踢腿");
	text = text.replace("Grappling", " 擒抱");
	text = text.replace("Field Treats", " 应急处理");
	text = text.replace("Smashing Shields", " 粉碎盾牌");
	text = text.replace("Smackdown", " 击倒");
	text = text.replace("Clarity", " 清晰");
	text = text.replace("Alert", " 警戒");
	text = text.replace("Bloodbath", " 血浴");
	text = text.replace("Terrifying Visage", " 可怖面容");
	text = text.replace("Freedom of Movement", " 行动自如");
	text = text.replace("Onslaught", " 猛攻");
	text = text.replace("Back to Basics", " 重整旗鼓");
	text = text.replace("Push The Advantage", " 乘胜追击");
	text = text.replace("Mind over Body", " 精神御体");
	text = text.replace("Escape Artist", " 逃脱大师");
	text = text.replace("Gatherer", " 采集者");
	text = text.replace("Potion Brewer", " 药水酿造");
	text = text.replace("Dedication", " 英勇献身");
	text = text.replace("Penance", " 忏悔");
	text = text.replace("Exsanguination", " 放血");
	text = text.replace("Evisceration", " 切除");
	text = text.replace("Slaughter", " 尽情杀戮");
	text = text.replace("Untouchable", " 不可触及");
	text = text.replace("Assassinate", " 暗杀");
	text = text.replace("Meal Preparation", " 膳食烹饪");
	text = text.replace("Alcohol Brewing", " 酒精酿造");
	text = text.replace("Mounted Charge", " 骑术冲锋");
	text = text.replace("Pirouette", " 回转");
	text = text.replace("Bitting", " 衔铁");
	text = text.replace("Desensitization", " 脱敏疗法");
	text = text.replace("Hippology", " 养马学");
	text = text.replace("Impulsion", " 冲动");
	text = text.replace("Lead Change", " 换步");
	text = text.replace("Leg Control", " 腿部控制");
	text = text.replace("Liberty", " 解放");
	text = text.replace("Longeing", " 耐力训练");
	text = text.replace("Parthian Shot", " 帕提亚战术");
	text = text.replace("Piaffe", " 原地快步");
	text = text.replace("Tempi Change", " 改变节奏");
	text = text.replace("Collection", " 收缩");
	text = text.replace("Flying Change", " 空中换步");
	text = text.replace("Passage", " 正步");
	text = text.replace("Song of Life", " 生命之歌");
	text = text.replace("Lacerate", " 割裂");
	text = text.replace("Peaceable", " 平和");
	text = text.replace("Summon Hound", " 召唤猎犬");
	text = text.replace("Summon Wolf", " 召唤狼");
	text = text.replace("Summon Falcon", " 召唤猎鹰");
	text = text.replace("Bear Taming", " 驯熊");
	text = text.replace("Summon Catapult", " 召唤投石机");
	text = text.replace("Net Repair", " 维修投网");
	text = text.replace("Net Casting", " 编织投网");
	text = text.replace("Pacifist", " 和平主义者");
	text = text.replace("Magic Missile Focus", " 奥术集中");
	text = text.replace("Magic Missile Mastery", " 奥术飞弹精通");
	text = text.replace("Magic Missile", " 奥术飞弹");
	text = text.replace("Horse Movement", " 马术");
	text = text.replace("Camp Cooking", " 野营烹饪");
	text = text.replace("Pack Leader", " 族群领袖");
	text = text.replace("Dog Whisperer", " 狗语者");
	text = text.replace("Dog Breeder", " 繁育猎犬");
	text = text.replace("Dog Handling", " 管理猎犬");
	text = text.replace("Dog Master", " 训犬大师");
	text = text.replace("Heightened Reflexes", " 高速反射");
	text = text.replace("Wind Reader", " 阅风者");
	text = text.replace("Choke", " 窒息");
	text = text.replace("Paymaster", " 财务官");
	text = text.replace("Quartermaster", " 军需官");
	text = text.replace("Greed", " 贪婪");
	text = text.replace("Prayer of Hope", " 希望祷文");
	text = text.replace("Prayer of Faith", " 信仰祷文");
	text = text.replace("Holy Flame", " 神圣烈焰");
	text = text.replace("Shields Up!", " 起盾！");
	text = text.replace("Incoming!", " 他们射过来了！");
	text = text.replace("Zombie bite", " 僵尸啃咬");
	text = text.replace("Cheer On", " 鼓舞");
	text = text.replace("Leap", " 跳跃");
	text = text.replace("Tumble", " 翻滚");
	text = text.replace("Hair Splitter", " 碎颅者");
	text = text.replace("Bear Form", " 巨熊形态");
	text = text.replace("Roots", " 根须");
	text = text.replace("Wolf Form", " 迅狼形态");
	text = text.replace("True Form", " 本我形态");
	text = text.replace("Summon Storm", " 呼唤风暴");
	text = text.replace("Call Lightning", " 召唤雷电");
	text = text.replace("Scry Area (Trance)", " 恐惧力场 (通灵)");
	text = text.replace("Read Omens (Trance)", " 解读先兆 (通灵)");
	text = text.replace("Distant Visions", " 视界术");
	text = text.replace("Interpretation", " 卷轴鉴定");
	text = text.replace("Scholar", " 学者");
	text = text.replace("Citrinitas (Trance)", " 黄化 (通灵)");
	text = text.replace("Albedo", " 白化");
	text = text.replace("Nigredo", " 黑化");
	text = text.replace("Herbcraft", " 草药制作");
	text = text.replace("Woodworking", " 木工手艺");
	text = text.replace("Surpress Urges", " 压制冲动");
	text = text.replace("Control Instincts", " 控制本能");
	text = text.replace("Master Anger", " 掌控愤怒");
	text = text.replace("Burning Hands", " 燃烧之拳");
	text = text.replace("Chain Lightning", " 闪电链");
	text = text.replace("Circle of Protection", " 防护之环");
	text = text.replace("Daze", " 茫然");
	text = text.replace("Hailstone", " 冰雹");
	text = text.replace("Healing Wind", " 治愈之风");
	text = text.replace("Imbue", " 注魔");
	text = text.replace("Levitate", " 浮空术");
	text = text.replace("Psybeam", " 心灵冲击波");
	text = text.replace("Sleep", " 催眠");
	text = text.replace("Soothing Wind", " 抚慰之风");
	text = text.replace("Teleport", " 传送术");
	text = text.replace("Web Bolt", " 蛛网弹");
	text = text.replace("Intense Flames", " 不羁烈焰");
	text = text.replace("Polarized", " 偏振闪电");
	text = text.replace("Dense Ice", " 特大冰雹");
	text = text.replace("Unarmed Training", " 格斗训练");
	text = text.replace("Unarmed Lunge", " 徒手猛冲");
	text = text.replace("Throw Sand", " 掷沙");
	text = text.replace(/Magical Study (.*?)/, "魔法学习 $1");
	text = text.replace("Melee Attack", "近战攻击");
	text = text.replace("Ranged Attack", "远程攻击");
	text = text.replace("Cutting Damage", "劈砍伤害");
	text = text.replace("No Injuries Damage", "无损伤伤害");
	text = text.replace("Blunt Damage", "钝器伤害");
	text = text.replace("Cutting Damage", "劈砍伤害");
	text = text.replace("Piercing Damage", "穿刺伤害");
	text = text.replace("Blunt Damage", "钝器伤害");
	text = text.replace("Piercing Damage", "穿刺伤害");
	text = text.replace("Passive", "被动");
	text = text.replace("Active", "主动");
// END


	return text;
}

var TranslateCharacterScreenPerksModule1 = function(text)
{
//骑马MOD
	text = text.replace("You can\'t ride any pet while fighting as dual-wield style.", "在骑乘时，不能以双持方式战斗。");
	text = text.replace("While Riding any pet,", "当你骑乘任何宠物时，");
	text = text.replace("you can get 3 more additional Action point,", "你可以获得3个额外的行动点，");
	text = text.replace("however you need 1 more action point to use any skill.", "但是你需要1个额外的行动点才能使用任何技能。");
	text = text.replace("Also, Mounted character is immune to grab or knock back.", "此外，骑乘角色不会被抓或击退");
	text = text.replace("Rotation or barbarian can't be used with mounted character", "换位或野蛮人不能影响骑乘角色");
	text = text.replace("Hold weapons in both hands and fight against the enemy. You can\'t fight as dual-wield style while riding any pet.", "双手拿着武器与敌人作战。在骑乘时，不能以双持方式战斗。");
	text = text.replace("When you attack the enemy, there is Chance to attack the enemy once again with other hand\’s weapon.", "当你攻击敌人时，有机会用另一只手的武器再次攻击敌人。");
	text = text.replace("When you attack the enemy,", "当你攻击敌人时，");
//	text = text.replace("there is Chance to attack the enemy once again with other hand的 weapon.", "有机会用另一只手的武器再次攻击敌人。");
	text = text.replace("there is Chance to attack the enemy once again with other hand\'s weapon.", "有机会用另一只手的武器再次攻击敌人。");
	text = text.replace("Offhand Attack power", "副手攻击力");
	text = text.replace("Now you can equip the onehanded Weapon in the offhand. Click right mouse the weapon in the stash or brother\'s bag slot with pressing Shift button.", "现在副手可以装备单手武器。按Shift键，然后用鼠标右键单击仓库或队友包裹中的武器(仓库快捷键与战利品管理MOD冲突，可把装备放在人物包裹里再装备)。");
	text = text.replace("Only sword, dagger, cleaver, axe, mace and hammer can be equipped as offhand weapon.", "只有剑、匕首、砍刀、斧头、棍棒和锤子可以作为副手武器装备。");
	text = text.replace("Also, you can use only basic skill as offhand weapon.", "此外，你只能使用副手武器的基本技能。");
	text = text.replace(/Duelist perk works but effect is (.*?) instead of(.*?)\./, "决斗者特技有效，但效果是$1，而不是$2。");
	text = text.replace("Mainhand Attack probability", "主手攻击概率");
	text = text.replace(/There is (.*?) to attack the enemy 1 more time when you use offhand basic skill\./, "当使用副手武器的基本技能时，有$1的几率主手再攻击敌人1次。");
	text = text.replace("Offhand Attack probability", "副手攻击概率");
	text = text.replace(/There is (.*?) to attack the enemy 1 more time when you use Mainhand basic skill\./, "当使用主手武器的基本技能时，有$1的几率副手再攻击敌人1次。");
//	text = text.replace("Advanced Riding", "高级骑术");
	text = text.replace(/Now this character is veteran rider. When mounted, (.*?) of base melee defense of rider will be added\. Ranged defense is same too\./, "现在这个角色是熟练骑兵了。骑乘时，骑手将增加$1的基础近程和远程的防御。");
//	text = text.replace("Riding", "骑术");
	text = text.replace("Let\'s be a mounted soldier! You need this skill to ride the horse.", "成为一名骑兵吧！骑马需要这种技巧。");
	text = text.replace("Additionaly, you can get 20 Initiative bonus when mounted. Also, breakthrough chnace will be increased.", "另外，骑乘时可以增加20主动值、冲破几率也将增加。");
	text = text.replace("At last, it reduces the probability of falling from the mount.", "最后，降低从坐骑上坠落的概率。");
//	text = text.replace("Dual Wield", "双持武器");
	text = text.replace("It allows you to put weapons on both hands.", "可以让你双手都装备武器。");
//	text = text.replace("Swift Attack", "迅捷攻击");
	text = text.replace("Let\'s attack the enemy quickly. The higher the initiative, the higher the probability of additional attacks.", "可以快速攻击敌人。主动值越高，发动额外攻击的概率越高。");
	text = text.replace("Max Bonus is with 150 initiative", "150主动值时几率最高");
//	text = text.replace("Strong Grip", "强力握持");
	text = text.replace("With strong grip left-handed attack will be more effectively.", "用强力握紧的左手武器进攻时会更大的几率发动额外攻击");
//	text = text.replace("Horseback Archery", "骑射");
	text = text.replace("No more ranged attack penalty exists when mounted.", "骑乘时不再有远程攻击惩罚。");
//	text = text.replace("Charge Training", "冲锋训练");
	text = text.replace("Charge damage and Knockback chance will be increased when you use horse charge skill. ALso you can get 20 Initiative bonus when mounted.", "当你使用骑乘冲锋技能时，冲锋伤害和击退几率会增加。此外，骑乘时获得20点主动值加成。");
	text = text.replace("Charge damage 和 Knockback chance will be increased when you use horse charge skill. ALso you can get 20 主动值 bonus when mounted.", "当你使用骑乘冲锋技能时，冲锋伤害和击退几率会增加。此外，骑乘时获得20点主动值加成。");
	text = text.replace("Charge damage 和 Knockback chance will be increased when you use horse charge skill.", "当你使用骑乘冲锋技能时，冲锋伤害和击退几率会增加。");
	text = text.replace("ALso you can get 20 主动值 bonus when mounted.", "此外，骑乘时获得20点主动值加成。");
//	text = text.replace("Deadly Charge", "致命冲锋");
	text = text.replace("Charge and terrorize the enemy! Horse charge has a chance to checkmorale for target and adjacent enemies to the target.", "冲锋恐吓敌人！骑乘冲锋时有机会检查目标和目标附近敌人的士气。");
	text = text.replace("Charge 和 terrorize the enemy! Horse charge has a chance to checkmorale for target and adjacent enemies to the target.", "冲锋恐吓敌人！骑乘冲锋时有机会检查目标和目标附近敌人的士气。");
//	text = text.replace("Charge 和 terrorize the enemy!", "冲锋恐吓敌人！");
//	text = text.replace("Horse charge has a chance to checkmorale for target and adjacent enemies to the target.", "骑乘冲锋时有机会检查目标和目标附近敌人的士气。");
	text = text.replace(/Also, there is (.*?) chance to stuen the enemy\. At last, there is (.*?) initiative bonus when mounted and small damage bonus for horse charge\./, "此外，有$1的几率击溃敌人。最后，骑乘时获得$2点主动值加成，骑乘冲锋时有小的伤害加成。");
//SS
//	text = text.replace(/Damage against targets who have sustained any injury effects, like a broken arm is increased by (.*?). Additionally, against targets who are stunned, netted, sleeping or debilitated, damage is increased by (.*?). Both bonuses stack./, "aaaa");
	text = text.replace(/Gain (.*?) melee skill and (.*?) armor penetration while using a Knife or Shiv\. (.*?) of this skill applies to other daggers\./, "使用短刀或毒刃时获得$1近战技能和$2护甲穿透。此技能的$3适用于其他匕首。");
	text = text.replace(/Gain (.*?) damage while using a Knife or Shiv\. (.*?) of this skill applies to other daggers\./, "使用短刀或毒刃时获得$1伤害。此技能中的$2适用于其他匕首。");

	text = text.replace(/This perk has been tweaked/, "此特技已被优化");
	

	text = text.replace("From rags to riches! This character has truly come a long way. Who was once a dreg of society is now a full-fledged mercenary.", "屌丝逆袭！这个角色真的走过很长的路。他曾经是社会的渣滓，现在是一个合格的雇佣军。");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	
	//传奇
	text = text.replace("Levitate a person above the ground, making movement across any terrain cost 1 AP and 2 Fatigue per tile.", "将一个人悬浮在地面上，在任何地形上移动都需要1点AP和2点疲劳。");
	text = text.replace(/Begin each battle with your shieldwall activated and gain (.*?) Ranged Defense while using a shield\./, "每次战斗开始时，盾墙被激活，并在使用盾牌时获得$1远程防御。");
	text = text.replace(/Only in suffering can we know truth. Gain (.*?) of your missing health as resolve, while wearing cultist robes, barbarian hide, bone armour or warlock robes\. Adds (.*?) maximum damage for every hostile entity adjacent to you\./, "只有在痛苦中我们才能知道真相。穿着祭仪长袍、野蛮兽皮、骨甲或术士长袍，获得 $1 失去的生命值作为决心。周围每个敌人增加 $2 最大伤害。");
	text = text.replace(/Also unlocks a crafting recipe to make cultist robes\./, "解锁制作信徒长袍的工艺配方");
	text = text.replace("Time spent assessing an enemy, finding the arteries, will pay off in blood shed on the field. Grants the active skill Prepare to Bleed that primes your next strike to inflict intense but short lived bleeding.", "花在评估敌人、寻找动脉上的时间将在战场上流血中获得回报。授予主动技能‘准备流血’，使你的下一次攻击开始，造成剧烈但短暂的流血。");
	text = text.replace("Long slow deep rending scratches can leave many bleeding grazes. Grants the active skill Prepare to Graze that primes your next strike to inflict weak but long lasting bleeding.", "长时间缓慢的深撕裂划痕可能会留下许多出血性擦伤。授予主动技能‘准备擦伤’，为你的下一次攻击打下基础，造成微弱但持久的流血。");
	text = text.replace(/In Pain we find the truth of ourselves\. We have no identity beyond servitude, our glory is agony\. While your face is obscured by a cultist hood, gain (.*?) of your base resolve as a bonus to melee and ranged defense\. Also works with cultist leather hood, leather helmet, sack, decayed sack helm, warlock hood or mask of davkul\./, "在痛苦中，我们发现了自己的真相。除了奴役，我们没有身份，我们的荣耀是痛苦。当你的脸被信徒头巾遮住时，获得$1基础决心作为近战和远程防御的加成。也适用于信徒皮革头盔、皮革头盔、麻袋头罩、腐烂的麻袋头罩、术士帽或达库尔面具。");
	text = text.replace(/Also unlocks a crafting recipe to make cultist hoods and sacks\./, "解锁了制作信徒头巾和麻袋头套的工艺配方。");
	text = text.replace(/Practice in the arts of punishment grants greater accuracy with the unwieldy weapon\.  Grants (.*?) of your resolve as melee skill while using the cat o nine tails\. (.*?) of this perk applies to other whips, chains and flails \- including named varients, except the three headed flail and berserker chain\./, "在惩罚的艺术实践中，使用笨重的武器可以获得更高的准确性。在使用九尾鞭时，将你$1的决心作为近战技能。这项加成的$2适用于其他鞭子、锁链和链枷 —— 包括著名类型，除了三头链枷和狂战士锁链。");
	text = text.replace(/Use your strength of will to turn the tips of the cattail to inflict horrible injuries\. While wielding a cat of nine tails this skill increases damage by (.*?) of your resolve\. (.*?) of this perk applies to other whips, chains and flails \- including named varients, except the three-headed flail and berserker chain\./, "用你的意志力舞动鞭尖，造成可怕的伤害。当你挥舞九尾鞭时，这项技能增加决心$1的伤害。这项加成的$2适用于其他鞭子、锁链和链枷 —— 包括著名类型，除了三头链枷和狂战士锁链。");
	text = text.replace(/Knowledge of the properties of various roots and herbs lets you construct medicines from base ingredients\. Allows the creation of medicine, antidotes and poisons in the crafting tent./, "了解各种根和草药的特性可以让你从基本成分中生产药物。允许在工艺帐篷中制造药品、解毒剂和毒药。");
	text = text.replace(/This character spends a lot of time alone outside camp, staring into the distance and smoking strange bark\. Allows the user to have distant visions of towns.  Each morning this character is in reserves grants you insight into a specific town\'s current events and buildings\./, "这个角色花了很多时间独自呆在营地外，凝视着远方，吸食着奇怪的树皮。允许用户对城镇有遥远的视野。每天早上，这个角色都会让你深入了解一个特定城镇的时事和建筑。");
	text = text.replace(/You have trained in avoiding arrows, this skill translates well into dodging blades\. Gain your base Ranged Defence as Initiative, with a minimum bonus of 3\./, "你受过躲避箭的训练，这项技能可以很好地转化为躲避刀锋。你的基础远程防御作为主动加成，最低加成3。");
	text = text.replace(/Though extensive roundpenning training, the mount gains trust in the movements of the rider. This increases resolve in battle by (.*?) of the rider\'s resolve and Movement while riding costs (.*?) less fatigue/, "进行了大量的训练，骑手终于获得了这匹马的信任。战斗中骑手增加$1的决心，骑行时移动减少$2的疲劳");
	text = text.replace(/Though extensive roundpenning training, the horse gains trust in the movements of the rider. This increases resolve in battle by (.*?) of the rider\'s resolve/, "进行了大量的训练，骑手终于获得了这匹马的信任。战斗中骑手增加$1的决心");
	text = text.replace(/Knowing what blows you can ignore allows you to focus on the deadly ones./, "知道什么样的打击你可以忽略，让你可以专注于致命的打击。");
	text = text.replace(/Gain (.*?) of the combined fatigue modifier from body, head, main hand and off hand as Melee Defense./, "身体、头部、主手和副手疲劳总和的$1作为近战防御加成。");
	text = text.replace(/Train to keep your cool, under even the most challenging circumstances. Grants immunity to stun./, "即使在最具挑战性的情况下，也要训练保持冷静。免疫晕眩。");
	text = text.replace(/Lust for blood courses through your veins, each stroke rips and tears with a ferocity that intensifies as you bleed. Gain a chance to inflict bleeding with every strike, equal to your percentage of missing health\./, "对血液的欲望在你的血管中流动，每次划伤和撕裂都会随着你的流血而更加凶残，每次攻击都有机会造成流血，等同于你失去生命值的百分比。");
	text = text.replace("Lust for blood courses through your veins, each stroke rips and tears with a ferocity unmatched. Cause minor but long lasting bleeding on any target you deal direct health damage to with any weapon. This effect stacks.", "对血液的欲望在你的血管中流动，每次划伤和撕裂都会随着你的流血而更加凶残，对你使用任何武器直接造成生命伤害的任何目标造成轻微但持久的流血。此效果叠加。");

	text = text.replace(/Once an opponent is in a weakened state, it may be easier to choke them out than to fight through their armor\. Unlocks the Choke ability which becomes available with no weapons equipped\. Hit chance determined by your targets fatigue, (.*?) if they are fresh and (.*?) if they are exhausted\. If your target is dazed or parried hitchance is increased by (.*?)\.  If they are stunned or netted you gain (.*?)\. If they are grappled or sleeping you gain (.*?)\. Unarmed mastery doubles your chance to hit\. These bonuses stack up to (.*?)\./, "一旦对手处于虚弱状态，扼杀他们可能比穿透他们的盔甲更容易。解锁无需装备武器即可使用的‘扼杀’能力。命中率由你的目标疲劳度决定，如果目标是生龙活虎的，命中率为 $1，如果目标是精疲力尽的，命中率为 $2。如果你的目标茫然或招架，命中率增加 $3。如果他们被击昏或被网，你将获得 $4 命中几率。如果他们被缠斗或催眠，你将获得 $5 命中几率。‘徒手精通’使你命中几率加倍。这些加成合起来可高达 $6。");
	text = text.replace(/Unlocks the \'Unarmed Lunge\' skill that lets you move a tile and attack in a single action while unarmed\./, "解锁‘徒手猛冲’技能，让你在徒手状态下移动一格并攻击目标一次。在没有‘格斗训练’的情况下造成 $1 点伤害。在有‘格斗训练’情况，会根据你的主动值和生命值造成伤害。如果你有‘徒手精通’，那么耗费的疲劳和行动点会更少。如果你有‘翻滚’，行动点会减少。");
	text = text.replace(/Does (.*?) damage without Unarmed Training\. With Unarmed Training it does damage based on your Initiative and Hitpoints\. Costs less fatigue and Action points if you have Unarmed Mastery\. Costs less Action Points if you have Tumble\./, "在没有‘格斗训练’的情况下造成 $1 点伤害。在有‘格斗训练’情况，会根据你的主动值和生命值造成伤害。如果你有‘徒手精通’，那么耗费的疲劳和行动点会更少。如果你有‘翻滚’，行动点会减少。");
	text = text.replace(/Master the martial arts of unarmed combat. Reduces the AP and fatigue costs of Hand to Hand, Kick and Grapple\. Increases armor penetration and increases chance to hit for Hand to Hand, adds damage to Kick\./, "掌握徒手格斗的武术。减少肉搏、踢腿和缠斗的AP和疲劳成本。增加护甲穿透力，增加肉搏命中几率，增加踢腿伤害。");
	text = text.replace("Master the martial arts of unarmed combat. Reduces the AP costs of Hand to Hand, Kick and Grapple. Increases armor effectiveness and increases chance to hit for Hand to Hand, adds damage to Kick.", "掌握徒手格斗的武术。减少肉搏、踢腿和缠斗的AP成本。增加对抗护甲效果，增加肉搏的命中几率，增加踢的伤害。");

	text = text.replace(/Grab your opponent and manhandle them to the ground, inflicting fatigue and grappling them for two turns. Grants the \'Grapple\' ability, which can only be used with your offhand free\./, "抓住你的对手，用手将他们击倒在地，造成疲劳并与他们扭打两回合。授予“缠斗”能力，只能副手空闲时使用。");
	text = text.replace(/Put all your force into a lunging kick, pushing your opponent away and inflicting fatigue. Grants the \'Kick\' ability\. Targets will take damage if falling off an edge\.  A successful kick cancels Shieldwall, Spearwall and Riposte\./, "全力猛冲，将对手推开，造成疲劳。授予‘踢’能力。目标从高地边缘掉落时会受到伤害。一次成功的踢能解除目标盾墙、矛阵和反击效果。");
	text = text.replace(/Focusing on technique, form and stances has given you greater control over your unarmed strikes. Increases the damage of your unarmed attacks based on your hitpoints and initiative. The damage is hitpoints plus initiative divided by three./, "专注于技术、形式和姿势可以让你更好地控制徒手攻击。根据你的生命值和主动值增加徒手攻击的伤害。伤害是生命值加主动值除以三。(巨魔的徒手效果：生命值*0.05+10)");
	text = text.replace("Focusing on technique, form and stances has given you greater control over your unarmed strikes. Increases the damage of your unarmed attacks based on your hitpoints and initiative. The damage is hitpoints divided by four plus initiative divided by three.", "专注于技术、形式和姿势可以让你更好地控制徒手攻击。根据你的生命值和主动值增加徒手攻击的伤害。伤害值: 生命值/4 + 主动值/3。(巨魔的徒手效果：生命值*0.05+10)");

	text = text.replace(/Becoming invisible is impressive, but it is what you do with this power that really counts\.  Striking from the shadows allows you to bypass enemy defenses and strike for their undefended weak points. Grants (.*?) maximum and minimum damage while hidden. Grants an additional (.*?) damage to Assassin backgrounds while hidden\./, "成为隐形人令人印象深刻，但真正重要的是你如何利用这种力量。从阴影中攻击可以让你绕过敌人的防御，攻击他们的弱点。隐藏时造成$1最大和最小伤害。刺客背景隐藏时造成额外$2伤害。");
	text = text.replace(/A prayer of devotion grants strength to your allies and baffles the undead\. Adjacent allies gain (.*?) of their resolve as Melee and Ranged Defense. Adjacent undead are Baffled\. (.*?)Will hurt cultists(.*?)\./, "虔诚的祈祷会给你的盟友带来力量，也会迷惑亡灵。相邻的盟友获得$1决心作为近战和远程防御的加成。相邻的不死族都感到困惑。$2会伤害异教徒$3。");
	text = text.replace(/Invokes a holy blessing that imbues a tile with the light of the old gods\. Any of your mercenaries that enters the tile will become Sanctified, gaining immunity from injuries for two turns\. Any undead unit that enters the tile will become Consecrated, becoming affected by injuries and unable to resurrect for two turns\./, "召唤一种神圣的祝福，将古老的神之光注入地块。任何进入地砖的雇佣兵都将被神圣化，获得两回合的伤害豁免。任何进入地砖的不死单位都将被神圣化，受到伤害并在两回合内无法复活。");
	text = text.replace(/A prayer of hope and love restores wellbeing to your allies and tears at the undead\. Adjacent allies gain (.*?) of their resolve as hitpoints when used\. Inflicts a disintegrating ailment on each adjacent undead\. Does not work on cultists\./, "祈祷希望和爱能让你的盟友恢复幸福，让亡灵流泪。相邻盟友使用时获得$1决心值作为生命值。对每一个相邻的亡灵造成分裂的疾病。不适用于异教徒。");
//	text = text.replace(/The user enters a trance, telling all allies of their future\. Grants (.*?) chance to have any attacker require two successful attack rolls in order to hit\./, "用户进入通灵状态，告诉所有盟友他们的未来。给予$1几率让任何攻击者需要两次成功的攻击骰才能命中。");
	text = text.replace(/The user enters a trance, telling all allies of their future\./, "用户进入通灵状态，告诉所有盟友他们的未来。给予");
	text = text.replace(/Grants (.*?) chance to have any attacker require two successful attack rolls in order to hit/, "给予他们 $1 几率让任何攻击者需要两个成功的攻击骰子才能击中");
	text = text.replace(/Scries an area of 12 tiles around the user\. The user will be unable to move or act during the trance until cancelled. Minimum of 1 turn channel\./, "探查使用者周围画12格范围情况。在取消之前，用户将无法在通灵状态下移动或行动。至少1个回合引导。");
	text = text.replace("Use the great weight and speed of the horse to charge forward. Move up to four spaces and attack an enemy.", "利用马的巨大重量和速度向前冲。最多移动四格，攻击敌人。");
	text = text.replace("Use the great weight and speed of the mount to charge forward. Move up to four spaces and attack an enemy", "利用坐骑的巨大重量和速度向前冲。最多移动四格，攻击敌人。");
	text = text.replace(/Gain (.*?) damage while using a Sickle or Notched Blade\. Only (.*?) of this bonus melee skill applies to other swords\./, "使用镰刀或锯齿刃时获得$1伤害。只有$2的额外近战技能适用于其他剑。");
	text = text.replace(/Gain (.*?) melee skill and (.*?) armor piercing while using a Sickle or Notched Blade\. (.*?) of this skill applies to one handed swords\./, "使用镰刀或锯齿刃时获得$1近战技能和$2穿甲。$3的技能适用于单手剑。");
	text = text.replace(/Gain (.*?) melee skill while using a Butcher\'s Cleaver\. (.*?) of this skill applies to One Handed Cleavers, except whips\./, "使用屠刀时获得 $1 近战技能。$2 的技能适用于单手砍刀，鞭子除外。");
	text = text.replace(/Gain (.*?) damage while using a Butchers Cleaver\. (.*?) of this skill applies to One Handed Cleavers, except whips\./, "使用屠夫切肉刀时获得 $1 伤害。$2 的技能适用于单手砍刀，鞭子除外。");
	text = text.replace(/Gain (.*?) damage while using a Blacksmith\'s Hammer\. (.*?) of this skill applies to other One Handed Hammers\./, "使用铁匠锤时获得 $1 伤害。此技能的 $2 适用于其他单手锤。");
	text = text.replace(/Gain (.*?) melee skill and (.*?) armor damage while using a Blacksmiths Hammer\. (.*?) of this skill applies to other One Handed Hammers\./, "使用铁匠锤时获得 $1 近战技能和 $2 护甲伤害。此技能的 $3 适用于其他单手锤。");
	text = text.replace(/Gain (.*?) damage while using a militia spear, ancient spear or wooden spear\. Only (.*?) of this skill applies to other spears\./, "使用民兵矛、古代矛或木矛时获得 $1 伤害。只有 $2 技能适用于其他矛。");
	text = text.replace(/Gain (.*?) melee skill while using a militia spear, ancient spear or wooden spear\. Only (.*?) of this skill applies to other spears\./, "使用民兵矛、古代矛或木矛时获得 $1 近战技能。只有 $2 技能适用于其他矛。");
	text = text.replace(/Gain (.*?) melee skill while using a pickaxe, or (.*?) melee skill while using 2 handed hammers\./, "使用鹤嘴锄获得 $1 近战技能，或使用双手锤获得 $2 近战技能。");
	text = text.replace(/Allows this character to mine for minerals while assigned to gathering in camp\. Gain (.*?) damage while using a pickaxe, or (.*?) damage when wielding 2 handed hammers\./, "允许这个角色在营地集合时挖掘矿物。使用鹤嘴锄时获得 $1 伤害，或使用双手锤时获得 $2 伤害。");
	text = text.replace(/Gain (.*?) damage while using a Pitchfork, Wooden Pitchfork, Hoe, Scythe or Wooden Flail\. (.*?) of this perk applies to other polearms including banners\./, "使用干草叉、木质干草叉、锄头、镰刀或木质连枷时获得 $1 伤害。此特技的 $2 适用于其他长柄武器，包括战旗。");
	text = text.replace(/Gain (.*?) melee skill and (.*?) armor damage while using a Pitchfork, Wooden Pitchfork, Hoe, Scythe or Wooden Flail\. (.*?) of this perk applies to other polearms and banners\./, "使用干草叉、木质干草叉、锄头、镰刀或木质连枷时获得 $1 近战技能和 $2 护甲伤害。此特技的 $3 适用于其他长柄武器，包括战旗。");
	text = text.replace(/Allows this character to harvest wood while gathering in camp\. Gain (.*?) damage while using a Woodcutter\'s Axe or Saw\. Only (.*?) of this skill applies to other axes\./, "允许该角色在营地采集木材。使用砍柴斧或锯子时获得 $1 伤害。只有 $2 技能适用于其他斧头。");
	text = text.replace(/Gain (.*?) melee skill while using a Woodcutter\'s Axe or Saw\. Only (.*?) of this bonus melee skill applies to other axes\./, "使用砍柴斧或锯子时获得 $1 近战技能。只有 $2 的额外近战技能适用于其他斧头。");
	text = text.replace(/When using a weapon with extra Fatigue build-up on skills, such as Orc Weapons, the Fatigue cost of the weapon skills is reduced by (.*?)\./, "当使用具有额外疲劳积累技能的武器时，例如兽人武器，武器技能的疲劳成本降低 $1。");
	text = text.replace(/The ability to cut and shape wood is a craft few master\. Allows the creation of fine wood from rough wood in the crafting tent\./, "切割和雕刻木材的能力是少数几位大师的手艺。允许在手工帐篷中用粗木制作精细木材。");
	text = text.replace(/Every first attack in one turn will build up (.*?) to (.*?) fatigue, while the second attack will deal (.*?) to (.*?) damage\./, "每回合的第一次攻击将产生的疲劳 $1 到 $2，而第二次攻击将造成 $3 到 $4 的伤害。");
	text = text.replace(/The effects will not be wasted by missing with your attack\./, "效果不会因为你未命中的攻击而浪费。");
	text = text.replace(/Skills with less action cost will receive a larger bonus\. If your first attack is used for free, the second attack will additionally gain a (.*?) hitchance bonus\./, "行动点耗费较低的技能将获得更高的加成。如果你的第一次攻击是免费的，第二次攻击将额外获得 $1 命中率加成。");
//LegendsOffBookDeal
	text = text.replace(/Convince anyone into selling you their priciest possession. Even if that means paying extra\./, "说服任何人把他们最昂贵的财产卖给你。即使这意味着要支付额外的费用。");
	text = text.replace(/Reduces Barter by (.*?)/, "交易利润 $1");
	text = text.replace(/When entering a town that has no active situation, apply the \'Off-Book Deal\' situation for 3 days/, "当进入一个没有Buff状况的城镇时，新增‘私下交易’Buff状况持续3天。");
	text = text.replace(/When entering a town that has no active situation, apply the \'Off-Book Deal\' situation/, "当进入一个没有Buff状况的城镇时，新增‘私下交易’Buff状况");
	text = text.replace(/This situation grants (.*?) to available items and (.*?) to buying price for each brother with this perk/, "在这种Buff状况下，每个拥有此特技的队友可以让可购买物品 $1 但购买价格 $2");



	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	
	
	//魔法起源
//	text = text.replace(/Gain additional Minimum and Maximum Damage based on your current Hitpoints/, "基于你当前的生命值获得额外的最小和最大伤害。");
	text = text.replace(/The creepy crawlies in the depth of the forest. They would be suited to be your servants and soldiers./, "森林深处令人毛骨悚然的爬行动物。他们适合做你的仆人和士兵。");
	text = text.replace(/Allowing you to permanently charm Webknecht, and satisfy one of two conditions to permanently charm Redback Spider./, "允许你永久魅惑蜘蛛，并满足永久魅惑红背蜘蛛的两个条件之一");
	text = text.replace(/Grants (.*?)Immunity(.*?) to being rooted by nets, webs or grasping vines./, "$1免疫$2被投网、织网或藤蔓带来的定身。");
	text = text.replace(/Who wouldn\'t want to own a 5 feet tall pet dog. Nothing could be better than seeing them mauling fools dare to make an enemy of you/, "谁不想养一只5英尺高的宠物狗。没有什么比看到他们欺负那些敢于与你为敌的傻瓜更好的了");
	text = text.replace(/Allowing you to permanently charm Direwolf, Frenzy Direwolf, Hyena, Frenzy Hyena, Bear, and satisfy one of two conditions to permanently charm White Direwolf/, "允许你永久魅惑冰原狼，狂暴冰原狼，鬣狗，狂暴鬣狗，熊，并满足永久魅惑白冰原狼的两个条件之一");
	text = text.replace(/Initiative is increased by (.*?) and builds up (.*?) less fatigue for each tile travelled/, "主动增加$1，每格移动疲劳减少$2");
	text = text.replace(/Dream eater and nightmare caller, such creatures should be servants of a beauty likes you/, "食梦者和梦魇，这些生物应该是像你这样的美女的仆人");
	text = text.replace(/Allowing you to permanently charm Alp, and satisfy one of two conditions to permanently charm Demon Alp/, "允许你永久魅惑梦魇，并满足永久魅惑恶魔梦魇的两个条件之一");
	text = text.replace(/Gain (.*?) Resolve at morale checks against fear, panic or mind control effects. And a bonus of (.*?) chance to put a target to sleep/, "对抗恐惧、恐慌或精神控制效果的士气检查中获得$1决心。让催眠目标几率增加$2");
	text = text.replace(/Hungry monkeys or big fricking starving gorilla should be nice exotic pets/, "饥饿的猴子或瞪着大猩猩应该是很好的异国宠物");
	text = text.replace(/Allowing you to permanently charm Nachzehrer, and satisfy one of two conditions to permanently charm Skin Ghoul/, "允许你永久魅惑食尸鬼，并满足永久魅惑白肤食尸鬼的两个条件之一");
	text = text.replace(/Hitpoints are increased by (.*?), Initiative is increased by (.*?)/, "生命值增加$1，主动性增加$2");
	text = text.replace(/Giants that can even dwarf the tallest orc. You need such mighty creature as your bodyguard/, "巨人甚至可以让最高的兽人相形见绌。你需要像你的保镖这样强大的生物");
	text = text.replace(/Allowing you to permanently charm Unhold, Frost Unhold, Swamp Unhold, Armored Unhold, and satisfy one of two conditions to permanently charm Rock Unhold/, "允许永久魅惑巨魔、森林巨魔、沼泽巨魔、装甲巨魔，并满足永久魅惑石肤巨魔的两个条件之一");
	text = text.replace(/Max Fatigue is increased by (.*?) and Hitpoints are increased by (.*?)/, "最大疲劳增加$1，生命值增加$2");
	text = text.replace(/Living trees that are seen as guardian of the forest. Have them as your guardians should be more appropriate!/, "被视为森林守护者的树人。让他们做你的监护人应该更合适！");
	text = text.replace(/Allowing you to permanently charm Schrat, and satisfy one of two conditions to permanently charm Heartwood Schrat/, "允许你永久魅惑树人，并满足永久魅惑心木树人的两个条件之一");
	text = text.replace(/Melee Defense and Ranged Defense are increased by (.*?) points while taking (.*?) less damage/, "近战防御和远程防御增加$1，同时减少$2受到的伤害");
	text = text.replace(/Does not affect damage from mental attacks or status effects /, "不会影响精神攻击或状态影响造成的伤害");
	text = text.replace(/Giant serpent with acidic blood and towering body. Imagine having one as a cute little pet/, "有酸性血液和高耸身体的巨蛇。想象一下有一只可爱的小宠物");
	text = text.replace(/Allowing you to permanently charm Lindwurm, and satisfy one of two conditions to permanently charm Stollwurm/, "允许你永久魅惑林德虫，并满足永久魅惑斯托尔虫的两个条件之一");
	text = text.replace(/Reduces the Resolve of any opponent engaged in melee by the amount equals to (.*?) of your current Resolve/, "减少近战中任何对手的决心，减少的数量等于你当前决心的$1");
	text = text.replace(/Warriors with physical that no human can match. Such brute strength should be fight for your causes/, "拥有人类无法匹敌的身体素质的战士。这种野蛮的力量应该为你们的事业而战");
	text = text.replace(/Allowing you to permanently charm Orc Berserker, Orc Warrior, Orc Elite, and satisfy one of two conditions to permanently charm Orc Warlord and Orc Behemoth/, "允许你永久魅惑兽人狂战士、兽人战士、兽人精英，并满足永久魅惑兽人军阀和兽人大只佬的两个条件之一");
	text = text.replace(/Your Initiative is reduced only by (.*?) of your accumulated Fatigue, instead of all of it/, "你的主动只会减少累积疲劳的$1，而不是全部");
	text = text.replace(/They might be small, they might be weak but they have tons of trick up their sleeves/, "它们可能很小，也可能很弱，但它们的袖子里有很多诡计");
	text = text.replace(/Allowing you to permanently charm Goblin Overseer and Goblin Shaman/, "允许你永久魅惑哥布林督军和哥布林萨满。");
	text = text.replace(/Grants (.*?)Immunity(.*?) to being overwhelmed and Ranged Defense is increased by (.*?) points/, "$1免疫$2被压制，远程防御增加$3");
	text = text.replace(/Learn the basic of how to steal other\'s heart/, "学会如何偷别人的心");
	text = text.replace(/Do you want this pair of juicy pears?/, "你想要这对多汁的梨吗？");
	text = text.replace(/(.*?)Charm(.*?) and (.*?)Captive Charm(.*?) gain an additional (.*?) to charm a target, and also grants (.*?) barter skill, increasing sell prices, reducing buy prices and increasing pay for delivery contracts/, "$1魅惑$2和$3永久魅惑$4获得额外$5成功几率，还获得$6的易货技能，提高销售价格，降低购买价格，并增加交付合同的付款");
	text = text.replace(/Enchanted words that can wake up any sleeping snake down below./, "咒语可以唤醒心中任何一条沉睡的蛇。");
	text = text.replace(/Can you see how they stare at me\? Human are such simple creature./, "你能看到他们怎么盯着我吗？人类就是这样简单的生物。");
	text = text.replace(/(.*?)Expanding(.*?) your charm capability to affect more stronger human enemies. Knight, Sergent, Officer, Nomad Leader, Bandit Leader, Barbarian Chosen, etc/, "$1增强$2你的魅惑能力，以影响更强大的人类敌人。骑士、中士、军官、游牧首领、强盗首领、野蛮人神选者等");
	text = text.replace(/Resolve is increased by (.*?) and Max Fatigue is increased by (.*?)/, "决心增加$1，最大疲劳增加$2");
	text = text.replace(/An irresistible appearance that can only be seen as inhumanly beauty. How can such beauty exist\?/, "一种不可抗拒的外表，只能被视为非人的美。这样的美怎么可能存在？");
	text = text.replace(/Allowing you to (.*?)Charm(.*?) Swordmaster, Blade Dancer, Master Archer, Desert Stalker, Hedge Knight, Nomad Executioner, Barbarian King, Bandit Warlord/, "允许$1魅惑$2剑术大师、剑舞者、弓箭大师、沙漠跟踪者、雇佣骑士、游牧民行刑者、野蛮人国王、强盗军阀");
	text = text.replace(/Charm magic has (.*?) chance to double its duration, the bonus duration can\'t be reduced by Resilient perk/, "魅惑魔法有$1几率使其持续时间翻倍，奖励持续时间不被韧性特技缩短");
	text = text.replace(/Gain another stack of nimble when not wearing both armour and a helmet, real slut doesn\'t need cloth./, "当不穿护甲和头盔时，获得一堆敏捷，真正的荡妇不需要布料。");
	text = text.replace(/Master the art of capturing the heart of others. I know what your true fetish realy are! A foot fetish such a pervert/, "掌握捕捉他人心灵的艺术。我知道你真正的恋物癖是什么！对这样一个变态恋脚癖的人");
	text = text.replace(/(.*?)Charm(.*?) and (.*?)Captive Charm(.*?) gain an additional (.*?) to charm a target/, "$1魅惑$2和$3永久魅惑$4获得额外$5成功几率来魅惑目标");
	text = text.replace(/Allowing you to permanently charm Champion enemy and satisfy the last condition to permanently charm Legendary beasts, Orc Warlord and Orc Behemoth/, "允许你永久魅惑冠军敌人，并满足永久魅惑传奇野兽、兽人军阀和兽人大只佬的最后条件");
	text = text.replace(/The bonus stats from (.*?)Possessed(.*?) effect is increased by (.*?)\./, "来自$1支配$2效果的属性加成提升$3。");
	
//For unique beast perks
	text = text.replace(/Strong spider bite that can even puncture the toughest and sturdiest armor/, "强力的蜘蛛撕咬，甚至可以刺穿最坚硬最坚固的盔甲");
	text = text.replace(/Attack skills build up (.*?) less Fatigue, gains an additional (.*?) of any damage ignores armor and Attack Damage is increased by (.*?)/, "攻击技能产生减少$1疲劳，获得$2额外忽略护甲伤害，攻击伤害增加$3");
	text = text.replace(/Attacks have (.*?) chance to become puncturing attacks that are completely ignore armor/, "攻击有$1几率变成完全忽略护甲的刺穿攻击");
	text = text.replace(/Even more deadly venom, your poor victim would surely die faster/, "更致命的毒液，你可怜的受害者肯定会死得更快");
	text = text.replace(/Doubles the starting damage of Webknecht poison, and allows it to stacking its poison damage/, "使蜘蛛毒药的起始伤害加倍，并允许其堆叠毒药伤害");
	text = text.replace(/Doubles the damage from Redback poison and makes it more potent as the target get bitten more/, "使红背毒药的伤害加倍，并使其在目标被咬得越多时越强效");
	text = text.replace(/This spider can weave the strongest web with little effort/, "这种蜘蛛不费吹灰之力就能织出最结实的网");
	text = text.replace(/(.*?)Weave Web(.*?) builds up (.*?) less Fatigue and removes the cooldown/, "$1编织网$2产生的疲劳减少$3，并消除冷却时间");
	text = text.replace(/Web becomes tougher scaling with this spider current accumulated fatigue, the less accumulated fatigue this spider has the harder for the enemy to break free from webbed/, "蛛网变强度随着蜘蛛当前累积的疲劳变化，蜘蛛累积的疲劳越少，敌人就越难从蛛网中挣脱出来");
	text = text.replace(/Using its long body and lightning fast attack to pound at its prey/, "用它的长身体和闪电般的速度攻击猎物");
	text = text.replace(/(.*?)Serpent Bite(.*?) only costs (.*?) AP/, "$1大蛇咬$2只需要$3AP");
	text = text.replace(/With its strong muscles, any prey can easily be disable in its unbreakable constriction/, "凭借其强壮的肌肉，任何猎物都可以轻易地在其牢不可破的收缩中失去能力");
	text = text.replace(/(.*?)Drag(.*?) builds up (.*?) less Fatigue/, "$1拖曳$2产生的疲劳减少$3");
	text = text.replace(/(.*?)Drag(.*?) has its maximun targeting range increased by (.*?)/, "$1拖曳$2的最大目标射程增加$3");
	text = text.replace(/(.*?)Drag(.*?) deals up to (.*?) armor piercing damage/, "$1拖曳$2最多造成$3穿甲伤害");
	text = text.replace(/Evolving a venom gland to poison your prey. Deadly but doesn\'t persist long/, "进化出毒腺来毒害你的猎物。致命但不会持续太久");
	text = text.replace(/Attacks can inflict an additional (.*?) poison damage per turn, for 1 turn/, "攻击会造成额外的每回合$1中毒伤害，持续1回合");
	text = text.replace("What could be more terrifying than a big snake? A gigantic snake!", "还有什么比一条大蛇更可怕的呢？一条巨大的蛇！");
	text = text.replace(/(.*?)Drag(.*?) skill has (.*?) chance to ignore Grab and Knock Back immunity of certain enemies while also has a chance to (.*?)Disarm(.*?) its poor prey based on current Melee skill/, "$1拖曳$2技能有$3几率忽略某些敌人的抓取和击退免疫，同时也有基于当前近战技能的几率$4缴械$5猎物");
	text = text.replace(/Increase attack ranged of (.*?)Serpent Bite(.*?) skill by 1/, "$1大蛇咬$2的攻击范围增加1");
	text = text.replace(/Powerful jaw muscles and tough fangs that can help it to crush armor and tear flesh apart/, "强大的下巴肌肉和坚硬的牙齿可以帮助它粉碎盔甲和撕裂肌肉");
	text = text.replace(/Attack skills build up (.*?) less Fatigue, Attack Damage is increased by (.*?) points and Effectiveness vs. Armor is increased by (.*?)/, "攻击技能减少$1疲劳，攻击伤害增加$2点，对抗装甲的效果增加$3");
	text = text.replace(/Attack Damage is increased by (.*?) points and Effectiveness vs. Armor is increased by (.*?)/, "攻击伤害增加$1，对抗护甲效果增加$2");
	text = text.replace(/Using razor sharp fangs to create gruesome bleeding wounds/, "用锋利的尖牙制造可怕的流血伤口");
	text = text.replace(/Bleeding damage inflicted by bites is increased by (.*?) points/, "咬伤造成的流血伤害增加$1点");
	text = text.replace(/Thick and tough fur that can stop attacks from creating heavy injuries/, "厚而坚韧的毛发可以阻止攻击造成重伤");
	text = text.replace(/Takes (.*?) less damage to armor. Gives (.*?) points of natural armor to both head and body armors/, "护甲减少$1伤害。头甲和身甲获得$2自然护甲");
	text = text.replace(/Fast and furious attacks that leave your overwhelmed victim no where to escape or fight back/, "快速而猛烈的攻击，让你不知所措的受害者无处逃脱或反击");
	text = text.replace(/Gains an additional (.*?) of any damage ignores armor, Attack Damage and hit chance are increased by (.*?) for each stack of Overwhelm on that target/, "对该目标每叠加一次压制，额外获得$1忽略护甲伤害，攻击伤害和命中几率增加$2");
	text = text.replace(/Your puppy has rabies. That\'s not good, right? Don\'t pet it!/, "你的小狗得了狂犬病。这不好，对吧？别爱抚它！");
	text = text.replace(/Hitpoints and Resolve are increased by (.*?) points, Melee Skill is inceased by (.*?) points and Attack Damage is inceased by (.*?)/, "生命值和决心增加$1点，近战技能增加$2点，攻击伤害增加$3");
	text = text.replace(/Gives rabies to this puppy, makes it look more intimidating/, "给这只小狗带来狂犬病，让它看起来更吓人");
	text = text.replace(/Feed on the nightmare and terror of your victim to restore your own vitality/, "依靠受害者的噩梦和恐惧来恢复自己的活力");
	text = text.replace(/(.*?)Nightmare(.*?) skill builds up (.*?) less Fatigue and gains additional damage equal to another (.*?) of your current Resolve/, "$1噩梦$2技能减少$3疲劳，并获得相当于当前决心$4的额外伤害");
	text = text.replace(/Up to (.*?) of the damage dealt by (.*?)Nightmare(.*?) is restored to your Hitpoints /, "$2噩梦$3造成的最多$1伤害来恢复你的生命值");
	text = text.replace(/Mastered your ability to put your prey on a long lasting sleep/, "掌握了让猎物长时间睡眠的能力");
	text = text.replace(/(.*?) of your current Resolve is used to increase the chance to put a target to sleep/, "你当前决心$1的额外几率来让目标入睡");
	text = text.replace(/Increase the duration of sleep effect by (.*?) turn. This bonus duration is not affected by Resilient perk/, "增加睡眠效果持续时间$1回合。此加成持续时间不受‘韧性’特技影响");
	text = text.replace(/(.*?)Sleep(.*?) has a reduced Action Point cost/, "$1催眠$2降低行动点成本");
	text = text.replace(/Preys that wake up from a nightmare are easy to break/, "从噩梦中醒来的猎物很容易被打破");
	text = text.replace(/Waking up from a (.*?)Nightmare(.*?) would cause the victim to experience a mental attack/, "从$1噩梦$2中醒来会导致受害者遭受精神攻击");
	text = text.replace(/(.*?)Nightmare(.*?) skill can ignore up to (.*?) defender Resolve and has (.*?) to not wake up its poor victim/, "$1噩梦$2技能最多可以忽略防御者$3的决心，并且有$4几率不能唤醒受害者");
	text = text.replace(/After teleporting, either by being hit or using (.*?)Fade(.*?), gains (.*?) melee defense and ranged defense for 1 turn, additional stack only gives (.*?) melee defense and ranged defense/, "远程传送后，无论是被击中还是使用$1消失$2，获得$3近战防御和远程防御1回合，额外叠加提供$4近战防御和远程防御");
	text = text.replace(/What would be more terrifying than a nightmare\? A Nightmare outside of a dream\. Enemy killed by (.*?)Nightmare(.*?) skill has a chance to spawn a living Nightmare to fight for you, the chance will increase as you use (.*?)Nightmare(.*?) skill on the same target more than one\./, "还有什么比噩梦更可怕的呢？梦境之外的噩梦。被$1噩梦$2技能杀死的敌人几率产生一只梦魇来为你战斗，对同一个目标多次使用$3噩梦$4技能，产生几率会增加。");
	text = text.replace(/Unlocks the \'Mind Break\' skill \((.*?) AP and (.*?) Fatigue Cost\) , this skill can deal armor ignoring damage but has very low damage output, but it can inflicts (.*?)Mind Broken(.*?) effect which lower resolve for up to 3 turns and can be stacked/, "解锁“精神错乱”技能($1AP和$2疲劳消耗)，该技能可以对目标造成较低的忽略护甲伤害，并造成$3精神错乱$4效果，降低目标决心最多3回合，效果可以叠加");
	text = text.replace(/(.*?)Realm of Burning Nightmares(.*?) skill builds up (.*?) less fatigue, and flames from it will never hurt the user. Be careful when having more than 2 demon alps, their flames can override each other/, "$1梦魇燃烧领域$2技能产生疲劳减少$3，火焰不会自己造成伤害。当有两个以上的恶魔梦魇时要小心，它们的火焰会相互覆盖");
	text = text.replace(/Flames from (.*?)Realm of Burning Nightmares(.*?) skill deals (.*?) more damage and can cause burn injuries. But the duration of flame is (.*?)halved(.*?)/, "$1梦魇燃烧领域$2技能造成$3额外伤害，并可造成灼伤。但是火焰的持续时间减少$4一半$5");
	text = text.replace(/Apply fire damage as soon as (.*?)Realm of Burning Nightmares(.*?) skill is used and also increases fire damage by (.*?) points/, "使用$1梦魇燃烧领域$2技能后立即施加火焰伤害，同时增加$3点火焰伤害");
	text = text.replace(/Unlocks the \'Shadow Copy\' skill \((.*?) AP and (.*?) Fatigue Cost\) which let you engulf an area with nightmarish darkness, from where a copy made out of shadow would emerge and fight for you, it will keep respawning as long as the darkness still persists/, "解锁‘暗影复制’技能（$1AP和$2疲劳消耗），让一片领域笼罩在噩梦般的黑暗中，领域会出现一个暗影复制者为你战斗，只要黑暗领域存在，它就会不断重生");
	text = text.replace(/Master the art of petting head. No head can be left without being petted/, "掌握抚摸头部的艺术。没有头可以离开你的抚摸");
	text = text.replace(/(.*?)Petting(.*?) skill builds up (.*?) less Fatigue/, "$1抚摸$2技能产生的疲劳减少$3");
	text = text.replace(/(.*?)Petting(.*?) has a (.*?) chance to distract the target and increases its damage by (.*?)/, "$1抚摸$2有$3的几率使目标分神，并增加$4伤害");
	text = text.replace(/Luft has learnt how to use his two unholy fruits for certain purposes/, "洛夫特已经学会了如何使用他的两种邪恶的水果来达到特定的目的");
	text = text.replace(/Nacho can\'t resist these unholy juicy fruits?/, "纳乔无法抵抗这些邪恶多汁的水果？");
//	text = text.replace(/(.*?)Charm(.*?) and (.*?)Captive Charm(.*?) gain an additional (.*?) to charm a target, and also grants +10% barter skill, increasing sell prices, reducing buy prices and increasing pay for delivery contracts/, "$1魅惑$2和$3永久魅惑$4额外获得$5几率魅惑目标，还可以获得+10%的易货技能，提高销售价格，降低购买价格，并增加交付合同的酬金");
	text = text.replace(/Using his innocence nacho look to make more human think he\'s cute/, "利用纯真的纳乔让更多人觉得他很可爱");
	text = text.replace(/I\'ll pet them when they have lower their guard/, "当他们放松警惕时，我会抚摸他们");
//	text = text.replace(/(.*?)Expanding(.*?) your charm capability to affect more stronger human enemies. Knight, Sergent, Officer, Nomad Leader, Bandit Leader, Barbarian Chosen, etc/, "aaaa");
//	text = text.replace(/Resolve is increased by (.*?) and Max Fatigue is increased by (.*?)/, "aaaa");
	text = text.replace(/Charming ghoulish body that can make any perverted human falls in love with Luft. They like me, they love me, they let me pet them!/, "迷人的食尸鬼般的身体能让任何变态的人爱上洛夫特。他们喜欢我，他们爱我，他们让我抚摸他们！");
//	text = text.replace(/Allowing you to (.*?)Charm(.*?) Swordmaster, Blade Dancer, Master Archer, Desert Stalker, Hedge Knight, Nomad Executioner, Barbarian King, Bandit Warlord/, "aaaa");
//	text = text.replace(/Charm magic has (.*?) chance to double its duration, the bonus duration can\'t be reduced by Resilient perk/, "aaaa");
	text = text.replace(/Mastered your ghoulish abilities to accumulated less fatigue/, "精通食尸鬼能力，积累疲劳减少");
	text = text.replace(/(.*?)Frenzy(.*?), (.*?)Ghoul Claws(.*?), (.*?)Skin Ghoul Claws(.*?), (.*?)Gruesome Feast(.*?) and (.*?)Swallow Whole(.*?) build up (.*?) less Fatigue/, "$1狂暴$2，$3食尸鬼爪击$4，$5白肤食尸鬼爪击$6，$7阴森悚宴$8和$9囫囵活吞$10产生的疲劳减少$11");
	text = text.replace(/Max Fatigue is increased by (.*?)/, "最大疲劳增加$1");
	text = text.replace(/Eating corpse would make you stronger and recover from fatigue faster/, "吃尸体会让你更强壮，更快地从疲劳中恢复");
	text = text.replace(/Each time (.*?)Gruesome Feast(.*?) is used, temporarily inceases your Attack Damage by (.*?) and (.*?) Fatigue Recovery per turn for (.*?) turns/, "每次使用$1阴森悚宴$2时，每回合暂时增加$3攻击伤害和$4点疲劳恢复，持续5回合");
	text = text.replace(/Unlocks the \'Frenzy\' skill \((.*?) AP and (.*?) Fatigue Cost\) which grants (.*?) Attack Damage, (.*?) Melee Skill, (.*?) Initiative, all skills cost (.*?) less AP, able to apply additional (.*?)Overwhelmed(.*?) debuff \(even when you haven\'t learn Overwhelm perk\), (.*?) Melee Defense for 2 turns/, "解锁‘狂暴’技能($1AP和$2疲劳消耗)，该技能会造成$3攻击伤害、$4近战技能、$5主动，所有技能耗费AP降低$6，额外施加$7压制$8减益(即使你还没学压制特技)，$9近战防御2回合");
	text = text.replace(/Uwwwww owhwhwhwh! Unlocks the \'Throw Up\' skill \((.*?) AP and (.*?) Fatigue Cost\) to let your 'last meal' make its way out of your stomache. After throwing up, (.*?)Swallow Whole(.*?) skill will be put in a (.*?) turns cooldown/, "哇哦！解锁‘呕吐’技能($1AP和$2疲劳成本)，让你的‘最后一餐’摆脱胃痛。呕吐后，$3囫囵活吞$4技能将在$5回合冷却完成");
	text = text.replace(/A bigger belly means a bigger defensive bonus. Having a \'hostage\' in your belly increases your Resolve by (.*?) Resolve and reduce damage taken by (.*?)\. Does not affect damage from mental attacks or status effects/, "更大的肚子意味着更大的防御加成。腹部有‘人质’会增加$1决心，减少$2受到的伤害。不会影响精神攻击或状态影响造成的伤害");
	text = text.replace(/Unlocks the \'Hand-to-Hand Attack\' skill \((.*?) AP and (.*?) Fatigue Cost\)/, "解锁‘徒手攻击’技能($1AP和$2疲劳消耗)");
	text = text.replace(/Using more force to fling your foe away/, "用更大的力量扔掉敌人");
	text = text.replace(/(.*?)Fling Back(.*?) skill builds up (.*?) less Fatigue. Costs only (.*?) AP and also can (.*?)Daze(.*?) your foe on impact/, "$1抛回$2技能耗费疲劳减少$3。只需花费$4AP，可以使你的敌人$5晕眩$6");
	text = text.replace(/Experience and instinct let you to grow and use shield more efficient/, "经验和本能让你成长并更有效地使用盾牌");
	text = text.replace(/(.*?)Grow Shield(.*?) and (.*?)Grow Greenwood Shield(.*?) skills build up (.*?) less Fatigue. Automatically agained (.*?)Shieldwall(.*?) effect when growing a new shield/, "$1生长护盾$2和$3生长绿林盾$4技能耗费疲劳减少$5。生长一个新盾时自动激活$6盾墙$7效果");
	text = text.replace(/Life-filled broken body part can easily reborn into an intelligent Sapling/, "充满生命的身体残缺部分可以很容易地再生成一棵聪明的树苗");
	text = text.replace(/Increase chance to spawn Sapling by (.*?)/, "增加产出树苗几率$1");
	text = text.replace(/Saplings may be controlled directly by player/, "树苗可以由玩家直接控制");
	text = text.replace(/(.*?)Uproot(.*?)Shatter The Earth(.*?) skills build up (.*?) less Fatigue and their Attack Damage are increased by (.*?) points/, "$1根除$2粉碎大地$3技能疲劳耗费减少$4，攻击伤害增加$5点");
	text = text.replace(/Effectiveness vs. Armor of all attacks are increased by (.*?)/, "所有攻击护甲的效果增加$1");
	text = text.replace(/Unlocks the \'Shatter The Earth\' skill \((.*?) AP and (.*?) Fatigue Cost\) which can remove Spearwall, Shieldwall and Riposte effect of any affected target even when it fails to deal damage/, "解锁‘粉碎大地’技能($1AP和$2疲劳消耗)，该技能可以移除任何受影响目标的矛阵、盾墙和反击效果，即使没有造成伤害");
	text = text.replace(/Unlocks the \'Spit Acid Blood\' skill \((.*?) AP and (.*?) Fatigue Cost\) which is an 3 tiles ranged attack. It will cover your target and may be anyone nearby in acidic blood, creating grievous burn wounds, melting away any kind of armor/, "解锁‘喷射酸液’技能($1AP和$2疲劳消耗)，这是一个3格射程的远程攻击。会覆盖目标周围，附近任何在酸液中的人，都会造成严重的灼伤，融化任何类型的盔甲");
	text = text.replace(/Unlocks the \'Intimidate\' skill \((.*?) AP and (.*?) Fatigue Cost\) which can decrease (.*?) of Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve of any enemy within 3 tiles radius, this effect lasts for (.*?) turn and can be stacked/, "解锁“恐吓”技能($1AP和$2疲劳消耗)，3格半径范围内任何敌人都会减少$3近战技能、远程技能、近战防御、远程防御和的决心，该效果持续$4回合，可以叠加");
	text = text.replace(/(.*?)Gorge(.*?), (.*?)Tail Thresh(.*?), (.*?)Tail Sweep(.*?) and (.*?)Tail Split(.*?) skills build up (.*?) less Fatigue and their Attack Damage are increased by (.*?)/, "$1暴食$2、$3尾巴锤击$4、$5尾巴横扫$6和$7尾巴劈裂$8技能疲劳耗费减少$9，增加$10攻击伤害");
	text = text.replace(/Learn how to ride a mount to gain great mobility in battle. Can use Wolves, Wardogs and Warhounds as mount/, "学习如何骑着坐骑在战斗中获得巨大的机动性。可以使用狼、战犬和战猎犬作为坐骑");
	text = text.replace(/Learn the proper ways to use ranged weapon while riding/, "学习骑乘时使用远程武器的正确方法");
	text = text.replace(/Remove ranged damage penalty while riding, reduce the ranged skill penalty from (.*?) down to (.*?)/, "骑乘时移除远程伤害惩罚，将远程技能惩罚从$1降低到$2");
	text = text.replace(/Mastered what you are good at, giving birth to more spiders. Spawning spider builds up (.*?) less Fatigue/, "精通你擅长的东西，孵化更多的蜘蛛。孵化蜘蛛耗费疲劳减少$1");
	text = text.replace(/Has (.*?) to gain a free egg each turn/, "每回合$1几率免费获得一个卵");
	text = text.replace(/Like father like son. Spawned spider inherits most of your perks/, "有其父必有其子。孵化的蜘蛛将继承你大部分的特技");
	text = text.replace(/Spiders you spawn later have better stats than those spawn first. Better pumping spider out of that ass fast!/, "后孵化的蜘蛛比先孵化的蜘蛛有更好的属性。最好快点把蜘蛛从屁股里弄出来！");
	text = text.replace(/It sucks when you can move around. Wishing for a pairs of leg would be asking too much. Well!!! At least you can request an Uber ride from your spider friends or from your own offsprings. It\'s technically free after all and also allow you to use mount/, "当你渴望能四处走动的时候，现实很糟糕。想要一双腿就更过分了。现在情况好转了！可以向你的蜘蛛朋友或你后代申请滴滴。从技术上讲你可以搭乘它们，而且还是免费的，");
	text = text.replace(/Become the toughest of the strongest of your kind. Obtain \'Champion\' racial skill which grants you all the benefits a champion enemy can has, a tons of stats boost of course/, "成为同类中最强的那个。获得‘冠军’种族技能，该技能将为你提供冠军敌人所能获得的所有好处，当然还有大量属性提升");

//	text = text.replace(/Unlocks the \'Liner Breaker\' skill ((.*?) AP and (.*?) Fatigue Cost) which can help you break through enemy defensive line to reach those at backline/, "aaaa");
	text = text.replace(/Halve the penalty from daytime and increase Resolve by (.*?)/, "白天惩罚减半，增加$1决心");
	text = text.replace(/Become unaffected by nighttime and gain \'Nocturnal\' effect which gives (.*?) Attack Damage, (.*?) Melee Defense and (.*?) Ranged Defense/, "不受夜间影响，获得$1攻击伤害，$2近战防御和$3远程防御的‘夜行’效果");
	text = text.replace(/Most of your attacks are gamble now. Gain (.*?) Melee Skill and Ranged Skill. Attacks either deal (.*?) more damage or (.*?) less damage, (.*?) May the goddess of luck bless you!/, "你现在的大部分攻击都是赌博。获得$1近战技能和远程技能。攻击造成$2点以上或$3点以下的伤害，$4 愿幸运女神保佑你！");
	text = text.replace(/Your bite become more dangerous with sharpen teeth that can easily cause grievous bleelding. (.*?)Bite(.*?) skill deals (.*?) more damage and inflicts an additional (.*?) bleeding damage/, "你的咬伤会变得更加危险，因为锋利的牙齿很容易导致严重的出血。$1咬伤$2技能造成$3额外伤害，并造成$4额外流血伤害");
	text = text.replace(/Become hungrier then ever, (.*?)Devour(.*?) skill will always have 1 turn of cooldown instead of the randomized 1 - 2 turns of cooldown. Also heal (.*?) of Hitpoints to all tentacles/, "当你变得更加饥饿时，$1吞食$2技能将总是有1回合冷却时间，而不是随机的1-2回合冷却时间。同时对所有触手治疗$3点生命值");
	text = text.replace(/When you think being drag to a big flicking mouth is bad enough, now you are being squeeze to death before getting eaten. (.*?)Squeeze Prey(.*?) deals (.*?) more damage, this is also applied to the damage over time while being ensnared by tentacle/, "当你觉得被拖到一个大嘴巴里已经够糟糕的时候，现在你在被吃掉之前就被挤死了。$1挤压猎物$2造成$3额外伤害，这也适用于被触手诱捕时的伤害");
	text = text.replace(/With the help of natural slime, your tenticles can move better than ever. Tentacle builds up (.*?) less fatigue for each tile travelled and its (.*?)Move Tentacle(.*?) skill has its maximun range increased by (.*?)/, "在天然黏液的帮助下，你的触须可以比以往更好地移动。触手每移动一格的疲劳减少$1，$2移动触手$3技能的最大射程增加$4");
	text = text.replace(/Unlock the \'Sweep\' skill for you tentacle which can hit up to 3 targets at once/, "为你的触手解锁‘横扫’技能，可以同时击中3个目标");
	text = text.replace(/Your skin is like a rubber, deflecting attacks and harder to be cut. Decrease damage taken by (.*?) points and gain immunity to bleeding for your tentacle/, "你的皮肤就像一块橡胶，可以偏转攻击，更难切割。减少$1受到的伤害，触手获得流血免疫");

// zombie
	text = text.replace(/When life pushes you down, you gotta stand up and fight. Every battle, you can raise back to life once as long as you haven\'t lost your head. Also grants (.*?) hitpoints/, "当生活把你打倒时，你必须站起来战斗。每一场战斗，只要你没有失去理智，你就可以复活一次。还获得$1生命值");
	text = text.replace(/Act like how the zombie on movie always be! A hungry brain-eating zombie of course. (.*?)Wiederganger Bite(.*?) skill costs (.*?) less AP and restores your hitpoints up to (.*?) of your bite damage/, "表现得像电影里的僵尸一样！当然是饿脑僵尸了。$1僵尸撕咬$2技能耗费AP减少$3，并恢复最多$4咬伤伤害的生命值");
	text = text.replace(/Weeks, months or even years of not brushing your teeth creates a cheesy weapon. (.*?)Wiederganger Bite(.*?) skill can inflict a rather unpleasant poison that become worse over time/, "数周、数月甚至数年不刷牙都会成为一件不错的武器。$1僵尸撕咬$2技能可以造成讨厌的中毒效果，随着时间的推移，毒性会越来越强");
	text = text.replace(/The bonus stats from (.*?)Possessed(.*?) effect is increased by $/, "$1支配$2效果的加值增加$3");
	text = text.replace(/Become the true restless fallen hero that will never truly die. Grants (.*?) AP, (.*?) hitpoints and (.*?) Melee skill. Crushed skull, split open belly or decapitated can\'t stop you from coming back to life/, "成为真正永不休眠的堕落英雄，永远不会真正死去。获得$1AP，$2生命值和$3近战技能。颅骨粉碎、腹部裂开或斩首都不能阻止你恢复生命");

// skeleton
	text = text.replace(/Looks! I just rebuild this skeleton like playing with legos. Has a (.*?) chance to survive if struck down or even killed by a fatality/, "看！我只是像玩乐高积木一样重建骨架。如果被击倒甚至死亡，有$1几率存活");
	text = text.replace(/Drinking milk makes your bone strong, but how can i drink when i am a skeleton? Grants (.*?) hitpoints and reduces taken cutting damage by (.*?)/, "喝牛奶使你的骨骼强壮，但当我是个骷髅时，我怎么能喝呢？获得$1生命值，减少$2受到的切割伤害");
	text = text.replace(/Drinking milk makes your bone strong, but how can i drink when i am a skeleton\? Grants (.*?) hitpoints and reduces taken cutting damage by (.*?)/, "喝牛奶使你的骨骼强壮，但当我是个骷髅时，我怎么能喝呢？获得$1生命值，减少$2受到的切割伤害");

// ghost
	text = text.replace(/My touch is both fast and deadly!!! (.*?)Ghastly Touch(.*?) skill costs (.*?) less AP and has (.*?) hit chance/, "我的触摸既快又致命！！！$1阴森触摸$2技能耗费AP减少$3，命中率$4");
	text = text.replace(/Like a shapeless moving shadow, make incoming melee attacks has (.*?) chance to hit you and grant a complete immunity to all ranged attacks/, "就像一个不成形的移动阴影，使来袭的近战攻击击中你几率 $1，并免疫所有远程攻击");
	text = text.replace(/I was there seconds ago, now i was here. Upon taking damage, you will be automatically teleported to another place that is in most cases be at least 2-3 tiles away from any enemies/, "秒钟前我还在那里，现在我在这里。当你受到伤害时，你将被自动传送到另一个地方，在大多数情况下，这个地方距离任何敌人至少2-3格远");
	text = text.replace(/What do you think when you meet a ghost then seeing it passes through your body? Unlocks the \'Phase Through\' skill \((.*?) AP\) that allows you to deal damage to up to 2 targets while also moving, through said targets of course/, "当你遇到一个鬼魂，然后看到它穿过你的身体时，你会怎么想？解锁‘分段通过’($1 AP)，允许你在移动时对最多2个目标造成伤害，当然也可以通过上述目标");
	text = text.replace(/What do you think when you meet a ghost then seeing it passes through your body\? Unlocks the \'Phase Through\' skill \((.*?) AP\) that allows you to deal damage to up to 2 targets while also moving, through said targets of course\./, "当你遇到一个鬼魂，然后看到它穿过你的身体时，你会怎么想？解锁‘分段通过’($1 AP)，允许你在移动时对最多2个目标造成伤害，当然也可以通过上述目标");
	text = text.replace(/A ghost feasts on living being soul\? Now that sounds scary\. (.*?)Ghastly Touch(.*?), (.*?)Phase Through(.*?) and (.*?)Banshee Scream(.*?) skills have (.*?) to recover a life for Nine Lives perks on any killed target\./, "一个鬼魂在吃活人的灵魂？这听起来很可怕。$1阴森触摸$2、$3分段通过$4和$5女妖尖叫$6技能击杀任何目标都有$7几率恢复‘九命猫’特技中的1命。");

// mummy
	text = text.replace(/Reduce resolve of adjacent enemies by (.*?) and have (.*?) to curse the attacker upon taking damage/, "减少相邻敌人的$1决心，$2几率诅咒伤害你的攻击者");
	text = text.replace(/Have a depth knowledge about ancient weapons, letting you use them more effectively. Grants a bonus of (.*?) damage for one-hand weapons. Grants a bonus of (.*?) damage and (.*?) armor penetration for two-hand weapons. Named ancient weapons have (.*?) fatigue cost on top of the bonus damage/, "深入了解古代武器，让你更有效地使用它们。单手武器增加$1伤害。双手武器额外增加$2伤害和$3护甲穿透。著名的古代武器在额外伤害的基础上有$4疲劳消耗");
	text = text.replace(/Unlocks the \'Insects Breath\' skill \((.*?) AP\) that can only be used once per battle to put a 7 turns debuff on a target\./, "解锁‘昆虫呼吸’技能( $1 AP)，每次战斗只能使用一次的，对目标进行7回合的减益。");
//魔法
	text = text.replace(/Improve the efficiency of your magic skills by (.*?)\. Also every turn, you has (.*?) to gain (.*?) Resolve for a turn\./, "提高$1魔法技能的效果。每回合$2几率获得$3决心持续一回合。");
	text = text.replace(/Learn a random active skill corresponding to your magic art style./, "学习与你魔法风格相对应的随机主动技能");
	text = text.replace(/You have trained your mind to the best of it, this helps a lot in combat. Gain a fourth of your base Resolve as Melee and Ranged skill, with a minimum bonus of 5./, "已经把你的头脑训练到了最佳状态，这对战斗有很大帮助。获得四分之一基础决心作为近战和远程技能的加成，最低加成为5。");
	text = text.replace("Requiring to equip a magic staff", "需要装备魔法杖");
	text = text.replace(/Learn another random active skill corresponding to your magic art style./, "学习另一种与你魔法风格相对应的随机主动技能");
	text = text.replace(/Mastered your magically skill. Gain (.*?) resolve. Your magic skills build up (.*?) less Fatigue and reduce the penalty for not using magic staff from (.*?) down to (.*?), also let you gain (.*?) of the effect of 'Magical Study - 3' even when not using a magic staff./, "精通你的魔法技能。获得$1决心。魔法技能耗费疲劳减少$2，并将不使用魔法杖的惩罚从$3降低到$4，即使不使用魔法杖，也可以获得$5的‘魔法学习 - 3’效果。");

	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");

//PTR
//刀锋舞者
	text = text.replace(/Let's Dance!/, "舞动起来！");
	text = text.replace(/When using a non-fencing sword, the Action Point costs of sword skills is reduced by (.*?)\./, "使用非刺剑时，剑法技能的行动点成本减少$1。");
	text = text.replace(/Each subsequent attack in a turn builds (.*?) more Fatigue\./, "每回合的后续攻击都会增加$1的疲劳。");
	text = text.replace(/Allows \'Kata Step\' to be usable even while holding something, e\.g\. a shield, in your offhand\./, "解锁‘剑道步法’即使在你手握盾牌的时候也可以使用。");
	text = text.replace(/\'Kata Step\' costs (.*?) fewer Action Points and builds (.*?) less Fatigue, both down to a minimum of (.*?)\./, "‘剑道步法’耗费行动点减少$1，疲劳耗费减少$2，两者耗费都可以减少到$3。");
	text = text.replace(/You can only pick ONE perk from the Swordmaster perk group\./, "你只能从剑师特技组中选择一个特技。");
//Reaper
	text = text.replace(/Bring in the harvest!/, "开始收割了！");
	text = text.replace(/The Action Point costs of AOE sword skills is reduced by (.*?) and the Fatigue Cost by (.*?)\./, "剑术的范围技能行动点消耗减少$1，疲劳消耗减少$2。");
	text = text.replace(/The Action Point costs of AOE sword skills is reduced by (.*?)\./, "剑术的范围技能行动点消耗减少$1。");

	//Metzger
	text = text.replace(/A sword, too, can take someone\'s head off just fine!/, "一把剑也可以很好地砍掉某人的头！");
	text = text.replace(/Adds the \'Decapitate\' skill to southern curved swords\./, "将‘斩首’技能添加到南方弯刃剑上。");
	text = text.replace(/Grants the \'Sanguinary\' and \'Bloodbath\' perks for free as long as a southern curved sword is equipped\./, "只要装备了南方弯刀，即可免费获得‘血腥’和‘血浴’特技。");
	text = text.replace(/Attacks inflict \'Bleeding\' on the target for (.*?) damage\./, "攻击造成目标$1点‘流血’伤害。");
	text = text.replace(/Adds the Cleaver perk group to this character\'s perk tree, except the Cleaver Mastery perk\./, "将‘砍刀’特技组添加到此角色的特技树中，但‘砍刀精通’除外。");
	text = text.replace(/Adds the Cleaver perk group to this character\'s perk tree, except the perks which require a Cleaver\./, "将‘砍刀’特技组添加到此角色的特技树中，但需要砍刀的特技除外。");

	//Precise
	text = text.replace(/Let me show you how to thread a needle\.\.\. blindfolded!/, "让我教你怎么穿针。。。蒙着眼睛！");
	text = text.replace(/The bonuses of the \'Swordmaster\'s Training\' or \'Swordmaster\'s Finesse\' effect are doubled\./, "‘剑师训练’或‘剑师技巧’的效果翻倍。");
	text = text.replace(/The bonuses of the \'Swordmaster\'s Training\' or \'Swordmaster\'s Finesse\' effect is start counting from level 1\./, "‘剑师训练’或‘剑师技巧’的效果从等级1开始计算。");


	text = text.replace(/While wielding a Fencing Sword, the efficacy of the target\'s remaining armor after an attack to reduce received Hitpoints damage is halved\./, "在挥舞刺剑时，目标在受到攻击后剩余护甲的减伤效果减半。");
//Versatile Swordsman
	text = text.replace(/King of all trades\. Jack of none\./, "百业之王。无名小卒。");
	text = text.replace(/Active: Stance - Half-Swording/, "主动：姿态-半持剑术");
	text = text.replace(/Active: Stance - Reverse Grip/, "主动：姿态-反持剑术");
	text = text.replace(/Active: Stance - Meisterhau/, "主动：姿态-大师剑术");
	text = text.replace(/Unlocks (.*?) stances which can be switched to during combat\./, "解锁$1个在战斗中可以切换的姿态");
	text = text.replace(/Half-swording: While this stance is active, all the skills of the equipped sword are removed and replaced with \'Puncture\'\. Requires a two-handed sword or double-gripped one-handed sword\./, "半持剑术：当这个姿势激活时，所装备的剑技能替换为‘穿刺’技能。需要双手剑或双持单手剑。");
	text = text.replace(/Reverse-grip: While this stance is active, all the skills of the equipped sword are removed and replaced with \'Cudgel\' and \'Strike Down\' for two-handed swords and \'Bash\' and \'Knock Out\' for one-handed swords\. Requires a two-handed sword or double-gripped one-handed sword\./, "反持剑术：当这个姿势激活时，所装备的双手剑技能替换为双手剑的‘重击’和‘击倒’，以及单手剑的“猛击”和‘痛击’。需要双手剑或双持单手剑。");
	text = text.replace(/Meisterhau: This is the default stance. While this stance is active, moving from your position no longer disables the En Garde perk\./, "大师剑术：这是默认的姿势。当这个姿势激活时，从您的位置移动后不再禁用‘实战姿势’特技。");
	text = text.replace(/Meisterhau: This is the default stance. While this stance is active, hit enemies will and \'Exploitable Opening\' effect towards them\./, "大师剑术：这是默认的姿势。当这个姿势激活时，击中敌人会给对方施加‘破绽百出’效果。");


	text = text.replace(/While this stance is active, all the skills of the equipped sword are removed and replaced with \'Puncture\'\. Requires a two-handed sword or double-gripped one-handed sword\./, "半持剑术：当这个姿势激活时，所装备的剑技能替换为‘穿刺’技能。需要双手剑或双持单手剑。");
	text = text.replace(/While this stance is active, all the skills of the equipped sword are removed and replaced with \'Cudgel\' and \'Strike Down\' for two-handed swords and \'Bash\' and \'Knock Out\' for one-handed swords\. Requires a two-handed sword or double-gripped one-handed sword\./, "反持剑术：当这个姿势激活时，所装备的双手剑技能替换为双手剑的‘重击’和‘击倒’，以及单手剑的“猛击”和‘痛击’。需要双手剑或双持单手剑。");
	text = text.replace(/This is the default stance. While this stance is active, moving from your position no longer disables the En Garde perk\./, "大师剑术：这是默认的姿势。当这个姿势激活时，从您的位置移动后不再禁用‘实战姿势’特技。");
//ReturnFavor
	text = text.replace(/Melee Weapon or Unarmed(.*?)You scratch my back, I knock your skull\./, "近战武器或徒手$1\n你抓伤我的背，我就敲碎你的脑袋。");
	text = text.replace(/The effect lasts until your next turn. While it is active, any attacker who misses a melee attack against you has a (.*?) chance to be Stunned, (.*?) chance to be Dazed and (.*?) chance to be Staggered as long as they are adjacent to you or within the maximum range of your weapon\./, "你的效果会持续到下一个回合。当它处于活动状态时，任何错过对你的近战攻击的攻击者有$1的几率被昏迷，$2的几率被茫然，$3的几率被趔趄，只要他们靠近你或在你武器的最大射程内。");
	text = text.replace(/aaaa/, "aaaa");
	
	//Juggernaut
	text = text.replace(/There\'s a fine line between bravery and stupidity\./, "勇敢和愚蠢之间有一条分界线。");
	text = text.replace(/Each single-target attack with a two-handed sword additionally does (.*?) of its damage to a random enemy adjacent to the target\./, "每一次用双手剑攻击一个目标，对目标附近的随机敌人额外造成$1点伤害。");
	text = text.replace(/Charge towards a tile up to 2 tiles away, staggering all enemies adjacent to that tile and performing a free attack against a random enemy that does (.*?) increased damage \(allows you to close the gap with targets up to 3 tiles away\)\./, "冲向最多2格外的地方，趔趄地格附近的所有敌人，对随机敌人进行自由攻击，增加$1伤害(允许你与最多3格外的目标缩小距离)。");
	text = text.replace("Immediately gain the \'Indomitable\' effect that lasts until your next turn.", "立即获得持续到下一回合的“不屈”效果。");
	text = text.replace("Immediately gain the weak \'Indomitable\' effect that lasts until your next turn.", "立即获得持续到下一回合的弱‘不屈’效果。");

	text = text.replace("Become immune to being knocked back, grabbed or stunned.", "免疫击退、攫取或昏迷。");
	text = text.replace(/Reduce damage taken by (.*?)\./, "受到的伤害减少$1。");
	text = text.replace("The effects last until your next turn.", "效果持续到你的下一个回合。");
	text = text.replace("Can only be used once per turn and cannot be used when engaged in melee.", "每回合只能使用一次，在近战中不能使用。");

	//Grappler
	text = text.replace(/You have to fight for your place in this world\./, "你必须为你在这个世界上的地位而战。");
	text = text.replace(/Knocks back and staggers the target\./, "击退并趔趄目标。");
	text = text.replace(/When using a two-handed sword or double-gripping a one-handed sword, the Action Point cost is reduced by (.*?) and the Fatigue Cost by (.*?)\./, "当使用双手剑或双持单手剑时，行动点成本减少$1，疲劳成本减少$2。");
	text = text.replace(/Active: Push Through/, "主动：推进");
	text = text.replace(/Allows you to knock back and stagger a target while moving into their tile in one action\./, "在行动中移动到目标位置时可以击退并趔趄对方。");
	text = text.replace(/Active: Tackle/, "主动：阻截");
	text = text.replace(/Requires a two-handed or double-gripped one-handed sword. Allows you to exchange positions with and stagger an adjacent target\./, "需要双手剑或双持单手剑。允许您抢占目标的位置并趔趄对方。");
	text = text.replace(/aaaa/, "aaaa");
	
	text = text.replace(/Launch a shot so powerful it can hit two targets in a straight line. Does not work with throwing weapons\./, "发射一发威力强大的子弹，可以直线击中两个目标。不适用于投掷武器");
	text = text.replace(/Make use of your acrobatic skill to improve your movements\./, "利用你的杂技技巧来改进你的动作。");
	text = text.replace(/Halves the Fatigue Cost of Lunge, Unarmed Lunge, Footwork and Leap. The Action Point cost of all these skills, except Lunge, is reduced by (.*?) and that of Leap is halved\./, "将突刺、徒手猛冲、步法和跳跃的疲劳成本减半。除突刺外，所有这些技能的行动点成本降低$1,而跳跃的则减半。");
	text = text.replace(/You\'re a professional, experienced soldier, able to fight with many weapons in many styles\!/, "你是一名专业、经验丰富的士兵，能够以多种方式使用多种武器作战！");
	text = text.replace(/Grants the benefits of the Shield Expert, Weapon Master, Duelist, Reach Advantage, and Bloody Harvest perks without requiring these perks to be picked\./, "授予盾牌精通、武器大师、决斗者、双手优势和血腥收割等特技的效果，而无需选择这些特技。");
	text = text.replace(/With you by their side, your comrades feel they can conquer mountains\!/, "有你在身边，你的伙伴们觉得他们可以征服群山！");
	text = text.replace(/At the start of your turn, improve the Morale state of adjacent allies by (.*?) as long as their Morale state is lower than yours\./, "在你回合开始时，只要相邻盟友的士气状态低于你的士气状态，则将其士气状态提高 $1。");
	text = text.replace(/Your experience in battle has led to you being able to quickly adapt to an opponent\'s fighting style\!/, "你的战斗经验使你能够快速适应对手的战斗风格！");
	text = text.replace(/Did you say stop\? No, I\'m not gonna stop\!/, "你是说停吗？不，我不会停止！");
	text = text.replace(/Your appearance gives your enemies a bit of doubt\!/, "你的外表让你的敌人有点怀疑！");
	text = text.replace(/Years of hard labor have given you a stamina like none other\!/, "多年的艰苦劳动给了你前所未有的耐力！");
	text = text.replace(/Years of carrying heavy loads has given you the capability to carry the burden of your mercenary gear with ease\!/, "多年的负重训练使你能够轻松携带雇佣兵装备！");
	text = text.replace(/The penalty to Maximum Fatigue from equipped items in your head, body, mainhand and offhand slots is reduced by (.*?)\. Stacks with Brawny\./, "头部、身体、主手和副手位置装备物品的最大疲劳惩罚减少 $1。可与‘肌肉发达’效果叠加。");
	text = text.replace(/You\'ve quickly realized that your years of hard labor give you an edge in mercenary work\!/, "你很快就意识到，多年的辛勤劳动让你在雇佣兵工作中占据优势！");
	text = text.replace(/Hitpoints, Maximum Fatigue, and Initiative are increased by (.*?) each./, "生命值、最大疲劳和主动值各增加 $1。");
	text = text.replace(/You\'ve learned well that weapons are like tools, tailor-made to accomplish specific tasks. Therefore, you carry a small arsenal, ready to handle any situation\!/, "你已经很好地了解到，武器就像工具，是为完成特定任务而定制的。因此，你随身携带一个小武器库，随时准备应对任何情况！");
	text = text.replace(/Frequent use of tools with your offhand has given you an enviable level of ambidexterity\!/, "频繁地随手使用工具给你带来了令人羡慕的双灵巧度！");
	text = text.replace(/With what you\'ve survived, you might actually be able to make it through this\!/, "有了你幸存下来的东西，你可能真的能挺过去！");
	text = text.replace(/Years of living in the gutter has given you a certain disregard to being beaten down\!/, "多年生活在阴沟里让你对被殴打漠不关心！");
	text = text.replace(/The Captain said he\'d take a gamble on you, but you\'d better not disappoint\!/, "队长说他要跟你赌一把，但你最好不要失望！");
	text = text.replace(/Years of working in dark mines has given you an advantage fighting at night\!/, "多年在黑暗的矿井里工作给了你在夜间作战的优势！");
	text = text.replace(/\'Yeah, skill doesn\'t mean so much when you\'re surrounded by 10 angry townsfolk with sharp pitchforks\!\'/, "‘是的，当你被10个拿着锋利的干草叉的愤怒的市民包围时，技能并没有那么重要！’");
	text = text.replace(/Gain (.*?) Resolve for each ally on the battlefield, up to a maximum of (.*?)\./, "战场上的每个盟友为你提供 $1 决心，最多 $2。");
	text = text.replace(/Give your own armor some of that special treatment\!/, "给你自己的盔甲一些特殊的待遇！");
	text = text.replace(/Captain said take it slow and steady and I could become a legend someday\!/, "队长说慢慢来，慢慢来，总有一天我会成为一个传奇！");
	text = text.replace(/Experience Gain is increased by (.*?) for the next 5 levels, and by (.*?) after that\./, "在接下来的5个等级中，经验增益增加 $1，之后增加 $2。");
	text = text.replace(/Gain (.*?) perk points upon completing your next 5 levels after picking this perk\./, "选择此特技，升5级后可获得 $1 特技点");
	text = text.replace(/Learn to call your strikes and target gaps in your opponents\' armor\!/, "学会将你的攻击和目标盯在对手的盔甲缺口上！");
	text = text.replace(/Fighting against armor of all types has taught you to strike for the weak or damaged bits of armor for maximum penetration\!/, "对抗各种类型的盔甲教会了你如何攻击脆弱或受损的盔甲，以获得最大的穿透力！");

	text = text.replace(/Years of practice throwing things at apples above heads have granted a magnetic attraction to the cranium./, "多年来，向头顶上的苹果扔东西的练习使颅骨产生了磁性吸引力。");
	text = text.replace(/You will pay for this!/, "你会为此付出代价的！");
	text = text.replace(/Whenever an ally dies next to you, gain a stacking (.*?) increased damage for the remainder of the combat./, "每当一个盟友死在你身边时，在剩余的战斗中获得$1额外伤害。");
	text = text.replace(/Orcs call me brother!/, "兽人叫我兄弟！");
	text = text.replace(/The extra Fatigue build-up on skills from weapons such as Orc Weapons is reduced by (.*?), also grants (.*?) effectiveness vs\. Armor when using them\./, "兽人武器等武器技能的额外疲劳累积减少$1，使用时也能获得$2的对抗护甲效果。");
	text = text.replace(/The extra Fatigue build-up on skills from weapons such as Orc Weapons is reduced by (.*?), also grants (.*?) armor penetration when using them\./, "兽人武器等武器技能的额外疲劳累积减少$1，使用时也能获得$2的护甲穿透效果。");
	text = text.replace(/The extra Fatigue build-up on skills from weapons such as Orc Weapons is reduced by (.*?), also reduce the penalty to Maximum Fatigue from mainhand weapon by (.*?)\./, "兽人武器等武器技能的额外疲劳累积减少$1,同时减少主手武器最大疲劳 $2 的惩罚。");
	text = text.replace(/The extra Fatigue build-up on skills from weapons such as Orc Weapons is reduced by (.*?)\./, "兽人武器等武器技能的额外疲劳累积减少$1。");
	text = text.replace(/Unleash the beast within!/, "释放内心的野兽！");
	text = text.replace(/Costs 0 AP and builds 0 Fatigue./, "消耗 0 AP，产生 0 疲劳。");
	text = text.replace(/Once per combat, reduce current Fatigue by (.*?) and gain (.*?) Action Points for the current turn./, "每场战斗使用一次，减少当前$1疲劳，当前回合获得$2行动点。");
	text = text.replace(/Like sheep before a wolf!/, "就像狼面前的羊！");
	text = text.replace(/Gain stacking rage during combat. You gain 1 stack for getting hit, 3 for making a kill, 1 for every successful hit against an adjacent target with a skill with a base Action Point cost of 4 or less and 2 for greater. You lose 2 rage at the start of every turn./, "在战斗中累积怒气。被击中获得1点怒气、击杀敌人获得3点怒气、每成功击中相邻目标，技能耗费行动点等于或小于4的获得怒气1点，技能耗费行动点大于4的获得怒气2点。在每回合开始时失去2点怒气。");
	text = text.replace(/Each stack of rage increases Resolve, Initiative and Damage by (.*?), lowers Melee Defense by (.*?) and reduces incoming damage by (.*?)\./, "每叠加一点怒气，增加$1点决心值、主动值和伤害，降低$2近战防御，减少$3受到的伤害。");
	text = text.replace(/You can do anything. But never go against the family!/, "你可以做任何事。但千万不要违背家族！");
	text = text.replace("Once per day, improves the relations with the Noble faction of the next City, Fortress, or Citadel you enter. This effect becomes stronger as this character gains levels.", "每天一次，改善与你进入的下一个城市、堡垒或城堡的贵族派系的关系。这个效果会随着角色等级的增加而增强。");
	text = text.replace(/Once per day, improves the relations with the Noble faction of the next City, Fortress, or Citadel you enter./, "每天一次，改善与你进入的下一个城市、堡垒或城堡的贵族派系的关系。");
	text = text.replace(/Death before dishonor!/, "死在耻辱之前！");
	text = text.replace(/Always start battles at Confident morale./, "总是以自信的士气开始战斗。");
	text = text.replace(/Morale checks can never drop your morale below Confident for the first (.*?) rounds of battle \(the entire battle if you have the \'Determined\' trait\) and below Steady after that\./, "在前$1回合战斗中士气检查中不会让你的士气低于自信(如果有‘毅然’特技，则是整个战斗)，之后低于稳定。");
	text = text.replace(/Removes the \'Insecure\' and \'Dastard\' traits./, "移除‘不安’和‘畏缩’特性。");
	text = text.replace(/This character\'s senses are heightened when faced with mortal danger\./, "当人面对这种致命的危险时，他们的意识就会增强。");
	text = text.replace(/This character has successfully found an opening in (.*?) target\'s armor and can quickly deliver several deadly stabs\./, "这个角色已经成功地在目标的盔甲上找到了一个缺口，并且可以快速地进行几次致命的刺伤。");
	text = text.replace("This character\'s martial prowess increases when fighting adjacent to allies.", "当与盟友相邻作战时，该角色的军事实力会增强。");
	text = text.replace(/This character is skilled at using the early stages of the battle to quickly throw deadly weapons at (.*?) enemies\./, "这个角色擅长在战斗的早期阶段快速向敌人投掷致命武器。");
	text = text.replace(/This character has not moved yet and can take (.*?) time to get a better aim for ranged attacks\./, "该角色尚未移动，需要时间才能获得更好的远程攻击目标");
	text = text.replace("This character wastes no opportunity to pull a weapon out of an enemy\'s corpse, only to launch it towards another!", "这个角色不会浪费任何机会从敌人的尸体中拔出武器，只会向另一个敌人发射武器！");
	text = text.replace(/(.*?) has become one with (.*?) armor, and ranged attacks now seem nothing more than a tickle\./, "$1已经成为了一个拥有盔甲的人，远程攻击现在看起来只不过是一件乐事。");
	text = text.replace("With each enemy felled, this character finds it easier to kill those who remain.", "随着每一个敌人被击倒，这个角色更容易杀死那些留下来的人。");
	text = text.replace(/This character is highly skilled in spears and can perform a free attack during (.*?) turn./, "这个角色擅长长矛，可以在回合内进行自由攻击。");
	text = text.replace(/This character hits exceptionally hard when not fatigued./, "这个角色在不疲劳的情况下攻击格外猛烈。");
	text = text.replace(/The smell of blood and death sends you into an uncontrollable rage. Every taste of blood your weapon takes, every kill you make, and every hit you receive emboldens you and increases your lethality. Once in a rage, you must continuously feed it to keep it going./, "鲜血和死亡的气息让你怒不可遏。你的武器所吸的每一滴血，你所做出的每一次杀戮，以及你所受到的每一次打击都会让你更加勇敢，增加你的杀伤力。一旦愤怒，你必须不断地喂它，让它继续前进。");
	text = text.replace(/This character is of noble birth and has connections far and wide./, "这个人物出身高贵，有着交际广泛。");
	text = text.replace(/This character is keen to prove that (.*?) family is the greatest of all./, "这个角色渴望证明他们的家族是最伟大的。");
	text = text.replace(/This character is ready to exploit an opening in an attacker\'s stance who has missed an attack against (.*?)\./, "该角色准备利用错过攻击的攻击者姿态中的漏洞进行攻击。");
	text = text.replace(/This character\'s confidence in combat is increased due to support from adjacent allies./, "这个角色在战斗中的信心由于来自邻近盟友的支持而增强。");
	text = text.replace(/Instead of fighting in a large formation, this character has trained to fight as a duo and gains bonuses while there is only one nearby ally./, "这个角色不是以大阵型战斗，而是训练成二人组战斗，当附近只有一个盟友时获得奖励。");
	text = text.replace(/As, (.*?) also has this perk, the bonuses are increased./, "由于$1也有这个特技，加成也增加了。");
	text = text.replace(/This character is prepared to deal a particularly deep cut on (.*?) next attack against the same target./, "这个角色准备在下一次攻击同一个目标时进行一次特别深入的攻击。");
	text = text.replace(/This character gains increased vigor when next to bleeding enemies./, "这个角色在靠近流血的敌人时获得更大的活力。");
	text = text.replace(/This character is highly skilled in fighting in a shielded formation and gains bonuses when adjacent to allies with shields./, "这个角色非常擅长以盾牌阵型作战，当与有盾牌的盟友相邻时，他会获得额外奖励。");
	text = text.replace(/This character is a master of One-Handed weapons and can swap one such weapon for another for free once per turn./, "这个角色是单手武器的大师，每回合可以免费切换一件单手武器。");
	text = text.replace(/This character is adding the momentum of their movement to (.*?) next attack./, "这个角色为下一次攻击增添了动力。");
	text = text.replace(/Having not expended (.*?) completely during (.*?) last turn, this character finds (.*?) better prepared for combat now./, "由于在最后一回合中没有完全消耗自己，这个角色发现自己现在为战斗做好了更好的准备。");
	text = text.replace(/This character does more damage as allies die next to (.*?)\./, "当盟友死在旁边时，这个角色会造成更大的伤害。");
	text = text.replace(/This character is skilled in long reach weapons and gains bonuses depending on the weight of (.*?) armor/, "这个角色擅长远程武器，并根据盔甲的重量获得加成");
	text = text.replace(/This character\'s attacks seem to not miss at all./, "这个角色的攻击似乎一点都没有错过。");
	text = text.replace(/This character\'s eyes and body are well-accustomed to dark places./, "这个角色的眼睛和身体非常习惯黑暗的地方。");
	text = text.replace(/(.*?) is in the thick of battle, with (.*?) heart beating faster, pumping fresh blood through (.*?) veins./, "$1正处于激烈的战斗中，心跳加快，血液通过静脉泵入。");
	text = text.replace(/This character has the advantage of going first in the flow of battle./, "这个角色的优势是在战斗中走在第一位。");

	text = text.replace(/Master the art of fighting with a nimble sword. When using a fencing sword, skills build up (.*?) less Fatigue and gain (.*?) chance to hit. Additionally, the Action Point costs of Sword Thrust, Riposte and Lunge are reduced by (.*?)\./, "掌握用灵巧剑作战的艺术。使用刺剑时，技能减少$1点疲劳，增加$2次命中率。此外，剑刺、还击和突刺的行动点消耗减少$3。");
	text = text.replace(/Master the art of fighting with a nimble sword. Skills build up (.*?) less Fatigue and gain (.*?) chance to hit when using a fencing sword\./, "掌握用灵巧剑作战的艺术。使用刺剑时，技能使用疲劳减少$1，增加$2次命中率。");
	text = text.replace(/For two-handed fencing swords the range of Lunge is increased by (.*?) tile\./, "双手刺剑的突刺距离增加$1格。");
	text = text.replace(/For one-handed fencing swords, the Action Point costs of Sword Thrust, Riposte and Lunge are reduced by (.*?)\./, "对于单手刺剑，剑刺、还击和突刺的行动点消耗减少$1。");
	text = text.replace(/Become one with your weapon and go for the weak spots! With the offhand free, an additional (.*?) of any damage ignores armor\./, "与武器合二为一，直击弱点！在副手空闲的情况下，额外增加$1点忽略护甲伤害。");
	text = text.replace(/Gain a percentage of your Melee Skill as Melee Defense when engaged with a maximum of one or two enemies. (.*?) when engaged with one enemy, and (.*?) when engaged with two enemies\./, "当和一个或两个敌人交战时，获得一定百分比的近战技能作为近战防御。当和一个敌人交战时 $1，当与两个敌人交战时 $2。");
	text = text.replace("Does not work with two-handed weapons.", "不能使用双手武器。");

	text = text.replace("Not much to be afraid of behind a suit of plate!", "在一套板甲后面没什么好怕的！");
	
//	text = text.replace(/Gain increased defense by balancing your armor\'s weight and mobility\. Gain (.*?) Melee Defense when wearing head and body armor with a total weight \(penalty to Maximum Fatigue\) of 35\. The bonus drops by (.*?) for every 2 points of deviation from this value, and for every 10 points that your Current Initiative is below twice your armor weight\. Gain a third of the Melee Defense bonus as Ranged Defense\./, "近战攻击");
//	text = text.replace("Ranged Attack", "远程攻击");
	
	text = text.replace("From the Dagger or Devious perk groups", "源于匕首或狡猾特技组");
	text = text.replace("From the Vala or Spirits perk groups", "源于瓦拉或怨灵特技组");
	text = text.replace("From the Knives, Assassin, Assassin or Devious perk groups", "源于小刀、刺客、刺客或狡猾特技组");
	text = text.replace("From the Knives or Assassin perk groups", "源于小刀或刺客特技组");
	text = text.replace("From the Talented or Talented perk groups", "源于天赋、天赋特技组");
	text = text.replace("From the Martyr, Resilient or Resilient perk groups", "源于殉道、坚韧或坚韧特技组");
	text = text.replace("From the Martyr or Vicious perk groups", "源于殉道、凶暴特技组");
	text = text.replace("From the Holy Man or Calm perk groups", "源于神职人员、冷静特技组");
	text = text.replace("From the Dagger or Fast perk groups", "源于匕首或快速特技组");
	text = text.replace("From the Miner, Axe, Large, Blacksmith, Miner or Blacksmith perk groups", "源于矿工、斧、巨人、铁匠、矿工或铁匠特技组");
	text = text.replace("From the Miner, Blacksmith, Miner, Blacksmith or Two-Handed Weapons perk groups", "源于矿工、铁匠、矿工、铁匠、或双手武器特技组");

	text = text.replace("From the Organized or Ranged Weapons perk groups", "源于组织或远程武器特技组");
	text = text.replace("From the Inspirational or Sturdy perk groups", "源于励志或坚固特技组");
	text = text.replace("From the Sturdy or Martyr perk groups", "源于坚固或殉道特技组");
	text = text.replace("From the Unstoppable, Unstoppable or Berserker perk groups", "源于势不可挡、势不可挡或狂战士特技组");
	text = text.replace("From the Leadership or Trained perk groups", "源于领导或训练有素特技组");
	text = text.replace("From the Trained, Juggler, Assassin or Juggler perk groups", "源于训练有素、杂耍者、刺客或杂耍者特技组");
	text = text.replace("From the Knives, Assassin or Assassin perk groups", "源于小刀、刺客或刺客特技组");
	text = text.replace("From the Assassin or Devious perk groups", "源于刺客或狡猾特技组");
	text = text.replace("From the Bard or Sergeant perk groups", "源于吟游诗人或中士特技组");
	text = text.replace("From the Inspirational or Sergeant perk groups", "源于励志或中士特技组");
	text = text.replace("From the Inspirational, Leadership or Sergeant perk groups", "源于励志、领导或中士特技组");
	text = text.replace("From the Nets or Trapper perk groups", "源于投网或陷阱捕兽者特技组");
	text = text.replace("From the Nets or 陷阱捕兽者 perk groups", "源于投网或陷阱捕兽者特技组");
	text = text.replace("From the Barter or Clerk perk groups", "源于交易或记账员特技组");
	text = text.replace("From the Hound Master perk group", "源于猎犬大师特技组");
	text = text.replace("From the Blacksmith perk group", "源于铁匠特技组");
	text = text.replace("From the Ranger or Tactician perk groups", "源于游侠或战术家特技组");
	text = text.replace("From the Leadership or Tactician perk groups", "源于领导或战术家特技组");
	text = text.replace("From the Sling or Scout perk groups", "源于投石或侦察特技组");
	text = text.replace("From the Digger or Gravedigger perk groups", "源于挖掘者或掘墓人技组");
	text = text.replace("From the Gravedigger perk group", "源于掘墓人技组");
	text = text.replace("From the Ranger perk group", "源于游侠特技组");
	text = text.replace("From the Hexen Magic perk group", "源于女巫魔法特技组");
	text = text.replace("From the Arachnid perk group", "源于蜘蛛纲特技组");
	text = text.replace("From the Reptilia perk group", "源于爬虫纲特技组");
	text = text.replace("From the Canine perk group", "源于犬科特技组");
	text = text.replace("From the Alp perk group", "源于梦魇特技组");
	text = text.replace("From the Demonology perk group", "源于恶魔特技组");
	text = text.replace("From the Luft Naughty Tricks perk group", "源于洛夫顽皮把戏特技组");
	text = text.replace("From the Ghoul perk group", "源于食尸鬼特技组");
	text = text.replace("From the Unhold perk group", "源于巨魔特技组");
	text = text.replace("From the Brokenly Overpowered perk group", "源于断续压制特技组");
	text = text.replace("From the Schrat perk group", "源于树人特技组");
	text = text.replace("From the Lindwurm perk group", "源于林德虫特技组");
	text = text.replace("From the Goblin perk group", "源于哥布林特技组");
	text = text.replace("From the ??? perk group", "源于未知特技组");
	text = text.replace("From the Brute perk group", "源于猛兽特技组");
	text = text.replace("From the Wiederganger perk group", "源于僵尸特技组");
	text = text.replace("From the Beast of Beasts perk group", "源于兽中兽特技组");
	text = text.replace("From the Skeleton perk group", "源于骷髅特技组");
	text = text.replace("From the Vengeful Spirit perk group", "源于复仇之魂特技组");
	text = text.replace("From the Embalmed perk group", "源于木乃伊特技组");
	text = text.replace("From the Vala Chant perk group", "源于瓦拉吟唱特技组");
	text = text.replace("From the Vala Trance perk group", "源于瓦拉通灵特技组");
	text = text.replace("From the MC Magic perk group", "源于MC魔法特技组");
	text = text.replace("From the Special Perks or Ranger perk groups", "源于特殊特技或游侠特技组");
	text = text.replace("From the Necromancy perk group", "源于通灵术特技组");
	text = text.replace("From the Druidic Arts or Sorcery perk groups", "源于德鲁伊艺术或巫术特技组");
	text = text.replace("From the Sorcery perk group", "源于巫术特技组");
	text = text.replace("From the Butcher, Vampire or Butcher perk groups", "源于屠夫、吸血鬼或屠夫特技组");
	text = text.replace("From the Vampire perk group", "源于吸血鬼特技组");
	text = text.replace("From the Zombie perk group", "源于僵尸特技组");
	text = text.replace("From the Cat O' Nine Tails or Cultist perk groups", "源于九尾鞭或异教徒技组");
	text = text.replace("From the Butcher, Cat O' Nine Tails, Cultist or Butcher perk groups", "源于屠夫、九尾鞭、异教徒或屠夫特技组");
	text = text.replace("From the Butcher or Butcher perk groups", "源于屠夫或屠夫特技组");
	text = text.replace("From the Blacksmith or Blacksmith perk groups", "源于铁匠或铁匠特技组");
	text = text.replace("From the Militia or Militia perk groups", "源于民兵或民兵特技组");
	text = text.replace("From the Miner or Miner perk groups", "源于矿工或矿工特技组");
	text = text.replace("From the Farmer or Farmer perk groups", "源于农民或农民特技组");
	text = text.replace("From the Lumberjack or Lumberjack perk groups", "源于伐木工或伐木工特技组");
	text = text.replace("From the Agile or Juggler perk groups", "源于狡猾或杂耍者特技组");

	text = text.replace("From the Berserker perk group", "源于狂战士特技组");
	text = text.replace("From the Divination, Bard, Minstrel or Illusion perk groups", "源于占卜、诗人、吟游诗人或幻术特技组");
	text = text.replace("From the Bard, Minstrel or Illusion perk groups", "源于诗人、吟游诗人或幻术特技组");
	text = text.replace("From the Illusion perk group", "源于幻术特技组");
	text = text.replace("From the Conjuration perk group", "源于召唤术特技组");
	text = text.replace("From the Sickle or Apothecary perk groups", "源于镰刀或药剂师特技组");
	text = text.replace("From the Wildling, Sickle, Apothecary or Transmutation perk groups", "源于野人、镰刀、药剂师或变形术特技组");
	text = text.replace("From the Sickle, Apothecary or Transmutation perk groups", "源于野人、镰刀、药剂师或变形术特技组");
	text = text.replace("From the Druidic Arts or Transmutation perk groups", "源于德鲁伊艺术或变形术特技组");
	text = text.replace("From the Transmutation perk group", "源于变形术特技组");
	text = text.replace("From the Evocation perk group", "源于塑能系特技组");
	text = text.replace("From the Philosophy perk group", "源于哲学特技组");
	text = text.replace("From the Unarmed perk group", "源于徒手特技组");
	text = text.replace("From the Therianthropy or Druidic transformation perk groups", "源于狼人或德鲁伊变身术特技组");
	text = text.replace("From the Therianthropy perk group", "源于狼人特技组");
	text = text.replace("From the Vala Rune perk group", "源于瓦拉符文特技组");
	text = text.replace("From the Inventor perk group", "源于发明者特技组");
	text = text.replace("From the Faith, Druidic Arts or Holy Man perk groups", "源于信仰、德鲁伊艺术或神职人员特技组");
	text = text.replace("From the Druidic Arts perk group", "源于德鲁伊艺术特技组");
	text = text.replace("From the Druidic Arts, Bard or Minstrel perk groups", "源于德鲁伊艺术、诗人或吟游诗人特技组");
	text = text.replace("From the Mace or Unarmed perk groups", "源于棍棒或徒手特技组");
	text = text.replace("From the One-Handed Weapons or Dagger perk groups", "源于单手武器或匕首特技组");
	text = text.replace("From the Divination perk group", "源于占卜特技组");
	text = text.replace("From the Juggler, Agile or Juggler perk groups", "源于杂耍者、迅捷或杂耍者特技组");
	text = text.replace("From the Juggler or Juggler perk groups", "源于杂耍者或杂耍者特技组");
	text = text.replace("From the Light Armor or Fast perk groups", "源于轻甲或快速特技组");
	text = text.replace("From the Wildling, Devious or Agile perk groups", "源于野人、狡猾或迅捷特技组");
	text = text.replace("From the Wildling, Agile or Devious perk groups", "源于野人、迅捷或狡猾特技组");

	text = text.replace("From the Bard or Minstrel perk groups", "源于诗人或吟游诗人特技组");
	text = text.replace("From the Magic perk group", "源于魔法特技组");
	text = text.replace("From the Noble perk group", "源于贵族特技组");
	text = text.replace("From the Premonition perk group", "源于预感特技组");
	text = text.replace("From the Faith or Holy Man perk groups", "源于信仰或神职人员特技组");
	text = text.replace("From the Juggler, Assassin or Juggler perk groups", "源于杂耍者、刺客或杂耍者特技组");
	text = text.replace("From the Barter or Trader perk groups", "源于交易或贸易商特技组");
	text = text.replace("From the Vala Spirits perk group", "源于瓦拉怨灵特技组");
	text = text.replace("From the Trained or Juggler perk groups", "源于练有素或杂耍者特技组");
	text = text.replace("aaaaa", "aaaaa");
	
	text = text.replace("From the One Handed Sword perk group", "源于单手剑特技组");
	text = text.replace("From the Axe perk group", "源于斧子特技组");
	text = text.replace("From the Mace perk group", "源于棍棒特技组");
	text = text.replace("From the Hammer perk group", "源于战锤特技组");
	text = text.replace("From the Sword perk group", "源于剑特技组");
	text = text.replace("From the Sword or Two-Handed Sword perk groups", "源于剑和双手剑特技组");
	text = text.replace("From the Hunter or Shortbow perk groups", "源于猎人和短弓特技组");
	text = text.replace("From the Staff perk group", "源于法杖特技组");
	text = text.replace("From the Polearm perk group", "源于长柄特技组");
	text = text.replace("From the Spear perk group", "源于矛特技组");
	text = text.replace("From the Dagger perk group", "源于匕首特技组");
	text = text.replace("From the Flail perk group", "源于连枷特技组");
	text = text.replace("From the Bow perk group", "源于弓特技组");
	text = text.replace("From the Crossbow perk group", "源于弩特技组");
	text = text.replace("From the Cleaver perk group", "源于砍刀特技组");
	text = text.replace("From the Sling perk group", "源于投石特技组");
	text = text.replace("From the Two-Handed Weapons perk group", "源于双手武器特技组");
	text = text.replace("From the One-Handed Weapons perk group", "源于单手武器特技组");
	text = text.replace("From the Throwing perk group", "源于投掷特技组");
	text = text.replace("From the Resilient perk groups", "源于韧性特技组");
	text = text.replace("From the Resilient perk group", "源于韧性特技组");
	text = text.replace("From the Resilient or Resilient perk groups", "源于韧性或韧性特技组");
	text = text.replace("From the Resilient or Resilient perk group", "源于韧性或韧性特技组");
	text = text.replace("From the Vicious perk group", "源于凶暴特技组");
	text = text.replace("From the Vampire or Vicious perk groups", "源于吸血鬼和凶暴特技组");
	text = text.replace("From the Talented perk group", "源于天赋特技组");
	text = text.replace("From the Fast perk group", "源于快速特技组");
	text = text.replace("From the Unstoppable perk group", "源于势不可挡特技组");
	text = text.replace("From the Unstoppable or Unstoppable perk groups", "源于势不可挡特技组");
	text = text.replace("From the Trained perk group", "源于训练有素特技组");
	text = text.replace("From the Ranged Weapons perk group", "源于远程武器特技组");
    text = text.replace("From the Axe, Large, Blacksmith, and Miner perk group", "源于斧，巨人，铁匠，矿工特技组");
	text = text.replace("From the Scout and Sling perk group", "源于侦察和投石特技组");
	text = text.replace("From the Agile perk group", "源于迅捷特技组");
	text = text.replace("From the Dagger and Devious perk group", "源于匕首和狡猾特技组");
	text = text.replace("From the Devious perk group", "源于狡猾特技组");
	text = text.replace("From the Calm perk group", "源于冷静特技组");
	text = text.replace("From the Fast and Light Armor perk group", "源于快速和轻甲特技组");
	text = text.replace("From the Large perk group", "源于巨人特技组");
	text = text.replace("From the Large or Berserker perk groups", "源于巨人和狂战士特技组");
	text = text.replace("From the Sturdy perk group", "源于强健特技组");
	text = text.replace("From the Wildling perk group", "源于野人特技组");
	text = text.replace("From the Ninetails perk group", "源于九尾鞭特技组");
	text = text.replace("From the Organized perk group", "源于组织特技组");
	text = text.replace("From the Sergeant perk group", "源于中士特技组");
	text = text.replace("From the Healer perk group", "源于医师特技组");
	text = text.replace("From the Trapper perk group", "源于捕兽师特技组");
	text = text.replace("From the Mender perk group", "源于修理工特技组");
	text = text.replace("From the Mender or Repair perk groups", "源于修理特技组");
	text = text.replace("From the Clerk perk group", "源于记账员特技组");
	text = text.replace("From the Houndmaster perk group", "源于训犬大师特技组");
	text = text.replace("From the Tactician perk group", "源于战术家特技组");
	text = text.replace("From the Butcher perk group", "源于屠夫特技组");
	text = text.replace("From the Chef perk group", "源于厨师特技组");
	text = text.replace("From the Calm and Holy Man perk group", "源于冷静和神职人员特技组");
	text = text.replace("From the Holy Man perk group", "源于神职人员特技组");
	text = text.replace("From the Pauper perk group", "源于穷人特技组");
	text = text.replace("From the Militia perk group", "源于民兵特技组");
	text = text.replace("From the Miner perk group", "源于矿工特技组");
	text = text.replace("From the Heavy Armor or Berserker perk groups", "源于重甲或狂战士特技组");
	text = text.replace("From the Heavy Armor perk group", "源于重甲特技组");
	text = text.replace("From the Medium Armor perk group", "源于中甲特技组");
	text = text.replace("From the Light Armor perk group", "源于轻甲特技组");
	text = text.replace("From the Shield perk group", "源于盾牌特技组");
	text = text.replace("From the Laborer perk group", "源于劳工特技组");
	text = text.replace("From the Raider perk group", "源于掠夺者特技组");
	text = text.replace("From the Soldier perk group", "源于士兵特技组");
	text = text.replace("From the Swordmaster perk group", "源于剑师特技组");
	text = text.replace("From the Entertainer perk group", "源于艺人特技组");
	text = text.replace("From the One-Handed Weapons and Shield perk group", "源于单手武器和盾牌特技组");
	text = text.replace("From the Fast and Dagger perk group", "源于快速和匕首特技组");
	text = text.replace("From the One-Handed Weapons and Dagger perk group", "源于单手武器和匕首特技组");
	text = text.replace("From the Apothecary perk group", "源于药剂师特技组");
	text = text.replace("From the Devious and Assassin perk group", "源于狡猾和刺客特技组");
	text = text.replace("From the Hunter perk group", "源于猎人特技组");
	text = text.replace("From the Assassin perk group", "源于刺客特技组");
	text = text.replace("From the Minstrel perk group", "源于吟游诗人特技组");
	text = text.replace("From the Lumberjack perk group", "源于伐木工特技组");
	text = text.replace("From the Cultist perk group", "源于异教徒特技组");
	text = text.replace("From the berserker perk group", "源于狂战士特技组");
	text = text.replace("From the Special Perks perk group", "源于特殊特技组");
	text = text.replace("From the special perk group", "源于特殊特技组");
	text = text.replace("From the Trader perk group", "源于商人特技组");
	
	text = text.replace("Let loose a cascade of three striking heads on your opponent. Will strike over or around shield cover.", "向你的对手倾泻三次打击。会绕过盾牌的覆盖。");
	text = text.replace(/Using blankets and ropes to group large bundles of ammunition together you are able to carry far more\. These bundles can also be used to shield yourself from enemy fire. Increases maximum ammunition storage by (.*?) and Ranged Defense by (.*?)/, "用毯子和绳子把一大捆弹药捆在一起，你可以携带更多的弹药。这些包裹也可以用来保护自己免受敌人的炮火。增加弹药储存量$1，增加远程防御$2");
	text = text.replace("If you can\'t get around it, try smashing through. It works!", "如果没法绕过它，尝试击碎它。实用的办法！");
//	text = text.replace(/Abilities targeting shields do (.*?) more damage.\n• If a shield is destroyed using the \'Split Shield\' skill, (.*?) Action Points are immediately regained\./, "以盾牌为目标的技能造成 $1 额外伤害。\n• 如果“劈盾”技能摧毁了盾牌，那么立即返还 $2 点行动点。");
	text = text.replace(/Abilities targeting shields do (.*?) more damage./, "以盾牌为目标的技能造成 $1 额外伤害。");
	text = text.replace(/If a shield is destroyed using the \'Split Shield\' skill, (.*?) Action Points are immediately regained\./, "如果“劈盾”技能摧毁了盾牌，那么立即返还 $1 点行动点。");
//	text = text.replace(/The threshold to inflict injuries is reduced by a percentage equal to (.*?) of your Maximum Damage.\n• Cutting attacks can now inflict injuries on Undead\./, "出伤阈值降低相当于你最大伤害 $1 的百分比。\n• 劈砍攻击现在能对不死族造成伤口。");
	text = text.replace(/The threshold to inflict injuries is reduced by a percentage equal to (.*?) of your Maximum Damage\./, "出伤阈值降低相当于你最大伤害 $1 的百分比。");
	text = text.replace(/Cutting attacks can now inflict injuries on Undead\./, "劈砍攻击现在能对不死族造成伤口。");
	text = text.replace("Chop chop!", "砍砍砍！");
	text = text.replace("Take advantage of the weight of your axe to inflict maximum damage!", "利用斧头的重量以造成最大的伤害！");
	text = text.replace(/Maximum Damage is increased by (.*?) of the Maximum Damage of the currently equipped axe\./, "最大伤害增加相当于你当前装备斧头 $1 的最大伤害");
//	text = text.replace(/Costs 1 AP and builds 15 Fatigue.\n• Allows you to gain (.*?) of your Melee Skill as additional chance to hit the head for your next attack\./, "消耗1行动点并产生15疲劳。\n• 使你下次攻击获得相当于 $1 近攻的额外爆头率。");
	text = text.replace(/Costs 1 AP and builds 15 Fatigue./, "消耗1行动点并产生15疲劳。");
	text = text.replace(/Allows you to gain (.*?) of your Melee Skill as additional chance to hit the head for your next attack\./, "使你下次攻击获得相当于 $1 近攻的额外爆头率。");

	text = text.replace("If the attack misses, the effect is wasted.", "如果攻击落空，那么效果会被消耗。");
	text = text.replace("Like splitting butter!", "如同切开黄油！");
	text = text.replace("No weapon has more potential for destruction than an axe, a trait you\'ve learned to take advantage of well!", "没什么武器破坏力比斧强，这特点你早已烂熟于心。");
	text = text.replace(/When using Axes, hits to the head will instantly kill a target whose remaining Hitpoints after the attack are below (.*?) health when using Two-Handed Axes and below (.*?) health when using One-Handed Axes\./, "使用双手斧击中生命值低于$1的敌人头部会直接斩杀目标，单手斧则是$2 。");
	text = text.replace(/When using Axes, hits to the head will instantly kill a target whose remaining Hitpoints after the attack are below (.*?) health\./, "使用斧类武器击中生命值低于$1的敌人头部会直接斩杀目标。");

	text = text.replace("Ignores Nine Lives on the target.", "忽略目标的'九命猫'。");
	text = text.replace(/Does (.*?)not(.*?) work if the target has Steel Brow or if the target is under the effects of Indomitable\./, "如果目标拥有钢头或者处于不屈状态下则$1不$2生效。");
	text = text.replace("Time in training has allowed you to come up with an efficient way to organize your ammo, as well as a less exhausting way to make accurate shots!", "训练使你可以有效的利用弹药，同时更轻松的击中目标！");
	text = text.replace("Time in training has allowed you to come up with an efficient way to organize your ammo, while increasing your accuracy!", "训练时间让你能够想出一种有效的方法来分配弹药，同时提高你的准确性！");

	
	//    text = text.replace(/Swapping quivers or bags of ammo never costs any Action Points.\n• The Action Point cost of Aimed Shot is reduced by (.*?)\./, "切换箭袋不会消耗行动点。\n• 瞄准射击的行动点消耗降低 $1 点。");
    text = text.replace(/Swapping quivers or bags of ammo never costs any Action Points\./, "切换箭袋不会消耗行动点。");
    text = text.replace(/The Action Point cost of Aimed Shot is reduced by (.*?)\./, "瞄准射击的行动点消耗降低 $1 点。");
	text = text.replace("Thanks to your experience in ranged combat, you know exactly how to exploit the weaknesses of your peers!", "拜远程战斗的经验所赐，你知道怎么利用同行的弱点！");
//	text = text.replace(/Ranged attacks have (.*?) chance to hit against enemies wielding ranged weapons.\n• Increases Vision and shooting range with Bows by (.*?)\./, "远攻攻击有 $1 的额外几率命中持有远程武器的敌人。\n• 增加 $2 格视野范围和弓射程。");
	text = text.replace(/Ranged attacks have (.*?) chance to hit against enemies wielding ranged weapons\./, "远攻攻击有 $1 的额外几率命中持有远程武器的敌人。");
	text = text.replace(/Increases Vision and shooting range with Bows by (.*?)\./, "增加 $1 格视野范围和弓射程。");
	text = text.replace("The bane of adventurers everywhere, an arrow to the knee is a surefire way to debilitate a target!", "危机四伏，一支射向膝盖的箭能虚弱你的目标！");
//	text = text.replace(/Costs 2 AP and builds 15 Fatigue.\n• Causes all of your ranged attacks during a turn to apply a debuff on the target for (.*?) turns, reducing their Melee and Ranged Defense by (.*?) each and requiring them to spend (.*?) additional Action Points per tile moved.\n• The effects are halved on the second turn\./, "消耗2行动点并产生15疲劳。\n• 一回合内的所有远程攻击对敌人施加持续 $1 回合的负面效果，降低他们 $2 的近战防御和远程防御，并且移动每格会额外花费 $3 行动点。\n• 第二回合效果减半。");
	
//ss射向膝盖
	text = text.replace(/Costs 2 AP and builds 15 Fatigue\./, "消耗2行动点并产生15疲劳。");
	text = text.replace(/Causes all of your ranged attacks during a turn to apply a debuff on the target for (.*?) turns, reducing their Melee and Ranged Defense by (.*?) each and requiring them to spend (.*?) additional Action Points per tile moved, this will also lower them (.*?) initiative. These effects are halved on the second turn\./, "一回合内的所有远程攻击对敌人施加持续 $1 回合的负面效果，降低他们 $2 的近战防御和远程防御，并且移动每格会额外花费 $3 行动点，这也会降低他们 $4 主动值。第二回合效果减半。");
	text = text.replace(/Causes all of your ranged attacks during a turn to apply a debuff on the target for (.*?) turns, reducing their Melee and Ranged Defense by (.*?) each and requiring them to spend (.*?) additional Action Points per tile moved\./, "一回合内的所有远程攻击对敌人施加持续 $1 回合的负面效果，降低他们 $2 的近战防御和远程防御，并且移动每格会额外花费 $3 行动点。");
	text = text.replace(/These effects are halved on the second turn\./, "第二回合效果减半。");
	text = text.replace(/The effects are halved on the second turn\./, "第二回合效果减半。");
	text = text.replace("Burn them all!", "燃尽一切！");
	text = text.replace(/A successful Aimed Shot will now light the target tile on fire for 2 rounds and trigger an additional morale check for the target\./, "成功的瞄准射击会点燃目标脚下地块两回合并且会对目标额外触发一次士气检测。");
	text = text.replace("Intuitively calculate wind velocity and distance to target your enemies\' weak spots!", "凭直觉计算风速和距离以命中敌人薄弱点！");
	text = text.replace(/When using a Ranged weapon, gain (.*?) of your Base Ranged Skill as additional Minimum and Maximum Damage\./, "使用远程武器时，获得相当于 $1 的远攻作为额外的最大伤害和最小伤害。");
	text = text.replace("Make them fight in the shade!", "让敌人处于箭雨之下！");
//	text = text.replace(/The Action Point cost of Quick Shot is reduced by (.*?)\.\n• Each subsequent Quick Shot in a turn builds (.*?) more Fatigue\./, "快速射击的行动点消耗降低 $1 。\n• 每回合内每次后续的快速射击多产生 $2 疲劳。");
	text = text.replace(/The Action Point cost of Quick Shot is reduced by (.*?)\./, "快速射击的行动点消耗降低 $1 。");
	text = text.replace(/Each subsequent Quick Shot in a turn builds (.*?) more Fatigue\./, "每回合内每次后续的快速射击多产生 $1 疲劳。");
	text = text.replace("Cleaver... sword... pretty much the same thing, right?", "砍刀，剑，好像是差不多的东西？");
//	text = text.replace(/The \'Cleave\' skill gains (.*?) chance to hit.\n• Does not work with weapons with a range of 2 tiles\./, "劈获得 $1 命中率。\n• 对射程为2格的武器不生效。");
	text = text.replace(/The \'Cleave\' and \'Rend Flesh\' skill gains (.*?) chance to hit\./, "‘劈’和‘撕裂’获得$1命中率。");

	text = text.replace(/Other skills of Cleavers gain (.*?) hitchance against bleeding targets\./, "劈裂者的其他技能对流血目标获得 $1 的额外命中率");

	text = text.replace(/The \'Cleave\' skill gains (.*?) chance to hit\./, "劈获得 $1 命中率。");
	text = text.replace(/Does not work with weapons with a range of 2 tiles\./, "对射程为2格的武器不生效。");
	text = text.replace("You know the best whetstone techniques to get your cutting edge wickedly sharp!", "你知道如何把刀磨的锋利无比！");
//	text = text.replace(/During a turn, after a successful attack against a target, every next successful attack against the same target has a (.*?) lower threshold to inflict an injury and will inflict an additional stack of Bleeding for (.*?) damage.\n• If any of the attacks inflicted an injury, this damage is increased to (.*?)\.\n• The effect expires upon switching your target\./, "每回合第二次成功的攻击将拥有 $1 的减伤阈值，并且会额外造成一层 $2 伤害的流血效果。\n• 如果其中至少一次攻击造成了伤口，那么这个伤害提升至 $3 。\n• 如果你转换目标这些效果就会失效。");
	text = text.replace(/During a turn, after a successful attack against a target, every next successful attack against the same target has a (.*?) lower threshold to inflict an injury and will inflict an additional stack of Bleeding for (.*?) damage\./, "每回合第二次成功的攻击将拥有 $1 的减伤阈值，并且会额外造成一层 $2 伤害的流血效果。");
	text = text.replace(/If any of the attacks inflicted an injury, this damage is increased to (.*?)\./, "如果其中至少一次攻击造成了伤口，那么这个伤害提升至 $1 。");
	text = text.replace(/The effect expires upon switching your target\./, " 如果你转换目标这些效果就会失效。");
	text = text.replace("Why go for the body when the head is such a juicy target?", "脑袋是如此富有吸引力，为什么还要去砍身体？");
//	text = text.replace(/The chance to inflict fatalities is increased by (.*?)\n• Fatalities refund (.*?) of the Base Fatigue Cost of the skill used.\n• During your turn, every successful attack that applies Bleeding, or is against an already bleeding target, improves your Morale by one level, and fatalities instantly set the Morale to Confident\./, "造成致命伤口的概率提升 $1 。\n• 造成致命伤时会返还技能 $2 的基础疲劳消耗。\n• 你回合内每次会施加流血的攻击或者攻击一个已经流血的目标会增加1士气，造成致命伤会立即自信。");
	text = text.replace(/The chance to inflict fatalities is increased by (.*?)/, "造成致命伤口的概率提升 $1");
	text = text.replace(/Fatalities refund (.*?) of the Base Fatigue Cost of the skill used\./, "造成致命伤时会返还技能 $1 的基础疲劳消耗。");
	text = text.replace(/During your turn, every successful attack that applies Bleeding, or is against an already bleeding target, improves your Morale by one level, and fatalities instantly set the Morale to Confident\./, "你回合内每次会施加流血的攻击或者攻击一个已经流血的目标会增加1士气，造成致命伤会立即自信。");
	text = text.replace(/During your turn, every successful attack that applies Bleeding, or is against an already bleeding target, improves your Morale by one level up to a maximum of Steady, and fatalities instantly set the Morale to Confident\./, "你回合内每次会施加流血的攻击或者攻击一个已经流血的目标会增加一级士气最多到稳定，造成致命伤会立即自信。");

	text = text.replace("When surrounded by carnage, you feel revitalized and right at home!", "处于屠杀会让你倍感亲切！");
//	text = text.replace(/During your turn, every successful attack reduces current Fatigue by (.*?) per stack of Bleeding on the target and increases Fatigue Recovery by (.*?) for one turn per stack of Bleeding on the target.\n• Bleeding inflicted by the attack, or killing a target, also counts towards the bonus\./, "你的回合内，每次成功命中敌人，根据流血层数每层回复 $1 当前疲劳，并增加 $2 疲劳恢复。\n• 这次攻击造成的流血效果或者击杀了敌人也会计算收益。");
	text = text.replace(/During your turn, every successful attack reduces current Fatigue by (.*?) per stack of Bleeding on the target and increases Fatigue Recovery by (.*?) for one turn per stack of Bleeding on the target\./, "你的回合内，每次成功命中敌人，根据流血层数每层回复 $1 当前疲劳，并增加 $2 疲劳恢复。");
	text = text.replace(/During your turn, every successful attack reduces current Fatigue by (.*?) per stack of Bleeding on the target \(each subsequent stack decrease the effect by (.*?) to a minimum of (.*?)\) and increases Fatigue Recovery by (.*?) for one turn per stack of Bleeding on the target\./, "你的回合内，每次成功命中敌人，根据流血层数每层回复 $1 当前疲劳(每个后续层数效果减少$2，直到$3为止)，$4 疲劳恢复。");

	text = text.replace(/Bleeding inflicted by the attack, or killing a target, also counts towards the bonus\./, "这次攻击造成的流血效果或者击杀了敌人也会计算收益。");
	text = text.replace("There\'s something about removing someone\'s head that just makes you want to do it again!", "你只想再来一遍去头术！");
//	text = text.replace(/Fatalities instantly restore (.*?) Action Points.\n• Has no limit on how many times it can proc per turn\./, "造成致命伤时立即回复 $1 行动点。\n• 每回合可以无限触发。");
	text = text.replace(/Fatalities instantly restore (.*?) Action Points\./, "造成致命伤时立即回复 $1 行动点。");
	text = text.replace(/Has no limit on how many times it can proc per turn\./, "每回合可以无限触发。");
	text = text.replace("Flesh is a canvas on which you paint!", "血肉就是你的画布！");
	text = text.replace(/Attacks do more damage, the less armor your target has. This bonus is (.*?) more damage at no armor, and (.*?) more damage at (.*?) armor remaining\./, "你的目标护甲越少攻击造成的伤害越高。在无甲时获得 $1 额外伤害，在$3护甲时获得 $2 额外伤害。");
	text = text.replace(/Attacks do more HP damage, the less armor your target has. This bonus is (.*?) more damage at no armor, and (.*?) more damage at (.*?) armor remaining\./, "你的目标护甲越少攻击造成的生命伤害越高。在无甲时获得 $1 额外伤害，在$3护甲时获得 $2 额外伤害。");

	text = text.replace(/Ranged attacks have a (.*?) reduced chance to inflict friendly fire\./, "远程攻击命中友方的概率减少 $1 。");
	text = text.replace("You\'ve learned the value of taking time with your shots when the situation calls for it!", "你已经了解了在适当情况下花点时间瞄准的价值！");
//	text = text.replace(/Costs 2 AP and builds 20 Fatigue.\n• Applies to your next attack during the same turn.\n• For crossbows, the attack ignores the hitchance penalty from obstacles and the shot cannot go astray.\n• For Handgonnes the attack has its Maximum Range increased by (.*?) and if used at a shorter range, the area of effect is increased by (.*?) instead\./, "消耗2行动点并产生20疲劳。\n• 应用于本回合内的下次攻击。\n• 如果是弩则攻击无视障碍物的减益并且不会射偏。\n• 如果是手炮那么最大射程增加 $1 格；如果在近距离射击那么影响范围增加 $2 格。");
	text = text.replace(/Costs 2 AP and builds 20 Fatigue\./, "消耗2行动点并产生20疲劳。");
	text = text.replace(/Applies to your next attack during the same turn\./, "应用于本回合内的下次攻击。");
	text = text.replace(/For crossbows, the attack ignores the hitchance penalty from obstacles and the shot cannot go astray\./, "如果是弩则攻击无视障碍物的减益并且不会射偏。");
	text = text.replace(/For Handgonnes the attack has its Maximum Range increased by (.*?) and if used at a shorter range, the area of effect is increased by (.*?) instead\./, "如果是手炮那么最大射程增加 $1 格；如果在近距离射击那么影响范围增加 $2 格。");
	text = text.replace("You\'ve learned to fight in formation, trusting in the comrades to your front and sides to keep you safe while you go to work!", "你已经学会了依靠队形战斗，干活时相信前线的战友会确保你的安全！");
//	text = text.replace(/When using a ranged weapon and standing adjacent to an ally wielding a melee weapon who is not engaged in melee, gain (.*?) Ranged Skill, Ranged Defense, and Resolve. The bonus increases by (.*?) every turn up to a maximum of (.*?) as long as you continue to start your turn adjacent to any ally wielding a melee weapon who is not engaged in melee.\n• While entrenched, swapping between two ranged weapons becomes a free action once per turn\./, "使用远程武器并与一个未接敌的持有近战武器的友军相邻时，获得 $1 远攻，远程防御和决心。每回合开始时只要还于一个未接敌的持有近战武器的友军相邻就会额外获得 $2 ，最多至 $3 。\n• 处于固守状态时每回合还能无消耗切换一次远程武器。 ");
	text = text.replace(/When using a ranged weapon and standing adjacent to an ally wielding a melee weapon who is not engaged in melee, gain (.*?) Ranged Skill, Ranged Defense, and Resolve. The bonus increases by (.*?) every turn up to a maximum of (.*?) as long as you continue to start your turn adjacent to any ally wielding a melee weapon who is not engaged in melee\./, "使用远程武器并与一个未接敌的持有近战武器的友军相邻时，获得 $1 远攻，远程防御和决心。每回合开始时只要还于一个未接敌的持有近战武器的友军相邻就会额外获得 $2 ，最多至 $3 。");
	text = text.replace(/While entrenched, swapping between two ranged weapons becomes a free action once per turn\./, "处于固守状态时每回合还能无消耗切换一次远程武器。 ");
	text = text.replace("Learn where to aim to hinder your enemies the most!", "学会如何最大程度的阻碍你的对手！");
	text = text.replace(/Attacks from crossbows and firearms have a (.*?) chance to inflict Staggered for one turn, hits to the head always stagger targets\./, "弩和手炮的攻击有 $1 的概率使目标趔趄一回合，击中头部一定趔趄");

	text = text.replace(/Attacks from crossbows and firearms have a (.*?) chance to inflict Staggered for one turn\./, "弩和手炮的攻击有 $1 的概率使目标趔趄一回合。");
	text = text.replace("With a little tinkering, you\'ve managed to rig up sighting methods for your ranged weapons that allow more focused shots!", "对瞄准手段做一些一些小小的修补可以帮助你更好的瞄准目标。");
	text = text.replace(/Ranged attacks with crossbows and firearms have an additional (.*?) chance to hit the head\./, "弩和手炮的远程攻击有额外 $1 的概率命中头部。");
	text = text.replace("Nothing ruins your day quite like a bolt to the head!", "没有什么能比命中脑袋的一箭更能弄糟一天的好心情。");
	text = text.replace("Nothing ruins your day quite like a jolt to the head!", "没有什么能比命中脑袋的一箭更能弄糟一天的好心情。");
//	text = text.replace(/Ranged attacks that hit the head have a (.*?) chance to lower the target\'s morale by (.*?) level.\n• This chance is (.*?) when using crossbows\./, "命中头部的远程攻击有 $1 的概率降低目标 $2 士气。\n• 对于弩则是 $3 。");
	text = text.replace(/Ranged attacks that hit the head have a (.*?) chance to lower the target\'s morale by (.*?) level\./, "命中头部的远程攻击有 $1 的概率降低目标 $2 士气。");
	text = text.replace(/This chance is (.*?) when using crossbows\./, "对于弩则是 $1 。");
	text = text.replace("Windlass... crank... bolt... aim.. fire... repeat!", "绞盘，转动，插销，瞄准，开火，再来一遍！");
	text = text.replace("Load.. aim.. fire... repeat!", "装填，瞄准，开火，再来一遍！");
//	text = text.replace(/The Action Point Cost of reloading a crossbow is reduced by (.*?)\.\n• And that of reloading a Handgonne is reduced by (.*?)\./, "弩装填的行动点消耗降低 $1 ，\n• 手炮装填的行动点消耗降低 $2 .");
	text = text.replace(/The Action Point Cost of reloading a Handgonne is reduced by (.*?)\./, "手炮装填的行动点消耗降低 $1。");
	text = text.replace(/The Action Point Cost of reloading a crossbow is reduced by (.*?)\./, "弩装填的行动点消耗降低 $1。");
	text = text.replace(/And that of reloading a Handgonne is reduced by (.*?)\./, "手炮装填的行动点消耗降低 $1。");
//    text = text.replace(/When using daggers, attacks deal (.*?) more damage per ally surrounding the target.\n• Only works with daggers equipped in the Mainhand\./,"使用匕首时，目标周围每有一个友军就会额外造成 $1 伤害。\n• 只有当主手装备匕首时生效。");
    text = text.replace(/When using daggers, attacks deal (.*?) more damage per ally surrounding the target\./,"使用匕首时，目标周围每有一个友军就会额外造成 $1 伤害。");
    text = text.replace(/Only works with daggers equipped in the Mainhand\./,"只有当主手装备匕首时生效。");
//	text = text.replace(/When using a dagger, build up (.*?) less Fatigue and you gain (.*?) Action Points.\n• Only works with daggers equipped in the Mainhand\./,"使用匕首时，技能产生的疲劳降低 $1 并且获得 $2 行动点。\n• 只有当主手装备匕首时生效。");
	text = text.replace(/When using a dagger, build up (.*?) less Fatigue and you gain (.*?) Action Points\./,"使用匕首时，技能产生的疲劳降低 $1 并且获得 $2 行动点。");
	text = text.replace(/Only works with daggers equipped in the Mainhand\./,"只有当主手装备匕首时生效。");
//	text = text.replace(/A successful Puncture or Deathblow reduces the Action Point cost of the skill to (.*?) for the remainder of this turn.\n• Only works with daggers equipped in the Mainhand\./,"成功的刺穿或者致命打击减少这回合剩余时候技能 $1 点行动点消耗。\n• 只有当主手装备匕首时生效。");
	text = text.replace(/A successful Puncture or Deathblow reduces the Action Point cost of the skill to (.*?) for the remainder of this turn\./,"成功的刺穿或者致命打击减少这回合剩余时候技能 $1 点行动点消耗。");
	text = text.replace(/Only works with daggers equipped in the Mainhand\./,"只有当主手装备匕首时生效。");
	text = text.replace(/All attacks, melee or ranged, gain (.*?) chance to hit the head\./,"所有攻击，无论近战还是远程，获得 $1 几率命中头部。");
//	text = text.replace(/The efficacy of the target's Steel Brow perk is reduced by (.*?)\.\n• Damage inflicted from hits to the head is increased by (.*?)\./,"目标的钢头效果降低 $1 。\n• 击中头部造成的伤害增加 $2 。");
	text = text.replace(/The efficacy of the target's Steel Brow perk is reduced by (.*?)\./,"目标的钢头效果降低 $1 。");
	text = text.replace(/Damage inflicted from hits to the head is increased by (.*?)\./,"击中头部造成的伤害增加 $1 。");
//	text = text.replace(/Successful hits from Flails progressively reduce the target's Melee and Ranged Defense by a stacking (.*?) for one turn.\n• The effect is doubled if the attacks hit the head.\n• Missed attacks reduce the target\'s defense by (.*?) instead\./,"使用连枷时成功的攻击在一回合内每次逐步降低目标 $1 近战防御和远程防御。\n• 命中头部时效果翻倍。\n• 落空的攻击转而降低目标 $2 防御。");
	text = text.replace(/Successful hits from Flails progressively reduce the target's Melee and Ranged Defense by a stacking (.*?) for one turn\./,"使用连枷成功命中目标时，目标获得一层降低 $1 近战防御和远程防御的减益。持续一回合。");
	text = text.replace(/Successful hits from Flails progressively reduce the target's Melee and Ranged Defense by a stacking (.*?)\./,"使用连枷成功命中目标时，目标获得一层降低 $1 近战防御和远程防御的减益。");
	text = text.replace(/The effect is doubled if the attacks hit the head\./,"命中头部时效果翻倍。");
	text = text.replace(/Missed attacks reduce the target\'s defense by (.*?) instead. Targets lose (.*?) stacks at the start of every turn\./,"攻击未命中则降低目标 $1 防御，每回合开始目标消除$2层减益。");
	text = text.replace(/Missed attacks reduce the target\'s defense by (.*?) instead\./,"攻击未命中则目标的减益替换为 $1 防御。");
	text = text.replace(/When using flails, an additional random (.*?) of damage ignores armor\./,"使用连枷时，会额外造成 $1 穿甲伤害。");
//	text = text.replace(/Attacks with flails have a (.*?) chance to do a free extra attack.\n• This free attack does (.*?) reduced damage\./,"连枷的攻击有 $1 的概率额外进行一次攻击。\n• 这次免费攻击造成 $2 减弱的伤害。");
	text = text.replace(/Attacks with flails have a (.*?) chance to do a free extra attack\./,"连枷的攻击有 $1 的概率额外进行一次攻击。");
	text = text.replace(/This free attack does (.*?) reduced damage\./,"这次免费攻击造成 $1 减弱的伤害。");
//	text = text.replace(/Prepare to knock back and Baffle an opponent on your next attack.\n• Also causes the target to spend (.*?) additional Action Points per tile moved on their turn\./,"下次攻击准备击退并对敌人施加困惑。\n• 还会使目标下回合每格移动需要多消耗 $1 行动点。");
	text = text.replace(/Prepare to knock back and Baffle an opponent on your next attack\./,"下次攻击准备击退并对敌人施加困惑。");
	text = text.replace(/Also causes the target to spend (.*?) additional Action Points per tile moved on their turn\./,"还会使目标下回合每格移动需要多消耗 $1 行动点。");
	text = text.replace(/When attacking an opponent wearing armor, if an attack does at least (.*?) damage to Hitpoints, apply the Rattled effect which reduces the target\'s damage output by (.*?) for (.*?) turn\./,"攻击身着盔甲的敌人时，如果至少对生命值造成了 $1 点伤害，那么对目标施加咯吱咯吱的影响，在 $3 回合内降低目标 $2 伤害输出。");
//	text = text.replace(/The threshold to inflict injury from blunt damage attacks is reduced by (.*?) of the currently equipped weapon's armor effectiveness.\n• Blunt attacks can now apply injuries to the Undead\./,"钝器伤害的出伤阈值降低相当于当前装备武器破甲效率的 $1 。\n• 钝器攻击现在能使不死族受伤。");
	text = text.replace(/The threshold to inflict injury from blunt damage attacks is reduced by (.*?) of the currently equipped weapon's armor effectiveness\./,"钝器伤害的出伤阈值降低相当于当前装备武器破甲效率的 $1 。");
	text = text.replace(/Blunt attacks can now apply injuries to the Undead\./,"钝器攻击现在能使不死族受伤。");
//	text = text.replace(/When using Hammers an additional (.*?) of the damage ignores armor.\n• When using other blunt weapons, this bonus becomes active when the remaining combined head and body armor durability of the target is less than (.*?)\./,"使用锤时，造成额外 $1 穿甲伤害。\n• 使用其他钝器时，只有在目标身体和头部盔甲总耐久值低于 $2 时生效。");
	text = text.replace(/When using Hammers an additional (.*?) of the damage ignores armor\./,"使用锤时，造成额外 $1 忽略护甲伤害。");
	text = text.replace(/When using other blunt weapons, this bonus becomes active when the remaining combined head and body armor durability of the target is less than (.*?)\./,"使用其他钝器时，只有在目标身体和头部盔甲总耐久值低于 $1 时生效。");

	text = text.replace(/Every successful hit with a hammer causes the target to receive a stacking (.*?) \((.*?) for Two-Handed hammers\) additional damage ignoring armor from all sources for the remainder of the combat\./,"使用锤时每次成功的攻击使目标获得一层$1(双手锤是$2)护甲穿透伤害。持续至战斗结束，可以叠加。");
//	text = text.replace(/Every successful hit with a hammer causes the target to receive a stacking (.*?)\./,"使用锤时每次成功的攻击使目标获得一层可以增加受到所有伤害的护甲穿透  $1(双手锤是$2) 持续至战斗结束，可以叠加。");
//	text = text.replace("for Two-Handed hammers","对于双手锤");
//	text = text.replace("additional damage ignoring armor from all sources for the remainder of the combat","持续至战斗结束，可以叠加。");
	text = text.replace("Fatigue damage inflicted from successful hits is doubled.", "攻击命中时造成的疲劳影响效果翻倍。");
	text = text.replace("Successful hits with maces always apply the Baffled effect.", "使用棍棒时成功的攻击施加困惑效果。");
	text = text.replace(/Damage against enemies who have suffered a negative status effect such as Baffled, Dazed or Stunned etc. is increased by (.*?)\./,"攻击带有负面效果的敌人，比如困惑，茫然，眩晕，伤害增加 $1 。");
//	text = text.replace(/Hits to the head with any weapon apply Dazed for (.*?) turn. This duration is increased to (.*?) turns for One-Handed Maces.\n• Similar hits with a Two-Handed Mace stun the target for (.*?) turn, and if the target is immune to stun, apply Dazed instead for (.*?) turn\./,"任何武器命中头部都会施加茫然效果，持续 $1 回合。单手棍棒则会持续 $2 回合。\n• 类似的如果是双手棍棒则会眩晕目标 $1 回合。如果目标对眩晕免疫则转而施加茫然 $4 回合。");
	text = text.replace(/Hits to the head with any weapon apply Dazed for (.*?) turn. This duration is increased to (.*?) turns for One-Handed Maces\./,"任何武器命中头部都会施加茫然效果，持续 $1 回合。单手棍棒则会持续 $2 回合。");
	text = text.replace(/Similar hits with a Two-Handed Mace stun the target for (.*?) turn, and if the target is immune to stun, apply Dazed instead for (.*?) turn\./,"类似的如果是双手棍棒则会眩晕目标 $1 回合。如果目标对眩晕免疫则转而施加茫然 $2 回合。");
//	text = text.replace(/When using a mace, attacks that stun a target or are against an already stunned or rooted target have a (.*?) \((.*?) with Two-Handed maces\) chance to inflict a guaranteed injury.\n• If the damage was already sufficient to inflict an injury, it inflicts an additional injury.\n• All maces do (.*?) increased damage to Undead\./,"使用棍棒时，攻击如果会眩晕别人或者攻击已经眩晕的敌人有 $1 的概率必然造成一个伤口(双手棍棒是 $2 )。\n• 如果伤害已经可以造成一个伤口那么会再造成一个。\n• 对不死族的伤害提升 $3 。");
	text = text.replace(/When using a mace, attacks that stun a target or are against an already stunned or rooted target have a (.*?) \((.*?) with Two-Handed maces\) chance to inflict a guaranteed injury\./,"使用棍棒时，攻击如果会眩晕别人或者攻击已经眩晕或定身的敌人有 $1 的概率必然造成一个伤口(双手棍棒是 $2 )。");
	text = text.replace(/When using a mace, attacks that stun a target or are against an already stunned or rooted target that do at least (.*?) damage to Hitpoints have a (.*?) \((.*?) with Two-Handed maces\) chance to inflict a guaranteed injury\./,"使用棍棒时，攻击如果会眩晕别人或者攻击已经眩晕或定身的敌人并造成至少$1的生命伤害，有 $2 的概率必然造成一个伤口(双手棍棒是 $3 )。");

	text = text.replace(/If the damage was already sufficient to inflict an injury, it inflicts an additional injury\./,"如果伤害已经可以造成一个伤口那么会再造成一个");
	text = text.replace(/All maces do (.*?) increased damage to Undead\./,"对不死族的伤害提升 $1 。");
	text = text.replace(/When wielding a Polearm, increase the Resolve of adjacent allies by (.*?) of your Melee Skill\./,"使用长柄时，增加相邻友军相当于你 $1 近攻的决心。");
	text = text.replace(/Increase the Melee Defense, Ranged Defense and Initiative of adjacent allies by (.*?) of your total Melee Defense and Ranged Defense\./,"将你的近战防御、远程防御总值的$1作为邻近盟友的主动性、近战防御和远程防御的加成。");
	text = text.replace(/Increase the Resolve, Skills and Defenses of adjacent allies by (.*?) of your Level, to a maximum of (.*?)\./,"将相邻盟友的决心、技能和防御提升$1，最高提升$2。");
	text = text.replace(/If multiple polearm users with this perk are present, only the highest bonus applies\./,"如果多个长柄使用者有这个perk，只有最高者生效。");
	text = text.replace(/If multiple users with this perk are present, only the highest bonus applies\./,"如果多个使用者有这个perk，只有最高者生效。");

	text = text.replace(/At the start of your turn, if you are not engaged in melee, trigger a positive morale check for adjacent characters of your company with a penalty to Resolve equal to (.*?) of their Resolve\./,"在你的回合开始时，如果你没有参与近战，对你的同伴中的相邻敌人触发一次积极的士气检查，并对其进行相当于其决心$1的惩罚");
//	text = text.replace(/When using Two-Handed weapons, attacks at 2 tiles range have (.*?) chance to hit the head.\n• Does not apply to attacks at a range of 1 tile\./,"使用双手武器攻击距离两格的敌人时会获得额外 $1 概率击中头部。\n• 一格射程时不生效。");
	text = text.replace(/When using Two-Handed weapons, attacks at 2 tiles range have (.*?) chance to hit the head\./,"使用双手武器攻击距离两格的敌人时会获得额外 $1 概率击中头部。");
	text = text.replace(/Does not apply to attacks at a range of 1 tile\./,"一格射程时不生效。");
//	text = text.replace(/When using a two-handed weapon with a range of 2 tiles, and wearing head and body armor with a total penalty to Maximum Fatigue up to (.*?), gain (.*?) Melee Skill and all skills build up (.*?) less Fatigue.\n• For every 2 points of armor Fatigue above (.*?), you gain (.*?) increased Melee Damage but the other bonuses drop by (.*?) and can be negative at high enough armor fatigue\./,"使用距离为2的双手武器时，如果你盔甲的总重量低于 $1 ，则获得 $2 近攻并降低 $3 技能疲劳消耗。\n• 重量每超过 $4两点，获得 $5 近战伤害提升 但是其他收益减少 $6，当足够重时可以为负数。");	
	text = text.replace(/When using a two-handed weapon with a range of 2 tiles, and wearing head and body armor with a total penalty to Maximum Fatigue up to (.*?), gain (.*?) Melee Skill and all skills build up (.*?) less Fatigue\./,"使用距离为2的双手武器时，如果你盔甲的总重量低于 $1 ，则获得 $2 近攻并降低 $3 技能疲劳消耗。");	
	text = text.replace(/For every 2 points of armor Fatigue above (.*?), you gain (.*?) increased Melee Damage but the other bonuses drop by (.*?) and can be negative at high enough armor fatigue\./,"重量每超过 $1两点，获得 $2 近战伤害提升 但是其他收益减少 $3，当足够重时可以为负数。");	
//	text = text.replace(/Attacks from Polearms, hit or miss, reduce the Resolve of the target by (.*?) of your Melee Skill.\n• Multiple attacks from different sources stack but from the same source do not\./,"来自长柄的攻击，命中与否都会减少敌人相当于 $1 你的近攻的决心。\n• 来自不同来源的攻击可以叠加但是同一来源的不能。");
	text = text.replace(/Attacks from Polearms, hit or miss, reduce the Resolve of the target by (.*?) of your Melee Skill\./,"来自长柄的攻击，命中与否都会减少敌人相当于 $1 你的近攻的决心。");
	text = text.replace(/Attacks from Polearms, hit or miss, reduce the Resolve of the target by a stacking (.*?) of your Melee Skill\./,"来自长柄的攻击，命中与否都会减少敌人相当于你的近战技能 $1 的决心。");

	text = text.replace(/Multiple attacks from different sources stack but from the same source do not\./,"来自不同来源的攻击可以叠加但是同一来源的不能。");
	text = text.replace("When wielding a polearm, enemies within 2 tiles are considered surrounded by you for the purposes of hit-chance bonus for any allies attacking that target.","使用长柄时，两格内的敌军也视为被你包围，因此友军会获得额外的命中率。");
	text = text.replace(/When wielding a polearm, enemies within 2 tiles are considered surrounded by you for the purposes of hit-chance bonus for any allies attacking that target, besides the bonus to hitchance for each ally surrounding and distracting your target in melee is increased by (.*?)\./,"使用长柄时，两格内的敌军也视为被你包围，任何攻击此目标的友军会获得额外的命中率加成，此外，在近战中包围和分散目标注意力的每个盟友命中率增加$1。");

	//	text = text.replace(/Costs 4 AP and builds 30 Fatigue.\n• Can be used when using a Two-Handed weapon and not engaged in melee.\n• Until the start of your next turn, whenever an enemy in your attack range gets hit by an ally\'s melee attack, perform a free attack against that enemy with reduced damage.\n• The damage dealt is (.*?) for the first attack and is reduced by (.*?) for every next attack up to a minimum of (.*?)\.\n• These free attacks are non-lethal i.e. they cannot kill the target\./,"消耗4行动点并产生30疲劳。\n• 当使用双手武器且不接敌时可以使用。\n• 直到你的下个回合之前，攻击范围内敌人被友方近战攻击命中时，对其无消耗进行一次降低伤害的攻击。\n• 第一次伤害为 $1 ，之后每次降低 $2 ，最低至 $3 。\n• 这些攻击是非致命的，也就是说不会杀死敌人。");
	text = text.replace(/Costs 4 AP and builds 30 Fatigue\./,"消耗4行动点并产生30疲劳。");
	text = text.replace(/Can be used when using a Two-Handed weapon and not engaged in melee\./,"在使用双手武器且不进行近战时使用");
	text = text.replace(/Until the start of your next turn, whenever an enemy in your attack range gets hit by an ally\'s melee attack, perform a free attack against that enemy with reduced damage\./,"下个回合前攻击范围内敌人被友方近战命中时，也跟随攻击。");
	text = text.replace(/The damage dealt is (.*?) for the first attack and is reduced by (.*?) for every next attack up to a minimum of (.*?)\./,"第一次伤害为 $1 ，之后每次降低 $2 ，最低至 $3 。。");
	text = text.replace(/These free attacks are non-lethal i.e. they cannot kill the target\./,"这些攻击是非致命的，也就是说不会杀死敌人。");
	text = text.replace(/Gain (.*?) Ranged Skill as long as you have not moved during your turn\./,"如果你的回合没有移动则获得 $1 远攻。");
//	text = text.replace("Ranged attacks from Slings will stun the target on a hit to the head and apply Dazed on a hit to the body.\n• If the target is immune to stun, hits to the head instead apply Dazed and hits to the body apply Baffled.","使用投石器具的攻击命中头部将造成眩晕，命中身体将造成茫然。\n• 如果目标对眩晕免疫那么命中头部将造成茫然，命中身体将造成困惑。");
	text = text.replace("Ranged attacks from Slings will stun the target on a hit to the head and apply Dazed on a hit to the body.","使用投石器具的攻击命中头部将造成眩晕，命中身体将造成茫然。");
	text = text.replace("If the target is immune to stun, hits to the head instead apply Dazed and hits to the body apply Baffled.","如果目标对眩晕免疫那么命中头部将造成茫然，命中身体将造成困惑。");
	text = text.replace(/Damage from Ranged attacks is increased by (.*?) per tile the target is away from you\./,"目标每与你相距一格，远程攻击伤害提升 $1 。");
	text = text.replace(/Melee piercing attacks against an enemy without a shield gain (.*?) chance to hit\./,"近战穿刺攻击对抗未持盾的敌人获得 $1 命中率。");
	text = text.replace(/Melee piercing attacks ignore an additional (.*?) of the target's armor\./,"近战穿刺攻击获得额外 $1 护甲穿透。");
	text = text.replace(/When using a spear, the Action Point cost of Thrust, Prong and Glaive Slash is reduced by (.*?)\./,"使用矛时，戳，刺和宽刃刀劈砍的行动点消耗降低 $1 。");
	text = text.replace(/When using a spear, the Action Point cost of Thrust, Prong, Glaive Slash, Jab and Throw Javelin is reduced by (.*?)\./,"使用矛时，戳击，叉和刀刃挥砍,戳刺和掷标枪的行动点消耗降低 $1 。");
//	text = text.replace(/When using a shield with a One-Handed spear, gain (.*?) Melee Skill and (.*?) Melee Defense.\n• When double-gripping One-Handed spears, the range of Thrust is increased to 2 tiles. When used at this range, it does (.*?) reduced damage, has no bonus chance to hit, and has (.*?) chance to hit per character between you and the target.\n• Double-gripped One-Handed spears now gain benefit from the Reach Advantage perk.\n• When using Two-Handed spears, Melee Damage is increased by (.*?) for Piercing type attacks\./,"使用盾和单手矛时获得 $1 近攻和 $2 近战防御。\n• 双持单手矛时戳的射程增加至2格。当在2格范围攻击时，少造成 $3 伤害，没有命中加成并且你和目标中间每有一个敌人降低 $4 命中率。\n• 双持时能从双手优势获得收益。\n• 使用双手矛时穿刺类伤害增加 $5 。");
//	text = text.replace(/When using a shield with a One-Handed spear, gain (.*?) Melee Skill and (.*?) Melee Defense.\n• When double-gripping One-Handed spears, the range of Thrust is increased to 2 tiles. When used at this range, it does (.*?) reduced damage, has no bonus chance to hit, and has (.*?) chance to hit per character between you and the target.\n• Double-gripped One-Handed spears now gain benefit from the Reach Advantage perk.\n• When using Two-Handed spears, Melee Damage is increased by (.*?)\./,"使用盾和单手矛时获得 $1 近攻和 $2 近战防御。\n• 双持单手矛时戳的射程增加至2格。当在2格范围攻击时，少造成 $3 伤害，没有命中加成并且你和目标中间每有一个敌人降低 $4 命中率。\n• 双持时能从双手优势获得收益。\n• 使用双手矛时伤害增加 $5 。");
	text = text.replace(/When using a shield with a One-Handed spear, gain (.*?) Melee Skill and (.*?) Melee Defense\./,"使用盾和单手矛时获得 $1 近攻和 $2 近战防御。");
	text = text.replace(/When double-gripping One-Handed spears, the range of Thrust is increased to 2 tiles. When used at this range, it does (.*?) reduced damage, has no bonus chance to hit, and has (.*?) chance to hit per character between you and the target\./,"双持单手矛时戳的射程增加至2格。当在2格范围攻击时，少造成 $1 伤害，没有命中加成并且你和目标中间每有一个敌人降低 $2 命中率。");
	text = text.replace(/Double-gripped One-Handed spears now gain benefit from the Reach Advantage perk\./,"双持时能从双手优势获得收益。");
	text = text.replace(/When using Two-Handed spears, Melee Damage is increased by (.*?) for Piercing type attacks\./,"使用双手矛时穿刺类伤害增加 $1 。");
	text = text.replace(/When using Two-Handed spears, Melee Damage is increased by (.*?)\./,"使用双手矛时伤害增加 $1 。");
	text = text.replace(/When starting your turn with a Spear equipped, the first Thrust or Prong during your turn costs no Action Points and builds no Fatigue, but does (.*?) reduced Damage\./,"如果回合开始时装备着矛，那么回合内的第一次戳或者刺降不消耗行动点和疲劳，但是只造成 $1 伤害。");
	text = text.replace("The effect is lost upon switching your weapon.","切换武器时，效果会失效。");
	text = text.replace(/When wielding a sword, gain (.*?) damage, (.*?) armor penetration and (.*?) armor effectiveness\./,"装备剑时，获得 $1 伤害， $2 护甲穿透和 $3 破甲效率。");
//	text = text.replace(/Whenever an opponent misses a Melee attack against you, they are affected by the \'Exploitable Opening\' effect until their next turn, which gives you (.*?) chance to hit against them.\n• Makes the \'Riposte\' skill available on the Shamshir and One-Handed versions of Saif and Scimitar\./,"敌人对你近战攻击落空时会获得“破绽百出”影响持续至他们的下一回合，使得攻击他时给予你 $1 命中率加成。\n• 还会让舍施尔弯刀和单手版本的赛义夫弯刀和弯刀可以使用“还击”技能。");
	text = text.replace(/Whenever an opponent misses a Melee attack against you, they are affected by the \'Exploitable Opening\' effect until their next turn, which gives you (.*?) chance to hit against them\./,"敌人对你近战攻击落空时会获得“破绽百出”影响持续至他们的下一回合，使得攻击他时给予你 $1 命中率加成。");
	text = text.replace(/Whenever an opponent misses a Melee attack against you, they are affected by the \'Exploitable Opening\' effect until their next turn, which gives you (.*?) hit-chance and (.*?) armor penetration against them\./,"敌人对你近战攻击落空时会获得“破绽百出”影响持续至他们的下一回合，使得攻击他时给予你 $1 命中率 和 $2 穿甲加成。");

	text = text.replace(/Makes the \'Riposte\' skill available on the Shamshir and One-Handed versions of Saif and Scimitar\./,"还会让舍施尔弯刀和单手版本的赛义夫弯刀和弯刀可以使用“还击”技能。");
//	text = text.replace(/Initiative is increased by (.*?) of the currently equipped sword\'s armor ignore damage percentage.\n• The Fatigue Cost of weapon skills is reduced by (.*?) of the currently equipped sword\'s armor effectiveness\./,"主动值提升相当于当前装备剑的护甲穿透的 $1 。\n• 武器技能的疲劳值消耗降低相当于当前装备剑的穿甲效率的 $2 。");
	text = text.replace(/Initiative is increased by (.*?) of the currently equipped sword\'s armor ignore damage percentage\./,"主动值提升相当于当前装备剑的护甲穿透的 $1 。");
	text = text.replace(/The Fatigue Cost of weapon skills is reduced by (.*?) of the currently equipped sword\'s armor effectiveness\./,"武器技能的疲劳值消耗降低相当于当前装备剑的穿甲效率的 $1 。");
//	text = text.replace(/Every attack against a target who acts after you in the current round increases your Initiative by (.*?)\.\n• The bonus lasts over into your next turn but only until the first skill used or waiting that turn\./,"攻击这回合在你之后行动的敌人会使你增加 $1 主动值。\n• 加成持续到你的下个回合，不过直到你第一次使用技能或者等待之前。");
	text = text.replace(/The bonus lasts over into your next turn but only until the first skill used or waiting that turn\./,"加成持续到你的下个回合，不过直到你第一次使用技能或者等待之前。");
//	text = text.replace("Variable AP and Fatigue Cost.\n• Immediately after a successful attack, allows you to move one tile ignoring zone of control with reduced Action Point cost. However, the target tile for the movement must be adjacent to an enemy.\n• The Action Point cost is 2 less than the movement cost of your current tile. The Fatigue cost is equal to the movement cost of your current tile.\n• Only works with Two-Handed swords or with One-Handed swords with the offhand free.","动态的AP消耗和疲劳增加。\n• 成功命中敌人后可以无视敌人控制区域，并且降低行动点消耗的移动一格。\n• 目标地块必须紧邻一名敌人。行动点消耗相当于你原本的消耗-2，疲劳值消耗相当于原本的花费。\n• 仅对双手剑或者副手空闲时使用单手剑生效。");
	text = text.replace("Variable AP and Fatigue Cost.","动态的AP消耗和疲劳增加。");
	text = text.replace("Immediately after a successful attack, allows you to move one tile ignoring zone of control with reduced Action Point cost. However, the target tile for the movement must be adjacent to an enemy.","成功命中敌人后可以无视敌人控制区域，并且降低行动点消耗的移动一格。");
	text = text.replace("The Action Point cost is 2 less than the movement cost of your current tile. The Fatigue cost is equal to the movement cost of your current tile.","目标地块必须紧邻一名敌人。行动点消耗相当于你原本的消耗-2，疲劳值消耗相当于原本的花费。");
	text = text.replace("Only works with Two-Handed swords or with One-Handed swords with the offhand free.","仅对双手剑或者副手空闲时使用单手剑生效。");
//	text = text.replace(/When wielding a sword, if you have not moved from your position during your turn, use Riposte freely at the end of your turn if your weapon has Riposte.\n• If your weapon does not have Riposte, gain (.*?) Melee Defense instead until the start of your next turn\./,"在你的回合没有移动的情况下，如果你的武器拥有还击技能则无消耗的施放还击，\n• 如果没有则在你的下一回合之前获得 $1 近战防御。");
	text = text.replace(/When wielding a sword, if you have not moved from your position during your turn, use Riposte freely at the end of your turn if your weapon has Riposte\./,"在你的回合没有移动的情况下，如果你的武器拥有还击技能则无消耗的施放还击，");
	text = text.replace(/If your weapon does not have Riposte, gain (.*?) Melee Defense instead until the start of your next turn\./,"如果没有则在你的下一回合之前获得 $1 近战防御。");
	text = text.replace(/Melee AOE attacks gain (.*?) chance to hit and do (.*?) increased damage\./,"近战范围攻击获得 $1 命中率和 $2 伤害。");
//	text = text.replace(/When wielding a Two-Handed weapon, reduce the Melee Skill and Melee Defense of any enemy who enters your zone of control by (.*?) of your Melee Skill.\n• The debuff lasts until the enemy exits your zone of control or successfully hits you.\n• Only has half the effect against enemies with Two-Handed weapons, and does not work if the enemy also has this perk\./,"使用双手武器时，减少进入你控制区域的敌人近攻和近战防御，数值相当于你 $1 的近攻。\n• 效果持续到敌人离开你的控制区域或者成功击中你为止。\n• 对持有双手武器的敌人只造成一半效果，对同样拥有这个perk的敌人无效。");
	text = text.replace(/When wielding a Two-Handed weapon, reduce the Melee Skill and Melee Defense of any enemy who enters your zone of control by (.*?) of your Melee Skill, and half of that when hit enemies\./,"装备双手武器时，减少进入你控制区域的敌人近攻和近战防御，数值相当于你 $1 的近战技能。攻击敌人时效果减半。");
	text = text.replace(/When wielding a Two-Handed weapon, reduce the Melee Skill and Melee Defense of any enemy who enters your zone of control by (.*?) of your Melee Skill\./,"装备双手武器时，减少进入你控制区域的敌人近攻和近战防御，数值相当于你 $1 的近战技能。");
	text = text.replace(/The debuff lasts until the enemy exits your zone of control or successfully hits you\./,"效果持续到敌人离开你的控制区域或者成功击中你为止。");

	text = text.replace("Only has half the effect against enemies with Two-Handed weapons when they enters your ZOC, and does not work if the enemy also has this perk.","进入你控制区的敌人持有双手武器时只有一半效果，如果敌人同样拥有这个特技则无任何效果。");
	text = text.replace(/Only has half the effect against enemies with Two-Handed weapons, and does not work if the enemy also has this perk\./,"对持有双手武器的敌人只造成一半效果，对同样拥有这个特技的敌人无效。");
	//	text = text.replace(/AOE attacks lower the Melee Skill of any target hit for one turn. This reduction is (.*?) for targets with One-Handed weapons and (.*?) for targets with Two-Handed weapons.\n• Only half of this reduction applies if you act after the target in the current round\./,"范围攻击降低命中敌人的近攻一回合。使用单手武器的敌人 $1 ，使用双手武器的敌人 $2 。\n• 如果你这回合在敌人之后行动则只造成一半影响。");
	text = text.replace(/AOE attacks lower the Melee Skill of any target hit for one turn. This reduction is (.*?) for targets with One-Handed weapons and (.*?) for targets with Two-Handed weapons\./,"范围攻击降低命中敌人的近攻一回合。使用单手武器的敌人 $1 ，使用双手武器的敌人 $2 。");
	text = text.replace(/AOE attacks lower the Melee Skill, Resolve and Damage of any target hit for one turn. This reduction is (.*?) for targets with One-Handed weapons and (.*?) for targets with Two-Handed weapons\./,"范围攻击降低命中敌人的近攻、决心和伤害一回合。使用单手武器的敌人 $1 ，使用双手武器的敌人 $2 。");


	text = text.replace(/Only half of this reduction applies if you act after the target in the current round\./,"如果你这回合在敌人之后行动则只造成一半影响。");
//	text = text.replace(/Grants a (.*?) \((.*?) when using a Staff\) chance to apply Baffled on every hit, when your Initiative is higher than that of your opponent.\n• Does not work against enemies who are immune to Stun\./,"如果你主动性高于目标，攻击有 $1 概率使目标困惑(法杖为 $2 )。\n• 如果目标对眩晕免疫则无效。");
	text = text.replace(/Grants a (.*?) \((.*?) when using a Staff\) chance to apply Baffled on every hit, when your Initiative is higher than that of your opponent\./,"如果你主动性高于目标，攻击有 $1 概率使目标困惑(法杖为 $2 )。");
	text = text.replace(/Does not work against enemies who are immune to Stun\./,"如果目标对眩晕免疫则无效。");
//	text = text.replace(/Skills build up (.*?) less Fatigue when using Staves.\n• All attacks with Staves have a (.*?) chance \((.*?) with Staff Daze\) to apply Staggered on a hit.\n• This chance is 100% if the target already has 2 negative status effects \(stunned, dazed etc.\)./,"使用法杖时技能疲劳产生降低 $1 。\n• 所有攻击有 $2 的概率使目标趔趄(法杖茫然则是 $3 )。\n• 如果目标已经有两个负面状态则是100%。");
	text = text.replace(/Skills build up (.*?) less Fatigue when using Staves\./,"使用法杖时技能疲劳产生降低 $1 。");
	text = text.replace(/All attacks with Staves have a (.*?) chance \((.*?) with Staff Daze\) to apply Staggered on a hit\./,"所有攻击有 $1 趔趄(法杖茫然则是 $2 )。");
	text = text.replace(/This chance is (.*?) if the target already has 2 negative status effects \(stunned, dazed etc.\)./,"如果目标已经有两个负面状态则是$1。");
//	text = text.replace(/Increases the chance to apply Dazed.\n• Reduces the costs for Missile, Revolt, Entice, Chain Lightning and Firefield.\n• Staff Sweep gains (.*?) chance to hit\./,"增加施加茫然的概率。\n• 降低魔法飞弹，反抗，引诱，闪电链和火焰弹的消耗。\n• 法杖横扫获得 $1 命中率。");
	text = text.replace(/Increases the chance to apply Dazed\./,"增加施加茫然的概率。");
	text = text.replace(/Reduces the costs for Missile, Revolt, Entice, Chain Lightning and Firefield\./,"降低魔法飞弹，反抗，引诱，闪电链和火焰弹的消耗。");
	text = text.replace(/Staff Sweep gains (.*?) chance to hit\./,"法杖横扫获得 $1 命中率。");
//	text = text.replace(/Gain a chance that an enemy requires two successful rolls to hit you. This chance is (.*?) per negative status effect affecting the enemy \(e.g. dazed, baffled etc.\).\n• Successful attacks with Staves apply a negative status effect which cause the target to build (.*?) additional Fatigue on skills for 1 turn\./,"敌人的每个负面效果(比如眩晕，茫然)使他有额外 $1 的概率需要两次成功的投骰才能命中你。\n• 使用法杖时成功命中敌人会让他们一回合内技能多产生 $2 疲劳值。");
	text = text.replace(/Gain a chance that an enemy requires two successful rolls to hit you. This chance is (.*?) per negative status effect affecting the enemy \(e.g. dazed, baffled etc.\)\./,"敌人的每个负面效果(比如眩晕，茫然)使他有额外 $1 的概率需要两次成功的投骰才能命中你。");
	text = text.replace(/Successful attacks with Staves apply a negative status effect which cause the target to build (.*?) additional Fatigue on skills for 1 turn\./,"使用法杖时成功命中敌人会让他们一回合内技能多产生 $1 疲劳值。");
//	text = text.replace(/While wielding a staff, perform a free attack against anyone who misses an attack against you. This free attack has a (.*?) chance to hit.\n• Applies Baffled on the target if successful\./,"使用法杖时，对攻击未命中你的敌人无消耗施加一次普通攻击。这次攻击有 $1 命中率。\n• 如果命中使目标困惑。");
	text = text.replace(/While wielding a staff, perform a free attack against anyone who misses an attack against you. This free attack has a (.*?) chance to hit\./,"使用法杖时，对攻击未命中你的敌人无消耗施加一次普通攻击。这次攻击有 $1 命中率。");
	text = text.replace(/Applies Baffled on the target if successful\./,"如果命中使目标困惑。");
//	text = text.replace(/Gain (.*?) of your Base Ranged Skill as Melee Skill.\n• Additionally, when wielding a Throwing Weapon, gain (.*?) of your Base Melee Skill as Ranged Skill\./,"远攻获得相当于 $1 近攻的数值。\n• 如果使用投掷武器，近攻额外获得相当于 $2 远攻的数值。");
	text = text.replace(/Gain (.*?) of your Base Ranged Skill as Melee Skill\./,"远攻获得相当于 $1 近攻的数值。");
	text = text.replace(/Additionally, when wielding a Throwing Weapon, gain (.*?) of your Base Melee Skill as Ranged Skill\./,"如果使用投掷武器，近攻额外获得相当于 $1 远攻的数值。");
	text = text.replace(/Throwing attacks do (.*?) more damage and have their Action Point cost reduced by (.*?) per tile moved before throwing\./,"投掷前每移动一格投掷武器伤害增加 $1 ，并减少下次投掷 $2 行动点消耗。");
//	text = text.replace(/The Action Point cost of the first (.*?) Throwing attacks during a combat are (.*?)\.\n• During your first turn, the Action Point cost of moving on any terrain is reduced by (.*?) to a minimum of (.*?) and the Fatigue Cost is halved. These bonuses stack with the Pathfinder perk\./,"每场战斗前 $1 次投掷消耗行动点 $2 。\n• 第一回合在任何地形上移动消耗的行动点降低 $3 ，最少为 $4 ，疲劳消耗减半，和踏青叠加。");
	text = text.replace(/The Action Point cost of the first (.*?) Throwing attacks during a combat are (.*?)halved(.*?)\./,"每场战斗前 $1 次投掷消耗行动点$2减半$3。");
	text = text.replace(/During your first turn, the Action Point cost of moving on any terrain is reduced by (.*?) to a minimum of (.*?) and the Fatigue Cost is halved. These bonuses stack with the Pathfinder perk\./,"第一回合在任何地形上移动消耗的行动点降低 $1 ，最少为 $2 ，疲劳消耗减半，和踏青叠加。");
//	text = text.replace(/Every time you stand over an enemy's corpse, gain (.*?) ammo and restore (.*?) Action Points.\n• Does not work on the same corpse twice\./,"首次站在敌人遗体上时，获得 $1 弹药和 $2 行动点。\n• 不会在同一具尸体上起效两次。");
//	text = text.replace(/Every time you stand over an enemy's corpse, gain (.*?) ammo and restore (.*?) Action Points\./,"首次站在敌人遗体上时，获得 $1 弹药和 $2 行动点。");
	text = text.replace(/Does not work on the same corpse twice\./,"不会在同一具尸体上起效两次。");
//	text = text.replace(/When attacking a target at 2 tiles, gain (.*?) of your Melee Skill as additional chance to hit.\n• For piercing type throwing weapons, armor penetrating damage is increased by (.*?) of your Ranged Skill.\n• For cutting type throwing weapons, armor effectiveness is increased by (.*?) of your Ranged Skill.\n• For blunt type throwing weapons, has a (.*?) chance to apply Staggered, and if the target is already Staggered, to apply Stunned.\n• Only provides half the bonuses when attacking a target at 3 tiles, and no bonus at longer distances\./,"在两格攻击时，获得相当于 $1 近攻的额外命中率。\n• 穿刺类投掷武器获得相当于 $2 远攻的护甲穿透。\n• 劈砍类投掷武器获得相当于 $3 远攻的对护甲效率。\n• 钝器类投掷武器有 $4 的几率使敌人趔趄，如果敌人已经趔趄则造成眩晕。\n• 这些加成在3格距离时效果减半，更远距离则无效。");
//	text = text.replace(/When attacking a target at 2 tiles, gain (.*?) of your Melee Skill as additional chance to hit\./,"在两格攻击时，获得相当于 $1 近攻的额外命中率。");
	text = text.replace(/For piercing type throwing weapons, armor penetrating damage is increased by (.*?) of your Ranged Skill\./,"穿刺类投掷武器获得相当于 $1 远攻的护甲穿透。");
	text = text.replace(/For cutting type throwing weapons, armor effectiveness is increased by (.*?) of your Ranged Skill\./,"劈砍类投掷武器获得相当于 $1 远攻的对护甲效率。");
	text = text.replace(/For blunt type throwing weapons, has a (.*?) chance to apply Staggered, and if the target is already Staggered, to apply Stunned\./,"钝器类投掷武器有 $1 的几率使敌人趔趄，如果敌人已经趔趄则造成眩晕。");
	text = text.replace(/Only provides half the bonuses when attacking a target at 3 tiles, and no bonus at longer distances\./,"这些加成在3格距离时效果减半，更远距离则无效。");
	text = text.replace(/The chance to hit the head with ranged attacks is increased by (.*?) but reduced by (.*?) per tile of distance between you and the target\./,"远程命中头部的几率增加 $1 ，但是每与目标相距1格都会降低 $2 。");
	text = text.replace(/Whenever you are attacked, gain a stacking bonus to Melee and Ranged Defense of (.*?) on a miss and (.*?) on a hit. At the start of every turn the bonus is reset except the bonus gained from getting hit which is retained for the remainder of the combat. This retained bonus cannot be higher than (.*?)\./,"每次被攻击，如果闪避则增加 $1 近战防御和远程防御，如果被击中则增加 $2 。闪避带来的加成会在每回合开始时重置，被击中带来的加成在战斗的剩余阶段都有效。保留的加成不会超过 $3 。");
	text = text.replace(/Damage against targets who have sustained any injury effects, like a broken arm is increased by (.*?)\. Additionally, against targets who are stunned, netted, sleeping or debilitated, damage is increased by (.*?)\. Both bonuses stack\./,"对处于受伤状态的敌人，比如手臂折断，伤害增加 $1 ，对被网住，被缠绕的敌人伤害同样增加 $2。两种效果可以叠加。");
	text = text.replace(/Damage against targets who are Debilitated or have sustained any injury effects, like a broken arm is increased by (.*?)\./, "对虚弱或遭受任何伤害（如手臂骨折）的目标造成的伤害增加 $1。");
	text = text.replace(/Additionally, against targets who are stunned, netted, sleeping or debilitated, damage is increased by (.*?)\./,"对被网住，被缠绕的敌人伤害同样增加 $1。两种效果可以叠加。");
	text = text.replace(/Both bonuses stack\./,"两种效果可以叠加。");

//	text = text.replace(/Gain (.*?) Star to the talents in all attributes.\n• Then instantly gain a levelup to increase this character's attributes using normal rolls with talents.\n• Cannot increase the talent in an attribute beyond (.*?) stars.\n• The increased Talent stars only apply to levelups gained from Level 6 onwards\./,"所有属性增加 $1 星。\n• 随后以增加了天赋的随机roll点再进行一次升级加点。\n• 增加的天赋只会在 $2 级以后生效。");
	text = text.replace(/Gain (.*?) Star to the talents in all attributes\./,"所有属性天赋增加 $1 星。");
	text = text.replace(/Then instantly gain a levelup to increase this character's attributes using normal rolls with talents\./,"随后以增加了天赋的随机roll点再进行一次升级加点。");
	text = text.replace(/Cannot increase the talent in an attribute beyond (.*?) stars\./,"不能增加超过$1星属性天赋。");
	text = text.replace(/The increased Talent stars only apply to levelups gained from Level 6 onwards\./,"增加的天赋星只适用于从 6 级以上的升级。");
//	text = text.replace(/After killing an enemy, Melee Skill is increased by (.*?) and Ranged Skill by (.*?), up to a maximum of (.*?) for each.\n• The bonus drops by (.*?) if you get hit\./,"击杀敌人后近攻增加 $1 ，远攻增加 $2 ，最多增加至 $3 。\n• 如果你被击中则这些加成降低 $4 。");
	text = text.replace(/After killing an enemy, Melee Skill is increased by (.*?) and Ranged Skill by (.*?), up to a maximum of (.*?) for each\./,"击杀敌人后近攻增加 $1 ，远攻增加 $2 ，最多增加至 $3 。");
	text = text.replace(/The bonus drops by (.*?) if you get hit\./,"如果你被击中则这些加成降低 $1 。");
	text = text.replace(/Experience Gain is increased by (.*?) until Level 13, and by (.*?) after that\./,"直到13级前经验获取增加 $1 ，之后增加 $2 。");
	text = text.replace(/At Level 13, gain (.*?) perk points\./,"在13级时获得 $1 个特技点。");
//	text = text.replace(/Gain (.*?) Initiative, (.*?) Resolve, and (.*?) Melee Defense.\n• If your ally also has this perk, these bonuses are doubled, and whenever that ally gets attacked by an enemy in melee, your next melee attack against that enemy has (.*?) chance to hit.\n• When the effect is active, gain the Rotation skill even if you do not have the Rotation perk.\n• The Fatigue Cost of the first use of Rotation on your turn is halved, and if your ally also has this perk, it additionally costs no Action Points.\n• Only members of your mercenary company count as allies for this perk\./,"获得 $1 主动值， $2 决心和 $3 近战防御加成。\n• 如果这个友军也有这个perk，则效果翻倍，当这个友军被敌人近战攻击时，你对那个敌人的下次近战攻击获得 $4 命中率加成。\n• 当这个效果生效时，就算没学相关perk也会获得换位技能。\n• 回合内的第一次换位疲劳消耗减半。如果这个友军也有这个perk则还不消耗行动点。\n• 只计算你的队伍成员。");
	text = text.replace(/Gain (.*?) Initiative, (.*?) Resolve, and (.*?) Melee Defense\./,"获得 $1 主动值， $2 决心和 $3 近战防御加成。");
	text = text.replace(/If your ally also has this perk, these bonuses are doubled, and whenever that ally gets attacked by an enemy in melee, your next melee attack against that enemy has (.*?) damage and(.*?) chance to hit\./,"如友军也有这个特技，则效果翻倍，当这个友军被敌人近战攻击时，你对那个敌人的下次近战攻击获得 $1 伤害和 $2 命中率加成。");
	text = text.replace(/If your ally also has this perk, these bonuses are doubled, and whenever that ally gets attacked by an enemy in melee, your next melee attack against that enemy has (.*?) chance to hit\./,"如友军也有这个特技，则效果翻倍，当这个友军被敌人近战攻击时，你对那个敌人的下次近战攻击获得 $2 命中率加成。");
	text = text.replace(/When the effect is active, gain the Rotation skill even if you do not have the Rotation perk\./,"当这个效果生效时，就算没学相关特技也会获得换位技能。");
	text = text.replace(/The Fatigue Cost of the first use of Rotation on your turn is (.*?), and if your ally also has this perk, it additionally costs no Action Points\./,"回合内的第一次换位疲劳消耗是正常的 $1。如友军也有这个特技则不消耗行动点。");
	text = text.replace(/Only members of your mercenary company count as allies for this perk\./,"只计算你的队伍成员。");
	text = text.replace(/For every 2 tiles moved, the Action Point cost of your next attack is reduced by (.*?) to a minimum of (.*?), and the Fatigue Cost is reduced by (.*?)\./,"每移动两格都会使下次攻击AP消耗减少 $1 ，疲劳消耗减少 $2 。");
	text = text.replace(/Damage is increased by (.*?) when at (.*?) Fatigue. This bonus reduces to (.*?) when your Fatigue approaches (.*?) of Maximum Fatigue\./,"疲劳为 $2 的时候伤害增加 $1 。这些加成在你的疲劳达到最大疲劳值的 $4 时会减少至 $3 。");
//	text = text.replace(/Gain a stacking bonus to Melee Skill and Melee Damage for every successful attack.\n• Each stack provides (.*?) Melee Skill and increases Melee Damage by (.*?), up to a maximum of 10 stacks.\n• Attacks at 2 tiles range only grant a stack after two successful hits.\n• You lose half of the stacks if you miss an attack or if you get hit\./,"每次成功的攻击获得 $1 近攻和 $2 近战伤害加成，最多10层。\n• 如果你错过了一次攻击或被击中，你将失去一半的层数。\n• 攻击距离为2时每两次成功的攻击才会增加1层。");
	text = text.replace(/Gain a stacking bonus to Melee Skill and Melee Damage for every successful attack\./,"每成功攻击，获得近战技能和近战伤害的叠加加成。");
	text = text.replace(/Each stack provides (.*?) Melee Skill and increases Melee Damage by (.*?), up to a maximum of 10 stacks\./,"每层增加 $1 近战技能和 $2 近战伤害加成，最多10层。");
	text = text.replace(/Attacks at 2 tiles range only grant a stack after two successful hits\./,"攻击距离为2时每两次成功的攻击才会增加1层。");
	text = text.replace(/You lose half of the stacks if you miss an attack or if you get hit\./,"如果你错过了一次攻击或被击中，你将失去一半的层数。");
//	text = text.replace(/Gain a bonus to key combat attributes depending on how far their Base Values are below a certain thershold.\n• These attributes are increased by a percentage equal to the number of points they are below the threshold.\n• The threshold for Melee Skill and Ranged Skill is (.*?), for Melee Defense and Ranged Defense is (.*?), and for Resolve is (.*?)\.\n• Also grants (.*?) Training in camp\./,"根据一个特定的阈值获得战斗属性加成。\n• 这些加成相当于低于阈值差值的百分比。\n• 近攻远攻的阈值是 $1 ，近战防御远程防御的阈值是 $2 ，决心的阈值是 $3 。\n• 另外在营地还会获得 $4 训练速度加成。");
	text = text.replace(/Gain a bonus to key combat attributes depending on how far their Base Values are below a certain thershold\./,"根据一个特定的阈值获得战斗属性加成。");
	text = text.replace(/These attributes are increased by a percentage equal to the number of points they are below the threshold\./,"这些加成相当于低于阈值差值的百分比。");
	text = text.replace(/The threshold for Melee Skill and Ranged Skill is (.*?), for Melee Defense and Ranged Defense is (.*?), and for Resolve is (.*?)\./,"近攻远攻的阈值是 $1 ，近战防御远程防御的阈值是 $2 ，决心的阈值是 $3 。");
	text = text.replace(/Also grants (.*?) Training in camp\./,"另外在营地还会获得 $1 训练速度加成。");
	text = text.replace(/At the end of your turn, gain Melee Skill and Melee Defense equal to your remaining Action Points up to a maximum of (.*?)\. The bonus lasts until the end of your next turn\./,"在你回合结束时，获得相当于剩余行动点数的近战防御和远程防御加成，最多 $1 点。这些加成持续到你下回合结束。");
	text = text.replace(/Whenever you are attacked, hit or miss, gain a stacking (.*?) reduction to the Fatigue Cost of skills during your next turn, up to a maximum of (.*?) and (.*?) respectively\./,"每次闪避或者被击中时，使你下回合疲劳消耗减少 $1 ，分别最多叠加至 $2 和 $3。");
	text = text.replace(/Whenever you are attacked, hit or miss, gain a stacking (.*?) reduction to the Fatigue Cost of skills during your next turn, up to a maximum of (.*?)\./,"每次闪避或者被击中时，使你下回合疲劳消耗减少 $1 ，最多叠加至 $2 。");
	text = text.replace(/Whenever you are attacked, hit or miss, gain a stacking (.*?) Initiative and (.*?) reduction to the Fatigue Cost of skills during your next turn, up to a maximum of (.*?) and (.*?) respectively\./,"每次闪避或者被击中时，使你下回合主动值 $1 和疲劳消耗减少 $2 ，主动值最多 $3， 消耗最多减少 $4 。");
	text = text.replace(/Not usable when Inspired by an ally\'s \'Inspire\' skill\./,"当受到盟友“激励”技能的激励时，不可用。");
	text = text.replace(/Damage received to armor is reduced by (.*?)\./,"盔甲所受伤害降低 $1 。");
	text = text.replace(/Gain (.*?) Melee Skill, Ranged Skill, Melee  Defense and Ranged Defense for each adjacent ally\./,"每个相邻友军提供 $1 近战技能，近战防御，远程技能，远程防御。");
	text = text.replace(/At night, vision is increased by (.*?) and Melee Skill and Melee Defense are increased by (.*?)\./,"夜晚时视野增加 $1 ，近战防御近攻增加 $2 。");
	text = text.replace(/At night, vision is increased by (.*?) and Hitchances and Defenses are increased by (.*?)\./,"夜晚时视野增加 $1 ，命中和防御增加 $2 。");
	//	text = text.replace(/This perk remains inert until level 11.\n• Upon reaching level 11, it has a (.*?) chance of being replaced with \'Realized Potential\' which changes this character\'s background to Sellsword, increases all attributes by (.*?), unlocks new perk groups, and refunds all perk points, including the one spent on this perk.\n• If unsuccessful, it is replaced by \'Failed Potential\' which does nothing.\n• The success chance is reduced by (.*?) per perk point already spent before picking this perk. Perks obtained due to starting origin do not count towards reducing this chance\./,"这个perk保持到11级。\n• 11级时有 $1 的概率被替换为”实现潜能“，将这个人物背景改为雇佣兵，增加 $2 点所有属性并返还所有perk点数消耗，包括这个。\n• 如果没有成功则变为”未曾实现潜能“，没有任何效果。\n• 除了这个perk外每点一个perk降低 $3 成功率。角色通过起源自带的perk不算。");
	text = text.replace(/This perk remains inert until level 11\./,"这个特技效果保持到11级。");
	text = text.replace(/Upon reaching level 11, it has a (.*?) chance of being replaced with \'Realized Potential\' which will double this character\'s salary, increase all attributes by (.*?) to (.*?), unlock new perk groups, and refund all perk points, including the one spent on this perk\./,"11级时有 $1 的概率被替换为”实现潜能“，将使这个角色的薪水翻倍，所有属性增加 $2 ~ $3，解锁新的特技组，并退还所有特技点数，包括用于该特技的点数。");
	text = text.replace(/Upon reaching level 11, it has a (.*?) chance of being replaced with \'Realized Potential\' which will double this character\'s salary, increase all attributes by (.*?), unlock new perk groups, and refund all perk points, including the one spent on this perk\./,"11级时有 $1 的概率被替换为”实现潜能“，将使这个角色的薪水翻倍，所有属性增加 $2，解锁新的特技组，并退还所有特技点数，包括用于该特技的点数。");

	text = text.replace(/Upon reaching level 11, it has a (.*?) chance of being replaced with \'Realized Potential\' which changes this character\'s background to Sellsword, increases all attributes by (.*?), unlocks new perk groups, and refunds all perk points, including the one spent on this perk\./,"11级时有 $1 的概率被替换为”实现潜能“，将这个人物背景改为雇佣兵，所有属性增加 $2，解锁新的特技组，并退还所有特技点数，包括用于该特技的点数。");
	text = text.replace(/If unsuccessful, it is replaced by \'Failed Potential\' which does nothing\./,"如果没有成功则变为”失败潜能“，没有任何效果。");
	text = text.replace(/The success chance is reduced by (.*?) per perk point picked other than from (.*?)Pauper(.*?)\. Perks obtained due to starting origin do not count towards reducing this chance\./,"除了$2穷人$3特技组外，每选择一个特技，成功几率降低$1。角色通过起源自带的特技不算在内。");
	text = text.replace(/The success chance is reduced by (.*?) per perk point already spent before picking this perk. Perks obtained due to starting origin do not count towards reducing this chance\./,"在选择此特技之前，每个使用的特技点都会降低 $1 成功率。角色通过起源自带的特技不算在内。");
	text = text.replace("From rags to riches! This character has truly come a long way. Who was once a dreg of society and is now a full-fledged mercenary.","白手起家！这个角色的确取得了很大的进展。他们曾经流落街头不过现在已经是个完全合格的佣兵了。");
	text = text.replace("All perk points have been refunded, and attributes increased.","所有的特技点都被返还，所有属性也得到了提升。");


	text = text.replace("This character looked promising, but either due to bad luck or simply lack of talent, they have not shown the potential you thought they had. This perk does nothing.","这个人物看起来很有潜力，不过由于缺少点运气或者可能仅仅只是没有天赋，他们没有展现出你以为的潜能。虽然这个perk没用了，但是小满会一直等着大家慢慢进步的，现在快去把剩余的perk点完吧！");
//	text = text.replace("Trigger no Morale check on receiving damage.\n• If Realized Potential is a success, this perk becomes permanent and the perk point is refunded.","受到伤害不会再有士气检测。\n• 如果应允潜能成功了则这个perk永久保留并且返还消耗。");
	text = text.replace("Trigger no Morale check on receiving damage.","受到伤害不会再有士气检测。");
	text = text.replace("If Realized Potential is a success, this perk becomes permanent and the perk point is refunded.","如果实现潜能成功了则这个特技永久保留并且返还消耗。");
//	text = text.replace(/Resolve is increased by (.*?) against fear, panic and mind control effects.\n• If Realized Potential is a success, this perk becomes permanent and the perk point is refunded\./,"对抗恐惧，恐慌，精神控制时决心提升 $1 。\n• 如果应允潜能成功了则这个perk永久保留并且返还消耗。");
	text = text.replace(/Resolve is increased by (.*?) against fear, panic and mind control effects\./,"对抗恐惧，恐慌，精神控制时决心提升 $1 。");
	text = text.replace(/If Realized Potential is a success, this perk becomes permanent and the perk point is refunded\./,"如果实现潜能成功了则这个特技永久保留并且返还消耗。");
	text = text.replace(/Resolve is increased by (.*?) of the combined current durability of head and body armor\./,"获得相当于 $1 当前盔甲总耐久度的决心。");
//    text = text.replace(/This bonus is (.*?) against negative morale checks except mental attacks\./,"这个加成在除了精神攻击以外的负面士气检测时 $1 （翻倍）。");
	text = text.replace("Besides hitpionts is increase by the same bouns percentage of the combined maximum durability of head and body armor.", "除了决心，还会获得等同的生命值加成。");
	text = text.replace(/Armor penetrating damage to Hitpoints received from Ranged attacks is reduced by up to (.*?)\. This bonus increases exponentially by wearing head and body armor of higher Maximum Durability\./,"受到远程攻击的穿甲伤害减少 $1 。这个加成会随着盔甲总耐久值的上升而急速上升。");
//	text = text.replace("Equipping a Buckler or Parrying Dagger in the offhand no longer disables the armor penetration bonus from the Duelist perk.\n• Once per turn, switching a buckler, parrying dagger, or tool in your offhand costs no Action Points. Does not stack with Quick Hands.\n• Once per turn, the first use of the tool in your offhand costs no Action Points.","副手使用小圆盾或者防御匕首不会使‘决斗者’的护甲穿透加成失效。\n• 每回合一次，你可以不消耗AP点数在工具和小圆盾或者防御匕首之间切换。和‘快手’不叠加。\n• 每回合一次，第一次在你的副手中使用该工具不需要动作点数。");
	text = text.replace("Equipping a Buckler or Parrying Dagger in the offhand no longer disables the armor penetration bonus from the Duelist perk.","副手使用小圆盾或者防御匕首不会使‘决斗者’的护甲穿透加成失效。");
	text = text.replace("Once per turn, switching a buckler, parrying dagger, or tool in your offhand costs no Action Points. Does not stack with Quick Hands.","每回合一次，你可以不消耗AP点数在工具和小圆盾或者防御匕首之间切换。和‘快手’不叠加。");
	text = text.replace("Once per turn, the first use of the tool in your offhand costs no Action Points.","每回合一次，第一次在你的副手中使用该工具不需要动作点数。");
//	text = text.replace("Grants the bonuses of the weapon mastery perks for all One-Handed Melee and Throwing weapons whose perk groups this character has access to.\n• Once per turn, switching from one One-Handed Melee or Throwing weapon to another costs no Action Points.\n• Does not stack with Quick Hands.\n\nOnly works if you have picked at least one of the following weapon mastery perks: Axe, Cleaver, Dagger, Flail, Hammer, Mace, Spear, Sword, Throwing.","获得角色perk树上所有近战单手武器精通perk的收益。每回合一次，允许你不消耗行动点的在单手武器之间切换。\n• 和‘快手’不叠加。\n• 这个perk需要以下至少一个专精来生效：斧精通，砍刀精通，匕首精通，锤精通，棍棒精通，矛精通，剑精通。");
	text = text.replace("Grants the bonuses of the weapon mastery perks for all One-Handed Melee and Throwing weapons whose perk groups this character has access to.","获得角色特技树上所有近战单手武器精通特技的收益。");
	text = text.replace(/Once per turn, switching from one One-Handed Melee or Throwing weapon to another costs no Action Points and if the types of the two weapons are distinct, giving you a bonus to let the next attack with one-handed weapon cost (.*?) less Action Costs\./,"每回合一次，允许你不消耗行动点的在单手武器之间切换，如果这两种武器的类型不同，那么你将获得一个奖励，让下一次使用单手武器进行攻击的行动成本减少$1。");
	text = text.replace("Once per turn, switching from one One-Handed Melee or Throwing weapon to another costs no Action Points.","每回合一次，允许你不消耗行动点的在单手武器之间切换。");
	text = text.replace("Does not stack with Quick Hands.","和‘快手’不叠加。");
	
	text = text.replace(/One hand melee weapons now gain (.*?) benefits from (.*?)Close Combat Archer(.*?) and (.*?)Nailed It(.*?)\./,"单手近战武器现在从$2‘抵近射击’$3和$4‘钉牢它’$5处获得 $1 收益。");
	text = text.replace("Only works if you have picked at least one of the following weapon mastery perks: Axe, Cleaver, Dagger, Flail, Hammer, Mace, Spear, Sword, Throwing.","这个特技需要以下至少一个专精来生效：斧精通、砍刀精通、匕首精通、链枷精通、锤精通、棍棒精通、矛精通、剑精通、投掷精通。");
	text = text.replace(/Hitpoints, Maximum Fatigue, and Initiative are increased by (.*?) each\./,"生命值，最大疲劳值和主动值每项增加 $1 。");
	text = text.replace(/Fatigue Recovery is increased by (.*?) of your Maximum Fatigue after gear\./,"疲劳回复增加相当于 $1 着装后的最大疲劳值。");
	text = text.replace(/Lower the Resolve of adjacent enemies by (.*?)\./,"降低相邻敌人 $1 点决心值。");
	text = text.replace(/Melee Damage is increased by (.*?) per level of difference between your and your target\'s Morale as long as your Morale is higher than that of your target\./,"你的士气每比目标高1级则近战攻击增加 $1 伤害。");
//	text = text.replace(/Every time an opponent attacks you or you attack an opponent, gain stacking Melee Skill and Melee Defense against that opponent for the remainder of the combat.\n• Every subsequent attack gives a larger bonus, with the first attack giving (.*?), the second (.*?), the third (.*?), and so on.\n• Once the bonus reaches (.*?), all subsequent attacks increase it by (.*?) only.\n• Only works with dealing or receiving melee attacks\./,"对目标的每次攻击或者被攻击都会使你对他增加近攻和近战防御。\n• 接下来的每一次攻击都会获得更大的奖励，首次是 $1 ，第二次是 $2 ，第三次是 $3，依此类推，最多至 $4 。\n• 达到15后后续每次只会增加 $5 。\n• 这些加成持续到战斗结束。");
	text = text.replace(/Every time an opponent attacks you or you attack an opponent, gain stacking Melee Skill and Melee Defense against that opponent for the remainder of the combat\./,"对目标的每次攻击或者被攻击都会使你对他增加近战技能和近战防御。");
	text = text.replace(/Every subsequent attack gives a larger bonus, with the first attack giving (.*?), the second (.*?), the third (.*?), and so on\./,"接下来的每一次攻击都会获得更大的奖励，首次是 $1 ，第二次是 $2 ，第三次是 $3，依此类推，最多至 $4 。");
	text = text.replace(/Once the bonus reaches (.*?), all subsequent attacks increase it by (.*?) only\./,"达到$1后每次只会增加 $2 。");
	text = text.replace(/Only works with dealing or receiving melee attacks\./,"这些加成持续到战斗结束。");
	text = text.replace(/At the start of your turn, improve the Morale state of adjacent allies by (.*?) as long as their Morale state is lower than yours\./,"你回合开始时，如果相邻友军士气低于你便提高他们 $1 士气状态。");
	text = text.replace("Grants the benefits of the Shield Expert, Weapon Master, Reach Advantage, and Bloody Harvest perks without requiring these perks to be picked.","不需要选择直接解锁盾牌专家，武器大师，双手优势和血腥收割perk。");
	text = text.replace("Grants the benefits of the Shield Expert, Bags and Belts, Duelist, Quick Hands, and Bloody Harvest perks without requiring these perks to be picked.","不需要选择直接解锁盾牌专家，背包挎带，决斗者，快手和血腥收割等特技。");

	//	text = text.replace(/Once per day, when you visit a non-military settlement, gain between (.*?) and (.*?) gold.\n• For each level this character is above 1, these values are increased by (.*?)\.\n• The values are doubled for medium-sized settlements and tripled for large settlements.\n• If multiple characters with this perk are present, only one of them will entertain in a given city on a given day, and the others will have to entertain in other cities\./,"每天一次，访问非军事定居点时获得 $1 至 $2 金币。\n• 这个角色等级每超过1级都会额外增加 $3 。\n• 中等大小的定居点数额翻倍，大型定居点则是3倍。\n• 如果多个角色有这个perk，每天每座城市每人只会提供一次，其他人会在访问其他城市时提供。");
	text = text.replace(/Once per day, when you visit a non-military settlement, gain between (.*?) and (.*?) gold\./,"每天一次，访问非军事定居点时获得 $1 至 $2 金币。");
	text = text.replace(/For each level this character is above 1, these values are increased by (.*?)\./,"这个角色等级每超过1级都会额外增加 $1 。");
	text = text.replace(/The values are doubled for medium-sized settlements and tripled for large settlements\./,"中等大小的定居点数额翻倍，大型定居点则是3倍。");
	text = text.replace(/If multiple characters with this perk are present, only one of them will entertain in a given city on a given day, and the others will have to entertain in other cities\./,"如果多个角色有这个特技，每天每座城市每人只会提供一次，其他人会在访问其他城市时提供。");
	text = text.replace("At the start of every new day, improve the Mood of the character with the lowest Mood in your roster.","每天一次，增加战团中心情最低角色1点心情值。");
//	text = text.replace(/Melee Skill and Melee Defense are increased by (.*?) of your Maximum Fatigue after gear.\n• These bonuses drop exponentially when wearing head and body armor with a total penalty to Maximum Fatigue greater than (.*?)\./,"获得相当于着装后 $1 最大疲劳值的近战防御和近攻加成。\n• 这些加成会在盔甲重量大于 $2 时快速衰减。");
	text = text.replace(/Melee Skill and Melee Defense are increased by (.*?) of your Maximum Fatigue after gear\./,"获得相当于着装后 $1 最大疲劳值的近战防御和近攻加成。");
	text = text.replace(/These bonuses drop exponentially when wearing head and body armor with a total penalty to Maximum Fatigue greater than (.*?)\./,"这些加成会在盔甲重量大于 $1 时快速衰减。");
	text = text.replace(/Halves the Fatigue Cost of Lunge, Unarmed Lunge, Footwork and Leap. The Action Point cost of all these skills, except Lunge, is reduced by (.*?) and that of Leap is halved\./,"降低突刺、徒手猛冲、步法、跳跃一半疲劳消耗。徒手猛冲和步法的行动点消耗减少 $1 ，跳跃行动点消耗减半。");
//	text = text.replace(/Grants (.*?) Action Point.\n• Gain an additional (.*?) Action Point if under the effect of potions that improve cognition: Iron Will, Lionheart, Cat, Recovery or Hexen Ichor.\n• Does not work if you have Berserk or are dazed, drunk, hungover, taunted, staggered, horrified, concused or fleeing\./,"增加 $1 行动点。\n• 处于使用狮心药水，钢铁意志药水，猫药，回复药水和女巫灵液的状态下时再获得 $2 行动点。\n• 如果你有狂暴perk，或者茫然，趔趄，醉酒，宿醉，被嘲讽，惊骇，恐吓，逃跑则不生效。");
	text = text.replace(/Grants (.*?) Action Point\./,"增加 $1 行动点。");
	text = text.replace(/Gain an additional (.*?) Action Point if under the effect of potions that improve cognition: Iron Will, Lionheart, Cat, Recovery or Hexen Ichor\./,"处于使用狮心药水，钢铁意志药水，猫药，回复药水和女巫灵液的状态下时再获得 $1 行动点。");
	text = text.replace(/Does not work if you have Berserk or are dazed, drunk, hungover, taunted, staggered, horrified, concused or fleeing\./,"如果你有狂暴perk，或者茫然，趔趄，醉酒，宿醉，被嘲讽，惊骇，恐吓，逃跑则不生效。");
//	text = text.replace(/Gain (.*?) additional Melee and Ranged Defense for every (.*?) of missing hitpoints below (.*?)\.\n• When below (.*?) health this character becomes immune to the effects of subsequent injuries, and is not upset by health losses\./,"生命值低于 $3 时每损失 $2 便获得 $1 近战防御和远程防御。\n• 生命值低于 $4 时不会受新产生的伤口影响，并且损失生命值时也不会不安。");
	text = text.replace(/Gain (.*?) additional Melee and Ranged Defense for every (.*?) of missing hitpoints below (.*?), and (.*?) additional Action Point for every (.*?)\./,"生命值低于 $3 时每损失 $2 生命值。便获得额外 $1 近战防御和远程防御，每损失$5生命值获得 $4额外行动点。");
	text = text.replace(/Gain (.*?) additional Melee and Ranged Defense for every (.*?) of missing hitpoints below (.*?)\./,"生命值低于 $3 时每损失 $2 便获得 $1 近战防御和远程防御。");


	text = text.replace(/When below (.*?) health this character becomes immune to the effects of subsequent injuries, and is not upset by health losses\./,"生命值低于 $1 时不会受新产生的伤口影响，并且损失生命值时也不会不安。");
//	text = text.replace(/Costs 5 AP and builds 25 Fatigue.\n• Grants a (.*?) damage reduction and immunity to being stunned, knocked back, grabbed, swallowed or culled for one turn\./,"消耗5行动点并产生25疲劳。\n• 一回合内获得 $1 伤害减免并且免疫眩晕，击退，擒抱，吞咽和屠宰。");
	text = text.replace(/Costs 5 AP and builds 25 Fatigue\./,"消耗5行动点并产生25疲劳。");
	text = text.replace(/Grants a (.*?) damage reduction and immunity to being stunned, knocked back, grabbed, swallowed or culled for one turn\./,"一回合内获得 $1 伤害减免并且免疫眩晕，击退，擒抱，吞咽和屠宰。");
	text = text.replace("Costs 5 AP and builds 25 Fatigue.","消耗5行动点并产生25疲劳。");
	text = text.replace(/Grants a (.*?) damage reduction and immunity to being stunned, knocked back, grabbed, swallowed or culled for one turn\./,"一回合内获得 $1 伤害减免并且免疫眩晕，击退，擒抱，吞咽和屠宰。");
	text = text.replace("Base Resolve will also be doubled.","基础决心值翻倍。");
	
//	text = text.replace(/Swapping any item in battle a free action with no Action Point cost once every turn.\n• Does not work when swapping a shield, or when swapping from one Two-Handed melee weapon to another Two-Handed melee weapon\./,"每回合一次可以无消耗的切换物品。\n• 对盾牌或者双手武器切换双手武器无效。");
	text = text.replace(/Swapping any item in battle a free action with no Action Point cost once every turn\./,"每回合一次可以无消耗的切换物品。");
	text = text.replace(/Does not work when swapping a shield, or when swapping from one Two-Handed melee weapon to another Two-Handed melee weapon\./,"对盾牌或者双手武器切换双手武器无效。");
	text = text.replace(/Does not work when swapping a shield\./,"切换盾牌后失效。");

	text = text.replace("Looking for this?", "在找这个吗？");
//	text = text.replace("Costs 9 AP and builds 30 Fatigue.\n• Soothe an ally, doubling their Fatigue Recovery on their next turn.\n• Cannot be used when engaged in melee or on the same target two turns in a row.","消耗9行动点并产生30疲劳。\n• 让一个友军放松，使他们下回合疲劳值回复翻倍。\n• 不能在接敌使使用，也不能连续对一个目标使用两次。");
	text = text.replace("Costs 9 AP and builds 30 Fatigue.","消耗9行动点并产生30疲劳。");
	text = text.replace("Soothe an ally, doubling their Fatigue Recovery on their next turn.","让一个友军放松，使他们下回合疲劳值回复翻倍。");
	text = text.replace("Cannot be used when engaged in melee or on the same target two turns in a row.","不能在接敌使使用，也不能连续对一个目标使用两次。");
	text = text.replace(/Cannot be used when engaged in melee\./, "不能在接敌使使用");
	text = text.replace(/The threshold to inflict injury when using a Shamshir or the One-Handed versions of Saif and Scimitar is reduced by (.*?)\./,"舍施尔弯刀和单手版本的赛义夫弯刀和弯刀的出伤阈值降低 $1 。");
	text = text.replace(/The shield defense bonus is increased by (.*?)\. This also applies to the additional defense bonus of the Shieldwall skill\./,"盾牌防御加成提升 $1 。对盾墙带来的加成也有效。");
	text = text.replace(/Shield damage received is reduced by (.*?) to a minimum of 1\./,"盾牌所受伤害减少 $1 最低至1点。。");
	text = text.replace(/The \'Knock Back\' skill gains (.*?) chance to hit and applies \'Staggered\' on the target\./,"“击退”技能增加$1命中几率，并使目标‘趔趄’。");

	text = text.replace(/Gain (.*?) of your current hitpoints as additional minimum and maximum damage, up to 50\./,"获得相当于 $1 当前生命值的数值作为额外的最大伤害和最小伤害，上限为50。");
	text = text.replace("Hits to the head no longer cause critical damage to this character, which also lowers the risk of sustaining debilitating head injuries significantly.","被击中头部不会再受到额外伤害，显著降低了头部受伤减少战斗力的风险。");
	text = text.replace("Grants passive immunity against Cull.","对屠宰免疫。");
    text = text.replace(/Gain increased defense by balancing your armor\'s weight and mobility\. Gain (.*?) Melee Defense when wearing head and body armor with a total weight \(penalty to Maximum Fatigue\) of 35\. The bonus drops by (.*?) for every 2 points of deviation from this value, and for every 10 points that your Current Initiative is below twice your armor weight\. Gain a third of the Melee Defense bonus as Ranged Defense\./,"凭借平衡盔甲的重量和机动性来获得额外的防御。盔甲总重量为35时获得 $1 近战防御。每远离这个重量两点或者当前主动性低于两倍装备的重量十点时则降低 $2 点数值。获得近战防御的三分之一作为远程防御加成。");
    text = text.replace(/Gain increased defense by balancing your armor\'s weight and mobility\. Gain (.*?) Melee Defense and (.*?) Ranged Defense when wearing head and body armor with a total weight \(penalty to Maximum Fatigue\) of (.*?)\. Convert (.*?) Ranged Defense to Melee Defense for every 2 points of exceed this value, but drops by (.*?) for every 10 points that your Current Initiative is below twice your armor weight. Gain a third of the Melee Defense bonus as Ranged Defense. Besides reduced the penalty of your accumulated Fatigue to Initiative by (.*?)\./,"凭借平衡盔甲的重量和机动性来获得额外的防御。盔甲总重量为 $3 时获得 $1 近战防御和 $2 远程防御。每远离这个最佳重量两点则转换 $4 远程防御为近战防御，当前的主动值低于你护甲总重两倍时，每十点降低 $5 点加成。获得近战防御的三分之一作为远程防御加成，此外疲劳积累对主动值的惩罚降低$6。");

    text = text.replace("Leverage the superior fit of your armor to gain increased speed and endurance!","利用你盔甲的出众贴合度，提高速度和耐力！");
	text = text.replace(/Reduces the penalty to Initiative from head and body armor by (.*?) and lowers the Fatigue cost of skills by (.*?)\. This bonus is reduced exponentially when the total penalty to Maxium Fatigue from your head and body armor is more than half of your Maximum Fatigue after gear\./,"降低 $1 盔甲对主动性惩罚和 $2 的技能疲劳消耗。这些加成在重量大于着装后疲劳值一半时急速下降。");
	text = text.replace(/Reduces the penalty to Initiative from head and body armor by (.*?) and lowers the Fatigue cost of skills by (.*?)\. This bonus is reduced exponentially when the total penalty to Maximum Fatigue from your head and body armor is more than half of your Maximum Fatigue after gear\./,"降低 $1 盔甲对主动性惩罚和 $2 的技能疲劳消耗。这些加成在重量大于着装后疲劳值一半时急速下降。");
	text = text.replace("Specialize in Medium Armor! Not as nimble as some but more lithe than others!","擅长中甲！不像某些人那么敏捷，但比其他人灵活！");
	text = text.replace("Specialize in Medium Armor!","擅长中甲！");
	text = text.replace(/Damage to Armor and Hitpoints is reduced by (.*?) when the total penalty to Maximum Fatigue from head and body armor is between 25 and 35\. Outside this range, the bonus drops exponentially\./,"当盔甲重量在25至35之间时，降低 $1 生命值和护甲受到的伤害。在这个范围之外，收益指数下降。");
	text = text.replace(/As your armor takes damage, the bonus drops slowly to half its maximum value at 0 armor remaining\./,"当你盔甲受到伤害时这些加成会缓慢减少，当剩余护甲为0时减少至一半。");
	text = text.replace(/Gain a stacking buff that boosts your Melee Skill and Melee Damage by (.*?) up to a maximum of (.*?)\. You gain (.*?) when you dodge a Melee attack and lose (.*?) when you get hit by any attack\./,"获得一个叠加增益，提升你$1的近战技能和近战伤害，最多$2加成。每当你躲避近战攻击时获得 $2 加成，被近战击中时失去 $3 加成。");
	text = text.replace(/When engaged in Melee, the Melee Damage bonus is doubled, up to a maximum of (.*?), and the Melee Skill bonus is converted into Melee Defense bonus\./,"当与敌人接敌时近战伤害增加的那部分加成翻倍，最多为 $1，并且近战技能加成转换为近战防御加成。");

	text = text.replace(/When engaged in Melee, the Melee Damage bonus is doubled, up to a maximum of (.*?)\./,"当与敌人接敌时近战伤害增加的那部分收益翻倍，最多为 $1 。");
	text = text.replace(/If your Initiative is higher than twice your armor\'s weight \(penalty to Maximum Fatigue\), you start the battle with a bonus equal to your armor\'s weight above 15\./,"如果你的主动性高于盔甲重量的两倍，战斗开始时便获得相当于重量大于15的层数。");
	
//    text = text.replace(/When engaged in melee and equipped with a shield, gain (.*?) Melee Defense per adjacent ally holding a shield who is also engaged in melee.\n• When holding a shield and spear, additionally gain (.*?) Melee Skill per adjacent ally holding a shield who is also engaged in melee\./, "当持有盾牌接敌时，每有一个相邻的接敌的持盾友军获得 $1 近战防御。\n• 装备矛时每有一个相邻的接敌的持盾友军获得 $2 近攻。");
    text = text.replace(/When engaged in melee and equipped with a shield, gain (.*?) Melee Defense per adjacent ally holding a shield who is also engaged in melee\./, "当持有盾牌接敌时，每有一个相邻的接敌的持盾友军获得 $1 近战防御。");
	text = text.replace(/When holding a shield with spear or a shield with sword, additionally gain (.*?) Melee Skill per adjacent ally holding a shield who is also engaged in melee\./,"当手持矛盾或剑盾时，每一个持有盾牌并同时参与近战的相邻盟友额外获得$1近战技能。");

    text = text.replace(/When holding a shield and spear, additionally gain (.*?) Melee Skill per adjacent ally holding a shield who is also engaged in melee\./, "装备矛时每有一个相邻的接敌的持盾友军获得 $1 近攻。");
//	text = text.replace(/Skills build up (.*?) less Fatigue and gain (.*?) chance to hit when using a fencing sword.\n\nFor two-handed fencing swords the range of Lunge is increased by (.*?) tile.\n\nFor one-handed fencing swords, the Action Point costs of Sword Thrust, Riposte and Lunge are reduced by (.*?)\./,"使用刺剑时技能少产生 $1 疲劳。对于双手刺剑突刺距离增加 $2 格，对于单手刺剑，剑刺击，还击和突刺的行动点消耗减少 $3 点。");
	text = text.replace(/Skills build up (.*?) less Fatigue and gain (.*?) chance to hit when using a fencing sword\./,"使用刺剑时技能少产生 $1 疲劳,增加 $2 命中几率");
	text = text.replace(/For two-handed fencing swords the range of Lunge is increased by (.*?) tile\./,"对于双手刺剑突刺距离增加 $1 格。");
	text = text.replace(/For one-handed fencing swords, the Action Point costs of Sword Thrust, Riposte and Lunge are reduced by (.*?)\./,"对于单手刺剑，剑刺击，还击和突刺的行动点消耗减少 $1 。");
	
	//sundries
	text = text.replace(/After landing a hit, the next attack this turn does (.*?) overall damage. If the attack misses, the effect is lost\./,"成功命中后，本回合下次攻击造成$1额外伤害。如攻击落空效果消失。");
	text = text.replace("Throwing Spear now ignores the damage reduction from the target\'s Shield Expert perk.","投掷矛现在无视目标来自盾牌专家的伤害减免。");
	text = text.replace(/Also grants (.*?) hitpoints\./,"还会获得 $1 点生命值。");
	text = text.replace(/Undead cannot be injured, but you gain (.*?) damage against them\./,"不死族不会受伤，但是对抗他们时获得 $1 伤害加成。");
	text = text.replace("Grants passive immunity against being knocked back, pulled, grabbed or swallowed. Applies to skills such as Knock Back, Hook and others that change a character\'s position. Does not grant the damage reduction of indomitable, but also doesn\'t require activation.","被动的对击退，拉拽，擒抱和吞咽免疫，对击退，钩或者其他改变这个角色的技能也生效。不会获得不屈的伤害减免效果，但是也不需要主动激活。");
	text = text.replace(/The next hit is likely to kill you for good, of course, but improved defensive stats until your next turn helps you to survive until then. Also grants a one in nine chance to survive a fatal blow with an injury\./,"虽然下次受击很可能会杀死你，但是小满觉得下回合提升的防御能够很好的帮助你存活下来！另外还会获得九分之一的概率以受到一个伤口为代价在致命伤害中存活下来。");
    text = text.replace("Non-two-handed items placed in bags no longer give a penalty to Maximum Fatigue.","背包里的非双手武器不会再对最大疲劳值产生惩罚。");
	text = text.replace(/The \'Knock Back\' skill gains (.*?) chance to hit and applies \'Staggered\' on the target.\./, "击退技能获得 $1 命中率并且会使目标趔趄。");
	text = text.replace(/Additional damage ignores armor when performing a melee attack with a Base Action Point cost of (.*?) or less which is either \'Lunge\'' or has a maximum range of (.*?) tile\./,"单手近战武器行动点成本不超过 $1 的武器技能，或刺剑的突刺技能，又或者射程 $2 格的攻击都会获得额外护甲穿透。");	
	text = text.replace(/This bonus is (.*?) for one-handed weapons and (.*?) for two-handed weapons\./,"单手武器提高 $1，而双手武器提高 $2 。");	
	text = text.replace(/Gain a percentage of your Melee Skill as Melee Defense when engaged with a maximum of one or two enemies. (.*?) when engaged with one enemy, and (.*?) when engaged with two enemies\./,"当与一个或两格敌人接敌时获得相当于近攻一定比例的近战防御。与一个敌人接敌是 $1，与两个敌人接敌是 $2 。");	
    text = text.replace(/Attacks from hammers have a chance to dent the target's armor, reducing their Action Points by (.*?) for the remainder of the combat\./,"锤的攻击会凿烂目标的护甲。有概率使目标在剩余战斗时间里减少 $1 行动点。");
//    text = text.replace(/The chance is (.*?) for Two-Handed Hammers and (.*?) for One-Handed hammers\./,"双手锤是 $1 ，单手锤是 $2 。");
	text = text.replace(/The chance is (.*?) for Two-Handed Hammers and (.*?) for One-Handed Hammers\./, "双手锤的几率是$1，单手锤的几率是$2。");
	text = text.replace(/The chance is (.*?) for Two-Handed hammers and (.*?) for One-Handed hammers\./, "双手锤的几率是$1，单手锤的几率是$2。");
    text = text.replace("Only works when attacks hit armor whose maximum durability is greater than 200.","只对护甲总耐久度大于200的敌人生效。");
    text = text.replace(/Resolve is increased by (.*?) at all times. Additionally, at positive morale checks it is further increased by (.*?)\./,"决心值任何时候都增加 $1 。正面的士气检测时额外增加 $2 。");	
    text = text.replace(/When at Confident Morale, these bonuses are doubled, and additionally Melee Skill, Ranged Skill, Melee Defense, and Ranged Defense are increased by (.*?)\./,"当处于自信状态下时，这些加成翻倍，并且近攻，远攻，近战防御，远程防御再加 $1 。");
	text = text.replace(/Resolve is increased by (.*?) of the combined current durability of head and body armor\./,"获得相当于 $1 当前盔甲总耐久度的决心。");
	text = text.replace(/This bonus is (.*?)doubled(.*?) against negative morale checks except mental attacks\./,"这个加成在除了精神攻击以外的负面士气检测时$1翻倍$2。");
	text = text.replace("Besides hitpoints is increase by the same bouns percentage of the combined maximum durability of head and body armor.","此外，按头部和身体护甲最大耐久总值的百分比提升生命值。");


    text = text.replace(/Unlocks the \'Return Favor\' skill which when active has a (.*?) chance to stun and stagger any opponent missing a melee attack against this character in retaliation. Immunities and resistances against being stunned still apply\./, "解锁”以牙还牙“技能。激活时允许你有 $1 的概率反击并击晕对你近战攻击落空的敌人。敌人的免疫和抵抗依旧有效。");
	text = text.replace(/The Fatigue cost of getting hit or missed by regular attacks is reduced by (.*?)\. Attacks that specifically target fatigue are unaffected\./,"受击或者闪避攻击导致的疲劳消耗降低 $1 。专门造成疲劳的攻击效果将变得无效。"); 

//weird cases(they are moved to the adjacent area after being solved just for convenient)
	text = text.replace(/(.*?) for each action point available\. Recover can not be used if another skill is used\./,"每点剩余可用行动点回复 $1 。如果使用过另外的技能那么恢复会变得不可用。 ");

	//add on
//	text = text.replace(/Fatigue regeneration is increased by (.*?) per turn while over (.*?) fatigued\./, "当疲劳值超过$2时每回合疲劳恢复增加 $1 。");
	text = text.replace(/Once per turn, killing an opponent reduces current fatigue by (.*?) of the base maximum fatigue (before penalties due to armor are applied)\./, "每回合一次，击杀一个敌人时降低相当于 $1 着装前疲劳值的当前疲劳。");
	text = text.replace(/After receiving a blow, the next attack of this character will inflict (.*?) damage to both hitpoints and armor. If the attack misses, the effect is wasted\./, "受到伤害后，这个角色的下次攻击将对生命值和护甲造成 $1 伤害。如果攻击落空则效果会被消耗。");
	text = text.replace(/Unlocks the \'Debilitate\' skill which can prime your next attack to cripple a target for three turns, reducing their ability to inflict damage by (.*?)\./, "解锁”虚弱“技能，允许你下次攻击时目标残废三回合，降低他们 $1 的伤害输出。");	
	text = text.replace(/Effectiveness vs. Armor is increased by (.*?) for any weapon used\./, "任何武器的破甲效率增加 $1 。");
	text = text.replace(/Gain (.*?) chance to hit for all Melee area of effect attacks\./, "所有近战范围攻击获得 $1 命中率。");
	text = text.replace(/Grants (.*?) damage while wielding a battle standard. Grants allies a chance to start the battle at confident morale unless prohibited by character traits. The percentage chance for each ally to gain confident morale, (.*?) of your resolve. For each point of resolve below 100 there is a (.*?) chance the speech backfires and causes wavering morale\./, "装备战旗时获得$1伤害加成。使友方有相当于你$2决心值的概率以自信状态开始战斗除非他们特质不允许。但是决心每低于100一点都有$3的概率演讲会事与愿违，造成动荡的士气。");
	text = text.replace("Unlocks the \'Inspire\' skill which can push allies to go beyond their limits, granting them additional Action Points.", "解锁”激励”技能让友方超越极限，给予他们额外的行动点数。");
	text = text.replace("Unlocks the \'Sprint\' skill which allows you to quickly cover 4 tiles in a straight line, does not work across rough terrain or through enemy zones of control.", "解锁“冲刺”技能，允许你径直的快速移动四格，不能能在复杂地形使用也不能通过敌人的控制区域。");
	text = text.replace("Allies fleeing or dying no longer lowers this character\'s morale. This character gains 5% resolve for every fleeing character on the field, friend or foe.  Taking this perk also removes the superstitious, insecure and dastard traits.", "友方逃跑不会降低该角色士气。战场上每有一个逃跑的角色便获得5%决心，不分敌我。选择这个perk还会移除迷信（suoerstitious），不安（insecure）和怯懦（dastard）等特性。");
	text = text.replace("Being surrounded no longer affects this character\'s defences at all. Upgraded version of Underdog, immune to Backstabber.", "被包围不会再影响该角色的防御。升级版落单狗，对背刺无效。");
	text = text.replace(/Gain rage stacks over the course of a battle. Each stack increases Damage by (.*?), initiative by (.*?), resolve by (.*?) and reduces damage received by (.*?)\. Gain (.*?) stack each time you take damage, and (.*?) stacks each time you kill. Lose (.*?) rage stacks per turn\./, "随着战斗获得狂暴层数。每层增加 $1 伤害， $2 主动性， $3 决心并且所受伤害降低 $4 。每次承受伤害时获得 $5 层，击杀单位时获得 $6 层。每回合失去 $7 层。");
	text = text.replace(/Grants (.*?) additional stash spaces and (.*?) fatigue\./, "获得 $1 额外的库存和 $2 疲劳值。");
	text = text.replace(/Increases maximum ammunition storage by (.*?) and Ranged skill by (.*?)\./, "增加 $1 最大弹药储存和 $2 远攻。");
	text = text.replace(/Increases maximum ammunition storage by (.*?) and Ranged Defense by (.*?)\./, "增加 $1 最大弹药储存和 $2 远程防御。");
	text = text.replace(/Increases maximum medicine storage by 30 and resolve by (.*?)\./, "增加30点医药储存和 $1 决心。");
	text = text.replace(/Unlocks crafting bandages and medicine. Also increases maximum medicine storage by 10 and resolve by (.*?)\./, "解锁制作绷带和医药。还会增加10点医药储存和 $1 决心。");
	text = text.replace(/Increases maximum tool storage by (.*?), reduces tool usage by (.*?), and increases Fatigue by (.*?)\./, "增加 $1 工具储存，减少 $2 工具消耗并增加 $3 疲劳。");
	text = text.replace(/Increases maximum tool storage by (.*?), reduces tool usage by (.*?) and increases fatigue by (.*?)\./, "增加 $1 工具储存，减少 $2 工具消耗并增加 $3 疲劳。");
	text = text.replace("This characters skill with words makes their trade proposals more acceptable. Grants +1% barter skill, increasing sell prices, reducing buy prices and increasing pay for delivery contracts. Barter skill begins falling off at higher total rates.", "这种文字技巧使他们的交易建议更容易被接受。授予+1%易货技能，提高销售价格，降低购买价格，并增加交付合同的薪酬。易货技能开始以更高的总比率下降。");
	text = text.replace("This characters skill with words makes their trade proposals more acceptable. Grants +5% more pay for delivery contracts and generates 10 crowns a day - this effect can stack multiple times.", "这个角色的技巧使他们的交易中讨价更容易被接受。交付合同获得额外5%的报酬，每天产生10克朗-此效果可以叠加多次。");
	text = text.replace("This characters skill with words makes their trade proposals more acceptable.", "这个角色的技巧使他们的交易中讨价更容易被接受。");
	text = text.replace(/Increases Barter by (.*?)/, "增加 $1 交易的利润");
	text = text.replace(/Generate (.*?) each day/, "每天获得 $1");


	text = text.replace("This characters body language makes people believe them, leading to more favourable trade agreements. Grants +2% barter skill increasing sell prices, reducing buy prices and increasing pay for delivery contracts. Barter skill begins falling off at higher total rates.", "这种角色的肢体语言使人们相信他们，从而导致更有利的贸易协定。授予+2%易货技能，提高销售价格，降低购买价格，增加交付合同的支付。易货技能开始以更高的总比率下降。");
	text = text.replace("Lust for gold and self interest can be a double edged sword, an immediate benefit in one place, may come at the expense of others. Gain 7.5% barter, but divide all sources of barter bonus by 1 + the number of mercenaries with this perk.", "对黄金的欲望和私利可能是一把双刃剑，一个地方的直接利益可能会以牺牲其他地方为代价。获得7.5%易货技能，但将所有易货技能总值除以1+拥有这个特技的队友数量。");
	text = text.replace("Lust for gold and self interest can be a double edged sword, an immediate benefit in one place, may come at the expense of others.", "对黄金的欲望和私利可能是一把双刃剑，一个地方的直接利益可能会以牺牲其他地方为代价。");
	text = text.replace("This character is keen to guard the horde of gold the company has accumulated — and intends to protect it with their life.", "这个角色热衷于保护战队积累的大量黄金，并打算用他们的生命来保护它。");
	text = text.replace(/Gain (.*?) of your crowns(.*?) as Melee Skill and Ranged Skill/, "获得拥有克朗数$1点$2的近战和远程技能");
	text = text.replace(/Gain (.*?) of your gear value(.*?) as Melee Skill and Ranged Skill/, "获得$1装备价值$2的近战和远程技能");

	text = text.replace(/Gain (.*?) of your crowns(.*?) as Resolve/, "获得拥有克朗数$1点$2的决心");
	text = text.replace(/Gain (.*?) of your gear value(.*?) as Resolve/, "获得$1装备价值$2的决心");

	text = text.replace(/Gain (.*?) of your crowns(.*?) as Melee Defence and Ranged Defence/, "获得拥有克朗数$1点$2的近战和远程防御");
	text = text.replace(/Gain (.*?) of your gear value(.*?) as Melee Defence and Ranged Defence\./, "获得$1装备价值$2的近战和远程防御");
	text = text.replace(/All bonus will not exceed (.*?)\./, "所有加成将不超过$1。");

	text = text.replace(/The Bonus gained from Crowns above (.*?) is reduced by (.*?)/, "$1以上的克朗获得的增益减少$2。");
	text = text.replace(/Your global Barter is divided by (.*?)\(1 \+ Brothers with this perk\)(.*?) at all times\./, "任何时候你的总易货能力除以$1(1+拥有此特技的队友数)$2");
	
	text = text.replace("Grants +1% barter skill, increasing sell prices, reducing buy prices and increasing pay for delivery contracts. Barter skill begins falling off at higher total rates.", "获得1%交易系数，更好的交易价格并增加完成合同时的报酬。交易效率在较高水平会衰减。");
	text = text.replace("Grants +2% barter skill increasing sell prices, reducing buy prices and increasing pay for delivery contracts. Barter skill begins falling off at higher total rates.", "获得2%交易系数，更好的交易价格并增加完成合同时的报酬。交易效率在较高水平会衰减。");
	text = text.replace("Throw coins at your enemies to bribe them away from battle, only works on humans. The cost is the XP that would be granted by killing the enemy, to the power of 1.3.", "给敌人金币贿赂他们以让他们离开战斗，只对人类有效。消耗相当于击杀敌人经验的1.3倍。");
	text = text.replace("Allows this character to harvest wood while gathering in camp, also allows axes to harvest wood when breaking sticks during battle.", "该角色在露营执行收集任务时会收获木材，并且在战斗中使用斧破除障碍时会收获木材。");
	text = text.replace("Allows axes to cut down any tree during battle.", "可以在战斗中使用斧砍到树木。");
	text = text.replace("Allows sickles and one handed swords to harvest supplies while destroying bushes in battle.", "在战斗中用镰刀和单手剑摧毁灌木可以收获药材。");
	text = text.replace("Allows sickles and one handed swords to destroy bushes during battle.", "可以在战斗中使用镰刀和单手剑摧毁灌木。");
	text = text.replace("When targeting an enemy with more health than you, gain damage equal to their current hitpoints divided by your current hitpoints.", "瞄准生命值比你多的敌人时，获得相当于他当前生命值与你当前生命值的商的伤害加成。");
	text = text.replace("When falling below 50% health for the first time in each combat, will fully refresh your fatigue, grant +10 fatigue recovery for four turns and remove any Stun, Daze, Stagger, Baffle, Charmed or Sleeping status. Only occurs once per combat.", "生命值首次降到50%以下时，在4回合内获得10点疲劳值回复，还会移除眩晕，茫然，困惑，魅惑和催眠的状态。每场战斗只能触发一次。");
	text = text.replace(/Mark a target, reducing their ranged defense by (.*?) and melee defense by (.*?) for 3 turns\./, "标记一个目标，在三回合内目标近战防御 $1 ,远程防御 $2。");
	text = text.replace(/Mark a target, reducing their ranged defense by (.*?) for 3 turns\./, "标记一个目标，在三回合内降低他 $1 远程防御。");
	text = text.replace("Spend medicine to heal a unit on the battlefield, at a rate of 1 medicine for every 2 health. Heals up to 20 health per use.", "花费医疗用品在战场上医治一个单位，每点医疗用品回复2点生命值。每次使用最多消耗20医疗用品。");
	text = text.replace("Spend armor parts to repair armor on the battlefield, at a rate of 1 tool for every 5 durability. Repairs up to 20 durability per use.", "花费工具在战场上维修一个单位的盔甲，每点工具回复5点护甲值。每次使用最多消耗20工具。");
	text = text.replace("Spend 10 times a units daily wage to set them at confident morale.", "花费相当于一个单位10倍日薪的金币让他士气处于自信状态。");
	text = text.replace("On receiving extra payment, the recipient gains \'motivated\' for 3 turns.", "收到额外付款后，接受者获得‘激励’3回合。");

	text = text.replace(/Use advanced net throwing techniques to reduce the fatigue cost by (.*?) and reduce AP cost to (.*?)\./, "技能产生的疲劳减少 $1。");
	text = text.replace(/Accuracy with slings is increased by (.*?) and maximum firing range with slings is increased by (.*?)\. Fatigue cost for Slings reduced by (.*?)\./, "投石器的命中率提升 $1 ，最大射程提升 $2 。降低$3投石器的疲劳值产生。");
	text = text.replace(/Gain (.*?) Initiative\./, "获得 $1 主动值。");
	text = text.replace(/Grants a (.*?) chance to apply baffled on every hit with any weapon, when your Initiative is higher than that of your opponent\./, "主动性高于对手时，使用任何武器的攻击都会有 $1 的几率使敌人困惑。");
	text = text.replace(/Gain (.*?) Melee and Ranged skill, and (.*?) chance to hit the head when attacking a sleeping, stunned, netted, dazed, staggered or grappled enemy\,/, "攻击被催眠，网住，茫然，趔趄和擒抱着的敌人获得 $1 近战技能和远程技能，并且增加 $2 击中头部的概率。");
    text = text.replace("Spend less fatigue on skills for each point of Resolve over 60.", "决心值超过60时每点都会使你技能消耗更少的疲劳值。");
	text = text.replace("Grants a baseline 99% chance to break free from rooting effects, such as nets and webs.", "挣脱束缚的基础概率增加至99%，比如挣脱网和蛛网。");
	text = text.replace(/This character gains (.*?) resolve (.*?) experience gain, in exchange for (.*?) melee skill and ranged skill. Becomes content with being in reserve, and consumes half rations while there. When in combat this character gives (.*?) resolve and (.*?) XP gain to allies\./, "这个角色获得 $1 决心和 $2 经验获取，作为交换降低 $3 近攻和远攻。在后备时变得满足，只消耗一半配给。在战斗中时基于所有友军 $4 决心和 $5 经验获取速率。");
	text = text.replace("Gain a third of your character\'s base Ranged Defence as Ranged Skill, with a minimum bonus of 3.", "获得相当于远程防御的三分之一数值作为远攻，最低为3。");
	text = text.replace(/Grants (.*?) AP to an ally within three tiles. Can only be used with an Instrument or Banner equipped\./, "使三格内的一个友军获得 $1 行动点。只能在装备战旗或者乐器时使用。");
    text = text.replace(/Grants (.*?) melee and ranged defense while wielding a pure staffs or magic staffs\. (.*?) of this bonus is applied to other staffs and musical instruments\./, "装备完全的法杖时时获得 $1 近战防御和远程防御。其他法杖和乐器享受$2的效果。");
	text = text.replace("Costs 4 AP and builds 25 Fatigue.", "消耗4行动点并产生25疲劳。");
	text = text.replace("Allows you to knock back an enemy and take their place, all in one action.", "允许你可以击退一个敌人并占据他的位置。");
	text = text.replace("Costs 4 AP and builds 20 Fatigue.", "消耗4行动点并产生20疲劳。");
//	text = text.replace(/• Allows you to target an adjacent ally to allow them to move (.*?) tile ignoring Zone of Control on their turn.\n• While under cover, the target ally\'s position in the turn order is determined as if they had (.*?) Initiative.\n• The effect only remains active as long as you are adjacent to that ally\./, "• 消耗4行动点并产生20疲劳。允许你让相邻的目标友军在他的回合可以无视敌人控制区域的移动 $1 格。\n• 被掩护的友军在决定回合顺序时还会获得 $2 主动值。\n• 效果持续到那个友军离开你相邻地块为止。");
	text = text.replace(/Allows you to target an adjacent ally to allow them to move (.*?) tile ignoring Zone of Control on their turn\./, "消耗4行动点并产生20疲劳。允许你让相邻的目标友军在他的回合可以无视敌人控制区域的移动 $1 格。");
	text = text.replace(/While under cover, the target ally\'s position in the turn order is determined as if they had (.*?) Initiative\./, "被掩护的友军在决定回合顺序时还会获得 $1 主动值。");
	text = text.replace(/The effect only remains active as long as you are adjacent to that ally\./, "效果持续到那个友军离开你相邻地块为止。");
	text = text.replace(/Allows you to target an adjacent ally to allow them to move (.*?) tile ignoring Zone of Control on their turn\./, "允许你让相邻的目标友军在他的回合可以无视敌人控制区域的移动 $1 格。");
	text = text.replace(/While under cover, the target ally\'s position in the turn order is determined as if they had (.*?) Initiative\./, "被掩护的友军在决定回合顺序时还会获得 $1 主动值。");
	text = text.replace(/While under cover, the target ally\'s position in the turn order in the next round is determined as if they had (.*?) Initiative\./, "被掩护的友军在下一轮回合顺序决定后时还会获得 $1 主动值。");
	text = text.replace(/The effect only remains active as long as you are adjacent to that ally\./, "效果持续到那个友军离开你相邻地块为止。");
	text = text.replace("Being unencumbered allows you to move and strike with great accuracy.", "行动自如可以让你移动和非常准确的打击。");
	text = text.replace("By watching your opponent/\'s aim, you have more time to react.", "通过观察对手的目标，你有更多的时间做出反应。");
	text = text.replace("You\'ve learned how to escape from sticky situations.", "你已经学会了如何摆脱棘手的情况。");
	text = text.replace(/the Action Point cost of the first skill used every turn is (.*?)halved(.*?) and its Fatigue Cost is reduced by (.*?)\./, "每回合第一个技能的行动点消耗$1减半$2，疲劳消耗减少$3。");
	text = text.replace(/As long as your current Fatigue is below (.*?) of Maximum Fatigue after gear, the Action Point cost of the first skill used every turn is (.*?)halved(.*?) and its Fatigue Cost is reduced by (.*?)\./, "只要当前的疲劳低于最大疲劳的$1，每个回合开始第一个技能的行动点成本将$2减半$3，其疲劳成本减少$4");
	text = text.replace(/Turns other than consuming this effect, gain (.*?) stack for every 2 Action Points left\(round up\) or used for moving tiles, up to a maximum of every (.*?) stamina retained\./, "消耗此效果的之后回合，回合结束时每剩余2个行动点(四舍五入)或用于移动的行动点、每剩余$2疲劳可获得 $1层充能。");
	text = text.replace(/Become disabled when using this effect and enabled when generates (.*?) stacks\./, "此技能使用后变为禁用，当获得 $1 层充能时重新激活。");



	text = text.replace("The period of vigor at the beginning of the fight is when you do the most damage!", "战斗开始时的活力期是你造成最大伤害的时候！");
	text = text.replace("Glide through battle like a leaf in a stream.", "像溪流中的一片叶子一样滑过战场。");
	text = text.replace("Your will to live is strong!", "你活下去的意志很坚强");
	text = text.replace("\'This is the hill that you will NOT die on!\'", "'这是你不会死的山！'");
	text = text.replace("Off with their heads!", "砍掉他们的头！");
	text = text.replace("Ankles, hands, elbows and knees, you've learned how to fight dirty to secure victory.", "脚踝、手、肘部和膝盖，你已经学会了如何用脏衣服来确保胜利。");
	text = text.replace("\'It is our destiny!\'", "'这是我们的命运！'");
	text = text.replace("Hold yourself in a way that makes you seem more trouble than its worth, lean into trees, place objects between you and an enemy, and hide behind allies. Makes enemies less likely to attack you instead of an ally, also grants +5 Ranged Defense and +3 Melee Defense.", "以一种让你看起来更麻烦的方式控制自己，靠在树上，在你和敌人之间放置障碍物，并躲在盟友后面。使敌人不太可能攻击你而去攻击你的盟友，同时给予+5远程防御和+3近战防御。");
	text = text.replace("Master the art of concealment. When you are outside enemy vision you can blend in with your surroundings and remain hidden from the enemy for 3 turns, or until your next attack.", "掌握隐藏的艺术。当你在敌人视野之外时，你可以与周围环境融为一体，并在3个回合内对敌人保持隐藏状态，或者直到你的下一次攻击。");
	text = text.replace("Staying hidden is about more than just clever disguise, one must be prepared to avoid stray blows and arrows in the heat of battle. Extends your camouflage by two turns.", "隐藏不只是巧妙的伪装，人们必须做好准备，在激烈的战斗中避免误打误箭。将伪装回合延长两轮。");
	text = text.replace("Extends your camouflage by two turns.","延长你的伪装2回合。");
	text = text.replace("You don't know where it came from, but you've suddenly started excelling at everything you do!", "你不知道它是从哪里来的，但你突然开始擅长你所做的一切！");
	text = text.replace("The next one's gonna be even easier!", "下一个会更容易！");
	text = text.replace("Lesser men may cower and flee, but you are unassuageable in your commitment. Allies fleeing or dying no longer lowers this character\'s morale. This character gains 5% resolve for every fleeing character on the field, friend or foe. Taking this perk also removes the superstitious, insecure, craven and dastard traits.", "小人物可能会畏缩逃跑，但你的承诺是不可原谅的。逃离或死亡的盟友不再降低这个角色的士气。该角色在战场上的每个逃跑角色，无论是朋友还是敌人，都会获得5%的决心。享受这项福利还可以消除迷信、不安、胆小和畏缩的特质。");
	text = text.replace("Push your body beyond what is humanly possible through your sheer force of will.", "通过你纯粹的意志力，把你的身体推到人类的极限。");
	text = text.replace("Not all folks are built for war, some find contentment in contemplation or practicing a trade.", "并不是所有的人都是为战争而生的，有些人在沉思或实践一项交易中感到满足。");
	text = text.replace("Pay close attention at all times, surveying the surroundings and assessing every clue for an insight.", "始终密切关注，观察周围环境，评估每一条线索，以获得洞察力。");
	text = text.replace("Only one ally within 2 tiles who has no other ally within 2 tiles", "在2格内的只有一个盟友");
	text = text.replace("You've learned that you fight best with a buddy to watch your back!", "你已经知道，为了保护自己，你最好和朋友一起战斗！");
	text = text.replace("You've learned to use the very momentum of your movement as a weapon unto itself!", "你已经学会了利用你运动的动力作为武器！");
	text = text.replace("The bonus is lost upon waiting or ending your turn, using any skill, or swapping your weapon except to or from a throwing weapon.", "等待或结束回合、使用任何技能或交换武器（投掷武器除外）时，效果消失。");
	text = text.replace("The effect stacks with each attack, and can be applied to multiple targets at once with a single attack.", "每次攻击时效果叠加，一次攻击可同时应用于多个目标。");
	text = text.replace("Learn how to strike best at your targets' armor to destroy it as fast as possible.", "学习如何最好地攻击目标的装甲，以尽可能快地摧毁它。");
	text = text.replace("Melee or Throwing Weapon Attack", "近战、投掷武器攻击");
	text = text.replace("Arranging gear in just the right way, you're able to squeeze more things into the same space.", "正确的方式安排装备，你就能把更多的东西挤到同一个空间里。");
	text = text.replace("Balancing things is an art, by creating neat stacks and tying them down well you can carry more gear.", "平衡事物是一门艺术，通过创建整齐的堆栈并将其向下压实，你可以携带更多装备。");
	text = text.replace("Fighting is a brutal thuggish pastime, most folk prefer a life without frequent bouts of extreme violence.", "打斗是一种残忍的暴徒消遣，大多数人喜欢没有频繁的极端暴力的生活。");
	text = text.replace("'I can take it!'", "‘我能经受得住’");
	text = text.replace("Give back what they give to you tenfold!", "把他们给你的十倍还给他们！");
	text = text.replace("Revenge is a dish best served with a vengeance.", "复仇这道菜吃得最痛快。");
	text = text.replace("'Mountains cannot be moved, nor taken down!'", "‘山不能移，也不能倒！’");
	text = text.replace("'It's not uncommon to make it to the end of the battle not remembering any details, just that you slew many men!'", "‘战斗结束时不记得任何细节并不罕见，只是你杀了很多人！’");
	text = text.replace("Captain told you to focus on the basics, trying fancy stuff is only going to get you killed!", "队长让你专注于基础，尝试新奇的东西只会让你丧命！");
	text = text.replace("Just like dancing with your nan when you were young.", "就像你年轻时和奶奶跳舞一样。");
	text = text.replace("'On the battlefield, you must always be ready to defend at a moment's notice, or strike at a narrow opportunity!'", "‘在战场上，你必须随时准备好随时防御，或者抓住机会发动攻击！’");
	text = text.replace("Years of combat training have given you insight into the most efficient way of carrying yourself on the battlefield.", "多年的战斗训练让你洞察了战场上最有效的作战方式。");
	text = text.replace("All Fatigue build-up is reduced by", "所有疲劳累积减少");
	text = text.replace("'Faster than time itself!'", "‘比时间还快！’");
	text = text.replace(/Use your way with song to cheer on an ally\. Grants (.*?) Action Points to an ally adjacent to you\. Costs 4 Action Points to perform\. Can only be used with an Instrument or Banner equipped\./, "用你的歌声为盟友加油。花费4个行动点为你附近的盟友提供$1个行动点。需要装备乐器或战旗才能使用。");
	text = text.replace("'Get back in there or I'll kill you myself!'", "‘回去，否则我会亲手杀了你！’");
	text = text.replace("Standing next to the company's banner inspires your men to go beyond their limits!", "站在战旗旁激励你的员工超越极限！");
	text = text.replace(/Any member of your company who is adjacent to an enemy, or is adjacent to an ally who is adjacent to an enemy, gains (.*?) Action Points as long as they start their turn adjacent to you\./, "任何与敌人相邻的队友，或与队友相邻的盟友傍边有敌人时，只要他们在你附近开始他们的回合，就获得$1行动点。");
	text = text.replace("Learning the plants of the healing trade allows you to fashion crude healing supplies from common ingredients.", "学习药草知识可以让你用普通原料制作粗糙的治疗用品。");
	text = text.replace("Learning the ways of the cast takes practice, holding the net in the right position and twisting at the hips allows you to cover a greater distance with each cast.", "学习投网需要练习，将网保持在正确的位置并在臀部扭动，这样每次投网都能更远。");
	text = text.replace(/Spend medicine to heal a unit on the battlefield, at a rate of 1 medicine for every 2 health\. Heals up to (.*?) health per use\./, "在战场上用药品治疗一个单位，每2生命值消耗1次药品。每次最多可恢复$1生命值。");
	text = text.replace("Many years spent repairing and packing nets allows you to create nets and wield them more effectively.", "经过多年的修理和包装投网，你可以更有效地制作和使用投网了。");
	text = text.replace(/Others see it as magic, but your deft hands know better\. Grants a baseline (.*?) chance to break free from rooting effects, such as nets and webs and reduces the Action Point cost of breaking free yourself and your allies by (.*?)\./, "其他人认为这是魔法，但你灵巧的手更清楚。给予底线$1的几率摆脱投网和蜘蛛网等的束缚效果，解除自己和盟友的行动点降低$2。");
	text = text.replace("A good company chef can make a meal from whatever can be scrounged up, and have it in your belly before camp breaks. Unlocks a chance to get better food rewards when this character hunts in camp. The chance and rewards increase as you level up. Includes porridge, pies and puddings.", "一个好的队伍厨师可以用任何能搜到的材料做一顿饭，并在营地休息前把它放在你的肚子里。当这个角色在营地狩猎时，解锁一个获得更好食物奖励的机会。机会和回报会随着你的等级提高而增加。包括粥、馅饼和布丁。");
	text = text.replace("There is a fine art to cooking, skills and ingredients that are not obvious but unlock a world of flavor or preserve food for longer.", "烹饪是一门艺术，烹饪技巧和食材并不明显，但可以打开一个充满味道的世界，或者让食物保存更长时间。");
	text = text.replace("Any camp worth its salt will have an alcohol still fashioned out of whatever can be pulled together. Unlocks a chance to get alcohol as a reward when this character hunts in camp. The rewards increase as you level up. Includes beer, wine and mead. Also allows alcohol crafting in the crafting tent.", "任何值得呆的营地都会有一种酒类，它仍然是用任何可以混合在一起的东西制成的。当这个角色在营地狩猎时，解锁一个获得酒类奖励的机会。奖励会随着你等级的提高而增加。包括啤酒、葡萄酒和蜂蜜酒。也可以在制作帐篷中进行酒类制作。");
	text = text.replace("Meal planning and preparation is the key to avoiding wastage. By cooking bulk meals, using scraps and saving leftovers you can save food for the company.", "用餐计划和准备是避免浪费的关键。通过烹饪大餐，使用残羹剩饭，你可以为队伍节省食物。");
	text = text.replace("Make liberal use of alcohol and food to motivate your mercenaries. Spend 20 food to take someone from wavering to steady, cannot be applied to someone who has already been rallied.", "可以使用酒精和食物来激励你的雇佣兵。花20个食物把一个人从动摇变成稳定，不能对已经被召集起来的人使用。");
	text = text.replace("Organising your tools into labeled compartments lets you carry more.", "把你的工具整理成贴有标签的隔间可以让你携带更多。");
	text = text.replace("Your experience with repairs has taught you to save your scraps and left over parts. These spares take up little space but are often just what you need for field repairs.", "你的维修经验教会了你如何保存废品和剩余零件。这些备件占用的空间很小，但通常正是现场维修所需的。");
	text = text.replace("Every person has their price.", "每个人都有他的价格");
	text = text.replace("You've never met a problem that money couldn't solve.", "你从未遇到过金钱无法解决的问题。");
	text = text.replace("You have a way with dogs, the bond you form with them imbues each dog with more confidence and strength, knowing that you are there gives them strength. Grants each dog you unleash the perks Colossus, Fortified Mind and Underdog.", "你和狗相处得很好，你和它们形成的纽带给每只狗注入了更多的信心和力量，知道你在那里会给它们力量。授予你释放的每只狗巨人、强化思想和落单狗的特技。");
	text = text.replace("Intimate knowledge of dog care and conditions required for breeding allows you to successfully breed dogs. Unlocks a recipe in the crafting tent for breeding dogs.", "对犬类护理和繁殖所需条件的深入了解可以让你成功繁殖犬类。在制作帐篷中打开一个配方，供繁殖狗使用。");
	text = text.replace("You have mastered the art of training dogs.", "你已经掌握了训练狗的艺术。");
	text = text.replace("Dogs can instinctively identify a pack leader, knowledge of their habits allows you to become the leader of their pack.", "狗可以本能地识别领队，了解它们的习惯可以让你成为他们的领队。");
	text = text.replace("Your way with animals extends so far as turning those dogs that would do you harm.", "你对待动物的方式可以延伸到把那些会伤害你的狗变成你的狗。");
	text = text.replace("'The ugly one, right there! Take him out!'", "‘丑陋的那个，就在那儿！带他出去！’");
	text = text.replace("Drilling your troops in a shieldwall prepares their reaction time to avoid early deaths on the battlefield. Taking this perk ensures every mercenary with a shield will use shieldwall before the start of each battle.", "在盾墙的保护下训练你的部队，为他们的反应时间做准备，以避免在战场上过早死亡。使用此特长可以确保每个带盾牌的人在每次战斗开始前都会使用盾墙。");
	text = text.replace("Drilling your troops in a shieldwall prepares their reaction time to avoid early deaths on the battlefield.", "在盾墙的保护下训练你的部队，为他们的反应时间做准备，以避免在战场上过早死亡。");
	text = text.replace("Allies with a shield will use Shieldwall for free at the start of each battle.", "拥有盾牌的盟友将在每次战斗开始时免费使用盾墙。");
	text = text.replace(/Allies within 2 tiles will have the Action Point and Fatigue costs of their Shieldwall and Fortify skills halved\. Cannot reduce the Action Point cost below (.*?)\./, "2格范围内的盟友的盾墙和强化技能的行动点和疲劳消耗将减半。无法将行动点成本降低到$1以下。");
	text = text.replace("You will use Shieldwall for free as long as you start or end your turn adjacent to an ally who has the Shieldwall skill available.", "开始或结束回合时附近有拥有‘盾墙’技能的盟友，你将免费使用‘盾墙’。");
	text = text.replace("If you are carrying a shield which has the Shieldwall skill available, any ally who starts or ends their turn adjacent to you will use Shieldwall for free.", "如果你携带盾牌并有盾墙技能，附近的盟友在开始或结束回合都将免费使用盾墙。");
	text = text.replace("'PUSH NOW! FINISH THEM!'", "‘快推！干掉他们！’");
	text = text.replace(/Direct allies to attack at once, granting (.*?) ranged skill, (.*?) resolve and (.*?) ranged defence to all allies within (.*?) tiles for one turn\./, "指示盟友立即攻击，在一回合内给予$4格内的所有盟友$1远程技能、$2决心和$3远程防御。");
	text = text.replace(/Direct allies to attack at once, granting (.*?) melee skill, (.*?) resolve and (.*?) melee defence to all allies within (.*?) tiles for one turn\./, "指示盟友立即攻击，在一回合内给予$4格内的所有盟友$1近战技能、$2决心和$3近战防御。");
	text = text.replace(/Direct your troops to stand their ground, granting (.*?) Melee Defense, reducing damage taken by (.*?) and granting immunity to being knocked back and grabbed to all allies within (.*?) tiles for one turn\./, "指挥你的部队坚守阵地，给予$1近战防御，$2伤害减免，$3格内所有盟友一回合内免疫力击退和抓取。");
	text = text.replace(/Direct your troops to stand their ground, granting (.*?) Melee Defense, reducing damage taken by (.*?) to all allies within (.*?) tiles for one turn\./, "指挥你的部队坚守阵地，一回合内$3格内所有盟友获得 $1 近战防御和 $2 伤害减免。");
	text = text.replace("Surprise wins wars!", "惊喜赢得战争！");
	text = text.replace(/During the first round of combat, you and other members of your company gain the \'Deploy in Vanguard\' skill which allows a character to redeploy up to (.*?) tiles away or swap positions with an adjacent ally for no Action Point or Fatigue cost\./, "在第一轮战斗中，你和你队友获得“先锋部署”技能，该技能允许角色重新部署最多$1格，或与相邻盟友交换位置，无需行动点或疲劳成本。");
	text = text.replace("Cannot be used after moving, waiting, or using a skill.", "移动、等待或使用技能后不能使用。");
	text = text.replace(/Cannot be used to redeploy within (.*?) tiles of an enemy\./, "不能在距离敌人$1格以内重新部署。");
	text = text.replace(/Can only be used by a maximum of (.*?) characters per combat\./, "每次战斗最多只能$1个角色使用。");
	text = text.replace("Multiple characters with this perk do not stack.", "具有此特技的多个角色效果不会叠加。");
	text = text.replace("It will be over in a flash!", "它马上就要结束了！");
	text = text.replace("Costs 7 AP and builds 30 Fatigue.", "消耗7 AP，产生30疲劳。");
	text = text.replace(/You and other members of your company within 4 tiles, who have at least (.*?) Fatigue remaining and are not Stunned or Fleeing, gain the Adrenaline effect\./, "若队友在4格之内且还有$1点疲劳，没有晕眩或逃跑，可获得肾上腺素效果。");
	text = text.replace(/The affected allies build (.*?) Fatigue\./, "受影响的盟友增加$1疲劳。");
	text = text.replace("Is only usable once per day and cannot be used by more than one character.", "每天只能使用一次，不能由多个角色使用。");
	text = text.replace("'When there's coin to be had, you'd best get to havin'!'", "‘当有硬币时，你最好去拿！’");
	text = text.replace("You know that positivity begets positivity, so you always make sure to put on a show for your comrades!", "你知道积极产生积极，所以你一定要为你的同事们表演！");
	text = text.replace(/Gain (.*?) damage while using a shovel\. (.*?) of this skill applies to two handed maces\./, "使用铲子时增加$1点伤害。技能的$2适用于双手槌。");
	text = text.replace(/Gain (.*?) melee skill and gain the \'Knock Out\' skill while using a shovel\. (.*?) of this bonus melee skill applies to two handed maces\./, "使用铲子时增加$1近战技能和‘痛击’技能。$2的额外近战技能适用于双手槌。");
	text = text.replace(/This character\'s experience with corpses gives an additional (.*?) chance to retrieve each human body or skeleton from the battlefield, if you are already collecting them\./, "如果你已经在收集尸体，这个角色对于尸体的处理经验会给你额外$1几率从战场上找回每个人的身体或骨架。");
	text = text.replace("Only members of your company are considered allies for this perk.", "这个特技只有你的队友才算盟友。");
	text = text.replace(/Mercenaries are the worst, no cause, no principles, no honour\. They seek only coin, so they shall find only death\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting mercenaries\. Bonus increases the more mercenaries, wardogs and bountyhunters you kill\.  The bonus depends on how powerful the mercenary is, between (.*?) per Wardog, and (.*?) per Mercenary you kill\./, "雇佣兵是最糟糕的，没有理由，没有原则，没有荣誉。他们只寻找硬币，所以他们只能找到死亡。在与雇佣兵作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死雇佣兵、战犬和赏金猎人会增加这个加成。增加的值取决于佣兵的战力，你杀死的每只战犬加$2，每个雇佣兵加$3。");
	text = text.replace(/The southern nomads are uncivilised heathens, without even towns to their name, they must be brought to heel\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting nomads\. Bonus increases the more nomads you kill\. This includes Nomadic outlaws, cutthroats, Desert Stalkers, Slaves, Executioners and more\.  The bonus depends on how powerful the nomad is, between (.*?) per Nomad Cutthroat, and (.*?) per Executioner you kill\./, "南方游牧民族是未开化的异教徒，他们甚至没有城镇，必须让他们屈服。在与游牧民族作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死游牧民会增加这个加成。这包括游牧的亡命之徒、刽子手、沙漠跟踪者、奴隶、刽子手等等。增加的值取决于游牧民的战力，你杀死的每个游牧民加$2，每个刽子手加$3。");
	text = text.replace(/The southern city states are horrific, their slavery and conscription are afronts to human dignity\. Their power must be overthrown\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while southerners\. Bonus increases the more southerners you kill\. This includes Gunners, Officers, Engineers, Assassins, Conscripts, and more\.  The bonus depends on how powerful the southerner is, between (.*?) per Conscript, and (.*?) per Veteran Manhunter you kill\./, "南方的城邦是可怕的，他们的奴役和征兵是对人类尊严的侵犯。他们的权力必须被推翻。在与南方人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死南方人会增加这个加成。这包括枪手、军官、工程师、刺客、应征入伍者等等。增加的值取决于南方人的战力，你杀死的每个应征者加$2，每个老兵加$3。");
	text = text.replace(/Civilians are weak and powerless\. Their pitiful lives are pathetic, they should be grateful to behold true might in their dying moments\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting civilians\. Bonus increases the more civilians you kill\. Includes Peasants, Caravan Hands, Caravan Guards, Militia, Militia Veterans, Militia Captains and Militia Archers\.  The bonus depends on how powerful the civilian is, between (.*?) per Peasant, and (.*?) per Militia Captain you kill\./, "平民是软弱无能的。他们可怜的生活是可悲的，他们应该感激在临终时刻看到真正的力量。在与平民作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死平民会增加这个加成。这包括农民、商队手、商队卫兵、民兵、民兵退伍军人、民兵队长和民兵弓箭手等等。增加的值取决于平民的战力，你杀死的每个农民加$2，每个民兵队长加$3。");
	text = text.replace(/The path to martial prowess is beset by the fake and the weak\. Only one can be the greatest swordsman\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting elite swordsmen\. Bonus increases the more swordsmen you kill\. This includes Hedgeknights, Knights, Zweihanders, Swordmasters, Bandit Leaders and Sergeants\.  The bonus depends on how powerful the swordsman is, between (.*?) per Bandit Leader, and (.*?) per Knight you kill\./, "通往军事威力的道路是被假的和弱者所包围的。只有一个人能成为最伟大的剑客。在与精英剑士作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死精英剑士会增加这个加成。这包括雇佣骑士、骑士、剑士、剑士、强盗首领和军士等等。增加的值取决于精英剑士的战力，你杀死的每个强盗首领加$2，每个骑士加$3。");
	text = text.replace(/Some may claim to be the greatest shot in the land, but none have outshot you yet\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting archers\. Bonus increases the more archers you kill\. This includes Master Archers, Bandit Marksmen and poachers, Militia Archers, Arbalesters and Goblin Ambushers\. The bonus depends on how powerful the archer is, between (.*?) per Bandit Poacher, and (.*?) per Master Archer you kill\. Also reduces the penalty for targets behind cover by (.*?)\./, "有些人可能会声称自己是这片土地上最伟大的射手，但没有人能超过你。在与弓箭手作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死弓箭手会增加这个加成。这包括弓箭手大师、土匪射手和偷猎者、民兵弓箭手、弓箭手和地精埋伏者等等。增加的值取决于弓箭手的战力，你杀死的每个盗贼偷猎者加$2，每个弓箭手大师加$3。同时减少掩护后目标$4的惩罚。");
	text = text.replace(/Savages, naught but savages\. Civilization must be brought to those godless brutes\. They may be strong, but they lack skill\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting barbarians\. Also increases spawn rate of barbarian champions\. Additionally, this bonus increases the more barbarians you kill, the rate depends on how powerful the barbarian is, between (.*?) per Barbarian Thrall, and (.*?) per Barbarian Champion you kill\. Taking this perk unlocks  contract to escort dangerous barbarian prisoner\./, "野人，除了野人以外什么都没有。文明必须带给那些不敬虔的畜生们,他们可能很强壮，但缺乏技能。增加了野蛮人冠军的出现几率。在与野蛮人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死野蛮人会增加这个加成。增加的值取决于野蛮人的战力，你杀死的每个野蛮人奴役加$2，每个野蛮人冠军加$3。有了这个特技可以解锁押送危险野蛮人囚犯的合同。");
	text = text.replace(/Villainous scum, hiding in the dark and stealing from good folk\. The bandits must be purged to restore order in the world\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage against bandits\. Also increases spawn rate of bandit champions\. Additionally, this bonus increases the more bandits you kill, the rate depends on how powerful the bandit is, between (.*?) per Bandit Rabble, and (.*?) per Bandit Leader you kill\. Taking this perk unlocks  contract to wage war on army of bandits\./, "邪恶的人渣，躲在黑暗中，从好人那里偷东西。必须清除强盗才能恢复世界秩序。增加了强盗冠军的出现几率。在与强盗作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死强盗会增加这个加成。增加的值取决于强盗的战力，你杀死的每个强盗加$2，每个强盗首领加$3。有了这个特技可以解锁向强盗大军发动战争的合同。");
	text = text.replace(/Soldiers in glittering armor and colourful pennants, their pride shall be their undoing\. No gods, no masters\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage against noble soldiers\. Also increases spawn rate of noble champions\. Additionally, this bonus increases the more noble soldiers you kill, the rate depends on how powerful the noble soldier is, between (.*?) per footman, and (.*?) per Knight you kill\./, "身穿闪亮盔甲和五颜六色旗帜的士兵，他们的骄傲将成为他们的毁灭。没有神，就没有主人。增加了贵族冠军的出现几率。在与贵族作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死贵族会增加这个加成。增加的值取决于贵族的战力，你杀死的每个步兵加$2，每个骑士加$3。");
	text = text.replace(/Shambling corpses come wave on wave, rising sleepless from their graves\. They lose something crucial in death, and that can be exploited\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting wiedergangers\. Also increases spawn rate of fallen heroes\. Bonus increases the more Wiederganger you kill, the rate depends on how powerful the wiederganger is, between (.*?) per weideganger, and (.*?) per Fallen Hero\./, "蹒跚而行的尸体一浪接一浪地从坟墓里不眠地升起。他们失去了一些在死亡中至关重要的东西，这些东西可以被利用。增加了僵尸冠军的出现几率。在与僵尸作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死僵尸会增加这个加成。增加的值取决于僵尸的战力，你杀死的每个僵尸加$2，每个僵尸冠军加$3。");
	text = text.replace(/The legions from the ancient empire still harass this world, yet their connection to the world of the living can be severed\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting skeletons\. Also increases spawn rate of skeleton champions\. Additionally, this bonus increases the more Skeletons you kill, the rate depends on how powerful the skeleton is, between (.*?) per light skeleton, and (.*?) per Skeleton Priest you kill\./, "古代帝国的军团仍在骚扰这个世界，但他们与活人世界的联系可能会被切断。增加了古代亡灵冠军的出现几率。在与古代亡灵作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死古代亡灵会增加这个加成。增加的值取决于古代亡灵的战力，你杀死的每个古代亡灵加$2，每个亡灵牧师加$3。");
	text = text.replace(/The terrifying abilities of the Necrosavants and Embalmed are developed over time beyond memory\. Their techniques are honed to perfection, but that also makes them predictable\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting Necrosavants and Embalmed\. Additionally, this bonus increases at a rate of (.*?) per necrosavant or Embalmed killed\./, "吸血鬼和木乃伊的可怕能力是随着时间的推移而发展的，超出了记忆。他们的技术被磨练到极致，但这也让他们变得可预测。在与吸血鬼和木乃伊作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死吸血鬼和木乃伊会增加$2加成。");
	text = text.replace(/Forces may be gathering to take over the world, but ask someone else, I have no interest in anything but goblins\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting goblins\. Also increases spawn rate of goblin champions\. Additionally, this bonus increases the more Goblins you kill, the rate depends on how powerful the goblin is, between (.*?) per goblin fighter, and (.*?) per Goblin Overseer you kill\./, "力量可能会聚集起来接管世界，但问问其他人，我对任何东西都不感兴趣，除了哥布林。增加了哥布林冠军的出现几率。在与哥布林作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死哥布林会增加这个加成。增加的值取决于哥布林的战力，你杀死的每个地精战士加$2，每个哥布林督军加$3。");
	text = text.replace(/These marauding brutes are a force to be reckoned with, though their fighting style lacks finesse and can be countered with the right techniques\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting orcs\.  Also increases spawn rate of orc champions\. Additionally, this bonus increases the more Orcs you kill, the rate depends on how powerful the orc is, between (.*?) per orc young, and (.*?) per Orc Behemoth you kill\./, "这些掠夺者是一股不可忽视的力量，尽管他们的战斗风格缺乏技巧，可以用正确的技术反击。增加了兽人冠军的出现几率。在与兽人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死兽人会增加这个加成。增加的值取决于兽人的战力，你杀死的每个青年兽人加$2，每个兽人大只佬加$3。");
	text = text.replace(/The strong branches of a living tree are deadly foes, but trees can be felled with the right knowledge\. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting schrats or golems\. Additionally, this bonus increases at a rate of (.*?) per schrat you kill\. Taking this perk unlocks a legendary contract to hunt an endlessly multiplying Heartwood Schrat\./, "活生生的树上强壮的树枝是致命的敌人，但是只要有正确的知识，树是可以被砍倒的。在与树人和傀儡作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死树人和傀儡会增加$2加成。有了这个特技可以解锁一个猎杀无限分裂树人的传奇合同。");
	text = text.replace(/These skittering deadly bugs can be bested by studying the behaviour of arachnids\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting webnechts\. Additionally, this bonus increases the more webnechts you kill at a rate of (.*?) per webnecht you kill\. Taking this perk unlocks a legendary contract to hunt extremely poisonous Redback Webnecht\./, "通过研究蛛形纲动物的行为，可以击败这些跳跃的致命虫子。在蜘蛛作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个蜘蛛会增加$2加成。有了这个特技可以解锁一个猎杀剧毒红背蜘蛛的传奇合同。");
	text = text.replace(/The vicious jaws of a direwolf can tear limbs asunder\. In the heat of their blood soaked frenzy, they leave themselves open for counter attack\. Understanding these weaknesses grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting direwolves or hyenas\. Additionally, this bonus increases the more wolves you kill at a rate of (.*?) damage per direwolf\. Taking this perk unlocks an extremely difficult legendary contract to hunt the great white wolf\./, "冰原狼凶残的下颚可以撕裂四肢。在热血沸腾的狂乱中，他们让自己敞开大门进行反击。在冰原狼或土狼作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个冰原狼或土狼会增加$2加成。有了这个特技可以解锁一个猎杀白色冰原狼的传奇合同。");
	text = text.replace(/Understanding the morphology of these noxious serpents opens up weak spots in their scales\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting lindwurms or serpents\. Additionally, this bonus increases the more Lindwurms you kill at a rate of (.*?) damage per Lindwurm killed\. Taking this perk unlocks an extremely difficult legendary contract to hunt a burrowing Stollwurm\./, "了解这些毒蛇的形态会发现它们鳞片上的弱点。在林德虫或大蛇作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一只林德虫或大蛇会增加$2加成。有了这个特技可以解锁一个猎杀穴居斯托尔虫的传奇合同。");
	text = text.replace(/These gigantic ravenous creatures are dangerous but stupid, that can be used to your advantage\. Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting unholds\. Additionally, this bonus increases the more Unholds you kill at a rate of (.*?) damage per unhold killed\. Taking this perk unlocks an extremely difficult legendary contract to hunt a stone skinned Mountain Unhold\./, "这些巨大的贪婪的生物是危险但愚蠢的，可以用来为你的利益。在巨魔作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一只巨魔会增加$2加成。有了这个特技可以解锁一个猎杀穴石皮巨魔的传奇合同。");
	text = text.replace(/Preparing for the nightmare creepers gives you techniques against their haggard curses\.  Grants (.*?) base bonus to melee skill, ranged skill and resolve while fighting alps\. Additionally, this bonus increases the more Alps you kill, at a rate of (.*?) per Alp you kill\. Taking this perk unlocks an extremely difficult legendary contract to hunt a fire breathing nightmare demon\./, "为梦魇做准备可以让你对抗它们憔悴的诅咒。在梦魇作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一只梦魇会增加$2加成。有了这个特技可以解锁一个猎杀喷火梦魇的传奇合同。");
	text = text.replace(/Understanding the techniques of the malevolent crones gives you protection against their coven\.  Grants (.*?) base bonus to melee skill, ranged skill and resolve while fighting hexe\. Additionally, this bonus increases the more Hexe you kill at a rate of (.*?) per Hexe you kill\. Taking this perk unlocks a difficult legendary contract to hunt a coven leader\./, "了解那些恶毒的老太婆们的技术可以保护你免受他们的邪教之害。在女巫作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个女巫会增加$2加成。有了这个特技可以解锁一个追捕女巫领袖的传奇合同。");
	text = text.replace(/Studying these monstrosities has given you insights into the strengths and weaknesses of the pallid necrophilic flesh devourers\.  Grants (.*?) base bonus to melee skill, ranged skill and maximum damage while fighting nachzehrers\. Additionally, this bonus increases the more Nachzehrers you kill\. The bonus depends on how powerful the Nachzehrer is, between (.*?) per Nachzherer, and (.*?) per Skin Ghoul you kill\. Taking this perk unlocks an extremely difficult legendary contract to hunt elite nachzehrers, also known as Skin Ghouls\./, "通过研究这些怪物，你可以洞察苍白的嗜死性食肉动物的优缺点。在食尸鬼作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个食尸鬼会增加$2加成。有了这个特技可以解锁一个捕猎精英纳什赫勒人，也被称为皮肤食尸鬼的传奇合同。");
//ss 偏爱敌人
	text = text.replace(/Studying these monstrosities has given you insights into the strengths and weaknesses of the pallid necrophilic flesh devourers\. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting nachzehrers\. Bonus increases the more Nachzehrer you kill\.  The bonus depends on how powerful the Nachzehrer is, between (.*?) per Nachzherer, and (.*?) per Skin Ghoul you kill. Taking this perk unlocks an extremely difficult legendary contract to hunt elite nachzehrers, also known as Skin Ghouls\./, "通过研究这些怪物，你可以洞察苍白的嗜死性食肉动物的优缺点。在食尸鬼作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀掉越多加成越高。加成基于食尸鬼的战力，每杀死一个食尸鬼会增加$2加成，每杀死一个白肤食尸鬼增加$3加成。有了这个特技可以解锁一个捕猎精英食尸鬼，也被称为皮肤食尸鬼的传奇合同。");
	text = text.replace(/Preparing for the nightmare creepers gives you techniques against their haggard curses\.  Grants (.*?) bonus to melee skill, ranged skill and resolve while fighting alps\. Bonus increases the more Alps you kill, at a rate of (.*?) per Alp you kill\. Taking this perk unlocks an extremely difficult legendary contract to hunt a fire breathing nightmare demon./, "为梦魇做准备可以让你对抗它们憔悴的诅咒。在梦魇作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀掉越多加成越高。每杀死一只梦魇会增加$2加成。有了这个特技可以解锁一个猎杀喷火梦魇的传奇合同。");
	text = text.replace(/Understanding the techniques of the malevolent crones gives you protection against their coven\.  Grants (.*?) bonus to melee skill, ranged skill and resolve while fighting hexe\. Bonus increases the more Hexe you kill at a rate of (.*?) per Hexe you kill\. Taking this perk unlocks a difficult legendary contract to hunt a coven leader./, "了解那些恶毒的老太婆们的技术可以保护你免受他们的邪教之害。在女巫作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个女巫会增加$2加成。有了这个特技可以解锁一个追捕女巫领袖的传奇合同。");
	text = text.replace(/These gigantic ravenous creatures are dangerous but stupid, that can be used to your advantage\. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting unholds\. Bonus increases the more Unholds you kill at a rate of (.*?) damage per unhold killed\. Taking this perk unlocks an extremely difficult legendary contract to hunt a stone skinned Mountain Unhold\./, "这些巨大的贪婪的生物是危险但愚蠢的，可以用来为你的利益。在巨魔作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一只巨魔会增加$2加成。有了这个特技可以解锁一个猎杀穴石肤山脉巨魔的传奇合同。");
	text = text.replace(/Understanding the morphology of these noxious serpents opens up weak spots in their scales\. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting lindwurms or serpents\. Bonus increases the more Lindwurm you kill at a rate of (.*?) damage per Lindwurm killed\. Taking this perk unlocks an extremely difficult legendary contract to hunt a burrowing Stollwurm\./, "了解这些毒蛇的形态会发现它们鳞片上的弱点。在林德虫或大蛇作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一只林德虫或大蛇会增加$2加成。有了这个特技可以解锁一个猎杀穴居斯托尔虫的传奇合同。");
	text = text.replace(/The vicious jaws of a direwolf can tear limbs asunder\. In the heat of their blood soaked frenzy, they leave themselves open for counter attack\. Understanding these weaknesses grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting direwolves or hyenas\. Bonus increases the more wolves you kill at a rate of (.*?) damage per direwolf\. Taking this perk unlocks an extremely difficult legendary contract to hunt the great white wolf\./, "冰原狼凶残的下颚可以撕裂四肢。在热血沸腾的狂乱中，他们让自己敞开大门进行反击。在冰原狼或土狼作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个冰原狼或土狼会增加$2加成。有了这个特技可以解锁一个猎杀巨大白狼的传奇合同。");
	text = text.replace(/These skittering deadly bugs can be bested by studying the behaviour of arachnids\. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting webnechts\. Bonus increases the more webnechts you kill at a rate of (.*?) per webnecht you kill\. Taking this perk unlocks a legendary contract to hunt extremely poisonous Redback Webnecht\./, "通过研究蛛形纲动物的行为，可以击败这些跳跃的致命虫子。在蜘蛛作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死一个蜘蛛会增加$2加成。有了这个特技可以解锁一个猎杀剧毒红背蜘蛛的传奇合同。");
	text = text.replace(/The strong branches of a living tree are deadly foes, but trees can be felled with the right knowledge\. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting schrats or golems\. Bonus increases at a rate of (.*?) per schrat you kill\. Taking this perk unlocks a legendary contract to hunt an endlessly multiplying Heartwood Schrat./, "活生生的树上强壮的树枝是致命的敌人，但是只要有正确的知识，树是可以被砍倒的。在与树人和傀儡作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死树人和傀儡会增加$2加成。有了这个特技可以解锁一个猎杀无限分裂的心木树人的传奇合同。");
	text = text.replace(/These marauding brutes are a force to be reckoned with, though their fighting style lacks finesse and can be countered with the right techniques. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting orcs.  Also increases spawn rate of orc champions. Bonus increases the more Orcs you kill, the rate depends on how powerful the orc is, between (.*?) per orc young, and (.*?) per Orc Behemoth you kill./, "这些掠夺者是一股不可忽视的力量，尽管他们的战斗风格缺乏技巧，可以用正确的技术反击。增加了兽人冠军的出现几率。在与兽人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死兽人会增加这个加成。增加的值取决于兽人的战力，你杀死的每个青年兽人加$2，每个兽人大只佬加$3。");
	text = text.replace(/Forces may be gathering to take over the world, but ask someone else, I have no interest in anything but goblins. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting goblins. Also increases spawn rate of goblin champions. Bonus increases the more Goblins you kill, the rate depends on how powerful the goblin is, between (.*?) per goblin fighter, and (.*?) per Goblin Overseer you kill./, "力量可能会聚集起来接管世界，但问问其他人，我对任何东西都不感兴趣，除了哥布林。增加了哥布林冠军的出现几率。在与哥布林作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死哥布林会增加这个加成。增加的值取决于哥布林的战力，你杀死的每个地精战士加$2，每个哥布林督军加$3。");
	text = text.replace(/The terrifying abilities of the Necrosavants and Embalmed are developed over time beyond memory. Their techniques are honed to perfection, but that also makes them predictable. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting Necrosavants and Embalmed. Bonus increases at a rate of (.*?) to (.*?) per necrosavant or Embalmed killed./, "吸血鬼和木乃伊的可怕能力是随着时间的推移而发展的，超出了记忆。他们的技术被磨练到极致，但这也让他们变得可预测。在与吸血鬼和木乃伊作战时，近战技能、远程技能和最大伤害获得$1基础加成。每杀死吸血鬼和木乃伊会增加$2~$3加成。");
	text = text.replace(/The legions from the ancient empire still harass this world, yet their connection to the world of the living can be severed. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting skeletons. Also increases spawn rate of skeleton champions.  Bonus increases the more Skeletons you kill, the rate depends on how powerful the skeleton is, between (.*?) per light skeleton, and (.*?) per Skeleton Priest you kill./, "古代帝国的军团仍在骚扰这个世界，但他们与活人世界的联系可能会被切断。增加了古代亡灵冠军的出现几率。在与古代亡灵作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死古代亡灵会增加这个加成。增加的值取决于古代亡灵的战力，你杀死的每个古代亡灵加$2，每个亡灵牧师加$3。");
	text = text.replace(/Shambling corpses come wave on wave, rising sleepless from their graves. They lose something crucial in death, and that can be exploited. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting wiedergangers. Also increases spawn rate of fallen heroes. Bonus increases the more Wiederganger you kill, the rate depends on how powerful the wiederganger is, between (.*?) per weideganger, and (.*?) per Fallen Hero./, "蹒跚而行的尸体一浪接一浪地从坟墓里不眠地升起。他们失去了一些在死亡中至关重要的东西，这些东西可以被利用。增加了僵尸冠军的出现几率。在与僵尸作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死僵尸会增加这个加成。增加的值取决于僵尸的战力，你杀死的每个僵尸加$2，每个僵尸冠军加$3。");
	text = text.replace(/Soldiers in glittering armor and colourful pennants, their pride shall be their undoing. No gods, no masters. Grants (.*?) bonus to melee skill, ranged skill and maximum damage against noble soldiers. Also increases spawn rate of noble champions. Bonus increases the more noble soldiers you kill, the rate depends on how powerful the noble soldier is, between (.*?) per footman, and (.*?) per Knight you kill./, "身穿闪亮盔甲和五颜六色旗帜的士兵，他们的骄傲将成为他们的毁灭。没有神，就没有主人。增加了贵族冠军的出现几率。在与贵族作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死贵族会增加这个加成。增加的值取决于贵族的战力，你杀死的每个步兵加$2，每个骑士加$3。");
	text = text.replace(/Villainous scum, hiding in the dark and stealing from good folk. The bandits must be purged to restore order in the world. Grants (.*?) bonus to melee skill, ranged skill and maximum damage against bandits. Also increases spawn rate of bandit champions. Bonus increases the more bandits you kill, the rate depends on how powerful the bandit is, between (.*?) per Bandit Rabble, and (.*?) per Bandit Leader you kill. Taking this perk unlocks  contract to wage war on army of bandits./, "邪恶的人渣，躲在黑暗中，从好人那里偷东西。必须清除强盗才能恢复世界秩序。增加了强盗冠军的出现几率。在与强盗作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死强盗会增加这个加成。增加的值取决于强盗的战力，你杀死的每个强盗加$2，每个强盗首领加$3。有了这个特技可以解锁向强盗大军发动战争的合同。");
	text = text.replace(/Savages, naught but savages. Civilization must be brought to those godless brutes. They may be strong, but they lack skill. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting barbarians. Also increases spawn rate of barbarian champions. Bonus increases the more barbarians you kill, the rate depends on how powerful the barbarian is, between (.*?) per Barbarian Thrall, and (.*?) per Barbarian Champion you kill. Taking this perk unlocks  contract to escort dangerous barbarian prisoner\./, "野人，除了野人以外什么都没有。文明必须带给那些不敬虔的畜生们,他们可能很强壮，但缺乏技能。增加了野蛮人冠军的出现几率。在与野蛮人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死野蛮人会增加这个加成。增加的值取决于野蛮人的战力，你杀死的每个野蛮人奴役加$2，每个野蛮人冠军加$3。有了这个特技可以解锁押送危险野蛮人囚犯的合同。");
	text = text.replace(/Civilians are weak and powerless. Their pitiful lives are pathetic, they should be grateful to behold true might in their dying moments. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting civilians. Bonus increases the more civilians you kill. Includes Peasants, Caravan Hands, Caravan Guards, Militia, Militia Veterans, Militia Captains and Militia Archers.  The bonus depends on how powerful the civilian is, between (.*?) per Peasant, and (.*?) per Militia Captain you kill\./, "平民是软弱无能的。他们可怜的生活是可悲的，他们应该感激在临终时刻看到真正的力量。在与平民作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死平民会增加这个加成。这包括农民、商队手、商队卫兵、民兵、民兵退伍军人、民兵队长和民兵弓箭手等等。增加的值取决于平民的战力，你杀死的每个农民加$2，每个民兵队长加$3。");
	text = text.replace(/Some may claim to be the greatest shot in the land, but none have outshot you yet. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting archers. Bonus increases the more archers you kill. This includes Master Archers, Bandit Marksmen and poachers, Militia Archers, Arbalesters and Goblin Ambushers. The bonus depends on how powerful the archer is, between (.*?) per Bandit Poacher, and (.*?) per Master Archer you kill. Also reduces the penalty for targets behind cover by (.*?)\./, "有些人可能会声称自己是这片土地上最伟大的射手，但没有人能超过你。在与弓箭手作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死弓箭手会增加这个加成。这包括弓箭手大师、土匪射手和偷猎者、民兵弓箭手、弓箭手和地精埋伏者等等。增加的值取决于弓箭手的战力，你杀死的每个盗贼偷猎者加$2，每个弓箭手大师加$3。同时减少掩护后目标$4的惩罚。");
	text = text.replace(/The path to martial prowess is beset by the fake and the weak. Only one can be the greatest swordsman. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting elite swordsmen. Bonus increases the more swordsmen you kill. This includes Hedgeknights, Knights, Zweihanders, Swordmasters, Bandit Leaders and Sergeants.  The bonus depends on how powerful the swordsman is, between (.*?) per Bandit Leader, and (.*?) per Knight you kill./, "通往军事威力的道路是被假的和弱者所包围的。只有一个人能成为最伟大的剑客。在与精英剑士作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死精英剑士会增加这个加成。这包括雇佣骑士、骑士、剑士、剑士、强盗首领和军士等等。增加的值取决于精英剑士的战力，你杀死的每个强盗首领加$2，每个骑士加$3。");
	text = text.replace(/Mercenaries are the worst, no cause, no principles, no honour. They seek only coin, so they shall find only death. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting mercenaries. Bonus increases the more mercenaries, wardogs and bountyhunters you kill.  The bonus depends on how powerful the mercenary is, between (.*?) per Wardog, and (.*?) per Mercenary you kill./, "雇佣兵是最糟糕的，没有理由，没有原则，没有荣誉。他们只寻找硬币，所以他们只能找到死亡。在与雇佣兵作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死雇佣兵、战犬和赏金猎人会增加这个加成。增加的值取决于佣兵的战力，你杀死的每只战犬加$2，每个雇佣兵加$3。");
	text = text.replace(/The southern city states are horrific, their slavery and conscription are afronts to human dignity. Their power must be overthrown. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while southerners. Bonus increases the more southerners you kill. This includes Gunners, Officers, Engineers, Assassins, Conscripts, and more.  The bonus depends on how powerful the southerner is, between (.*?) per Conscript, and (.*?) per Veteran Manhunter you kill./, "南方的城邦是可怕的，他们的奴役和征兵是对人类尊严的侵犯。他们的权力必须被推翻。在与南方人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死南方人会增加这个加成。这包括炮手、军官、工程师、刺客、义务兵等等。增加的值取决于南方人的战力，你杀死的每个义务兵加$2，每个搜捕者加$3。");
	text = text.replace(/The southern city states are horrific, their slavery and conscription are afronts to human dignity. Their power must be overthrown. Grants (.*?) bonus to melee skill, ranged skill and maximum damage against southerners. Bonus increases the more southerners you kill. This includes Gunners, Officers, Engineers, Assassins, Conscripts, and more.  The bonus depends on how powerful the southerner is, between (.*?) per Conscript, and (.*?) per Veteran Manhunter you kill./, "南方的城邦是可怕的，他们的奴役和征兵是对人类尊严的侵犯。他们的权力必须被推翻。在与南方人作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死南方人会增加这个加成。这包括炮手、军官、工程师、刺客、义务兵等等。增加的值取决于南方人的战力，你杀死的每个义务兵加$2，每个搜捕者加$3。");

	text = text.replace(/The southern nomads are uncivilised heathens, without even towns to their name, they must be brought to heel. Grants (.*?) bonus to melee skill, ranged skill and maximum damage while fighting nomads. Bonus increases the more nomads you kill. This includes Nomadic outlaws, cutthroats, Desert Stalkers, Slaves, Executioners and more.  The bonus depends on how powerful the nomad is, between (.*?) per Nomad Cutthroat, and (.*?) per Executioner you kill./, "南方游牧民族是未开化的异教徒，他们甚至没有城镇，必须让他们屈服。在与游牧民族作战时，近战技能、远程技能和最大伤害获得$1基础加成。杀死游牧民会增加这个加成。这包括游牧民亡命徒、割喉者、沙漠跟踪者、奴隶、行刑者等等。增加的值取决于游牧民的战力，你杀死的每个游牧民加$2，每个行刑者加$3。");
	text = text.replace(/At the (.*?)18th(.*?) character level, you gain an additional perk point\./, "在角色$1 18 $2级时获得一个额外的特技点。");

	text = text.replace(/Unlocks the \'Intimidate\' skill \((.*?) AP and (.*?) Fatigue Cost\) which can decrease (.*?) of Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve of any enemy within (.*?) tiles radius, this effect lasts for (.*?) turn and can be stacked\./, "解锁“恐吓”技能（耗费$1AP和增加$2疲劳），可以减少$3近战技能、远程技能、近战防御、远程防御和$4个格范围内任何敌人的决心，该效果持续$5回合，可以叠加。");
	text = text.replace(/Unlocks the \'Intimidate\' skill \((.*?) AP and (.*?) Fatigue Cost\)/, "解锁“恐吓”技能（耗费$1AP和增加$2疲劳）");
	text = text.replace(/which can decrease (.*?) of Melee Skill, Ranged Skill, Melee Defense, Ranged Defense and Resolve of any enemy within (.*?) tiles radius, this effect lasts for (.*?) turn and can be stacked\./, "可以减少$1近战技能、远程技能、近战防御、远程防御和$2个格范围内任何敌人的决心，该效果持续$3回合，可以叠加。");
	text = text.replace(/which can decrease (.*?) of (.*?) and Resolve of any enemy within (.*?) tiles radius, this effect lasts for (.*?) turn and can be stacked\./, "可以减少$1 $2和$3格范围内任何敌人的决心，该效果持续$4回合，可以叠加。");

	text = text.replace(/(.*?)Gorge(.*?), (.*?)Tail Thresh(.*?), (.*?)Tail Sweep(.*?) and (.*?)Tail Split(.*?) skills build up (.*?) less Fatigue and their Attack Damage are increased by (.*?)\./, "$1暴食$2、$3尾巴锤击$4、$5尾巴横扫$6和$7尾巴劈裂$8疲劳耗费减少$9，增加$10攻击伤害。");
	text = text.replace(/skills build up (.*?) less Fatigue and their Attack Damage are increased by (.*?)\./, "技能减少$1疲劳，增加$2攻击伤害。");

	text = text.replace(/Unlocks the \'Liner Breaker\' skill \((.*?) AP and (.*?) Fatigue Cost\) which can help you break through enemy defensive line to reach those at backline\./, "解锁“破坏者”技能（耗费$1AP和增加$2疲劳）可以帮助你突破敌人的防线，到达后方。");

	text = text.replace(/Unlocks the \'Spit Acid Blood\' skill \((.*?) AP and (.*?) Fatigue Cost\) which is a (.*?) tiles ranged attack. It will cover your target and may be anyone nearby in acidic blood, creating grievous burn wounds, melting away any kind of armor\./, "解锁“喷射酸液”技能（耗费$1AP和增加$2疲劳），$3格远程攻击。目标和附近的人都会被酸液覆盖，造成严重的灼伤，融化任何盔甲\。");
	text = text.replace(/Unlocks the \'Spit Acid Blood\' skill \((.*?) AP and (.*?) Fatigue Cost\)/, "解锁“喷射酸液”技能（耗费$1AP和增加$2疲劳）");
	text = text.replace("which is an 3 tiles ranged attack. It will cover your target and may be anyone nearby in acidic blood, creating grievous burn wounds, melting away any kind of armor.", "3格远程攻击。目标和附近的人都会被酸液覆盖，造成严重的灼伤，融化任何盔甲\。");

//	text = text.replace("The spirit world is home to many malevolent beings, and the Vala knows how to contact them. Once her access to their realm has been established, she calls upon these ill-willed spirits in hopes of receiving their help.\n\nIf she\'s successful, these spirits will harass, torment and weaken her foes. They may also spread out to affect additional entities.", "灵魂世界是许多恶毒生物的家园，而瓦拉知道如何联系他们。一旦她进入了他们的王国，她就会召唤这些邪恶的灵魂，希望得到他们的帮助。\n\n如果她成功了，这些灵魂会骚扰、折磨和削弱她的敌人。它们还可能扩散到其他实体。");
	text = text.replace("The spirit world is home to many malevolent beings, and the Vala knows how to contact them. Once her access to their realm has been established, she calls upon these ill-willed spirits in hopes of receiving their help.", "灵魂世界是许多恶毒生物的家园，而瓦拉知道如何联系他们。一旦她进入了他们的王国，她就会召唤这些邪恶的灵魂，希望得到他们的帮助。");
	text = text.replace("If she\'s successful, these spirits will harass, torment and weaken her foes. They may also spread out to affect additional entities.", "如果她成功了，这些灵魂会骚扰、折磨和削弱她的敌人。它们还可能扩散到其他实体。");
	text = text.replace("As the Vala swings and weaves her staff she spins and twines the threads of fate of those she hits with it.", "当瓦拉摆动和施展她的法杖时，她旋转和缠绕着那些她用它打击的人的命运之线。");
	text = text.replace("Master poison, giving you the ability to keep your weapons covered in poison at all times.", "毒药大师，可以让你的武器随时被毒药覆盖。");
	text = text.replace("The bigger they are...", "更大的他们...");
	text = text.replace("Raise the dead, and turn them into your own personal army.", "让死者复活，把他们变成你自己的军队。");
	text = text.replace("Unleash a horde of insects on your enemy, halving their melee skill, melee defense, ranged skill, ranged defense and initiative.", "向你的敌人释放一大群昆虫，将他们的近战技能、近战防御、远程技能、远程防御和主动性减半。");
	text = text.replace("Draw from the lifeforce of your victim and transfer up to 30% of their health to yourself. You may not drain more health than you are missing nor drain a victim to their death. Effectiveness drops off 5% for each tile away.", "从受害者的生命中吸取生命力，并将其30%的生命值转移给自己。吸取量不超过你失去的生命值，也不能将受害者吸干致死。每远离一格，效果就会下降5%。");
	text = text.replace("Time spent assessing an enemy, finding the arteries, will pay off in blood shed on the field.", "花在评估敌人、寻找动脉上的时间将在战场上流血中获得回报。");
	text = text.replace("Take joy in the suffering of others, gain Fatigue and Resolve for each bleeding character on the field. The percentage gained is equal to the percentage of characters that are bleeding or have temporary injuries, including your own.", "从别人的痛苦中获得快乐，为场上每个流血的角色获得疲劳和决心。获得的百分比等于流血或暂时受伤的角色的百分比，包括你自己。");
	text = text.replace("If it bleeds, we can kill it. An existing injury can open up avenues of attack for the final slaughter.", "如果它流血，我们可以杀死它。现有的伤势可能为最后的屠杀开辟攻击途径。");
	text = text.replace(/Taste of the forbidden flesh\. Devour a recently departed corpse to gain strength and restore your own health by (.*?) /, "禁肉的味道。吞食一具刚死去的尸体以获得力量并恢复自身$1生命值");
	text = text.replace(/Raise a half-formed thrall from a pile of mismatched dead flesh\. Though lacking in strength or bodily integrity, it shall obey. Requires (.*?) health to summon and (.*?) human carrion\. Taking this perk grants (.*?) health\./, "从一堆死肉中塑造出一个半成形的仆从。虽然力量不足或身体不完整，但它非常服从。召唤需要$1生命和$2人类腐肉。拥有这项特技可以增加$3点生命值。");
	text = text.replace("Yield to the dark power, let it ooze from your pores. With the fell energy now unrestrained, you can further project your art of rousing the dead. Increases range of all skills that raise dead by one tile.", "屈服于黑暗力量，让它从你的毛孔渗出。随着堕落的能量现在不受限制，你可以进一步展示你唤醒死者的艺术。增加所有能复活死者技能的射程一格。");
	text = text.replace(/Organize the remains before you raise it so that your creation is better suited to the work it is given\. Sturdier in both form and function\. Requires (.*?) health to summon and (.*?) human carrion\. Taking this perk adds (.*?) medicine to your stash and increases the total medicine by (.*?)\./, "在你塑造遗骸之前，先把遗骸整理好，这样你的作品就更适合它所做的工作了。在形式和功能上都更坚固。召唤需要$1生命和$2人类腐肉。拥有这项特技可以$3药品到仓库，$4药品储存量。");
	text = text.replace("Weave a bit of your magic through the waste of a corpse so more means may be salvaged. Increases how frequently you gain Human Carrion and Human Bones as loot.", "在尸体的废墟中施展魔法，这样可以回收到更多的东西。增加获得人类腐肉和人类骨头作为战利品的几率。");
	text = text.replace("Corrupt the force sustaining one of your fashioned thralls, causing them to detonate destructively after the corruption has time to build. Affected dead explode at the end of their turn next round, dealing damage in a 1 tile radius. The less HP they have, the more damage the explosion inflicts. If they are killed before they explode, the effect no longer triggers. Only works on minions fashioned from corpses.", "腐化维持仆从的力量，在腐化结束后他们会引起毁灭性地爆炸。受影响的仆从在下一轮回合结束时爆炸，在1格半径范围内造成伤害。他们的生命越少，爆炸造成的伤害就越大。如果它们在爆炸前被杀死，效果将不再触发。只适用于尸体制作的仆从。");
	text = text.replace(/Stitch the body together with such precision so that, once raised, it could pass as alive\. A magnum opus of flesh, unsurpassed in power. Requires (.*?) health to summon and (.*?) human carrion\./, "将尸体精确地缝合在一起，一旦塑造成功，它就可以像过去一样活着。一部关于肉体的杰作，无与伦比。重塑需要$1生命和$2人类腐肉。");
	text = text.replace("Raise a ramshackle thrall from some bones only barely ordered. Though lacking in strength or bodily integrity, it shall obey. Requires a small flesh sacrifice to perform the ritual.", "从一些杂乱的骨头上塑造一个摇摇欲坠的仆从。虽然力量不足或身体不完整，但它非常服从。需要一个小小的肉祭来完成仪式。");
	text = text.replace("Place the bones where they belong before you raise them so that it\'s less liable to fall apart. Sturdier in both form and function. Requires a minor flesh sacrifice to perform the ritual.", "在你塑造骨头之前，把骨头放在它们应该放的地方，这样骨头就不那么容易散开。在形式和功能上都更坚固。需要少量的肉祭来完成仪式。");
	text = text.replace("Conduct profane rituals meant to stave off the passage of time, further preserving the means of your craft. Reduces the cost of maintaining Human Carrion and Human Bones by 50% medicine per day.", "进行亵渎神灵的仪式，以避免时间的流逝，进一步保护你的技艺。每天将人类腐肉和骨骼的维护成本降低50%。");
	text = text.replace("Learn to better focus your art so it is less draining on your body. All skills that raise dead build up 30% less Fatigue.", "学会更好地关注你的艺术，这样你的身体就不会太累。所有能让死人复活的技能都能减少30%的疲劳。");
	text = text.replace("Enter the mind of a thrall and lend your power for one turn, increasing thralls combat prowess.", "进入一个仆从的头脑，在一个回合内释放你的力量，增加仆从的战斗能力。");
	text = text.replace("Only works on allied undead. Possessing a thrall makes them immune to being charmed for the duration of the possession.", "只对盟友亡灵有效。占据一个仆从使它们在被占据期间免疫被施咒。");

	text = text.replace("Painstakingly reorganize each bone such that, once raised, no tarsus is out of place. A magnum opus of bone, unsurpassed in power. Requires a moderate flesh sacrifice to perform the ritual.", "精心整理每一块骨头，这样，一旦塑造成功，就不会有跗骨错位。一部骨科巨著，无与伦比。需要适度的肉祭来进行仪式。");
	text = text.replace("What could stand before you now?", "现在你面前还有什么？");
	text = text.replace("Gain another stack of nimble when not wearing both armour and a helmet, real berserkers don\'t need pants.", "当不穿护甲和头盔时，获得一些敏捷加成，真正的狂战士不需要裤子。");
	text = text.replace("Summon roots and vines to entangle your enemies.", "召唤树根和藤蔓缠绕你的敌人。");
	text = text.replace(/A prayer of hope and love restores wellbeing to your allies and tears at the undead\. Adjacent allies gain (.*?) of their resolve as hitpoints when used\. Inflicts a disintegrating ailment on each adjacent undead\. Does not work on cultists\./, "祈祷希望和爱能让你的盟友恢复幸福，让亡灵流泪。使用时相邻盟友获得$1决心值作为生命值加成。对每个相邻的亡灵造成分解疾病。不适用于邪教徒。");
	text = text.replace("Control the elements, calling down the rain. The first cast brings on light rain, the second cast brings a heavy storm and the thrill of being in the heart of the storm boosts your resolve. Must have empty hands.", "控制环境，降下雨水。首次施展召唤来小雨，第二次施展召唤来大风暴，身处风暴中心的兴奋感会增强你的决心。必须空手施展。");
	text = text.replace(/Learn powerful rhythms that drive your allies on\. Unlocks the Drums of War skill that restores (.*?) fatigue to every ally within eight tiles\. Can only be used with a Drum or Lute equipped\./, "学习驱使你的盟友前进的强大节奏。解锁‘战争之鼓’，使八格范围内的每个盟友恢复$1疲劳。只能在配备鼓或鲁特琴的情况下使用。");
	text = text.replace(/Learn powerful rhythms that drive your allies on\. Unlocks the Drums of Life that restores (.*?) health to every ally within eight tiles\. Can only be used with a Drum or Lute equipped\./, "学习驱使你的盟友前进的强大节奏。解锁战鼓技能，使八格范围内的每个盟友恢复$1生命值。只能在配备鼓或鲁特琴的情况下使用。");
	text = text.replace(/Learn powerful rhythms that drive your allies on\. Unlocks the Drums of Life skill that restores (.*?) health to every ally within eight tiles\. Can only be used with hands empty, or with a Drum or Lute equipped\./, "学习驱使你的盟友前进的强大节奏。解锁‘生命之鼓’，使八格范围内的每个盟友恢复$1生命值。只能空手、配备鼓或鲁特琴的情况下使用。");
//	text = text.replace("Knocks target back one tile.\nDeals 10 fatigue damage.\nRanged attack up to 6 tiles with +10% chance to hit.\nCosts 3 AP and 30 fatigue.", "将目标击退一格。\n造成10点疲劳伤害。\n射程6格，命中几率+10%。\n消耗3 AP和增加30疲劳。");
	text = text.replace("Knocks target back one tile.", "将目标击退一格。");
	text = text.replace("Deals 10 fatigue damage.", "造成10点疲劳伤害。");
	text = text.replace("Ranged attack up to 6 tiles with +10% chance to hit.", "射程6格，命中几率+10%。");
	text = text.replace("Costs 3 AP and 30 fatigue.", "消耗3 AP和增加30疲劳。");
	text = text.replace("Assault the senses of your target with a flurry of colorful movement and sounds. Such an astonishing display is sure to leave anyone too bewildered to fight effectively.", "用乱花缭乱的动作和乱七八糟的声音攻击目标的感官。如此惊人的展示肯定会让任何人不知所措，无法有效地战斗。");
	text = text.replace("Applies Stupefied effect on hit.", "在命中时敌方获得昏迷效果。");
	text = text.replace("Unaffected by tile blockers", "不受地块阻隔影响");
	text = text.replace("Range of 6 tiles.", "范围为6格。");
	text = text.replace("Chance to hit doubled if you have the Taunt perk.", "如果你有嘲讽特长，命中率加倍。");
	text = text.replace("Deals no damage.", "不会造成伤害。");
	text = text.replace("Pulls target one tile towards you.", "将目标拉向你一格。");
	text = text.replace("100% chance to stagger on a hit.", "命中时有100%的几率让对方趔趄。");
	text = text.replace("+10% chance to hit.", "+10%命中率。");
	text = text.replace("Ranged attack at 2-7 tiles distance", "攻击距离为2-7格");
	text = text.replace("Costs 6 AP and 10 fatigue.", "耗费6AP和增加10点疲劳。");
	text = text.replace("Blare out a piercing, unworldly sound that is more than likely to distress anyone unfortunate enough to hear it.", "发出刺耳的、闻所未闻的声音，这很可能会让任何不幸听到它的人感到痛苦。");
	text = text.replace(/The mere sight of this character sends enemies fleeing\. Reduce resolve of adjacent enemies by (.*?)/, "只要看到这个角色，敌人就会逃跑。将相邻敌人的决心降低$1");
	text = text.replace("Summon feline familiar to your aide. Don\'t worry, this particular cat has nine times a million lives.", "召唤你的猫助手。别担心，这只猫的寿命有九次百万的生命值。");
	text = text.replace("Forming close bonds with hounds grants the ability to call to them. Summon a loyal hound to your side in battle.", "与猎犬形成紧密的联系，赋予召唤猎犬的能力。在战斗中召唤一只忠诚的猎犬到你身边。");
	text = text.replace("Years spent feeding and caring for falcons has made them your friends. Summon a falcon to guide you in battle.", "多年来喂养和照顾猎鹰使它们成为你的朋友。召唤一只猎鹰在战斗中指引你。");
	text = text.replace("Cultivating a relationship with the wolves allows you to call them to your side. Summon a wolf to aid you in battle.", "培养与狼的关系可以让你召唤它们到你身边。召唤一只狼来帮助你作战。");
	text = text.replace("Cultivating a relationship with the nature allows you to call them to your side. Summon a wolf to aid you in battle.", "培养与狼的关系可以让你召唤它们到你身边。召唤一只狼来帮助你作战。");
	text = text.replace("Endless communion with the animals has won you the trust of the bears. Adds a pet bear to your stash, make sure you have space before taking this perk. Unlocks an event to tame bears in the woods.", "与动物无休止的交流为你赢得了熊的信任。在你的仓库中添加一只宠物熊，在获得这个特技前确保你有足够的仓库空间。解锁森林中驯服熊的事件。");
	text = text.replace("Knowledge of the landscape and vegetation provides a wealth of opportunities when gathering in camp. Apothecaries usually gain their level as a percentage reduction in hours required to find special items. This skill doubles that bonus to twice their level. When the total bonus from all apothecaries is above 10%, they can also find mushrooms, poisons, antidotes and powders.", "在营地采集时，对景观和植被的了解提供了收益加成。采集者们通过收益加成来减少寻找特殊物品所需的时间。这项特技使收益加成翻倍，达到他们等级的两倍。当所有采集者的收益加成超过10%时，还可以找到蘑菇、毒药、解毒药和火药等物品。");
	text = text.replace("Expertise in potions and tinctures allows the creation of potions while gathering in camp. This skill unlocks the chance to create lionheart, ironwill, recovery and cat potions while gathering. An apothecary, druid, alchemist or vala must gather the ingredients for the potion brewer. When the total level of all brewers (potion brewer perk) is above 20 and Apothecaries (backgrounds or gathering perk) is above 30, they have a chance to create potions of knowledge and oblivion. Also unlocks alcohol crafting in the crafting tent.", "药剂和药酒方面的专业知识允许在营地采集时制作药水。这项特技开启后在采集时有几率制作出狮心药水、钢铁意志药水、恢复药水和猫鼬药剂。药剂师、德鲁伊、炼金术士或瓦拉一定能为酿造师收集原料，当所有酿造师（有药水酿造特技）的总等级在20以上，药剂师（有药剂师背景或有采集特技）在30以上时，他们有几率制作出知识药水和遗忘药水。还可以在制作帐篷中解锁酒精酿造。");
	text = text.replace("Step through the world, disappearing from one place and reappearing in another place immediately.", "穿越世界，从一个地方消失，然后立即出现在另一个地方。");
	text = text.replace("Reduce AP cost of Magic Missile by 1.", "奥术飞弹的AP耗费降低1。");
	text = text.replace("Reduce AP and cost of Magic Missile by 1.", "奥术飞弹的AP耗费降低1。");
	text = text.replace("Reduce the base fatigue cost of Magic Missile by 6.", "奥术飞弹增加的疲劳降低6。");
	text = text.replace(/Allows the user to be counted as educated for events, regardless if other conditions are met. Educated backgrounds are Masons, Inventors, Historians and do not need this perk unless they have the dumb trait\. Increases potential loot gain by (.*?) after battle\./, "触发事件时无论是否满足其他条件，都允许使用者被视为受教育的。受过教育的背景有石匠、发明家、历史学家，他们不需要这种特技，除非他们有愚蠢的特质。战斗后$1潜在战利品增益。。");
	text = text.replace("Allows the user to identify Ancient Scrolls, when given a Cloth and Dyes. These tomes grant a specific effect, whereas an Ancient Scroll gives any random effect.", "当有布料和染料时拥有者能鉴定古代卷轴。巨著能获得特定效果，而古代的卷轴会产生任何随机的效果。");
	text = text.replace("Increases the length of your transformations to 6 turns.", "将变形的时间增加到6回合。");
	text = text.replace("Allows this character to control shapeshifting to some extent, no longer deliberately striking allies and foes alike while transformed.", "允许这个角色在一定程度上控制变形，在变形时不再故意攻击盟友和敌人。");
	text = text.replace("Gives character self control while transformed.", "在角色变形时给予自我控制能力。");
	text = text.replace("Allows the character to transform at will, no longer randomly transforming during battle.", "允许角色随意变形，不再在战斗中随机变形。");
	text = text.replace("Through extensive study of the human form, you learn how to fashion replacement parts from wood and metal. Unlocks a series of events that let you create prosthetic body parts to help your mercenaries resolve their permanent injuries that are presented through random events.", "通过对人类形态的广泛研究，你将学会如何用木材和金属制作替换零件。解锁一系列事件，让你创建假肢身体部位，帮助你的雇佣兵解决他们通过随机事件呈现的永久伤害。");
	text = text.replace(/Direct your attention to guiding an apprentice into the mercenary world, increasing the company roster size by (.*?)/, "将你的注意力集中在引导学徒进入雇佣兵世界上，将战队名册规模增加$1");
	text = text.replace(/Spend time training bodyguards to work together, increasing the company roster size by (.*?)/, "花时间训练保镖一起工作，将战队名册规模增加$1");
	text = text.replace(/Set up team planning, with task lists and prioritisation\. Increases the company roster size by (.*?)/, "制定团队计划，列出任务清单和优先顺序。将战队名册规模增加$1");
	text = text.replace(/Create a squad regime, with weekly schedules and drills\. Increases the company roster size by (.*?)/, "建立班制，每周安排训练。将战队名册规模增加$1");
	text = text.replace(/Oversee the section\'s financial administration processes, managing pay disputes, disbursements, withholdings and loans\.  Increases the company roster size by (.*?)/, "监督部门的财务管理流程，管理薪酬争议、支出、预扣和贷款。将战队名册规模增加$1");
	text = text.replace(/Manage the company logistics. Supply rationing, camp structure and waste disposal\. Increases the company roster size by (.*?)/, "管理队伍物流。供应配给、营地结构和废物处理。将战队名册规模增加$1");
	text = text.replace(/Increases the company roster size by (.*?)/, "将战队名册规模增加$1");
	text = text.replace("Implement platoon organisation techniques. Balancing interteam dynamics, clarifying role responsibilities, creating conflict resolution processes and creating strategic plans.", "实施排组织技术。平衡团队间的动态，明确角色职责，创建冲突解决流程并制定战略计划。");
	text = text.replace(/Not all of a plant is required for healing, your knowledge of the active ingredients lets you throw away excess leaves and roots\.Your knowledge of medicines lets you repack them into more efficient packages\. Increases maximum medicine storage by 30 and resolve by (.*?)/, "并不是所有的植物都需要愈合，你对活性成分的了解可以让你扔掉多余的叶子和根。你对药物的了解可以让你把它们重新包装成更有效的包装。增加药品容量30，$1决心");
	text = text.replace("With a well developed immune system and incredible fitness, a warrior\'s system can shrug off even powerful toxins. This character becomes immune to all poisons.", "拥有发达的免疫系统和难以置信的健康，战士的身体甚至可以摆脱强大的毒素。这个角色对所有毒药免疫。");
	text = text.replace("Expertise in making ammunition lets you strip it down to pack the parts for storage, it also lets you draw out arrows faster.", "在制造弹药方面的专业知识可以让你把它拆开，把零件打包存放，也可以让你更快地拔出箭头。");
	text = text.replace("Use your extraordinary senses to notice things no one else can. Reveals everything within 12 tiles.", "用你非凡的感官去注意别人无法注意到的事情。揭示12格内的所有内容。");
	text = text.replace("Wade into the thick of battle, dodging blades from behind and above, aware of all around you at the heart of the battle.", "涉入激烈的战斗，从后面和上面躲避刀锋，意识到你周围的一切都是战斗的核心。");
	text = text.replace("Makes the Underdog perk redundant.", "让‘落单狗’特技多余。");
	text = text.replace("Relax, bro!", "放松点，兄弟！");
	text = text.replace(/Practicing with the unwieldy scythe has taught you how to twist your torso to produce repeatable smooth strokes\. Grants (.*?) melee skill while wielding a scythe or warscythe\./, "用笨重的镰刀练习已经教会了你如何扭曲你的躯干以产生可重复的平滑划水。在挥舞镰刀或战争镰刀时$1近战技能。");
	text = text.replace(/There is a trick to sharpening the blades of scythes, and shifting the position of the handles turns it from a farming tool into a weapon\. Mastering these tricks increases the damage output of scythes and warscythes by (.*?)/, "有一个技巧可以磨快镰刀的刀刃，改变刀柄的位置可以把镰刀从农具变成武器。掌握这些技巧会增加镰刀和战争镰刀的伤害输出$1");
	text = text.replace("Use your knowledge of undeath to bring your mercenaries back from the dead.", "利用你对亡灵的了解，让你的雇佣兵从死亡中复活。");
	text = text.replace("A chant that really gets the blood boiling, making your allies eager to fight.", "这首歌真的让人热血沸腾，让你的盟友渴望战斗。");
	text = text.replace("Put your weight into it!", "把你的体重放进去！");
	text = text.replace("Your strikes contain enough force that they disorient your enemies!", "你的攻击包含足够的力量使敌人迷失方向！");
	text = text.replace("\'Give their \'ed a nice knock, then move in for the kill!\'", "‘给他们漂亮一敲，然后进去杀了他！’");
	text = text.replace(/Damage against enemies who have suffered a negative status effect is increased by (.*?) per such status effect and damage received from them is decreased by the same amount\./, "对有负面状态的敌人伤害增加，每个状态增加$1，同时他们的伤害也会减少相同的数量");
	text = text.replace(/Damage against enemies who have suffered a negative status effect is increased by (.*?) per such status effect\./, "对有负面状态的敌人伤害增加，每个状态增加$1。");
	text = text.replace("Only Stunned, Staggered, Dazed, and Baffled count as valid negative status effectst for this perk.", "只有昏迷、趔趄、茫然和困惑才算是有效的负面状态效果。");
	text = text.replace("Only Stunned, Staggered, Dazed, and Baffled count as valid negative status effects for this perk.", "只有昏迷、趔趄、茫然和困惑才算是有效的负面状态效果。");
	text = text.replace("The Polemace has a reduced penalty for attacking targets directly adjacent.", "长棍攻击相邻的目标惩罚降低。");
	text = text.replace("A strike to the head from this character means goodnight!", "这个角色打出头部一击意味着晚安！");
	text = text.replace(/Strike hardest where they are weakest\. Gain (.*?) Melee and Ranged skill, and (.*?) chance to hit the head when attacking a sleeping, stunned, netted, dazed, staggered or grappled enemy\./, "在最薄弱的地方打击最重。获得$1近战和远程技能，在攻击熟睡、昏迷、被网住的、晕眩、趔趄的或挣扎的敌人时，有$2的几率击中头部。");
	text = text.replace("Snap, crunch, crumble. Music to your ears!", "啪啪、嘎吱、碎裂。听音乐！");
	text = text.replace("Training against melons of all types has given you a penchant for hitting heads!", "对抗各种瓜类的训练让你对头部产生了兴趣！");
	text = text.replace("Sometimes hits to the head just don\'t do enough damage. You\'ve taken that to mean you just need to hit harder!", "有时击中头部并不会造成足够的伤害。你认为这意味着你只需要加大打击力度！");
	text = text.replace("You\'ve learned to use the unpredictable swings of your flail to keep your enemies guessing!", "你已经学会了利用连枷不可预测的摆动来让敌人迷惑！");
	text = text.replace("Use the arc of your flailhead to target weak spots in your opponents' armor!", "用连枷头的弧线瞄准对手盔甲上的薄弱点！");
	text = text.replace("Use the momentum of your flail to enable quick follow-up blows!", "利用连枷的冲力快速跟进打击！");
	text = text.replace("Use your size and strength to bully your way into the prime position.", "利用你的体型和力量，以欺凌的方式进入最佳位置。");
	text = text.replace("Costs 2 AP and builds 15 Fatigue.", "耗费2 AP 和增加15疲劳。");
	text = text.replace("Rattle your enemies to their bones to weaken them!", "让你的敌人筋疲力尽，削弱他们！");
	text = text.replace("Through hits to the funny bone, to stubbed toes, and forehead lumps, you have learned the most effective places to aim to injure your opponents!", "通过击中有趣的骨头、短脚趾和额头肿块，你已经学会了最有效的打击目标，以伤害你的对手！");
	text = text.replace("Roll out the barrel, feel it in your bones!", "用你的直觉对付这些铁罐头！");
	text = text.replace("The Polehammer has a reduced penalty for attacking targets directly adjacent.", "长锤攻击相邻目标的惩罚降低。");
	text = text.replace("Strip them of their protection while they still wear it!", "趁他们还戴着它的时候，把他们的保护剥掉！");
	text = text.replace("Learn to strike at your target\'s softest spots, causing intense internal bleeding.", "学会攻击目标最柔软的部位，导致严重的内出血。");
	text = text.replace("'Can\'t fight if they can\'t walk.\'", "‘如果他们不能走路，就不能战斗。’");
	text = text.replace("The Longaxe has a reduced penalty for attacking targets directly adjacent.", "长斧攻击相邻目标的惩罚降低。");
	text = text.replace("Tip... edge... pommel... all parts with which to kill a man!", "提示... 边缘... 鞍头... 所有可以杀人的部位！");
	text = text.replace("A low shield. A slobby stab. A fake stumble. All are ways that you\'ve learned to tempt your opponent into a fatal false move!", "降盾、慢刺、假绊倒。所有这些都是你学会的引诱对手做出致命错误举动的方法！");
	text = text.replace("A well-balanced sword is like an extension of yourself!", "一把平衡的剑就像你自己的延伸！");
	text = text.replace("Master the art of fighting with a sword.", "掌握用剑战斗的艺术。\n");
	text = text.replace(/Slash, Split, Swing, Overhead Strike and Great Slash gain (.*?) chance to hit./, "挥砍、劈击、挥击、头顶打击和大斜劈 $1命中几率。");
	text = text.replace("By keeping ahead of your opponent, you set the terms of engagement!", "领先于对手，你设定了交战条款！");
	text = text.replace("Practiced footwork allows you to dance around your opponents!", "熟练的步法可以让你在对手周围跳舞！");
	text = text.replace("You\'ve become so well-practiced with a blade that attacking and defending are done congruously!", "你已经非常熟练地使用刀锋，进攻和防守都是一致的！");
	text = text.replace("Does not build any Fatigue and costs no Action Points", "不会产生任何疲劳，也不需要行动点");
	text = text.replace("Striking when an enemy is distracted allows this character to aim for the vulnerable bits!", "当敌人分心时攻击可以让这个角色瞄准易受攻击的部位！");
	text = text.replace("Take advantage of your dagger\'s light weight to maneuver around the battlefield faster than your enemies!", "利用匕首的轻重量，比敌人更快地在战场上机动！");
	text = text.replace("Stab, Puncture and Deathblow  have a reduced Action Point cost to allow for an additional attack each turn.", "刺击、穿刺和致命攻击 降低行动点耗费，允许每回合额外攻击。");
	text = text.replace("Here, take another one!", "来，再来一个！");
	text = text.replace("Master the art of following up for devastating effects.", "掌握跟进毁灭效果的技巧。");
	text = text.replace("Create an opening, then finish them!", "创建一个开口，然后结束它们！");
	text = text.replace(/A successful attack with daggers reduces the Action Point cost of all dagger skills by (.*?) to a minimum of (.*?) for the remainder of this turn\./, "在本回合剩余时间内，成功的匕首攻击将使所有匕首技能的行动点消耗减少$1到至少$2。");
	text = text.replace("The effect expires upon missing an attack, switching your weapon, or using any skill that is not a dagger attack.", "该效果在错过攻击、切换武器或使用任何非匕首攻击的技能时失效。");
	text = text.replace("Only works with daggers equipped in the Mainhand.", "只能在主手配备匕首的情况下使用。");
	text = text.replace("Your battle brothers feel confident when you\'re there backing them up!", "当你支持你的战友时，他们会感到自信！");
	text = text.replace("Use the reach of your weapon to find an angle on the head!", "用你武器的触角在头部找到一个角度！");
	text = text.replace("\'Trust me, ye don\'t want to be on the other end of a spile on a pole!\'", "‘相信我，你可不想站在杆子的另一端！’");
	text = text.replace("\'Trust me, ye don\'t want to be on the other end of a spike on a pole!\'", "‘相信我，你可不想站在尖头的另一端！’");
	text = text.replace("All skills with two-handed weapons, with a range of 2 tiles,", "所有使用双手武器的技能，范围为2格，");
	text = text.replace(/having an Action Point cost of (.*?) have their Action Point cost reduced to (.*?),/, "行动点成本为$1时，行动点成本降低为$2");
	text = text.replace("and have a reduced penalty for attacking targets directly adjacent.", "并且减少对相邻目标的攻击惩罚。");
	text = text.replace("Swing it easier, or bring it down harder!", "更轻松地挥动它，或者更用力地把它放下！");
	text = text.replace("\'When your buddy\'s hittin\' \'em, you hit \'em too!\'", "‘当你的朋友打他们时，你也会打他们！’");
	text = text.replace("\'If the target is watchin\' the head of yer pike, they\'re sure not watchin\' their back!\'", "‘如果目标正盯着你的枪头，他们肯定不会盯着自己的背！’");
	text = text.replace("The first lesson every fighter gets taught, stick \'em with the pointy end!", "每个拳击手都会学到的第一课，用尖头把他们粘在一起！");
	text = text.replace(/Endless training in holding the line in a spear wall has made it a second nature\. Spearwall costs (.*?) less fatigue, (.*?) Action Points and does (.*?) damage\. Stacks with Spear Mastery\./, "无休止训练用矛阵守住阵线，使它成为第二天性。矛阵耗费疲劳$1，行动点$2，伤害$3。与矛精通叠加。");
	text = text.replace("Learn to call your strikes and target gaps in your opponents\' armor!", "学会将你的攻击和目标对准对手的盔甲！");
	text = text.replace(/Glaive Slash gains (.*?) chance to hit\./, "挥砍命中几率 $1 。");
	text = text.replace("Practice in spear-handling has taught you to strike in the most efficient way possible!", "长矛操作的实践教会了你以最有效的方式打击！");
	text = text.replace("\'Don\'t hold it like that you buffoon... like THIS!\'", "‘别那样拿着它，你这个小丑……像这样！’");
	text = text.replace("A spear has a strong advantage. Reach advantage.", "\n矛有很强的优势。提升优势。");
//	text = text.replace(/When double-gripping One-Handed spears, the range of Thrust is increased to 2 tiles. When used at this range, it does (.*?) reduced damage, has no bonus chance to hit, and has (.*?) chance to hit per character between you and the target\./, "当双握单手矛时，‘猛推’攻击范围增加到2格。当在这个范围内使用时，造成伤害降低$1，没有命中加成，并且你和目标之间每有一个角色命中几率 2%。");
	text = text.replace(/When using a spear, every successful hit against an opponent increases your Melee Skill and Melee Defense against that opponent by (.*?) up to a maximum of (.*?)\. This bonus does not expire on its own but is lost upon taking damage from that opponent\./, "当使用长矛时，每一次对对手的成功打击都会使你的近战技能和对该对手的近战防御增加$1，最多增加$2。此奖励不会自动失效，只有受到该对手的伤害时才失效。");
//	text = text.replace(/When using Two-Handed spears, Melee Damage is increased by (.*?) for Piercing type attacks\./, "当使用双手矛时，刺穿型攻击的近战伤害增加$1。");
	text = text.replace("One King to rule them all!", "一个国王统治他们所有人！");
	text = text.replace(/Causes all of your ranged attacks during a turn to apply a debuff on the target for (.*?) turns, reducing their Melee and Ranged Defense by (.*?) each and requiring them to spend (.*?) additional Action Points per tile moved\. These effects are halved on the second turn\./, "使你的所有远程攻击在一个回合内对目标施加一个减益，持续$1回合，使他们的近战防御和远程防御各减少$2，并使他们每移动一格额外花费$3行动点。这些效果在第二回合时减半。");
	text = text.replace(/Arrows to the knee deal (.*?) reduced Ranged Damage, have a (.*?) chance to hit and a (.*?) chance to hit the head\./, "射向膝盖的箭造成$1远程伤害，有$2次命中几率和$3击中头部几率。");
	text = text.replace("Rain down arrows upon your enemies from a higher angle, forcing them to divert their attention!", "从更高的角度向你的敌人射箭，迫使他们转移注意力！");
	text = text.replace(/When using bows, every attack, hit or miss, applies a stacking debuff on the target reducing their Melee Skill and Ranged Skill by (.*?) and Melee Defense by (.*?) for one turn\./, "使用弓箭时，每次攻击，命中或未命中，都会对目标施加叠加减益，使其近战技能和远程技能$1，近战防御$2，持续一回合。");
	text = text.replace(/Enemies adjacent to the primary target receive half a stack\./, "与主目标相邻的敌人会受到一半叠加层数的减益效果。");
	text = text.replace(/Can stack up to a maximum of (.*?) times\./, "最多可叠加$1次。");
	text = text.replace(/Can have a maximum of (.*?) stacks\./, "最多可叠加$1层。");
	text = text.replace("'Hatchet, throwing axe, spear, javelin... they all kill just the same!\'", "‘斧头、飞斧、长矛、标枪...他们都一样杀人！’");
	text = text.replace("'Ye\'ve gotta get a running start!\'", "‘你必须有一个助跑！’");
	text = text.replace("They won\'t even see it comin\'!", "‘他们甚至看不到它的到来！’");
	text = text.replace(/The Action Point cost of the first (.*?) Throwing attacks during a combat are (.*?)\./, "战斗中前$1次投掷攻击的行动点耗费$2。");
	text = text.replace("\'I\'m not lootin\' Captain! Just grabbing my javelin!\'", "‘我不是抢劫 队长！只是抓住我的标枪！’");
	text = text.replace("Cannot trigger on the same corpse twice.", "不能在同一具尸体上触发两次。");
	text = text.replace("\'Don\'t attack until you\'ve seen the whites of their eyes!\'", "‘在你看到他们的白眼之前不要攻击他们！’");
	text = text.replace("\'One javelin to the head will take \'em right out!\'", "‘一枪击中头部，他们就会被击毙！’");
	text = text.replace(/Gain (.*?) ranged skill and (.*?) armor damage while using a sling or slingshot\./, "使用吊索或弹弓时获得$1远程技能和点2护甲伤害。");
	text = text.replace(/Gain (.*?) ranged skill and (.*?) armor damage while using a slingstaff at range \(but increases the AP cost of Sling Heavy Stone by Fatigue and (.*?) cost by (.*?)\)\./, "在远程使用投石器时获得$1远程技能和$2护甲伤害(但‘抛重石’的AP耗费增加$3，疲劳增加$4)。");
	text = text.replace(/Gain (.*?) ranged skill and (.*?) armor damage while using a slingstaff at range \(but increases the AP cost of Sling Heavy Stone by (.*?) and Fatigue cost by (.*?)\)\./, "在远程使用投石器时获得$1远程技能和$2护甲伤害(但‘抛重石’的AP耗费增加$3，疲劳增加$4)。");
//						 Gain (.*?) ranged skill and (.*?) armor damage while using a slingstaff at range \(but increases the AP cost of Sling Heavy Stone by (.*?) and Fatigue cost by (.*?)\).",
	text = text.replace("Take your time and get it right, just like the Captain says!", "慢慢来，照队长说的就对了！");
	text = text.replace("Proficiency with your sling has enabled you to launch heavier stones full-distance!", "熟练使用吊带可以让你发射更重的石头到全距离！");
	text = text.replace("They can\'t defend from it if they can\'t see it coming!", "如果他们看不到它的到来，他们就无法抵御它！");
	text = text.replace(/Accuracy with slings and slingshots is increased by (.*?) and maximum firing range with slings and slingshots is increased by (.*?)\. Fatigue cost for Slings and slingshots reduced by (.*?)\./, "使用吊索和弹弓的精度增加$1，使用吊索和弹弓的最大射程增加$2。吊索和吊索的疲劳成本降低$3。");
	text = text.replace(/Gain (.*?) damage while using a sling or slingshot\./, "使用吊索或弹弓时伤害$1。");
	text = text.replace(/Gain (.*?) damage while using a slingstaff at range \(but increases the AP cost of Sling Heavy Stone by Fatigue and (.*?) cost by (.*?)\)\./, "在远程使用投石器时伤害$1(但‘抛重石’的AP耗费增加$2，疲劳增加$3)。");
	text = text.replace(/Gain (.*?) damage while using a slingstaff at range \(but increases the AP cost of Sling Heavy Stone by (.*?) and Fatigue cost by (.*?)\)\./, "在远程使用投石器时伤害$1(但‘抛重石’的AP耗费增加$2，疲劳增加$3)。");


	text = text.replace("Twist and thrust with your staff to deflect blows and intercept strikes.", "用你的法杖扭转和推进，以转移打击和拦截打击。");
	text = text.replace(/Gain (.*?) Melee Defense when wielding a staff. Gain half of this bonus when wielding a musical instrument\./, "挥舞法杖时获得$1近战防御。使用乐器时获得此加成的一半。");
	text = text.replace("Move with offputting speed, feinting, poking, battering and catching your opponents off guard.", "以令人不快的速度移动，假装、戳、殴打并让对手措手不及。");
	text = text.replace("The length and dexterity of a staff allows you to comfortably strike at the most debilitating places!", "一根法杖的长度和灵巧度让你可以舒适地打击最让人虚弱的地方！");
	text = text.replace("Master the art of fighting with staves.", "掌握用法杖战斗的艺术。");
	text = text.replace("Master the movements required to spin your staff in a great flourish that lands with additional force.", "掌握旋转你的法杖所需的动作，使其以更大的力度落地。");
	text = text.replace(/Any strike with a staff that would normally daze, also stuns and staggers\. This does not apply to AOE attacks\./, "法杖的敲击一般会让人恍惚，也会使人晕眩和趔趄。这不适用于AOE攻击。");
	text = text.replace(/Any strike with a staff that would normally daze, also stuns and staggers\./,"使用法杖时任何导致茫然的攻击也会使目标困惑和眩晕。");
	text = text.replace(/Whack a\' Smack gains (.*?) chance to hit\./,"猛击增加$1命中几率。");
	text = text.replace(/Staff Sweep now applies Dazed\./,"法杖横扫也会施加茫然。");

	text = text.replace("It ain\'t hard to dodge \'em when they\'re flailing around like fools...!\'", "‘当他们像傻瓜一样四处游荡时，躲避他们并不难…！’");
	text = text.replace("\'... then you smack \'em one when e\'s not lookin\'!\'", "... 然后你在他不注意的时候打他一巴掌！");
	text = text.replace("The Spetum and Warfork have a reduced penalty for attacking targets directly adjacent.", "长戟和战叉攻击相邻的目标惩罚降低。");
	text = text.replace("Master the difficult angles and timings of slinging rocks from afar.", "掌握从远处抛石头的困难角度和时机。");
	text = text.replace("Force your enemies to neglect offense with the sweeping swings of your weapon!", "通过挥舞你的武器迫使你的敌人忽视进攻！");
	text = text.replace("Make them think twice about getting close!", "让他们在接近时三思而后行！");
	text = text.replace("Through familiarity and training with your weapon, you know just how your projectiles will fly.", "通过熟悉和训练你的武器，你知道你的射弹将如何飞行。");
	text = text.replace("You have learned to read the wind, estimating the path of arrows in uncertain conditions. This is very helpful for dodging arrows, but can also be applied to shooting them as well.", "你已经学会了解读风向，在不确定的情况下估计箭头的路径。这对躲避箭非常有帮助，但也可以用于射箭。");
	text = text.replace(/Gain (.*?) damage while using a shortbow, wonky bow, boondock bow or reinforced boondock bow\. Only (.*?) of this skill applies to other bows\./, "使用短弓、歪斜弓、处刑之弓或强化处刑之弓时获得$1伤害。其他弓只有$2效果。");
	text = text.replace(/Gain (.*?) ranged skill and (.*?) armor penetration while using a shortbow, wonky bow, boondock bow or reinforced boondock bow\. Only (.*?) of this applies to other bows\./, "使用短弓、歪斜弓、处刑之弓或强化处刑之弓时获得$1远程技能和$2的装甲穿透力。其他弓只有$3效果。");
	text = text.replace("Like wheat before a scythe!", "就像镰刀前的小麦！");
	text = text.replace(/Gain (.*?) melee skill and defense while using a musical instrument\./, "使用乐器时获得$1近战技能和防御。");
	text = text.replace(/Deal an extra (.*?) damage while using a musical instrument\./, "使用乐器时额外造成$1伤害");
	text = text.replace("Use your athletic skill to leap high and far, covering two tiles distance but at a great fatigue cost. Unlocks the \'Leap\' skill.", "用你的运动技能跳得又高又远，跨越两格的距离，但要付出巨大的疲劳代价。解锁“跳跃”技能。");
	text = text.replace("Practice in physical movement with a partner has given the ability to take the lead and move someone\'s body in a twirling movement. If you have taken the \'Rotation\' perk, it can now target enemies.", "与同伴一起进行身体运动的练习，使他们有能力引导并移动某人的身体。如果你有‘换位’特技，现在可以和敌人换位了。");
	text = text.replace("Extensive training in circus manuevers allows you to move out of harms way with astonishing speed. If you have taken the \'Footwork\' perk, it gains 1 range.", "在马戏团进行的大量训练可以让你以惊人的速度摆脱危险。如果你有“步法”特技，增加1格距离。");

	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	text = text.replace("aaaa", "aaaa");
	
    text = text.replace(/All damage inflicted is increased by (.*?) for any weapon used, including fists\./, "使用任何武器时全部伤害都会提升 $1 ，包括拳头。");
	text = text.replace(/This character does not count towards your party strength when determining game difficulty. They will gain (.*?) resolve. They become content with being in reserve, and will grow unhappy if they are in more than half of the battles your company takes\./, "这个角色不会参与难度计算，并且满足于处于后备。但是如果参加了连队超过一半的战斗会变得不开心。");
    text = text.replace(/Also grants (.*?) scouting in camp\./, "露营时还会增加 $1 侦察速度。");
	text = text.replace(/Put your full weight into defending every blow and gain (.*?) of the combined fatigue modifier from body, head, main hand and off hand as Melee Defense\./, "将全身的重量施加在每次攻击上，获得相当于身体，头部，主手和副手的全部重量修正的 $1 作为近战防御加成。");
	text = text.replace(/All attacks cost (.*?) Fatigue to use and weapon condition degrades only half as fast\./, "使用所有武器少产生 $1 疲劳，武器的耐久度损耗降为一半。");
//	text = text.replace(/Allies at a range of 5 tiles or less will get (.*?) of this character\'s Resolve as a bonus added to their own, up to a maximum of this character\'s Resolve.\n\nDoes not stack; the sergeant with the highest Resolve will apply the bonus\./, "五格内的友方获得相当于该角色决心值 $1 的决心值加成，不会超过该角色的决心值。不叠加，只有决心最高的中士会施加这个效果。");
	text = text.replace(/Allies at a range of 5 tiles or less will get (.*?) of this character\'s Resolve as a bonus added to their own, up to a maximum of this character\'s Resolve\./, "五格内的友方获得相当于该角色决心值 $1 的决心值加成，不会超过该角色的决心值。");
	text = text.replace(/Does not stack; the sergeant with the highest Resolve will apply the bonus\./, "不叠加，只有决心最高的中士会施加这个效果。");
	text = text.replace("Enables the character to move swiftly and safely through any Zone of Control for the next whole turn without incurring any free attacks.", "使该角色下回合可用不触发借机攻击的迅捷安全的在敌人的控制区域移动。");
	text = text.replace("Picking the perk will also add \'Furinkazan\' to your perk map, which could reduce the cost of \'Evasion\'.", "选择该特技也会将‘风火山林’添加到您的特技树中，这可以降低‘回避’的使用成本。");
	
	text = text.replace("Unlocks a ranged attack that can deform, rip and otherwise render the target\'s armor unusable with great effect. Although the impact will be felt through the thickest of armor, it won\'t greatly injure the wearer.", "解锁强力远程攻击，可以损毁、撕裂或以其他方式使目标的盔甲无法使用，效果显著。虽然厚实的盔甲可以感受到冲击，但不会对穿戴者造成太大伤害。");
	text = text.replace(/Wither and age a target for three turns, reducing their damage, initiative and fatigue by (.*?), the effect lessens by (.*?) each turn\./, "虚弱和衰老一个目标三回合，降低他 $1 伤害输出，主动性和疲劳，每回合这效果都会减弱$2。");
	text = text.replace("Your fingers turn ghostly and pass through steel and flesh, tearing at the soul of your victim.", "你的手指鬼灵般的穿过钢铁和肉体，撕裂受害者的灵魂。");
	text = text.replace("You tie your soul to your enemy, your pain becomes their pain.", "连接你和敌人的灵魂，你的痛苦变为了他们的痛苦。");
	text = text.replace("Release a cloud of noxious gasses that are harmful to any living being.", "释放一团对任何生物都有害的有毒气体。");
	text = text.replace("Disapparate from your current location and reappear on the other side of the battlefield up to 6 tiles away.", "使你从当前位置消失并出现在战场上最多6格距离远的另一位置。");
	text = text.replace("Assault the senses of your target with a flurry of colorful movement and sounds. Such an astonishing display is sure to leave anyone too bewildered to fight effectively. Uses Ranged skill, chance to hit doubled if you have the Taunt perk. Does no damage.", "用花里胡哨的动作和声音使目标的感官难受。如此讨厌的表演肯定会让任何人不知所措，无法有效地战斗。依赖于远程技能，如果你有嘲讽perk，命中几率翻倍。不会造成伤害。");
	text = text.replace("Concoct a mixture of smells so fetid and noxious, you force your target to retreat just so they can breathe.", "释放一种恶臭和有毒的气味，迫使你的目标撤退，否则难以呼吸。");
	text = text.replace("Unleash a brilliant flash of white light aimed directly at the eyes of your target in an attempt to blind and incapacitate.", "释放一道耀眼的闪光，直射目标的眼睛，试图使其失明和致残。");
	text = text.replace("With a trick of the light, captivate your target in such a way that they can\'t help but approach you.", "用光影的小把戏，迷惑目标，让他们忍不住靠近你。");
	text = text.replace("Enshroud the area with thick smoke that draws the vigor out of your foes. Those that breathe in too much are forced into a light sleep.", "用浓烟掩蔽该区域，让敌人失去活力。那些呼吸过多的人会被迫进入轻度睡眠。");
	text = text.replace("throw a noxious concoction that sets the ground alight. Requires a staff.", "扔一种有毒的混合物，使地面着火。需要法杖。");
	text = text.replace("Allows you to boost the attacks of an undead minion.", "允许你增强一个不死族随从的攻击。");
	text = text.replace("Master the art of bandaging mid battle using any cloth available, this character no longer requires a bandage item to bandage allies, and can bandage while in a zone of control.", "掌握在战斗中使用任何可用的布料包扎的艺术，这个角色不再需要绷带来包扎盟友，并且可以在敌人控制区域内包扎。");
	text = text.replace(/Direct your troops to stand their ground, granting either (.*?) melee or ranged defence to all allies within (.*?) tiles for one turn\./, "指引你的部队坚守他们的岗位，使 $1 内的所有友方获得 $2 近战防御或者远程防御，持续一回合。");
	text = text.replace(/Direct your troops to time their shots, granting (.*?) ranged attack to all allies within (.*?) tiles for one turn\./, "指引你的部队瞄准射击，使 $1 内的所有友方获得 $2 远攻，持续一回合。");
	text = text.replace(/Direct your troops to attack at once, granting either (.*?) melee or ranged skill to all allies within (.*?) tiles for one turn\./, "指引你的部队立即近攻，使 $1 内的所有友方获得 $2 近攻或者远攻，持续一回合。");
	text = text.replace("Unleash an arcing barrage that strikes an opponent and sending sparks on to another 3 enemies, dealing additional damage and ignoring armor. Requires a staff.", "施放弧形弹幕命中敌人并在另外最多三个敌人身上激起火花，造成额外的伤害和护甲穿透。需要法杖。");
	text = text.replace("Use your superior vision and training to spot targets in the gloom, and grant that vision to your allies.", "使用你的超凡视野和训练来发现黑暗中的目标，并将这种视野赋予你的盟友。");
	text = text.replace("The Vala becomes a master at inscribing the intricate and subtle signs, allowing her to create the rune sigils at a faster rate.", "瓦拉成为雕刻复杂微妙符号的大师，使她能够以更快的速度创造符文符号。");
	text = text.replace("Allows the Vala to inscribe rocks with weapon specific rune sigils while encamped to create powerful rune stones.", "允许瓦拉在扎营制造符文时篆刻出武器特化符文印记。");
	text = text.replace("Possibilities: accuracy, bleeding, feeding, poison, power.", "包括：精准、流血、捕食、毒性和力量。");
	text = text.replace("Allows the Vala to inscribe rocks with weapon specific rune sigils while encamped to create powerful rune stones.", "允许瓦拉在扎营制造符文时篆刻出武器特化符文印记。");
	text = text.replace("Possibilities: accuracy, power.", "包括：精准、力量。");
	text = text.replace("Allows the Vala to inscribe rocks with helmet specific rune sigils while encamped to create powerful rune stones.", "允许瓦拉在扎营制造符文时篆刻出头盔特化符文印记。");
	text = text.replace("Possibilities: bravery, clarity, luck.", "包括：勇气、清晰和安全。");
	text = text.replace("Allows the Vala to inscribe rocks with armor specific rune sigils while encamped to create powerful rune stones.", "允许瓦拉在扎营制造符文时篆刻出盔甲特化符文印记。");
	text = text.replace("Possibilities: endurance, resilience, safety.", "包括：耐力、韧性和安全。");
	text = text.replace("Allows the Vala to inscribe rocks with armor specific rune sigils while encamped to create powerful rune stones.", "允许瓦拉在扎营制造符文时篆刻出盔甲特化符文印记。");
	text = text.replace("Possibilities: endurance, safety.", "包括：耐力、安全。");
	text = text.replace("Allows the Vala to inscribe rocks with shield specific rune sigils while encamped to create powerful rune stones.", "允许瓦拉在扎营制造符文时篆刻出盾牌特化符文印记。");
	text = text.replace("Possibilities: defense, radiance.", "包括：防御和光辉");
	text = text.replace("Chants build up 25% less Fatigue and have greater potency.", "吟唱减少25%的疲劳，并更有效果。");
	text = text.replace("Enemies adjacent to the Vala are unable to enforce Zones of Control, making it easy to slip past them.", "瓦拉附近的敌人无法实施控制区，很容易从他们身边溜走。");
	text = text.replace("Allies within 3 tiles of the Vala, including the Vala herself, receive a bonus to their damage output and a chance to retaliate against attackers that hit them in melee range.", "在瓦拉三格范围内的友军，包括瓦拉，增加一定的伤害输出，并且有一定概率被近战击中时反击敌人。");
	text = text.replace("A very disagreeable and cacophonous chant that makes it almost impossible for the Vala\'s enemies to focus and concentrate properly.", "这是一首非常令人不快且刺耳的圣歌，使得瓦拉的敌人几乎无法集中注意力。");
	text = text.replace("An intriguing chant that stimulates the senses, increasing all allies\' awareness.", "一首有趣的圣歌，刺激感官，增加所有盟友的意识。");
	text = text.replace("Allies within 3 tiles of the Vala, including the Vala herself, receive a bonus to their melee and ranged defenses.", "在瓦拉三格范围内的友军，包括瓦拉，获得近战技能和近战防御的加成。");
	text = text.replace("Entering trances builds up 25% less Fatigue. Gain a 50% chance to not drop out of trance when receiving damage. Successful trances are more likely to occur.", "通灵少产生25%疲劳。有50%的概率受到伤害时也不会中断吟唱。通灵更容易成功。");
	text = text.replace("Incorporeal Perspective.", "无形视角。");
	text = text.replace("Each individual has a warden spirit that follows their soul from birth to death. The Vala, being spiritually attuned, has a remarkable connection to and relation with her Warden which allows it to manifest itself in a semi-physical form and help her out during battle.", "每个人都有一种从出生到死亡都伴随着他们灵魂的守护神精神。瓦拉在精神上是协调一致的，与她的守望者有着非凡的联系和关系，这使得它能够以半物质的形式表现出来，并在战斗中帮助她。");
	text = text.replace("Automatically summons the Warden at the start of a fight. It can be beaten, but it never dies.", "打斗开始时自动传唤守望者。它可以被打败，但它永远不会死。");
	text = text.replace("The bond between the Vala and her Warden has grown strong with the passing of time.", "随着时间的推移，瓦拉和守望者之间的联系越来越紧密。");
	text = text.replace("A percentage of the Vala\'s incoming health damage is dealt to the Warden instead, up to a maximum of 50%. The Warden also gains a scaling damage bonus.", "瓦拉受到的生命伤害有一部分会被转给守望者，最高可达50%。守望者也会获得相应的伤害加成。");
//	text = text.replace("A percentage of the Vala\'s incoming health damage is dealt to the Warden instead, up to a maximum of 50%. The Warden also gains a scaling damage bonus.\n\nThis perk does nothing unless the Vala has the Warden perk.", "随着时间的推移，瓦拉和守望者之间的联系越来越紧密。瓦拉的健康伤害的一部分会被转给典狱长，最高可达50%。守望者也会获得缩放伤害加成。除非瓦拉有典狱长特权，否则这个特权什么都没有。");
//	text = text.replace("This perk does nothing unless the Vala has the Warden perk.", "随着时间的推移，瓦拉和守望者之间的联系越来越紧密。瓦拉的健康伤害的一部分会被转给典狱长，最高可达50%。守望者也会获得缩放伤害加成。除非瓦拉有典狱长特权，否则这个特权什么都没有。");
	text = text.replace("This perk does nothing unless the Vala has the Warden perk.", "瓦拉必须有'守望者'特技，否则这个特权什么用都没有。");
	text = text.replace("The Vala needs her staff equipped for this perk to work, and then each attack has a chance to apply a stacking debuff. Each stack lowers maximum hitpoints and increases amount of damage taken.", "这个特技只有在瓦拉装备法杖后生效，每次攻击都会对敌人施加可以叠加的debuff。每层降低最大生命值并增加所受伤害。");
	text = text.replace("As if being warned by some higher being, the Vala occasionally gets glimpses of the immediate future and any dangers it may hold, letting her prepare herself accordingly.", "仿佛受到某个更高存有的警告，瓦拉偶尔会瞥见眼前的未来和它可能包含的任何危险，让她做好相应的准备。");
	text = text.replace("Helps the Vala avoid incoming damage. Her understanding of these visions grows stronger as she becomes more experienced.", "防止瓦拉受到伤害。随着经验的增加，她对这些愿景的理解也越来越强。");
	text = text.replace(/Gain (.*?) damage while using a Butchers Cleaver\. (.*?) of this skill applies to One Handed Cleavers, except whips\./, "使用屠夫菜刀时获得 $1 伤害加成。对其他单手砍刀只有$2效果。");
	text = text.replace("Grants the active skill Prepare to Bleed that primes your next strike to inflict intense but short lived bleeding.", "获得准备放血的主动技能，允许你下次攻击造成强烈但短暂的流血效果。");
	text = text.replace("Grants the active skill Prepare to Graze that primes your next strike to inflict weak but long lasting bleeding.", "获得准备擦伤的主动技能，允许你下次攻击造成微弱但持久的流血效果。");
	text = text.replace("Unlocks the Net recipe in the crafting tent. Also grants +10 melee defense while holding a net", "解锁在制作帐篷修理网的配方。持有网时还会获得10近战防御。");
	text = text.replace("Increases the range of nets and reinforced nets to 4.", "投掷网和加强网的范围增加至4格。");
	text = text.replace("Increases the throwing range of nets and reinforced nets by 2.", "投掷网和加强网的范围增加2格。");
	text = text.replace("Release a controlled forceful bolt, leaping towards a foe. Damage based on current initiative, accuracy based on ranged attack skill.", "释放能够控制的强力的奥术弹，冲向敌人。伤害基于当前主动值，命中率基于远程技能。");
	text = text.replace("Unlocks food crafting in the crafting tent. Allows the creation of porridge, puddings, pies, meat curing, fruit drying and ration making.", "解锁在制造帐篷制作食物。允许制作粥，布丁，派，腌肉，干果和口粮。");
	text = text.replace("Unlocks the ability to store additional dog items in your bags and use them in battle.", "使你可以在背包里储存额外的战犬并在战斗中使用。");
	text = text.replace("Grants each dog you unleash the perks Colossus, Fortified Mind and Underdog.", "你释放的每只战犬获得巨人，强化思想和落单狗perk。");
	text = text.replace("Unlocks a recipe in the crafting tent for breeding dogs.", "解锁在制造帐篷喂养狗的配方。");
	text = text.replace("In the heat of battle your hounds will respond and react to your commands. Order them to attack or defend allies.", "战斗中你的战犬将会回应并执行你的命令。指引他们进攻或者守卫友方。");
	text = text.replace("By spending one item of food you can make a dog flee from battle. The food item is chosen at random and the perk does not work if you have less than 25 food.", "花费一种食物让敌人的战犬从战场中逃跑。食物会随机选择，如果你食物少于25则这个perk不生效。");
	text = text.replace(/Adjacent allies gain (.*?) of their resolve as hitpoints at the end of their turn. Inflicts a disintegrating ailment on each adjacent undead. Does not work on cultists\./, "相邻的友方在他们回合结束时回复相当于 $1 决心值的生命值。使相邻的不死族崩坏。对异教徒不生效。");
	text = text.replace(/Adjacent allies gain (.*?) of their resolve as Melee and Ranged Defense. Adjacent undead are Baffled. Does not work on cultists\./, "相邻的友方获得相当于 $1 决心值的近战防御和远程防御。相邻的不死族会困惑。对异教徒不生效。");
	text = text.replace("Any of your mercenaries that enters the tile will become Sanctified, gaining immunity from injuries for two turns. Any undead unit that enters the tile will become Consecrated, becoming affected by injuries and unable to resurrect for two turns.", "任何进入区域的雇佣兵会免得神圣化，两回合内免疫受伤。进入的不死族会接受洗礼，两回合内会受伤并且无法复生。");
	text = text.replace("Taking this perk ensures every mercenary with a shield will use shieldwall before the start of each battle.", "拥有这个perk会使你所有装备盾的雇佣兵在回合开始时使用盾墙。");
	text = text.replace(/Grants (.*?) ranged defence to all allies within (.*?) tiles for one turn\./, "使 $2 内的所有友方在一回合内获得 $1 远程防御。");
//start
	text = text.replace("Don\'t slow down!", "别减速！");
	text = text.replace("Knights would do well to fear your heavy blows.", "骑士们最好害怕你的重击。");
	text = text.replace(/At all times your Initiative is reduced only by (.*?) of your accumulated Fatigue, instead of all of it\./, "在任何时候，你的主动值只会减少你累积疲劳的 $1，而不是全部。");
	text = text.replace("In addition, using the \'Wait\' command will no longer give you a penalty to Initiative in the next round.", "另外，使用“等待”命令将不再对下一轮的主动值进行惩罚。");
	text = text.replace(/Gain (.*?) permanent hitpoint for every opponent slain\./, "每击杀一个对手获得生命值永久性 $1。");
	text = text.replace(/Effectiveness vs. Armor is increased by (.*?) for any weapon used\./, "使用任何武器作用于盔甲的效果都会增加 $1。");
	text = text.replace(/Put full force in your every blow!/, "每一次打击都要全力！");
	text = text.replace(/Shield damage is increased by (.*?) when using the Split Shield skill\./, "使用劈盾技能时，对盾牌的伤害增加 $1。");
	text = text.replace("If you can see the white in your enemy\'s eyes, aim for it!", "如果你能看到敌人眼中的白光，瞄准它！");
	text = text.replace(/Damage is increased by (.*?) when using a ranged weapon \(including throwing weapons\) against a target 2 or less tiles away\./, "当使用远程武器（包括投掷武器）攻击的目标距离2格或更近时，伤害增加 $1。");
	text = text.replace(/Nailed it! The penalty to hitchance when shooting at a target you have no clear line of fire to is reduced from (.*?) to (.*?) for ranged weapons\./, "钉牢它！当你使用远程武器对一个目标射击，如果你没有清晰的射击线时，命中率的惩罚从 $1 减少到 $2。");
	text = text.replace(/The range penalty to hitchance is reduced by (.*?) per tile\./, "远程命中率惩罚每格距离减少 $1。");
	text = text.replace(/RAAARGH! Once per turn, upon killing an enemy, (.*?) Action Points are immediately regained\./, "杀啊！每回合只限一次，杀死一个敌人，立即恢复 $1 行动点。");
	text = text.replace("Characters can not regain more than their maximum Action Points and no more than 4 for a single attack.", "在一次攻击中不能恢复超过其最大行动点也不能超过4。");
	text = text.replace(/Melee kills always are fatalities and have a (.*?) penalty to enemy Resolve checks\./, "近战杀戮总是残暴的，对敌人的决心有 $1 的惩罚。");
	text = text.replace("A gruesome display, enemies are more likely to suffer from hits to morale as their allies get carved up and split in two.", "一个可怕的表现，敌人更可能遭受士气打击，因为他们的盟友被瓜分和分裂成两部分。");
	text = text.replace(/The chance to hit the head for critical damage is increased by (.*?) for all attacks\./, "击中头部的机率的增加 $1。");
	text = text.replace(/All damage inflicted is increased by (.*?) for any weapon used\. What could stand before you now\?/, "任何使用武器造成的伤害都会增加 $1。现在有什么能站在你面前？");
	text = text.replace("Go into a killing frenzy!", "疯狂杀戮！");
	text = text.replace(/A kill increases all damage by (.*?) for 2 turns\./, "杀戮增加所有伤害 $1 持续2回合。");
	text = text.replace("Does not stack, but another kill will reset the timer.", "不会叠加，但另一个杀戮会重新计时。");
	text = text.replace(/The Knock Back skill now also inflicts (.*?) - (.*?) Damage \((.*?) effective against armor\) and (.*?) Fatigue in addition to its normal effect, and costs (.*?) Fatigue less to use\./, "击退技能现在也造成 $1 - $2 伤害（$3效果作用于盔甲）和 $4 疲劳，除了它的正常效果外，并且花费疲劳减少$5。");
	text = text.replace(/The fatigue and initiative penalty from wearing armor and helmet is reduced by (.*?)\./, "穿戴盔甲和头盔的疲劳和主动值惩罚减少 $1。");
	text = text.replace("Immunity against being knocked back or pulled up close.", "对被撞退或拉近的豁免。");
	text = text.replace("Applies to skills such as Knock Back, Hook and others that change a character\'s position.", "适用于诸如撞退、钩拽等改变角色位置的技能。");
	text = text.replace("Unlocks the \'Taunt\' skill which makes the targeted opponent take offensive actions instead of defensive ones, and attack the taunting character over another, potentially more vulnerable one.", "解锁“嘲讽”技能，使目标对手采取攻击性行动而不是防御性行动，并攻击嘲讽的角色，而不是另一个更脆弱的角色。");
	text = text.replace("Getting hit by regular attacks does not cause a loss of fatigue anymore.", "受到攻击不会再造成疲劳。");
	text = text.replace("Attacks that specifically target fatigue are unaffected.", "针对疲劳的攻击不受影响。");
	text = text.replace(/Bring it on! Hitpoints are increased by (.*?), which also reduces the chance to sustain debilitating injuries when being hit\./, "尽管来！生命值增加 $1，这也减少了被击中时受到削弱损伤的几率。");
	text = text.replace("Learn to better deflect hits to the side instead of blocking them head on.", "学会更好地将打击转向侧面，而不是正面阻挡。");
	text = text.replace(/Shield damage received is reduced by (.*?) to a minimum of 1\./, "受到的盾牌损坏减少 $1 最小为1。");
	text = text.replace(/A moving target is an elusive one./, "移动的目标是难以捉摸的。");
	text = text.replace(/On getting hit with a ranged attack, there is a (.*?) chance to only take a gracing hit and suffer only (.*?) of the normal damage\./, "在受到远程攻击的打击时，有 $1 的几率受到轻微的打击，并且只受到正常伤害的 $2。");
	text = text.replace(/The shield defense bonus is increased by (.*?)\. This also applies to the additional defense bonus of the Shieldwall skill\./, "盾牌防御加成增加 $1。这也适用于盾墙技能的额外防御加成。");
	text = text.replace(/The \'Knock Back\' skill gains (.*?) chance to hit\./, "“击退”技能增加 $1 命中几率。");
	text = text.replace("Once per battle, upon receiving a killing blow, survive instead with a few hitpoints left.", "每次战斗一次，在受到致命一击后，只剩下几点生命值。");
	text = text.replace("The next hit is likely to kill you for good, of course.", "当然，下一次打击可能会永远杀死你。");
	text = text.replace("Once per battle, upon receiving a killing blow, survive instead with a few hitpoints left and have all damage over time effects (e.g. bleeding, poisoned) cured.", "每场战斗一次，在受到致命伤害后，你可以幸存下来，只剩下几点生命值，并且治愈所有持续时间内的伤害（例如流血，中毒）。");
	text = text.replace("The next hit is likely to kill you for good, of course, but improved defensive stats until your next turn help you to survive until then.", "当然，下一次攻击很可能会永远杀死你，但是在你的下一个回合之前提高的防御属性会帮助你在那之前生存下来。");
	text = text.replace("Immunity against being stunned.", "免疫昏迷。");
	text = text.replace(/Gain (.*?) additional Melee and Ranged Defense for every (.*?) of hitpoints missing\./, "每损失 $2 的生命值，额外增加 $1 的近战和远程防御。");
	text = text.replace(/All damage received is reduced by (.*?) for every opponent adjacent and in melee range, up to a (.*?) total damage reduction\./, "在近战范围内，每一个相邻的对手所受到的伤害都会减少 $1，最多可以减少 $2 的总伤害。");
	text = text.replace("Specialize in heavy armor!", "重甲专精！");
	text = text.replace(/Armor damage taken is reduced by a percentage equal to (.*?) of the current total armor value of both body and head armor\./, "受到的盔甲伤害减少相当于当前身体和头部盔甲总护甲值的 $1。");
	text = text.replace("The heavier your armor and helmet, the more you benefit.", "你的盔甲和头盔越厚重，你受益越多。");
	text = text.replace("Does not affect damage from mental attacks or status effects, but can help to avoid receiving them.", "不会影响精神攻击或状态效果造成的伤害，但有助于避免受到它们。");
	text = text.replace("Unlock two extra bag slots to carry all your favorite things.", "解锁两个附加的背包位置，以携带所有你喜欢的物品。");
	text = text.replace("Items placed in bags no longer give a penalty to Maximum Fatigue, except for two-handed weapons and shields.", "除了双手武器和盾牌外，装在背包里的物品不再会对最大疲劳造成惩罚。");
	text = text.replace("Items placed in bags no longer give a penalty to Maximum Fatigue, except for two-handed weapons.", "除了双手武器外，装在背包里的物品不再会对最大疲劳造成惩罚。");
	text = text.replace(/Fatigue regeneration is increased by (.*?) per turn\./, "疲劳恢复每回合增加 $1");
	text = text.replace(/If an attack misses, it costs (.*?) less fatigue than normal and you leave your opponent parried, lowering their defenses by 10\./, "如果攻击失败，消耗的疲劳比正常情况下少 $1，并让你的对手招架，降低他们的防御10。");
	text = text.replace(/If an attack misses, it costs (.*?) less fatigue than normal\./, "如果攻击失败，消耗的疲劳比正常情况下少 $1。");
	text = text.replace("Everything can be learned if you put your mind to it.", "如果你全神贯注，一切都可以学到。");
	text = text.replace(/Gain additional (.*?) experience from battle/, "从战斗中获得额外 $1 的经验。");
	text = text.replace("At the eleventh character level, you gain an additional perk point and this perk becomes inert.", "在十一级时，你获得额外的特技点，这个特技变得无效。");
	text = text.replace("At the eleventh character level, you gain an additional perk point. The bonus experience stays until level 99.", "在十一级时，你获得额外的特技点，特技效果持续到99级。");
	text = text.replace("When playing the \'Manhunters\' origin, your indebted get the perk point refunded at the seventh character level.", "在玩“搜捕者”的起源时，你的负债者将在七级时得到特技点退还。");
	text = text.replace("Playing the \'Manhunters\' origin, your indebted get the perk point refunded at the seventh character level.", "在玩“搜捕者”的起源时，你的负债者将在七级时得到特技点退还。");
	text = text.replace("Learn to find your enemies before they find you.", "学会在敌人找到你之前找到他们。");
	text = text.replace(/Vision is increased by (.*?)\./, "视野增加 $1。");
	text = text.replace(/Fatigue costs for all two-handed weapon skills are reduced by (.*?)\./, "使用所有双手武器技能的疲劳降低 $1。");
	text = text.replace("Learn to move on difficult terrain.", "学会在困难的地形上移动。");
	text = text.replace(/Action Point costs for movement on all terrain is reduced by (.*?) to a minimum of 2 Action Points per tile, and Fatigue cost is reduced to half\./, "在所有地形上移动的行动点消耗每格减少 $1 至少2个行动点，疲劳消耗减少到一半。");
	text = text.replace("Changing height levels also has no additional Action Point cost anymore.", "变更高度级别也不再需要额外的行动点。");
	text = text.replace("An iron will is not swayed from the true path easily.", "铁的意志不容易偏离正道。");
	text = text.replace(/Resolve is increased by (.*?)\./, "决心增加 $1。");
	text = text.replace("Use a sergeant on the battlefield as an extension of your leadership and to keep everyone in line.", "在战场上使用一名军士作为你领导能力的延伸，让每个人保持一致。");
	text = text.replace(/Allies at a range of 5 tiles or less will get (.*?) of this character\'s Resolve as a bonus added to their own, up to a maximum of this character\'s Resolve\./, "在5个格或更少范围内的盟友将获得此角色的决心的 $1，作为额外的奖励添加到他们自己的决心中，最多可以达到此角色的决心。");
	text = text.replace("Does not stack; the sergeant with the highest Resolve will apply the bonus.", "不会叠加；具有最高决心的军士将应用奖励。");
	text = text.replace(/When in a hiding place, such as high grass, gain a bonus of (.*?) to Melee Skill, Ranged Skill, and Melee and Ranged Defense\./, "在高草等隐蔽处，获得 $1 近战技能、远程技能、近战和远程防御的加成。");
	text = text.replace("Zone of Control is ignored when moving away from enemy combatants in melee.", "在近战中远离敌方战斗人员时忽视其控制区。");
	text = text.replace("A great leader of men inspires his followers to overcome their limits.", "一位伟大的领袖激励他的追随者超越他们的极限。");
	text = text.replace("Allies start every battle at confident morale unless prohibited by character traits.", "盟友以自信的士气开始每一场战斗，除非被特性所禁止。");
	text = text.replace("Looking for this? ", "在找这个吗？");
	text = text.replace("Swapping items in battle becomes a free action with no Action Point cost once every turn.", "在战斗中交换物品变成了一个免费的行动，每回合一次不需要消耗行动点。");
	text = text.replace("Swapping any item in battle except for shields becomes a free action with no Action Point cost once every turn.", "在战斗中交换除盾牌以外的任何物品变成了一个免费的行动，每回合一次不需要消耗行动点。");
	text = text.replace(/Cripple your enemies! Lowers the threshold to inflict injuries by (.*?) for both melee and ranged attacks\./, "削弱你的敌人！降低近战和远程攻击造成损伤的阈值 $1。");
	text = text.replace("Become one with your weapon and go for the weak spots!", "与你的武器融为一体，去寻找弱点！");
	text = text.replace(/With the offhand free, an additional (.*?) of any damage ignores armor\./, "自由的另一只手，额外的 $1 伤害忽视盔甲。");
	text = text.replace(/With the offhand free or carrying a throwable tool \(e\.g\. throwing net\), an additional (.*?) of any damage ignores armor\./, "自由的另一只手，或者携带一个可以投掷的工具（如投网），额外的 $1 伤害会忽视盔甲。");
	text = text.replace("Does not work with two-handed weapons.", "不适用于双手武器。");
	text = text.replace(/After receiving a blow, the next attack of this character will inflict (.*?) damage to both hitpoints and armor\./, "受到打击后，此角色的下一次攻击对生命值和盔甲造成 $1 伤害。");
	text = text.replace("If the attack misses, the effect is wasted.", "如果攻击未命中，效果将被浪费。");
	text = text.replace(/After landing a hit, the next attack does (.*?) damage to both hitpoints and armor\./, "在命中目标后，此角色的下一次攻击对生命值和盔甲造成 $1 伤害。");
	text = text.replace("Specialize in light armor!", "轻甲专精！");
	text = text.replace("By nimbly dodging or deflecting blows, convert any hits to glancing hits.", "通过灵活躲闪或偏转打击，将任何打击转换为偏斜的攻击。");
	text = text.replace(/Hitpoint damage taken is reduced by up to (.*?), but lowered exponentially by the total penalty to Maximum Fatigue from body and head armor above (.*?)\. Also provides (.*?) extra injury threshold\. The lighter your armor and helmet, the more you benefit\./, "受到的生命值伤害最多减少 $1，但总的惩罚呈指数级降低会在身体和头部盔甲的最大疲劳值总计超过 $2 时。还提供了 $3 额外伤害阈值。你的盔甲和头盔越轻，你受益越多。");
//	text = text.replace(/Also provides (.*?) extra injury threshold\./, "还提供了 $1 额外伤害阈值");
	text = text.replace("Brawny does not affect this perk.", "健壮不会影响这个特技。");
	text = text.replace(/Too fast for you! Gain (.*?) of the character\'s current Initiative as a bonus to Melee and Ranged Defense\./, "对你来说太快了！获得角色当前主动值的 $1 作为近战和远程防御的加成。");
	text = text.replace("Keep it together!", "保持住！");
	text = text.replace("Status effects that have their effects grow weaker over several turns (e.g. Goblin Poison) are at their weakest state from the start.", "状态效果在几个回合内变得越来越弱（例如哥布林毒药），从一开始就处于最弱的状态。");

	text = text.replace("Mother always said you had a hard head.", "妈妈总是说你的脑袋很硬。");
	text = text.replace(/Also grants (.*?) resistance to many negative statuses including bleeding and raises the chance to survive being struck down and not killed from (.*?) to (.*?)\./, "它还可以对包括流血在内的许多负面状态赋予$1抵抗力，并将被击倒而不会被杀死的几率从 $2 提高到 $3。");
	text = text.replace(/Also grants (.*?) hitpoints and raises the chance to survive being struck down and not killed from (.*?) to (.*?)\./, "同时增加 $1 生命值，并将被击倒而不会被杀死的几率从 $2 提高到 $3。");
	text = text.replace(/Also grants (.*?) hitpoints and raises the chance to survive being struck down at not killed from (.*?) to (.*?)\./, "同时增加 $1 生命值，并将被击倒而不会被杀死的几率从 $2 提高到 $3。");
	text = text.replace(/Any negative status effect with a finite duration \(e\.g\. Bleeding, Charmed\) has its duration reduced by (.*?) turn, to a minimum of 1 turn\./, "任何持续时间有限的负面状态效应（如流血、魅惑）的持续时间都会减少 $1 回合，至少1回合。");
	text = text.replace(/Any negative status effect with a finite duration \(e\.g\. Bleeding, Charmed\) has its duration reduced to (.*?) turn\./, "任何持续时间有限的负面状态效应（如流血、魅惑）的持续时间都会减少到 $1 回合。");
	text = text.replace(/When being attacked with ranged weapons, gain (.*?) as additional Ranged Defense per tile that the attacker is away, and always at least (.*?) to Ranged Defense\./, "当被远程武器攻击时，获得 $1 作为距离攻击者每格额外的远程防御，至少 $2 远程防御。");
	text = text.replace(/When being attacked with ranged weapons, gain (.*?) as additional Ranged Defense per tile that the attacker is away\./, "当被远程武器攻击时，获得 $1 作为距离攻击者每格额外的远程防御。");
	text = text.replace("of your base Ranged Defense", "的基础远程防御");
//	text = text.replace("Hits to the head no longer cause critical damage to this character, which also lowers the risk of sustaining debilitating head injuries significantly.", "头部受到的打击不再对这个角色造成严重伤害，这也大大降低了受到削弱头部的损伤的风险。");
	text = text.replace(/Inflict additional (.*?) damage against targets that have sustained any injury effects, like a broken arm./, "对受到任何损伤的目标造成额外 $1 伤害，比如手臂折断。");
	text = text.replace(/All attacks cost (.*?) Fatigue to use and weapon condition degrades only half as fast\./, "所有的攻击都需要消耗 $1 疲劳才能使用，武器状态的下降速度只有原来的一半。");
	text = text.replace("Dance gracefully with your weapon and make every hit count.", "用你的武器优雅地跳舞，让每一次命中都有意义。");
	text = text.replace(/Put your full weight into every blow and gain (.*?) of your current body armor as additional maximum damage when attacking with melee attacks\./, "每一次攻击都要全力以赴，在近战攻击中获得当前身体盔甲的 $1 作为额外的最大伤害。");
	text = text.replace("Adapt to your opponent\'s moves!", "适应对手的动作！");
	text = text.replace(/Gain an additional stacking (.*?) chance to hit with each attack that misses an opponent\./, "每次攻击未命中对手获得额外 $1 的命中率，可叠加。");
	text = text.replace("Bonus is reset upon landing a hit.", "命中后加成重置。");
	text = text.replace("For characters which are controlled by players, the additional chance is doubled.", "对于由玩家控制的角色，额外命中率增加一倍。");
	text = text.replace(/Gain (.*?) chance to hit for all area of effect attacks\./, "所有范围攻击增加 $1 的命中率。");
	text = text.replace(/Once per turn, killing an opponent reduces current fatigue by (.*?) of the base maximum fatigue \(before penalties due to armor are applied\)\./, "每回合一次，杀死一个对手可以将当前疲劳降低 $1 基础最大疲劳值（排除盔甲惩罚的值）。");
	text = text.replace("Go for the head!", "冲着头去！");
	text = text.replace("Hitting the head of a target will give you a guaranteed hit to the head also with your next attack.", "击中一个目标的头部将保证你的下一次攻击也击中头部。");
	text = text.replace("Connecting with your hit, or missing with your attack, will reset the effect.", "与你的命中关联，或者你的攻击丢失将重置效果。");
	text = text.replace("Connecting with your hit will reset the effect.", "接连命中将重置效果");
	text = text.replace(/Gain (.*?) chance to hit the head for critical damage each time you hit the body\./, "每次击中身体，头部受到致命伤害的几率增加 $1。");
	text = text.replace("Bonus is reset upon hitting the head.", "加成在击中头部时重置。");
	text = text.replace("Unlocks the \'Rally\' skill which can rally fleeing allies, and raise morale of all nearby allies to a steady level. The higher the Resolve of the character using the skill, the higher the chance to succeed.", "解锁“集结”技能，可以集结逃跑的盟友，并提高附近所有盟友的士气到稳定的等级。使用技能的角色决心越高，成功的几率就越高。");
	text = text.replace("Make them scatter and flee!", "让他们四散而逃！");
	text = text.replace("Any attack that inflicts at least 1 point of damage to hitpoints triggers a morale check for the opponent, as opposed to only if at or above 15 points of damage.", "任何对生命值造成至少1点伤害的攻击都会触发对手的士气检查，而不是只有在15点或以上才行。");
	text = text.replace(/Any attack that inflicts at least 1 point of damage to hitpoints triggers a morale check for the opponent with a penalty equal to (.*?) of your Resolve - 10, as opposed to with no penalty and only if at or above 15 points of damage\./, "任何对生命值造成至少1点伤害的攻击都会触发对手的士气检查，惩罚等同于你决心的$1 - 10，而不是只有在15点或以上才行。");
	text = text.replace(/Any attack that inflicts at least 1 point of damage to hitpoints triggers a morale check for the opponent with a penalty equal to (.*?) of your Resolve, as opposed to with no penalty and only if at or above 15 points of damage\./, "任何对生命值造成至少1点伤害的攻击都会触发对手的士气检查，惩罚等同于你决心的 $1，而不是没有惩罚或只有在15点伤害或以上才行。");
	text = text.replace(/Any attack that inflicts at least 1 point of damage to hitpoints triggers a morale check for the opponent with a penalty equal to (.*?) of your Resolve \(for player (.*?) instead\) \- 10, as opposed to with no penalty and only if at or above 15 points of damage\./, "任何对生命值造成至少1点伤害的攻击都会触发对手的士气检查，惩罚等同于你决心的 $1(玩家为 $2) -10，而不是没有惩罚或只有在15点伤害或以上才行。");
	text = text.replace(/A kill (.*?)tripples(.*?) this effect for your next attack, but if misses, the effect will be wasted\./, "你下一次攻击会触发一次$1杀戮$2效果，但如果没有命中，效果将被浪费。");

	text = text.replace("Does not trigger multiple times from the same attacker on the same target in one attack", "在一次攻击中击中同一目标,多段攻击只算一次");
	text = text.replace("Does not trigger multiple times from the same attacker", "多段攻击只算一次");
	text = text.replace(/Unlocks the \'Indomitable\' skill which grants a (.*?) damage reduction and immunity to being stunned, knocked back or grabbed for one turn\./, "解锁“不屈”技能，给予一回合的 $1 伤害减免和免疫昏迷、撞退或攫取。");
	text = text.replace("Unlocks the \'Furor\' skill which allows for an unlimited number of other skill uses for a single turn until the character is completely fatigued.", "解锁“狂热”技能，允许无限数量的其他技能用于一个回合，直到角色完全疲劳。");
	text = text.replace(/Unlocks the \'Debilitate\' skill which can prime your next attack to cripple a target for one turn, reducing their ability to inflict damage by (.*?)\./, "解锁“虚弱”技能，该技能可以使你的下一次攻击在一回合内削弱目标，降低其造成的伤害 $1。");
	text = text.replace("Unlocks the \'Footwork\' skill which allows you to leave a Zone of Control without triggering free attacks by using skillful footwork.", "解锁“步法”技能，熟练的步法使你在离开控制区时不会触发借机攻击。");
	text = text.replace("Picking the perk will also add \'Furinkazan\' to your perk map, which could reduce the cost of \'Footwork\'.", "选择此特技还会将‘风火山林’添加到您的特技树中，这可以降低‘步法’的使用成本。");

	text = text.replace("Unlocks the \'Rotation\' skill which allows two characters to switch places while ignoring Zone of Control as long as neither character is stunned, rooted or otherwise disabled.", "解锁‘换位’技能，允许两个角色在忽视控制区域的情况下互换位置，只要两个角色都没有被昏迷、定身或其他方式的禁用。");
	text = text.replace("Picking the perk will also add \'Furinkazan\' to your perk map, which could reduce the cost of \'Rotation\'.", "选择这个特技会将‘风火山林’添加到你的特技树中，这可以减少‘换位’的使用成本。");
	text = text.replace(/Once per turn, the first successful attack apply a negative status effect which decrease the target's defences and resolve by (.*?) for 1 turn\./, "每回合第一次成功的攻击会给目标施加一个负面效果，此效果在一回合内降低目标$1的防御和决心。");

	text = text.replace(/The Action Point costs of the Rotation, Footwork and Evasion skills are reduced by (.*?), while the fatigue costs are reduced by (.*?)\./, "‘换位’、‘步法’和‘回避’技能的行动点成本减少 $1，疲劳耗费减少 $2。");
	text = text.replace("Unlocks the \'Perfect Focus\' skill which allows the use of all other skills for one round at half the normal Action Point cost \(rounded down\), but double the fatigue cost.", "解锁“专心致志”技能，允许以一半正常行动点（小数舍去）使用所有其他技能进行一轮，但疲劳消耗增加一倍。");
	text = text.replace(/Unlocks the \'Return Favor\' skill which when active has a (.*?) chance to stun any opponent missing a melee attack against this character in retaliation\./, "解锁“以牙还牙”技能，该技能在激活时有 $1 的几率击晕任何未命中对该角色进行近战攻击的对手。");
	text = text.replace("Immunities and resistances against being stunned still apply.", "免疫和抵抗昏迷仍然适用。");
	text = text.replace("I\'m used to it.", "我已经习惯了。");
	text = text.replace(/The defense malus due to being surrounded by opponents is reduced by (.*?)\./, "因围攻导致的防御能力减益每层减少 $1 。");
	text = text.replace("If an attacker has the Backstabber perk, the effect of that perk is negated, and the normal defense malus due to being surrounded is applied instead.", "如果攻击者具有‘背刺’特技，则该特技的效果将被抵消，替代的是因被包围而产生的正常防御效果。");
	text = text.replace("The defense malus due to being surrounded by opponents no longer applies to this character.", "由于被对手包围而导致的围攻不再适用于该角色。");
	text = text.replace("Being surrounded no longer affects this character\'s defences at all. Upgraded version of Underdog, immune to Backstabber.", "被包围不再影响该角色的防御。升级版的‘落单狗’，免疫背刺。");
	text = text.replace("If an attacker has the Backstabber perk, the effect of that perk is negated, and the normal defense malus due to being surrounded is applied instead.", "如果一个攻击者有背刺特技，该特技的效果将被抵消，而由于被包围而造成的正常围攻将被应用。");
	text = text.replace("Unlocks the \'Sprint\' skill which allows for sprinting over short distances in straight lines instantly.", "解锁“冲刺”技能，允许在短距离内以直线快速冲刺。");
	text = text.replace(/Unlocks the \'Recover\' skill which allows for resting a turn in order to reduce accumulated Fatigue by (.*?)for each action point available\. Recover can not be used if another skill is used\./, "解锁“恢复”技能，休息一个回合，每个行动点都可减少$1累积的疲劳。如果使用了其他技能，则无法使用“恢复”");
	text = text.replace(/Unlocks the \'Recover\' skill which allows for resting a turn in order to reduce accumulated Fatigue by (.*?)\./, "解锁“恢复”技能，休息一个回合，减少$1累积的疲劳。");
	text = text.replace("Unlocks the \'Inspire\' skill which can push allies to go beyond their limits, granting them additional Action Points.", "解锁“激励”技能，可以推动盟友超越他们的限制，给予他们额外的行动点。");
	text = text.replace("Mercenary life comes easy when you\'re naturally gifted.", "当你天生有天赋的时候，雇佣兵的生活就会变得轻松。");
	text = text.replace("Instantly gain a levelup to increase this character\'s attributes with maximum rolls, but without talents.", "这个角色立即获得一次以能掷骰出的最大点数给属性加点的机会，但没有天赋的加成。");
	text = text.replace("Always act first in the very first round of combat, before any of your opponents do.", "在战斗的第一轮，总是在对手行动之前先行动。");
	text = text.replace("Unlocks the \'First Aid\' skill which can stop bleeding effects, including those from serious injuries, during combat. Does not heal hitpoints.", "解锁“急救”技能，可以在战斗中阻止流血影响，包括严重受伤的影响。无法治愈生命值。");
	text = text.replace("Unlocks the \'Adrenaline\' skill which puts you first in the turn order for the next round, to have another turn before your enemies do.", "解锁“肾上腺素”技能，使你在下一轮的回合顺序中处于第一位，在你的敌人之前有另一个回合。");
	text = text.replace("Picking the perk will also add \'Irresistible Impulse\' to your perk map, which could give you more benefits when using \'Adrenaline\'.", "选择这个特技也会给你的特技树中增加‘不可抗拒的冲动’，这会让你在使用“肾上腺素”时获得更多加成。");
	text = text.replace("Feel the adrenaline rushing through your veins!", "感受肾上腺素在你的血管里快速流动！");
	text = text.replace("Honor doesn\'t win you fights, stabbing the enemy where it hurts does.", "荣誉不能使你赢得战斗，而刺敌人痛的地方能。");
	text = text.replace(/The bonus to hitchance in melee is doubled to (.*?) for each ally surrounding and distracting your target\./, "近战中，每个参与围攻目标的盟友使你的命中率附加值加倍增加，增加到 $1。");
	text = text.replace("I work best alone.", "我一个人工作最好。");
//	text = text.replace(/With no ally within 3 tiles of distance, gain a (.*?) bonus to Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve\./, "在3格范围内没有盟友的情况下，获得 $1 的近战技能、远程技能、近战防御、远程防御和决心加成。");
	text = text.replace(/With no ally within (.*?) tiles of distance, gain a (.*?) bonus to Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve\./, "在$1格范围内没有盟友的情况下，获得 $2 的近战技能、远程技能、近战防御、远程防御和决心加成。");
	text = text.replace("Learn to use the superior reach of large weapons to keep the enemy from getting close enough to land a good hit.", "学习使用大型武器的优势范围，打击接近的敌人取得良好的效果。");
	text = text.replace(/Each hit with a two-handed melee weapon adds a stack of Reach Advantage that increases your Melee Defense by (.*?), up to a maximum of 5 stacks, until this character\'s next turn\./, "双手近战武器每次命中都能增加一层双手优势，使你的近战防御增加 $1，最多可以增加5层，直到这个角色下一个回合。");
	text = text.replace(/Each hit with a two-handed melee weapon adds a stack of Reach Advantage that increases your Melee Defense by (.*?), up to a maximum of 5 stacks, at start of this character\'s next turn, lose half of the stacks\(round down\) with a minimum of 1\./, "双手近战武器每次命中都能增加一层双手优势，使你的近战防御增加 $1，最多可以增加5层，在该角色的下一回合开始时，损失一半的层数(向下取整)，最小值为1。");
	text = text.replace(/When attacking an enemy, whether hit or not, gain (.*?) of your melee skill as melee defense against him until waiting or ending your turn, moreover prevent him from approaching your ZOC\(Zone of Control\) until next turn with a decreased damage of (.*?)\./, "当击中敌人时，获得 $1 的近战技能作为你近战防御的加成，等待或回合结束后失效，同时降低目标 $2 的伤害并阻止目标接近你的ZOC(控制区)，直到下一回合。");



	text = text.replace("A single attack hitting multiple targets can add several stacks at once.", "一次攻击多个目标可以同时增加多层。");
	text = text.replace("If you put away your weapon, you lose all stacks.", "如果你把武器收起来，你就会失去所有的层数。");
	text = text.replace("Learn to take advantage of your high Initiative and prevent the enemy from attacking effectively by overwhelming them with your attacks!", "学会利用你的高主动值，用你的攻击来压倒敌人，从而有效地防止敌人进攻！");
	text = text.replace(/With every attack, hit or miss, against an opponent that acts after you in the current round, inflict the \'Overwhelmed\' status effect which lowers both Melee Skill and Ranged Skill by (.*?) for one turn\./, "在当前轮中，当你攻击一个在你之后行动的对手时，每一次攻击，命中或未命中，都会造成“压制”状态效果，降低近战技能和远程技能 $1 一个回合。");
	text = text.replace("The effect stacks with each attack, and can be applied to multiple targets at once with a single attack.", "每次攻击效果叠加，一次攻击可同时作用于多个目标。");
	text = text.replace("The effect stacks with each attack, up to a maximum of 7 times, and can be applied to multiple targets at once with a single attack.", "每次攻击效果叠加，最高7次，一次攻击可同时作用于多个目标。");
	text = text.replace("Unlocks an active skill to apply overwhelming effects in a cruciform area, which can be used every other turn.", "解锁一个主动技能，在十字形区域应用压倒效果，每隔一回合使用一次。");
	text = text.replace("Unlocks an active skill to apply overwhelming effects in a cruciform area, which can be used once per battle.", "解锁一个主动技能，在十字形区域应用压倒效果，每次战斗可以使用一次。");


	text = text.replace("Master the art of archery and pelting your opponents with arrows from afar.", "精通射箭的技艺，用箭从远处射向对手。");
	text = text.replace(/View range and maximum firing range with bows is increased by (.*?)\./, "视野范围和弓的最大射程增加 $1。");
	text = text.replace("Master crossbows and firearms, and learn where to aim best.", "精通弩与火器能精确的瞄准。");
	text = text.replace("Master crossbows and learn where to aim best.", "精通弩能精确的瞄准。");
	text = text.replace(/An additional (.*?) of damage inflicted with crossbows ignores armor\./, "弩造成额外 $1 伤害忽视盔甲。");
	text = text.replace(/Handgonnes now require (.*?) Action Points to reload and can be fired every turn instead of every other turn\./, "手炮现在需要 $1 行动点来重新装弹，并且可以每回合发射一次，而不是每隔一回合发射一次。");
	text = text.replace("Master throwing weapons to wound or kill the enemy before they even get close.", "精通投掷武器在敌人接近之前就伤害或杀死他们。");
	text = text.replace(/Damage is increased by (.*?) when attacking at 2 tiles of distance\./, "当攻击距离为2格时，伤害增加 $1。");
	text = text.replace(/Damage is increased by (.*?) when attacking at 3 tiles of distance\./, "当攻击距离为3格时，伤害增加 $1。");
	text = text.replace("Master combat with axes and destroying shields.", "精通斧能熟练的使用斧头和摧毁盾牌。");
	text = text.replace(/Split Shield damage to shields is increased by (.*?) when used with axes\./, "使用斧的劈盾技能对盾牌的伤害增加 $1。");
	text = text.replace(/Round Swing gains (.*?) chance to hit\./, "环劈增加 $1 命中几率。");
	text = text.replace("The Longaxe no longer has a penalty for attacking targets directly adjacent.", "长斧不再有攻击邻近目标的惩罚。");
	text = text.replace("Master cleavers to inflict gruesome wounds.", "精通砍刀制造可怕的伤口。");
	text = text.replace(/Bleeding damage inflicted by cleavers is doubled to (.*?) per turn\./, "砍刀造成的流血伤害每回合增加一倍至 $1。");
	text = text.replace(/Bleeding damage inflicted by cleavers and whips is doubled to (.*?) and (.*?) per turn, respectively\./, "砍刀和鞭子造成的流血伤害每回合增加一倍分别为 $1 和 $2。");
	text = text.replace("Disarm no longer has a penalty to hit.", "缴械在攻击时不再受到惩罚。");
	text = text.replace("Disarm only has half the penalty to hit.", "缴械攻击时只受到一半的惩罚。");
	text = text.replace("Master swift and deadly daggers.", "精通匕首做到敏捷且致命。");
	text = text.replace("Stab, Puncture and Deathblow have a reduced Action Point cost to allow for an additional attack each turn.", "刺伤，穿刺和致命攻击降低了行动点消耗，以允许每回合的额外攻击。");
	text = text.replace("Stab and Puncture have a reduced Action Point cost to allow for an additional attack each turn.", "刺伤和穿刺降低了行动点消耗，以允许每回合的额外攻击。");
	text = text.replace("Master the art of swordfighting and using your opponent\'s mistakes to your advantage.", "精通剑术，利用对手的失误为自己谋利。");
	text = text.replace("Riposte no longer has a penalty to hitchance.", "还击不再有命中惩罚。");
	text = text.replace(/Gash has a (.*?) lower threshold to inflict injuries\./, "划砍造成损伤的阈值降低 $1");
	text = text.replace(/Split and Swing gain (.*?) chance to hit\./, "劈击和挥击增加 $1 命中几率。");
	text = text.replace("Master fighting with spears and keeping the enemy at bay.", "精通矛作战，牵制敌人的战术。");
	text = text.replace("Spearwall is no longer disabled once an opponent manages to overcome it.", "矛墙不会因为一个对手成功克服了它，就不再生效了。");
	text = text.replace("Instead, Spearwall continues to give free attacks on any further opponent attempting to enter the Zone of Control.", "相反，矛墙继续对任何试图进入控制区域的对手进行自由攻击。");
	text = text.replace("Instead, Spearwall can still be used and continues to give free attacks on any further opponent attempting to enter the Zone of Control.", "相反，矛墙仍然可以使用和继续对任何试图进入控制区域的对手进行自由攻击。");
	text = text.replace("The Spetum no longer has a penalty for attacking targets directly adjacent.", "长戟不再有攻击邻近目标的惩罚。");
	text = text.replace("The Spetum and Warfork no longer have a penalty for attacking targets directly adjacent.", "长戟和战叉不再有攻击邻近目标的惩罚。");
	text = text.replace("Master polearms and keeping the enemy at bay.", "精通长柄武器，使敌人无法接近。");
	text = text.replace(/Polearm skills have their Action Point cost reduced to (.*?), and no longer have a penalty for attacking targets directly adjacent\./, "长柄武器技能的行动点消耗降低到 $1，不再有攻击邻近目标的惩罚。");
	text = text.replace("Master hammers and fighting against heavily armored opponents.", "精通锤，与重甲对手作战。");
	text = text.replace(/Destroy Armor and Demolish Armor inflict (.*?) more damage against armor\./, "破坏盔甲和摧毁盔甲对盔甲造成 $1 更多伤害。");
	text = text.replace(/Shatter gains (.*?) chance to hit\./, "粉碎增加 $1 命中几率。");
	text = text.replace("The Polehammer no longer has a penalty for attacking targets directly adjacent.", "长锤不再有攻击邻近目标的惩罚。");
	text = text.replace("Master maces to beat your opponents into submission, armored or not.", "精通棍棒打败你的对手，让他们投降，不管是否带着盔甲。");
	text = text.replace(/Knock Out, Knock Over and Strike Down have a (.*?) chance to stun the target if not immune\./, "痛击，撞倒和击倒有 $1 几率击晕目标，如果没有免疫的话。");
	text = text.replace("The Polemace no longer has a penalty for attacking targets directly adjacent.", "长棍不再因为攻击直接相邻的目标而受到惩罚。");
	text = text.replace(/Knock Out and Strike Down have a (.*?) chance to stun the target if not immune\./, "痛击和击倒有 $1 几率击晕目标，如果没有免疫的话。");
	text = text.replace(/Pound ignores an additional (.*?) of armor on head hits\./, "‘砸击’击中头部时忽略 $1 护甲。");
	text = text.replace("Master flails and circumvent your opponent\'s shield.", "精通链枷绕过对手的盾牌。");
	text = text.replace("Lash and Hail ignore the defense bonus of shields.", "‘抽打’和‘雹击’忽视盾牌的防御加成。");
	text = text.replace(/Thresh gains (.*?) chance to hit\./, "‘脱粒’增加 $1 命中几率。");
	text = text.replace(/Skills build up (.*?) less Fatigue\./, "技能产生的疲劳减少 $1。");
	text = text.replace("Reduces food consumption by 1 for every mercenary. This perk is only counted once per company.", "降低所有人1点食物消耗。这个技能不会因为多人解锁而叠加。");
	text = text.replace("Gain 7.5% barter, but divide all sources of barter bonus by 1 + the number of mercenaries with this perk.", "+7.5%交易利润和合同报酬，但所有交易系数将除以 1+解锁此perk的总人数。");
	text = text.replace("Shifting numbers is a fine art, by negotiating pay terms and usury it is possible to drive down mercenary pay. Lowers daily wages for all mercenaries in the company, by a percentage equal to your barter skill. This perk is only counted once per company.", "转移矛盾是一门艺术，通过协商和高利贷，有可能压低雇佣兵的工资。基于你的交易水平降低所有人日薪。这个技能不会因为多人解锁而叠加。满足非战随从出纳员的perk条件。");
	text = text.replace(/Unlock (.*?) skill\./, "解锁 $1 技能。");
// End
//Parthian Shot
	text = text.replace(/Damage penetration and Damage to hitpoints are increased by (.*?) of your remaining Action Points\./, "穿透伤害和生命伤害增加的值为剩余行动点的$1。");
	text = text.replace("Fisrt moving action of every turn cost 0 Action Points and 0 Fatigue.", "每个回合的第一次移动动作消耗0个动作点和0个疲劳。");
//尽情杀戮+割裂
	text = text.replace(/Gain (.*?) damage when attacking a bleeding enemy\./, "对流血的敌人 $1 伤害。");
	text = text.replace(/This character gains (.*?) resolve and initiative for every bleeding character on the field\./, "战场上的每一个流血角色都能使该角色获得$1点决心和主动值。");

	text = text.replace("Gain a chance to inflict bleeding with every strike, equal to your percentage of missing health.", "基于你损失生命值的百分比，有几率每次攻击都使敌人流血。");
	text = text.replace(/Reduces the cost of maintaining Human Carrion and Human Bones by (.*?) medicine per day\./, "尸体和尸骸的每日医疗用品维护费用减少 $1 。");
//全神贯注
    text = text.replace("Use your armor\'s blend of protection and mobility to punish your foes\' mistakes!", "用你的盔甲混合保护和机动性来惩罚敌人犯下的错误！");	
	text = text.replace(/Gain a stacking buff that boosts your Melee Skill and Melee Damage by (.*?) up to a maximum of (.*?)\./, "获得一项可叠加的增益，每层使你的近战技能和近战伤害提升 $1 ，最多叠加至 $2 。");
	text = text.replace(/You gain (.*?) when you dodge a Melee attack and lose (.*?) when you get hit by any attack\./, "闪避时获得 $1 ，受到攻击时失去 $2 。");
	text = text.replace(/When engaged in Melee, the Melee Damage bonus is doubled, up to a maximum of (.*?)\./, "接敌时近战伤害加成翻倍，最多叠加至 $1 。");
	text = text.replace("and the Melee Skill bonus is converted into double Melee Defense bonus", "而近战技能加成转化为双倍近战防御加成");
	text = text.replace("and the Melee Skill bonus is substituted for double Melee Defense bonus", "而近战技能加成转化为双倍近战防御加成");
	text = text.replace("If your Initiative is higher than twice your armor\'s weight (penalty to Maximum Fatigue),", "如果你的主动值比你的盔甲重量的两倍还高，");
	text = text.replace(/ you start the battle with stacks equal to your armor\'s weight above (.*?)\./, "战斗开始时盔甲重量每超过 $1 一点就叠加一层。");
//Rebound
	text = text.replace(/Fatigue regeneration is increased by (.*?) per turn while over (.*?) fatigued\./, "当疲劳超过 $2 时，疲劳再生每回合增加 $1。");
//LegendBlendIn
	text = text.replace(/Hold yourself in a way that makes you seem more trouble than its worth, lean into trees, place objects between you and an enemy, and hide behind allies. Makes enemies less likely to attack you instead of an ally, also grants (.*?) Ranged Defense and (.*?) Melee Defense\./, "以一种让你看起来比它的价值更麻烦的方式控制自己，倚靠在树上，在你和敌人之间放置物体，躲在盟友后面。使敌人不太可能攻击你而不是一个盟友，还可以获得 $1 远程防御和 $2 近战防御");
//势不可挡
	text = text.replace("Once you get going, you can\'t be stopped!", "一旦你开始行动，你就无法被阻止！");
	text = text.replace("During your turn, every successful attack provides a stacking bonus to Melee Skill and Melee Damage.", "在你的回合内，每次成功的攻击都会增加你的近战技能和近战伤害。");
	text = text.replace("During your turn, every successful attack provides a stacking bonus to Melee Skill and Action Points.", "在你的回合内，每次成功的攻击都会增加你的近战技能和行动点。");
	text = text.replace(/Each stack increases Melee Skill by (.*?) to (.*?) and Melee Damage by (.*?) to (.*?), depends on skill's action cost, up to a maximum of 50 bonuses./, "每层增加 $1~$2 点近战技能和 $3~$4 点近战伤害，值取决于技能的行动点耗费，最多可获得50点加成。");
	text = text.replace(/Each stack increases Melee Skill by (.*?) and Melee Damage by (.*?), /, "每层增加 $1 近战技能和 $2 近战伤害，");
	text = text.replace(/Each stack increases Melee Skill by (.*?)\./, "每层增加 $1 近战技能。");
	text = text.replace(/Your Action Points are increased by a total of (.*?) at 3 stacks, (.*?) at 6 stacks and (.*?) at 10 stacks\./, "行动点数在3层时总共增加$1，在6层时增加$2，在10层时增加$3。");
	text = text.replace(/up to a maximum of (.*?) stacks\./, "最多堆叠 $1 层。");
	text = text.replace(/Attacks at (.*?) tiles range only grant a stack after two successful hits\./, "攻击距离为2时每两次成功的攻击才会增加1层。");
	text = text.replace("You lose half of the stacks if you miss an attack or if you get hit.", "如果你错过了一次攻击或被击中，叠加层数就会减半。");
	text = text.replace("Cannot have more than 10 stacks.", "最多不能超过10层。");
	text = text.replace(/Once per turn, killing an enemy will grant (.*?) stacks\./, "每回合一次，杀死敌人将获得$1层。");
	text = text.replace(/You lose half of the stacks if you get hit and lose more than (.*?) hitpoints\./, "如果你被击中并损失超过$1点生命值，你将损失一半的层数。");
	
	//他们的眼白
	text = text.replace(/When attacking a target at 2 tiles, gain (.*?) of your Melee Skill as additional chance to hit\./, "攻击距离2格的目标时将 $1 近攻作为额外命中几率，");
	text = text.replace(/Damage is increased by (.*?)\./, "伤害增加$1。");
	text = text.replace(/Piercing type throwing weapons have a 100% chance to inflict the \'Arrow to the Knee\' effect which reduces the target\'s defenses and mobility\./, "穿刺型投掷武器有100%的几率造成‘膝盖中箭’效果，降低目标的防御和移动能力。");
	text = text.replace(/Cutting type throwing weapons have a 100% chance to inflict the \'Overwhelmed\' effect\./, "切割型投掷武器有100%几率造成‘压制’效果。");
	text = text.replace(/Blunt type throwing weapons have a 100% chance to inflict \'Staggered\' and if the target is already staggered, inflict \'Stun\'\./, "钝伤型投掷武器有100%几率造成‘趔趄’效果，如果目标已经趔趄中，则造成‘眩晕’效果。");
	text = text.replace(/The damage bonus and chance applies up to a distance of 2 tiles, is halved at 3 tiles of distance, and does not apply at longer distances\./, "伤害加成和几率效果最多适用2格距离的攻击，3格距离时加成和几率减半，更远的距离时不适用。");
	text = text.replace(/For piercing type throwing weapons, armor penetration is increased by (.*?) of your Ranged Skill\./, "穿刺伤害的投掷武器提高相当于 $1 远攻的护甲穿透，");
	text = text.replace(/For cutting type throwing weapons, damage is increased by a percentage equal to (.*?) of your Ranged Skill\./, "劈砍伤害的投掷武器伤害提高相当于 $1 远攻，");
	text = text.replace(/For blunt type throwing weapons, has a (.*?) chance to apply Staggered, and if the target is already Staggered, to apply Stunned\./, "钝器伤害的投掷武器击中 $1 施加趔趄，如果目标已经趔趄则改为击昏目标。");
	text = text.replace("Only provides half the bonuses when attacking a target at 3 tiles, and no bonus at longer distances.", "如果距离3格则只有一半效果，更远则无效。");
//复仇
	text = text.replace(/Every time you are hit, gain a stacking (.*?) damage bonus for your next attack\./, "受到伤害后你下次攻击伤害提高 $1 。");
	text = text.replace("The effect lasts until your next attack or the end of your turn.", "效果持续到下回合结束，攻击落空也会失效。");
//咯吱咯吱
	text = text.replace(/Every attack that hits armor and does at least (.*?) damage to Hitpoints, applies a stacking Rattled effect which reduces the target\'s damage output by (.*?) for (.*?) turn\./,"对身穿盔甲的敌人造成至少 $1 点生命值伤害时就会对目标施加一个减益，在 $3 回合内降低目标 $2 攻击伤害。");
	text = text.replace("Two-Handed Hammer will apply 2 stacks.","双手锤施加2层减益。");

//深层冲击
	text = text.replace(/The threshold to inflict injury from blunt damage attacks is reduced by (.*?) of your current effectiveness against armor\./,"钝器伤害类型出伤阈值降低相当于当前武器对抗装甲效果的 $1 。");
	text = text.replace(/Hitpoints damage mitigation due to remaining armor on your target is reduced by (.*?) of your current effectiveness against armor\./,"目标剩余护甲对生命伤害的减免效果降低，数值相当于当前你对抗装甲效果的 $1 。");
	text = text.replace("Blunt attacks can now apply injuries to the Undead.","允许钝器伤害对不死族造成伤口。");
//内出血
	text = text.replace(/Blunt Damage attacks now apply the \'Internal Hemorrhage\' effect when hitting a body part which has no armor remaining. This effect deals (.*?) of the damage dealt to Hitpoints as Bleeding damage to the target on their turn\./,"对空甲身体部位造成钝器伤害时施加“内出血”效果，将造成的 $1 伤害作为流血伤害。");
	text = text.replace(/Blunt Damage attacks now apply the \'Internal Hemorrhage\' effect that deals (.*?) of the damage dealt to Hitpoints as Bleeding damage to the target at the end of their turn\./,"造成钝器伤害时施加“内出血”效果，目标回合结束时造成的 $1 生命伤害作为流血伤害。");
	text = text.replace("Also triggers on the hit which brings the armor to 0 remaining durability.","此次攻击使目标身体部位护甲耐久变为0时也生效。");
//重整旗鼓
	text = text.replace("Gain a bonus to key combat attributes depending on how far their Base Values are below a certain threshold.","基于一个特定的阈值获得战斗属性加成。");
	text = text.replace("These attributes are increased by a percentage equal to the number of points they are below the threshold.","这些加成相当于低于阈值差值的百分比。");
	text = text.replace(/The threshold for Melee Skill and Ranged Skill is (.*?), for Melee Defense and Ranged Defense is (.*?), and for Resolve is (.*?)\./, "近攻远攻的阈值是 $1 ，近战防御远程防御的阈值是 $2 ，决心的阈值是 $3 。");
	text = text.replace(/Also grants (.*?) Training in camp\./, "另外在营地还会获得 $1 训练速度加成。");
//中甲
	text = text.replace("Proper distribution of weight is crucial for maintaining mobility.", "正确分配体重对保持机动性至关重要。");
	text = text.replace("Not as nimble as some, but more lithe than most.", "不像某些人那么敏捷，但比大多数人更轻盈。");
	text = text.replace("Some favour heavy armor, others prefer lightweight. A few strive to find the perfect balance of protection and movement. ", "一些人喜欢重装甲，另一些人喜欢轻装甲。一些人努力寻找保护和移动的完美平衡。");
	text = text.replace(/Grants up to (.*?) bonus melee defense, ranged defense and % armor damage reduction.  The bonus is at maximum when your current body armor is twice your current initiative. The bonus decreases for every point of difference between the two, to a minimum of (.*?)\./, "获得 $1 近战防御、远程防御加成和百分比护甲伤害减免。身体护甲和当前主动值相差越大收益越小，最小 $2 点。");
	text = text.replace(/Grants up to  (.*?) fatigue per round if your current helmet and armor values match. Decreases by (.*?) for every (.*?) points difference. Armor that is too heavy can not be balanced, does not work if their combined durability is above (.*?)\./, "获得 $1 每回合疲劳恢复，当前身体和头部护甲耐久每相差 $3 点时此效果就减少 $2 点，当护甲耐久总和超过 $4 时失效。");
	text = text.replace(/You gain a (.*?) chance to have any attacker require two successful attack rolls in order to hit, but lowered by the total penalty to Maximum Fatigue from body and head armor above (.*?)\./, "攻击你的人有 $1 几率需要两次成功的掷骰才能命中，但你的盔甲重量每超过 $2 一点都会降低这个概率。");
	text = text.replace("Stacks with other sources of this effect.", "概率可以与其他相同的效果叠加。");
//深度切割
	text = text.replace(/During your turn, after a successful attack against a target, every next successful attack against the same target has a (.*?) lower threshold to inflict an injury and will inflict an additional stack of Bleeding for (.*?) damage\./, "在你的同一个回合内，攻击上一次攻击命中过的目标出伤阈值降低 $1 并且会造成 $2 点流血伤害。");
	text = text.replace(/If any of the attacks inflicted an injury, this damage is increased to (.*?)\./, "如果出伤，则流血伤害提升至 $1 点。");
	text = text.replace("The effect expires upon switching your target.", "如果不是攻击上一次攻击命中过的目标会失效。");
//流体武器
	text = text.replace(/Fatigue to Initiative Rate is decreased by (.*?) of the currently equipped sword\'s maximum damage\./, "降低疲劳对主动值的惩罚相当于剑的 $1 穿甲效率。");
//碎颅者
	text = text.replace(/Gain (.*?) chance to hit the head\./, "获得 $1 命中头部的机率。");
//机会主义者
	text = text.replace(/Every time you stand over an enemy's corpse, gain (.*?) ammo and restore (.*?) Action Points\./, "每当你站一个敌人的尸体旁边时，获得 $1 装备弹药和 $2 行动点。");
	text = text.replace(/Every time you stand over an enemy's corpse, gain (.*?) ammo and restore (.*?) Action Points\./,"首次站在敌人遗体上时，获得 $1 弹药和 $2 行动点。");
	text = text.replace(/Every time you stand over an enemy's corpse during your turn, gain (.*?) ammo and restore (.*?) Action Points\./,"在你的回合首次站在敌人遗体上时，获得 $1 弹药和 $2 行动点。");

	text = text.replace(/Also causes the next throwing attack to build up (.*?) less Fatigue\./, "使下一次投掷疲劳成本减少 $1 。");
	text = text.replace("Cannot proc on the same corpse twice.", "不能在同一具尸体上触发两次。");
//破甲打击
	text = text.replace(/Effectiveness against armor is increased by (.*?) of your weapon\'s armor effectiveness\./, "武器对抗装甲的效果增加 $1 百分比。");	
	text = text.replace(/The bonus is increased to (.*?) for two-handed weapons and (.*?) for attacks with a higher than 6 base Action Point cost\(whether two-handed or not\)\./, "双手武器的加成效果增加到$1，基础行动点成本高于6的攻击(无论单双手)加成效果增加到$2");
	text = text.replace(/The bonus is increased to (.*?) for two-handed weapon skills or with a higher than 6 base Action Point cost, and (.*?) for two-handed weapons skills with a higher than 6 base Action Point cost\./, "双手武器或基础行动点成本高于6的技能获得的加成效果增加到$1，基础行动点成本高于6的双手武器技能获得的加成效果增加到$2");

	text = text.replace(/The bonus is increased to (.*?) for attacks with a higher than (.*?) base Action Point cost\./, "如果使用的武器技能AP消耗不低于$2则是增加 $1 百分比。");	
	text = text.replace(/When unarmed, effectiveness against armor is increased by (.*?)\./, "如果是徒手，对抗装甲的效果增加 $1 。");	
//震荡打击
	text = text.replace(/Hits to the head with any weapon apply Dazed for (.*?) turn. This duration is increased to (.*?) turns for One-Handed Maces\./, "任何武器攻击命中头部都会施加 $1 回合茫然效果，单手棍棒是 $2 回合。");
	text = text.replace(/Similar hits with Blunt Two-Handed Mace attacks stun the target for (.*?) turn, and if the target is immune to stun, apply Dazed instead for (.*?) turn\./, "双手棍棒施加 $1 回合眩晕，如果目标免疫眩晕则改为 $2 回合茫然。");
//给点压力
	text = text.replace("Successfully stunning an opponent with a mace now also applies the Staggered effect.", "任何攻击命中造成的疲劳翻倍，不包括附加疲劳。");
	text = text.replace("Besides fatigue damage inflicted from successful hits is doubled.", "棍棒击昏目标后会额外施加趔趄效果。");
	text = text.replace(/Besides fatigue damage inflicted from successful hits is increased by (.*?), (.*?) instead if you are specialized in maces./, "此外成功命中造成的疲劳伤害增加 $1，如果你棍棒精通疲劳伤害增加 $2。");

//抬起头来
	text = text.replace(/When targets are more than (.*?) tiles from you, every attack, hit or miss, applies a stacking debuff on the target reducing their Melee Skill and Ranged Skill by (.*?) and Defenses by (.*?)\. Effect lasts one turn\./, "当目标距离超过$1格，无论是否命中都会施加一层减益，每层使目标 $1 近攻远攻和 $2 防御，持续一回合。");
	text = text.replace(/When using bows, every attack, hit or miss, applies a stacking debuff on the target reducing their Melee Skill and Ranged Skill by (.*?) and Defenses by (.*?)\. Effect lasts one turn\./, "弓射击无论是否命中都会施加一层减益，每层使目标 $1 近攻远攻和 $2 防御，持续一回合。");
	text = text.replace(/When using bows, every attack, hit or miss, applies a stacking debuff on the target reducing their Melee Skill and Ranged Skill by (.*?) and Melee Defense by (.*?)\. Effect lasts one turn\./, "弓射击无论是否命中都会施加一层减益，每层使目标 $1 近攻远攻和 $2 近战防御，持续一回合。");

	//本能恐惧
	text = text.replace(/Attacks that hit the head have a chance to drop the target\'s morale by 1 level, independent of regular morale checks. The base chance is (.*?) and is increased by the % of health missing on the target after the hit\./, "命中头部的攻击有 $1 几率降低目标1士气并以百分比降低目标的最大生命值。");	
	text = text.replace(/For every morale level dropped due to this perk, the base chance against that target is reduced by (.*?) for subsequent hits from this character\./, "以此法降低目标士气后接下来对其的成功率 $1 。");	
	text = text.replace("Cannot bring the target\'s morale to Fleeing.", "不会将士气降低到逃跑。");
	text = text.replace(/Each time you trigger this effect, gain (.*?) to a maximum of (.*?) chance to hit the head until end of this combat\./, "每次触发此效果时，获得 $1 最多 $2 的命中头部几率，直到战斗结束。");

//专心致志
	text = text.replace(/Costs (.*?) AP and builds (.*?) Fatigue/, "消耗 $1 行动点增加 $2 疲劳");		
	text = text.replace(/(.*?)Doubles(.*?) your Action Points for your current turn but makes you unable to move from your position during your turn. Cannot increase available Action Points beyond (.*?)\./, "$1双倍$2行动点，但不会超过$3 ，且不能移动。");
	text = text.replace(/(.*?)Doubles(.*?) your Action Points and increase your melee skill equals to your current AP for one turn but makes you unable to move from your position during your turn. Cannot increase available Action Points beyond (.*?)\./, "$1双倍$2行动点，增加你的近战技能等于你当前行动点一回合，但使你在本回合中无法从你的位置移动。获得的行动点不超过$3。");

	text = text.replace("Grants immunity to being knocked back, grabbed or swallowed.", " 免疫击退、抓取或吞咽。");
	text = text.replace(/Each subsequent attack skill used builds (.*?) more Fatigue\./, "使用后，后续攻击技能都会额外增加$1疲劳");
	text = text.replace(/On your next turn you will be Exhausted which lowers damage by (.*?), increases Fatigue build-up by (.*?), and (.*?)halves(.*?) the Action Points available during that turn\./, "下回合精疲力竭，技能多耗费$2疲劳，减少$1伤害，只有$3一半$4行动点可用。");
	text = text.replace("Not usable when Inspired by an ally\'s \'Inspire\' skill.", "当有激励（+4行动点）效果时不能使用。");
//	text = text.replace(/Costs 0 AP and builds 10 Fatigue.\n• (.*?) your Action Points for your current turn.\n• Each subsequent attack under this effect does a stacking (.*?) less Damage and builds (.*?) more Fatigue.\n• On your next turn you will be Exhausted which lowers damage by (.*?), increases Fatigue build-up by (.*?), and (.*?) the Action Points available during that turn.\n• Not usable when Inspired by an ally\'s \'Inspire\' skill\./,"消耗0行动点并产生10疲劳。\n• 使你这回合行动点 $1 。\n• 后续的攻击造成减少 $2 伤害并且多产生 $3 疲劳。\n• 使你下回合精疲力竭，技能多产生 $5 疲劳，减少 $4 伤害，且回合开始时只有一半行动点可用。\n• 当受到盟友“激励”技能的激励时，不可用。");
//	text = text.replace(/Costs 0 AP and builds 10 Fatigue\./,"消耗0行动点并产生10疲劳。");
//	text = text.replace(/(.*?)Doubles(.*?) your Action Points for your current turn\./,"使你这回合行动点$1双倍$2 。");
	text = text.replace(/Each subsequent attack under this effect does a stacking (.*?) less Damage and builds (.*?) more Fatigue\./,"后续的攻击造成减少 $1 伤害并且多产生 $2 疲劳。");
	text = text.replace(/On your next turn you will be Exhausted which lowers damage by (.*?), increases Fatigue build-up by (.*?), and (.*?) the Action Points available during that turn\./,"使你下回合精疲力竭，增加疲劳累积 $2，减少 $1 伤害，该回合可用行动点 $3 。");
//铁人
	text = text.replace("\'S\' is the symbol for \'Hope\'.", "‘S’是‘希望’的象征。");
	text = text.replace(/Head and Body armor is increased by (.*?)\./,"头部和身体护甲增加 $1。");
	text = text.replace(/Hitpoints damage mitigation due to remaining armor durability after receiving a hit is increased by (.*?)\./,"剩余护甲耐久对生命伤害的减免效果在受到攻击后增加$1。");
	text = text.replace(/Hitpoints damage mitigation due to remaining armor durability after receiving a hit is doubled/,"剩余护甲耐久对生命伤害的减免效果在受到攻击后翻倍。");
	text = text.replace(/Armor penetrating damage to Hitpoints received from Ranged attacks is reduced by up to (.*?), while half of the bouns countering Melee attacks\. This bonus increases exponentially by higher Maximum Durability of head and body armor\./,"来自远程攻击对生命值的穿甲伤害最多减少$1，来自近战的攻击这个效果减半。这项奖励会随着头部和身体护甲的最大耐久提高而呈指数级增加。");
	text = text.replace(/Armor penetrating damage to Hitpoints received from Ranged attacks is reduced by up to (.*?)\. This bonus increases exponentially by higher Maximum Durability of head and body armor\./,"来自远程攻击对生命值的穿甲伤害最多减少$1。这项奖励会随着头部和身体护甲的最大耐久提高而呈指数级增加。");
//LegendBalance
	text = text.replace(/Gain increased speed and endurance by balancing your armor and mobility\./,"通过平衡护甲和机动性，提高速度和耐力。");
	text = text.replace(/Reduces the penalty to Initiative due to head and body armor by (.*?)\./,"减少$1因头部和身体护甲对主动的惩罚。");
	text = text.replace(/Initiative is reduced only by (.*?) of your accumulated Fatigue, instead of all of it\./,"主动性仅减少累积疲劳的$1，而不是全部。");
//LegendLithe
	text = text.replace(/Specialize in Medium Armor! Not as nimble as some but more lithe than others!/,"专攻中甲！不如一些人灵活，但比其他人更灵活。");
	text = text.replace(/Damage to Hitpoints is reduced by (.*?) and to Armor by (.*?)\./,"对生命的伤害减少$1，对护甲的伤害减少$2。");
	text = text.replace(/The bonus drops exponentially when wearing head and body armor with a total penalty to Maximum Fatigue above 35\./,"当穿戴头部和身体护甲且最大疲劳超过35时，奖励呈指数下降。");
	text = text.replace(/Does not work if you have the Nimble perk\./,"如果你有‘轻灵’特技，就不起作用。");
//Nimble
	text = text.replace(/Specialize in light armor! By nimbly dodging or deflecting blows, convert any hits to glancing hits\./,"专攻轻甲！通过灵活躲闪或偏转打击，将任何命中转化为打偏的攻击。");
	text = text.replace(/Damage to Hitpoints is reduced by between (.*?) and (.*?) and that to armor by (.*?)half(.*?) this value\./,"生命伤害减少$1到$2，护甲伤害减少$3一半$4。");
	text = text.replace(/The bonus drops exponentially when wearing head and body armor with a total penalty to Maximum Fatigue above 15. The lighter your armor and helmet, the more you benefit\./,"当穿戴头部和身体护甲时且最大疲劳超过15时，奖励呈指数下降。盔甲和头盔越轻，受益越多。");
	text = text.replace(/Brawny does not affect this perk\./,"‘健壮’不影响此特技。");
	text = text.replace(/Does not affect damage from mental attacks or status effects, but can help to avoid receiving them\./,"不会影响精神攻击或状态影响造成的伤害，但有助于避免受到伤害。");
//Footwork
	text = text.replace(/Work those feet!/,"用脚干活！");
//	text = text.replace(/Costs 3 AP and builds 10 Fatigue\./,"aaaa");
	text = text.replace(/Unlocks the \'Footwork\' skill which allows you to leave a Zone of Control without triggering free attacks by using skillful footwork\./,"解锁‘步法’技能，允许你使用熟练的步法离开控制区域而不触发敌人的攻击。");
	text = text.replace(/Unlocks the \'Sprint\' skill which allows you to quickly cover 4 tiles or 2 tiles in a straight line, does not work across rough terrain or through enemy zones of control\./,"解锁‘冲刺’技能，允许您在快速到达2格外4格范围内的地格，不适用于崎岖地形或敌人控制区。");
	text = text.replace(/The Fatigue Cost of the skill increases by (.*?) for every 1 point of total penalty to Maximum Fatigue from head and body armor above 15, up to a maximum Fatigue Cost of (.*?)\./,"当头部和身体护甲的最大疲劳超过15时，每超1点该技能的使用疲劳成本就增加$1，最多$2。");
	text = text.replace("Picking the perk will also add \'Furinkazan\' to your perk map, which could reduce the cost of \'Sprint\'.", "选择此特技还会将‘风火山林’添加到您的特技树中，这可以降低‘冲刺’的使用成本。");
	//SpecThrowing
	text = text.replace(/Master throwing weapons to wound or kill the enemy before they even get close\./,"大师在敌人接近之前投掷武器来伤害或杀死他们。");
	text = text.replace(/Gain 25% of your Melee Skill as additional chance to hit at a distance of 3 tiles or less\./,"在三格或更近距离攻击时，额外获得25%近战技能的命中率。");
	text = text.replace(/Gain 15% of your Ranged Skill as additional armor penetration and 15% of your Melee Skill as additional armor effectiveness when hit at a distance of 3 tiles or less\./,"在三格或更近距离攻击时，15%的远程技能作为额外的护甲穿透效果，15%的近战技能作为额外防护效果。");

	text = text.replace(/Throwing Spear now ignores the damage reduction from the target\'s Shield Expert perk\./,"投掷长矛忽略目标‘盾牌专精’特技的伤害降低效果。");
	
//大力挥击
	text = text.replace(/Use the power of your hips and core to imbue more force into your swings\. AOE skills do (.*?) damage\./,"利用臀部和腹部的力量在挥击中注入更多力量。AOE技能造成 $1 伤害。");
//重击
	text = text.replace("Successful hits with maces that deal Blunt damage always apply the Baffled effect.", "成功的锤击会造成钝性伤害，总和附加‘困惑’效果。");
//血腥收割
	text = text.replace("There\'s wolves, bears, nachzehrers and you. All beings of vicious slaughter.", "这里有狼，熊，食尸鬼和你。所有邪恶屠杀的生物。");

	
	//SS肌肉发达
	text = text.replace(/Gain additional Minimum and Maximum Damage based on your current Hitpoints\. The bonus is (.*?) of your current Hitpoints for attacks with a base Action Point cost of (.*?) or less and (.*?) for attacks with a higher than (.*?) base Action Point cost\./, "基于你当前的生命值获得额外的最小和最大伤害。耗费行动点小于或等于 $2 的攻击，这个值为当前生命值的 $1，对于耗费行动点大于 $4 的攻击，这个值为当前生命值的 $3。");
	text = text.replace(/Gain additional Minimum and Maximum Damage based on your current Hitpoints\./, "基于你当前的生命值获得额外的最小和最大伤害。");
	text = text.replace(/Gain additional Minimum and Maximum Damage based on your current Hitpoints/, "基于你当前的生命值获得额外的最小和最大伤害。");
	text = text.replace(/The bonus is (.*?) of your current Hitpoints per AP for attacks with a base Action Point cost of (.*?) or less and (.*?) per AP for attacks with a higher than (.*?) base Action Point cost\./, "行动点成本小于等于$2的攻击，每点行动点成本作为 $1 当前生命值的伤害加成，行动点成本大于$4的攻击，每点行动点成本作为 $3 当前生命值的伤害加成。");
	text = text.replace(/The bonus is (.*?) of your current Hitpoints for attacks with a base Action Point cost of (.*?) or less and (.*?) for attacks with a higher than (.*?) base Action Point cost\./, "耗费行动点小于或等于 $2 的攻击，这个值为当前生命值的 $1，对于耗费行动点大于 $4 的攻击，这个值为当前生命值的 $3。");
	text = text.replace(/The factor is reduced to (.*?) for weapons have a range more than one tile and (.*?) for some goblin weapons\./, "如果此技能射程超过一格，该系数降低至 $1 ，对于某些哥布林武器，该系数降低至 $2 。");
	text = text.replace(/The bonus cannot be higher than (.*?)\./, "伤害加成不超过 $1 。");
//SS巨力猛击
	text = text.replace(/(.*?)\'Double Grip\'(.*?) will increase (.*?) damage instead of (.*?), even when you are unarmed. Besides increase (.*?) armor penetration when unarmed\./, "$1‘双手握持’$2提供 $3 伤害加成，而不是 $4 ，即使你手无寸铁。此外，在非武装状态下增加 $5 装甲穿透。");
	text = text.replace(/(.*?)\'Double Grip\'(.*?) will increase (.*?) damage instead of (.*?)\./, "$1‘双手握持’$2提供 $3 伤害加成，而不是 $4 。");
	text = text.replace(/The effect of (.*?)\'Muscularity\'(.*?) is (.*?)tripled(.*?)\./, "$1‘肌肉发达’$2 的效果翻$3三倍$4。");
	text = text.replace(/All skills\' fatigue cost are increased by (.*?) of your hitpoints, AP cost is increased by (.*?) and defences and initiative are decreased by (.*?) of your hitpoints\./, "所有技能的疲劳成本增加相当于你 $1 当前生命值，AP消耗增加 $2 点，主动值、防御降低相当于你 $3 当前生命的值。");
	text = text.replace(/All skills\' fatigue cost are increased by (.*?) of your hitpoints, AP cost is increased by (.*?) and melee combat attributes including initiative are decreased by (.*?) of your hitpoints\./, "所有技能的疲劳成本增加相当于你 $1 当前生命值，AP消耗增加 $2 点，主动值、近战技能和近战防御降低相当于你 $3 当前生命值。");
	text = text.replace(/AP cost is increased by (.*?) and melee combat attributes including initiative are decreased by (.*?) of your hitpionts\./, "AP消耗增加 $1 点，主动值、近战技能和近战防御降低相当于你 $2 当前生命值。");
	text = text.replace(/The hitpoints threshold is (.*?)\./, "生命值的门槛是 $1 。");
	text = text.replace(/(.*?)\'Reposite\'(.*?) skill will have an additional (.*?) hitchance modification, (.*?)\'Duelist\'(.*?) skill will provide at most (.*?) armor penetration\./, "$1‘还击’$2 有$3命中几率修正，$4‘决斗者’$5 提供的不超过 $6 的护甲穿透。");
	text = text.replace(/Each time killing an enemy additionally does (.*?) of its damage to a random enemy adjacent to the target\./, "每次杀死一个敌人，对目标附近的随机敌人额外造成 $1 的伤害。");
	//SS全力
	text = text.replace(/Put your full weight into defending every blow and gain (.*?) of the combined fatigue modifier from body, head, main hand and off hand as Damage output bonus\./, "将你的全身重量作用于每次打击，将你身体、头部、主手和副手装备的重量总和的 $1 作为伤害加成。");
	text = text.replace(/You will also have the weak steadfast effect if the combined fatigue modifier from body, head and off hand is above (.*?)\./, "重量超过 $1 时，受击或者闪避产生的疲劳减少三分之二。");
	text = text.replace(/Besides, the weak steadfast effect upgrades to steadfast if it is above (.*?)\./, "重量超过 $1 时，受击或者闪避产生的疲劳再减少三分之二。");
	text = text.replace(/Additionally, you will grant immue to stun if it is above (.*?)\./, "重量超过 $1 时你将免疫眩晕。");
//SS分裂人
	text = text.replace(/When you are engaged in melee, gain (.*?) Melee Skill, Ranged Skill, Melee Defense, and Ranged Defense. The bonus increases by (.*?) every turn up to a maximum of (.*?) as long as you continue to start your turn adjacent to any enemies\./, "当你进行近战时，获得 $1 近战技能、远程技能、近战防御和远程防御。只要你继续在任何敌人附近开始回合，奖励每回合增加 $2，最多增加 $3。");
	text = text.replace(/Hack will gain an (.*?) attack but deal (.*?) damage/, "野蛮人狂战士斧额外攻击一次，但伤害 $2 。");
    text = text.replace("When you hit enemies' head", "命中头部时");	
	text = text.replace(/Split Man will hit body with (.*?) more damage\./, "‘分裂人’(双手斧)对身体部位伤害提高 $1 。");
	text = text.replace(/Split Man will hit another body part with (.*?) more damage\./, "‘分裂人’(双手斧)对任何身体部位伤害提高 $1 。");

	text = text.replace(/Strike will do a free extra attack with (.*?) damage\(not regarded as critical strikes\)\./, "打击将造成$1点伤害的免费额外攻击（不视为暴击)。");
	
	text = text.replace(/Strike will deal (.*?) more damage to hitpoints\./, "‘打击’(长柄斧)的生命伤害提高 $1 。");
	text = text.replace(/Strike will inflict (.*?) more damage\./, "‘打击’(长柄斧)伤害提高 $1 。");
	text = text.replace(/Chop will deal (.*?) more damage to hitpoints when hitting heads\./, "‘劈剁’(单手斧)击中头部时对生命值伤害提高 $1 。");
	text = text.replace(/Chop will deal (.*?) more damage to hitpoints\./, "‘劈剁’(单手斧)对生命值伤害提高 $1 。");
	text = text.replace(/(.*?)\'Between the Eyes\'(.*?) build up (.*?) less Fatigue\./, "$1‘瞄准眉心’$2耗费的疲劳降低 $3 。");
//穿透射击
    text = text.replace("Launch a shot so powerful it can hit two targets in a straight line.", "强力射击，可以击中直线上的两个目标。");
    text = text.replace("It is a powerful shot that can pass straight through one enemy to the enemy behind him.", "这是一强力射击，可以直接穿过一个敌人击中他身后的敌人。");


//Wrong Door 错误之门
	text = text.replace(/Most Negative effects will have a difficulty check \(DC\) equals to your ranged defense before applying on you\./, "大多数负面效果在应用于你之前都会有一个与你的远程防御相当的难度检查（DC）。");
//Born to Be Surrounded 天生被包围
	text = text.replace(/Being surrounded no longer affects this character\'s defences or resolve at all\./, "被包围不再影响该角色的防御或决心。");
//A Hit to End All 一鸣惊人
	text = text.replace(/The penalty to hit chance when shooting at a target that has no clear line of fire is reduced to (.*?)\./, "向没有清晰路线的目标射击时，命中几率的惩罚降低到 $1。");
//Strive for Perfection 追求完美
	text = text.replace(/Your dice has a upper bound of (.*?), while enemies's dices have a lower bound of (.*?)\./, "你的骰子上限为 $1，而敌人的骰子下限为 $2。");
	text = text.replace(/Your dice has an upper bound of (.*?), while enemies's dices have a lower bound of (.*?)\./, "你的骰子上限为 $1，而敌人的骰子下限为 $2。");

	//A Waking Chant 唤醒吟唱
	text = text.replace(/Unlocks the active skill to let you be able to convert fatigue to action points\./, "解锁主动技能，让你能够将疲劳转化为行动点");
	text = text.replace(/Also unlocks the \'Recover\' skill\./, "同时解锁‘恢复’技能。");
//Too Stubborn to Die 小强附身
	text = text.replace(/Gain (.*?) damage reduction for every (.*?) of missing hitpoints\./, "每损失 $2 的生命值，获得 $1 的伤害减免。");
//In Delay There Lies No Plenty 时不待我
	text = text.replace(/• (.*?)Double(.*?) your base initiative when determining turn order\./, "确定回合顺序时，将你的基本主动值提高$1一倍$2。");
	text = text.replace(/• (.*?)Double(.*?) your initiative when determining turn order\./, "确定回合顺序时，将你的主动值提高$1一倍$2。");
	text = text.replace(/Also grants the ability to be immune to staggered\./, "还获得免疫趔趄的能力。");
//Once More Unto the Breach 再次突破
	text = text.replace(/The attributes are increased as if you are confident\./, "如果你士气自信，属性会增加。");
	text = text.replace(/Low morale states does not lower your attributes at all\./, "士气低落状态不会降低你的属性。");

//Scintillating 才华横溢
	text = text.replace(/Immediately gain another (.*?)Trait(.*?) tree and (.*?)Weapon(.*?) tree\./, "立即获得另一个$1‘特性’$2特技树和$3‘武器’$4特技树。");
	text = text.replace(/For those whose perk trees are not generated automatically, they will lose random maximum ranges of all attributes instead, in return for an additional (.*?)perk point(.*?)\./, "对于那些没有自动生成额外特技树的人，将失去所有属性随机最大值的机会，换取额外的$1特技点$2。");
	text = text.replace(/Will always (.*?)RESET(.*?) your perks for free after you picked this perk\./, "在您选择此特技后，将能获得一次免费的$1洗点$2(谨慎)。");
//Heavy Armor Mastery 
	text = text.replace(/Remove the penalty for (.*?)encumbrance(.*?) while (.*?)double(.*?) the bonus of it\./, "取消$1负重$2的惩罚，同时将其奖励$3翻倍$4。");
//Medium Armor Mastery
	text = text.replace(/Grants additional fatigue recovery and ranged defense according to the rate of your current Initiative divided by your armor\'s weight, up to a maximum of (.*?)\./, "根据当前主动性除以护甲重量的比率，给予额外的疲劳恢复和远程防御，最多可达$1。");
	text = text.replace(/The bonuses reach the maximum when your Initiative is higher than three times your armor\'s weight./, "当你的主动性高于护甲重量的三倍时，奖励达到最大值。");
//Light Armor Mastery
	text = text.replace(/Fatigue use is reduced by up to (.*?), but lowered exponentially by the total penalty to Maximum Fatigue from body and head armor above (.*?)\./, "疲劳使用最多减少 $1，但如果身体和头部护甲的疲劳程度超过$2，则总惩罚呈指数级降低。");

//清晰
	text = text.replace(/A well honed mind can perceive more in each instant, making time appear slower in key instants of need./, "一个训练有素的头脑可以在每一瞬间感知更多，使时间在关键时刻显得更慢。");
	text = text.replace(/Gain (.*?) action point, does not work if you are dazed, drunk, hungover, taunted, staggered, horrified, concussed, fleeing or over (.*?) fatigued\./, "获得 $1 行动点，如果你晕眩、醉酒、宿醉、被嘲讽、趔趄、恐惧、脑震荡、逃跑或超过 $2 疲劳，则不起作用。");
	text = text.replace(/Gain (.*?) action point for next turn and half for the turn after that, does not work if you are dazed, drunk, hungover, taunted, staggered, horrified, concussed, fleeing or over (.*?) fatigued\./, "下一回合获得 $1 行动点，下下回合获得一半行动点，如果你晕眩、醉酒、宿醉、被嘲讽、趔趄、恐惧、脑震荡、逃跑或超过 $2 疲劳，则不起作用。");
	text = text.replace(/Gain (.*?)addtional(.*?) action point if under the effect of potions that improve cognition: Iron Will, Lionheart, Cat, Second Wind or Hexen Ichor\./, "如果在提高感知的药剂作用下，获得$1额外$2的行动点：钢铁意志药水、狮心药水、猫鼬药水、第二呼吸药水或和女巫灵液。");
//SS两仪回风
//	text = text.replace(/Every successful attack provides you additional (.*?) damage ignores armor this turn\./, "每次成功的近战攻击都会使你在本回合的后续攻击额外造成 $1 穿甲伤害。");
//	text = text.replace(/Every attack that hits armor and does at least (.*?) damage to Hitpoints, applies a stacking bleeding damage of (.*?), if this attack does at least (.*?) damage, the bleeding damage is increased to (.*?)\./, "每一次命中护甲并对生命值造成至少 $1 伤害的攻击，都会造成可叠加的 $2 流血伤害，如果这次攻击造成至少 $3 伤害，流血伤害将增加 $4。");
//	text = text.replace(/Every attack that does at least (.*?) damage to Hitpoints, applies a stacking bleeding damage of (.*?), per stack of bleeding effect from this perk lowers target's threshold to receive injury and resolve by (.*?), if this attack does at least (.*?) damage, apply addtional 1 stack\./, "每一次对生命值造成至少 $1 伤害的攻击，都会造成可叠加的 $2 流血伤害，每叠加一次流血效果，该特技使目标受伤的阈值和决心降低 $3，如果该次攻击造成至少 $4 伤害，则额外增加1层流血");
	text = text.replace(/Every attack that does at least (.*?) damage to Hitpoints, applies a stacking debuff, each stack lowers target's threshold to receive injury and resolve by (.*?), if this attack does at least (.*?) damage, apply addtional 1 stack and bleeding target\./, "每次对生命值造成至少 $1 伤害的攻击，都会对目标叠加一层减益，每层减益使目标的受伤阈值和决心降低 $2，如果该次攻击造成至少 $3 伤害，则目标额外增加一层减益和流血");
	text = text.replace("Piercing attacks can now inflict injuries on Undead.", "穿刺攻击现在可以对不死生物造成伤害。");
//	text = text.replace(/The bonus increases to (.*?) when wielding daggers equipped in the Mainhand\./, "如果主手装备匕首，效果提升至 $1 。");
//SS全面掩护
	text = text.replace(/Grants (.*?) damage reduction when using shieldwall, (.*?) for fortify\./, "激活盾墙时减少 $1 受到的伤害，如果是塔盾提升至 $2 。");
//SS守护者
	text = text.replace(/Increase the Melee Defense, Ranged Defense and Initiative of adjacent allies by (.*?) of your total Melee Defense and Ranged Defense\./, "相邻的友军获得近战防御、远程防御和主动值加成，加成相当于你 $1 近战防御远程防御总和。");
    text = text.replace("If multiple users with this perk are present, only the highest bonus applies.", "有多人施加此增益时，仅近战防御远程防御总和最高者生效。");	
//SS风火山林
	text = text.replace(/If you have also learned (.*?)/, "如果你已经解锁了 $1 ");
	text = text.replace(/Reduce the Action Point costs of the Rotation, Footwork, Evasion, Sprint and Audacious Charge skills by (.*?), while the fatigue costs are reduced by (.*?)\./, "换位、步法、回避、冲刺和无畏冲锋技能的行动点成本减少$1，疲劳成本减少$2。");
	
	text = text.replace(/the skill cost (.*?) less fatigue, (.*?) Action Points\./, "那么换位的疲劳成本 $1 ，行动点成本 $2 。");
//SS回摆
	text = text.replace(/Once per turn, the first time you misses an attack on an opponent, restore (.*?) AP if this attack cost more than (.*?) AP, while the next attack will use only (.*?) of your hitchance and inflicts (.*?)\./, "每回合一次，当你第一次未命中时，如果此攻击消耗 $2 点以上的AP，则恢复 $1 点AP，而下一次攻击的命中率只有 $3，造成的伤害只有 $4。");
	text = text.replace(/The penalty to Maximum Fatigue caused by two-handed weapons placing in bags is (.*?)\./, "放置在背包的双手武器的负重减半。");
	text = text.replace(/(.*?) now is available for two-handed weapons\./, "$1现在对双手换双手生效。");
	text = text.replace("Polearms no longer receive hitchance penalty when engaged in melee.", "长柄接敌时不再有命中率惩罚。");
//SS预备
    text = text.replace("When wielding a sword, if you have not moved from your position during your turn, use Riposte freely at the end of your turn if your weapon has Riposte and you have enough Fatigue to use Riposte.", "回合内没有移动且有足够的疲劳时，回合结束自动使用“还击”。");	
	text = text.replace(/When wielding a sword and wielding it at the start of your turn, besides not staggered, riposte those who has the \'Exploitable Opening\' effect for free, the damage dealt is (.*?) for the first attack and is reduced by (.*?) for every next attack up to a minimum of (.*?), while riposte with \'Overhead Strike\' deals (.*?) damage compares to \'Slash\', will also (.*?) hit-chance if you don't have the Sword Mastery perk\./, "你在回合开始时挥舞剑时，除了不趔趄外，免费还击那些具有‘破绽百出’效果的人，第一次攻击造成的$1伤害，后续每次攻击减少$2伤害，最小$3，而‘头顶打击’的还击相比‘挥砍’造成$4伤害，如果你没有‘剑术精通’特技，命中率$5。");
	text = text.replace("If you have already used \'Riposte\', gain the \'Return Favor\' effect instead of riposte twice at the end of your turn until the start of your next turn.", "如果你已经使用了‘还击’，则在你的回合结束时获得‘以牙还牙’效果替代下一回合开始前的两次还击。");
    text = text.replace("If your weapon does not have Riposte, gain the \'Return Favor\' effect instead until the start of your next turn, as long as you have enough Fatigue for your primary attack.", "武器没有还击且有足够疲劳，可获得‘以牙还牙’效果直到下回合。");	
    text = text.replace("If your weapon does not have Riposte, gain the \'Return Favor\' effect instead until the start of your next turn.", "武器没有还击，可获得‘以牙还牙’效果直到下回合。");	
    text = text.replace("If your weapon does not have Riposte and is two-handed, gain the \'Return Favor\' effect instead until the start of your next turn.", "双手武器没有还击，可获得‘以牙还牙’效果直到下回合。");	

    text = text.replace("Does not build any Fatigue and costs no Action Points.", "不会产生任何疲劳，也不需要行动点。");
	text = text.replace(/This perk will also upgrade (.*?)Exploit Opening(.*?), increase damage and armor penetration by the same bonus\./,"特技升级 $1破绽百出$2 的效果，提供相同的伤害和护甲穿透加成。");
	text = text.replace(/This perk only triggers if you have at least (.*?) Fatigue remaining\. Does not build any Fatigue or cost any Action Points\./,"只有当你还有至少$1疲劳时，这个特技才会触发。不会产生任何疲劳或消耗任何行动点。");

	//SS破绽百出
	text = text.replace(/Whenever an opponent misses a Melee attack against you, they are affected by the \'Exploitable Opening\' effect until their next turn, which gives you (.*?) chance to hit against them, while the bouns is increased to (.*?) if you are wielding two-handed swords \./,"敌人对你近战攻击落空时会获得“破绽百出”效果持续至他们的下一回合，使得攻击他时给予你 $1 命中率加成，双手剑则是  $2 。");
    text = text.replace("Makes the \'Riposte\' skill available on the Shamshir and One-Handed versions of Saif and Scimitar", "还会让舍施尔弯刀和单手版本的赛义夫弯刀和弯刀可以使用“还击”技能。");
	text = text.replace(/If you have picked (.*?)En Garde(.*?), increase damage and armor penetration against them by the same bonus\./,"如果你解锁了 $1实战姿势$2 ，提供相同的伤害和护甲穿透加成。");
//SS节拍
	text = text.replace(/Every attack against a target who acts after you in the current round increases your Initiative by (.*?), additionally Melee Skill and Melee Defense will increase by (.*?)\./, "攻击在你之后行动的敌人会使你直到下一回合内获得 $1 主动值和 $2 近攻近战防御。");
	text = text.replace(/All bonus is decreased to (.*?) if you are not wielding pure swords\./, "如果不是装备纯种剑效果只有$1");
	text = text.replace("These bonuses lasts over into your next turn but only until the first skill used or waiting that turn.", "加成持续到下一回合，在你使用第一个技能或等待回合后也会结束此效果。");
	text = text.replace(/Every attack against a target who acts after you in the current round increases your Initiative by (.*?)\./,"攻击这回合在你之后行动的敌人会使你增加 $1 主动值。");
//深入骨间
	text = text.replace(/Piercing attacks deal (.*?) more damage per ally surrounding the target\./, "‘刺穿’攻击目标时，目标周围的每个盟友提供 $1 额外伤害。");
	text = text.replace(/Daggers in mainhand deal (.*?) instead\./, "如果是主手匕首，提供的额外伤害为 $1。");
	
	//SS鼓舞
	text = text.replace(/Use your way with song to cheer on an ally\. Grants (.*?) Action Points to an ally adjacent to you\. Costs 3 Action Points to perform\. Can only be used with an Instrument or Banner equipped\./, "用你的歌声为一个盟友加油。消耗3行动点让附近的一个盟友获得 $1 行动点，需要乐器或战旗。");
	text = text.replace(/Grants (.*?) Action Points to an ally adjacent to you. Costs 3 Action Points to perform. Can only be used with an Instrument or Banner equipped\./, "需要乐器或战旗，消耗3AP让一个盟友下回合 $1 行动点。不能叠加。");
//SS警惕
	text = text.replace(/At the end of your turn, gain Melee Defense and Ranged Defense double to your remaining Action Points up to a maximum of (.*?)\./,"在你回合结束时，获得相当于两倍剩余行动点数的近战防御和远程防御加成，最多 $1 点。");
	text = text.replace(/At the end of your turn, gain Melee Defense and Ranged Defense based on your remaining Action Points and Fatigue percentage. The bonus lasts until the end of your next turn and ranges from (.*?) to (.*?) per action point\./,"在回合结束时，根据剩余的行动点和疲劳百分比获得近战防御和远程防御。奖励持续到下一回合结束，每个行动点 $1到$2防御加成。");

	text = text.replace(/The bonus lasts until the end of your next turn and won\'t be less than (.*?) per action point\./,"但当前疲劳积累越高加成越低，最低 $1 。这些加成持续到你下回合结束。");
//SS猛烈进攻
	text = text.replace(/For every 2 tiles moved, the Action Point cost of your next attack is reduced by (.*?) to a minimum of (.*?), the Fatigue Cost is reduced by (.*?), and the Damage is increased by (.*?)\./,"每移动两格都会使下次攻击AP消耗减少 $1 ，疲劳消耗减少 $3 ，伤害增加 $4 。AP消耗不低于 $2 。");
//SS穷凶极恶
	text = text.replace(/The bonus will increase over time with a maximum of (.*?)\./, "随着天数增长，这个效果最高可以达到 $1 。");
//SS粉碎盾牌
//	text = text.replace(/Abilities targeting shields do (.*?) more damage\./, "对盾牌的伤害 $1 。");
	text = text.replace(/If a shield is destroyed using the \'Split Shield\' skill, (.*?) Action Points and (.*?) fatigue cost are immediately regained\./, "使用“劈盾”技能破坏盾牌时返还 $1 AP和 $2 疲劳成本。");
//SS瞄准
//	text = text.replace(/Costs (.*?) AP and builds (.*?) Fatigue.\n• Applies to your next attack during the same turn\./, "消耗 $1 行动点并产生 $2 疲劳。\n• 作用于当前回合。");	
	text = text.replace(/Costs (.*?) AP and builds (.*?) Fatigue\./, "消耗 $1 行动点并产生 $2 疲劳。");	
	text = text.replace(/Applies to your next attack during the same turn\./, "作用于当前回合。");	
	text = text.replace(/Applies to your next attack during this turn only\./, "作用于当前回合。");	
	text = text.replace("For crossbows, the attack ignores the hitchance penalty from obstacles and the shot cannot go astray", "如果是弩则不会射偏并且无视障碍命中率减益。");	
	text = text.replace(/For Handgonnes the attack has its Maximum Range increased by (.*?) and if used at a shorter range, the area of effect is increased by (.*?) instead\./, "如果是手炮则增加 $1 射程并且在近距离射击增加 $2 影响范围。");	
	text = text.replace(/For fire lances, Ignite will have a (.*?) chance to disarm enemies and hitchance is increased by (.*?)\./, "如果是火矛的喷火技能，则增加 $2 命中几率并有 $1 缴械敌人。");	
	text = text.replace(/The following ranged attack will build additional (.*?) Fatigue when being aimed\./, "同时这些攻击多产生 $1 疲劳。");	
//SS肌肉记忆
	text = text.replace(/The damage of ignite is increased by (.*?)\./, "火矛的喷火技能伤害和破甲提升 $1 。");	
//SS瞄准训练
	text = text.replace(/Damage penetration of Aimed Shot is also increased by (.*?)\./, "瞄准射击增加 $1 护甲穿透。");

	text = text.replace("aaaa", "aaaa");
//Retrofit Hooks 改装挂钩
	text = text.replace("Unlocks the \'Hook\' skill when you are wielding a long weapon.", "当你装备长武器时，解锁‘钩拽’技能。");
	text = text.replace(/If your weapon already has this skill, then it will cost (.*?) less fatigue and gain additional (.*?) hitchance\./, "如果你的武器已经拥有此技能，那么它将减少$1疲劳，并获得额外的$2命中率。");
//Thriving in Chaos 浑中求进
	text = text.replace("Always be at wavering morale state at start of every turn.", "你总会以动摇的士气状态开始回合");
	text = text.replace(/Gain (.*?) Melee Skill for each negative status including dazed, staggered, poisoned, debilitated and bleeding, (.*?) Melee Defense for every Injuries including permament ones, (.*?) Resolve for every 33% of missing hitpoints, (.*?) Initiative for every 33% of accumulated fatigue\./, "每种负面状态(包括茫然、趔趄、中毒、虚弱和流血)获得$1近战技能，每种伤口(包括永久伤)获得$2近战防御，每损失33%的生命值获得$3决心，每累积33%的疲劳获得$4主动值。");
	text = text.replace(/If all the above conditions are met, gain (.*?) total damage and damage reduction\./, "如果满足以上所有条件，则获得$1伤害加成和伤害减免。");
//Anchor 锚定
	text = text.replace(/Gain (.*?) Melee Skill and Melee Defense as long as you have not moved during your turn\./, "只要你在回合中没有移动，就能获得 $1 近战技能和近战防御。");
//Honor Heritage 荣誉传承
	text = text.replace(/At the end of your turn, increase your morale at a probability of (.*?)\./, "在你的回合结束时，$1的概率增加你的士气。");
//Irresistible Impulse 无法抗拒的冲动
	text = text.replace(/Each time you use the \'Adrenaline\' skill, you'll gain (.*?) fatigue recovery, (.*?) melee skill and (.*?) damage next turn\./, "每次使用‘肾上腺素’技能时，下一回合你将获得 $1 疲劳恢复，$2 近战技能和 $3 伤害。");
//Audacious Charge 无畏冲锋
	text = text.replace(/Charge towards a tile up to 2 tiles away, staggering a random enemy adjacent to that tile and performing a free attack against him which does (.*?) total damage, and if the target is already staggered or dazed, inflict \'Stun\'\./, "冲向最多2个格的地块，趔趄与该地块相邻的随机敌人，对其进行自由攻击，造成 $1点 总伤害，如果目标已经‘趔趄’或‘茫然’，则造成‘晕眩’。");
	text = text.replace("Cannot be used when engaged in melee, or pass through enemy zones of control.", "不能近战中施展或通过敌人控制区。");
	text = text.replace("Picking the perk will also add \'Furinkazan\' to your perk map, which could reduce the cost of \'Audacious Charge\'.", "选择该特技也会将‘风火山林’添加到您的特技树中，这可以降低‘无畏冲锋’的使用成本。");
//Normal Block 格挡训练
	text = text.replace(/Whenever you are attacked by melee skills, 1D100 and if it is lower than your melee skill subtracted attacker's melee skill, receive only (.*?) total damage, other cases gain (.*?) reduction based on the result of this roll\./, "每当你受到近战技能攻击时，投掷一个1D100的骰子，如果你的近战技能减去攻击者的近战技能的值低于投出的骰子值，则只会受到 $1 伤害，其他情况下会根据此掷骰结果获得$2伤害减免。");
//Battle Rhaposdy 战斗狂想曲
	text = text.replace("During your turn, every successful attack provides a stacking bonus to Hitchance, Initiative and Action Points.", "在你的回合中，每次成功的攻击都会叠加一层命中率、主动值和行动点的增益。");
	text = text.replace(/Each stack increases Melee Skill, Ranged Skill and Initiative by (.*?)\./, "每层增益增加 $1 近战技能、远程技能和主动值。");
	text = text.replace(/Your Action Points are increased by a total of (.*?) at 3 stacks, (.*?) at 6 stacks and (.*?) at 10 stacks\./, "你的行动点在3层增益时增加 $1，在6层增益时增加 $2，在10层增益时提高 $3。");
	text = text.replace("Attacks not at 1 tile range only grant a stack after two successful hits.", "非一格范围的攻击只提供0.5层。");
	text = text.replace("You lose half of the stacks if you miss an attack or if you get hit.", "攻击落空或者被击中时减少一把层数。");
	text = text.replace("Cannot have more than 10 stacks.", "不能超过10层。");
//Before the Storm 风暴前夕
	text = text.replace(/If you end turn with at least 1 AP left, gain (.*?) AP next turn and recover (.*?) maximum stamina\./, "如果你结束回合时至少还剩1点AP，下回合获得$1点AP并恢复$2最大疲劳。");
	text = text.replace("\'Recover\' will always leave 1 AP to trigger this effect.", "‘恢复’将始终保留1AP以触发此效果。");
//Perseverance 坚忍
	text = text.replace(/The more damage you will receive, the more damage reduction you'll get, up to (.*?) HP damage reduction. But if too much damage is taken therefore it hurts you indeed, half of the damage reduction will convert to bleeding which last for two turns\./, "你受到的伤害越多，你的伤害减免越多，最多减免 $1 生命伤害。但是如果你受到了太多的伤害，那么伤害减免的一半会转化为流血，持续两个回合。");
//Navigator 领航员
	text = text.replace("Grant \'Pathfinder\' to all your allies adjacent to you at the start or at the end of your turn as long as you are not engaged.", "未接敌时，回合开始时或回合结束时与你相邻的友军获得一回合的‘踏青’效果。");
//Rapid March 急行军
	text = text.replace(/Grant a nearby ally \'Rapid March\' effect, reduced his Action Point cost for movement by (.*?) for each tile, but the Fatigue cost is doubled\./, "授予附近的盟友‘急行军’效果，每移动一格减少 $1 行动点成本，但疲劳成本增加一倍。");
//
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
//
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
//
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
//
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	text = text.replace(/aaaa/, "aaaa");
	
	
	
	text = text.replace(/Damage is increased by (.*?)\./, "伤害增加$1。");
//	text = TranslateCharacterScreenPerksModule0(text);
	text = text.replace(/(.*?)Requires:(.*?) Buckler, Parrying Dagger, or Tool(.*?)/, "$1依赖$2：盾牌、防御匕首或工具$3");
	text = text.replace(/(.*?)Requires:(.*?) Crossbow or Firearm(.*?)/, "$1依赖$2：弩或火器$3");
	text = text.replace(/(.*?)Requires:(.*?) Staff or Musical Instrument(.*?)/, "$1依赖$2：法杖或乐器$3");
	text = text.replace(/(.*?)Requires:(.*?) One-Handed Melee or Throwing Weapon(.*?)/, "$1依赖$2：单手近战武器或投掷武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Melee AOE Attack(.*?)/, "$1依赖$2：近战范围攻击$3");
	text = text.replace(/(.*?)Requires:(.*?) Non-Hybrid Dagger(.*?)/, "$1依赖$2：非混合匕首$3");
	text = text.replace(/(.*?)Requires:(.*?) Two-Handed Melee Weapon(.*?)/, "$1依赖$2：双手近战武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Melee or Throwing Weapon, or Unarmed(.*?)/, "$1依赖$2：近战、投掷武器或徒手$3");
	text = text.replace(/(.*?)Requires:(.*?) Melee Weapon or Unarmed(.*?)/, "$1依赖$2：近战武器或徒手$3");
	text = text.replace(/(.*?)Requires:(.*?) Melee, Bow or Throwing Attack(.*?)/, "$1依赖$2：近战、弓或投掷攻击$3");
	text = text.replace(/(.*?)Requires:(.*?) Bow or Throwing Attack(.*?)/, "$1依赖$2：弓或投掷攻击$3");
	text = text.replace(/(.*?)Requires:(.*?) Piercing Damage or Melee Attack(.*?)/, "$1依赖$2：穿刺伤害或近战攻击$3");
	text = text.replace(/(.*?)Requires:(.*?) Two-Handed, Long Weapon(.*?)/, "$1依赖$2：双手武器、长武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Two-Handed or Long Weapon(.*?)/, "$1依赖$2：双手武器或长武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Melee Attack(.*?)/, "$1依赖$2：近战攻击$3");
	text = text.replace(/(.*?)Requires:(.*?) Melee Weapon(.*?)/, "$1依赖$2：近战武器$3");
	text = text.replace(/(.*?)Requires:(.*?)Melee Damage(.*?)/, "$1依赖$2：近战伤害$3");
	text = text.replace(/(.*?)Requires:(.*?) Ranged Attack(.*?)/, "$1依赖$2：远程攻击$3");
	text = text.replace(/(.*?)Requires:(.*?) Non-hybrid southern curved Sword(.*?)/, "$1依赖$2：非混合南方弯刃剑$3");
	text = text.replace(/(.*?)Requires:(.*?) Non-hybrid two-handed Sword(.*?)/, "$1依赖$2：非混合双手剑$3");
	text = text.replace(/(.*?)Requires:(.*?) Two-Handed(.*?)/, "$1依赖$2：双手武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Long Weapon(.*?)/, "$1依赖$2：长武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Throwing Weapon(.*?)/, "$1依赖$2：投掷武器$3");
	text = text.replace(/(.*?)Requires:(.*?) Sling(.*?)/, "$1依赖$2：吊索$3");
	text = text.replace(/(.*?)Requires:(.*?) Cleaver(.*?)/, "$1依赖$2：砍刀$3");
	text = text.replace(/(.*?)Requires:(.*?) Non-hybrid Sword(.*?)/, "$1依赖$2：非混合剑$3");
	text = text.replace(/(.*?)Requires:(.*?) Dagger(.*?)/, "$1依赖$2：匕首$3");
	text = text.replace(/(.*?)Requires:(.*?) Axe(.*?)/, "$1依赖$2：斧$3");
	text = text.replace(/(.*?)Requires:(.*?) Staff(.*?)/, "$1依赖$2：法杖$3");
	text = text.replace(/(.*?)Requires:(.*?) Sword(.*?)/, "$1依赖$2：剑$3");
	text = text.replace(/(.*?)Requires:(.*?) Bow(.*?)/, "$1依赖$2：弓$3");
	text = text.replace(/(.*?)Requires:(.*?) Spear(.*?)/, "$1依赖$2：矛$3");
	text = text.replace(/(.*?)Requires:(.*?) Polearm(.*?)/, "$1依赖$2：长柄$3");
	text = text.replace(/(.*?)Requires:(.*?) Flail(.*?)/, "$1依赖$2：链枷$3");
	text = text.replace(/(.*?)Requires:(.*?) Banner(.*?)/, "$1依赖$2：战旗$3");
	text = text.replace(/(.*?)Requires:(.*?) Staff(.*?)/, "$1依赖$2：法杖$3");
	text = text.replace(/(.*?)Requires:(.*?) Crossbow(.*?)/, "$1依赖$2：弩$3");
	text = text.replace(/(.*?)Requires:(.*?) Shield(.*?)/, "$1依赖$2：盾牌$3");
	text = text.replace(/(.*?)Requires:(.*?) Unarmed(.*?)/, "$1依赖$2：徒手$3");
	text = text.replace(/(.*?)Requires:(.*?) Mace(.*?)/, "$1依赖$2：棍$3");
	text = text.replace(/(.*?)Requires:(.*?) Hammer(.*?)/, "$1依赖$2：锤$3");
	text = text.replace(/(.*?)Requires:(.*?) Cutting Damage(.*?)/, "$1依赖$2：劈砍伤害$3");
	text = text.replace(/(.*?)Requires:(.*?) Blunt Damage(.*?)/, "$1依赖$2：钝器伤害$3");
	text = text.replace(/(.*?)Requires:(.*?) Piercing Damage(.*?)/, "$1依赖$2：穿刺伤害$3");
	text = text.replace(/(.*?)Requires:(.*?) Burning Damage(.*?)/, "$1依赖$2：灼热伤害$3");
	text = text.replace(/(.*?)Inflicts (.*?) Burning, (.*?) Piercing Damage(.*?)/, "$1造成$2灼热伤害、$3穿刺伤害$4");
	text = text.replace(/(.*?)Inflicts (.*?) Blunt, (.*?) Piercing Damage(.*?)/, "$1造成$2钝器伤害、$3穿刺伤害$4");
	text = text.replace(/(.*?)Inflicts (.*?) Cutting, (.*?) Piercing Damage(.*?)/, "$1造成$2劈砍伤害、$3穿刺伤害$4");

	text = text.replace(/(.*?)Inflicts Burning Damage(.*?)/, "$1造成灼热伤害$2");

	text = text.replace("Cutting Damage", "劈砍伤害");
	text = text.replace("Burning Damage", "灼热伤害");
	text = text.replace("Blunt Damage", "钝器伤害");
	text = text.replace("Piercing Damage", "穿刺伤害");
	text = text.replace("No Injuries Damage", "非损伤伤害");
	text = text.replace("One-Time Effect:", "一次性效果：");
	text = text.replace("Active:", "主动：");
	text = text.replace("Passive:", "被动：");
	text = text.replace("When Enabled:", "当激活时：");
	text = text.replace("Requires:", "依赖：");
/*
	text = text.replace(/(.*?)Requires:(.*?) /, "$1依赖$2：");
	text = text.replace(/(.*?)Requires:(.*?) /, "$1依赖$2：");
	text = text.replace(/(.*?)Requires:(.*?) /, "$1依赖$2：");

	text = text.replace("Melee Weapon or Unarmed", "近战武器或徒手$3");
	text = text.replace("Melee, Bow or Throwing Attack", "近战、弓或投掷攻击$3");
	text = text.replace("Melee Attack", "近战攻击$3");
	text = text.replace("Melee Weapon", "近战武器$3");
	text = text.replace("Ranged Attack", "远程攻击$3");
	text = text.replace("Two-Handed", "双手武器$3");
	text = text.replace("Sling", "吊索$3");
	text = text.replace("Cleaver", "砍刀$3");
	text = text.replace("Dagger", "匕首$3");
	text = text.replace("Axe", "斧$3");
	text = text.replace("Staff", "法杖$3");
	text = text.replace("Sword", "剑$3");
	text = text.replace("Bow", "弓$3");
	text = text.replace("Spear", "矛$3");
	text = text.replace("Polearm", "长柄$3");
	text = text.replace("Flail", "链枷$3");
	text = text.replace("Banner", "战旗$3");
	text = text.replace("Staff", "法杖$3");
	text = text.replace("Crossbow", "弩$3");
	text = text.replace("Shield", "盾牌$3");
	text = text.replace("Unarmed", "徒手$3");
	text = text.replace("Mace", "棍$3");
	text = text.replace("Hammer", "锤$3");
	text = text.replace("Throwing Weapon", "投掷武器$3");
	text = text.replace("Crossbow or Firearm", "弩或火器$3");
	text = text.replace("Staff or Musical Instrument", "法杖或乐器$3");
	text = text.replace("Buckler, Parrying Dagger, or Tool", " 盾牌、防御匕首或工具$3");
	text = text.replace("One-Handed Melee or Throwing Weapon", " 单手近战武器或投掷武器$3");
	text = text.replace("Melee AOE Attack", " 近战范围攻击$3");
	text = text.replace("Non-Hybrid Dagger", " 非混合匕首$3");
	text = text.replace("Two-Handed Melee Weapon", " 双手近战武器$3");
	text = text.replace("Long Weapon", "长武器$3");
	text = text.replace("Melee or Throwing Weapon, or Unarmed", "近战、投掷武器或徒手$3");
*/
	return text;
}

var TranslateLoadingScreen = function(text)
{
	text = text.replace("As brothers we fight, as brothers we die!", "我们像兄弟一样战斗，同生共死！小满喜欢这样的队伍！");
	text = text.replace("Shields can be destroyed using axes and some two-handed weapons.", "可以用斧头和一些双手武器摧毁小满讨厌的盾牌。");
	text = text.replace("Different types of shields are better suited against melee or ranged attacks.", "小满知道不同类型的盾牌更适合近战或远程攻击。");
	text = text.replace("Shields take minor damage each time they are used to deflect an attack.", "盾牌每次用于偏转小满的攻击时都会受到轻微的损伤。");
	text = text.replace("Shrubbery can hide characters from being detected from afar.", "灌木林可以好好的隐藏小满，以防从远处被发现。");
	text = text.replace("A character with a height level advantage over their opponent is harder to hit.", "小满更难击中站的比自己高得多的角色。");
	text = text.replace("Characters can see farther, the higher they are positioned.", "小满知道：站得越高，看的越远。");
	text = text.replace("Having men of different backgrounds in your company may enable you to perform different actions in events.", "在你的队伍里有不同背景的人可能会让你能在事件中采取不同的行动，小满喜欢每个都尝试一遍！");
	text = text.replace("Surrounding an opponent from multiple sides makes it easier to score a hit.", "小满的小贴士：从多方面包围对手可以更容易地击中。");
	text = text.replace("Consider putting injured characters in reserve until their wounds have healed.", "考虑将受伤的角色放到预备队直到伤口愈合为止。小满受伤时应该立即这么做！");
	text = text.replace("Consider building up a reserve roster and rotating your men, so you can more easily deal with losses down the road.", "考虑建立一个预备队，轮换队员，这样你可以更容易地处理路上的损失。另一方面也可以让小满休息一下。");
	text = text.replace("Ranged weapon accuracy drops with distance.", "小满使用远程武器时，精度会随着距离下降。");
	text = text.replace("You don\'t have to be a hero, you\'re running a business.", "你不必成为英雄，你在维持生计。小满也觉得很有道理。");
	text = text.replace("Different backgrounds may unlock additional options at handling events and contracts.", "不同的背景可能会在处理事件和合同时解锁额外的选项。小满以前是做什么的呢？");
	text = text.replace("Drag and drop your men in the inventory screen to where you want them to be in your formation.", "在队列中，将你的人员拖放到你希望他们在你的队形中的位置。不过小满喜欢按自己的喜好站位。");
	text = text.replace("A missed ranged attack can hit nearby characters, especially if they are in the direct line of fire.", "偏斜的远程攻击可以击中附近的角色，特别是当他们在射击线中时。小满有时候也会利用这点。");
	text = text.replace("Bows can not be fired and crossbows not be reloaded while engaged in melee.", "小满在近战中不能发射弓，也不能重新装载弩。与敌人保持距离！");
	text = text.replace("Bows perform better against unarmored targets.", "小满的弓在对付无甲目标时表现更好。");
	text = text.replace("Daggers can be used to attack weak spots in armor and deal damage directly to hitpoints.", "小满的匕首可以用来攻击盔甲中的弱点，并直接对生命值造成伤害。");
	text = text.replace("Ranged weapons work best when firing into groups of enemies - they are bound to hit someone.", "远程武器在向敌群开火时效果最好，他们一定会击中某人。不过小满更喜欢精准命中的感觉。");
	text = text.replace("Consider forming a shieldwall when overwhelmed.", "当被压制时，考虑形成盾墙。小满提醒过你敌人跑过来的时候要注意防御。");
	text = text.replace("Consider forming a shieldwall when surrounded.", "当被包围时，考虑形成盾墙。小满可不能一下子面对成堆的敌人。");
	text = text.replace("Conserve your stamina when in prolonged engagements.", "在长时间的交战中要保持体力。小满的野外战斗准则。");
	text = text.replace("Success in Battle Brothers is also about picking the right fights.", "小满觉得胜利也在于选择正确的战斗。");
	text = text.replace("Undead are unaffected by fatigue and morale.", "亡灵不受疲劳和士气的影响。小满不喜欢亡灵");
	text = text.replace("Crossbows require less skill to fire accurately than bows, but are slower to use.", "弩比弓箭需要更少的技能来精确射击，但使用速度更慢。小满认为应该尽可能发挥每个人最大的价值。");
	text = text.replace("Each type of weapon has advantages and disadvantages.", "每种武器都有优缺点。小满也会灵活选择武器。");
	text = text.replace("Some difficult terrain, like swamp, gives combat penalties.", "一些困难的地形，如沼泽地，会给战斗带来惩罚。对于小满的敌人来说也一样。");
	text = text.replace("You can change camera height levels using the + and - keys.", "你可以使用 + 和 - 键更改相机高度级别。再近也找不到小满哦。");
	text = text.replace("Clubs and maces can stun or incapacitate targets.", "棍和棒可以击昏或使目标丧失能力。小满以前也被击昏过。");
	text = text.replace("Try to save some crowns for when things turn sour.", "当失利时，试着存留一些克朗。小满会努力避免这种情形的，");
	text = text.replace("Longswords and Greatswords can hit multiple targets with one strike.", "长剑和大剑可以一次击中多个目标。");
	text = text.replace("You can zoom in and out using the mouse wheel or Page Up and Page Down keys.", "你可以使用鼠标滚轮或上下翻页键进行放大和缩小。不过目前为止小满还没学会。");
	text = text.replace("Spears are good defensive weapons due to their Spearwall ability.", "长矛是很好的防御武器，因为它们的矛墙能力。阻止敌人一下子接近小满。");
	text = text.replace("Expect to lose some men.", "准备好失去一些人。小满害怕失去朋友。");
	text = text.replace("Losing is fun.", "失败是有趣的。不过小满之后会更加努力！");
	text = text.replace("The higher their level, the more your men will demand in wages.", "级别越高，你的人要求的工资就越多。小满懂得分享！");
	text = text.replace("Selling in rich and big cities will net you the most crowns for your goods.", "小满会在富裕的大城市销售以获得更多的克朗。");
	text = text.replace("Use trading to supplement your income.", "利用交易来补充你的收入。这就是为什么小满喜欢贸易。");
	text = text.replace("Learn the \'Rotation\' or \'Footwork\' perks for additional mobility in battle.", "学习“换位”或“步法”在战斗中增加额外的机动性。小满喜欢学习新技能！");
	text = text.replace("View range is decreased at night, both in combat and on the worldmap.", "无论是在战斗中还是在世界地图上，视野范围在夜间都会减小。就算小满是夜猫子也是如此。");
	text = text.replace("Skeletons are highly resistant to ranged attacks and fire.", "骷髅对远程攻击有很高的抵抗力。小满讨厌骷髅。");
	text = text.replace("Skeletons are highly resistant to ranged attacks.", "骷髅对远程攻击和火有很高的抵抗力。小满非常讨厌骷髅。");
	text = text.replace("Heavy armor offers great protection, but also slows down the wearer and makes him tire more quickly.", "重型盔甲提供了很好的保护，但也降低了佩戴者的速度，使他更容易疲劳。小满更喜欢轻装出行。");
	text = text.replace("Heavy helmets can be hard to breathe in and limit the field of vision.", "重型头盔很难呼吸，限制了视野。小满喜欢轻便的衣装，这样就能随时跑快快了。");
	text = text.replace("Warhammers and Military Picks can make short work of heavy armor.", "战锤和军用镐能迅速破坏重型盔甲。之后小满就能处理这些铁罐头了。");
	text = text.replace("The Billhook, Pike and Longaxe can attack over 2 tiles, unlike most other melee weapons.", "与大多数其他近战武器不同，钩镰枪、长枪和长斧可以攻击2格距离。不过小满的弓箭可不止这点射程。");
	text = text.replace("Flails ignore the defense bonus of shields.", "链枷忽视盾牌的防御加成。小满也在学着如何越过敌人的盾牌。");
	text = text.replace("Different types of enemies require different tactics to beat reliably.", "不同类型的敌人需要不同的战术来可靠的击败。所以小满需要时刻做笔记。");
	text = text.replace("Every enemy in the game can be beat reliably with the right approach.", "游戏中的每个敌人都可以用正确的方法可靠的击败。小满学无止境！");
	text = text.replace("A human is no match for an adult orc physically.", "人类在身体上无法与成年兽人匹敌。小满可不会用蛮力和兽人角力。");
	text = text.replace("Orcs rely on raw power and physical prowess.", "兽人依靠蛮力和体力。小满依靠脑子和 ，和什么来自？");
	text = text.replace("A goblin is no match for an adult human physically, so they rely on wit and dirty tricks.", "哥布林在身体上无法与成年人类相匹敌，所以他们靠的是机智和肮脏的把戏。不过他们可威胁不到小满！");
	text = text.replace("Orc Berserkers gain rage and get tougher to take down, the more blood they have drawn.", "兽人狂战士失去更多的血就会更愤怒，并且变得更难被击倒。小满会尝试在他们发疯前解决掉他们。");
	text = text.replace("Geists are lost between the physical world and the world beyond, constantly shifting between the two.", "幽灵在物质世界和超越世界之间消失了，在两者之间不断变化。小满难以理解。");
	text = text.replace("Geists test the resolve of your men - the lower, the more likely they are to panic and flee.", "幽灵考验你的人的决心－越低，他们越有可能恐慌和逃跑。小满害怕幽灵。");
	text = text.replace("Two-handed axes can hit both head and body with a single hit.", "双手斧可以一次击中头部和身体。小满觉得如果敌人躺着她也能做到。");
	text = text.replace("Two-handed axes can hit up to 6 targets with a single round swing.", "双手斧在一次旋转攻击中可以击中最多6个目标。小满的一支箭袋可以击中好多好多目标。");
	text = text.replace("Roads are the fastest way to travel over land, but not always the safest.", "道路是陆地上最快的旅行方式，但并不总是最安全的。小满会时刻留心周遭的环境。");
	text = text.replace("Forests can hide many dangers within.", "小满了解到在森林里可以躲避许多危险。");
	text = text.replace("Always keep a good stock of provisions - lest your men starve and desert you!", "一定要储备好粮食，以免你的人挨饿，抛弃你！小满会饿肚子，但不会抛弃你！");
	text = text.replace("Wiedergangers are the dead walking again.", "僵尸死亡后会再次复苏。小满不介意再次把他们打趴下。");
	text = text.replace("Difficult terrain, such as mountains and swamp, has your men use more supplies on the worldmap.", "困难的地形，如高山和沼泽，会让你的人在世界地图上使用更多的补给。小满觉得爬山很费体力。");
	text = text.replace("If you can not win, retreat to fight another day.", "如果你赢不了，那就撤退改日再打。小满可不会傻乎乎的上去送死。");
	text = text.replace("Try to reach the very edges of the map before retreating, or you\'ll risk your men sustaining serious injuries.", "在撤退前尽量到达地图的边缘，否则你会使你的人遭受严重的伤害。小满会掩护大家撤退的。");
	text = text.replace("Retreat. Flee. Don\'t fight every battle to the death.", "撤退。逃走。不要每场战斗都死中得活。小满希望每个人都能活下来。");
	text = text.replace("Use the spacebar key to pause on the worldmap.", "使用空格键在世界地图上暂停。小满不能动的时候可不能有什么非分之想。");
	text = text.replace("Elevated terrain like hills and mountains allow you to see farther on the worldmap.", "像小山和山脉这样高的地势，可以让你在世界地图上看得更远。小满喜欢山上往下看的风景。");
	text = text.replace("Not every contract is worth the risk.", "并非每一份合同都值得冒险。小满会衡量收益和风险。");
	text = text.replace("Try to negotiate better payment for your contracts.", "试着为你的合同协商更好的报酬。小满不擅长讨价还价。");
	text = text.replace("Try to negotiate payment modalities that guarantee you the most money for contracts.", "试着协商报酬形式，以保证你在合同中得到更多的钱。小满会学着讨价还价的。");
	text = text.replace("Not every battle can be won.", "不是每一场战斗都能胜利。小满会坦然接受失败！");
	text = text.replace("A life can be worth little in this world.", "在这个世界上，一个生命的价值可能微乎其微。小满不例外，但小满会尝试努力活着。");
	text = text.replace("Betraying your employer can have repercussions in the long run.", "从长远来看，背叛你的雇主可能会产生影响。小满可不喜欢两面三刀。");
	text = text.replace("Some parts of the world are more dangerous than others.", "世界上有些地方比其他地方更危险。小满觉得你能明白。");
	text = text.replace("Use ports to fast travel around the world.", "利用港口快速环游世界。小满把这个叫做传送门。");
	text = text.replace("Some people will use you and throw you away.", "有些人会在利用你之后把你抛弃掉。小满不会。");
	text = text.replace("Throwing weapons can be deadly on short distances, but their accuracy drops sharply the farther away the target.", "小满提到投掷武器在短距离内是致命的，但其精度在离目标越远的地方会急剧下降。");
	text = text.replace("Highly talented characters can come from all backgrounds.", "才华横溢的人可以来自各种背景。小满是不是也算得上天才呢？");
	text = text.replace("Try the Ironman mode to experience Battle Brothers the way it\'s meant to be played.", "尝试用铁人模式体验战场兄弟的游戏方式。小满可只会在加载界面出现哦");
	text = text.replace("Ranged weapons are less accurate at night - those of your enemies included.", "远程武器在夜间不太准确，包括你的敌人。不包括小满！可能也包括？");
	text = text.replace("Make camp to have your men heal and repair their equipment faster.", "扎营让你的人更快的恢复和修理他们的装备。小满倾向于全副武装再与敌人战斗！");
	text = text.replace("You can have your items repaired at the smith for a fee by using ALT + Right Click.", "使用ALT+鼠标右键单击可以让在铁匠处付费修理你的物品。不要一直让小满修你的破烂啊！");
	text = text.replace("Use ALT + Right Click to mark items for repair in your stash.", "使用ALT+鼠标右键单击以标记要在仓库中修理的物品。小满才不会理这些标记。");
	text = text.replace("Items equipped by your men are repaired automatically.", "你的人员装备的物品会自动修理。不然你以为是谁做的呢？快谢谢小满！");
	text = text.replace("Breaking a contract will anger your employer - especially if you\'ve received advance payment.", "违反合同会激怒你的雇主，尤其是如果你收到了预付款。小满一向诚 实 守 信。");
	text = text.replace("Fortifications will only offer you contracts from the noble house that owns them.", "城堡里只会提供给你来自拥有他们的贵族的合同。你问小满喜欢哪个家族？一个也不！");
	text = text.replace("Nobles give contracts only to mercenary companies with professional renown.", "贵族只向有专业声望的雇佣兵队伍提供合同。小满偶尔也会从这些所谓的贵族手里赚些外快。");
	text = text.replace("If contract negotiations turn sour, it will damage your relations with your potential employer.", "如果合同谈判失败，将损害你与潜在雇主的关系。又不是小满搞砸的看小满干嘛！");
	text = text.replace("You can find contract offers in the top left of settlement screens.", "你可以在结算屏幕的左上角找到合同报价。小提问：在哪里可以找到小满？");
	text = text.replace("You may find powerful named items far away from civilization by exploring or following tavern rumors.", "你可能会发现强大的命名物品通过远离文明探索或跟踪酒馆的流言。不过小满觉得他们大部分就只是流言。");
	text = text.replace("Dying is part of a mercenary\'s job description.", "死亡是雇佣兵工作简介的一部分。不过小满可不会把死亡写进履历里。");
	text = text.replace("Keep an eye on the mood of your men. If they are angry for too long, they may desert!", "注意你手下的情绪。如果他们生气太久，他们可能会离开！小满有时也会有小脾气的！");
	text = text.replace("If you keep losing to an enemy, change your tactics!", "如果你持续输给敌人，改变你的战术！不然小满会觉得你很笨。");
	text = text.replace("The larger a party on the worldmap, the slower it moves. Yours included.", "世界地图上的队伍越大，行动越慢。小满的队伍也是。");
	text = text.replace("Use wardogs to hunt down elusive or fleeing enemies.", "使用战犬来追捕难以捉摸或逃跑的敌人。小满还会给他们命名。");
	text = text.replace("Use a trained falcon to discover hidden enemies on difficult terrain.", "使用训练有素的猎鹰在困难的地形上发现隐藏的敌人。小满有时候也找不到他们。");
	text = text.replace("Use a trained falcon to discover hidden enemies in difficult terrain.", "使用训练有素的猎鹰在困难的地形中发现隐藏的敌人。小满有时候也找不到他们。");
	text = text.replace("Cleavers can inflict bleeding wounds.", "砍刀会造成伤口流血。");
	text = text.replace("Fulfilling ambitions will raise everyone\'s mood and grant you unique rewards.", "完成野心会提高每个人的情绪，并给予你独特的奖励。");
	text = text.replace("Fulfilling ambitions will raise everyone\'s mood and grant you renown, as well as some unique rewards.", "完成野心会提高每个人的情绪，并给予你声望，以及一些独特的奖励。");
	text = text.replace("Use CTRL + Left Click to attack allied parties on the worldmap. This only works if you are currently unemployed.", "使用CTRL+鼠标左键单击以攻击世界地图上的盟军。这只在你目前无业的情况下有效。");
	text = text.replace("Your men will interact with each other differently depending on their backgrounds and traits.", "你的人会根据他们的背景和特性不同进行相互交流。");
	text = text.replace("Stunned characters get no attack of opportunity when someone moves inside their zone of control.", "昏迷的角色不会借机攻击进入其控制区域的任何目标。");
	text = text.replace("Stunned characters get no attack of opportunity when moving inside their zone of control.", "昏迷的角色不会借机攻击进入其控制区域的目标。");
	text = text.replace("Try playing a campaign in veteran mode once you\'ve gained some experience - it\'s the recommended difficulty.", "一旦你获得了一些经验，试着在老兵模式下打一场战役，这是推荐的难度。");
	text = text.replace("The minimum hit chance for any attack is 5%, and the maximum hit chance for any attack is 95%.", "任意攻击的最低命中率为5%，任意攻击的最高命中率为95%。");
	text = text.replace("Characters may sometimes be struck down during combat, but not outright killed, and will survive with a permanent injury.", "角色有时会在战斗中被击倒，但不会被彻底击毙，并且会在受到永久损伤的情况下存活下来。");
	text = text.replace("Learn from your mistakes. Don\'t just repeat them and hope you\'ll get lucky this time.", "从错误中吸取教训。不要只是重复的希望自己下次会走运。");
	text = text.replace("The natural habitat of direwolves is the forest.", "冰原狼的自然栖息地是森林。");
	text = text.replace("You can enable faster AI turns in the options menu.", "你可以在选项菜单中启用更快的AI转换。");
	text = text.replace("Trees can be hidden in combat using the \'T\' key.", "在战斗中使用“T”键可以隐藏树木。");
	text = text.replace("Objects blocking tiles can be highlighted using the \'B\' key.", "可以使用“B”键可以突出显示阻挡格子的物体。");
	text = text.replace("Higher renown will unlock more difficult contracts and better pay.", "更高的声望将解锁更困难的合同和更好的报酬。");
	text = text.replace("If your plan can fail with bad luck, maybe it isn\'t good enough of a plan.", "如果你的计划会因为运气不好而失败，也许就是计划的不够好。");
	text = text.replace("The \'Lone Wolf\' perk is not affected by nearby dogs or allies that are not part of your company.", "“独狼”特技不会受到附近的狗或不属于你战队的盟友的影响。");
	text = text.replace("The \'Fast Adaptation\' perk reduces variance of randomness.", "“快速适应”特技减少了随机性的变化。");
	text = text.replace("Consider that enemy encampments on hills are harder to asssault, especially if they are fortified.", "需要考虑到敌人在山上的营地更难攻破，特别是如果他们有防御工事的话。");
	text = text.replace("The frozen wasteland of the north is home to a giant beast not seen anywhere else.", "北方冰冻的荒地里住着一头其他地方都看不到的巨兽。");
	text = text.replace("A Lindwurm is a wingless bipedal dragon resembling a large snake.", "林德虫是一种类似于大蛇的无翼双足龙。");
	text = text.replace("There are different regional variants of the Unhold.", "巨魔有不同的个体。");
	text = text.replace("Unholds can heal wounds quickly, even in combat.", "即使在战斗中，巨魔也能迅速愈合伤口。");
	text = text.replace("Trees move slowly.", "树移动缓慢。");
	text = text.replace("Alps feed on the fear and agony of people having nightmares.", "梦魇以人们做噩梦的恐惧和痛苦为食。");
	text = text.replace("Explore the world to find legendary locations with legendary treasure.", "探索世界，寻找具有传奇色彩的宝藏。");
	text = text.replace("Two-handed maces excel in disabling single opponents.", "双手棍棒擅长使单一对手丧失能力。");
	text = text.replace("Axes are particularly effective against trees.", "斧子对树特别有效。");
	text = text.replace("A Schrat is a living tree, a being of bark and wood, with a mind truly alien.", "树人是活生生的，一个树皮和木头的生物，有着真正的异域人的思想。");
	text = text.replace("Use armor attachments to further improve and specialize the equipment of your men.", "使用盔甲附件进一步提高和专门化你的部队装备。");
	text = text.replace("A Hexe appears as a youthful lady with radiant beauty to those she enthralls.", "在她迷住的那些人看来，女巫是一个容光焕发的年轻女子。");
	text = text.replace("Hexen are known to strike ill-omened deals that people come to regret.", "人们都知道和女巫做那些不祥的交易会后悔的。");
	text = text.replace("A Hexe can curse one of your men to suffer the same wounds as she does.", "女巫可以诅咒你的一个人，受到和她同样的伤害。");
	text = text.replace("Webknechts inflict additional damage to targets trapped in their webs.", "蜘蛛对被困在其网中的目标造成额外伤害。");
	text = text.replace("Webknechts are more confident, the larger the group they are in.", "蜘蛛所在的群体越大越自信。");
	text = text.replace("The Webknecht is a large arachnid that lives in sizable colonies in the dark areas of forests throughout the world.", "蜘蛛是一种大型的蛛形纲动物，以聚居方式生活在世界各地森林的黑暗地区中。");
	text = text.replace("Collect trophies from slain beasts and have the taxidermist craft useful items from them.", "从被杀死的动物身上收集战利品，并让剥制师从中提取有用的物品。");
	text = text.replace("Selling trophies from slain beasts can be lucrative. You can always get new ones.", "卖被杀野兽的战利品是有利可图的。你总是可以得到新的。");
	text = text.replace("Fencing swords are most powerful in the hands of characters with high initiative.", "刺剑在角色手中是最有力的，具有很高的主动性。");
	text = text.replace("Use throwing spears to destroy the shields of your most dangerous opponents from afar.", "使用投掷长矛从远处摧毁你最危险的对手的盾牌。");
	text = text.replace("Nachzehrers are found more often in the southern parts of the world.", "食尸鬼在世界南部更常见。");
	text = text.replace("Alps are mostly encountered at night.", "梦魇大多在夜间出现。");
	text = text.replace("Alps are almost exclusively encountered at night.", "梦魇几乎只会在夜间遇到。");
	text = text.replace("The further away from civilization, the more dangerous the beasts that roam the land.", "离文明越远，在这片土地上游荡的野兽就越危险。");
	text = text.replace("Potions, despite their colorful descriptions, are essentially drugs, and characters can get addicted to them.", "毒品，有多种颜色形态，本质上是药物，人们会对它上瘾。");
	text = text.replace("Overdosing on potions can lead to characters vomiting and getting sick.", "过量服用药剂会导致角色呕吐和生病。");
	text = text.replace("Alps can erase the boundary to the world of dreams, allowing living nightmares to manifest and haunt you.", "梦魇可以清除梦想世界的边界，让生活中的噩梦显现出来并萦绕在你的心头。");
	text = text.replace("When playing the \'Beast Slayers\' origin, you\'ll get more trophies from any beasts you slay.", "当你玩“野兽杀手”的起源时，你会从任何被杀的野兽那里得到更多的战利品。");
	text = text.replace("With the \'Beast Slayers\' origin you\'ll have an easier time tracking beasts and get more trophies from any of those you slay.", "当你玩“野兽杀手”的起源时，你就可以更容易的追踪野兽，并在杀死它们时获得更多的战利品。");

	text = text.replace("The north is inhabited by fierce barbarian tribes.", "北方居住着凶猛的野蛮部落。");
	text = text.replace("Barbarians often overwhelm their opponents at the start of battle, but quickly become fatigued.", "野蛮人往往在战斗开始时压倒对手，但很快就会变得疲乏。");
	text = text.replace("Northern warhounds are sturdier than southern wardogs, but not as quick and agile.", "北方的战猎犬比南方的战犬更强壮，但没有那么快和灵活。");
	text = text.replace("The rhythmic tribal beats of drummers reduce the fatigue of all barbarians on the field by a small amount each round.", "鼓手有节奏的部族节拍，每一轮都能减少所有野蛮人在战场上的疲劳。");
	text = text.replace("Beastmasters can not crack the whip to direct their beastly warmachines when adjacent to an enemy.", "当与敌人相邻时，兽王不能用鞭子来指挥他们的凶猛的机器。");
	text = text.replace("Barbarians look forward to meeting their ancestors in the afterlife.", "野蛮人期待着在来世见到他们的祖先。");
	text = text.replace("Try different origins to tailor your campaign to your play style.", "尝试不同的起源，以适应你的游戏风格。");
	text = text.replace("With the \'Lone Wolf\' origin you\'ll have a player character in the world. If you die, the campaign ends.", "使用“独狼”起源，你将拥有一个世界上的玩家角色。如果你死了，战役就结束了。");
	text = text.replace("With the \'Peasant Militia\' origin you can take up to 16 men into battle at once.", "使用“农民民兵”起源，你可以同时带上16个人参加战斗。");
	text = text.replace("With the \'Davkul Cultists\' origin your god will demand sacrifices from you, but also bestow boons upon those loyal to him.", "使用“达库尔异教徒”起源，你的神会要求你献祭，但也会给予那些忠于他的人恩惠。");
	text = text.replace("With the \'Band of Poachers\' origin you\'ll move faster on the worldmap.", "使用“偷猎者团队”起源，你将在世界地图上更快地前进。");
	text = text.replace("With the \'Trading Caravan\' origin you\'ll get better prices for both buying and selling.", "使用“贸易商队”起源，你将获得更好的买卖价格。");
	text = text.replace("Staff Slings inflict the \'Daze\' status effect on a hit to the head.", "投石器对头部的打击会产生“茫然”效果。");
	text = text.replace("With stones abundant everywhere, Staff Slings will never run out of ammunition.", "由于到处都是石头，投石杖永远不会用完弹药。");
	text = text.replace("Battle Whips can temporarily disarm opponents, preventing them from using weapon skills.", "战鞭可以暂时缴械对手，防止他们使用武器技能。");
	text = text.replace("Battle Whips can inflict bleeding wounds, but perform dismally against armor.", "战鞭可以造成流血的伤口，但在对抗盔甲时却很惨淡。");
	text = text.replace("Scimitars and Shamshirs are exotic weapons that inflict more and more severe injuries when hitting an opponent\'s head.", "弯刀和塞施尔弯刀是一种奇特的武器，当击中对手的头部时会造成越来越严重的损伤。");
	text = text.replace("Scimitars and Shamshirs are exotic weapons that are more likely to inflict debilitating injuries when hitting a target.", "弯刀和塞施尔弯刀是一种奇特的武器，在击中目标时更容易造成削弱损伤。");

	text = text.replace("Alps can enter your mind and have you hallucinate in the twilight between dreaming and being awake.", "梦魇能进入你的头脑，让你在梦境和清醒之间的黄昏中产生幻觉。");
	text = text.replace("Alps can give your men hallucinations to lead them the wrong way in battle.", "梦魇可以给你的士兵带来幻觉，让他们在战斗中走错方向。");
	text = text.replace("A Hexe can curse one of your men to suffer the same injuries she does.", "女巫可以诅咒你的一个人，受到和她同样的损伤。");
	text = text.replace("Consider zooming out when fighting Alps to get a better view of the situation and move around the map faster.", "在与梦魇作战时，考虑更佳的视野，以便更好地了解形势，更快地在地图上移动。");
	text = text.replace("Do the job. Survive. Get paid.", "工作。活着。赚钱。");
	text = text.replace("If a character waits their turn, their position in the turn order of the next round is determined with a penalty of 25% to Initiative.", "如果一个角色等待轮到他们，他们在下一轮轮到顺序中的位置将降低主动值的25%。");
	text = text.replace("A 95% chance to hit is also a 5% chance to miss.", "95%的命中率也是5%的失误率。");
	text = text.replace("Use throwing nets to restrict the movement of particularly dangerous enemies.", "使用投掷网来限制特别危险的敌人的移动。");

	text = text.replace("The southern city states have made unparalleled advancements in medicine, astrology and alchemy.", "南部城邦在医学、占星术和炼金术方面取得了无与伦比的进步。");
	text = text.replace("The southerners call themselves \'Gilded\' after their god, in whose shine they bask day in and out.", "南方人以他们的上帝的名字自称“镀金者”，他们每天都沐浴在上帝的光辉中。");
	text = text.replace("The \'indebted\' are a social caste of de-facto slaves in the city states.", "在城邦中，“负债者”实际上是一种社会阶层的奴隶。");
	text = text.replace("The southern city states are built on the ruins of the Ancient Empire.", "南部城邦建在古代帝国的废墟上。");
	text = text.replace("Nomads are a southern people that are not subject to the rule of a city state.", "游牧民族是不受城邦统治的南方民族。");
	text = text.replace("Nomads are experts in desert warfare and using the environment to their advantage - including throwing it in your face.", "游牧民族是沙漠战争和利用环境取得优势的专家－比如将沙扔在你的脸上。");
	text = text.replace("An Ifrit is a demonic entity possessing rocks, stone and shifting sands.", "伊夫利特是一个由岩石、石头和流沙构成的恶魔实体。");
	text = text.replace("A Qatal Dagger is best used in combination with other weapons that can stun or daze opponents.", "卡塔尔匕首最好与其他可以使对手昏迷或茫然的武器结合使用。");
	text = text.replace("The Handgonne takes a whole turn to reload - unless your character has the \'Crossbows & Firearms Mastery\' perk.", "除非你的角色有“弩与火器精通”的特技，否则手炮需要一回合才能重新装填。");
	text = text.replace("The Handgonne is a ranged weapon that can hit up to 6 targets with a single attack, but has less range than either bows or crossbows.", "手炮是一种远程武器，一次攻击最多可以击中6个目标，但射程却远低于弓箭或弩。");
	text = text.replace("The Fire Lance is reloaded after every battle just like throwing weapons are.", "每次战斗结束后，火矛都会重新装填弹药，就像投掷武器一样。");
	text = text.replace("Arena matches offer a quick way to earn coin - but you can\'t retreat during matches or loot afterwards.", "竞技场比赛提供了一个快速的方法来赚取硬币－但你不能在比赛中或取得战利品后撤退。");
	text = text.replace("Arena tournaments are special events with different rules.", "竞技场比赛是具有不同规则的特殊事件。");
	text = text.replace("Fight with five men over three consecutive rounds and win a famed item!", "连续三轮与五名男子战斗并赢得一个传奇物品！");
	text = text.replace("Every fifth arena match offers the chance to win a piece of gladiator equipment that can\'t be bought otherwise.", "每五场竞技场比赛都有机会赢得一件角斗士装备，这是用其他方式无法购买的。");
	text = text.replace("Fire Pots can be used not just to inflict damage on your opponents, but also to deny them access to tiles and delay them.", "火焰罐不仅可以用来对你的对手造成伤害，还可以用来阻止他们靠近格子并延迟他们的行动。");
	text = text.replace("Smoke Pots can be used for a safe retreat even if your men are already locked in melee.", "烟雾罐可以用来安全撤退，即使你的人已经处于近战的僵持中。");
	text = text.replace("Mortars of the city states can only fire if an engineer is next to them to operate them.", "城邦的臼炮只有在旁边有工程师操作时才能开火。");
	text = text.replace("With the \'Manhunters\' origin you can make prisoners after every battle against humans and force them to fight for you.", "使用“搜捕者”起源，你可以在每次与人类的战斗之后获得俘虏，迫使他们为你而战。");
	text = text.replace("With the \'Gladiators\' origin you start with three powerful characters, but losing all three will end your campaign.", "使用“角斗士”起源，你从三个强大的角色开始，但是失去这三个角色将结束你的战役。");
	text = text.replace("Hire non-combat followers for your retinue to customize your campaign to your playstyle.", "雇佣非战斗追随者为你的随从定制你的战役风格。");
	text = text.replace("Losing named shields to orcs?", "被兽人破坏了命名盾牌？");
	text = text.replace("Hire a blacksmith for your retinue and repair any item, even if its durability reaches zero.", "雇佣一个铁匠为你的随从修理任何物品，即使它的耐久度达到零。");
	text = text.replace("Training your new recruits takes too long?", "训练你的新兵需要太长时间？");
	text = text.replace("Hire a drill sergeant to have them gain experience faster.", "雇佣一个训练军士让他们更快地获得经验。");
	text = text.replace("Facing too few enemy champions?", "面对太少的冠军敌人？");
	text = text.replace("Hire a bounty hunter to find more and even earn a bounty for every one you kill.", "雇一个赏金猎人来寻找更多，甚至每杀一个就能获得赏金。");
	text = text.replace("Paying too much in wages?", "付太多工资？");
	text = text.replace("Hire a paymaster to reduce the wages you have to pay.", "雇一个出纳员来减少你必须支付的工资。");
	text = text.replace("Wonder who went there?", "不知道谁去了那里？");
	text = text.replace("Hire a Lookout and get more information on any footprints on the world map.", "雇一个观察员，在世界地图上寻找更多的足迹信息。");
	text = text.replace("Always out of ammo and tools?", "总是没有弹药和工具？");
	text = text.replace("Hire a scavenger to reclaim ammo you spent and gather tools from armor you destroyed.", "雇一个拾荒者来回收你用过的弹药，从你摧毁的盔甲上收集工具。");
	text = text.replace("Inventory full? Buy carts and wagons for your company in the Retinue screen.", "库存已满？在随从界面上为你的战队购买货车和载重货车。");
	text = text.replace("You unlock slots for your retinue of non-combat followers by gaining Renown.", "你可以通过获得声望来解锁你的非战斗追随者随从的位置。");
	text = text.replace("Ferocious hyenas roam the southern deserts, with strong jaws that can crush even metal armor und inflict bleeding wounds.", "凶猛的鬣狗在南部的沙漠中游荡，它们有强壮的下颚，甚至可以压碎金属盔甲，造成流血的伤口。");
	text = text.replace("Try out different retinue followers to find those that complement your playstyle and chosen company origin.", "尝试不同的随从，找到他们来补充你的游戏风格和选择的战队起源。");
	text = text.replace("With the \'Cultists\' origin your god will demand sacrifices from you, but also bestow boons upon those loyal to him.", "使用“异教徒”起源，你的神会要求你献祭，但也会给那些忠于他的人以恩惠。");
	text = text.replace("With stones abundant everywhere, Slings will never run out of ammunition.", "由于到处都是石头，投石器永远不会用完弹药。");
	text = text.replace("Scimitars and Shamshirs are more likely to inflict debilitating injuries when hitting a target.", "弯刀和塞施尔弯刀更容易在击中目标时造成削弱损伤。");
	text = text.replace("Use terrain and chokepoints to your advantage.", "利用地形和交通要道来创造你的优势。");

	return text;
}

var TranslateLoadCampaignMenuModule = function(text)
{
	text = text.replace("- Incompatible Version or DLC Missing -", "- 版本不兼容或缺少DLC -");

	text = text.replace(/Day (.*?) \((.*?)\/(.*?) (.*?)\)/, "第$1天 （$2\/$3 $4）");
	text = text.replace(/Day (.*?) \((.*?)\/(.*?)\)/, "第$1天 （$2\/$3）");
	text = text.replace("Beginner", "初学者");
	text = text.replace("Veteran", "老兵");
	text = text.replace("Normal", "老兵");
	text = text.replace("Expert", "专家");
	text = text.replace("Legendary", "传奇");
	text = text.replace("/Beginner", "/初学者");
	text = text.replace("/Veteran", "/老兵");
	text = text.replace("/Normal", "/老兵");
	text = text.replace("/Expert", "/专家");
	text = text.replace("/Legendary", "/传奇");
	text = text.replace("Ironman", "铁人模式");
	text = text.replace(/(.*?)\.(.*?)\.(.*?) (.*?):(.*?):(.*?)/, "$3年$2月$1日 $4时$5分$6秒");

	return text;
}

var TranslateNewCampaignMenuModule = function(text)
{
	
//起源介绍
//SS
	text = text.replace("Most sellswords were from the upper classes, third sons with little hope of marriage or a home. They were trained in arms, and given their first set of armor, but then sent out to earn their own way. The best became part of an established Lord's menie, the worst died, the in-betweens bounced from pillar to post with the occasional bout of outlawry or perils.", "大多数佣兵都来自上层社会，三儿子对婚姻和家庭几乎没有希望。他接受了武器训练，并获得了第一套盔甲，随后被派出去谋生。最好结果是成为了一个著名贵族的一员，最糟糕的就是死亡，期间在不同雇主间周旋，偶尔会有一场非法或危险的活动。");
	text = text.replace("Versatile and Circumspect:", "多才多艺：");
	text = text.replace("Everyone in your company begins with the selected skill.", "队伍中的每个人都从选定的技能开始。");
	text = text.replace("Mercenary:", "唯利是图：");
	text = text.replace("All your recruits will have 33% higher daily wages.", "所有新员工的日工资将提高33%。");
	text = text.replace("Life for Rent:", "人生如寄：");
	text = text.replace("If all of your three starting men should die, your campaign ends.", "如果你的三个先发队友都死了，你的战役就结束了。");
//魔法起源MOD
//Secret
	text = text.replace("How can you find this? You are not suppose to see this. Oh well! you earn this. Go ahead, try it!!!.", "你怎么能找到这个？你不应该看到这个。哦，好吧！这是你应得的。去吧，试试看!!!。");
	text = text.replace("Only You:", "只有你：");
	text = text.replace("Start with only one starter and the campaign will end if said starter dies.", "只有一个起始者，如果该起始者死亡，游戏将结束。");
	text = text.replace("Beast of Beasts:", "野兽之王：");
	text = text.replace("As you can see you are a fearsome Kraken with unstoppable power.", "正如你所见，你是一个可怕的克拉肯，拥有不可阻挡的力量。");
	text = text.replace("Stranger Thing:", "奇怪的事：");
	text = text.replace("Your food spoils at much slower rate, don\'t ask why.", "你的食物变质的速度要慢得多，不要问为什么。");
	text = text.replace("Kaiju Fight:", "怪兽之战：");
	text = text.replace("Have an epic battle with another Kraken at start, there is no turning back.", "与另一只克拉肯展开史诗般的战斗，没有回头路。");
	
//Hexe
	text = text.replace("A Hexe founds a mercenary company to secretly collect offerings for a ritual.", "一个女巫成立了一支雇佣队，秘密收集仪式上的祭品。(小分享：战队名取LUFT，可进入隐藏剧情)");
	text = text.replace("Witch:", "女巫：");
	text = text.replace("Start with a hexe and some simps.", "以女巫和一些傻瓜们开局。");
	text = text.replace("Gotta catch \'em all:", "要抓住所有人：");
	text = text.replace("Charm the enemy and add them to your roster.", "迷惑敌人并将其加入你的名册。");
	text = text.replace("Simps:", "傻瓜们：");
	text = text.replace("Those fell for your charm don\'t need money, they only need love.", "那些爱上你魅力的人不需要钱，他们只需要爱。");
	text = text.replace("The Price For Beauty:", "美丽的代价：");
	text = text.replace("Have to perform a weekly ritual or face the consequences.", "必须每周进行一次仪式，否则后果自负。");
	text = text.replace("If your Hexe dies, the campaign ends.", "如果你的女巫死了，战役就结束了。");
	
//Geomancer Trio
	text = text.replace("A trio of geomancers who are expert of controlling and commanding the earth.", "三位精通控制和操作大地的地卜师。");
	text = text.replace("Geomancer:", "地卜师：");
	text = text.replace("Start with three geomancers with each possesses incredible powers.", "从三位地卜师开始，每个风水师都拥有不可思议的力量。");
	text = text.replace("Pocket Sand:", "袋装沙子：");
	text = text.replace("All southern recruit can throw sand at enemy\'s face.", "所有南方新兵都能向敌人脸上扔沙子。");
	text = text.replace("Three Best Friends:", "三个最好的朋友：");
	text = text.replace("If all of your three starting geomancers should die, your campaign ends.", "如果你的三个开始的地卜师都死了，你的战役就结束了。");

//Mage Trio
	text = text.replace("A trio of mages begin their adventure to seek true wisdom.", "三位法师开始他们的冒险，寻求真正的智慧。");
	text = text.replace("It\'s magic:", "这是魔法：");
	text = text.replace("Start with three unique mages with each possesses extraordinary powers.", "从三个独特的法师开始，每个法师都拥有非凡的力量。");
	text = text.replace("Runestone:", "符文石：");
	text = text.replace("Start with a runestone, you can choose one of four types.", "开局从四种类型的符文石中选择一个开始。");
	text = text.replace("Mage Guild:", "法师公会：");
	text = text.replace("Mages cost less to hire and demand lower wage, and also automatically be tried out.", "法师雇佣成本更低，要求更低的工资，而且会自动试用。");
	text = text.replace("Mage recruits cost less to hire and demand lower wage.", "法师新兵雇佣成本更低，并且要求更低的工资。");

//老剑师
	text = text.replace("You are a legendary swordmaster, eager to pass on your skills to others!", "你是一位传奇剑师，渴望将你的技能传给他人！");
	text = text.replace("Read the text in the intro event for details on how this origin works!", "阅读介绍活动中的文字，了解有关此起源如何工作的详细信息！");
	text = text.replace("Upon leveling up, every recruit has a 50% chance to gain a free perk from the Sword perk group. Cannot have more than 10 recruits. Passing a total of 50 days without at least 2 other recruits will end the campaign.", "升级后，每个新兵都有50%的机会从剑术特技组获得免费特技。新兵不得超过10人。在没有至少两名新兵的情况下度过总共50天将结束战役。");
	text = text.replace("Upon leveling up, every recruit has a 50% chance to gain a free perk from the Sword perk group. Cannot have more than 10 recruits. Passing a total of 25 days without at least 2 other recruits will end the campaign.", "升级后，每个新兵都有50%的机会从剑术特技组获得免费特技。新兵不得超过10人。在没有至少两名新兵的情况下度过总共25天将结束战役。");
	text = text.replace("Swords Only:", "只有剑：");
	text = text.replace("Recruits gain special bonuses when using swords. If anyone uses any weapon except swords, banner or ranged weapons in combat it will anger your entire company.", "新兵在使用剑时获得特殊奖励。如果任何人在战斗中使用除剑、旗帜或远程武器以外的任何武器，都会激怒你的整个队伍。");
	text = text.replace("Reputation:", "声誉：");
	text = text.replace("Squires and Apprentices have a lower upkeep and hiring cost. Retired Soldiers and Swordmasters cannot be hired.", "扈从和学徒的维护和雇佣成本较低。退役士兵和剑士不能被雇佣。");
	text = text.replace("If your swordmaster dies, the campaign ends.", "如果你的剑师死了，战役就结束了。");
	text = text.replace("1111", "1111");
	

	
//传奇
//贸易商队
	text = text.replace("You are running a small trading caravan and have most of your crowns invested into trading goods. But the roads have become dangerous - brigands and greenskins lay in ambush, and there are rumors of even worse things out there.", "你正在经营一个小型的贸易商队，并且把你的大部分钱投资于贸易商品。 但是道路已经变得很危险——土匪和绿皮埋伏在那里，有谣言说那里的情况更糟糕。");
	text = text.replace("Get better prices for buying and selling.", "以更好的价格购买和销售。");
	text = text.replace("Trader:", "贸易商：");
	text = text.replace("Not a Warrior:", "不是战士：");
	text = text.replace("Start with no renown, and gain renown at half the normal rate. Every non-combat recruit gains the Pacifist perk.", "从没有声望开始，以正常速度的一半获得声望。 每个非战斗新兵都获得和平奖励。");
	text = text.replace("Bribery:", "贿赂：");
	text = text.replace("Pay off human enemies instead of fighting them. Combat backgrounds cost more to hire, peddlers and donkeys cost less.", "付钱给人类的敌人而不是与他们战斗。 雇佣战斗背景的人花费更多，小贩和驴子花费更少。");

//南方雇佣兵
	text = text.replace("You and your small band of mercenaries have done the dirty work of small-time merchants for years, yet you are barely a step above brigands. You want to be bigger than that. You want it all. And the Gilder will reveal the way to you.", "你和你那一小撮雇佣兵多年来一直在为小商人做肮脏的勾当，但你们离土匪只有一步之遥。 你想变得更强大。 你什么都想要。 吉尔德会为你指明方向。");
	text = text.replace("A quick start into the southern part of the world, without any particular advantages or disadvantages.", "快速进入世界南方，没有任何特别的优势或劣势。");


//逃跑的奴隶
	text = text.replace("You lead a group of slaves trying to escape their cruel fate, but you cannot run forever. Can you keep your band intact and start a new life as mercenaries?", "你带领一群奴隶试图逃离他们残酷的命运，但你不能永远逃跑。 你能保持你的战队完好无损，并作为雇佣兵开始一段新的生活吗？");
	text = text.replace("Escapees:", "逃生者：");
	text = text.replace("Start with five escaped Indebted and find others held in captivity.", "从五个逃脱的负债者开始，找到其他被囚禁的人。");
	text = text.replace("Brothers in Chains:", "锁链中的兄弟：");
	text = text.replace("Your newfound family of Indebted are stronger together and gain skill based on how many you field.", "你的奴隶同胞们在团结起来时会变得更加强大，并会根据战场上的友军数量获得技能。");
	text = text.replace("Downtrodden and Discarded:", "被压迫者们：");
	text = text.replace(/Good relations with any faction decay (.*?) faster and bad relations recover (.*?) slower\./, "与友好派系的关系衰退加快$1，与敌对派系的关系恢复减慢$2。");

//偷猎者团队
	text = text.replace("For years you have made a decent living by poaching in the local woods, evading your lord\'s men by being quick on your feet. But pickings have become slimmer and slimmer, and you are faced with a decision - how to make a living when all you know is how to use a bow?", "多年来，你一直靠在当地的树林里偷猎过着体面的生活，靠敏捷的步伐躲避你主人的追随者。 但是选择变得越来越少，你面临着一个决定——当你只知道如何使用弓箭的时候，如何谋生？");

//北方掠夺者
	text = text.replace("For all your adult life you have been raiding and pillaging in these lands. But with the local peasantry poor as mice, you may want to finally expand into the profitable field of mercenary work - that is, if your potential employers are willing to forgive your past transgressions.", "在你的成年生活中，你一直在这些土地上抢劫和掠夺。 但是，如果当地的农民穷得像老鼠一样，你可能最终想要扩大到雇佣兵工作的盈利领域，也就是说，如果你的潜在雇主愿意原谅你过去的违法行为。");
	text = text.replace("Warband:", "战团：");
	text = text.replace("Start with three experienced barbarians, and increased chance of finding", "从三个有经验的野蛮人开始，增加找到的机会");
	text = text.replace("bloodthirsty brutes, barbarians, killers and assassins", "嗜血的野蛮人，野蛮人，杀手和刺客");
	text = text.replace("Pillagers:", "抢劫者：");
	text = text.replace("You have a higher chance to get any items from slain enemies as loot.", "你有更高的几率从被杀死的敌人那里得到任何物品作为战利品。");
	text = text.replace("Outlaws:", "不法之徒：");
	text = text.replace(/Start with (.*?)perks for hunting civilians(.*?), bad relations to most human factions, only other outlaws are keen to work for you\./, "开局带有 $1猎杀平民$2 的特技，导致和大多数人类派系关系不好，只有其他歹徒愿意为你工作。");
//	text = text.replace("perks for hunting civilians", "猎杀平民的特技");
//	text = text.replace(", bad relations to most human factions, only other outlaws are keen to work for you.", "导致和大多数人类派系关系不好，只有其他歹徒愿意为你工作。");

//农民民兵
	text = text.replace("Peasant Army:", "\n农民战争：");
	text = text.replace("Start with a roster of 12 poorly equipped peasants.", "从12个装备不良的农民开始。");
	text = text.replace("Human Wave:", "人海战术");
	text = text.replace(/Take up to (.*?) men into battle at once, with no need to build renown\./, "率领最多$1人投入战斗。");
	text = text.replace("Dirty Peasants:", "肮脏农民：");
	text = text.replace("Can only hire lowborn peasants, lose reputation with nobles faster.", "只能雇用出身低微的农民。");
	text = text.replace("Reduced scaling:", "缩小比例：");
	text = text.replace("Each member of your company only counts for two thirds of a person in scaling.", "你公司的每个成员只占一个人的三分之二。");
	text = text.replace("Class warfare:", "阶级斗争：");
	text = text.replace("Each person you hire gains a hatred of nobles", "你雇佣的每个人都憎恨贵族");

//搜捕者
	text = text.replace("Indebted earn 10% more experience, are capped at level 7, and will die if struck down. However, they are 50% cheaper to buy in towns.", "负债者七级前获得经验增加10%，如果被击倒将直接死亡。在城镇购物便宜50%。");
	text = text.replace("Start with two manhunters and four indebted. Take up to 25 men into battle at once. Having equal or fewer indebted than non-indebted will make your men dissatisfied.", "从两名搜捕者和四名负债者开局。 一次带25个人上战场。 负债者的数量少于或等于非负债者角色的数量将使你的人不满意。");
	
//法师
	text = text.replace("You have always been different from those around you. By training your spirit, you discovered that you could concentrate the magic that normally only exists as a whisper in the background. Bring together those who would support you and make good use of your power.", "你总是和你周围的人不一样。 通过训练你的精神，你发现你可以集中意识，施放出通常只存在于传说和流言中的魔法。 把那些支持你的人聚集在一起，好好利用你的力量。");
	text = text.replace("Sage:", "智者：");
	text = text.replace("Educated people want to work for you, the uneducated fear you.", "受过教育的人想为你工作，未受过教育的粗人害怕你。");
	text = text.replace("Teacher", "教会：");
	text = text.replace(" Anyone you fight with gains the Student perk.", "雇佣的所有人学会 学生 特技。");
	text = text.replace("Avatar:", "化身：");
	text = text.replace("If your mage dies, the campaign ends.", "如果你的法师死了，战役就结束了。");

//独狼
	text = text.replace("You have been traveling for a long time, taking part in tourneys and sparring with young nobles. A hedge knight as tall as a tree, you never needed anybody for long. Is it true still?", "你已经旅行了很长时间，参加了巡回赛，并与年轻的贵族们打斗。像树一样高的雇佣骑士，你永远不需要任何人。还是真的吗？");
	text = text.replace("You have been traveling with your squire for a long time, taking part in tourneys and sparring with young nobles. A hedge knight as tall as a tree, you never needed anybody for long. Is it true still?", "你和你的扈从旅行了很长时间，参加了巡回赛，和年轻的贵族们打斗。像树一样高的雇佣骑士，你永远不需要任何人。这仍然是真的吗？");
	text = text.replace("Lone Wolf:", "独狼：");
	text = text.replace("Start with a single experienced hedge knight and great equipment but low funds. All encounters are two-thirds harder than normal.", "从一个经验丰富的雇佣骑士和精良的装备，但低初始资金开始。所有遭遇都比正常情况困难三分之二。");
	text = text.replace("Start with a single experienced hedge knight and great equipment but low funds.", "从一个经验丰富的雇佣骑士和精良的装备，但低初始资金开始。");
	text = text.replace("Elite Few:", "少数精英：");
	text = text.replace("Can never have more than 12 fighters in your roster.", "你的名册上不能超过12个人。");
	text = text.replace("Can never have more than 16 fighters in your roster.", "你的名册上不能超过16个人。");
	text = text.replace("Avatar:", "化身：");
	text = text.replace("If your lone wolf dies, the campaign ends.", "如果你的雇佣骑士死了，战役就结束了。");
	text = text.replace("If your hedge knight dies, the campaign ends. Start with an enthusiastic squire.", "如果你的雇佣骑士死了，战役就结束了。");
	text = text.replace("The Best:", "最好的：");
	text = text.replace("Hunt other swordsmen to become the best in the lands.", "猎取其他剑客，成为国内最好的剑客。化身角色获得偏好敌人-剑士特技。");
	text = text.replace("Not a sellsword:", "不是雇佣兵");
	text = text.replace("Cannot recruit. Must instead encounter other champions through events to join your cause.", "无法招募新人。只能通过事件遇到其他勇士加入你的事业。");
	text = text.replace("Cannot recruit. Must instead encounter other champions and allies through events to join your cause.", "无法招募新人。只能通过事件遇到其他勇士加入你的事业。");
//剧团
	text = text.replace("The life of an artist is not an easy one, misunderstood and under appreciated. Perhaps performers will have more luck together, find and audience, travel the world, or at least stop having things thrown at you. ", "一个艺术家的生活并不轻松，误解和轻视无处不在。 也许表演者们应该聚集起来，发现观众，环游世界，或者至少别再让别人把垃圾扔在你身上。");
	text = text.replace("The life of an artist is not an easy one, misunderstood and under appreciated. Perhaps performers will have more luck together, find an audience, travel the world, or at least stop having things thrown at you. ", "一个艺术家的生活并不轻松，误解和轻视无处不在。 也许表演者们应该聚集起来，发现观众，环游世界，或者至少别再让别人把垃圾扔在你身上。");
	text = text.replace("Acrobatics:", "杂技：");
	text = text.replace("Anyone you hire gains the Leap ability", "任何你雇佣的人都会获得 跳跃 能力");
	text = text.replace("Exposure:", "曝光：");
	text = text.replace("You will encounter more performers, and they will be cheaper to hire.", "你会遇到更多的表演者，而且雇佣他们会更便宜。");
	text = text.replace("Busking:", "街头表演：");
	text = text.replace("You gain 10 crowns each day for each member of the troupe. Tavern rumors and drinks are cheaper.", "你剧团里的每个成员都会使你每天获得10克朗。");

//姐妹情谊
	text = text.replace("Born into a world dominated by kings and bishops, you have studied the old ways of the wise women. Now you lead a band of powerful women shaping their own destinies. ", "你出生在一个由国王和主教主宰的世界，你研究过智慧女人的古老方式。 现在你领导着一群有权势的女人，塑造着她们自己的命运。 ");
	text = text.replace("Sisterhood:", "姐妹情谊：");
	text = text.replace("You can only hire women and each gains the Hold Out perk.", "你只能雇佣女性，而且每个女性都能得到 坚持不懈 的特技。");
	text = text.replace("Threads of fate:", "命运之线：");
	text = text.replace("Your chants and trances alter the minds of your allies and enemies.", "吟唱和音乐可以改变盟友和敌人的思想。");
	text = text.replace("Rune stones:", "符文石：");
	text = text.replace("You can craft powerful items imbued with ancient runes.", "可以用古代符文石制作强大的物品。");
	text = text.replace("Avatar:", "化身：");
	text = text.replace("If you die, it is game over", "如果你死了，游戏就结束了");

//先知
	text = text.replace("After studying alchemy and mystic secrets for years, you have set out to confront the evils of the world", "经过多年的炼金术和神秘的秘密研究，你已经开始面对邪恶的世界");
	text = text.replace("Bookworm:", "书虫：");
	text = text.replace("Educated people want to work for you, the uneducated find you boring to be around.", "受过教育的人想为你工作，没受过教育的人觉得和你在一起很无聊。");
	text = text.replace("If your seer dies, the campaign ends.", "如果你的先知死了，活动就结束了。");

//简单乞丐挑战
	text = text.replace("A lowly unskilled beggar, you witnessed something in an alley and now a noble house wants you dead. This is a challenge run with a very weak starting character. Can you awaken the true power of your avatar? ", "身为一个卑微的乞丐，你在小巷里目睹了一些事情，现在一个贵族家庭想要你的命。 这是一个非常弱的开始性质的挑战运行。 你能唤醒你的化身的真正力量吗？");
	text = text.replace("Knows Too Much:", "知道得太多：");
	text = text.replace("All noble houses hate you.", "所有贵族都恨你。");
	text = text.replace("Learning in battles", "学以致用");
	text = text.replace("The beggar can gain stats and perks by defeating enemies.", "可以通过击败敌人获得属性和额外特技。");
	text = text.replace("Begin alone Avatar", "孤独化身");
	text = text.replace("If the beggar dies, the campaign ends.", "如果乞丐死了，战役就结束了。");
	text = text.replace("Dirty Peasant", "肮脏的农民");
	text = text.replace("You can only hire lowerborn backgrounds.", "你只能雇用低贱出身背景的角色。");

//死亡军团[测试]
	text = text.replace("An ancient legion risen from the dead to reclaim the world.", "一个古老的军团从死亡中复活来重新夺回世界。");
	text = text.replace("Dreaded:", "令人畏惧：");
	text = text.replace("All towns will begin hostile to you.", "所有的城镇都会开始对你怀有敌意。");
	text = text.replace("Beyond death:", "超越死亡：");
	text = text.replace(/Every character in your party has a (.*?) chance to survive death/, "你队伍中的每个角色都有$1 的机会在死亡中幸存");
	text = text.replace("Dead walking:", "行尸走肉：");
	text = text.replace("You cannot hire in towns, but you may find recruits by patrolling near mass graves and sunken castles.", "你不能在城镇里雇佣新兵，但是你可以在万人坑和沉没的城堡附近巡逻来招募新兵。");

//巡林者
	text = text.replace("Originally hailing from far afield, the rangers are sworn to protect their ancestral woodlands. Increasing intrusions have led the rangers to these lands. ", "巡林者们来自遥远的地方，他们发誓要保护他们祖传的林地。 越来越多的入侵导致巡林者们来到这些土地。");
	text = text.replace("Outdoorsmen:", "户外人士：");
	text = text.replace("Not everyone is cut out for the Rangers, some love nature and are eager to join, others will need more coin to convince. Outdoor recruits gain Pathfinder.", "不是每个人都适合巡林者，有些人热爱大自然，渴望加入，有些人则需要更多的金钱来说服。 所有新兵都会获得探路者 踏青 特技。");
	text = text.replace("Expert Scouts:", "专家侦察：");
	text = text.replace("You move faster on the campaign map and can always get a scouting report for any enemies near you.", "你在世界地图上移动更快，并且总能获得附近敌人的侦查报告。");
	text = text.replace("Guardians:", "守护者");
	text = text.replace("If your ranger and druid die, its game over.", "如果你的巡林者死了，游戏就结束了。");

//冒险队
	text = text.replace("After an unlikely meeting in a tavern, an unlikely group of strangers has formed an adventuring party. They have set out in search of both dragons and dungeons.", "在一个不太可能的小酒馆相遇后，一群不太可能的陌生人组成了一个冒险队。 他们已经出发去寻找龙和地下城。", "在一个不太可能的小酒馆相遇后，一群不太可能的陌生人组成了一个冒险队。 他们已经出发去寻找龙和地下城。");
	text = text.replace("A party of six overpowered adventurers, each with their own skills.", "由六个强大的冒险者组成的战队，每个人都有独特的技能。");

//贵族
	text = text.replace("From a noble family, you were born to rule. With your trusted company at your side, it is time to conquer the world, as is your birthright.", "你出身贵族，天生就是统治者。 有你信任的战团在你身边，是时候征服世界了，这是你与生俱来的权利。");
	text = text.replace("Usurper:", "篡位者：");
	text = text.replace("Start as a noble, with your retainers.", "作为贵族开始游戏，带着你的随从。");
	text = text.replace("Highborn:", "出身名门：");
	text = text.replace(/Nobles will cost (.*?) less, lowborns will cost (.*?) more, can\'t hire outlaws/, "贵族成员的雇佣费减少$1，低贱背景的雇佣费增加$2，不能雇佣罪犯背景。");
	text = text.replace("Trained leader:", "训练有素的领导者：");
	text = text.replace("Your studies at the academy gave tactical and campaign skills, everyone begins with Rotation.", "你在学院的学习提供了战术和战略指挥的技能，你招募的每个角色都拥有换位技能。");
	text = text.replace("if your character dies, it is game over.", "如果你的角色死了，游戏结束。");

//秘教
	text = text.replace("Death is no barrier, others flee from its yawning abyss, but we embrace the other side.", "死亡不是障碍，其他人逃离它的深渊，但我们拥抱另一边。");
	text = text.replace("Dark arts:", "黑魔法：");
	text = text.replace("Start with three apprentice necromancers - all focusing on differant cornerstones of necromancy.", "从三名学徒巫师开始——他们都专注于巫术的不同派别。");
	text = text.replace("Start with three apprentice necromancers.", "从三名学徒巫师开始。");
	text = text.replace("Gruesome harvest:", "可怕的收获：");
	text = text.replace("Collect human corpses to fashion new minions, maintain them with medical supplies.", "收集人类尸体来打造新的仆从，并为他们提供医疗用品。");
	text = text.replace("Blood magic:", "血魔法：");
	text = text.replace("Cultists and other macabre backgrounds will flock to join you and cost 25% less to maintain. Cannot hire pious backgrounds. Everyone else costs 50% more to upkeep", "邪教和其他恐怖背景的人会蜂拥而至加入你的行列，成本会降低25%。不能雇佣虔诚的背景。其他所有人的费用都要高出50%");
	text = text.replace("Cultists and other macabre backgrounds will flock to join you and cost 25% less to maintain. Including the undead. Cannot hire pious backgrounds. Everyone else costs 50% more to upkeep", "邪教和其他恐怖背景的人会蜂拥而至加入你的行列，维护成本会降低25%。包括亡灵。不能雇佣虔诚的背景。其他所有人的保养费用都要高出50%");
	text = text.replace("If all three necromancers die, the spell is broken and the story ends.", "如果三个亡灵巫师都死了，咒语就会被打破，故事也就结束了。");
	text = text.replace("Avatars:", "化身：");
	
//宗教审判
	text = text.replace("There is a great evil in the world, the undead walk the earth and cultists hide in every town. The holy must purge the filth.", "一片巨大的邪恶阴影笼罩着世界，行尸走肉行走地上，邪恶的异教信徒潜藏在每一处村落城镇中。 唯有神圣可净污秽。");
	text = text.replace("Righteous Cause:", "崇高事业：");
	text = text.replace("Cannot recruit outlaw backgrounds; however, the pious will flock to join your cause.", "不能招募非法的背景，虔诚的人会蜂拥加入你的事业。");
	text = text.replace("Penitence:", "忏悔：");
	text = text.replace("Anyone you hire gains the Mind over Body perk.", "你雇佣的所有人都会获得 精神御体 特技。");

//商会马帮
	text = text.replace("You are running a small trading caravan and have most of your crowns invested into trading goods. But the roads have become dangerous - brigands and greenskins lay in ambush, and there are rumors of even worse things out there.", "你正在经营一个小型的贸易商队，并且把你的大部分钱投资于贸易商品。 但是道路已经变得很危险——土匪和绿皮埋伏在那里，有谣言说那里的情况更糟糕。");
	text = text.replace("Caravan:", "商队：");
	text = text.replace("Start with a trader and a donkey.", "从一个商人和一头驴子开始。");
//	text = text.replace("Trader:", "贸易商：");
	text = text.replace("Get 10% better prices for buying and selling.", "买和卖的时候可以得到10%更好的价格。");
//	text = text.replace("Not a Warrior:", "不是战士：");
	text = text.replace("Start with no renown, every non-combat recruit gains the Peaceful perk. Professional soldiers will cost 25% more and be less eager to stick around if things get tough.", "从没有声望开始，每一个非战斗新兵都会获得‘和平’特技。如果情况变得艰难，职业士兵的费用将增加25%，而不太愿意留下来。");
	text = text.replace("Start with no renown, and gain renown at half the normal rate.", "从没有声望开始，获得声望的速度减半。");
//	text = text.replace("Bribery:", "贿赂：");
	text = text.replace("Pay off human enemies instead of fighting them. Peddlers cost 25% less.", "付钱给人类的敌人而不是与他们战斗，小贩的成本降低了25%。");
	text = text.replace("Pay off human enemies instead of fighting them", "付钱给人类的敌人而不是与他们战斗");

//德鲁伊[遗留]
	text = text.replace("The druids of the wild woods are wary of humans, prefering the company of beasts", "野生森林的德鲁伊对人类很警惕，更喜欢与野兽为伍");
	text = text.replace("Wildform:", "野化变身");
	text = text.replace("Can take on the form of beasts in battle.", "可以在战斗中以野兽的形式出现。");
	text = text.replace("Solitary:", "孤僻");
	text = text.replace("The Druid hates nearly all humans except wildlings, herbalists and practictioners of wild magic", "德鲁伊憎恨几乎所有人类，除了野人，草药师和狂野魔法的探求者");
	text = text.replace("If your druid dies, its game over.", "如果你的德鲁伊阵亡，游戏就结束了。");

//(开发者调试)
	text = text.replace("(Developer Debug)", "(开发者调试)");
	text = text.replace("Debug mode for legends developers", "传奇开发者的调试模式");
	
//自创战团
	text = text.replace("Build and customize your company roster (Your very own pick and choose adventure!)", "构筑并自定义你自己的战团名册（由你自己选择的冒险！）");

//十字军
	text = text.replace("Sent on a holy quest to rid the world of undead, you walk a righteous path.", "你被派遣去执行肃清世上不死亡灵的神圣任务，你的目标崇高而正义。 ");
	text = text.replace("Pure of Heart:", "纯洁的心：");
	text = text.replace("You cannot recruit outlaw backgrounds, while pious recruits and squires cost less.", "你不能招募有非法背景的人，而虔诚的新兵和扈从花费更少。");
	text = text.replace("Strict Sermons:", "严格布道：");
	text = text.replace("You will grant the Fortified Mind perk to any pious background that joins you. Find pilgrims to aid you on your journey.", "给予任何加入你的虔诚背景的人 强化思想 的特技。寻找朝圣者来帮助你的旅程。");
	text = text.replace("You will grant the Fortified Mind perk to any pious background that joins you. Find Pilgrims to aid you on your journey.", "给予任何加入你的虔诚背景的人 强化思想 的特技。寻找朝圣者来帮助你的旅程。");
	text = text.replace("If your crusader dies, the campaign ends.", "如果你的十字军战士死了，战役就结束了。");

//狂战士
	text = text.replace("You are a barbarian berserker, driven by an unbound rage. Watching your family be slaughtered drove you into a self-destructive frenzy of violence and revenge.", "你是一个野蛮的狂战士，被无穷无尽的愤怒所驱使。 眼睁睁地看着你的家人被屠杀，让你陷入自我毁灭的暴力和复仇的狂乱之中。");
	text = text.replace("Berserker Madness:", "狂战血怒：");
	text = text.replace("Unlock powerful abilities that allow you to fight naked and bare-handed.", "解锁允许你赤身裸体且光手空拳地进行战斗的强大技能。");
	text = text.replace("Infectious Rage:", "流布怒火");
	text = text.replace("Only the insane, violent or desperate will join you. You will grant the Berserk perk to anyone who joins you in battle. You have a tiny chance of finding other berserkers for hire.", "只有疯子、暴力分子和绝望的人才会加入你们。 你雇佣的所有角色都会获得“狂暴”技能。 你有一个微小的机会找到其他狂战士雇佣。");
	text = text.replace("Begin alone. If you die, it is game over.", "独自开始。 如果你死了，游戏就结束了。");

//乞丐的挑战
	text = text.replace("A lowly unskilled beggar, you witnessed something in an alley and now a noble house wants you dead. This is a challenge run with a very weak starting character.", "身为一个卑微的乞丐，你在小巷里目睹了一些事情，现在一个贵族家庭想要你的命。 这是一个非常弱的开始性质的挑战运行。 你能唤醒你的化身的真正力量吗？ ");

//刺客
	text = text.replace("A quick, efficient and ruthless assassin. You strike from the shadows and collect the rewards.", "一个快速、高效、无情的杀手。 你从阴影中出击并获得回报。");
	text = text.replace("Dirty Deeds:", "卑劣行径：");
	text = text.replace("You will grant the Backstabber perk to anyone who joins you in battle. ", "你将授予任何加入你战斗的人 伪装 特技。");
	text = text.replace("Underworld:", "地下世界：");
	text = text.replace("You have a small chance of finding other Assassins for hire.", "你有很小的几率找到其他刺客雇佣。");
	text = text.replace("Begin alone.", "独自开始。");
	
//随机单人
	text = text.replace("Striking out on your own, who knows what the world has in store?", "独自奋斗，谁知道这个世界将会发生什么？");
	text = text.replace("Random Backgrounds:", "随机背景：");
	text = text.replace("Your background will be different each time you start.", "每次你开始的时候，你的背景都会不同。");
	text = text.replace("Random Equipment:", "随机装备：");
	text = text.replace("The equipment you begin with is different each time.", "你开始使用的装备每次都不同。");
	text = text.replace("If you die, it is game over.", "如果你死了，游戏就结束了。");
	
//随机团队
	text = text.replace("A wild new adventure each time, 1-6 party members randomly chosen from all backgrounds.", "每一次，都会从各种背景中随机挑选1-6名队友。");
	text = text.replace("Random perks:", "随机特技");
	text = text.replace("The abilities of your mercenaries will be different each time.", "你的雇佣兵的能力每次都会有所不同。");
	text = text.replace("Random supplies:", "随机供应");
	text = text.replace("Random equipment:", "随机装备：");
	text = text.replace("Randomly get 3 times less to 3 times more money, tools, meds and ammo.", "随机获得3倍左右的金钱，工具，药物和弹药。");
	text = text.replace("The backgrounds are different each time you start.", "每次开始时，背景都不一样。");

//随机三人
	text = text.replace("Having fled a raid, three fellows decide to forge out a new path.", "逃离了一次袭击，三个家伙决定开辟一条新路。");
	
//角斗士
	text = text.replace("You can never have more than 16 fighters in your roster, and if all of your three starting men should die, your campaign ends.", "你的名单上最多只能有16名战士，如果你的三名先发队员都死了，你的战役就结束了。");

//新战队
	text = text.replace("Start with three deserters and decent armor, but lower funds, you can only be joined by outlaws or combat backgrounds, and a noble house that wants to hunt you down.", "开局从三个逃兵和一些的盔甲开始，但资金较低，你只能加入不法分子或战斗背景，一个贵族家族在追捕你。");
	text = text.replace("Like Minded:", "志趣相投");
	text = text.replace("Increased chance of finding craven dastards, deserters and the disowned.", "增加了找到懦夫、逃兵和无主者的机会。");

//达库尔异教徒
	text = text.replace("Davkul awaits. You lead a small flock devoted to the elder god, and it is time to spread the word. Find more followers, acquire riches, and please Davkul with sacrifices.", "达库尔即将降临。你领导着一小群献身于长老神的人，现在是宣传的时候了。寻找更多的追随者，获取财富，并以献祭取悦达库尔。");
	text = text.replace("Cultists:", "邪教分子：");
	text = text.replace("Start with a group of five cultists. Encounter fanatical special cultists in towns.", "先从五个信徒开始。在城镇里遇到狂热的特殊信徒。");
	text = text.replace("Sacrifices:", "献祭：");
	text = text.replace("Davkul will occasionally demand sacrifices from you, but also bestow boons upon those loyal to him. Davkul will not sacrifice his chosen elite. Cultists cost 25% less to buy and maintain.", "达库尔偶尔会要求你做出牺牲，但也会对那些忠于他的人施以恩惠。达库尔不会牺牲他选择的精英。邪教者购买和维护的成本降低25%。");
	text = text.replace("Let the Blood Flow:", "让血液流动起来：");
	text = text.replace("All cultists gain whip skills and favour fighting nobles and caravans.", "邪教事件发生的次数增加了一倍，邪教获得了鞭策技能。");

//野兽杀手
	text = text.replace("You and your kind make your living by hunting down the many beasts that beset villages on the fringes of civilization. It is dangerous work, but it pays well enough and there is always a bigger beast to slay and more crowns to earn.", "你和你的同类靠猎杀围绕在文明边缘村庄的许多野兽为生。 这是一项危险的工作，但报酬丰厚，而且总有更大的野兽需要宰杀，还有更多的克朗需要挣。");
	text = text.replace("Most people do not trust your kind, so you get 10% worse prices.", "大多数人不相信你的同类，所以你得到了10%更糟糕的价格。");
	text = text.replace("Most people do not trust your kind, get 20% worse prices.", "大多数人不相信你的同类，所以你得到了20%更糟糕的价格。");
	text = text.replace("Start with three beast slayers and decent equipment, as well as some beast trophies. Beast Slayers gain a unique trait when fighting beasts.", "从三个野兽杀手和体面的装备，以及一些野兽战利品开始。野兽杀手在与野兽战斗时获得一个独特的特性。");

	
	
//原版
//野兽杀手：
	text = text.replace("You and your men make your living by hunting down the many beasts that beset villages on the fringes of civilization.", "你和你的人靠猎杀在文明边缘威胁村庄的许多野兽为生。");
	text = text.replace("It\'s dangerous work, but it pays well enough, and there\'s always a bigger beast to slay and more crowns to earn.", "这是一项危险的工作，但报酬足够高，而且总是有一头更大的野兽需要杀戮，还能挣得更多的克朗。");
	text = text.replace("Beast Slayers:", "野兽杀手：");
	text = text.replace("Start with three beast slayers and decent equipment, as well as some beast trophies.", "从三个野兽杀手和体面的装备，以及一些野兽战利品开始。");
	text = text.replace("Expert Trackers:", "专家追踪者：");
	text = text.replace("See tracks from further away.", "能看到更远处的足迹。");
	text = text.replace("Expert Skinners:", "专家剥皮师：");
	text = text.replace("Each beast you slay has a 25% chance to drop an additional trophy.", "你杀死的每一头野兽有25%的几率掉落额外的战利品。");
	text = text.replace("Each beast you slay has a 50% chance to drop an additional trophy.", "你杀死的每一头野兽有50%的几率掉落额外的战利品。");
	text = text.replace("Prejudice:", "偏见：");
	text = text.replace("Most people don\'t trust your kind, so you get 10% worse prices.", "大多数人不相信你这类人，所以你的价格会下降10%。");
//达库尔
	text = text.replace("Davkul awaits.", "达库尔即将降临。");
	text = text.replace("You lead a small flock devoted to the elder god, and it\'s time to spread the word.", "你带领一小群人献身于古老神明，现在是时候传道了。");
	text = text.replace("Find more followers, acquire riches, and please Davkul with sacrifices.", "寻找更多的追随者，获取财富，并以献祭取悦达库尔。");
	text = text.replace("Cultists:", "异教徒：");
	text = text.replace("Start with a group of four cultists with poor equipment.", "从四个装备差的异教徒开始。");
	text = text.replace("More cultists may flock to you for free.", "更多的异教徒可能会免费聚集到你身边。");
	text = text.replace("Sacrifices:", "献祭：");
	text = text.replace("Davkul will occasionally demand sacrifices from you, but also bestow boons upon those loyal to him.", "达库尔有时会要求你献祭，但也会对那些忠于他的人给予恩惠。");
//逃兵：
	text = text.replace("For too long have you been dragged from one bloody battle to another at the whim of lords sitting in high towers.", "你被坐在高塔上的贵族们的一时冲动从一场血战拖到另一场血战已经太久了。");
	text = text.replace("Last night, you absconded from camp together with three others.", "昨晚，你和另外三个人一起从营地逃走了。");
	text = text.replace("You\'re dressed like soldiers still, but you\'re deserters, and the noose will be your end if you stay here for too long.", "你仍然穿得像士兵，但你是逃兵，如果你在这里呆得太久，套索将是你的归宿。");
	text = text.replace("Deserters:", "逃兵：");
	text = text.replace("Start with three deserters and decent armor, but lower funds and a noble house that wants to hunt you down.", "从三个逃兵和体面的盔甲开始，但资金更少和一个贵族家族想追捕你。");
	text = text.replace("First to Run:", "先跑：");
	text = text.replace("Your men always are first to act in the very first round of combat.", "在第一轮战斗中，你们的人总是第一个行动的。");

	text = text.replace("After years of bloodying your sword for meager pay, you\'ve saved enough crowns to start your very own mercenary company.", "多年来，你以微薄的报酬做着刀口舔血的工作，现在终于攒下来足够的克朗去组建一支你自己的雇佣兵战队了。");
	text = text.replace("With you are three experienced mercenaries with whom you\'ve fought side by side in the shieldwall before.", "与你在一起的是三个经验丰富的雇佣兵，你以前曾与他们并肩战斗过。");
	text = text.replace("A quick start into the world, without any particular advantages or disadvantages.", "快速进入世界，没有任何特殊的优点或缺点。");
//独狼
	text = text.replace("You\'ve been traveling alone for a long time, taking part in tourneys and sparring with young nobles.", "你已经独自旅行很长时间了，参加巡回赛，和年轻的贵族们打架。");
	text = text.replace("A hedge knight tall as a tree, you never needed anybody for long.", "像树一样高的雇佣骑士，你永远不需要任何人。");
	text = text.replace("Is it true still?", "还是真的吗？");
	text = text.replace("Lone Wolf:", "独狼：");
	text = text.replace("Start with a single experienced hedge knight and great equipment, but low funds.", "从一个经验丰富的雇佣骑士和伟大的装备，但更低的资金开始。");
	text = text.replace("Elite Few:", "少数精英：");
	text = text.replace("Can never have more than 12 men in your roster.", "你的名册上不能超过12个人。");
	text = text.replace("Avatar:", "化身：");
	text = text.replace("If your hedge knight dies, the campaign ends.", "如果你的雇佣骑士死了，战役就结束了。");
//农民
	text = text.replace("It started as a ragtag militia made up of anyone brave or desperate enough to volunteer for defending their homes, but has grown into a small army.", "它最初是由勇敢或绝望的人组成的一支破烂民兵组织，他们自愿保卫家园，但现在已经成长为一支小型军队。");
	text = text.replace("An army that needs to be fed each day.", "一支每天都需要补给的军队。");
	text = text.replace("Perhaps the militia\'s services could be rented out?", "也许民兵的服务可以租出去？");
	text = text.replace("Peasant Army:", "农民军：");
	text = text.replace("Start with a roster of 12 poorly equipped peasants.", "从12个装备不良的农民开始。");
	text = text.replace("Human Wave", "人海");
	text = text.replace("Take up to 16 men into battle at once, and have up to 25 in your roster.", "一次最多可带16人参加战斗，名册中最多可有25人。");
	text = text.replace("Dirty Peasants", "肮脏农民");
	text = text.replace("Can never hire anyone that isn\'t a lowborn peasant.", "不能雇佣任何不是低贱农民的人。");
//战团
	text = text.replace("For all your adult life you\'ve been raiding and pillaging in these lands.", "在你的成年生活中，你一直在这片土地上掠夺和抢劫。");
	text = text.replace("But with the local peasantry poor as mice, you may want to finally expand into the profitable field of mercenary work - that is, if your potential employers are willing to forgive your past transgressions.", "但是，如果当地的农民穷得像老鼠一样，你可能最终想要扩大到雇佣兵工作的盈利领域，也就是说，如果你的潜在雇主愿意原谅你过去的违法行为。");
	text = text.replace("Warband:", "战团：");
	text = text.replace("Start with three experienced barbarians.", "从三个有经验的野蛮人开始。");
	text = text.replace("Outlaws:", "不法之徒：");
	text = text.replace("Start with bad relations to most human factions.", "从与大多数人类派别的坏关系开始。");
	text = text.replace("Pillagers:", "抢劫者：");
	text = text.replace("You have a higher chance to get any items from slain enemies as loot.", "你有更高的几率从被杀死的敌人那里得到任何物品作为战利品。");

	text = text.replace("Start a campaign with a randomly picked origin.", "以随机选择的起源开始战役。");
	text = text.replace("How exciting!", "多么令人兴奋啊！");
	text = text.replace("Tip: move the scroll bar slowly to view all scenarios", "提示：慢慢移动滚动条可查看所有剧本");

//猎人
	text = text.replace("For years you\'ve made a decent living by poaching in the local woods, evading your lord\'s men by being quick on your feet.", "多年来，你一直在当地的森林里偷猎，快速地站起来躲避你主人的手下，过着体面的生活。");
	text = text.replace("But pickings have become slimmer and slimmer, and you\'re faced with a decision - how to make a living when all you know is how to use a bow?", "但是油水变得越来越少，你面临着一个决定，当你只知道如何使用弓时，如何谋生？");
	text = text.replace("Hunters:", "猎人：");
	text = text.replace("Start with a group of three woodsmen.", "从三个木匠开始。");
	text = text.replace("Expert Scouts:", "专家侦察员：");
	text = text.replace("You move faster and can always get a scouting report for any enemies near you.", "你移动的更快，并且可以随时得到一个任何敌人在你附近的侦察报告。");
	text = text.replace("Travel Light:", "轻装旅行：");
	text = text.replace("You can carry less items in your company\'s inventory.", "你的战队的库存携带较少的物品。");
	text = text.replace("You can carry fewer items in your company\'s inventory.", "你的战队的库存携带略少的物品。");
//商队
	text = text.replace("You\'re running a small trading caravan and have most of your crowns invested into trading goods.", "你经营着一个小型的贸易商队，你的大部分克朗都投资于贸易商品。");
	text = text.replace("You\'re running a small trade caravan and have most of your crowns invested into trading goods.", "你经营着一个小型的贸易商队，你的大部分克朗都投资于贸易商品。");
	text = text.replace("But the roads have become dangerous - brigands and greenskins lay in ambush, and there\'s rumors of even worse things out there.", "但是道路已经变得很危险了，强盗和绿皮埋伏着，而且有谣言说那里的情况更糟。");
	text = text.replace("Caravan:", "商队：");
	text = text.replace("Start with two caravan hands in your employ.", "从雇佣的两个商队成员开始。");
//	text = text.replace("Trader:", "贸易商：");
	text = text.replace("Get 10% better prices for buying and selling.", "买和卖的时候可以得到10%更好的价格。");
//	text = text.replace("Not a Warrior:", "不是战士：");
	text = text.replace("Start with no renown, and gain renown at half the normal rate.", "从没有声望开始，以正常速度的一半获得声望。");
	text = text.replace("Start with no renown, and gain renown at only 66% the normal rate.", "从没有声望开始，以正常速度的66%获得声望。");

	text = text.replace("You are second-in-command in a mercenary company that has been tracking a brigand named Hoggart for some time now.", "你是一家雇佣兵战队的二把手，这个战队一直在追踪一个名叫霍加特的强盗。");
	text = text.replace("An unexpected turn of events leaves the company in shatters, and you in charge to rebuild it to its former glory.", "一个意想不到的事件让战队陷入崩溃，而你负责重建它的昔日辉煌。");
	text = text.replace("Recommended for new players as it includes some helpful guidance in the beginning.", "推荐给新玩家，因为它在开始时包含一些有用的指导。");

	text = text.replace("You and your small band of mercenaries have done the dirty work of small-time merchants for years, yet you\'re barely a step above brigands.", "你和你那一小撮雇佣军多年来一直在做小商贩的肮脏勾当，但你跟强盗比还差一步。");
	text = text.replace("You want to be bigger than that.", "你想变得更大。");
	text = text.replace("You want it all.", "你想要一切。");
	text = text.replace("And the Gilder will reveal to you the way.", "镀金者会给你指路。");
	text = text.replace("A quick start into the southern part of the world, without any particular advantages or disadvantages.", "快速进入世界南部，没有任何特殊的优势或劣势。");

	text = text.replace("Constant conflict between city states and nomads makes for good business.", "城邦和游牧民族之间不断的冲突有利于生意的发展。");
	text = text.replace("The bulk of your outfit are captives, forced to fight to earn their freedom, and their ranks grow after each battle.", "你的大部分构成都是俘虏，为了获得自由被迫战斗，他们的队伍在每次战斗后都会增加。");
	text = text.replace("Army of Captives:", "俘虏大军：");
	text = text.replace("Start with two manhunters and four indebted.", "从两个搜捕者和四个负债者开始。");
	text = text.replace("Take up to 16 men into battle at once.", "一次最多可携带16人参战。");
	text = text.replace("Having equal or fewer indebted than non-indebted will make your men dissatisfied.", "负债者与非负债者相等或更少会使你的人不满意。");
	text = text.replace("Overseers:", "监工：");
	text = text.replace("All non-indebted can whip indebted in combat to reset their morale and buff their stats.", "所有非负债者都可以在战斗中鞭打负债者的来重置他们的士气和增加他们的属性。");
	text = text.replace("Captives:", "俘虏：");
	text = text.replace("Indebted earn 25% less experience, are capped at level 7, and will die if struck down.", "负债者获得的经验减少25%，上限为7级，如果被击倒将死亡。");
	text = text.replace("Indebted earn 10% more experience, are capped at level 7, and will die if struck down.", "负债者获得的经验增加10%，上限为7级，如果被击倒将死亡。");

	text = text.replace("You\'ve fought in the arenas of the south for years.", "你已经在南方的竞技场战斗多年了。");
	text = text.replace("First for your freedom, then for crowns, and finally to become immortal.", "首先是为了你的自由，然后是为了克朗，最后是为了不朽。");
	text = text.replace("What else does fate have in stock for you?", "命运还为你准备了什么？");
	text = text.replace("Gladiators:", "角斗士：");
	text = text.replace("Start with three experienced gladiators with good equipment, but very high daily wages.", "从三个经验丰富的角斗士开始，他们装备精良，但日工资很高。");
	text = text.replace("Legends of the Arena:", "竞技场传奇：");
	text = text.replace("Each gladiator has a unique trait in combat.", "每个角斗士在战斗中都有自己独特的特点。");
	text = text.replace("Glorious Three:", "荣耀之三：");
	text = text.replace("You can never have more than 12 men in your roster, and if all of your three starting men should die, your campaign ends.", "你的名册上不能超过12个人，如果你的三个首发人员都死了，你的战役就结束了。");

//宣誓者
	text = text.replace("Oathtakers are knightly warriors beholden not to liege lords, but to the ideals and teachings of their founder, Young Anselm. The order now finds itself in dire straits, and they\'ve turned to you to reverse their fortunes. Can you teach these zealots to become successful mercenaries?", "奉行骑士精神的宣誓者们是高尚无私的战士，他们不受贵族领主的约束，而是向他们已经故去的创始人， “初创者安塞姆”的理想与教诲宣誓效忠。这支骑士教团如今发现自己身陷囹圄，并求助于你，希望你能扭转他们的命运。你能够引导这些狂热者成为优秀的雇佣兵吗？");
	text = text.replace("Paladins:", "圣武士：");
	text = text.replace("Start with two battle-hardened warriors and good equipment.", "以两位久经沙场且装备精良的战士开始游戏。");
	text = text.replace("Oathtakers:", "宣誓者：");
	text = text.replace("Oathtaker:", "宣誓者：");
	text = text.replace("Anatomists:", "解剖学者");
	text = text.replace("Sworn to Young Anselm\'s teachings, you must take oaths that confer various advantages and disadvantages until fulfilled.", "你必须遵从初创者安塞姆的教诲，每隔十天宣下一则誓言，并为此同时承受奖励与惩罚，直至誓言完成为止。");
	text = text.replace("You knew the game well, and like any good game you got burned out on the rules and the rule setters. Oaths for this, Oaths for that. All you knew is you never got to hold Young Anselm\'s skull, and last you saw some Oathbringer had stolen off with the lad\'s preeminent jaw. Leaving the Oathtakers was the best decision you ever made, if only to preserve what little sanity you had left.", "你非常了解游戏，就像任何一款优秀的游戏一样，你会对规则和规则制定者感到厌倦。对这个的誓言，对那个的誓言。你只知道你没能抓住小安瑟姆的头骨，最后你还看到某个带誓者偷走了这孩子那突出的下巴。离开宣誓者是你做过的最好的决定，哪怕只是为了保住你仅有的一点理智。");
	text = text.replace(/Unfortunately, the faithful have a strong nose for the apostate\'s scent\. When you opened the door this morning it was like looking at two piles of shite some prankster kid had left you\： (.*?) and (.*?), in the flesh\. The former an older man who simply never shook his beliefs, and the latter a talented squire who reminds you of yourself\. No doubt the more mawkish talker, it was the younger lad who made his plea\： the Oathtakers need a man familiar with the land to help them around, completing quests and oaths\. You shut the door only to find the older man\'s foot in it\. He held up a pile of gold, and your nose must have wrinkled or wiggled because both men lit up\./, "不幸的是，信徒对叛教者的气味有很强的嗅觉。今天早上当你打开门的时候，感觉就像看到了恶作剧的孩子留给你的两堆屎：$1 和 $2，活生生的。前者是一个年纪较大的人，从来没有动摇过自己的信仰，而后者是一个才华横溢的侍从，让你想起了自己。毫无疑问，更令人作呕的说话者是这个年轻小伙子，他提出了请求：宣誓者需要一个熟悉这片土地的人来帮助他们，完成任务和宣誓。你关上门，却发现那个老人踩了脚。他举起了一堆金子，你的鼻子一定皱了，或者扭了，因为他们俩都亮了。");
	text = text.replace(/Now, you\'re only going along because times are tough, and because mercenary work – even under the guise of religious duty – can make some outstanding coin\. And if someone is willing to bankroll you into such an opulent task, then so be it\. There is only one condition\： you will take the Oath of Captaincy, which means all the battling and rough roading will be done by others\. Without pause, the Oathtakers agree, and then they show you Young Anselm\'s skull\. You\'ve lost touch with the organization, but seeing that lad\'s dumb dome still brings a stir in your heart\. (.*?) nods\.(.*?)Let us scour these lands for the honorable, and be diligent in our tasks, and may we ever make Young Anselm whole again from the rat bastard Oathbringers who broke him/, "现在，你继续下去只是因为时局艰难，因为惟利是图的工作——即使打着宗教职责的幌子——可以赚到一些可观的钱。如果有人愿意出钱让你完成这么大的任务，那就这样吧。只有一个条件：你将宣誓成为船长，这意味着所有的战斗和艰难的道路将由其他人来完成。宣誓者没有停顿地同意了，然后他们给你看Young Anselm的头骨。你已经失去了与组织的联系，但看到那小伙子的愚蠢的圆顶仍然在你的心中引起了骚动。$1 点点头。$2让我们在这片土地上寻找光荣的人，努力完成我们的任务，愿我们永远能让年轻的安瑟姆从那些毁了他的可恶的誓言带来者手中恢复过来");
	  
//解剖学者
	text = text.replace("Fueled by an unquenchable thirst for knowledge, the Anatomists have spent years dissecting the exotic and the alien. With social mores dogging their research, however, they\'ve turned to you to form a mercenary company and provide them a new source of fresh specimens.", "在他们无法抑制的求知欲驱动下，解剖学者们已经花费了数年时间用于剖析大陆上的各种邪崇异兽。然而，随着社会大众对他们的研究手段愈发排斥，他们最终找上了你，希望能够成立一家佣兵战团，以便为他们提供源源不断的新鲜样本。");
	text = text.replace("Anatomists:", "解剖学者：");
	text = text.replace("Start with three men and high funds.", "以三名解剖学家开始游戏，启动资金相当充裕。");
	text = text.replace("Researchers:", "科学工作者：");
	text = text.replace("Research the corpses of your fallen foes and gain knowledge to empower your men.", "研究你所击倒的敌人的遗骸，并从中提取出用于强化你战团成员的宝贵知识和特殊药剂。");
	text = text.replace("Not Fighters:", "并非战士：");
	text = text.replace("Your men will never be of Confident morale.", "你的所有战团成员将永远无法达到自信士气。");

//起源名称
	//PTR
	text = text.replace("Old Swordmaster", "老剑师");
//魔法起源MOD
	text = text.replace("Secret", "秘密");
	text = text.replace("Hexe", "女巫");
	text = text.replace("Geomancer Trio", "地卜师三人组");
	text = text.replace("Mage Trio", "魔法师三人组")
//传奇战役名称
	text = text.replace("Druid [Legacy]", "德鲁伊[遗产]");
	text = text.replace("Horse party", "马帮");
	text = text.replace("Legion [Beta]", "亡灵军团[测试]");
	text = text.replace("Mage", "法师");
	text = text.replace("Adventuring Party", "冒险队");
	text = text.replace("Random Pick", "随机");
	text = text.replace("Tutorial", "教程");
	text = text.replace("Assassin", "刺客");
	text = text.replace("Original Beggar Challenge", "乞丐挑战[原版]");
	text = text.replace("Scaling Beggar Challenge", "乞丐挑战[调整]");
	text = text.replace("Berserker", "狂战士");
	text = text.replace("Escaped Slaves", "逃跑的奴隶");
	text = text.replace("Legion", "军团");
	text = text.replace("Random Solo", "随机单人");
	text = text.replace("Random Trio", "随机三人");
	text = text.replace("Random Party", "随机团队");
	text = text.replace("Ranger", "巡林者");
	text = text.replace("Noble", "贵族");
	text = text.replace("Seer", "先知");
	text = text.replace("Sisterhood", "姐妹情谊");
	text = text.replace("The Inquisition", "宗教裁判所");
	text = text.replace("The Troupe", "剧团");
	text = text.replace("Warlock", "术士");
	text = text.replace("The Cabal", "秘教");
	text = text.replace("Sellswords", "佣兵");
//原版
	text = text.replace("Crusader", "十字军");
	text = text.replace("Beast Slayers", "野兽杀手");
	text = text.replace("Davkul Cultists", "达库尔异教徒");
	text = text.replace("Deserters", "逃兵");
	text = text.replace("A New Company", "新战队");
	text = text.replace("Lone Wolf", "独狼");
	text = text.replace("Peasant Militia", "农民民兵");
	text = text.replace("Northern Raiders", "北方掠夺者");
	text = text.replace("Random", "随机");
	text = text.replace("Band of Poachers", "偷猎者团队");
	text = text.replace("Trading Caravan", "贸易商队");
	text = text.replace("Rebuilding a Company (Tutorial)", "重建战队[教程]");
	text = text.replace("Rebuilding a Company", "重建战队");
	text = text.replace("Southern Mercenaries", "南方雇佣兵");
	text = text.replace("Manhunters", "搜捕者");
	text = text.replace("Gladiators", "角斗士");
	text = text.replace("Oathtakers", "宣誓者");
	text = text.replace("Anatomists", "解剖学者");
	return text;
}

var TranslateSaveCampaignMenuModule = function(text)
{
	text = text.replace("New Savegame", "新存档");
	text = text.replace("- Incompatible Version -", "- 版本不兼容 -");
	text = TranslateLoadCampaignMenuModule(text);

	return text;
}

var TranslateScenarioMenuModule = function(text)
{
	text = text.replace("A simple scenario to teach combat basics.", "教授战斗基础的简单场景。");
	text = text.replace("A simple scenario to learn combat basics.", "学习战斗基础的简单场景。");
	text = text.replace("Few and easy opponents all over a map with lots of terrain features blocking sight.", "很多简单的对手分布在整个地图中，这里的很多地形会阻挡你的视线。");
	text = text.replace("Well suited to get used to lines of sight, fog of war and ranged combat.", "非常适合用来适应视野、战争迷雾以及远程作战。");
	text = text.replace("A possible early game encounter in enemy composition and equipment available.", "可能在游戏前期遇到的敌人组成和装备配置。");
	text = text.replace("Survive against overwhelming odds while positioned on top of a hill.", "处于小山的顶部，在巨大的危险中生存下来。");
	text = text.replace("Well suited to learn about height advantage and to test sight and usability issues with height levels.", "非常适合学习高度优势，并在高处测试视野和实践。");
	text = text.replace("Featuring two battle lines pitted against each other in close combat from the start.", "两条战斗线从一开始就处于紧密的交锋中。");
	text = text.replace("ORC ORC ORC ORC ORC ORC.", "兽人 兽人 兽人 兽人 兽人 兽人。");
	text = text.replace("Defend against a pack of vicious Goblin Wolfriders.", "抵御一群凶猛的哥布林狼骑兵。");
	text = text.replace("Don\'t let them encircle you!", "别让他们包围你！");
	text = text.replace("A possible late game encounter in enemy composition and equipment available.", "可能在游戏后期遇到的敌人组成和装备配置。");
	text = text.replace("An empty map for AI testing. Spawn combatants manually and let them fight it out.", "用于AI测试的空地图。手动生成战斗人员，让他们战斗。");

	text = text.replace("Easy.", "容易的。");
	text = text.replace("Moderate difficulty.", "中等难度。");
	text = text.replace("Difficult.", "困难的。");
	
	text = text.replace("Combat Basics", "战斗基础");
	text = text.replace("Swipe", "横扫");
	text = text.replace("Early Game", "游戏前期");
	text = text.replace("Defend the Hill", "守卫小山");
	text = text.replace("Line Battle (Undead)", "战线（亡灵）");
	text = text.replace("Line Battle (Orcs)", "战线（兽人）");
	text = text.replace("Line Battle (Goblins)", "战线（哥布林）");
	text = text.replace("Wolfriders", "狼骑兵");
	text = text.replace("A Walk in the Woods", "林中漫步");

	return text;
}

var TranslateWorldObituaryScreen = function(text)
{
	text = text.replace("No one has fallen since you took command", "没有人死在你的指挥下");
	text = text.replace("A single man has fallen since you took command", "一个人死在你的指挥下");
	text = text.replace("men have fallen since you took command", "个人死在你的指挥下");
	text = text.replace("Murdered by his fellow brothers", "被他的兄弟们谋杀了");
	text = text.replace("Devoured by a Nachzehrer", "被食尸鬼吞噬");
	text = text.replace("Committed Suicide", "自杀");
	text = text.replace("Killed in battle", "在战斗中丧生");
	text = text.replace("Beheaded", "斩首");
	text = text.replace("Disemboweled", "解体");
	text = text.replace("Gutted", "内脏流出");
	text = text.replace("Went missing", "失踪");
	text = text.replace("Blown to bits", "被炸成碎片");
	text = text.replace("Bitten to bits", "被咬成碎片");
	text = text.replace("Bled to death", "流血至死");
	text = text.replace("Clubbed to death", "棍棒打死");
	text = text.replace("Hammered to death", "锤打致死");
	text = text.replace("Whipped to death", "鞭打致死");
	text = text.replace("Died of nightmares", "噩梦致死");
	text = text.replace("Electrocuted", "触电致死");
	text = text.replace("Ripped to shreds", "撕成碎片");
	text = text.replace("Pounded to death", "砸击致死");
	text = text.replace("Crushed", "粉碎致死");
	text = text.replace("Gnawed", "啃死");
	text = text.replace("Killed", "杀死");

	text = text.replace(/by a?n?/, "于 ");

	text = TranslateTopbarEventLogModule(text);

	return text;
}


var TranslateRelations = function (text)
{
text = text.replace("Grand City of","大都市");
text = text.replace("Free City of","自由城");
text = text.replace("Holy City of","圣城");
text = text.replace("City State of","城邦");
text = text.replace("City of","城邦");
text = text.replace("Realm of","王国");
text = text.replace("House","家族");
text = text.replace("Protectorate of","保护领地");
text = text.replace(/GongSunShi/g,"公孙氏");
text = text.replace(/LiuShi/g,"刘氏");
text = text.replace(/CaoShi/g,"曹氏");
text = text.replace(/SunShi/g,"孙氏");
text = text.replace(/YuanShi/g,"袁氏");
text = text.replace(/SiMaShi/g,"司马氏");
text = text.replace(/DongShi/g,"董氏");
text = text.replace(/MaShi/g,"马氏");
text = text.replace(/ZhangShi/g,"张氏");
text = text.replace(/KongShi/g,"孔氏");
text = text.replace(/Grimmund/g,"格里姆米德");
text = text.replace(/Weilburg/g,"维尔堡");
text = text.replace(/Armsberg/g,"阿姆斯伯格");
text = text.replace(/Gota/g,"高特");
text = text.replace(/Eisenstein/g,"艾森斯坦");
text = text.replace(/Grauwall/g,"格劳沃尔");
text = text.replace(/Rabenholt/g,"拉本霍尔特");
text = text.replace(/Sommerwein/g,"萨摩威宁");
text = text.replace(/Winterhall/g,"温特霍尔");
text = text.replace(/Ruhmolt/g,"若蒙特");
text = text.replace(/Adelreich/g,"阿德莱希");
text = text.replace(/Perowinger/g,"佩罗文杰");
text = text.replace(/Eiglof/g,"埃格洛夫");
text = text.replace(/Berengar/g,"贝伦加尔");
text = text.replace(/Gunbald/g,"冈博尔德");
text = text.replace(/Goswin/g,"戈斯温");
text = text.replace(/Adelheim/g,"阿德尔海姆");
text = text.replace(/Ammondt/g,"阿蒙特");
text = text.replace(/Bartholin/g,"巴托兰");
text = text.replace(/Eberlin/g,"埃伯林");
text = text.replace(/Folsach/g,"福尔萨克");
text = text.replace(/Hedin/g,"赫丁");
text = text.replace(/Horn/g,"赫若");
text = text.replace(/Niedergard/g,"尼德加德");
text = text.replace(/Rosenving/g,"罗森文");
text = text.replace(/Thurah/g,"图拉");
text = text.replace(/Kaltenborn/g,"卡尔滕伯恩");
text = text.replace(/Krieger/g,"克里格");
text = text.replace(/Steinwall/g,"斯泰因瓦尔");
text = text.replace(/Harkon/g,"哈肯");
text = text.replace(/Osten/g,"奥斯特");

text = text.replace("Hostile","敌对");
text = text.replace("Threatening","危险");
text = text.replace("Unfriendly","敌意");
text = text.replace("Cold","冷淡");
text = text.replace("Neutral","中立");
text = text.replace("Open","开放");
text = text.replace("Friendly","友好");
text = text.replace("Very Friendly","亲密");
text = text.replace("Allied","盟友");

text = text.replace(" von ","·");
//text = text.replace(" of ","·");
return text;
}

var TranslateWorldRelationsScreen0 = function(text)
{
	text = TranslateRelations(text);
	text = TranslateLargeFishingVillage(text);
	text = text.replace("Grand City of","大都市");
	text = text.replace("Free City of","自由城");
	text = text.replace("Holy City of","圣城");
	text = text.replace("City State of","城邦");
	text = text.replace("City of","城邦");
	text = text.replace("Realm of","王国");
	text = text.replace("House","家族");
	text = text.replace("Protectorate of","保护领地");
	text = text.replace("Renown:", "声望：");
	text = text.replace("Treacherous", "奸诈");
	text = text.replace("Incompetent", "无能");
	text = text.replace("Unreliable", "不可靠");
	text = text.replace("Unknown", "无名");
	text = text.replace("Recognized", "赏识");
	text = text.replace("Reliable", "可靠");
	text = text.replace("Competent", "能干");
	text = text.replace("Professional", "专业");
	text = text.replace("Reputable", "尊敬");
	text = text.replace("Famed", "著名");
	text = text.replace("Great", "伟大");
	text = text.replace("Glorious", "荣耀");
	text = text.replace("Fabled", "传说");
	text = text.replace("Legendary", "传奇");
	text = text.replace("Invincible", "无敌");
	text = text.replace("Immortal", "不朽");

	text = text.replace("Reputation:", "声誉：");
	text = text.replace("Dreaded", "畏惧");
	text = text.replace("Cruel", "残忍");
	text = text.replace("Merciless", "无情");
	text = text.replace("Notorious", "臭名昭著");
	text = text.replace("Neutral", "中立");
	text = text.replace("Kind", "友善");
	text = text.replace("Goods ", "货物");
	text = text.replace("Good", "优秀");
	text = text.replace("Chivalrous", "骑士精神");
	text = text.replace("Saintly", "神圣");

	text = text.replace("Relations:", "关系：");
	text = text.replace("Hostile","敌对");
	text = text.replace("Threatening","危险");
	text = text.replace("Unfriendly","敌意");
	text = text.replace("Cold","冷淡");
	text = text.replace("Neutral","中立");
	text = text.replace("Open","开放");
	text = text.replace("Friendly","友好");
	text = text.replace("Very Friendly","亲密");
	text = text.replace("Allied","盟友");

	text = text.replace("Puny", "弱小");
	text = text.replace("Weak", "无力");
	text = text.replace("Average", "中等");
	text = text.replace("Strong", "强壮");
	text = text.replace("Dangerous", "危险");
	text = text.replace("Deadly", "灾难");
	text = text.replace("Invincible", "无敌");
	
	text = text.replace(" von ","·");
//	text = text.replace(" of ","·");
	return text;
}

var TranslateWorldRelationsScreen1 = function(text)
{
	text = TranslateWorldTownScreenMainDialogModule(text);
	text = TranslateToolTip1_WorldTownScreenMainDialogModule(text);
	text = text.replace("He lives well who lives peacefully", "和平生活的人生活得很好");
	text = text.replace("Wealth is my arrow", "财富是我们的箭");
	text = text.replace("Wealth is our sword", "财富是我们的剑");
	text = text.replace("Golden towers in the distance", "远处的金塔");
	text = text.replace("A gift returned", "归还的礼物");
	text = text.replace("One giveth, one taketh", "没有付出就没有收获");
	text = text.replace("A wealthy and independent city state focused mostly on trade and acquiring further wealth.", "一个富裕而独立的城邦主要专注于贸易和获取更多财富。");
	
	text = text.replace("A snake in the grass", "草丛中的蛇");
	text = text.replace("From the shadows", "利用好阴影");
	text = text.replace("By all means", "尽一切办法");
	text = text.replace("The hawk catcheth not flies", "鹰捉不到苍蝇");
	text = text.replace(/A city state ruled by a ruthless council that is out to achieve power by all means\. Many an untimely death is rumored to have been an assassination ordered by the viziers of (.*?)\./, "一个由无情的议会统治的城邦，该议会千方百计想要获得权力。许多不合时宜的死亡据传是由 $1 的维齐尔下令的暗杀");

	text = text.replace("Dare to be wise", "敢于聪明");
	text = text.replace("Wisdom the conqueror of fortune", "智慧是财富的征服者");
	text = text.replace("Read and learn", "阅读和学习");
	text = text.replace("The castle of wisdom", "智慧城堡");
	text = text.replace("Knowledge at last", "终于有了知识");
	text = text.replace("A city state dedicated to acquiring knowledge above all - even if it comes at the cost of doing autopsies, reading forbidden tomes or engaging with sinister powers not of this world.", "一个致力于获取最重要的知识的城邦——即使是以尸检、阅读禁书或与不属于这个世界的邪恶势力交往为代价。");
	
	text = text.replace(/The house of (.*?) revolves around a religious cult that teaches compassion towards their own but turned them zealous and unforgiving towards their foes\./, "$1 家族成立的根基是一个宗教教派，他们的教义教导他们要对自己人施以同情和关怀，但也让他们在面对敌人时充满狂热，毫不留情。");
	text = text.replace("Generations ago, a large orc invasion pillaged and destroyed most of what belonged to the family, and it never fully recovered.", "在几代人以前，一场大规模的兽人入侵掠夺并摧毁了曾属于这个家族的绝大部分财产，造成了直至今日仍未恢复的损失。");
	text = text.replace("Since then, the house started many a crusade and punitive expedition deep into orc lands but never managed to drive the greenskins off for good.", "自那以后，这个家族派遣了许多支打着圣战与复仇旗号的远征军深入兽人领地的心腹，但却从未能够将绿皮从大陆上真正一劳永逸地抹除。");
	text = text.replace("Virtue is the only nobility", "唯有美德堪称高贵");
	text = text.replace("In defence of the distressed", "誓死捍卫受难之人");
	text = text.replace("Zeal and honour", "热忱与荣耀");
	text = text.replace("Noble in anger", "狂怒的贵族");
	text = text.replace("Cleansed by the flame", "让火焰净化一切");
	text = text.replace("Peace is obtained by war", "战火铸就和平");
	text = text.replace("While we have breath we hope", "希望永存");
	text = text.replace("Boldly and honourably", "光荣而勇猛");
	text = text.replace("We scorn to change or to fear", "我们蔑视变革与恐惧");
	text = text.replace("Victory is in truth", "胜利高于一切");
	text = text.replace("Light in Darkness", "黑暗中的灯塔");
	text = text.replace("One heart, one way", "齐心协力，众志成城");

	text = text.replace(/The house of (.*?) holds high the principles of justice and honor, and without irrational rulings their region has prospered\./, "$1 坚信正义与荣耀的原则，他们的领地因远离不公正的裁决而繁荣昌盛。");
	text = text.replace(/Their reputation may be peaceful, but (.*?) knights are battle hardened and their troops will ferociously fight anyone threatening their realm, subordinates or principles\./, "他们或许因儒雅随和而闻名，但 $1 家族的骑士却都身经百战，而且他们的军队时刻准备着与任何胆敢威胁他们的领土、下属和原则的敌人进行殊死决斗。");
	text = text.replace(/Their reputation may be peaceful, but (.*?) knights are battle-hardened and their troops will ferociously fight anyone threatening their realm, subordinates or principles\./, "他们或许因儒雅随和而闻名，但 $1 家族的骑士却都身经百战，而且他们的军队时刻准备着与任何胆敢威胁他们的领土、下属和原则的敌人进行殊死决斗。");
	text = text.replace(/Many nobles envy their wealth and ridicule their principles; house (.*?) especially holds a more or less overt grudge against those of (.*?)\./, "许多贵族都觊觎他们的财富，嘲笑他们的信条；其中尤以 $1 为甚，他们那些怨恨都或多或少的作用给了 $2。");
	text = text.replace("Live that you may live", "为你自己而活");
	text = text.replace("Friendship without deceit", "友谊不容虚伪");
	text = text.replace("Dare to be wise", "敢为睿智者");
	text = text.replace("The brave always show mercy", "勇者仁心");
	text = text.replace("A friend to a friend", "予我以爱，必还之以花");
	text = text.replace("This hand is hostile to tyrants", "此地无暴虐无道者容身之处");
	text = text.replace("Irritate not the lion", "不要惹怒雄狮");
	text = text.replace("An oak in aged strength", "虽饱经沧桑，仍坚毅不拔");
	text = text.replace("With heart and hand", "心口如一");
	text = text.replace("Always watchful", "时刻警惕着");
	text = text.replace("Glory to the father", "荣耀归于长者");
	text = text.replace("Virtue under strength", "美德源于力量");
	text = text.replace("Prepared in either case", "时刻准备就绪");
	text = text.replace("Not for ourselves alone", "富则兼济天下，绝不独善其身");

	text = text.replace(/Wealth is sought by many, but the highly reputable traders of house (.*?) are the best when it comes to striking profitable bargains\./, "许多人都追求财富，但 $1 的诚信商人们尤其懂得抓住机遇与和气生财之道。");
	text = text.replace("Bound by ancestral ties to the renown of their forefathers they uphold honesty and integrity as their family values.", "在他们祖先的高尚名声下，他们恪守着诚实与正直作为他们的家族价值观。");
	text = text.replace("Reason is the guide of life", "理性乃人生向导");
	text = text.replace("Firmly in act and gently in manner", "行动当机立断，礼仪温和得体");
	text = text.replace("Let us be viewed by our actions", "我们用事实说话");
	text = text.replace("Strive without reproach", "身正不怕影子斜");
	text = text.replace("The sun rises after clouds", "阳光总在风雨后");
	text = text.replace("Courage in difficulties", "困难使我们勇敢");
	text = text.replace("Plenty is caused by dilligence", "勤奋是富有之本");

	text = text.replace(/The noble house of (.*?) is a proud and unrelenting family with a long and bloodstained history of conquest\./, "$1 家族高傲而无情，有着悠久而血腥的征服家史。");
	text = text.replace(/Seated in their fortress of (.*?), they take with arms what they consider theirs by right\./, "安坐在他们家族的 $1 堡垒中，他们心安理得地用暴力夺取他们想要的一切。");
	text = text.replace(/An ancestral feud with house (.*?) provides never ending reasons to keep both hate in the hearts and ore smelters burning\./, "他们与 $1 家族间的世仇给了他们数不清的理由来让怒火同时在两个家族人们的心头和兵工厂的熔炉中熊熊燃烧。");
	text = text.replace("He stands by his own powers", "我们恃强自立");
	text = text.replace("He conquers who endures", "逆来顺受者死有余辜");
	text = text.replace("Boldly and rightly", "凶暴勇猛，理直气壮");
	text = text.replace("Under this sign thou shalt conquer", "以家徽之名征服");
	text = text.replace("He dies not whose fame survives", "名声乃身外之物");
	text = text.replace("No steps backwards", "绝不后退");
	text = text.replace("Through arrows and enemies", "穿破箭雨，突破敌军");
	text = text.replace("Nothing resists valour and arms", "勇猛与利刃无物可挡");
	text = text.replace("Such is the way to immortality", "征服书写不朽");
	text = text.replace("And we also have hurled our javelins", "我们厉兵秣马");
	text = text.replace("The heron seeks high places", "苍鹰生而只为身居高位");

	text = text.replace(/Disdained for their ruthlessness, brutality and greed, house (.*?) has little interaction with other noble families\./, "因为他们的冷酷无情与贪得无厌而饱受唾弃的 $1 家族与其他贵族家族相交甚少。");
	text = text.replace(/Their captains and soldiers are known for raiding trade caravans, outlying farms and small settlements from their fortress of (.*?)\. A life is not worth much in the realm of house (.*?) and many a mercenary on the look for a quick coin only found a quick end here\./, "他们麾下来自 $1 要塞的队长与士兵因劫掠商队、农场与聚落而闻名。人命在 $2 家族的领地里一文不值，许多雇佣兵来到他们的领地希望赚笔快钱，而他们所获的唯一事物就是速死。");
	text = text.replace("Whatever grows perishes in ashes", "万物终归于尘土");
	text = text.replace("We trample it under our feet", "我们践踏一切");
	text = text.replace("For me and for mine", "为了我们和我们还有我们");
	text = text.replace("The eagle catches not flies", "猎鹰不食飞蝇");
	text = text.replace("Deeds not words", "行动胜于空谈");
	text = text.replace("The gods feed the ravens", "天佑渡鸦");
	text = text.replace("Always thirsty", "渴望永无止境");
	text = text.replace("Sons of hounds come here and get flesh", "猎犬之子嗣于此猎食");
	text = text.replace("Not without booty", "留下买路财");

	text = text.replace(/House (.*?) is hated by many but feared by even more\./, "与其说 $1 被人憎恨，不如说他们被人所畏惧。");
	text = text.replace(/A number of small and big uprisings have been put down with fire and sword and the (.*?) henchmen are known to have eyes in every shady corner and ears in every wall\./, "无数次大大小小的起义被烈火与长剑所镇压，$1 家族的追随者充斥在每一个阴暗的角落与每一面墙背后。");
	text = text.replace(/The family\'s ancestral home of (.*?) is swarming with armed guards, sniffing wardogs and bulky mercenaries to protect their paranoid leaders\./, "在他们祖传的 $1 要塞中，数不胜数的武装警卫、警惕的战犬和规模庞大的雇佣兵团拱卫着家族那偏执的领导者。");
	text = text.replace("A knife in the dark", "当心你的背后");
	text = text.replace("Cutting causes growth", "旧的不去，新的不来");
	text = text.replace("Always ready", "整装待发");
	text = text.replace("The sentinel sleeps not", "守望永不停歇");
	text = text.replace("Arms maintain peace", "武力维持和平");
	text = text.replace("Innocent as doves", "清白如鸽");
	text = text.replace("Firm of purpose", "坚定不移");
	text = text.replace("Obey", "服从");
	text = text.replace("By laws and arms", "以法律与武力之名");
	text = text.replace("Learn to endure what must be borne", "如果无法反抗，那就忍受");
	text = text.replace("The wrath of the lion is noble", "雄狮之怒，依然高贵");

	text = text.replace(/The house of (.*?) is well known for its lavish lifestyle and bacchanal festivities\./, "$1 以其奢华的生活方式和纵情享乐的节日而闻名。");
	text = text.replace(/The price has to be paid by someone, so half-starved cattle, empty granaries and desperate townsfolk are a common sight where house (.*?) rules\./, "如此盛宴总得有人来为其买单，所以饿到半死不活的耕牛、空空荡荡的粮仓和目光无神的镇民在 $1 的治下是再正常不过的现象。");
	text = text.replace("Although other noble houses may look down on such brutality and depletion they are at the same time desperately awaiting their invitation to the next feast.", "尽管其他贵族都看不起这种残暴和奢侈无度，但他们也同时都在绝望地等待下一次宴会的邀请。");
	text = text.replace("Unconquered", "不可战胜");
	text = text.replace("Cruel rumor, be still", "流言蜚语止步");
	text = text.replace("I soar", "一飞冲天");
	text = text.replace("With good right", "理由充分");
	text = text.replace("I despise", "施以轻蔑");
	text = text.replace("Sheep, ye bear the wool", "羊毛出在羊身上");
	text = text.replace("Spare not", "拒绝节俭");
	text = text.replace("Profit is gained by danger", "富贵险中求");
	text = text.replace("Remember that thou must die", "铭记在心，人终有一死");

	text = text.replace(/Trading and haggling can be just as fierce as fighting a war, and the house of (.*?) is a true master of cunning bargains\./, "俗话说商场如战场，而 $1 家族正是对讨价还价，锱铢必较的狡诈商法登峰造极的大师。");
	text = text.replace(/Rumor has it that many a profitable deal made by house (.*?) is not only based on honest trading but also bribery, extortion and deception\./, "据传言称，$1 所进行的许多利润丰厚的交易都不只是基于诚实守信的贸易，而是更通过贿赂、敲诈与骗术所达成。");
	text = text.replace(/The family resides in the pompous region capitol of (.*?), but despite their unmeasurable riches they are known to be notoriously close-fisted\./, "这个家族居住在他们富丽堂皇的地区首府 $1 要塞中，尽管他们的财富不可估量，但他们的小气抠门也同样是出了名的。");
	text = text.replace("To live without a wish concealed", "忠实于自己的愿望而活");
	text = text.replace("Fortune favours the bold", "幸运眷顾敢于豪赌之人");
	text = text.replace("The world does not suffice", "这个世界还不够好");
	text = text.replace("Separate the honest from the useful", "诚实与实用不可相提并论");
	text = text.replace("Our harvest will also arrive", "我们的丰收终将到来");
	text = text.replace("I gain by hazard", "灾难带给我们财富");

	text = text.replace(/House (.*?) claims to have roots in the time when man first claimed this land, and the first king ruled all men\./, "$1 家族自称他们的家史从人类第一次踏足这片大陆，以及第一任帝王登基统治以来就已经开始了。");
	text = text.replace("They are but one of many noble houses now, but proud of their long history and with ambitions to continue writing history.", "尽管他们现在只不过是众多普普通通的贵族家族之一，但他们为自己家族的古老传统深感荣耀，并胸怀野心，渴望再次亲自书写历史。");
	text = text.replace("As their renown and their resources dwindle in the now, they are said to finance expeditions in an attempt to unearth long lost treasures from the past, in sunken cities and places long forgotten.", "现在，随着他们的名望和财产一点点地减少，据说他们开始资助探险者们，试图从过去那些沉沦的都市与早已被人遗忘的地方发掘失落的宝藏。");
	text = text.replace("He lives twice who lives well", "活得好等于活了两次");
	text = text.replace("Wealth to him who knows how to use it", "财富属于知道如何使用它的人");
	text = text.replace("Things locked up are safe", "只有锁起来的东西才是安全的东西");
	text = text.replace("Once and always", "一如既往");
	text = text.replace("Gauge and measure", "评估与测量");
	text = text.replace("Safe on the waves", "狂涛巨浪，能奈我何");
	text = text.replace("Each his share", "人人为我");
	text = text.replace("With sail and oars", "风帆与船桨");
	text = text.replace("Among the first", "敢为天下先");

	text = text.replace(/Most members of the house of (.*?) live secluded behind thick doors and barred windows and some of them have not been seen for years\./, "绝大多数 $1 家族的成员都生活在厚厚的门窗后面，有些人甚至已经好几年没有抛头露面了。");
	text = text.replace("Rumor has it that their noble blood is plagued with madness and insanity but no ordinary man dares to utter such claims in fear of their vengeance.", "有传言说他们高贵的血脉中流淌着疯狂与错乱的诅咒，但因为害怕他们的报复，从来没人敢当众说出这样的话。");
	text = text.replace(/Other noble houses mainly avoid contact to house (.*?) as guests may be greeted with open arms as well as crossbow bolts\./, "其他的贵族多数情况下都会避免与 $1 进行接触，因为去他们那拜访的客人有可能会同时受到敞开的双臂与弓弩的箭矢作为欢迎。");
	text = text.replace("Nothing in life is permanent", "无人永生");
	text = text.replace("Consider the end", "预想你的终末");
	text = text.replace("We neither despise nor fear", "我们不蔑视别人，我们亦无所畏惧");
	text = text.replace("Judge not", "我们不接受评判");
	text = text.replace("All things change", "时代变了");
	text = text.replace("Every man for himself", "人不为己天诛地灭");
	text = text.replace("All things are thus unstable", "一切都如此反复无常");
	text = text.replace("Beware the wolf", "当心狼群");
	text = TranslateWorldRelationsScreen0(text);
	text = TranslateLargeFishingVillage(text);
	return text;
}

var TranslateWorldCampfireScreenHireDialogModule0 = function(text)
{
	text = text.replace("Hire Follower", "雇佣追随者");

//agent_follower.nut
	text = text.replace("The Agent", "事务官");
	text = text.replace("The Alchemist", "炼金术士");
	text = text.replace("The Blacksmith", "铁匠");
	text = text.replace("The Bounty Hunter", "赏金猎人");
	text = text.replace("The Brigand", "强盗");
	text = text.replace("The Cartographer", "制图师");
	text = text.replace("The Cook", "厨师");
	text = text.replace("The Drill Sergeant", "教官");
	text = text.replace("The Lookout", "观察员");
	text = text.replace("The Minstrel", "吟游诗人");
	text = text.replace("The Negotiator", "谈判者");
	text = text.replace("The Paymaster", "出纳员");
	text = text.replace("The Quartermaster", "军需官");
	text = text.replace("The Recruiter", "招募者");
	text = text.replace("The Scavenger", "拾荒者");
	text = text.replace("The Scout", "侦察员");
	text = text.replace("The Surgeon", "外科医生");
	text = text.replace("The Trader", "交易员");
	text = text.replace("Messenger\'s Rest", "事务官工具");
	text = text.replace("Alchemy Tools", "炼金术士工具");
	text = text.replace("Blacksmith\'s Tools", "铁匠工具");
	text = text.replace("Bounty Board", "赏金猎人工具");
	text = text.replace("Stolen Documents", "强盗工具");
	text = text.replace("Mapping Supplies", "制图师工具");
	text = text.replace("Cooking Equipment", "厨师工具");
	text = text.replace("Training Dummies", "教官工具");
	text = text.replace("Outrider\'s Post", "观察员工具");
	text = text.replace("Minstrel\'s Tent", "吟游诗人工具");
	text = text.replace("Meeting Point", "谈判者工具");
	text = text.replace("Pennypincher\'s Tools", "出纳员工具");
	text = text.replace("Ordered Inventory", "军需官工具");
	text = text.replace("Pre-filled Contracts", "招募者工具");
	text = text.replace("Scavenger\'s Cart", "拾荒者工具");
	text = text.replace("Watcher\'s Totem", "侦察员工具");
	text = text.replace("Triage Table", "外科医生工具");
	text = text.replace("Secure Chests", "交易员工具");

	return text;
}

var TranslateWorldCampfireScreenHireDialogModule1 = function(text)
{
	text = text.replace("Have at least one of the following backgrounds: Adventurous Noble/Lady, Noble Commander, Philosopher, Historian", "至少有下列背景之一；爱冒险的贵族/贵妇、贵族指挥官、哲学家和史学家");
//	text = text.replace(/Have a (.*?) with a permanent injury in your company/, "至少有一位 $1 遭受永久伤");
	text = text.replace(/Have someone who\'s learned the (.*?) perk/, "至少有一人解锁 $1 特技");
	text = text.replace(/Have someone with the (.*?) perk/, "至少有一人解锁 $1 特技");
	text = text.replace(/Crafted (.*?) items/, "制作 $1 件物品");

	
	
	//agent_follower.nut
	text = text.replace("The Agent has eyes and ears everywhere and will know where to go for a well-paying contract.", "事务官到处都有耳目，知道去哪里签一份报酬优厚的合同。");
	text = text.replace("She is also skilled at maintaining good relations with the important people of the lands.", "她还善于与当地重要人物保持良好关系。");
	text = text.replace("Reveals available contracts in the tooltip of settlements no matter where you are", "在定居点提示栏中显示可用的合同，无论你在何处");
	text = text.replace("Makes good relations with any faction decay slower and bad relations recover faster", "使与任何派系的良好关系衰退得慢，而不良关系恢复得快");
	text = text.replace("Have at least one of the following backgrounds: Eunuch, Messenger, Assassin (Southern or Northern)", "在战队中拥有一名太监、信使或刺客");
	text = text.replace("Have allied relations with a noble house or city state", "与一家贵族或城邦达到同盟关系");
	text = text.replace("Through setting up a network of messengers, skilled agents can be employed to deliver information that you may find of use...after a short rest, of course.", "通过建立一个信使网络，熟练的代理人可以提供你可能会发现有用的信息...当然，在短暂休息之后。");
	text = text.replace("Reveals available contracts and active situations in the tooltip of settlements no matter where you are", "在营地的工具提示中显示可用的合同和活动情况，无论你在哪里");
	text = text.replace("Have at least one of the following backgrounds: Eunuch, Messenger, Assassin (Southern or Northern)", "至少有以下背景之一：太监、信使、刺客(南方或北方)");

//alchemist_follower.nut
	text = text.replace("The Alchemist is knowledgeable in crafting all kinds of mysterious contraptions and concoctions from exotic ingredients when given access to taxidermist equipment, and uses less material to do so.", "炼金术士在接触到剥制师的装备后，精通用异国原料制作各种神秘的玩意儿和混合物，而且使用的材料更少。");
	text = text.replace(/Has a (.*?) chance of not consuming any crafting component used by you/, "有$1的几率不消耗你使用的任何工艺组件");
	text = text.replace("Unlocks \'Snake Oil\' recipe to earn money by crafting from various low tier components", "解锁“蛇油”配方，通过制作各种低层组件来赚钱");
	text = text.replace("Have at least one of the following backgrounds: Herbalist, Taxidermist, Druid, Alchemist", "在战队中拥有一名草药师、剥制师、德鲁伊或炼金术士");
	text = text.replace(/Crafted (.*?)\/15 items at the taxidermist/, "在剥制师那里制作 $1\/15 件物品");
	text = text.replace("An Alchemist is knowledgeable in crafting all kinds of mysterious contraptions and concoctions from exotic ingredients when given access to taxidermist equipment, and uses less material to do so.", "炼金术士在接触到剥制师的装备后，精通用异国原料制作各种神秘的玩意儿和混合物，而且使用的材料更少。");

//blacksmith_follower.nut
	text = text.replace("Mercenaries are good at getting arms and armor destroyed, but not at maintaining them.", "雇佣兵擅长摧毁武器和盔甲，但不擅长维护它们。");
	text = text.replace("The Blacksmith will take care of this tedious task quickly and efficiently, and can mend even equipment otherwise thought lost.", "铁匠会迅速而有效地处理这项繁琐的工作，甚至可以修理那些被认为丢失的装备。");
	text = text.replace("Repairs all armor, helmets, weapons and shields worn by your men even if they\'re broken or lost because your man died", "修理你手下所有的盔甲、头盔、武器和盾牌，即使它们因为你手下的死亡而破损或丢失");
	text = text.replace(/Increases repair speed by (.*?)/, "修复速度提高$1");
	text = text.replace("Have a mercenary who has taken the Field Repairs perk. Guaranteed on Blacksmiths, Ironmongers, and Crusaders", "拥有一名点出“战地维修”特技的队友，铁匠、五金工和十字军更加有效");
	text = text.replace(/Had (.*?) items repaired at a town\'s smith/, "在镇上的铁匠修理过 $1 件物品");
	text = text.replace("Promoting someone to the Blacksmith role and buying them the needed equipment will take care of this tedious task quickly and efficiently, and can mend even equipment otherwise thought lost.", "将某人晋升为铁匠并为其购买所需的设备将快速有效地完成这项繁琐的任务，甚至可以修复被认为损坏的物品。");
	text = text.replace("Have a mercenary who has taken the Field Repairs perk.", "有一人点了‘战地维修’特技。");

	
	
//bounty_hunter_follower.nut
	text = text.replace("This colorful Bounty Hunter has a pocket full of contracts on the most dangerous individuals.", "这个穿着花哨的赏金猎人口袋里装满了最危险的人的合同。");
	text = text.replace("He knows how to get them from hiding and will pay handsomely for any bounty fulfilled.", "他知道如何找到他们的藏身处，并会为任何完成的悬赏支付丰厚的报酬。");
	text = text.replace("Significantly increases the chance of encountering champions", "显著增加了遇到冠军的机会");
	text = text.replace("Pays between 300 and 750 crowns for every champion slain", "为每一个被杀的冠军支付300到750克朗");
	text = text.replace("Have at least one of the following backgrounds: Manhunter, Witch Hunter, Beast Slayer", "在战队中拥有一名搜捕者、女巫猎人或野兽猎人");
	text = text.replace(/Have (.*?) named or legendary items in your possession/, "拥有 $1 件著名或传奇物品");
	text = text.replace("A well maintained bounty board can keep everyone up to date on which heads they should be taking after a battle.", "一个维护良好的赏金板可以让每个人了解战斗结束后他们应该采取的行动。");

//brigand_follower.nut
	text = text.replace("The Brigand may be old and weak now, but at one point his name was feared across the land.", "这个强盗现在可能又老又弱，但他的名字一度在大陆上都很令人畏惧。");
	text = text.replace("In exchange for a hot meal he happily shares with you what he learns from his contacts about caravans on the road.", "作为一顿热饭的交换，他很高兴地和你分享他从朋友那里学到的关于路上商队的知识。");
	text = text.replace("Makes you see the position of some caravans at all times and even if outside your sight radius", "使你能随时看到一些商队的位置，即使在你的视野之外");
	text = text.replace("Have at least one of the following backgrounds: Raider, Barbarian, Deserter", "在战队中拥有一名掠夺者、野蛮人或逃兵");
	text = text.replace(/Raided (.*?)\/4 caravans/, "掠夺 $1\/4 个商队");
	text = text.replace("The nobles and merchants are sloppy with their security and their underlings are easily intimidated. A well placed bribe, brawl or a set of light fingers can keep you informed on who is taking what where.", "贵族和商人在安全方面很马虎，他们的下属很容易受到恐吓。一次精心安排的贿赂、斗殴或一对轻巧的手指可以让你知道谁在哪里采取了什么行动。");

	
	
	
//cartographer_follower.nut
	text = text.replace("The Cartographer is a man of culture and knowledge, but he also realizes that traveling in the company of well-armed mercenaries is one of the best ways to safely see the world and explore places that few visited before.", "制图师是一个有文化和知识的人，但他也意识到，与全副武装的雇佣兵同行是安全地看世界和探索以前很少有人去过的地方的最佳方式之一。");
	text = text.replace("Pays you between 100 and 400 crowns for every location you discover on your own.", "为你独自发现的每个地点支付100到400克朗。");
	text = text.replace("The further away from civilization, the more you\'re paid.", "离文明越远，你得到的报酬就越多。");
	text = text.replace("Legendary locations pay double.", "传奇地点双倍报酬。");
	text = text.replace("Have at least one of the following backgrounds: Adventurous Noble/Lady, Noble Commander, Philosopher, Historian", "在战队中拥有一名爱冒险的贵族、贵族指挥官、哲学家或历史学家");
	text = text.replace("Discovered a legendary location", "发现一个传奇地点");
	text = text.replace("Learning to read is a rare skill and can take some a lifetime to master. Reading maps on the other head can be a little less taxing on the average mercenary. Giving the best and brightest of the company what they need to draw could prove useful.", "制图是一项罕见的技能，需要花费一生的时间才能掌握。从另一个角度看地图对一般的雇佣兵来说可能会少一些负担。让公司中最优秀、最聪明的人得到他们需要的东西可能会被证明是有用的。");

//cook_follower.nut
	text = text.replace("A good warm meal goes a long way towards healing body and mind.", "一顿热乎乎的好饭对治愈身心大有帮助。");
	text = text.replace("A cook can only do so much with whatever there is to hand in the wilderness, Having the proper equipment to prepare meals makes sure that no provisions go to waste.", "在荒野中，厨师能做的事情只有这么多，拥有合适的设备来准备食物，确保食物不会被浪费。");
	text = text.replace("The Cook makes sure that no provisions go to waste, and provides the men with invigorating meals.", "厨师确保食物不被浪费，并为人们提供令人振奋的饭菜。");
	text = text.replace(/Makes all provisions last (.*?) extra days/, "使所有的食物能多维持$1天");
	
	text = text.replace(/Increases hitpoint healing rate by (.*?)/, "增加$1的生命值治愈速度");
	text = text.replace("Have someone who\'s learned the Camp Cook perk. Guaranteed on Bakers, Fishwives, Cannibals and Butchers, may be rarely found on many others", "拥有一名点出“膳食烹饪”特技的队友，面包师、渔夫、食人族和屠夫更加有效");
	text = text.replace(/Have (.*?) different types of provisions/, "有 $1 种不同型态的食物");

//drill_sergeant_follower.nut
	text = text.replace("The Drill Sergeant was a mercenary once, but an injury ended his career prematurely.", "这位教官曾经是一名雇佣兵，但一次受伤过早地结束了他的职业生涯。");
	text = text.replace("Now he drills discipline into your men and yells a lot to make sure that everyone learns from their mistakes.", "现在他训练你的人遵守纪律，以大喊大叫的方式确保每个人都能从错误中吸取教训。");
	text = text.replace(/Makes your men gain (.*?) more experience at level 1, with (.*?) less at each further level/, "使你的人在1级时获得$1更多的经验，每提高一级就减少$2");
	text = text.replace("Makes men in reserve never lose mood from not taking part in battles", "使位于后备队的人不会因不参加战斗而降低心情");
	text = text.replace("Retired a man with a permanent injury that isn\'t indebted", "让一个受了永久性损伤不是负债者的人退休");
	text = text.replace("Have a Retired Soldier, Swordmaster, Sellsword, or Gladiator with an injury in your company", "在战队中拥有一名退伍军人、剑术大师、雇佣兵或角斗士");
	text = text.replace("Retired a man with a permanent injury", "让一个受了永久性损伤的人退休");
	text = text.replace("Some are born to kill, but others need a little more encouragement and less risk to fully reach their potential, with supervision of course.", "有些人生来就是为了杀人，但另一些人需要更多的鼓励和更少的风险，才能在监督下充分发挥自己的潜力。");
	text = text.replace("Have a Retired Soldier, Swordmaster, Sellsword, or Gladiator with a permanent injury in your company", "在战队中拥有一个永久受伤的退伍军人、剑术大师、雇佣兵或角斗士");

	
	
//lookout_follower.nut
	text = text.replace("Having a quick Lookout with sharp eyes travel in advance of the company can prove invaluable in being aware of dangers and points of interests before others become aware of the company.", "拥有一名行动迅速目光敏锐的观察员在战队前面探路，在其他人察觉到战队之前意识到危险，包括利益地点的发现都是极有用的。");
	text = text.replace(/Increases your sight radius by (.*?)/, "增加你的视野$1");
	text = text.replace("Reveals extended information about footprints", "显示有关足迹的扩展信息");
	text = text.replace("Have someone with the Lookout perk. Guaranteed on Thief, Poacher, Nomad and many others", "拥有一名点出“守望””特技的队友。小偷、偷猎者、游侠和许多许多人更加有效");
	text = text.replace(/Discovered (.*?) locations on your own/, "独自发现 $1 个地点");
	
//minstrel_follower.nut
	text = text.replace("A good song and story play a large part in creating the reputation of a company.", "一首好歌和一个好故事在创造一个战队的声誉方面起着很大的作用。");
	text = text.replace("A place to practice and reflect on these crafts will help to spread the word about your deeds to all ears - willing to hear them or not.", "一个练习和反思这些技巧的地方会帮助你把你的事迹传遍所有人的耳朵－不管你愿意不愿意听。");

	text = text.replace("The Minstrel is a master of these crafts and will help to spread the word about your deeds to all ears - willing to hear them or not.", "吟游诗人是这些手艺的大师，他会帮助你把你的事迹传遍所有人的耳朵－不管你愿意不愿意听。");
	text = text.replace(/Makes you earn (.*?) more renown with every action/, "所有行动都会获得$1更多的声望");

	text = text.replace("Makes tavern rumors more likely to contain useful information", "使酒馆谣言更有可能包含有用的信息");
	text = text.replace("Have someone with the Entice perk. Guaranteed on Minstrels and Troubadours", "拥有一名点出“诱惑”特技的队友，吟游诗人或抒情诗人更加有效。");
	text = text.replace(/Visited (.*?)\/(.*?) settlements/, "访问 $1/\$2 个定居点");

//negotiator_follower.nut
	text = text.replace("The Negotiator is home to noble courts and fancy halls, and not used to travelling with a band of sellswords with muddy boots, but he is an expert on negotiating for the best prices and conditions when it comes to contracts.", "谈判者有高贵的法庭和豪华的大厅，不习惯和一帮穿着泥泞靴子的佣兵一起旅行，但他是谈判合同时争取最佳价格和条件的专家。");
	text = text.replace("Allows for more rounds of contract negotiations with your potential employers before they abort, and without any hit to relations", "在你的潜在雇主中止之前，允许他们与你进行更多轮的合同谈判，而且不会对关系造成任何影响");
	text = text.replace("Greater contract payment if negotiations are successful", "谈判成功后的合同赏金更多");
	text = text.replace("Have someone with the Pacifist perk. Guaranteed on Widow, Inventor, Tailor and many others", "拥有一名点出“和平主义”特技的队友。寡妇、发明家、裁缝和其他许多人更加有效");
	text = text.replace(/Completed (.*?)\/15 contracts/, "完成 $1\/15 个合同");
	text = text.replace("Having a dedicated meeting place where negotiators can talk, barter and trade insults with prominant figures or their lackeys can help in finding work.", "有一个专门的会议场所，谈判者可以在那里与有意向的人物或他们的仆人交谈、贸易和对骂，这有助于找到工作。");
	text = text.replace(/Allows for more rounds of contract negotiations and greater payment with your potential employers before they abort, and with only a (.*?) chance on a hit to relations. Bad relations recover faster/, "在你的潜在雇主终止雇佣关系之前，允许他们进行更多轮的合同谈判，并获得更多的报酬，而且只有$1的几率会对关系造成影响。糟糕的关系恢复得更快");

	
	
//paymaster_follower.nut
	text = text.replace("The Paymaster takes care of all the day-to-day financial and organizational aspects of running a mercenary company, like paying out wages.", "出纳员负责管理雇佣兵战队的所有日常财务和组织方面，比如支付工资。");
	text = text.replace(/Reduces the daily wage of each man by (.*?)/, "每人每日工资减少$1");
	text = text.replace(/Reduces the chance of desertion by (.*?)/, "减少$1的逃兵几率");
	text = text.replace("Prevents men demanding more pay in events", "阻止你的人要求更高报酬的事件出现");
	text = text.replace("Have a mercenary who has taken the Paymaster perk. Guaranteed on Peddlers, Eunuchs and Servants", "拥有一名点出“财务官”特技的队友，小贩、太监和仆人更加有效");
	text = text.replace(/Have a roster of (.*?)\/16 men/, "有 $1\/16 人的名册");
	text = text.replace("Few have the patience to count and fewer still the willpower to weigh and count coins as part of their contract. But the Paymaster is a figure of respect to all those around them.", "很少有人有耐心数数，更没有人有意志力在合同中称硬币和数硬币。但出纳员是一个尊重周围人的形象。");
	text = text.replace("Have a mercenary who has taken the Paymaster perk.", "拥有一名点出“财务官”特技的队友。");

	
//quartermaster_follower.nut
	text = text.replace("With years of experience from traveling with caravans, the Quartermaster is able to squeeze and rotate any piece of gear, luggage or armor into the perfect spot to use space as efficiently as possible.", "凭借多年的商队旅行经验，军需官能够将任何装备、行李或盔甲挤压和旋转到最佳位置，尽可能有效地利用空间。");
	text = text.replace("Increases the amount of ammunition you can carry by 100", "增加你可以携带的弹药量100");
	text = text.replace("Increases the amount of medical supplies and tools you can carry by 50 each", "增加你可以携带的医疗用品和工具数量各50个");
	text = text.replace("Have someone with the Skillful Stacking perk. Guaranteed on Vagabonds, Millers, Donkeys and many others", "拥有一名点出“巧妙堆叠”特技的队友，临时工、磨坊工、驴子和许多其他职业更加有效");
	text = text.replace(/Completed (.*?)\/5 caravan escort contracts/, "完成 $1\/5 次商队护送合同");

//recruiter_follower.nut
	text = text.replace("The Recruiter is a sleazy jawsmith that tricks desperate people into joining a mercenary company to escape their poor lives, only to find their demise.", "招募者是一个肮脏的颌铁匠，欺骗绝望的人加入一个雇佣兵战队，以逃离他们的贫穷生活，结果却最终导致了他们的死亡。");
	text = text.replace("Quite useful for anyone running a mercenary company.", "对任何经营雇佣兵战队的人都很有用。");
	text = text.replace(/Makes you pay (.*?) less up front for hiring new men, and (.*?) less for tryouts/, "让你在雇佣新人时少支付$1，测验费少$2");
	text = text.replace("Makes between 2 and 4 additional men available to recruit in every settlement", "让每个定居点可以招募的新兵额外增加2到4人");
	text = text.replace("Have a mercenary who has taken the Inspiring Presence perk. Guaranteed on Cultists, Pimps, Retired Soldiers and many others.", "拥有一名点出“振奋军心”特技的队友，异教徒、皮条客、退伍军人和许多其他职业更加有效");
	text = text.replace(/Recruited (.*?)\/12 men/, "招募 $1\/12 个人");
	text = text.replace("The deviousness of a pre-filled contract that needs a single signiture can make the labours of arguing about pay a thing of the past. Just simply sign on the line and you are ready to go! Just don\'t let them read the small print.", "一份只需要一个签名的格式合同，让薪酬的争论成为过去。只要在简单签名，一切就搞定了！千万不要让他们读小字。");
	text = text.replace("Have a mercenary who has taken the Inspiring Presence perk.", "拥有一名点出“振奋军心”特技的队友。");
	
//scavenger_follower.nut
	text = text.replace("Whether the son of one of your men or an urchin you took pity on, the Scavenger pulls his weight by collecting bits and pieces from every battlefield.", "无论是你某个手下的儿子，还是你拽进来的流浪儿，拾荒者都会从每一个战场上收集零碎的东西。");
	text = text.replace("Recovers a part of all ammo you use during battle", "回收一部分你在战斗中使用的弹药");
	text = text.replace("Recovers tools and supplies from every armor destroyed by you during battle", "从战斗中被你摧毁的每一件盔甲中回收工具和补给");
	text = text.replace("Have at least one of the following backgrounds: Beggar, Cripple, Refugee, Slave", "在战队中拥有一名乞丐、瘸子、难民或奴隶");
	text = text.replace("Have a heart", "有颗良心");
	text = text.replace("While mundane, the act of taking everything not nailed down after a battle can save a lot of money later down the road. Comes with pliars to open deathgrips.", "虽然这很平常，但在战斗结束后拿走所有没有固定下来的东西可以在以后节省很多钱。带有打开死亡之握的柔韧装置。");
	text = text.replace("Have at least one of the following backgrounds: Beggar, Cripple, Refugee, Slave", "至少有以下背景之一：乞丐、瘸子、难民、奴隶");
	
	//scout_follower.nut
	text = text.replace("The Scout is an expert in finding mountain passes, navigating through treacherous swamps, and guiding anyone safely through the darkest of forests.", "侦察员是寻找山口、穿越险恶沼泽、引导任何人安全穿越最黑暗森林的专家。");
	text = text.replace(/Makes the company travel (.*?) faster on any terrain/, "使战队在任何地形上的旅行速度提高$1");
	text = text.replace("Prevents sickness and accidents due to terrain", "阻止因地形引起的疾病和意外遭遇");
	text = text.replace("Have at least one of the following backgrounds: Wildman/Wildwoman, Hunter, Lumberjack, Ranger, Master Archer", "在战队中拥有一名野人、猎鹿人、伐木工、游侠或弓箭大师");
	text = text.replace(/Won (.*?)\/5 battles against beasts/, "赢得 $1\/5 场对野兽的战斗");
	text = text.replace("The people of the woods and hinterlands swear that the presence of this totem grants good fortune to those around it, somehow preventing sickness and accidents as long as it is in the camp. Sounds like farking nonsense but if it keeps them happy", "森林和腹地的人们发誓，这个图腾的存在会给周围的人带来好运，只要它还在营地，就可以在某种程度上预防疾病和事故。听起来像胡说八道，但能让它们开心");
	text = text.replace(/Reduces the movement penalty of difficult terrain by (.*?)/, "使战队在恶劣地形上的旅行速度提高$1");
	text = text.replace("Have at least one of the following backgrounds: Wildman/Wildwoman, Hunter, Lumberjack, Ranger, Master Archer", "至少有以下背景之一：野人/女野人、猎人、伐木工人、护林员、弓箭大师");

	
//surgeon_follower.nut
	text = text.replace("The Surgeon is a walking tome of anatomical knowledge.", "这位外科医生是解剖学知识的行家。");
	text = text.replace("A mercenary company seems the perfect place both to apply that knowledge in healing, but also to learn more about how the insides of men are made up.", "雇佣兵战队似乎是一个完美的地方，既可以将这些知识应用于治疗，也可以更多地了解人类的内部构造。");
	text = text.replace("Makes every man without a permanent injury guaranteed to survive an otherwise fatal blow", "使每一个没有永久性损伤的人都能在致命的打击中幸存下来");
	text = text.replace("Makes every injury take one less day to heal", "使每一个损伤的治愈时间都减少一天");
	text = text.replace("Have someone with the Field Triage perk. Guaranteed on Monks and Nuns", "拥有一名点出“紧急验伤”特技的队友，僧侣和修女更加有效");
	text = text.replace(/Treated (.*?)\/5 men with injuries at a temple/, "在神殿里治疗 $1\/5 个受损伤的人");
	text = text.replace("Having an area set up and ready to treat the worst injuries could be the hair between life and death for the company. Maybe even yourself...one day.", "设立一个区域并准备好治疗最严重的受伤可能是队伍生死攸关的大事。甚至你自己。。。有一天。");

//trader_follower.nut
	text = text.replace("Southern traders are renowned for their bartering skills.", "南方商人以他们的易货技巧而闻名。");
	text = text.replace("Lucky you that you could convince one such master of haggling to join your company.", "你真幸运，你能说服这样一位讨价还价的高手加入你的战队。");
	text = text.replace("And at such a bargain!", "这么便宜！");
	text = text.replace("Increases the amount of trade goods for sale by 1 for each location that produces them, like salt near salt mines, allowing you to trade at higher volumes", "对于每个生产贸易商品的地点，将贸易商品的销售数量增加1，比如盐矿附近的盐，允许你以更高的交易量进行交易");
	text = text.replace("Have at least one of the following backgrounds: Caravan Hand, Peddler, Trader, Donkey", "在战队中拥有一名商队工人、小贩、商人或驴子");
	text = text.replace(/Sold (.*?)\/25 trade goods/, "销售 $1\/25 件贸易商品");
	text = text.replace("While not common, some companies have special goods stashed away to tell on the road to travellers. These goods are always kept in the most fortified chests the company has to offer, to prevent prying fingers from outside and inside the camp.", "虽然不常见，但一些公司有专门的商品存放在路上告诉旅行者。这些货物总是放在公司提供的最坚固的箱子里，以防营地内外有人用手指窥探。");

	text = text.replace("Camp Cook", "野营烹饪");
	text = text.replace("Entice", "引诱");
	text = text.replace("Skillful Stacking", "熟练整理");
	text = text.replace("Field Triage", "紧急验伤");
	text = text.replace("Lookout", "守望");
	text = text.replace("Pacifist", "和平主义者");
	text = text.replace("Have at least one of the following backgrounds", "至少有下列背景之一");
	return text;
}

var TranslateWorldCampfireScreenMainDialogModule = function(text)
{
	text = text.replace("Manage your retinue of non-combat followers", "管理你的非战斗追随者随从");
	text = text.replace("Retinue", "随从");

	return text;
}

var TranslateWorldTownScreenMainDialogModule = function(text)
{
	text = text.replace("This massive citadel guards a warport and the surrounding trade routes", "这个巨大的城堡守卫着一个海港和周围的贸易路线");
	text = text.replace("A massive citadel towering over the open plains", "高耸在开阔平原上的巨大城堡");
	text = text.replace("A large city thriving on trade and agriculture", "一个以贸易和农业繁荣的大城市");
	text = text.replace("A large city thriving on trade and fine arts", "一个以贸易和艺术品而繁荣的大城市");
	text = text.replace("A large coastal city and trading hub", "沿海大城市和贸易中心");
	text = text.replace("A citadel towering high over the surrounding woods", "高耸于周围树林之上的城堡");
	text = text.replace("A prospering city with its main produce being valuable timber and venison", "以珍贵的木材和鹿肉为主要产品的繁荣城市");
	text = text.replace("A massive stone citadel built into the steep mountains", "一座巨大的石头城堡建在陡峭的山中");
	text = text.replace("This large citadel looks wide over the endless snow", "这座大城堡在无尽的雪上显得很宽");
	text = text.replace("A large city sheltering travelers and traders from snow and cold", "避雪避寒的大城市");
	text = text.replace("A mighty citadel towering above the surrounding steppe", "一座雄伟的城堡耸立在周围草原之上");
	text = text.replace("A large city thriving on trade and fine arts", "以贸易和艺术品为生的大城市");
	text = text.replace("A modest city spread out over dry spots in the swampy area", "一个规模适中的城市在沼泽地区的干旱地区");
	text = text.replace("A large citadel towering high over the surrounding tundra", "高高耸立在周围苔原上的大城堡");
	text = text.replace("A large city and trading hub surrounded by barren tundra", "被荒芜的苔原环绕的大城市和贸易中心");
	text = text.replace("A stone keep that controls a strategically important port and protects nearby trading routes", "一个控制重要战略港口和保护附近贸易路线的石堡");
	text = text.replace("A stone keep surrounded by fertile lands", "一座被沃土包围的石堡");
	text = text.replace("A prospering village surrounded by fertile land", "富饶的土地环绕的繁荣的村庄");
	text = text.replace("A larger spread out village relying on fishing and a little trade", "靠捕鱼和少量贸易扩大的村庄");
	text = text.replace("A mighty stone keep surrounded by woods.", "这座巨大的石头城堡被森林所包围。");
	text = text.replace("A developed village thriving on lumber and game", "以木材和狩猎为生的发达村庄");
	text = text.replace("A stretched out settlement nestled into the surrounding mountains", "一个延伸的定居点依偎在周围的山上");
	text = text.replace("A stone keep that is towering high over the surrounding mountains", "高耸于周围山脉之上的一座石堡");
	text = text.replace("This stone keep shelters a garrison from the snow", "这座石堡为守军挡住了雪");
	text = text.replace("A medium sized village covered in snow throughout most of the year", "全年大部分时间被雪覆盖的中型村庄");
	text = text.replace("A stone keep projecting power over the flat steppe", "一座石堡在平坦的草原上展现它的强大");
	text = text.replace("An established and thriving settlement in the steppe", "在大草原上建立的繁荣的定居点");
	text = text.replace("A stone keep controlling routes through the swamps", "一座石堡一直控制着穿过沼泽的路线");
	text = text.replace("A larger settlement surrounded by foul swamps", "被肮脏的沼泽包围的更大的定居点");
	text = text.replace("A stone keep securing the surrounding tundra", "一座石堡不断地保护着周围的苔原");
	text = text.replace("An established village in the rough tundra", "在崎岖的苔原上建立的村庄");
	text = text.replace("A wooden motte with a bailey towering high over the nearby coastline", "在附近的海岸线上高耸着一个木制城寨");
	text = text.replace("A wooden motte with a bailey overlooking the surrounding fields", "一个木制城寨，可以俯瞰周围的田野");
	text = text.replace("A small farming village living mostly off of the surrounding fertile lands", "主要生活在周围肥沃土地上的小农庄");
	text = text.replace("A small fishing village made up of a few humble huts", "由几个简陋的小屋组成的小渔村");
	text = text.replace("A military strongpoint surrounded by woods", "森林环绕的军事据点");
	text = text.replace("A village living off of lumber and everything the forest offers", "靠木材和森林提供一切生活的村庄");
	text = text.replace("Some huts and small buildings housing workers for the nearby mines", "一些小屋和小建筑为附近的煤矿工人提供住房");
	text = text.replace("A small fortification built in the mountains", "建在山上的小型防御工事");
	text = text.replace("This motte with bailey looks wide over the endless snow", "木制城寨在无尽的雪上显得很宽");
	text = text.replace("Some huts huddled together", "一些小屋挤在一起");
	text = text.replace("A small wooden keep in the dry steppe", "干草原上的小木屋");
	text = text.replace("A small village in the steppe living mainly off of modest trading", "草原上的一个小村庄，主要靠适度的贸易生活");
	text = text.replace("A motte with bailey built on a spot of dry ground", "在干燥的地面上建造的木制城寨");
	text = text.replace("A small and crude settlement in a swampy area", "沼泽地区的小而粗糙的定居点");
	text = text.replace("A wooden motte towering above the tundra", "苔原上高耸着的一个木制城寨");
	text = text.replace("A humble village that managed to survive in the sparse tundra", "在稀疏的苔原中生存下来的简陋村庄");
	text = text.replace("A large and rich city state that thrives on trade at the edge of the desert", "一个富裕的巨大城邦坐落于沙漠的边缘，贸易兴隆");

	return text;
}

var TranslateToolTip1_WorldTownScreenMainDialogModule = function(text)
{
	text = text.replace("This massive citadel guards a warport and the surrounding trade routes. It is a seat of power for nobility and home to a large garrison.", "这座巨大的城堡守卫着一个海港和周围的贸易路线。它是贵族的权力中心，是一个大型驻军的所在地。");
	text = text.replace("A massive citadel towering over the open plains surrounding it. A seat of power to nobles, and housing large armed forces for a firm grip on the region.", "一座巨大的城堡耸立在它周围开阔的平原上。是贵族的权力中心，拥有强大的武装力量来牢牢控制该地区。");
	text = text.replace("A large city surrounded by lush green meadows, orchards and fields. Food stocks are usually filled to the brim.", "被茂盛的绿色草地、果园和田野包围的大城市。储备的食物通常是满的。");
	text = text.replace("A big harbor city relying on trade and fishing, and an important hub for travellers arriving or leaving by ship.", "一个依赖贸易和渔业的大港口城市，也是旅客乘船到达或离开的重要枢纽。");
	text = text.replace("This citadel towers high over the surrounding forests and dominates the region.", "这座城堡高耸于周围的森林之上，主宰着该地区。");
	text = text.replace("A prospering city located close to the forest with its main produce being valuable timber and venison.", "一座繁荣的城市，靠近森林，其主要产品是有价值的木材和鹿肉。");
	text = text.replace("This massive stone citadel is built into the steep mountains. A large number of men are stationed here to hold a firm grip on the land.", "这座巨大的石头城堡建在陡峭的山中。大量的人驻扎在这里牢牢地控制着土地。");
	text = text.replace("This large citadel looks wide over the endless snow and is a stronghold against anything that may come down from the far north. As people flocked to its protection over the years, the many houses and workshops in its vicinity now also grant shelter and supply to travelers, mercenaries and adventurers in the area.", "这座大城堡在无尽的积雪上显得宽阔，是抵御来自遥远北方的任何东西的堡垒。多年来人们蜂拥而至来保护它，附近的许多房屋和车间现在也为该地区的旅行者、雇佣兵和冒险者提供庇护所和补给。");
	text = text.replace("A large city far up north. Traders, travelers and adventurers come here for shelter from snow and storms.", "北方很远的一个大城市。商人、旅行者和冒险者来到这里躲避冰雪和风暴。");
	text = text.replace("This mighty citadel towers high above the surrounding steppe and is the seat of power in the region. It houses a large garrison and offers all kinds of services valuable to travellers and mercenaries.", "这座雄伟的城堡高耸于周围草原之上，是该地区的权力中心。它拥有庞大的驻军，为旅行者和雇佣兵提供各种有价值的服务。");
	text = text.replace("A large city thriving in the southern steppe by trading and producing valuable goods and fine arts.", "一个在南部草原上兴旺发达的大城市，通过贸易和生产有价值的商品和艺术品。");
	text = text.replace("A collection of many smaller settlements spread out over dry spots in the swampy area to form one modestly sized city.", "许多较小的定居点分布在沼泽地区的干旱地区，形成了一个中等规模的城市。");
	text = text.replace("A large citadel towering high over the surrounding tundra and securing the large and open region. Many come here to resupply, make repairs and rest until venturing on.", "一座高大的城堡，高高耸立在周围苔原之上，保护着这片开阔的大区域。许多人来到这里重新补给，修理和休息准备冒险。");
	text = text.replace("Surrounded by barren tundra, this large city has lasted as an important trading hub and home to thinkers and fine arts.", "这座大城市被荒芜的苔原环绕，一直是重要的贸易中心，也是思想家和艺术家的发源地。");
	text = text.replace("This stone keep controls a strategically important sea access and protects nearby trading routes.", "这座石头堡垒控制着具有重要战略意义的海上通道，保护着附近的贸易路线。");
	text = text.replace("A stone keep surrounded by fertile lands and acting as a strongpoint and base of operations in the region.", "一座被沃土包围的石堡，是该地区的一个优势和作战基地。");
	text = text.replace("A prospering village surrounded by fertile land.", "一个被肥沃土地包围的繁荣的村庄。");
	text = text.replace("The market is usually filled with all kinds of fresh food.", "市场上通常摆满了各种新鲜食品。");
	text = text.replace("A larger spread out village relying on fishing and a little trade.", "靠捕鱼和少量贸易扩大的村庄。");
	text = text.replace("This mighty stone keep surrounded by forest acts as a base of operations in the area.", "这座被森林环绕的巨石城堡是该地区的一个军事基地。");
	text = text.replace("An established village close to the forest living mainly from lumber cutting and game.", "一个靠近森林的老村，主要靠伐木和狩猎为生。");
	text = text.replace("A stretched out settlement nestled into the surrounding mountains.", "一个延伸的定居点依偎在周围的山上。");
	text = text.replace("The hammering of pickaxes against stone can be heard from a distance.", "从远处可以听到镐敲打石头的声音。");
	text = text.replace("A stone keep that is towering high over the surrounding mountains. Lookouts on the towers can see approaching troops from miles away.", "高耸于周围山脉之上的一座石堡。塔上的了望台可以看到几英里外的军队正在逼近。");
	text = text.replace("This stone-built keep offers protection both from the cold and any invaders.", "这座石头建造的城堡既能抵御寒冷，也能抵御任何入侵者。");
	text = text.replace("A medium sized village covered in snow throughout most of the year.", "全年大部分时间被雪覆盖的中型村庄。");
	text = text.replace("This stone keep is a strongpoint in the area and grants a good view of the surrounding flat and dry lands.", "这个石堡是该地区的一个战略据点，可以很好地看到周围平坦和干燥的土地。");
	text = text.replace("An established settlement surrounded by the dry and flat lands of the steppe.", "被草原上干燥平坦的土地包围的已建立的定居点。");
	text = text.replace("A stone keep controlling routes through and access to the surrounding swamps and marshes.", "一座石堡控制着通往周围沼泽和湿地的路线。");
	text = text.replace("A somewhat larger settlement spread out across various dry and firm spots in the swamp.", "一个稍大的定居点散布在沼泽地中干燥和坚实的地方。");
	text = text.replace("A stone keep that is the seat of power in the surrounding tundra. It acts as a base of operations for a decently sized garrison.", "一座石堡，它是周围冻土带的权力所在地。它是一个规模可观的驻军的行动基地。");
	text = text.replace("An established village in the rough tundra that is a meeting point for the area.", "在崎岖的苔原上建立的村庄，是该地区的一个交汇点。");
	text = text.replace("A wooden motte with a bailey towering high over the nearby coastline.", "在附近的海岸线上高耸着一个木制城寨。");
	text = text.replace("A wooden motte with a bailey overlooking the surrounding fields.", "木制城寨，可以俯瞰周围的田野。");
	text = text.replace("A small farming village living mostly off of the surrounding fertile lands.", "主要生活在周围肥沃土地上的小农庄。");
	text = text.replace("A small fishing village made up of a few humble huts.", "由几个简陋的小屋组成的小渔村。");
	text = text.replace("Surrounded by forest, this small wooden keep controls the surrounding woodlands.", "这个小木屋被森林环绕，控制着周围的林地。");
	text = text.replace("A village living off of lumber and everything the forest offers.", "靠木材和森林提供一切生活的村庄。");
	text = text.replace("Some huts and small buildings housing workers for the nearby mines.", "一些小屋和小建筑为附近的煤矿工人提供住房。");
	text = text.replace("A small fortification has been built in this mountainous region to act as a base of operations and control the surrounding lands.", "在这片山区修建了一个小型的防御工事，作为作战基地来控制周围土地。");
	text = text.replace("This motte with bailey looks wide over the endless snow, and offers shelter from the cold and warm food to the garrison stationed here.", "木制城寨在无尽的雪上显得很宽，为驻扎在这里的卫戍部队提供了避寒和温暖的食物。");
	text = text.replace("A small group of huts huddled together, defying the harsh snowy winds of the north.", "一小群棚屋挤在一起，抵御着北方刺骨的暴风雪。");
	text = text.replace("This small wooden keep looks wide over the dry steppe and offers shade for weary soldiers.", "这座小木屋在干涸的草原上显得宽阔，为疲惫的士兵提供荫凉。");
	text = text.replace("A small village in the steppe living mainly off of modest trading.", "草原上的一个小村庄，主要靠适度的贸易生活。");
	text = text.replace("Placed on a small bit of solid ground, this motte and baily controls the surrounding lands.", "在一小块坚实的土地上，一个木制城寨控制着周围的土地。");
	text = text.replace("A small settlement in a swampy area.", "沼泽地区的小定居点。");
	text = text.replace("The people living here sure know hardship.", "住在这里的人肯定很艰苦。");
	text = text.replace("In the flat lands of the tundra, this small fortification can be spotted from quite a distance.", "在冻土带的平地上，可以从很远的地方看到这个小小的防御工事。");
	text = text.replace("A humble village that managed to survive in the sparse tundra.", "在稀疏的苔原中生存下来的简陋村庄。");

	return text;
}

var TranslateWorldTownScreenBarberDialogModule = function(text)
{
	text = text.replace("Customize the appearance of your mercenaries at the barber", "在理发店定制队友的外观");
	text = text.replace("Customize the appearance of your men at the barber", "在理发店定制你的人的外表");
	text = text.replace("Barber", "理发店");
	text = text.replace("Hair Color", "发色");
	text = text.replace("Head", "头型");
	text = text.replace("Hair", "发型");
	text = text.replace("Beard", "胡须");
	text = text.replace("Body", "体型");
	text = text.replace("Tattoo", "纹身");

	return text;
}

var TranslateWorldTownScreenHireDialogModule = function(text)
{
//adventurous_noble_background.nut
	text = text.replace("A minor noble", "一位未成年的贵族");
	text = text.replace("As the third in the line of succession", "一位贵族的第三个继承人");
	text = text.replace("A young and brash noble", "一位年轻而傲慢的贵族");
	text = text.replace("A skilled swordsman", "一位熟练的剑客");
	text = text.replace(/(.*?)\'s life at court/, "$1的宫廷生活");
	text = text.replace("had grown stale for him", "对他来说已经不新鲜了");
	text = text.replace("was not exciting enough for him with endless studying of court etiquette and family lineage", "对他来说，没完没了地学习宫廷礼仪和他家族血统另他倍感无聊");
	text = text.replace("felt like wasting the best time of his life", "日复一日的学习让他觉得在浪费生命中最美好的时光");
	text = text.replace("was not half as exciting to him as the tales of adventures, battles, fearsome beasts to vanquish and fair maidens to conquer", "对他来说，战斗、征服可怖的野兽和少女的远比闲在王宫令人兴奋的多");
	text = text.replace("Wearing the family crest proudly", "骄傲地戴着家族徽章");
	text = text.replace("At the encouragement of his brother", "在他哥哥的鼓励下");
	text = text.replace("To the frustration of his mother", "在和母亲大吵一架后");
	text = text.replace("Finally making a decision to change things", "决定了要改变这一切后");
	text = text.replace(/(.*?) rode out to/, "$1 走出了王宫");
	text = text.replace("prove himself", "为了证明自己");
	text = text.replace("make a name for himself", "为了打出一片名声");
	text = text.replace("earn glory on the battlefield", "为了在战场上赢得荣耀");
	text = text.replace("test his skills in battle", "为了测试自己的战斗技巧");
	//text = text.replace("and", "和");
	text = text.replace("live life to its fullest as he imagined it from behind the castle walls", "在城墙后面，尽情享受他想象中的生活");
	text = text.replace("see all the wonders and exotic places of the world", "看遍世界上所有的奇观和异国情调的地方");
	text = text.replace("earn his place in the world", "赢得他在世界上的地位");
	text = text.replace("be knighted for his valor", "因英勇而被封为爵士");
	text = text.replace("become famous and loved in all the known world", "在所有已知的世界中成名并受到喜爱");
	text = text.replace("become infamous and feared in all the known world", "在所有已知的世界中变得恶名昭彰和令人畏惧");

//apprentice_background.nut
	text = text.replace("One enters the world always looking to be the best they can be,", "一个人来到世上总是想尽自己所能去做到最好，");
	text = text.replace("Mastery of an art is prestigious,", "精通一门手艺是会声名远扬的，");
	text = text.replace("Everybody looks up to the best,", "每个人总想做到最好，");
	text = text.replace("but no one gets there in an instant.", "但是没有人能那么容易达到。");
	text = text.replace("so what better way to be the best than to learn underneath one?", "那么有什么方法能比潜心学习成为更好的人呢？");
	text = text.replace("and it\'s no secret most look toward the masters for help.", "这已经不是秘密了，大多数人都在寻求大师的指点和帮助。");
	text = text.replace(/(.*?) thought the same, taking the role of an apprentice in (.*?)\./, "$1 的想法就以学徒的身份呆在 $2。");
	text = text.replace(/Believing this to be true, (.*?) took up an apprenticeship in (.*?)\./, "相信这是真的，$1 以学徒的身份去了 $2。");
	text = text.replace(/When (.*?)\'s college asked for apprentices, (.*?) was the first to sign up\./, "当 $1的学院需要学徒的时候 $2 是第一个报名的。");
	text = text.replace(/Urged by his parents to better his craft, (.*?) looked to start his career as an apprentice\./, "在父母的催促下，还有他想提高自己的手艺，$1 开始了他的学徒生涯。");
	text = text.replace(/Not to be outdone by his overachieving brother, (.*?) began looking for an apprenticeship\./, "为了不被他优秀的兄弟超越，$1 开始了他的学徒生涯。");
	text = text.replace("Unfortunately, his master was poorly chosen: an insane carpenter with a penchant for chopping the neckline instead of the treeline.", "不幸的是，他的主人被选错了：一个疯狂的木匠，喜欢砍断领口而不是树枝。");
	text = text.replace(/Fleeing the impending doom by association, (.*?) has ended up in the company of sellswords\./, "为了逃避即将到来的厄运，$1 最终加入了佣兵团。");
	text = text.replace(/Learning all he could, (.*?) built the greatest work of art possibly ever seen in the field of underwater basket-weaving\./, "他竭尽所能地学习，$1 建造了可能是有史以来在水下篮子编织领域最伟大的艺术作品。");
	text = text.replace("His master, though, was a jealous one.", "可是，他的主人是个嫉妒的人。");
	text = text.replace("Not to be outdone by a pupil, he burned the project to ash and eye-watering fumes.", "为了不被一个学生胜过，他把这个工程烧得灰飞烟灭，焦头烂额。");
	text = text.replace(/It was clear to (.*?): he could learn fast, but perhaps there were better masters to study beneath\./, "$1 很清楚：他学得很快，但也许以后还有更好的大师可以学习。");
	text = text.replace("He had soaked up all there was to learn: masonry, carpentry, blacksmithing, lovemaking.", "他已经把所有要学的东西都学完了：石工、木工、打铁、做爱。");
	text = text.replace("Now he turns his eyes on the martial arts.", "现在他把目光转向了武术。");
	text = text.replace(/While he isn\'t exactly a warrior yet, (.*?) is a fast learner\./, "虽然他还不是一个真正的战士，但 $1 学习速度很快。");

//assassin_southern_background.nut
	text = text.replace(/You wouldn\'t think it at first, but (.*?) like any other man\./, "你一开始不会这么想，但是 $1 和其他人一样。");
	text = text.replace("Ordinary. Just an ordinary man.", "普普通通。只是个普通人。");
	text = text.replace(/(.*?) looks almost like the mold of every man you\'ve ever met put together\./, "$1 看起来几乎和你见过所有人一样。");
	text = text.replace("He has a face you\'d never remember.", "他长着一张你不会记住的脸。");
	text = text.replace(/(.*?) has a gentle smile and demeanor\./, "$1 面带微笑，举止优雅。");
	text = text.replace("He talks to all others as equals, weighing the opinions of wealthy and poor seemingly to measure himself between them.", "他平等地与所有人交谈，权衡富人和穷人的意见，似乎在他们之间衡量自己。");
	text = text.replace(/(.*?) offers nothing with which to garner a second look\./, "$1 没有任何东西可以让你再看一眼。");
	text = text.replace("He is wholly simple, and wholly a man meant to be a part of this world.", "他非常单纯，一个注定要成为这个世界一部分的人。");
	text = text.replace("Of course, this is by design.", "当然，这是被精心策划的。");
	text = text.replace("He is an assassin sent by a guild of trained killers.", "他是一个训练有素的杀手组成的公会派来的刺客。");
	text = text.replace("A scroll he carries suggests, without threat, that you take him under your employ.", "他随身携带的卷轴表明，你可以毫无风险地雇佣他。");
	text = text.replace("This unassuming existence is a trained face for a man who is, in actuality, a trained assassin carrying a one-of-a-kind Qatal dagger from his guild.", "训练有素的脸看上去毫不起眼，然而他实际上是一名随身携带从公会那得到的独一无二的卡塔尔匕首的刺客。");
	text = text.replace("A bland face has a murderous past, though, for the man carries a Qatal dagger given only to the best killers of one of the South\'s guild of assassins.", "平淡无奇的面容却有着充满杀戮的过往，因为这个人随身携带着一把卡塔尔匕首，只给予南方刺客公会最出色的杀手。");
	text = text.replace("But the \'familiar stranger\' face is a put on, intended to hide the fact that he is a man from a guild of assassins sent out for reasons you may never know.", "但是这个“熟悉的陌生人”的面容是一种伪装，目的是为了掩盖他是一个来自刺客公会的人的事实，他被派出的原因你可能永远也无法知晓。");
	text = text.replace(/(.*?) could be standing right next to you, yet feel as though he\'s disappeared into a crowd of two\./, "$1 可能就站在你旁边，你却觉得他好像消失在寥寥数人之中。");
	text = text.replace(/Despite knowing you\'ve never met the man until now, you can\'t help but feel you\'ve seen (.*?) somewhere before\./, "尽管你知道今天之前还未见过这个人，但你还是忍不住觉得你以前在什么地方见过 $1。");
	text = text.replace(/You naturally feel at ease around (.*?), which almost feels like a setup in and of itself, so in turn you force yourself to stay alert around him instead\./, "在 $1 附近你自然而然觉得很自在，这本身就好像计划好得一样，所以反过来你会强迫自己在他身边保持警惕。");

//barbarian_background.nut
	text = text.replace(/(.*?) survived the battle between yourself and his own tribe of warriors\./, "$1 在和他自己部落的战斗中幸存了下来。");
	text = text.replace("He offered himself to your company or to your sword.", "他向你的战队和你的剑宣誓效忠。");
	text = text.replace("Impressed by his bravery, you chose to take him in.", "他的勇敢给你留下了很深的印象，你决定收留他。");
	text = text.replace("A foreign brute, he hardly speaks your native tongue and he is not well liked by the rest of the company.", "他是个外族蛮人，几乎不会说你的母语，战队其他人也不喜欢他。");
	text = text.replace("But if anything can bond two men it is fighting beside one another, killing when it counts, and drinking the night away at the tavern.", "但如果有什么能把两个人联系起来的话，那无疑是并肩战斗，必要时杀人，在酒馆里通宵喝酒。");

//bastard_background.nut
	text = text.replace(/(.*?) was born during a fiery military campaign far away from his father\'s home\./, "$1 出生在远离父亲家的一次激烈的军事行动中。");
	text = text.replace(/(.*?)\'s mother hailed from a pub in (.*?)\. Which is strange, because his father is a married royal in (.*?)\./, "$1的母亲在 $2 的一家酒吧向他寄来了信。这很奇怪，因为他的父亲是个已婚的皇室成员属于 $3.");
	text = text.replace(/With a wife cursed by a witch, (.*?)\'s father gave himself to another woman to \'continue\' the bloodline\./, "由于妻子被女巫诅咒，$1的父亲把自己交给了另一个女人来“延续”血统。");
	text = text.replace(/With the king away so long, (.*?)\'s queen of a mother could hardly resist the temptations of a local servant\./, "国王离开这么久，$1的王后母亲几乎无法抵挡当地仆人的诱惑。");
	text = text.replace(/(.*?) was born nine months after raiders pillaged his parents\' castle\./, "$1 是在掠夺者抢劫他父母的城堡九个月后出生的。");
	text = text.replace("The life of a bastard was not an easy one: the man was constantly hounded by jealous half-brothers.", "一个私生子的生活并不容易：这个人经常被鄙夷他的同父异母兄弟所欺负。");
	text = text.replace("Like some kind of royal leper, the bastard was kept far away from the public eye.", "就像某种皇家麻风病患者一样，这个私生子远离公众视线。");
	text = text.replace(/Thankfully, for much of his life (.*?) knew not that he was a bastard child\./, "谢天谢地，$1 这辈子都不知道自己是个私生子。");
	text = text.replace(/A controversy at birth, (.*?) was only spared abandonment by the omens of a local oracle\./, "出生时的一场争论，$1 被当地一处神谕所抛弃。");
	text = text.replace("Being a royal bastard gave the man a good life, so long as he kept his head low, and his unwanted status even lower.", "作为一个皇室私生子给了他一个美好的生活，只要他保持低着头，并且不在乎自己被别人所议论的身份。");
	text = text.replace("Hatred by both strangers and family steeled the bastard for the eventual difficulties outside his royal upbringing.", "陌生人和家人的仇恨使这位私生子在皇室教养之外最终面临困难。");
	text = text.replace(/Angered by his role in life, (.*?) did attempt a coup to take the throne\./, "他常常对他在生活中所扮演的角色感到愤怒，$1 确实试图发动政变夺取王位。");
	text = text.replace("It did not go far.", "它没有走多远。");
	text = text.replace("He is now banished from every court in the land.", "现在他被驱逐出领土的宫廷。");
	text = text.replace(/When a half-brother pelted him with stones, (.*?) felt little remorse running the sibling through with a sword\./, "当一个同父异母的兄弟向他扔石头时，$1 感到一丝疯狂，随后用剑刺穿了自己的兄弟。");
	text = text.replace("He blamed it on a servant, but quickly left his royal housing thereafter.", "他把这归咎于一个仆人，但很快他就离开了自己的皇家住宅。");
	text = text.replace(/(.*?)\'s father tried to pass him off as legitimate, but when a royal marriage fell through the ensuing scandal of impropriety proved too much\./, "$1 的父亲试图把他当成合法的人，但当皇室婚姻破裂，随之而来的不正当丑闻证明了这一点。");
	text = text.replace("The bastard now roams the land, free of the shackles of controversy.", "这个私生子现在在这片土地上游荡，摆脱了争议的束缚。");
	text = text.replace(/Being the oldest son in line made (.*?) a target for his younger, legitimate brothers\./, "作为长子，他的合法弟弟们把 $1 当成了目标。");
	text = text.replace("It was an easy choice to leave that life of politics and backstabbing.", "离开政治和幕后操纵的生活是一个很容易的选择。");
	text = text.replace(/Found in bed with a half-sister, the scandals in (.*?)\'s life grew far too heavy to stay in the royal courts\./, "在与同父异母的妹妹同床共枕被发现后，$1 生活中的丑闻迫使他最终无法留在王宫内。");
	text = text.replace(/Tired of the trivialities of royal processions, (.*?) only wishes to join a group of men that care not for bloodlines and legitimacy\./, "厌倦了宫廷内的琐事后，$1 只想加入一个不在乎血统和合法性的人。");
	text = text.replace(/When an assassin poisoned his father\'s wine, (.*?) was quickly blamed for the murder\./, "当一个刺客把他父亲的酒下毒后，$1 很快就被认为是谋杀的罪魁祸首。");
	text = text.replace("Escaping an angry mob was only the beginning of an exciting, new life.", "逃离愤怒的暴民只是一个令人兴奋的新生活的开始。");
	text = text.replace(/While he came to love him dearly, (.*?)\'s father knew the royal court was not safe\./, "当他深爱着他时，$1的父亲知道皇室不安全。");
	text = text.replace("He sent the man away to forge a life on his own terms.", "他把他打发走，让他自己过自己的生活。");

//beast_hunter_background.nut
	text = text.replace(/(.*?)\'s past is hardly an extravagant one\./, "$1 的过去不算奢侈。");
	text = text.replace(/(.*?) has been traveling these parts for some time, but not always in his current vocation\./, "$1 已经在这些地方旅行了一段时间，但并非总是他目前的职业。");
	text = text.replace(/Despite his grisly job, (.*?) did not come from an extraordinary life\./, "尽管他的工作很可怕，但 $1 的生活并不是很奇特。");
	text = text.replace(/A long list of defeated beasts and the pelts to prove it misleads one as to (.*?)\'s background\./, "一长串被击败的野兽名单和动物毛皮证明了人们误导了对 $1的理解。");
	text = text.replace("The beast slayer was once a mere hunter, armed with both bow and wisdom.", "野兽杀手曾经只是一个猎人，拥有着聪明的脑子和一把弓。");
	text = text.replace("However, upon discovering a monstrous direwolf in one of his traps he acquired a taste for hunting more dangerous foes.", "然而，当他在一个陷阱里发现了一个可怕的狼人时，他就有了猎杀更危险敌人的嗜好。");
	text = text.replace("When his village kept getting attacked by webknechts, the man took to learning all he could about hunting beasts.", "当他的村庄不断遭到巨型的袭击时，这个人开始尽可能地学习猎杀野兽的知识。");
	text = text.replace("And then doing just that to much success.", "然后就这样成功了。");
	text = text.replace("It\'s said he was a village\'s miller until alps haunted the town whole.", "据说他曾是村里的碾磨工，直到梦魇出没于整个小镇。");
	text = text.replace("Never much of a sleeper himself, he spent nights learning about the monsters until he bettered them.", "他自己从来就不怎么睡觉，他整夜都在学习关于这些怪物的知识，直到他超越了它们。");
	text = text.replace("He served as prey finder for a local lord.", "他为当地的一个领主充当猎物搜寻者。");
	text = text.replace("But when a hunt went awry and into the jaws of an unhold, the man turned to studying beasts and how to slay them.", "但是，打猎出了岔子，在他进入了巨魔的口中险些丧命后，他就开始研究野兽以及如何杀死它们。");
	text = text.replace("A mere lumberjack, the beast slayer came into true being when all his peers were slaughtered at the hands of a schrat, a living tree.", "他只是个伐木工人，当他的所有朋友都被树人那种活着的树的大手杀死之后，他就变成了一位真正的野兽杀手。");
	text = text.replace("He avenged his friends and vowed to learn all he could of monsters.", "他为他的朋友们报了仇，并发誓要尽一切可能去了解怪物。");
	text = text.replace("A former monk, the man turned to studying beasts and swords alike after nachzehrers ravaged his monastery.", "他曾是一名僧侣，在食尸鬼蹂躏了他的修道院后，他转而研究野兽和刀剑。");
	text = text.replace("Times are changing, though, and not even this skilled monstrum hunter can go it alone.", "不过，时代在变，即使是这个熟练的狩猎者也无法独自行动。");
	text = text.replace("He seeks to join a company and kill as many beasts as he can.", "他想加入一个战队，尽可能多的杀死更多的野兽。");
	text = text.replace("The days are uncharacteristically short and the moon blooms bright every night.", "白天异常短暂，月亮每天晚上都格外明亮。");
	text = text.replace("This slayer feels a change in the air, and if he\'s going to fight what\'s coming he\'ll need more than just himself to do it.", "这个杀戮者感觉到空气的变化，如果他要和即将到来的战斗，他需要的不仅仅是他自己。");
	text = text.replace("While not fond of company, the beast slayer wants to kill as many creatures as he can, and he\'ll need the help of some fine brothers to do just that.", "尽管不喜欢战队，但这位野兽杀手想要杀死尽可能多的生物，而他需要一些好兄弟的帮助才能做到这一点。");
	text = text.replace("In a world becoming more dangerous and desperate, the beast slayer seeks coin and company both.", "在这个越来越危险和绝望的世界中，野兽杀手寻求硬币和战队同伴。");
	text = text.replace("A professional journeyman such as this man could be of great use to a mercenary company and you\'ve little doubt he\'ll be diligent in his death dealing.", "像这个人这样的职业老手对一个雇佣兵战队是大有用处的，你毫不怀疑他会勤勉于他的死亡交易。");
	text = text.replace("Unfortunately, the man took an apprentice under his wings only for the kid to be slaughtered by a direwolf.", "不幸的是，这个人曾经把一个徒弟带在他身边，结果这个孩子被狼人杀死了。");
	text = text.replace("The broken beast slayer now seeks sturdier company.", "残破的野兽杀手现在寻找更坚强的战队。");

//beggar_background.nut
	text = text.replace("After losing everything to a fire", "在一场失去了一切的火灾后");
	text = text.replace("After his gambling addiction got the better of him", "在他染上赌瘾后");
	text = text.replace("Framed for a crime he didn\'t commit, and having to pay the constable everything to keep himself out of the dungeons", "他被陷害犯了一个他没有犯的罪行，为了不让自己进地牢，他不得不向警察支付一切费用");
	text = text.replace("A refugee after his village was burned to the ground", "一个村庄被烧成灰烬后的难民");
	text = text.replace("Banished from his home after a violent struggle with his brother", "在和他兄弟发生暴力冲突后被放逐");
	text = text.replace("A man with few talents and no ambition", "一个没有天赋和野心的人");
	text = text.replace("After being released from a lord\'s dungeon where he spent countless years chained to a wall", "他被从一个领主的地牢里释放出来，在那里他被锁在墙上数年");
	text = text.replace("After giving all his worldly possessions to an obscure cult promising salvation of his eternal soul", "在把他所有的财产都给了一个不知名的邪教，希望拯救他永恒的灵魂后");
	text = text.replace("A very intelligent man until a brigand knocked him over the head", "一个非常聪明的人，直到一个强盗打昏了他的头");
	text = text.replace(/(.*?) found himself on the streets,/, "$1 发现自己躺在大街上，");
	text = text.replace(/(.*?) was forced onto the streets,/, "$1 被迫走上街头，");
	text = text.replace("having to beg for bread.", "不得不为面包乞讨");
	text = text.replace("depending on the goodwill of others", "依靠别人的善意");
	text = text.replace("being beaten and resigned to his fate", "被打和听天由命");
	text = text.replace("spending what little coin he had to drink the days away", "花了他仅有的一点硬币就这样喝了几天");
	text = text.replace("digging into the trash of others and scurrying away from lawmen", "挖别人的垃圾和逃离警察");
	text = text.replace("avoiding ruffians and thugs while he begged for crowns", "为了躲避暴徒和流氓而乞讨");
	text = text.replace(/While he seems earnest in becoming a mercenary, there is little doubt that all his time on the street have robbed (.*?) of his best years\./, "虽然他看起来很想成为一名雇佣兵，但毫无疑问，他在街上的所有时间剥夺了 $1 最好的时光。");
	text = text.replace("Years have passed and took a toll on his health by now.", "多年过去了，现在他的健康受到了损害。");
	text = text.replace(/Once a man like (.*?) has spent a few days on the streets, much less a few years, even the very dangerous job of being a sellsword seems like the greenest of pastures\./, "一旦像 $1 这样的人在街上呆了几天，更不用说几年了，即使是一个非常危险的佣兵工作也似乎是最好的差事了。");
	text = text.replace(/Only the gods know what (.*?) has done to survive, but he is a frail man standing before you now\./, "只有神知道 $1 为了生存做了什么，但他现在是一个虚弱的人站在你面前。");
	text = text.replace("At the sight of you he rises with open arms to embrace you, claiming to know you well from years past and many a shared adventure, although your name escapes him at the moment.", "一看到你，他就张开双臂拥抱你，声称多年前就认识你，和你一起经历过很多次冒险，尽管他现在想不起你的名字。");

//bowyer_background.nut
	text = text.replace("With calloused hands and an eye for thin strings,", "手上长满老茧，对细绳有着敏锐的洞察力，");
	text = text.replace("Born to a blacksmith, it\'s definitely somewhat curious that", "出生在一个铁匠家庭，这绝对有点奇怪的是");
	text = text.replace("Picking up his trade from a long lineage of strong-sighted forefathers,", "他继承了远见卓识的祖先的优良手艺");
	text = text.replace(/(.*?) is a fletcher and bowyer\./, "$1 是一名造箭者和弓匠。");
	text = text.replace("Plying his trade for royalty, his career came to an end when a bowstring snapped, cutting off the finger of a promising heir.", "他的职业生涯结束了，一根弓弦折断了，断掉了一个有前途的继承人的手指。");
	text = text.replace("Unfortunately, war destroyed the forests from which he used to draw the finest wood.", "不幸的是，战争摧毁了他用来开采最好木材的森林。");
	text = text.replace("Sadly, he sold a bow to a young boy which led to a horrible, arrow-related accident.", "可悲的是，他把弓箭卖给了一个小男孩，这导致了一次可怕的，与箭有关的事故。");
	text = text.replace("After much debate, he was no longer wanted in town.", "经过多次辩论，他不再在城里被通缉。");
	text = text.replace("But after so many years of making weapons for others, he began to wonder what else there was to life besides wood and string.", "但是，在为他人制造武器这么多年之后，他开始怀疑生活中除了木头和绳子还有什么。");
	text = text.replace(/Now, (.*?) seeks a different path\./, "现在，$1 正在寻找不同的路径。");
	text = text.replace("If he can\'t sell bows, maybe he can use them.", "如果他不能卖弓，也许他可以使用它们。");
	text = text.replace(/Now (.*?) rests in the company of the very men he used to supply\./, "如今 $1 寄人篱下于那些他曾经的生意伙伴。");
	text = text.replace("With his interest in bowmaking gone, can the former bowyer shoot arrows as well as he makes them?", "随着他对弓箭的兴趣消失，这位前弓匠射箭能像他造弓那样好吗？");

//brawler_background.nut
	text = text.replace(/Burly and with churchbells for fists, (.*?) has spent much of the past year sharpening his boxing skills on the grindstone that is his fellow man\./, "魁梧的身材和拳头紧握拳头，$1 在过去一年的大部分时间里都在与他的同伴磨练拳技。");
	text = text.replace(/With a face contorted to the shapes of others\' knuckles, it\'s not hard to realize that (.*?) is a career fighter\./, "一张扭曲成别人指关节形状的脸，不难发现 $1 是职业打手。");
	text = text.replace(/(.*?) loves the drink as much as he does a good fight, a potent combination\./, "$1 喜欢喝酒，就像他喜欢打架一样，这是一种有力的组合。");
	text = text.replace(/A hard upbringing by his father and brothers honed (.*?) into being a temperamental fighter\./, "在父亲和兄弟的艰苦教育下，$1 成为一名勇敢的打手。");
	text = text.replace(/Bullies in (.*?)\'s spriteful youth forged him into a man that prefers to seek out a fight rather than wait for it to come to him\./, "$1 这位顽皮的青年在少年时期就被恶霸们认为他是一个一个喜欢打架而不是等待打架的人。");
	text = text.replace(/(.*?) only ever had one real talent: using his fists to bloody the noses of other men and not going down no matter what\./, "$1 只有一个真正的才华：用拳头去修饰别人的鼻子，无论如何他都不会倒下。");
	text = text.replace(/Growing up, (.*?) wrestled bulls on the family farm\./, "长大后，$1 在农场上与公牛搏斗。");
	text = text.replace("Unfortunately for men, he found time to venture into the cities.", "对男人来说不幸的是，他在城市冒险的时候。");
	text = text.replace("For the past year he has been employed by a local lord, paraded around to fistfight the champions of royalty.", "在过去的一年中，他受雇于当地领主，四处游行，与皇室的拥护者搏斗。");
	text = text.replace("A lover of the bar brawl, the man has apparently been banned from too many taverns to count.", "作为酒吧斗殴的爱好者，此人被无数的酒馆拉入黑名单。");
	text = text.replace(/Gaining notoriety as a fighter in (.*?) meant he had to fight every single proud, boasting, and drunk man who came his way\./, "在 $1 获得拳击手的名声意味着他必须和每一个骄傲、自夸和醉酒的男人战斗。");
	text = text.replace("Although he became an undefeated prizefighter, he was hardly earning enough to get by.", "尽管他成为了不败的冠军战士，但他的收入几乎不足以维持生计。");
	text = text.replace("Fiery in spirit, he\'s always willing to take up fisticuffs.", "精神火热的他，总是乐于接受挑战。");
	text = text.replace("Local fighting rings say he\'s got a mean left hook.", "当地的战斗圈说他是一个卑鄙的左撇子。");
	text = text.replace(/Hearing of greater fights to be had, (.*?) has put down his mitts to take up the more lucrative vocation of being a sellsword\./, "在听到有更好的机会出现时，$1 毫不犹豫的放下了拳套，以从事更有利可图的雇佣兵职业。");
	text = text.replace(/Only one person has bested (.*?): his wife\./, "只有一个人击败了 $1：他的妻子。");
	text = text.replace("After she chided him for being an embarrassment with no ambition, he decided to take up the more \'prestigious\' field of mercenary work.", "在她责备他毫无野心的窘态之后，他决定从事更具“声望”的雇佣兵工作。");
	text = text.replace("Years of martial combat practically destroyed his memory.", "多年的战斗几乎破坏了他的所有记忆。");
	text = text.replace("Some think he mistook a mercenary camp as an item on his shopping list.", "有人认为他把雇佣兵营误当成他的购物清单上的物品。");
	text = text.replace(/Very low on crowns and barely able to open his broken hands to hug his own son much less throw a punch, (.*?) seeks a new career\./, "他戴着很低的王冠，几乎不能张开断了的手拥抱自己的儿子，更不用说挥拳了，于是 $1 开始寻求新职业。");
	text = text.replace("After years of hardship, the promise of regular pay for mercenary work is a tempting offer for him, even though he has little idea of actual warfare.", "经过多年的艰辛，尽管他对真实的战争一无所知，但对他来说，定期支付雇佣兵工资的承诺对他来说是一个诱人的提议。");
	text = text.replace("This man could murder a rock and injure a stone - a good addition to any outfit.", "这个人能用石头伤人、也能杀人－这对任何团队来说都是一个很好的补充。");

//butcher_background.nut
	text = text.replace(/After his father\'s death, (.*?) took over the family butcher shop in (.*?)\./, "在他父亲去世后，$1 接管了家族肉店在 $2。");
	text = text.replace(/Growing up poor, (.*?) quickly learned to kill and strip animals, eventually founding a butcher\'s shop\./, "在贫穷的成长过程中，$1 很快学会了杀戮和剥皮，最终建立了一家肉店。");
	text = text.replace(/With droughts ruining the farmlands, (.*?)\'s butcher shop took off in (.*?)\./, "由于干旱毁坏了农田，$1的肉店开始营业在 $2。");
	text = text.replace(/Always a strange boy, (.*?) took to butchering not only for profit, but for pleasure\./, "总是一个奇怪的男孩，$1 开始屠宰，不仅是为了钱，同时也是为了娱乐。");
	text = text.replace(/Grinning ear to ear, (.*?) never looked so happy as when his shop opened and he got his first order of live pigs in stock\./, "在肉店开业的那一天，$1 笑得合不拢嘴，他从来没有这么高兴过，而且他收到了第一批活猪。");
	text = text.replace(/As a butcher, (.*?) has spent years squishing guts out of dead rabbits and lopping heads off sometimes-dead fish\./, "作为一名屠夫，$1 花了数年时间从死兔子身上取出内脏，有时还砍掉死鱼的头。");
	text = text.replace("But rumors of animal torture eventually drove the cleaver-swinger from his business.", "但是关于他虐待动物这一谣言最终迫使这个从事屠宰多年的屠夫被赶出市场。");
	text = text.replace("Given the terrible rumors of dark arts already going around, it wasn\'t long until people began questioning the source of his meats and drove him out of business.", "鉴于黑魔法的可怕谣言四处流传，不久之后人们就开始质疑他的肉食来源，并将他从市场上赶走。");
	text = text.replace("But killing animals, for one reason or another, didn\'t quite excite him anymore.", "出于这样或那样的原因，杀戮动物不再让他兴奋了。");
	text = text.replace("He sought something new.", "他寻求新的东西。");
	text = text.replace("After a human finger was found in one of his deer wrappings, the man was driven from his business.", "在他的一个鹿皮包裹中被发现有人的手指后，这个人就被赶出了市场。");
	text = text.replace("Some say he most enjoyed butchering for soldiers during the orc invasions and wishes to return to that experience once more.", "有人说他最喜欢在兽人入侵期间为士兵屠宰，并希望再次回到那种经历。");
	text = text.replace("Unfortunately, the war drove through his shop, leaving behind a number of carcasses he wouldn\'t dare butcher.", "不幸的是，战争席卷了他的商店，留下了一些他不敢屠宰的尸体。");
	text = text.replace("Living in a city under siege, he provided meat for the hungry.", "他住在一个被围困的城市里，为饥饿的人提供食物。");
	text = text.replace("When it was found out where that meat came from, he was handed over to the besiegers who, unwittingly, let him live.", "当他们发现肉是从哪里来的后，他就被交给围攻者，而围攻者不知不觉地的让他活了下来。");
	text = text.replace("The man\'s friendliness with poachers caught up with him, ultimately leaving him on the road with a retinue of the local lords\'s men on his tail.", "这名男子对偷猎者的友好态度使他陷入困境，最终他把偷猎者留下，而当时一名贵族的随从就尾随在路上。");
	text = text.replace("Butchering a tiny pig became a scandal when it turned out to be a nobleman\'s pet.", "屠宰一头小猪成了他人生的一件转折点，因为它原来是贵族的宠物。");
	text = text.replace("He fled to save his own bacon.", "它逃走是因为它误以为自己会被做成熏肉。");
	text = text.replace(/Something about blood and guts sits just right with (.*?)\. In that case, welcome to the battlefield\./, "关于血和内脏使 $1 的职业正好吻合。因此，欢迎来到战场。");
	text = text.replace(/(.*?) looks at everything as a potential meat sale with breathing, moving packaging\./, "$1 把所有东西都看作是一种可以呼吸、移动的肉。");
	text = text.replace(/Many are disturbed by (.*?)\'s mere presence and all-too-wide eyes\./, "许多人被 $1的存在和他的眼神所困扰。");
	text = text.replace(/(.*?) is known to bite his tongue and savor the blood\./, "$1 使得大家都知道他会咬他的舌头并品尝鲜血。");
	text = text.replace(/(.*?)\'s ears perk whenever a pig squeals\./, "$1 更有趣的是每当他的耳朵听到猪尖叫时，他就会兴奋起来。");
	text = text.replace("The same thing happens when a man screams. Interesting.", "男人尖叫时也会发生同样的事情。很有趣。");
	text = text.replace(/(.*?)\'s a butcher, but apparently has little interest in actually feeding the outfit\./, "$1 是个屠夫，但很明显他对养活人没什么兴趣。");

//caravan_hand_background.nut
	text = text.replace(/Always the adventurous type, (.*?) was easily drawn to the life of a caravan hand\./, "冒险派 $1 总是会被商队成员的生活所吸引。");
	text = text.replace(/Orphaned by war and pestilence, (.*?) grew up under the wings of a traveling merchant\./, "由于战争和瘟疫而使 $1 成为孤儿后，他在旅行商人的翅膀下成长。");
	text = text.replace(/A caravan hand\'s life is tough, but (.*?) could hardly stand staying in one place for too long\./, "商队成员的生活艰苦，但 $1 很难在一个地方呆太久。");
	text = text.replace(/Though the work is dangerous, being a caravan hand allowed (.*?) to see the world\./, "尽管工作很危险，但作为商队成员可以让 $1 更好的看清这个世界。");
	text = text.replace(/When his family and obligations were destroyed by fire, (.*?) saw no reason not to join a passing caravan\./, "当他的家人和房子被大火烧毁时，$1 没有理由不加入路过的商队。");
	text = text.replace(/Hardy and resolute, (.*?) was the first chosen by a merchant to protect his stock as a caravan hand\./, "$1 这种强悍而坚定的人是商人为了保护自己的货物而优先选择的商队成员。");
	text = text.replace(/Running away from home, it didn\'t long for (.*?) to join and eventually work for a caravan\./, "逃离家乡后，$1 很快就加入并最终为商队工作。");
	text = text.replace("But the trader he worked for turned out to be abusive, nary a whip away from being a slave driver.", "但他之前为之工作的那个商人是个恶棍，一点也不可能成为一个优秀的商队领袖。");
	text = text.replace(/After an intense argument with the woman, (.*?) thought it better to leave before he did something awful\./, "在和那个女人激烈争吵后，$1 认为最好在他做尽坏事之前离开。");
	text = text.replace("One day, goods went missing and the hand was blamed for it, promptly ending his time with the caravan.", "有一天，货物不见了，这位商队成员背起了锅，于是他很快结束了在商队的生活。");
	text = text.replace(/But a caravan needs protection for a reason, and an ambush by brigands proved why\. (.*?) barely made it out alive\./, "但商队需要保护是有原因的，强盗的伏击证明了这一点。$1 勉强活逃了出来。");
	text = text.replace(/But a caravan needs protection for a reason, and an ambush by desert raiders proved why\. (.*?) barely made it out alive\./, "但商队需要保护是有原因的，沙漠掠夺者的伏击证明了这一点。$1 勉强活逃了出来。");
	text = text.replace(/Years on the road went without a hitch until a new caravan master refused to pay (.*?)\. With just one hand the caravanner punched his boss and grabbed his wages\./, "几年的征途一帆风顺，直到一位新的商队老板拒绝支付克朗给 $1。商队成员只用一只手就打翻了老板夺回了他的工资。");
	text = text.replace("He used both legs to run, though.", "不过，他用两条腿逃跑。");
	text = text.replace("Caravans are frequently tense places to be.", "商队经常是个令人神经紧张的地方。");
	text = text.replace("One fateful evening, in a dispute over gambling debts, he stove in the head of another traveler.", "一个决定性的晚上，在一场赌债纠纷中，他惹到了一个人头上。");
	text = text.replace(/Fearing retribution, (.*?) was gone before morning\./, "因为害怕报复，$1 在天亮之前便逃走了。");
	text = text.replace(/Sadly, with the expanding war the caravan\'s profits were marginal\. (.*?) was let go as the merchants retired their wagons\./, "可悲的是，随着战争的扩大，商队的利润微乎其微。随着商人们的载重车退役，$1 也被放弃了。");
	text = text.replace(/After seeing the foul work of beasts on a fellow caravan, it didn\'t take long for (.*?) to figure out his wages didn\'t quite meet the level of threats around him\./, "在看到其他商队的衰落后，没过多久，$1 就发现自己的工资和周围威胁的水平压根不是一个档次的。");
	text = text.replace("But war deprived the caravan of stock and soon its driver took to selling slaves.", "但是战争剥夺了商队的库存，很快它的商队头领就开始买卖奴隶了。");
	text = text.replace(/Appalled, (.*?) freed as many as he could before leaving for good\./, "震惊的是，$1 在离开之前释放了尽可能多的人。");
	text = text.replace("Sadly, his caravan began to sell human chattel.", "可悲的是，他的商队开始出售奴隶。");
	text = text.replace("While the profits were enormous, it garnered the attention of a local militia - and their pitchforks.", "虽然利润巨大，但却引起了当地农民和他们的草叉的注意。");
	text = text.replace(/One ambush later and (.*?) was running for his life\./, "一次伏击之后，$1 逃命了。");
	text = text.replace("Now uncertain of what to do, he seeks any opportunity that might come by.", "现在他不知道该做什么，于是寻找任何可能出现的机会。");
	text = text.replace(/A man like (.*?) is no stranger to danger, making him a good fit for any mercenary group\./, "像 $1 这样的人对危险并不陌生，这使他很适合任何雇佣兵组织。");
	text = text.replace("With his caravan days behind him, working as a sellsword was just another avenue for adventure and profit.", "他的商队时代已经过去了，当佣兵的工作只是另一种冒险和获利的途径。");
	text = text.replace(/In (.*?)\'s mind, being a mercenary is a lot like being a caravanner\. Just better paid\./, "在 $1的心目中，当佣兵很像商队。只是报酬更高。");
	text = text.replace(/Well versed to traveling, (.*?) seems like a natural fit to the tasks already befit for a mercenary\./, "精通旅行的 $1 似乎很适合雇佣兵的任务。");
	text = text.replace(/Years of road travel have molded (.*?) into quite the durable figure\./, "多年行路把 $1 塑造成了结实耐劳的人。");
	text = text.replace("Any group of mercenaries could use more men like him.", "任何一支雇佣军集团都可以雇佣更多像他这样的人。");

//companion_1h_background.nut
	text = text.replace(/(.*?) is not known to be a big talker, but he has every right to be\./, "$1 不是个爱吹牛的家伙，但是他有权这么做。");
	text = text.replace(/He\'s saved the lives of both (.*?) and (.*?)\./, "他曾救过 $1 和 $2.");
	text = text.replace("He once spared you from an orc\'s wicked chain.", "他曾从兽人的邪恶锁链下解救了你。");
	text = text.replace("An assassin would have killed you in a pub were it not for this man.", "如果不是这个人，你已经在酒吧被刺客杀了。");
	text = text.replace(/A misfired crossbow nearly took out your eye - hadn\'t (.*?)\'s shield been there to stop it\./, "要不是 $1的盾牌帮你挡住，一支射歪的弩箭差点了命中了你的眼珠子。");
	text = text.replace("He once pushed two men off a cliff using only his shield and two strong legs.", "他曾经用盾牌和两条强壮的腿把两个人从悬崖上推下来。");
	text = text.replace("He learned how to fight from his father, a vanguard at the Battle of Many Names.", "他从父亲那里学会了如何战斗，他父亲是一位诸多著名战役中的先锋。");
	text = text.replace("Sacrificing his family\'s heirloom - an old shield of wood and studded iron - he saved your life.", "他牺牲了他家的传家宝－一块木头和镶钉铁做的旧盾牌－救了你的命。");
	text = text.replace(/A man of rather consistent heroism, he pulled a drunken (.*?) from a pub fire\./, "他的英雄气概始终如一，一次他从酒吧火灾中救出了一个醉酒的 $1。");
	text = text.replace(/Faced with a horde of goblins, he used his shield and strength to push a hole in their lines, opening the way for (.*?) and (.*?) to kill them all\./, "面对一大群哥布林，他用他的盾牌和力量在他们的防线上开了一个洞，为 $1 和 $2 打开了一条路，将他们全部杀死。");
	text = text.replace("With quick whirls and whips of his shield, the man\'s deflected all manner of mortal danger.", "凭借着回旋腾挪和盾牌挥舞，他躲开了各种危险。");
	text = text.replace(/Although rather quiet, you\'ve found (.*?)\'s place in a shield-wall to be rather indispensable\./, "尽管十分得镇静，你发现 $1在盾墙中的位置无可替代。");

//companion_2h_background.nut
	text = text.replace(/Brooding and at times suicidal, it\'s no surprise that (.*?) is frequently found diving into battle with nothing more than a large two-hander\./, "郁郁寡欢有时又有点自我毁灭倾向，所以看到 $1 经常陷入与高大的双手战士鏖战并不令人惊讶。");
	text = text.replace("Clothed in murderous intent, you once saw him cleave a man in two - top to bottom.", "衣着透着杀气，你曾经看见他把一个人从头到尾一劈两段。");
	text = text.replace("It is said that he once cleaved a warrior orc in two, leaving the trunk of its legs still standing.", "据说他曾经把一个战士半兽人劈成两半，只留下它的后腿立在那儿。");
	text = text.replace("The man is known to ignore the fragility of his own mortality just to end the life of another.", "大伙都知道，他为了解决他人而不在意自己的肉体同样脆弱。");
	text = text.replace("He thrives being in the thick of battle where he can swing his weapons with little regard for safety or accuracy.", "他在激烈的战斗中毫不顾忌安全和精准地挥舞武器，逐渐成长起来。");
	text = text.replace("Supposedly, he once won a jousting tournament, but had to flee after bedding a watching nobleman\'s wife.", "据说，他曾经赢得过一次格斗锦标赛，但在与一位观看比赛的贵族的妻子上床后不得不逃跑。");
	text = text.replace("The man is not a murderer, but he would have made a fine one.", "他不是杀人犯，却胜似一位出色的杀人犯。");
	text = text.replace("Seemingly unstoppable at times, you are glad to have the man on your side.", "有时似乎势不可挡，你很高兴这个男人站在你这边。");
	text = text.replace("In a fit of bloodthirsty rage he once impaled two goblins on one pike.", "他曾在嗜血狂怒之时一根长矛刺穿了两个哥布林。");
	text = text.replace(/A strong brute, you once saw (.*?) kill someone just on his backswing\./, "一只强壮的猛兽，你曾看见 $1 仅仅通过后摆就杀一个人。");
	text = text.replace(/He\'ll use any weapon you give him, but (.*?) has a proclivity towards those that can make calamitous ruin out of a man\'s body\./, "他会使用你给他的任何武器，但是 $1 倾向于那些能毁灭肉体的武器。");

//companion_ranged_background.nut
	text = text.replace(/(.*?) is one of the more talented marksman you\'ve encountered in your travels\./, "$1 是你旅途中遇到的最有天赋的射手之一。");
	text = text.replace("After he saved your life with an arrow into the heart of a would-be assassin, you hired the man on the spot.", "在他用一支箭射中一名刺客的心脏救下你的命后，你立刻雇佣这个人。");
	text = text.replace("Learning of the man was easy - you just had to find the winner of a local shooting competition.", "想要了解这个人很容易，你发现他是当地射箭比赛的获胜者。");
	text = text.replace("He once won an archery contest that had over a hundred participants from all the lands.", "他曾赢过一场有数百来自各地的人参加的的射箭比赛。");
	text = text.replace("It is said that he can split an arrow - mid-flight.", "据说他能在半空中射穿一支箭。");
	text = text.replace("You found the man on a farm where, obviously, you thought his shooting talents were going to waste.", "你在农场里找到了他，很明显他会在那儿浪费了他的射击天赋。");
	text = text.replace("A poacher, a bowyer, an archer, the man\'s skills have gotten plenty of use.", "一个偷猎者、弓匠、弓箭手，这个人的技能得到了充分的利用。");
	text = text.replace("You suspect he readily accepted your offer for mercenary work just to say \'he\'s done it all\'.", "你怀疑他欣然接受了你的雇佣合同，只是为了说“他已经都完成了”。");
	text = text.replace("You once saw him shoot the moon, but that may have been some sort of trick.", "你曾见他挽弓射月，那可能只是某种花招。");
	text = text.replace("A clever bowman, he once loosed two arrows simultaneously to kill a charging set of brigands.", "他是一个聪明的弓箭手，曾经一次射出两支箭杀死一伙冲锋的强盗。");
	text = text.replace(/While he has a fondness for killing from afar, (.*?)\'s no slouch in close-quarters combat\./, "虽然他更喜欢远距离杀戮，但 $1 在近身格斗中也毫不懈怠。");

//converted_cultist_background.nut
	text = text.replace("Who this man once was no longer matters.", "他曾经是谁不再重要。");
	text = text.replace("He now bears the mark of Davkul on his forehead and while his lips do not yet know the words of his newfound religion, they speak of the cult\'s fascination in a familiar tongue.", "现在他头顶达库尔的印记，虽然他的舌头还没捋顺他新发现的宗教词汇，但是却用熟悉的语调谈论邪教的魅力。");
	text = text.replace("Darkness, he says, is coming.", "黑暗，他说，就要来了。");

//cripple_background.nut
	text = text.replace("hobbles toward you like a mangy dog", "像一只肮脏的狗一样蹒跚地向你走来");
	text = text.replace("greets you with a hand missing numerous fingers", "用一只失去无数手指的手向你致意");
	text = text.replace("smiles at you with a toothless grin", "张开没牙的嘴对你笑了笑");
	text = text.replace("carries the slouching posture of a man with a broken back", "像一个腰酸背痛的人那样没精打采");
	text = text.replace("wobbles on two very stiff, possibly even wooden legs", "摇晃着两条僵硬的甚至是木头做的腿");
	text = text.replace("uses a cane to walk toward you", "用手杖向你走来");
	text = text.replace("crawls toward you at first, but then rises to his feet with all the grace of a drunk on church steps", "一开始向你爬来，但后来又爬了起来，像醉汉一样站在教堂的台阶上");
	text = text.replace("has bones that creak and croak with every step", "每走一步骨头都吱吱嘎嘎作响");
	text = text.replace("carries an arm in a sling, and has a cane standing in support for one of his legs", "一只胳膊用吊索吊着，一根手杖支撑着他的一条腿");
	text = text.replace("has a smashed nose and two blackened eyes", "鼻青脸肿的样子");
	text = text.replace("looks like someone tried to scalp and burn him alive", "看起来像有人割了他的头皮要活活烧死的样子");
	text = text.replace("has flesh that smells partly cooked, his eyes wincing with every step he takes toward you", "的部分身体似乎烧焦了，走向你时时刻闪避着目光");
	text = text.replace("is missing two ears, though the holes still hear", "失去了外耳尽管两个洞还能听见");
	text = text.replace("reeks of shit and urine", "闻起来有股屎臭味");
	text = text.replace("is missing one eye, and the other wanders severely", "失去了一只眼睛，另一只眼睛剧烈地游荡着");
	text = text.replace("has two lazy eyes and a crooked, gap-filled smile", "目光懒散带着歪斜漏缝的微笑");
	text = text.replace("He explains that", "他解释道");
	text = text.replace("he was once a mason, but that he was attacked by a madman for trying to replicate his work", "他曾经是一个泥瓦匠，但他被一个疯子袭击，因为他试图复制他的作品");
	text = text.replace("he once donned armor as a knight, but that cruel fate has taken all of that from him", "他曾经是身披盔甲的骑士，但残酷的命运夺走了他所有的一切");
	text = text.replace("once upon a time he was a nobleman, but his poor vocabulary suggests this may be a lie", "从前，他是个贵族，但他贫乏的词汇表明这可能是个谎言");
	text = text.replace("he was a peddler once, but the sale of a lobo-rail ended with him at the mercy of an angry town mob", "他曾经是个小贩，但在一个愤怒的乡村暴徒的摆布下，他丢掉了一条腿");
	text = text.replace("he dabbled in cultism, but when he bailed they punished him for it", "他涉足异教，但当他想脱离时，他们因此惩罚了他");
	text = text.replace("he was once a monk, but", "他曾经是个僧侣，但");
	text = text.replace("cultists attacked his church", "异教徒袭击了他的教堂");
	text = text.replace("a spat with other monks had him severely punished", "与其他僧侣的争吵使他受到了严厉的惩罚");
	text = text.replace("brigands attacked him for crucifying one of their own", "强盗们袭击他，为了把他们当中的一个钉在十字架上");
	text = text.replace("he used to brawl for lords, but a beatdown by other fighters left him crippled", "他过去常为贵族打架，但被其他战士打倒后，他成了残废");
	text = text.replace("he used to wander the land for jousting tournaments, but a bad tourney ended with him horribly crippled", "他过去常在这片土地上游荡，参加角逐，但一场惨烈的比赛以他严重残疾告终");
	text = text.replace("he used to rob graves, but when he got caught a parishioner broke more of his bones than he knew a skeleton even had", "他过去常常盗墓，但当他被抓住时，一个教区居民打断了他的骨头比他所知的骷髅身上的还要多");
	text = text.replace("he dabbled in", "他涉猎过");
	text = text.replace("the arcane arts", "神秘学");
	text = text.replace("necromancy", "亡灵术");
	text = text.replace("but, made obvious by his near-deathly state, that experiment was shortlived", "但是，鉴于他快死的样子，这个实验显然很快就结束了");
	text = text.replace("he was once a successful gambler, but as it turns out not paying back your debts is bad for business - and your bones", "他曾经是一个成功的赌徒，但事实证明，不还债对生意和你的骨头都是有害的");
	text = text.replace("he once sang as a minstrel, but when his voice gave out mid-song a lord had him brutally tortured", "他曾经是一个吟唱歌手，但当他刚唱了一半，一个领主残酷地折磨了他");
	text = text.replace("he used to catch rats for a living, but apparently a giant rat paid him a vengeful visit in the night", "他以前以抓老鼠为生，但很明显，一只大老鼠在夜里报复性地拜访了他");
	text = text.replace("he once served a lord, but after dropping a plate of food he was sent to the dungeons where he was promptly forgotten for years", "他曾经服侍过一位领主，但在打翻了一盘食物后，他被送到地牢，在那里他被遗忘了好几年");
	text = text.replace("he once killed a man, sure, but that he deserved a better fate than the irreversible torture he received as punishment", "他曾经杀过一个人，当然，但他应该得到一个更好的命运，而不是而受到的不可逆转的折磨作为惩罚");
	text = text.replace("he used to hunt witches, but a cruel mistress tricked him into drinking a concoction which crippled his very bones", "他过去常猎杀女巫，但一个残忍的妇人诱使他喝了一种使他骨质受损的混合物");
	text = text.replace("he once deserted an army and, obviously, got caught", "他曾经逃离了一支军队，很明显，他被抓了");
	text = text.replace("he used to juggle for royalty until he accidentally fell down some steps in the middle of a stunt.", "他过去常常为皇室耍花招，直到在一次特技表演中不慎摔下几级台阶。");
	text = text.replace("The steps proved rather edgy against his bones, it seems", "看来，他的骨头摔在台阶上发出刺耳的声音");
	text = text.replace("he was born with a horrific deformity", "他生下来就有可怕的畸形");
	text = text.replace("his father brutally attacked him for not living up to his image", "他父亲因他长得不像自己而残暴地殴打了他");
	text = text.replace("his mother scarred him with endless torture", "他母亲用无尽的折磨使他伤痕累累");
	text = text.replace("his siblings tortured him all his life", "他的兄弟姐妹折磨了他一辈子");
	text = text.replace("The man looks so weak you can almost see his mortal coil flapping in the wind.", "这个人看起来如此虚弱你似乎能看到他的腐朽皮囊在风中摆动。");
	text = text.replace("Hiring him would almost certainly be the man\'s doom. How merciful!", "雇用他几乎肯定是这个人的末日。多仁慈啊！");
	text = text.replace("You don\'t want to be seen as hiring just anybody, but if this guy is a nobody, does that still count as \'anybody\'?", "你不想让别人认为你什么人都雇佣，但如果这个人是个无名小卒，那些人还算“任何人”吗？");
	text = text.replace("You\'ve seen dead people who look better than this man.", "你见过死人都比这个人看起来好点。");
	text = text.replace("This guy is wolf-lunch on two legs.", "这家伙是长着两条腿的狼嘴午餐。");
	text = text.replace("The good news is that if he comes back from the dead he shouldn\'t be too hard to put down a second time.", "好消息是，如果他死而复生，他会很容易再死一次。");
	text = text.replace("Dreams and inanimate objects are more threatening than this poor git.", "梦和无生命的物体都比这个可怜的家伙更具威胁性。");
	text = text.replace("To be honest, you\'d rather hire a child, but apparently people look down on that so here we are instead.", "老实说，你宁愿雇一个孩子，但显然人们看不起这一点，所以我们来了。");
	text = text.replace(/And you thought (.*?) smelled bad\./, "你觉得 $1 的味道很难闻。");
	text = text.replace("Hiring a man such as this would send anyone\'s moral compass spinning.", "雇用这样的人会让人觉得有失道德。");
	text = text.replace("Oh c\'mon, look at him!", "哦，拜托，看看他！");
	text = text.replace(/Are the (.*?) really that in need of warm bodies\?/, "$1 真的需要温暖的尸体吗？");
	text = text.replace("Hiring this man just wouldn\'t be right. Whelp, here goes.", "雇用这个人是不对的。小崽子，来这里。");
	text = text.replace("A pair of crutches has more value than this poor man.", "一副拐杖都比这个可怜的人更有价值。");
	text = text.replace("This man is in such a sorry state he can play dead standing up.", "这个人的状态很糟糕，他能站在那儿装死。");

//crusader_background.nut
	text = text.replace(/(.*?) joined your party during the undead scourge\./, "$1 在亡灵天灾期间加入你的团队。");
	text = text.replace("Little is known about him and he almost never talks save for the occasional grunt while swinging his sword.", "你对他知之甚少，除了挥剑时偶尔发出的咕噜声，他几乎从不说话。");
	text = text.replace("His language seems to be codified into one simple structure: killing creatures of evil.", "他的语言似乎编译成了一个简单的构成：杀死邪恶的生物。");

//cultist_background.nut
	text = text.replace("The man stands with a placard hanging from his neck.", "那人站着，脖子上挂着标语牌。");
	text = text.replace("The man\'s face is wreathed in garish tattoos.", "这个男人的脸上满是花哨的纹身。");
	text = text.replace("He carries a note.", "他带着一张便条。");
	text = text.replace("The man hides his face inside a deep cowl, an islanded tip of a nose all that you see in the darkness.", "你在黑暗中只能看见这个人把他的脸藏在一个深深的斗篷里，一个孤岛状的鼻尖。");
	text = text.replace("He carries a placard around his neck.", "他脖子上挂着标语牌。");
	text = text.replace("Clothed in rags, it is strange the man neither sweats nor shakes in heat or cold.", "奇怪的是，这个人穿着破烂衣服，在炎热或寒冷的天气里既不出汗也不颤抖。");
	text = text.replace("He clutches a scroll as if it protects him from the very elements.", "他抓着一个卷轴，好像它能保护他免受恶劣天气的侵袭。");
	text = text.replace("Scripture is written across his arm in scars, the coda of madness.", "他的手臂上是圣经刻成的疤痕，疯狂的终曲。");
	text = text.replace("The stranger writes in the dirt as quick as a man who has done it a thousand times.", "陌生人在泥土里写字的速度很快仿佛写了上千遍。");
	text = text.replace("His message is clear to see.", "他写得话显而易见。");
	text = text.replace("The man stands with a tome nestled behind a crooked arm.", "那人站着，一本书夹在弯曲的胳膊后面。");
	text = text.replace("He hands it to you.", "他把它交给你。");
	text = text.replace("Opening it, the leather feels like none you\'ve ever touched before.", "打开它，皮革的触感是你从未接触过的。");
	text = text.replace("There is only one passage inside, written over and over.", "里面只有一段话，重复的写着。");
	text = text.replace("It reads: \"Ph\'nglui mglw\'nafh Davkul R\'lyeh wgah\'nagl fhtagn. Nn\'nilgh\'ri, nn\'nglui. Sgn\'wahl sll\'ha ep\'shogg.\" Hmm... quaint.", "它的内容是：“在创世空间拉莱耶中，长眠的达库尔在此静候。他是所有，他是开端。分享所在拯救世人于阴暗。”嗯…有点古怪。");

//daytaler_background.nut
	text = text.replace("Working here and there", "四处工作");
	text = text.replace("With no steady work", "没有稳定的工作");
	text = text.replace("Working on and off", "断断续续地工作");
	text = text.replace("Doing this and that", "做做这做做那");
	text = text.replace("Having learned no craft", "没有学过手艺");
	text = text.replace(/(.*?) is known as a daytaler, someone to ask whenever an extra hand is needed\./, "$1 是个临时工，到处询问哪儿缺个帮手。");
	text = text.replace("Work had been sparse for a while now, so", "工作已经有一段时间了，所以");
	text = text.replace("There was little work to be a had these past weeks, so", "在过去的几周里几乎没有什么工作要做，所以");
	text = text.replace(/(.*?) wanted to do something he had not done before, so/, "$1 想做他以前没做过的事，所以");
	text = text.replace("Despite having no experience in battle, staring too deep into the bottle made him believe that", "尽管他没有战斗经验，但盯着酒瓶子看得太深让他相信");
	text = text.replace(/(.*?) considered the fighting profession one that doesn\'t run out of work these days, so/, "$1 这些天都没有工作，开始考虑战斗的事宜，所以");
	text = text.replace(/(.*?) lost his loved one to sickness, as befalls so many these days, and broke down\./, "$1 的爱人因病逝去，加上这些天发生的各种事情，他最终崩溃了。");
	text = text.replace("After weeks blurred by drinking his sorrows away,", "连续几周的借酒浇愁让他神志模糊，");
	text = text.replace("a travelling mercenary company seemed a good opportunity", "一个四处旅行的雇佣兵战队似乎是个好机会");
	text = text.replace("to stay with for a while", "可以跟着混一段时间");
	text = text.replace("to earn some coin", "可以赚点小硬币");
	text = text.replace("to see a bit of the world", "可以看看这个世界");
	text = text.replace("to clear his head", "可以让他清醒过来");
	text = text.replace("to get him to the next village while filling his pockets", "可以把他带到下一个村庄并且把钱袋子填满");

//deserter_background.nut
	text = text.replace(/(.*?) used to be a common soldier in a lord\'s army, but suffering loss after loss,/, "$1 曾经是一位领主队伍里一名普通士兵，但在一次又一次的失利后，");
	text = text.replace(/Once a watchman on the outskirts of (.*?), (.*?) watched all his friends die to the beasts that lurk there\./, "曾经在 $1 的郊区当个看守人，$2 亲眼看着他所有的朋友都死在潜伏在那里的野兽。");
	text = text.replace("After so many losses", "经历了这么多的损失");
	text = text.replace(/When two lords quarreled over a petty matter of who owned a local pond, (.*?) was conscripted to help settle the matter\./, "当两位领主为谁拥有一个当地池塘的小事争吵时，$1 被征召来帮助解决这件事。");
	text = text.replace("Being a nobody, it was clear his life was of little value.", "作为一个无名小卒，很明显他的生命毫无价值。");
	text = text.replace("One slaughter later,", "一次屠杀之后，");
	text = text.replace(/While employed in a lord\'s professional army, a horrible disease fell upon (.*?) and his comrades\./, "在一个领主的职业军队服役时，一种可怕的疾病降临到了 $1 和他的战友身上。");
	text = text.replace("Fearing its wrath,", "害怕它的愤怒，");
	text = text.replace(/While on a lengthy military campaign, (.*?) felt that there was too much marching and too little spoils to be had\. So/, "在一次漫长的军事行动中，$1 觉得行军太多，战利品太少。所以");
	//text = text.replace("he", "他");
	text = text.replace("stuck his weapons in the ground and walked off.", "把他的武器插在地上离开了。");
	text = text.replace("waited until night to desert his outfit.", "等到了晚上逃离了队伍。");
	text = text.replace("and several others disbanded in protest.", "还有几个人一起散伙了以示抗议。");
	text = text.replace("volunteered for a patrol and, at the first opening, abandoned his soldiering career.", "自愿参加巡逻队，在第一次开始时，他放弃了当兵生涯。");
	text = text.replace(/It is no secret that deserters are widely despised - and (.*?) keeps his head hung low to stay out of others\' eyes\./, "逃兵被普遍鄙视已经不是什么秘密了，$1 一直低着头不让别人看见。");
	text = text.replace(/Most deserters spend the rest of their days avoiding the noose, and (.*?) is no different\./, "大多数逃兵在剩下的日子里都在躲避绞索，$1 也没什么不同。");
	text = text.replace(/Donning the garb of the everyman, (.*?) has, for a time, avoided the deserter\'s punishment\./, "穿上普通人的外衣，$1 一度避免了逃兵的惩罚。");
	text = text.replace(/By total luck, (.*?) has, thus far, gotten away with his crime\./, "幸运的是，至少到目前为止，$1 逃脱了他的罪行。");
	text = text.replace("But now broke and penniless, he seeks a return to his former field.", "但现在囊中羞涩、身无分文，他寻求回到原来的领域。");
	text = text.replace("Perhaps compelled by lawmen closing in, he now finds himself joining another fighting force.", "也许是迫于执法者的逼近，他让自己加入了另一支战斗部队。");
	text = text.replace("Unfortunately, he is not a smart man.", "不幸的是，他不是个聪明人。");
	text = text.replace(/Lacking the imagination to pursue a safer career, (.*?) once again returns to fighting\./, "由于缺乏追求更安全职业的可能性，$1 再次重返战斗。");
	text = text.replace("Feeling guilty about deserting his brothers in the field, he now seeks redemption in fighting for another outfit.", "他对在战场上抛弃自己的兄弟感到内疚，现在他在为另一支军队而战中寻求救赎。");
	text = text.replace("But who is to say he won\'t flee again?", "但谁能说他不会再逃跑呢？");
	text = text.replace("With an empty coin purse from drinking his memories away, he now considers any opportunity to make a living.", "带着一个空硬币袋，醉酒以忘却他的过去，他现在考虑任何谋生的机会。");

//disowned_noble_background.nut
	text = text.replace("A constant disappointment to a delusional father", "对一个妄想的父亲来说一直很失望");
	text = text.replace("A victim of court intrigue involving poison and cake", "涉及毒药与蛋糕的宫廷阴谋的受害者");
	text = text.replace("After openly denouncing his own heritage", "在公开宣布放弃自己的遗产后");
	text = text.replace("After an incestous relationship with his sister came to light", "在他和妹妹的乱伦关系曝光后");
	text = text.replace("After a coup to dispose his older brother failed", "在一次刺杀他哥哥的政变失败后");
	text = text.replace("After pride and hubris had him leading his father\'s army to total defeat", "在骄傲和狂妄导致他带领父亲的军队彻底失败之后");
	text = text.replace("For accidentally killing his oldest brother and heir to the throne on a hunt", "因为在一次狩猎中意外杀死了作为王位继承人的长兄");
	text = text.replace("As a price to be paid for choosing his allies poorly in a war of succession", "作为在爵位继承战争中选错盟友的代价");
	text = text.replace("For attempting to sell captured poachers as slaves", "因为他试图把俘获的偷猎者当作奴隶出售");
	text = text.replace("Caught bedding a fellow nobleman", "被逮到和一个男贵族同床");
	text = text.replace("Discovered to be the head of a child stealing plot that shocked the peasantry", "被发现是震惊农民们的拐卖孩子阴谋的主使");
	text = text.replace("For turning his back on the gods and causing a riot amongst the laymen", "因为背弃了上帝在广大信徒中引起暴乱");
	text = text.replace("Seen with the cultists\' book of Davkul tucked under an arm", "被发现手臂下夹着异教徒的达库尔之书");
	text = text.replace("was disowned and cast away from his family\'s estate, never to return.", "脱离了家族被剥夺了财产，再也没有回去过。");
	text = text.replace("was stripped of his titles and exiled from the land.", "被剥夺了他的头衔并被放逐出了这片土地。");
	text = text.replace("was forcibly removed from his land and told never to return.", "被强行赶出他的土地并被告知永远不要回来。");
	text = text.replace("came to see, by the threat of an executioner\'s axe, that he no longer belonged in the court.", "在刽子手斧头的威胁下，他发现自己不再属于宫廷了。");
	text = text.replace("saw the hangman\'s noose, and only by a clever ploy did he slip it.", "看见了刽子手的绞索通过一个巧妙的计谋才得以逃脱。");
	text = text.replace("was branded with the symbol of shame and cast out from his lands.", "被烙上耻辱的印记，被赶出他的土地。");
	text = text.replace("was believed to have been involved in one too many conspiracies and was removed from the lands.", "被认为参与了太多的阴谋，并被赶出了这片土地。");
	text = text.replace("was seen as being too ambitious, a dangerous trait amongst the nobility.", "被认为过于有野心，在贵族中这是是一种危险的特质。");
	text = text.replace(/(.*?) now seeks to redeem himself and live up to the family name\./, "$1 现在寻求救赎，不辜负家族的名望。");
	text = text.replace("A bit selfish for a mercenary outfit, noble nonetheless.", "尽管还算高贵，但是对于雇佣兵来说有点自私。");
	text = text.replace(/His posture slumped by scandal, (.*?)\'s resistance to difficulties has diminished\./, "他因为流言蜚语耸拉着脑袋，$1 对挫折的抵抗能力减弱了。");
	text = text.replace(/A skilled fighter he may be, but (.*?) rarely talks about anyone but himself\./, "他也许是个技术高超的战士，但 $1 除了他自己很少谈论任何人。");
	text = text.replace(/Though quick with a sword, you get the feeling someone like (.*?) was disowned for a reason\./, "尽管用剑很快，但是你还是能感觉到 $1 这样的人因为某种原因没落了。");
	text = text.replace(/Down on his luck and essentially broke, (.*?) ventures in the field of sellswords\./, "由于运气不好，$1 在雇佣兵的行当里冒险。");
	text = text.replace(/Without title or land, (.*?) seeks to join the sort of men he used to lord over\./, "没有了头衔和土地，$1 寻求加入他曾经统治过的那些人中。");
	text = text.replace(/Well-geared this former noble may be, you do notice that the most used piece of equipment (.*?) has are his boots\./, "这位前贵族装备精良，你一定注意到 $1 最常用的装备是他的靴子。");

//eunuch_background.nut
	text = text.replace(/When (.*?) was just a boy, a local clergymen castrated him so that his voice could carry a higher pitch in the local choir\./, "当 $1 还是个男孩的时候，当地的一个牧师就阉割了他，这样他的声音就可以在当地唱诗班唱出更高的音调。");
	text = text.replace(/When raiders invaded his village, (.*?) fought back only for his cock and balls to be cut from his body as punishment\./, "当掠夺者袭击他的村子时，$1 反抗了结果作为惩罚他的小鸡和蛋蛋被阉割了。");
	text = text.replace(/Accused of a heinous crime in the bed of an unwanting woman, (.*?) had the option of death or living life as a eunuch\./, "被指控在床上对一位不情愿的妇女犯下令人发指的罪行，$1 可以选择死，也可以选择当太监。");
	text = text.replace("You don\'t need physical evidence to know which one he chose.", "不需要多做说明就知道他选择了哪一个。");
	text = text.replace(/Once a monk in training, it is said that (.*?) bedded a woman of another faith\./, "曾经作为一名见习僧侣时，$1 和不同信仰的女性上了床。");
	text = text.replace("He was kicked out of the faith and, in an attempt to regain their sympathies, the man removed the offending \'equipment.\' It appears the faithful did not welcome him back.", "他被逐出了教会，为了重新获得他们的怜悯，他去除了那件“作案工具”。不过似乎教徒并不欢迎他回来。");
	text = text.replace(/As a child, (.*?)\'s drunkard/, "小时候，$1 喝醉酒的");
	text = text.replace("to his cock while he slept", "趁他睡觉时怼到了他的鸡儿上");
	text = text.replace("to his cock as a form of vicious torture", "为了残忍地折磨他怼到了他的鸡儿上");
	text = text.replace(/When (.*?) was traversing the forests not far from (.*?), he was attacked by a wild/, "当 $1 穿越距离 $2 不远的森林时，他遭到了一只野蛮的");
	text = text.replace("which tore great strands of flesh from his body.", "攻击，从他身上撕下一大块肉。");
	text = text.replace("Surviving, he eventually realized the beast had castrated him, too.", "幸免于难，但他最终也意识到野兽阉割了他。");
	text = text.replace(/(.*?) hails from the whorehouses of (.*?) where mutilation of his body was made to satisfy a particular customer\'s requests\./, "$1 来自 $2 的妓院，在那里，为了满足某个顾客的要求，他对自己的身体进行了阉割。");
	text = text.replace("The man was adrift when you ran across him.", "当你碰到这个人时，他正在飘泊。");
	text = text.replace("Now, it just seems like he wants to get away from the world, even if it means joining", "现在，他似乎只是想离开这个世界，即使这意味着加入");
	text = text.replace("Though his plight is not one you would wish upon anyone, he is a rather calm fellow.", "虽然他遭受了你觉得任何人都不该承受的苦难，但他是一个相当冷静的人。");
	text = text.replace("You found the man being bullied by kids when you found him.", "你遇见他是他正被一群孩子们欺负着。");
	text = text.replace("Seeing your sword, he politely asked to join your band of men where one\'s past, or physical deformities, do not matter.", "当他看到了你的剑，他礼貌地请求加入你们当中，因为这里不在意一个人的过去或者身体上的畸形。");
	text = text.replace("He is already used to life\'s struggles, perhaps in a way most men can\'t speak to.", "他也许通过某种常人不足道的方式习惯接受了生活的艰辛。");
	text = text.replace("Surprisingly, the man stands straighter than most.", "令人惊讶的是，这个人比大多数人站得更直。");
	text = text.replace("He looks rather calm and collected for man who has had something so dear to him removed.", "他看上去相当平静，谈及那个把他珍贵的东西拿走的人，他显得相当镇定。");
	text = text.replace("While the horrors of the man\'s past raise your hairs, and lower your nether regions into nearly being tucked, the eunuch seems unbothered by what has happened to him.", "尽管这个人的恐怖过去让你毛骨悚然，让你的下体一紧，但这个太监似乎并没有被他的过去所困扰。");
	text = text.replace("He is a calm, almost passive figure.", "他是一个冷静近乎消极的人。");
	text = text.replace("The man has more stoicism in his movements than most monks you\'ve seen.", "这个人的动作比你见过的大多数僧侣更坚决。");
	text = text.replace("He seems at peace with his calamitous past.", "他似乎对他那不幸的过去感到平和。");
	text = text.replace("No longer able to satiate his carnal desires, the man seems rather pacified and calm.", "再也不能满足自己的肉体欲望，这个人似乎相当安定和冷静。");
	text = text.replace("Resolute, even, and seeing more in the world than what its physical appearances might initially offer.", "无比坚决，甚至，能在世界上看到的比它最初物质外在所能呈现的更多。");

//eunuch_southern_background.nut
	text = text.replace(/When desert raiders invaded his village, (.*?) fought back only for his cock and balls to be cut from his body as punishment\./, "当沙匪袭击他的村子时，$1 反抗了结果作为惩罚他的小鸡和蛋蛋被阉割了。");
	text = text.replace(/When (.*?) was traversing the endless deserts, he was attacked by a wild hyena which tore great strands of flesh from his body\./, "当 $1 穿越无尽的沙漠是，他遭到了一只野蛮的鬣狗攻击，从他身上撕下一大块肉。");

//farmhand_background.nut
	text = text.replace("Tilling the soil is hard work, requiring the blood and sweat of sturdier men.", "开垦土地是一份艰苦的活，需要壮汉们洒下血与汗。");
	text = text.replace("Every farm in the land needs a stable of hardy men to work the fields.", "这片土地上的每一个农场都需要一批强壮的人来耕田。");
	text = text.replace("Man puts his sweat into the earth to feed himself, and he feeds himself to put his sweat into the Earth another day.", "人在土地上挥洒汗水是为了喂饱自己，而他喂饱自己是为了将来有一天把汗水挥洒到土地上。");
	text = text.replace("No matter the weather, a farm needs working.", "不管天气如何，农场都需要工作。");
	text = text.replace("Pigsties, stables, and ungated pens, these are the dreams and nightmares of farming men.", "猪圈、马厩和闭塞的围栏，这些既是农夫的梦想也是他们的噩梦。");
	text = text.replace("While some men earn their keep by killing, others look below their own two feet, wondering what crops the soil may hold.", "有些人靠杀戮来维持生计，而另一些人则看着自己脚下，想知道土壤里能种什么庄稼。");
	text = text.replace("A special breed of men comes out of ranchers and farmers.", "农场主和农夫中有一群独特的人。");
	text = text.replace("Sturdy, resolute, hard-working.", "他们坚强、果断、勤奋。");
	text = text.replace("With food so needed, there\'s little wonder why farmers are the most common sort of man in all the land.", "粮食如此紧缺，难怪农夫是这片土地上最普遍的一类人。");
	text = text.replace("A farmer hates to see his land fertilized in blood, but that\'s becoming more and more common these days.", "一个农夫讨厌看到自己的土地被鲜血浇灌，但这种情况现在越来越普遍了。");
	text = text.replace("In war, farms are hotspots for armies.", "在战争中，农场是军队的热点地区。");
	text = text.replace("Not just to feed themselves, but to recruit from the stable of strong men who work those lands.", "不仅仅是为了获取给养，更是为了从这群在土地上劳作的强壮的家伙里招募新兵。");
	text = text.replace("As cities grow and distance themselves from the hinterland, citizens often forget to whom their full bellies owe gratitude.", "随着城市的发展和与穷乡僻壤越来越疏远，市民们往往忘记了他们能吃饱肚子应该感谢谁。");
	text = text.replace("is a burly, sweat-sculpted farmhand.", "是一个身材魁梧、汗流浃背的农夫。");
	text = text.replace(/hails from the outskirts of (.*?) where he drove ploughs and broke horses\./, "他来自 $1 的郊区，在那里他开着犁，驯着马。");
	text = text.replace("knows a couple kinds of hoes, all of which the farmhand can swing with ease.", "知道好几种锄头，所有这些锄头农夫都能轻松挥动。");
	text = text.replace("grew up on one of the land\'s many farms.", "在这片土地上众多的农场中一所长大。");
	text = text.replace("spent many years harvesting the crops that feed everyone in the land.", "多年来一直忙着收割庄稼，养活了这片土地上的每一个人。");
	text = text.replace("worked as a farmhand for a simple homestead.", "作为农夫耕作着一小片田产。");
	text = text.replace("fell into farming after his boating business went under.", "在他的船舶生意破产后，他开始从事农业。");
	text = text.replace("became a farmhand to help feed his dozen kids and two wives.", "成为一名农夫，帮助养活他一打孩子和两个妻子。");
	text = text.replace("took up farming as a means to a belly-filled end.", "把种田当作填饱肚子的手段。");
	text = text.replace("carries the stocky frame best used for planting, harvesting, and surviving winters.", "长着一副结实的身体，非常适合种植、收割和越冬。");
	text = text.replace("Unfortunately, it didn\'t take war and turmoil long to find his farm.", "不幸的是，没过多久他的农场就遭遇了战争和动乱。");
	text = text.replace("But poor harvests have driven him from the farms.", "但歉收已将他赶出了农场。");
	text = text.replace("Sadly, his farm was one of the first to be attacked during these trying times.", "不幸的是，他的农场是最早在这艰难时期遭到袭击的那一批。");
	text = text.replace("Word of coming violence, however, drove him from the peaceful vocation of farming.", "然而，即将发生暴乱的消息迫使他放弃了和平的农耕职业。");
	text = text.replace("Droughts, poorly-timed as ever, have now driven the man from his work.", "干旱，和以往一样时机不好，现在已经使这个人失业了。");
	text = text.replace("Unpaid for his labor, he eventually abandoned the farm life.", "由于没有得到劳动报酬，他最终放弃了农场生活。");
	text = text.replace("With more crowns than ever in the killing businesses, the man was easily drawn away from his motley crops.", "由于在刀尖上舔血中现在非常的赚钱，这个人很轻易地就放弃了杂七杂八的庄稼。");
	text = text.replace("One day, he realized his strong body had more value chopping heads than milking cows.", "有一天，他意识到自己强壮的身体用来砍脑袋比挤牛奶更有价值。");
	text = text.replace("After raiders pillaged his crops, he\'d had enough, leaving the farm life for good.", "在掠夺者抢劫了他的庄稼后，他受够了一切，永远离开了农场生活。");
	text = text.replace("After the weather soured his harvest, the farmer decided to choose a vocation not wholly based on the whims of Mother Nature.", "天气害他的收成不佳后，农夫决定选择一个不在受制于大地母亲突发奇想的职业。");
	text = text.replace("Word has it he really did sleep with the farmer\'s daughter.", "据说他真的和农夫的女儿睡过觉。");
	text = text.replace("What a surprise he\'s no longer on the farm.", "他却离开了农场，真是让人惊讶。");
	text = text.replace(/Cornfed and barnbred, (.*?) stands before you as fit a man you\'ve ever seen\./, "谷物和玉米喂养长大的 $1 站在你面前，他是你见过的最健康的男人。");
	text = text.replace(/He misses the cows, true, but (.*?) should take to the mercenary\'s tough life with ease\./, "他想念奶牛，不过说实话，$1 应该能轻松地接受雇佣兵的艰苦生活。");
	text = text.replace(/Growing up on a farm gives a man all the nutrients he\'d ever need, and (.*?) certainly took advantage\./, "在农场里长大的可以能让他获得所需要的各种营养，而 $1 当然自然也是如此。");
	text = text.replace(/(.*?) once took a mule kick to the face\./, "$1 有一次被骡子踢到脸上。");
	text = text.replace("Its foot broken, they had to put the animal down.", "驴子的脚断了，他们不得不把那个畜生杀了。");
	text = text.replace(/If men were trees, (.*?) would never fall down\./, "如果人是树，那 $1 就永远不会倒下。");
	text = text.replace("Or something gracious like that.", "或者类似强大的某种东西。");
	text = text.replace(/Don\'t let his simple past fool you, (.*?) could fit right in with any wrestler or fighter\./, "别让他简单的过去愚弄了你，$1 可以和任何摔跤手或拳击手匹敌。");
	text = text.replace(/(.*?) shares a lot in common with draught animals\./, "$1 与驮畜有很多共同之处。");
	text = text.replace("Just point him the right way.", "只要给他指引正确的方向。");
	text = text.replace(/Judging by his size, there must have been a lot of meat in that corn (.*?) spent all his life eating\./, "从他的体型来看，那玉米里肯定有很多肉，$1 他一辈子都是吃那玩意。");
	text = text.replace(/(.*?) is big enough to wring a guy\'s neck like it was a cow\'s udder\./, "$1 强壮到可以像给奶牛挤奶一样拧一个人的脖子。");

//fisherman_background.nut
	text = text.replace(/(.*?) loved the sea and the serenity of fishing alone on the water/, "$1 热爱大海，喜欢独自在水上捕鱼的宁静");
	text = text.replace(/Ironically, (.*?) always hated the water, but became a fisherman after his father and his father\'s father/, "讽刺的是，$1 一直讨厌水，但在父亲和父亲的父亲之后成为了一名渔夫");
	text = text.replace(/(.*?) was a strong and able fisherman/, "$1 是一名强壮能干的渔夫");
	text = text.replace(/(.*?) was content with being a fisherman/, "$1 很乐意做一名渔夫");
	text = text.replace(/(.*?) always had a lucky hand in finding the best fishing grounds and catching the fattest fish/, "$1 总是能幸运地找到最好的渔场并捕捉到最肥美的鱼");
	text = text.replace("As long as there was no storm, he was out there, fishing, day in and out.", "只要没有暴风雨，他就在外面捕鱼，日复一日。");
	text = text.replace("Sadly, his fishing cabin burned to the ground while he was out at sea.", "不幸的是，他出海时，他的渔舱被烧毁了。");
	text = text.replace("But disaster struck as he lost his best friend at sea when a storm suddenly came up, leaving him with a badly damaged boat and no one to sail out with.", "但是，当他在海上失去了他最好的朋友，一场风暴突然袭来，只给他留下了一条严重受损的船，再也无人可以和他一起出海。");
	text = text.replace("But disaster struck when his wife died during childbirth, shattering all what he held dear.", "但是，灾难降临了当他的妻子在难产去世了，粉碎了他所珍视的一切。");
	text = text.replace("After being unable pay his debts for some time, however, his boat was taken from him by a merciless loan shark.", "然而，在无力还债后，他的船被一个无情的高利贷者抢走了。");
	text = text.replace("It was after he strangled his wife in a fit of rage that he lost all interest in the fishing trade.", "正是在他一气之下勒死了妻子之后，他对渔业失去了一切兴趣。");
	text = text.replace("Much to his dismay, for almost a whole summer most of the fish he caught was already dead and rotten inside.", "令他非常沮丧的是，几乎整整一个夏天，他捕到的鱼大部分已经死了，里面都已经腐烂了。");
	text = text.replace(/It was after a priest of the gods told (.*?) that the life of a fisherman was not what they desired of him, but that they wished for him to spill blood in their name, that he would set his eyes on another trade\./, "一位诸神的牧师告诉 $1 一个渔夫的生活并不是诸神所期望的，他们希望他能以他们的名义流血，他将开始另一项行当。");
	text = text.replace("Visiting the tavern one evening, a new opportunity presented itself with the promise of coin for dangerous work.", "有一天晚上，当他来到酒馆时，一个新的机会出现了，他要从事危险的工作来赚取硬币。");

//flagellant_background.nut
	text = text.replace(/The gods pity men, spurring many, not unlike (.*?), to seek their favor\./, "众神怜悯人类，激励着许多人，就像 $1 一样，去寻求他们的青睐。");
	text = text.replace(/Illiterate and born to poverty, (.*?) found refuge in tales of the gods\./, "文盲且出身贫寒，$1 在诸神的传说中找到了慰藉。");
	text = text.replace(/Always a man to devour books, it wasn\'t long until (.*?) discovered texts of the gods\./, "他一向是个爱读书的人，没过多久 $1 就发现了神留下的文字。");
	text = text.replace(/Some say the gods speak to us and, if true, they definitely spoke to (.*?)\./, "有人说神灵会跟我们对话，如果是真的，跟他们说话的人肯定包括 $1。");
	text = text.replace(/With new cults springing up in the wilds, (.*?) returned to the familiarity of the gods\./, "随着新的邪教在荒野中涌现，$1 又恢复了对诸神的熟悉。");
	text = text.replace(/Raised by his firebrand father, (.*?) spent much of his early years nursing wounds from good floggings\./, "$1 是由他煽动叛乱的父亲抚养长大的，他早年大部分时间都在护理因鞭打而造成的伤口。");
	text = text.replace("The gods would approve.", "诸神会证明这一切。");
	text = text.replace("When war came to the land, the gods told him to take part for greater justice.", "当战争降临到这片土地上时，众神告诉他为了更大的正义而参战。");
	text = text.replace(/As cultists spread their vile word like disease on a rat, (.*?) saw fit to take up arms and battle the heresy\./, "当邪教分子像老鼠传播疾病一样传播他们的恶言恶语时，$1 认为应该拿起武器与异端邪说作斗争。");
	text = text.replace(/Straying from his faith, he committed a horrific crime in (.*?) - finding company with a man\./, "他违背了信仰，在 $1 犯下了一桩可怕的罪行－找一个男人作伴。");
	text = text.replace("While flagellating himself nightly, he seeks redemption.", "他每晚鞭打自己，寻求救赎。");
	text = text.replace("Hearing but a mere rumor of a holy place, the pilgrim took up staff and supplies to seek it out.", "朝圣者只听到一个关于圣地的传言，便拿起手杖和物资去寻找。");
	text = text.replace("Now that war has returned to the land, the gods devotee wished to find out why, through prayer and corporeal means.", "现在战争又回到了这片土地上，众神的奉献者希望通过祈祷和肉体鞭笞来找出原因。");
	text = text.replace(/A night spent in a cave revealed to the believer that the gods demanded blood\. (.*?) was not one to refuse their beckoning\./, "一天晚上在一个山洞里诸神的信徒被告知了神需要血。$1 不是拒绝诸神召唤的人。");
	text = text.replace(/After raiders looted the coffers of his church, (.*?)\'s quest was to refill the pure purses\./, "在掠夺者洗劫了他教堂的金库后，$1的任务是重新装满神圣的钱包。");
	text = text.replace(/As the laws of the universe bend to a world-consuming war, a thaumaturge like (.*?) might be useful to have around\./, "当宇宙法则向一场消耗世界的战争屈服时，一个像 $1 这样的旅行者也许会有用。");
	text = text.replace("He carries a whip with glass-barbed leather.", "他拿着一根带玻璃碴的皮鞭。");
	text = text.replace("This is not for your enemies, he states, but for purity. Interesting.", "他说，这不是为了你的敌人，而是为了纯洁。有趣。");
	text = text.replace(/He professes to hate evil, but for a few crowns (.*?) can be persuaded to make anything \'evil\'\./, "他自称痛恨邪恶，但只要有几个克朗，$1 就可以被说服去制造任何“邪恶”的东西。");
	text = text.replace("This man seeks the difficult road, no doubt why he saw fit to join a mercenary band.", "这个人寻求艰难的道路，毫无疑问，他认为加入一个雇佣兵团是合适的。");
	text = text.replace(/If (.*?) had the power, you believe he\'d purge the entire world\./, "如果 $1 有力量，你相信他会净化整个世界。");
	text = text.replace("Thankfully, he is a mere man.", "谢天谢地，他只是个普通人。");
	text = text.replace(/Talks of the gods might be a tad irksome, but (.*?)\'s fiery passion lends itself well to the battlefield\./, "谈论神可能有点烦人，但是 $1的激情很适合战场。");
	text = text.replace("So enamored with the world of the gods, it\'s not much of a surprise that the pilgrim sees the real one filled with enemies.", "对众神的世界如此着迷，朝圣者并不惊讶于看到真实的世界充满了敌人。");

//gambler_background.nut
	text = text.replace(/They say luck is the devil, so just how long can a gambler like (.*?) play with it\?/, "他们说运气是魔鬼，那么像 $1 这样的赌徒能玩多久？");
	text = text.replace(/Everyone gambles, so (.*?) figured why not do it for money\?/, "每个人都在赌博，所以 $1 想为什么不靠赌博来赚点钱？");
	text = text.replace(/Dice, cards, marbles - there are a lot of ways to take a man\'s money, and (.*?) knows all of them\./, "骰子，纸牌，弹珠－有很多方法可以拿走一个人的钱，而 $1 知晓各种方法。");
	text = text.replace(/(.*?)\'s got the eyes of a desert snake - and shaping cards is his rattle\./, "$1 有一双响尾蛇的眼睛，而他搓牌就是他的响尾。");
	text = text.replace(/In a world of life or death, taking risks is (.*?)\'s game\./, "在一个生死攸关的世界里，冒险是 $1的游戏。");
	text = text.replace(/A man like (.*?) sees everything coming, especially the next card in the deck\./, "像 $1 这样的人看到了一切，尤其是牌桌上的下一张牌。");
	text = text.replace("He supported himself by playing cards from town to town, only leaving after he\'d cleaned out their pockets.", "他从一个镇到另一个镇打牌来维持自己的生活，直到他把他们的口袋掏空后才离开。");
	text = text.replace("But it is a mystery as to how a man decides to take up cards as a lifestyle.", "但是，一个人是如何决定选择打牌作为一种生活方式的，这是一个谜。");
	text = text.replace("The constant coming and going of mercenaries made for easy targets - until one sore loser ran him off with a bastard sword.", "雇佣兵的不断来来往往，成了容易下手的目标－直到一个惨败的人用一把破剑把他赶走了。");
	text = text.replace("Orphaned by his own birth, he\'s always scrounged up a living by gambling with others.", "他因自己的出生时就是孤儿，总是靠与别人赌博谋生。");
	text = text.replace("When he was a kid, a trickster\'s cup-game showed him the value in hustling.", "当他还是个孩子的时候，一个魔术师的杯子戏法向他展示了老千的价值。");
	text = text.replace("When his father fell into gambling debts, he figured the best way to pay them back was to become an even hustler himself.", "当他父亲欠下赌债时，他想最好的还债方法就是自己成为一个不折不扣的骗子。");
	text = text.replace(/After taking all their crowns, towns across the land banned (.*?) from hustling in a fit of so-called \'religious revival\.\'/, "在骗走了所有人的克朗后，各地的城镇都禁止 $1 在所谓的“宗教复兴”中骗钱。");
	text = text.replace("Now, the gambler seeks to throw his dice into the wind - as well as the mud, taking rank with any outfit that pays.", "现在，赌徒想把自己的骰子扔进风中－或者扔进泥地里，加入一伙能付钱的武装。");
	text = text.replace("One has to wonder what a cardplayer is doing not playing cards.", "大伙很好奇一个牌手不打牌是为什么。");
	text = text.replace("Then again, maybe it\'s good that he sees your group as a smart gamble.", "不过，也许他认为加入你的团队是一次明智的赌博。");
	text = text.replace("Perhaps years of scamming mercenaries has given him the notion that he could just as easily be one.", "也许多年来的欺骗雇佣兵让他有了这样的想法：他也可以轻而易举地成为其中一员。");
	text = text.replace("Clever and quick-thinking, the cardshaper survives by moving before anyone else does, a skill as useful as any other in this world.", "狡猾且思维敏捷，玩牌的人靠比别人先行一步得以生存，这是世界上最有用的技能。");
	text = text.replace("Ironically, a bad play put him into enormous debt with a baron.", "讽刺的是，一场糟糕的赌局使他欠了一个男爵的巨额债务。");
	text = text.replace("Now he has to find another way to pay it back.", "现在他必须找到另一种方法来偿还。");
	text = text.replace("Wars have sapped most of the fish from his cards games.", "战争他纸牌游戏中的大部分鱼都走了。");
	text = text.replace("Instead of waiting around he figured he\'d just go ahead and follow them.", "他不想在周围等着，而是决定他应该主动跟着他们走。");

//gladiator_background.nut
	text = text.replace("The South is littered with slaves of all sorts, called the indebted for their debt to the Gilder.", "南方到处都是奴隶，他们被称为背负镀金者之债的人。");
	text = text.replace("While most find themselves in the fields, a select few are taken to the fighting pits to battle it out.", "当其中大多数人在田地里劳作时，少数被挑选出来的人被带到角斗场里去战斗。");
	text = text.replace("While northerners do partake in combat tournaments, nothing gets close to the violence and gore of a southern gladiatorial pit.", "北方人参加的战斗锦标赛，比不上南方角斗场的暴力和血腥。");
	text = text.replace("In the South, rich and poor alike enjoy cheering on the gladiators of the fighting pits.", "在南方，富人和穷人都喜欢为角斗场的角斗士欢呼。");
	text = text.replace("Southern gladiatorial pits are filled with indebted and voluntary killers alike.", "南方角斗场里到处都是负债之人和嗜血成性的人。");
	text = text.replace("A bloody house of combat and betting, a gladiatorial pit is the one place in the South one may find rich and poor crowded together.", "一幢充满战斗和赌博的血腥建筑，你会发现角斗场在南方是一个不论贫富齐聚一堂的地方。");
	text = text.replace(/It was from these ranks (.*?) came\./, "$1 是从这群人中走出来的。");
	text = text.replace("He rapidly grew through the ranks and managed to buy his way out of the pits and into whatever \'freedom\' one could find after such a life.", "他迅速地在这伙人中成长，并设法买通了自己的出路，走出了角斗场，进入了某种可以寻求“自由”的生活。");
	text = text.replace(/A crowd-favorite, (.*?)\'s time as a gladiator ended after a \'pardon\' by his wealthy sponsors\./, "深受观众喜欢的 $1 作为角斗士的生涯在他富有的赞助商的“赦免”后结束。");
	text = text.replace("But in early retirement he found his life unfulfilled.", "但在早早退休后，他发现自己的生活并不圆满。");
	text = text.replace(/Successful killers such as (.*?) can buy their way to freedom, though the bloodlust has yet to leave the man\./, "像 $1 这样的成功杀手可以赎买通往自由的道路，尽管嗜血的欲望从未离开他的内心。");
	text = text.replace(/(.*?) was involved in a \'diving\' incident and received a year long ban from the pits\./, "$1 卷入了一次“深潜”事件，并被禁赛一年。");
	text = text.replace(/But gladiators like (.*?) are not just popular with the public, but particularly with the womenfolk\./, "但是像 $1 这样的角斗士不仅受公众欢迎，而且特别受女性欢迎。");
	text = text.replace("A raunchy tryst with a nobleman\'s wife led to the fighter being spirited away under the cover of night lest he be castrated.", "与一位贵族的妻子进行了一次淫荡的幽会后，这名战士在夜色的掩护下溜走了，以免被阉割。");
	text = text.replace(/A pit\'s most popular fighter is usually a blend of murderous handsomeness, and a man such as (.*?) was only the former\./, "最受欢迎的斗士通常是凶残和英俊的混合体，而像 $1 这样的人只是前者。");
	text = text.replace("Dispirited by the lack of fame he thought he had earned, he purchased his freedom and departed the blood sport.", "由于他认为自己赚来的名气不足，他赎买了自己的自由，离开了这项血腥的运动。");
	text = text.replace(/Gladiators usually cross from fighting pit to fighting pit, so a sturdy, well skilled fighter such as (.*?) is rare to find in the wild\./, "角斗士通常从一个角斗场奔波另一个角斗场，所以像 $1 这样强壮、技术高超的战士在场外很少见。");
	text = text.replace("Yet here he stands, albeit with enough scars to make a flagellant blush.", "然而他却站在这里，身上有足够让苦修者脸红的伤疤。");
	text = text.replace(/You\'ve met many a warrior, but rarely one with the particular skillsets of a pit fighter such as (.*?)\. All the clashing in the arenas has made him a clever warrior indeed, and also one with many a scar and injury to match his time there\./, "你遇到过很多战士，但很少有人拥有像 $1 这样的特殊技能。所有在竞技场上的冲突使他成为一个聪明的战士，同时也有很多伤疤和伤痕，与他在那里的时间相匹配。");
	text = text.replace(/There\'s many pairings in this world, and a gladiator with an untouched body is not one of them\. (.*?) is a skilled fighter, but he earned those experiences with his own blood and body\./, "这个世界上有很多组合，一个身体未受伤害的角斗士不是其中之一。$1 是一个熟练的战士，但他是用自己的鲜血和肉体赢得了这些经验。");
	text = text.replace(/An impressive gladiatorial resume such as the one (.*?) brings hints at a man well versed in killing\./, "一份令人印象深刻的角斗士简历，$1 暗示了他是一个精通杀戮的人。");
	text = text.replace("The many scars, however, flatly state that his time in the pits came with an irreversible price of their own.", "然而，许多伤疤却明确地表明，他在角斗场中的时光是让他付出了许多不可逆转的代价的。");
	text = text.replace(/Gladiators such as (.*?) could be the most skilled fighters in all the land, but the fighting pits are full of games and are designed to bring harm to all who partake\./, "像 $1 这样的角斗士可能是世界上最熟练的战士，但是角斗场里到处都是旨在给所有参与者带来伤害的竞赛。");
	text = text.replace("The man is a talented warrior, but he wears the scars and wounds of a career in the arena.", "这个人是一个有才华的战士，但他身上有着竞技场从业者特有的伤疤。");

//gravedigger_background.nut
	text = text.replace(/(.*?) got his start as a gravedigger by burying his baby brother\./, "$1 的掘墓人生涯是从埋葬他的小弟弟开始的。");
	text = text.replace(/Putting a sword to his drunken father\'s neck, (.*?)\'s start in gravedigging was a nasty one\./, "把一把剑插进他喝醉了的父亲的脖子里，$1 开始掘墓是因为一件很糟糕的事。");
	text = text.replace("First he buried the crime, and then he buried the lawmen who came around asking questions.", "他先是埋藏了他的罪行，然后又埋葬了前来问话的执法者。");
	text = text.replace(/After disease swept through (.*?), (.*?) was the last man standing\./, "疾病席卷了 $1，$2 是最后一个活下来的人。");
	text = text.replace("He had to abandon his trade to take up the only thing left: gravedigging.", "他不得不放弃自己的活计，去从事唯一剩下的工作：掘墓人。");
	text = text.replace("There\'s a look in the dead, they say.", "他们说，死人会有一种特殊的表情。");
	text = text.replace(/But there\'s also a look in those who have seen the dead. (.*?) has now spent a life and a half/, "但在那些见过死者的人也有一种特殊的表情。$1 现在花了半辈子的时间");
	text = text.replace("staring at corpses", "盯着尸体");
	text = text.replace("putting bodies in the ground", "把尸体埋入地下");
	text = text.replace("digging graves, big ones and small", "挖大大小小的坟墓");
	text = text.replace("To the gravedigger,", "对掘墓人来说，");
	text = text.replace("death is now but a science", "死亡现在不过是一门手艺");
	text = text.replace("the dead have been better company than the living", "死人比活人是更好的伴侣");
	text = text.replace("earning gold for burying the dead is no new task", "葬死者赚取黄金不是什么新任务");
	text = text.replace(/Employed by a wagon-train, (.*?) traveled the land and dug it up, too/, "受雇于货车商队，$1 走遍了这片土地，也把它挖了个遍。");
	text = text.replace("But one day his burial was suddenly undone.", "但是有一天他的掘墓事业突然没了。");
	text = text.replace("Not by the buzzards or rats, but by the dead itself.", "不是因为秃鹰或老鼠，而是因为死人本身。");
	text = text.replace("Seeing such a sight, and having to bury the same man twice, no doubt compels a swift career change.", "看到这样的景象，再加上不得不埋葬同一个人两次，无疑迫使他迅速改变了职业。");
	text = text.replace("Every gravedigger is eyed with suspicion.", "每一个掘墓人眼里都充满怀疑。");
	text = text.replace("It wasn\'t long until his patrons became accusers and the notion of a horrific crime of undead passion drove him from his work.", "不久，他的主顾就成了原告，一种关于热爱亡灵的恐怖犯罪控告迫使他放弃工作。");
	text = text.replace("The claims are absurd, but you can\'t get a read on his pale face.", "这些指控很荒谬，但你从他苍白的脸上看不出什么。");
	text = text.replace("It\'s like playing cards with the moon.", "就像冷酷的月亮玩牌一样什么都看不出。");
	text = text.replace("By now, the man looks as if he could use a change of scenery.", "现在看来，这个人看起来好像需要换个工作环境。");
	text = text.replace("Just don\'t ask him to bury the casualties.", "只是别让他埋葬伤亡者。");

//graverobber_background.nut
	text = text.replace("What compels a man to disturb those who have passed away?", "是什么让一个人去打扰那些逝去的人？");
	text = text.replace("With rumors of the dead rising again, perhaps it is but forward thinking to go around digging up graves.", "随着死者的传闻再次传播，四处挖掘坟墓也许只是一种前瞻性的思考。");
	text = text.replace("An enemy to moral standards and sensibilities, men who take spades to fresh graves find few allies.", "作为道德标准和人情世故的敌人，拿铁锹盗墓的人几乎找不到盟友。");
	text = text.replace("A coward attacks a man when he\'s down, a graverobber attacks a man when he\'s really down.", "懦夫在一个人倒下的时候攻击他，一个盗墓贼在他真正倒下的时候攻击他。");
	text = text.replace("It is trivial how easily a man abrogated by death can be acquired by mere graverobbing.", "一个已死之人有多么容易被盗墓者劫掠是微不足道的。");
	text = text.replace("When it comes to death, worms take the flesh, and time the bones, but graverobbers get the jewels.", "说到死亡，虫子吃了肉，时间风化了骨头，而盗墓贼得到了珠宝。");
	text = text.replace(/Raised by an abusive mother, (.*?) found happier coordinance with the dead than the living\./, "被虐待他的母亲带大，$1 发现与死者的相处比与活着的人更快乐。");
	text = text.replace(/After many lonely nights in hermitry, (.*?) is said to have taken up dancing with the dead\./, "据说，隐居着度过了许多孤独的夜晚后，$1 开始与死者共舞。");
	text = text.replace(/(.*?) romanced beneath the stars, but pale and cold describes more than just the night sky\./, "$1 在星空下冒险，但苍白和寒冷描述的不仅仅是夜空。");
	text = text.replace(/For entertainment in a boring life, (.*?) is known to visit the murky gastines of graveyards\./, "为了在无聊的生活中找点乐子，据说 $1 会去参观阴暗的墓地。");
	text = text.replace(/Swindled by a salesman, (.*?) found himself digging up graves for loot\./, "被一个商人骗了，$1 发现自己得靠挖坟墓以求战利品。");
	text = text.replace("So the story goes, anyway.", "不管怎样，故事是这样的。");
	text = text.replace(/Once a fine jeweler, dementia drove (.*?) into crafting a very different style of attire\./, "曾经有一个优秀的珠宝商，他让 $1 打造了一套非常独特的服装。");
	text = text.replace("A toothy necklace chatters at you as he explains.", "在他向你解释的时候一条牙齿做成项链在吱吱作响。");
	text = text.replace("The deviancies of such a man may know no bounds, but his for-now warm body could be of use.", "这样一个人的越轨行为也许是毫无底线的，但他目前温暖的身体还是有用处的。");
	text = text.replace("He\'s not right in the head, but maybe he\'s right with a sword in hand. Maybe.", "他脑袋不对劲，但也许他擅长用剑。也许吧。");
	text = text.replace("Disturbing as he might be, desperate times call for desperate recruits.", "尽管他可能会感到不安，但绝望的时刻需要绝望的新兵。");
	text = text.replace("He wears a plain necklace with a subtle offwhite color best described as \'bone\'.", "他戴着一条朴素的项链，淡淡的灰白色，准确的说改称为“骨头”。");
	text = text.replace(/Driven away by an especially mad mob, (.*?) is one of many outcasts to venture into the world of mercenaries\./, "被一个相当疯狂的民众驱逐的 $1 成为了许多被驱逐到雇佣兵世界的人中的一员。");
	text = text.replace("The man is quiet, but you can\'t shut him up around a graveyard.", "这个人很安静，但你不能把他关在墓地附近。");
	text = text.replace("Hopefully he likes putting cold bodies into graves as much as he likes digging them up.", "希望他喜欢把冰冷的尸体埋进坟墓，就像他喜欢把他们挖出来一样。");

//hedge_knight_background.nut
	text = text.replace("Some men are born to be feared.", "有些人生来就令人畏惧。");
	text = text.replace(/Well over six feet tall, (.*?)\'s stature alone is a threatening one\./, "身高六英尺多，$1 光是身材就足以让人望而生畏。");
	text = text.replace(/(.*?)\'s shadow casts over smaller men - and they seem to only further shrink when he walks by\./, "$1的影子笼罩在身材矮小的男人身上－当他走过时，他们似乎只会进一步矮小。");
	text = text.replace(/Standing amongst men like a bear in a suit of armor, (.*?) earns plenty of double-takes\./, "像身披战甲的熊一样站在人群当中，$1 赚取了许多份双倍工资。");
	text = text.replace(/Years of brutal combat with his equally huge brothers left (.*?) a scarred and scary figure\./, "与他同样身形魁梧的兄弟们多年的残酷战斗给 $1 留下了一个伤痕累累的可怕形象。");
	text = text.replace("The hedge knight has spent many seasons taking his prized horse to jousting tournaments.", "这位雇佣骑士花了很多年时间带着他那匹珍贵的马参加比赛。");
	text = text.replace("Unfortunately, a polearm crowned his mount, leaving him without a ride.", "不幸的是，一杆长柄让他的坐骑挂了彩，让他失去了他的坐骑。");
	text = text.replace("A mercenary in the company of himself, the hedge knight wandered for years, doing battle for those who offered the most crowns.", "作为一个雇佣兵，雇佣骑士徘徊多年，为那些提供最多克朗的人战斗。");
	text = text.replace("When he cleaved five men with one swing, three of which were on his side, the hedge knight was banned from service in every army in the land.", "当他用一记环劈砍下五个人时，其中三个是他这边的，雇佣骑士被禁止在这片土地上的任何一支军队服役。");
	text = text.replace("Ordered to kill a lord\'s enemies, the hedge knight kicked in the door of a family and slaughtered them all with his bare hands.", "为了杀死一个领主的敌人，雇佣骑士踢开了一户人家的门，并徒手杀了他们。");
	text = text.replace(/When the lord refused to pay, (.*?) killed him, too\./, "当领主拒绝付钱时，$1 也杀了他。");
	text = text.replace("The hedge knight has spent many nights sleeping peacefully beneath a pale moon - and just as many days killing ruthlessly beneath a shining sun.", "雇佣骑士曾经在苍白的月光下安详地睡过很多晚，也同样在灿烂的阳光下无情地杀了很多人。");
	text = text.replace("Always on the hunt for more crowns, the company of sellswords seemed like a good fit.", "总是在寻找更多的克朗，与雇佣兵战队为伍似乎很合适。");
	text = text.replace(/Too terrifying to be employed for long, (.*?) seeks the company of men who will not piss themselves when he grabs a weapon\./, "太骇人了以至于没有人敢长期雇佣他，$1 找的是那些在他拿起武器时不会被吓尿裤子的队友。");
	text = text.replace(/Tired of killing jousters and lords, as well as women and children, (.*?) sees mercenary work as something of a vacation\./, "厌倦了杀戮权贵和贵族，以及妇女和儿童，$1 认为雇佣兵工作是一种休假。");
	text = text.replace(/War has apparently gotten in the way of (.*?)\'s jousting career\./, "战争显然阻碍了 $1的骑枪对决生涯。");
	text = text.replace("He seeks to amend that problem.", "他试图修正这个问题。");

//historian_background.nut
	text = text.replace(/Always a voracious reader, (.*?)\'s early life consisted of long nights in (.*?)\'s library\./, "$1的早年生活就是在 $2的图书馆里度过漫长的夜晚，他一直是贪婪的读者。");
	text = text.replace(/Bullied by his stronger peers, a young (.*?) retreated into the world of books\./, "年幼的 $1 在更强壮的同龄人的霸凌下躲进了书的世界里。");
	text = text.replace(/Looking for where man\'s past truly lies, (.*?) read books and studied human nature\./, "寻找人类过去的真实所在，$1 阅读书籍，研究人性。");
	text = text.replace(/With so many changes in the world, (.*?) decided to help record them\./, "由于世界上发生了这么多变化，$1 决定帮助记录这些变化。");
	text = text.replace(/A quick-learner with a penchant for a good read, (.*?) sought to envision the world on paper for others\./, "一个喜欢阅读的快速学习者，$1 试图在纸上为他人想象这个世界。");
	text = text.replace(/A scholar of (.*?)\'s small college, (.*?) records the histories of the world for future generations\./, "一位来自 $1的小学院的学者，$2 为后代记录世界的历史。");
	text = text.replace(/Chilled by dark events in the world, (.*?) stopped studying plants and began recording human history\./, "由于受到世界上黑暗事件的影响，$1 停止了对植物的研究，开始记录人类历史。");
	text = text.replace("A proper historian seeks the closest sources he can get, which has brought the man to the company of mercenaries.", "一个真正的历史学家寻找他能得到的最近的原始资料，这使他加入了雇佣兵的行列。");
	text = text.replace("After brigands ruined his written works, the man strapped on his boots to carve out new research - personally.", "在匪贼们毁了他的作品后，这个人就穿上靴子，亲自开始新的研究。");
	text = text.replace("When his professor said his research was rubbish, the historian went out into the world to prove him wrong.", "当他的教授说他的研究是垃圾时，这位历史学家走向世界来证明他错了。");
	text = text.replace("Accused of plagiarism, the historian was kicked out of academia.", "这位历史学家被指控剽窃，被赶出学术界。");
	text = text.replace("He seeks redemption in the world of what he studied: war.", "他在他所研究的世界里寻求救赎：战争。");
	text = text.replace("Using his position in academia to bed women, eventual scandals and controversies drove the historian from his field, and left him penniless and ready to take on any job.", "利用他在学术界的地位去和女人们上床，最终丑闻和争议把这位历史学家赶出了自己的领域，使他身无分文，准备接受任何其他工作。");
	text = text.replace("Bored with reading about adventurers, the historian figured he\'d suit up to fashion himself a closer look at the real thing.", "这位历史学家厌倦了读有关冒险者的书，他觉得应该把自己武装起来以便能更近距离地观察些真东西。");
	text = text.replace("With so many mercenary bands floating around, the historian sought to attach himself for some real-life studying.", "由于有这么多的雇佣兵团四处游荡，这位历史学家试图投身于一些现实生活中的研究。");
	text = text.replace(/(.*?) has little in common with actual soldiers, but his imaginative mind fancies a good battle nonetheless\./, "$1 与真正的士兵没有什么共同之处，但他富有想象力的头脑仍然幻想着一场精彩的战斗。");
	text = text.replace(/While (.*?) spent all his life writing, he spent exactly none of it fighting\. Until now\./, "虽然 $1 毕生都在写作，他从来没有花时间战斗过。直到如今。");
	text = text.replace(/(.*?) has the itch to record your outfit\'s travels\./, "$1 渴望记录你的行踪。");
	text = text.replace("He can help by grabbing a sword and suiting up.", "他可以帮忙拿着剑或者穿脱盔甲。");
	text = text.replace(/A bag of books is hefted over (.*?)\'s shoulder\./, "一袋书扛在 $1的肩上。");
	text = text.replace("You suggest a flail as replacement.", "你建议用链枷代替。");
	text = text.replace("It\'s similar, but pointier and stabbier.", "很相似，但更尖锐更刺耳。");
	text = text.replace(/(.*?) is frequently found scribbling notes as he still sees the world with a researcher\'s eye\./, "$1 经常被发现乱写笔记，因为他仍然用研究者的眼光看世界。");
	text = text.replace(/(.*?) comes with a pocketful of quill pens\./, "$1 配有一口袋鹅毛笔。");
	text = text.replace("The feathers would make for some pretty good arrows.", "这些羽毛可以做成很好的箭。");
	text = text.replace(/You can place good faith in (.*?)\'s earnest want to research, but maybe not so much faith in his ability to swing a sword\./, "你可以对 $1 研究的渴望有信心，但可能对他挥剑的能力不太信任。");
	text = text.replace(/(.*?)\'s time with the outfit is to develop a theory, but can he survive the experiments\?/, "$1 跟着武装队伍是为了发展一套理论，但他能在实验中幸存下来吗？");
	text = text.replace(/You promise (.*?) that, shall he perish, you will find a way to record his life\./, "你向 $1 保证，如果他死了，你会想法记录他的生活。");
	text = text.replace("He thanks you and hands over his will.", "他很感激并交出遗嘱。");
	text = text.replace("It\'s written in a language foreign to you and you can read absolutely none of it.", "它是用一种你不懂的语言写的，你完全看不懂。");
	text = text.replace("You smile back anyway.", "不管怎样，你还是微笑着回应着。");

//houndmaster_background.nut
	text = text.replace(/(.*?)\'s fondness for dogs started after his father won a pup in a shooting contest\./, "$1 对狗的喜爱始于他父亲在射击比赛中赢得一只小狗。");
	text = text.replace(/When a dog saved him from a bear, (.*?) dedicated his life to the canine lot\./, "当一只狗把他从熊手中救出来时，$1 他的一生致力于了犬舍。");
	text = text.replace(/Seeing a dog stave off a would-be robber, (.*?)\'s fondness for the mutts only grew\./, "看到一条狗拖住了一个想抢劫的人，$1 对狗的喜爱只会增加。");
	text = text.replace(/A young, bird-hunting (.*?) quickly saw the honor, loyalty, and workmanship of a dog\./, "一个年轻的猎鸟者 $1 很快就发现了狗的荣誉、忠诚和技艺。");
	text = text.replace(/Once bitten by a wild dog, (.*?) confronted his fear of canines by learning to train them\./, "曾经被野狗咬伤，$1 学会训练犬只，以克服对犬只的恐惧。");
	text = text.replace("The houndmaster spent many years working for a local lord.", "训兽师为当地一位领主工作了多年。");
	text = text.replace("He gave up the post after the liege struck a dog down just for sport.", "在领主为了消遣而打倒一条狗后，他放弃了这个职位。");
	text = text.replace("Quick with training his mongrels, the houndmaster put his dogs into a lucrative traveling tradeshow.", "训兽师训练杂种狗的速度很快，他把他的狗放进了一个有利可图的巡回贸易展览会中。");
	text = text.replace("The man made a great deal of money on the dog-fighting circuits, his mutts renowned for their easily commanded - and unleashed - ferocity.", "这名男子在斗犬圈子里赚了很多钱，他的狗以其指挥是很容易和释放后很凶猛而闻名。");
	text = text.replace("Employed by lawmen, the houndmaster used his strong-nosed dogs to hunt down many a criminal element.", "训兽师受雇于执法人员，用他那有强大的鼻子猎犬追捕许多犯罪分子。");
	text = text.replace("Used by a local lord, many of the houndmaster\'s dogs found their way onto the battlefield.", "被当地一位领主雇佣，许多训兽师的狗进入了战场。");
	text = text.replace("For many years, the houndmaster used his dogs to help lift the spirits of orphaned children and the crippled.", "多年来，训兽师用他的狗来帮助孤儿和残废的人们振作精神。");
	text = text.replace(/Now, though, (.*?) seeks a change of vocation\./, "不过，现在，$1 寻求改变职业。");
	text = text.replace(/When he heard word of a mercenary\'s pay, (.*?) decided to try his hand at being a sellsword\./, "当他听到雇佣兵的报酬时，$1 决定尝试一下当一个雇佣兵。");
	text = text.replace(/Approached by a sellsword to buy one of his dogs, (.*?) became more interested in the prospect of he, himself, becoming a mercenary\./, "雇佣兵找他来买一只狗，但 $1 对他自己成为一个雇佣兵的前景更加感兴趣。");
	text = text.replace(/Tired of training dogs for this purpose or that, (.*?) seeks to train himself for\.\.\. well, this purpose or that\./, "厌倦了处于某种目的训练狗，$1 试图训练自己…好吧，还是处于某种目的。");
	text = text.replace(/An interesting prospect, you can only hope (.*?) is as loyal as the dogs he once commanded\./, "有着有趣的前景，你只希望 $1 像他曾经指挥的狗一样忠诚。");

//hunter_background.nut
	text = text.replace(/Without his father around, (.*?)\'s mother taught him how to shoot a bow, and how to feed the rest of his family\./, "没有父亲在身边，$1的母亲教他如何射箭以及如何养活家人。");
	text = text.replace(/Born in the hinterlands of (.*?), (.*?) has spent much of his life stalking the beasts amongst the trees\./, "他出生在 $1 的树林里，$2 花费相当多的时间在树林间追踪野兽。");
	text = text.replace(/(.*?) once took a bet to shoot an apple off a pig\'s head\. He missed\./, "$1 曾经打赌要从猪头上射下一个苹果。他失手了。");
	text = text.replace("With a belly full of bacon, he became determined to never miss again - unless it meant more bacon, of course.", "肚子里装满了培根，他下定决心再也不失手了－当然，除非有更多的培根。");
	text = text.replace(/Early in his life, (.*?) liked to traipse about the forests\./, "在他的早年时光，$1 喜欢在森林里漫步。");
	text = text.replace("When a rabid fox attacked him, he learned to take a bow.", "当一只疯狂的狐狸袭击他时，他学会了拉弓。");
	text = text.replace("When a devilish eagle clawed his face, he learned to shoot it.", "当一只凶猛的老鹰用爪子抓他的脸时，他学会了射击。");
	text = text.replace(/Once employed by local royalty, a disastrous boar hunt ended with a gored baron and all the blame - and blood - on (.*?)\'s hands\./, "曾经被当地皇室雇佣，一场灾难性的野猪猎杀以男爵被刺伤和 $1的手上沾着的血和背负的所有责难而告终。");
	text = text.replace("The hunter hid the thought well, but for the longest time he wondered what it would be like to hunt the ultimate game: man.", "猎人把这个想法藏得很深，但在很长一段时间里，他一直在想，猎杀游戏的终极目标是什么：是人。");
	text = text.replace("Sadly, a bad game of peasant-roulette forced the deer hunter into seeking other means of income.", "可悲的是，一次糟糕的轮盘赌博迫使猎鹿人寻求其他收入来源。");
	text = text.replace("Unfortunately, he is not nearly as good at cooking deer as he is at shooting them.", "不幸的是，他在烹调鹿的技巧远不如射杀鹿好。");
	text = text.replace("A dinner consisting of undercooked meats poisoned his entire family.", "一顿含有未煮熟的肉的晚餐毒死了他全家。");
	text = text.replace("His desperation for a new life is understandable.", "他对新的人生的迫切渴望是可以理解的。");
	text = text.replace("After an arduous trip to town to sell meats and leathers, he followed the call of mercenary work.", "经过长途跋涉进城卖肉和皮革后，他听从了雇佣兵工作的号召。");
	text = text.replace(/War drove the game out of the forests, and the hunt out of (.*?)\. Now he seeks another line of work\./, "战争使森林不再可以玩耍，也使 $1 不能再狩猎。现在他在找另一个工作。");
	text = text.replace("When his wife fell ill, he could not heal her with hunted meat.", "当他的妻子生病时，他无法用狩猎的肉来治愈她。");
	text = text.replace("Needing to earn crowns to pay for treatment, he took up the vocation of sellswords - or sellbows, as it were.", "由于需要挣克朗来支付治疗费用，他开始了出卖自己武力的生涯，或者说是出卖弓艺的生涯。");
	text = text.replace("Any outfit could use a deadeye such as this man.", "任何队伍都需要像这人一样的神射手。");
	text = text.replace(/Not entirely without faults, (.*?) is a professional bowman nonetheless\./, "$1 并非完全没有缺点，但他仍然是一名专业的弓箭手。");
	text = text.replace(/A quick demonstration is offered: (.*?) shoots one arrow high into the sky, and with another he knocks it out\. Impressive\./, "他提供了一个快速展示：$1 将一支箭射向天空，然后用另一支箭将其击中。令人印象深刻。");
	text = text.replace(/(.*?) looks like he has something to prove - just make sure he does it at range\./, "$1 看起来想要要证明的什么－只要确保在他能力范围内就可以了。");
	text = text.replace("When first given a sword, he grabbed it at the wrong end. Yes, that end.", "第一次给他一把剑时，他抓错了方向。是的，那一头。");
	text = text.replace("The hunter wields his bow like another limb, and shoots his arrows like a preacher does words.", "猎人挥舞着他的弓像他的第三只手灵活，射出他的箭像传教士说话一样犀利。");

//juggler_background.nut
	text = text.replace(/Taught by his step-brother, (.*?) took up juggling like a sailor to his oars\./, "在他同父异母的兄弟教导下，$1 开始像水手摆弄桨一样杂耍。");
	text = text.replace(/Although sneered at by his peers, (.*?) always loved juggling\./, "虽然受到同龄人的嘲笑，$1 一直很喜欢玩杂耍。");
	text = text.replace(/Visited by a troupe of jesters, (.*?) was most enamored - and eventually taught - by one particularly interesting man: a juggler\./, "一群小丑的拜访后，$1 被一个特别有趣的人迷住了，并最终被这个特别有趣的人教导成为了：一个杂耍者。");
	text = text.replace(/Son to a local lord, (.*?)\'s embarrassing obsession with juggling and entertaining had him exiled from the family line\./, "他是当地一位贵族的儿子，$1 对杂耍和娱乐的痴迷使他被逐出了家族。");
	text = text.replace(/(.*?) didn\'t juggle just for the sake of it, but to earn the laughter and applause of an audience\./, "$1 杂耍不仅仅是为了利益，更是为了赢得观众的欢笑和掌声。");
	text = text.replace("Unfortunately, there\'s not many folks to entertain when war is ravaging the land.", "不幸的是，当战争肆虐这片土地时，没有多少人可以娱乐。");
	text = text.replace("But crowds and crowns are sparse in a land of misery and suffering.", "但是在这个充满苦难和苦难的土地上，人群和克朗是稀少的。");
	text = text.replace("But a juggling accident involving adzes and a royal infant had the entertainer running for his life.", "但一场涉及飞斧和皇室婴儿的杂耍事故让这位艺人不得不逃命。");
	text = text.replace("So good at flipping swords and daggers, it wasn\'t long until he was accused of sorcery and driven from his passion.", "他非常擅长投掷剑和匕首，没过多久，他就被指控有巫术，并被禁止他所热爱的活动。");
	text = text.replace(/Sadly, (.*?)\'s skill in juggling led to much jealousy amongst his fellow jesters\./, "可悲的是，$1的杂耍技巧在他的小丑同伴中引起了很大的嫉妒。");
	text = text.replace("They conspired against him - and his poor wrists.", "他们密谋对付了他以及他可怜的手腕。");
	text = text.replace("When an assassin killed the lord he was entertaining, the juggler was the first to be accused.", "当一个杀手杀死了他招待的领主时，杂耍者是第一个被指控的人。");
	text = text.replace("He barely escaped with his life.", "他差点没逃过一劫。");
	text = text.replace(/Now, (.*?) seeks a new path, even if death itself has become his audience\./, "现在，$1 寻求一条新的道路，即使死亡本身已经成为他的观众。");
	text = text.replace(/Now, (.*?) finds respite in the company of equally down-on-their-luck men\./, "现在，$1 在和他同样倒霉的人的陪伴下找到了解脱。");
	text = text.replace(/With fast hands and quick reactions, (.*?) should have no problem hitting his targets\./, "鉴于他眼疾手快，$1 命中目标应该没有问题。");
	text = text.replace(/Juggling knives with his eyes closed, (.*?) knows exactly where to throw each blade\./, "闭着眼睛杂耍玩刀，$1 知道把每把刀扔到哪里。");
	text = text.replace(/There is far more coin in killing than juggling, a sad reality (.*?) has come to accept\./, "杀戮比耍杂能赚更多的硬币，$1 已经接受了这个可悲的事实。");

//killer_on_the_run_background.nut
	text = text.replace(/(.*?) has a face that no one desires - one fit for a wanted poster\./, "$1 有一张没有人希望得到的脸－一张通缉海报上的脸。");
	text = text.replace(/With blood on his hands, (.*?) resembles a man recently described to you by bounty hunters\./, "$1 就像最近赏金猎人给你描述的一个人，手上沾满了鲜血。");
	text = text.replace(/(.*?) looks about ready to join any outfit - or disappear into its ranks\./, "$1 似乎已经准备好加入任何组织，或者消失在人群中。");
	text = text.replace(/Upon meeting people, (.*?) stammers out his name as if reluctant to part with it\./, "一见到别人，$1 结结巴巴地说出了自己的名字，好像不乐意放弃它。");
	text = text.replace(/Recognizing (.*?) is no hard feat: this man is a known-murderer, the blood of both his cuckolding wife and her lover on his hands\./, "认出 $1 并不是一件难事：这个人是众所周知的杀人犯，他手上沾满了出轨的妻子和她情人的鲜血。");
	text = text.replace("His eyes are dark and shifting.", "他的目光又暗沉又飘忽不定。");
	text = text.replace("There is a crime behind them, but also a sense of humanity, as if he knows he has done wrong and is looking to make amends.", "目光背后有一种罪恶，但也有一种人性的感觉，好像他知道自己做错了，正在寻求弥补。");
	text = text.replace("Mud stands up to his legs.", "他的腿上沾满了泥巴。");
	text = text.replace("He\'s been running for a long time.", "他已经跑了很长时间了。");
	text = text.replace("His hands tremble, too, for his legs run from what his hands have done.", "他的手也在颤抖，因为他的腿正是为了逃离他亲手做过的那些事情。");
	text = text.replace("They say he killed his newborn daughter, having always wanted a son instead.", "他们说他杀死了刚出生的女儿，因为他一直想要个儿子。");
	text = text.replace("Some believe he struck down a man in self-defense.", "有人坚持认为他是出于自卫而杀死了那个人。");
	text = text.replace("Being blackmailed with scandalous information, it\'s hard to blame the man for what he has done.", "由于他受到诽谤的勒索，你很难责怪他所做的事。");
	text = text.replace("Even if he has done wrong, a party of killers could use a man such as he.", "即使他做错了，一伙杀手也许能利用像他这样的人。");
	text = text.replace("But can the man be trusted?", "但这个人可以信任吗？");
	text = text.replace(/(.*?)\'s eyes skirt from yours\./, "$1 回避着你的眼睛。");
	text = text.replace("When you ask how he is with a weapon, he mumbles about only having to hit \'the man\' once.", "当你问他是否知道如何使用武器时，他喃喃地说曾经用它攻击过“那个人”。");
	text = text.replace(/A man of (.*?)\'s physique could be useful, but how much can you depend upon a man whose former life was one of being on the run\?/, "一个拥有 $1 体格的人是有用的，但是你能在多大程度上依靠一个前半生一直逃亡的人呢？");
	text = text.replace("The man chamfers on his fingernails like a beaver would a tree.", "这个人啃着他的指甲，就像海狸啃树一样。");
	text = text.replace("He\'s jumpy, but maybe that\'s a good thing in this world.", "他很神经质，但在这样世界里或许是一件好事。");
	text = text.replace("Mercenary bands are just the thing for a man like him.", "雇佣兵团对像他这样的人来说很合适。");

//kings_guard_background.nut

//lumberjack_background.nut
	text = text.replace(/A lumberjack, (.*?)/, "一个伐木工，$1");
	text = text.replace("spent most of his days in the woods, chopping down trees", "大部分时间都在树林里砍树");
	text = text.replace("earned his crowns by chopping trees for firewood", "靠伐木砍柴赚取他的克朗");
	text = text.replace("was never seen without either axe or wood on his shoulder", "肩上总是背着斧头或木头");
	text = text.replace("always was a quiet man that prefered the serenity of the woods to the company of people", "是一个安静的人，他喜欢森林里的宁静，而不喜欢和人在一起");
	text = text.replace("was eyed by many a young woman for his good stature and strong hands", "许多年轻女子都因为他的健美的身材和强壮的双手而盯着他看");
	text = text.replace("always used to day-dream he was a knight, swinging his axe not against trees but orcs and trolls", "一直做着白日梦他是一个骑士，挥舞斧头不是针对树木而是针对兽人和巨魔");
	text = text.replace("A large and sturdy man, working outside came easily to him", "他是一个高大强壮的男人，在外面很容易就能找到工作");
	text = text.replace("He loved his collection of axes, having named every single one after a woman he once knew", "他喜欢他的斧子收藏，每一把斧子都以他认识的一个女人的名字命名");
	text = text.replace("He worked hard every day, but it was honest work", "他每天都努力工作，但这不是一项光荣的工作");
	text = text.replace("Alone in the woods he would talk to the trees and have them tell him which ones would give the best wood", "独自一人在树林里时他会和树木交谈，让他们告诉他哪一种木材最好");
	text = text.replace("Few men could swing an axe like he did, having a tree fall just like he wanted it", "很少有人能像他那样挥舞斧头，让一棵树如他所希望的那样倒下");
	text = text.replace("With his large and sturdy build he could carry on his back what other people would be crushed by", "凭借他高大而结实的体格，他可以背着会压垮别人的重量的东西");
	text = text.replace("Like most people, he took on the profession of his father.", "像大多数人一样，他继承了他父亲的职业。");
	text = text.replace("Yet over the years, it dawned on him that he wanted to see more from the world than the same woods every day.", "然而，这些年来，他突然意识到，他想从这个世界上看到比每天同样的森林更多的东西。");
	text = text.replace("After thinking long and hard, he made up his mind to", "经过长时间的深思熟虑后，他下定决心");
	text = text.replace("His life collapsed on him as his beloved wife died in childbirth.", "当他心爱的妻子在分娩时死了，他的生命就崩溃了。");
	text = text.replace("With everything taken from him, he became more and more reclusive, and not even the woods could bring him peace anymore.", "他的一切都被夺走了，他变得越来越离群索居，甚至连树林都不能给他带来安宁。");
	text = text.replace("Just wanting to get away, he decided to", "只是想逃走，他决定");
	text = text.replace("Returning from the woods one day, he saw smoke from afar.", "有一天从树林里回来，他看到远处有烟。");
	text = text.replace("His village was burning, the people slaughtered or taken.", "他的村庄被烧了，人们被屠杀或掳走。");
	text = text.replace("His home destroyed. Full of anger he set off and decided to", "他的家被毁了。他满怀怒气决定");
	text = text.replace("Over time, strange creatures began to appear in the woods.", "随着时间的推移，森林里开始出现奇怪的生物。");
	text = text.replace("One villager after the other disappared, some moved away.", "一个接一个的村民不见了，有些人搬走了。");
	text = text.replace("After a long night with no sleep, he decided it was time for him to leave as well.", "经过一个漫长的夜晚没有睡觉，他决定是时候离开了。");
	text = text.replace("With nothing to live off, he was desperate to", "由于没有什么生活来源，他不顾一切地");
	text = text.replace(/Curious to all the villagers, it seemed (.*?) lost his interest in the woods with time, speaking of going away every more often if he spoke at all\./, "村民们都很好奇，随着时间推移 $1 逐渐对森林失去了兴趣，越来越频繁地提到要离开。");
	text = text.replace("One fateful day, they saw him volunteer to", "有一天，他们看到他自告奋勇去");
	text = text.replace(/One fateful day a tree he fell slew a deer\. (.*?) did not want to waste it and so took it home, only to find himself accused of poaching\./, "在一个决定性的日子，他砍到的一棵树砸死了一只鹿。$1 不想浪费它，所以把它带回家，结果发现自己被指控偷猎。");
	text = text.replace("Before a sentence was cast he decided to leave the village in haste and attempt to", "在判决被执行钱，他匆忙离开村子并试图");
	text = text.replace("join a travelling mercenary company.", "加入一个旅行中的雇佣兵战队。");

//manhunter_background.nut
	text = text.replace("The large population of slaves, prisoners, criminals, and indebted servants in the south has produced an economy of sellers, buyers, and, given the flighty nature of the product, hunters.", "南方大量的奴隶、囚犯、罪犯和负债的雇工造就了一个由卖家、买家考虑产品的轻浮特性还有猎人组成的经济模式。");
	text = text.replace("Southern city states must have enormous reserves of labor to fuel their desert-borne economies.", "南部城邦必须拥有巨大的劳动力储备来推动沙漠经济。");
	text = text.replace("While many are born into working tirelessly for Viziers, some must be coerced into a life of servitude.", "虽然许多人生来就为维齐尔不倦地工作，但还有有些人必须被迫过上奴役的生活。");
	text = text.replace("The deserts so sparse in natural resources, it is often an ample supply of captured criminals and indebted souls which bolsters the southern economy.", "自然资源如此稀少的沙漠，往往有充足的被俘罪犯和负债累累的灵魂来支撑南方经济。");
	text = text.replace("And the business of hunting down these eventual servants is a prosperous one.", "而追捕这些最终将会成为仆人的家伙们的事业非常繁荣。");
	text = text.replace("Southern Viziers are so fearful of rebellions that an entire market of Manhunters has emerged to nip them in the bud.", "南部维齐尔大臣们对叛乱如此恐惧，以至于整个搜捕者市场出现了，来把他们扼杀在萌芽状态。");
	text = text.replace(/(.*?) entered manhunting with a vengeful attitude: his entire family was massacred in a slave uprising\./, "$1 带着复仇的态度进入了追捕奴隶的事业：他的家人都在奴隶起义中被屠杀。");
	text = text.replace(/(.*?) was once an ordinary caravan guard but turned to manhunting nomads who kept trying to ambush his convoys\./, "$1 曾经是一名普通的商队警卫，但后来转而追捕那些试图伏击他的商队的游牧民族。");
	text = text.replace("Finding more profit in the human trade, he\'s stuck with it ever since.", "在人口贸易中发现了更多的利润，他就一直坚持干下去了。");
	text = text.replace(/(.*?) is a manhunter with a good nose for tracking criminals, deserters, prisoners of war, and more\./, "$1 是一个善于追踪罪犯、逃兵、战俘等等的搜捕者。");
	text = text.replace("You sometimes wonder if he\'s got a keen sense of smell for fearful sweat.", "你有时会怀疑他是否有灵敏的嗅觉，能闻到惊恐的冷汗。");
	text = text.replace(/Once a big game hunter, (.*?) grew fond of chasing the greatest game of all: man\./, "曾经是一个王牌猎手，$1 逐渐喜欢追逐最伟大的游戏：人。");
	text = text.replace("He is an expert tracker with a nose for sniffing out desperation.", "他是一个寻踪专家，有嗅出绝望气息的鼻子。");
	text = text.replace(/For (.*?), the opportunity of working for a mercenary band simply brings in more consistent work than waiting around for some pressed criminal to get antsy about his chains\./, "对于 $1 来说，选择为一个雇佣兵团工作意味着更稳定的工作，不用空等那些对他手中的锁链感到不安的罪犯。");
	text = text.replace(/(.*?) is a rugged, shady individual and it is quite possible that he is just as flighty as the men he sought to hunt down\./, "$1 是个粗野、阴暗的人，很可能他和他要追捕的人一样轻浮。");
	text = text.replace(/Hunters like (.*?) carry traits and skills that would be useful in a mercenary band, but to some their past may be an ever present slight\./, "像 $1 这样的猎人拥有在雇佣兵团中能派上用场的特质和技能，但对某些人来说，他们的过去可能永远会遭到蔑视。");
	text = text.replace("Not all manhunters are seen in good light.", "并不是所有的搜捕者都被看好。");
	text = text.replace("Capturing humans for the purpose of labor is frowned upon by many and catching those seeking their freedom equally so.", "许多人不赞成出于需要劳动力去抓捕人类，同样也反对抓捕那些追求自由的人。");
	text = text.replace(/Manhunters like (.*?) certainly have useful skills, but may rub some the wrong way\./, "像 $1 这样的搜捕者当然拥有有用的技能，但可能会弄错一些。");
	text = text.replace(/To no surprise, many see men like (.*?) as opportunistic slugs\./, "毫不奇怪，许多人认为像 $1 这样的人是信奉机会主义的懒虫。");
	text = text.replace("If he can make it with the company, it may take time to change the minds of some about his past.", "如果他要与战队合作，也许需要画点时间来改变一些人对他的过去的看法。");

//mason_background.nut
	text = text.replace(/Growing up in (.*?), (.*?) spent his youth poring over construction books with earnest\./, "在 $1 长大，$2 年轻时认真地研读建筑书籍。");
	text = text.replace(/Raised by a guild of tradesmen, (.*?)\'s swift ascent through the field of masonry was of little surprise\./, "由一个商人公会养大的 $1 在建筑领域的迅速崛起并不令人惊讶。");
	text = text.replace(/A student of (.*?)\'s esteemed college, (.*?) graduated with great expectations, and even greater things yet to build\./, "作为 $1 受人尊敬的学院的学生，$2 怀着远大的期望毕业，甚至还有更大的东西等着他去建造。");
	text = text.replace(/With a bricklayer for a father, (.*?)\'s entrance into masonry was but the smallest of steps\./, "由于父亲是个石匠，$1 进入石工行业只迈了很小的一步。");
	text = text.replace(/Amazed by the regal structures of church and state, (.*?) fell in love with masonry\./, "惊讶于教堂和国家的宏伟建筑，$1 爱上了石工。");
	text = text.replace(/When (.*?) was in dire need of defensive walls, (.*?) took to masonry like a very fortunately-timed natural\./, "当 $1 急需防御墙时，$2 在一个非常幸运的时刻开始了从事石工行当。");
	text = text.replace("Unfortunately, his time as a mason was short-lived.", "不幸的是，他做石匠的时间很短。");
	text = text.replace("A church he built collapsed and out of its ruins rose a murderous mob looking for revenge.", "他建造的一座教堂倒塌了，从废墟中爬出一伙凶残的暴徒想要报复他。");
	text = text.replace("Five buildings built, five buildings knocked down.", "建造了五栋楼，被毁了五栋楼。");
	text = text.replace("Endless wars made the man\'s vocation an impossible one.", "无休止的战争使这个人的职业变得不可能进行下去。");
	text = text.replace("Betrayed by a fellow architect, the mason bricked his rival inside the walls of his next project.", "由于一位建筑师的背叛，这个泥瓦匠在他的下一个项目中用砖块把他的对手砌进了墙里。");
	text = text.replace("It wasn\'t long until people started asking questions.", "不久人们就开始提出问题。");
	text = text.replace("While roofing, the man took a misstep and fell.", "在盖屋顶时，这个人走错了一步摔倒了。");
	text = text.replace("The ensuing injuries forced him out of his field.", "接踵而来的伤病迫使他离开了工地。");
	text = text.replace("But when a lord demanded he build a horrific dungeon, the mason refused.", "但是当一个领主要求他建造一个可怕的地牢时，石匠拒绝了。");
	text = text.replace("Now he is banished from ever laying a brick again.", "现在他被禁止再去砌墙了。");
	text = text.replace("A misplaced blueprint had the mason building the temple of the Davkulians and not the temple of the Davkuliads.", "一张错位的蓝图让石匠错建了达库利安神殿，而不是达库利德神殿。");
	text = text.replace("Now he says the gods themselves are after him.", "他说现在诸神亲自在追他。");
	text = text.replace(/Putting down his hammer and chisel for a hammer and sharpened chisel called a sword, (.*?) now works in the field of mercenaries\./, "放下他的锤子和凿子换成一把战锤和一把锋利到被称作剑的凿子，$1 现在在雇佣兵领域工作。");
	text = text.replace("One day, a poster for a mercenary troop caught his eye.", "一天，一张雇佣兵的海报引起了他的注意。");
	text = text.replace("Much like his old buildings, the rest is history.", "就像他的以前的建筑一样，剩下的都成了历史。");
	text = text.replace("Years of masonry made the man fit for a life of blood and mud.", "多年的砖石工程使这个人很适合沾满鲜血和污泥的新生活。");
	text = text.replace(/(.*?) finds a flaw in every building he passes\./, "$1 在他经过的每栋建筑时都发现了缺陷。");
	text = text.replace("Hopefully he can tune that annoying analysis to the battlefield.", "希望他能把那些烦人的分析调整到战场上。");

//messenger_background.nut
	text = text.replace(/Some men are so important that they require other men to carry their words. (.*?) is such a man - the latter, that is\./, "有些人如此重要了以至于他们需要其他人来传话。$1 就是这样一个人，当然是后者。");
	text = text.replace(/(.*?)\'s shoulders are yoked with bags of mail, the receivers almost certainly dead on arrival\./, "$1的肩膀上扛着一袋袋的邮件，几乎可以肯定，收件人在送达前就已经死了。");
	text = text.replace(/To escape a life of servitude, (.*?) took up the vocation of a messenger\./, "为了逃离奴役的生活，$1 选择信使这一职业。");
	text = text.replace(/With so many hurrying to find out the status of relatives, (.*?) has found ample work as a messenger\./, "由于如此之多的人着急了解他们亲戚的情况，$1 发现当信使有足够多的工作。");
	text = text.replace(/(.*?) once traveled the land as a modest messenger\./, "$1 曾经作为一个小信使走遍了这片土地。");
	text = text.replace(/Like his father and his father\'s father before him, (.*?) took messages across the land for royalty and laymen alike\./, "就像他父亲和他父亲的父亲一样，$1 为皇室和执法者传递信息。");
	text = text.replace(/Picking up a dead messenger\'s bags, (.*?) soon found himself in the role of a would-be messenger\./, "捡起一个死了的信使的包，$1 很快就发现自己成了冒充的信使。");
	text = text.replace(/Once a refugee, (.*?) figured he might as well deliver letters if he was already wandering the land\./, "曾经是一名难民，$1 发现他在这片土地上继续游荡的话，他还不如去送信。");
	text = text.replace("But making the rounds gets boring.", "但是来回奔波开始变得无聊。");
	text = text.replace("The mailman seeks a new field of work.", "这个邮递员开始寻找一个新的工作领域。");
	text = text.replace("Carrying love letters, the would-be adventurer wondered what the hell he was doing.", "带着情书，这位想要成为冒险者的家伙想知道他究竟在干什么鬼。");
	text = text.replace(/Claiming to be a budding hero, (.*?) now believes the task of delivering mail is beneath him\./, "自称是一个初出茅庐的英雄，$1 现在认为投递邮件的任务配不上他了。");
	text = text.replace("Rain or sunshine, sure, snow or sleet, sure, but all out war? Maybe another time.", "雨或阳光，当然，雪或冻雨，当然，但全面战争？也许下次吧。");
	text = text.replace("But after opening a letter that would ruin a goodhearted noble, the messenger decided to leave his post.", "但在打开了一封会毁了一位贵族好心情的信后，信使决定离开岗位。");
	text = text.replace(/When robbers made his life hell, (.*?) figured he\'d be better off traveling in the company of armed men\./, "当强盗把他的生活搞得一团糟时，$1 认为他最好是和武装人员一起旅行。");
	text = text.replace("After sleeping with a mayor\'s wife, the messenger had a small army on his heels.", "在和一位镇长的妻子上床后，信使被一支小部队追捕着。");
	text = text.replace("He figured he\'d best slip into a different outfit for his own safety.", "他认为为了自保，他最好加入一支不同的武装队伍。");
	text = text.replace(/(.*?) has spent years memorizing messages\./, "$1 花了好几年的时间来记忆信息。");
	text = text.replace("Now he\'ll have to remember keeping the shield wall as arrows rain down on it.", "现在他必须记住，当箭雨落下时保持盾墙。");
	text = text.replace(/Ironically, (.*?) has never written anything in his life\./, "讽刺的是，$1 一生中从未写过任何东西。");
	text = text.replace(/Rolling up his sleeves, (.*?) boasts he has one last message to give the world. Everybody look out\./, "卷起袖子，$1 夸耀自己还有最后一条信息要传达给全世界。大家小心点。");
	text = text.replace("Perhaps his joining mercenaries suggests that, indeed, the pen is not mightier than a sword.", "也许他加入雇佣兵的行为表明，实际上，笔并不比剑更强大。");
	text = text.replace(/(.*?) has a tendency to repeat everything said to him\./, "$1 有重复跟他说的话的倾向。");
	text = text.replace("Old messenger habits die hard.", "信使的旧习难改。");
	text = text.replace("Ironically, the well-traveled messenger has probably seen more horrors on the road than most of the men in the outfit.", "具有讽刺意味的是，这位四处奔波的信使在路上看到的恐怖的事件可能比大多数武装队伍里的人都多。");
	text = text.replace(/Few, if any, of (.*?)\'s skills make him ready for combat\./, "$1的技能大多不能让他做好战斗准备。");
	text = text.replace("But he does have some sturdy legs, hopefully just not for running away.", "但他确实有两条强壮的腿，希望不是为了逃跑。");

//militia_background.nut
	text = text.replace(/A militiaman like (.*?) is only raised in times of need\./, "像 $1 这样的民兵只有在需要的时候才会被培养出来。");
	text = text.replace(/Broke and without work, (.*?) joined his local militia\./, "身无分文，没有工作，$1 加入了当地民兵组织。");
	text = text.replace(/Caught stealing an apple, (.*?) was pressed into the militia as a form of punishment\./, "$1 偷苹果被逮到，受到惩罚而被迫加入民兵组织。");
	text = text.replace(/Although a member of the peasantry, (.*?) was always willing to join the militia and protect his homestead\./, "虽然 $1 是农民，但他一直愿意加入民兵组织，保护自己的家园。");
	text = text.replace(/War is a hungry beast - militia conscripts like (.*?) are what feed it\./, "战争是一头饥饿的野兽，像 $1 这样的义务民兵是它的口粮。");
	text = text.replace("While he got proper training, there was rarely enough food to go around for the \'second-rate soldiers\'.", "虽然他接受了适当的训练，但几乎没有足够的食物来满足这位“二等士兵”的需要。");
	text = text.replace("Even though he fought just as hard as the professionals, he found himself unable to garner any sort of respect for his work.", "尽管他和专业人士一样努力奋斗，但他发现自己无法为自己的工作赢得任何尊重。");
	text = text.replace("Being the bottom rung of soldiering, he quickly realized that it meant his life was expendable.", "身处士兵的底层，他很快意识到这意味着他的生命是可以牺牲的。");
	text = text.replace("His weapons were rusted and the armor nonexistent.", "他的武器生锈了，盔甲也不存在了。");
	text = text.replace("Unfortunately, enemies were not so kindly under-equipped.", "不幸的是，敌人的装备并不是那差劲。");
	text = text.replace("After a year of traipsing around with shoddy gear, he decided to look for something a bit more to his liking: sellswords.", "身着劣质的装备四处游荡了一年之后，他决定寻找一种更适合自己的东西：佣兵。");
	text = text.replace(/When a lord sent his entire militia to almost certain doom, (.*?) realized he had better seek something better if he wanted to live\./, "当一个领主派他的全部民兵前往几乎注定的必死之战，$1 意识到，如果他想活下去，他最好寻求更好的东西。");
	text = text.replace("He took his modest skillset to the field of mercenaries.", "他把他的些许战斗技能带到了雇佣兵的领域。");
	text = text.replace(/Years in an outfit where he couldn\'t depend on the man next to him drove (.*?) to find something better\./, "多年来，身处无法依靠战友的部队里驱使着 $1 寻找更好的队伍。");
	text = text.replace("He\'s not the best soldier you\'ve ever seen, but he is earnest.", "他不是你见过的最好的士兵，但他是最认真的。");
	text = text.replace("When his militia was disbanded, he returned home to find his town had been burned to the ground.", "当他的民兵解散后，他回到家里，发现他的城镇已被烧成灰烬。");
	text = text.replace("One foot already in the door, it only made sense to join one of the numerous mercenary bands roaming the land.", "一只脚已经迈入了门里，只有加入在这片土地上游荡的众多雇佣兵团中的一支才有意义。");
	text = text.replace(/(.*?)\'s modest military garb belies a man who has seen his fair share of training and combat\./, "$1 朴素的军装装束掩盖了他是一个经历过相当多训练和战斗的人的事实。");

//miller_background.nut
	text = text.replace(/The life as a miller had always been lacking something for (.*?), yet the hard work kept him from making any big plans\./, "当碾磨工的日子一直让 $1 觉得有所缺憾，但繁重的工作使他无法制定任何大计划。");
	text = text.replace(/Continuing the family tradition, (.*?) learned the millers trade from his father\./, "延续家族传统，$1 从父亲那里学到了碾磨工的手艺。");
	text = text.replace(/Although just a simple miller, (.*?) always dreamed about wandering out into the world and bring home tales and pockets full of crowns\./, "虽然只是一个普通的碾磨工，$1 却总是梦想着走出去，走进这个世界，将传奇的故事和满满的钱袋带回家。");
	text = text.replace(/Being a simple fellow, (.*?) did not mind working hard in the mill every day\./, "作为一个单纯的人，$1 不介意每天在磨坊里努力工作。");
	text = text.replace(/(.*?) always was more ambitious than other people\./, "$1 总是比其他人更有野心。");
	text = text.replace("While his brother was content with running their family\'s mill, he could not shake the feeling that he was destined for more.", "当他哥哥满足于经营他们家的磨坊时，他无法摆脱他注定会有更多际遇的感觉。");
	text = text.replace(/One night he was awoken by a loud thunderstorm. Rushing outside, (.*?) realised that his mill had been ignited by a lightning strike\./, "一天晚上他被一声响雷惊醒。冲到外面，$1 意识到他的磨坊被雷击点燃了。");
	text = text.replace("When he caught his promised wife in bed with another man, he was furious, battering both of them with a hail of blows.", "当他抓到他的未婚妻和另一个男人上床时，他勃然大怒，狠狠地揍了他们两个。");
	text = text.replace("His fists were bruised, people were shouting at him, but the only thing he felt was emptyness where once was his heart.", "他的拳头擦伤了，人们在对他大喊大叫，但他唯一能感觉到的是空虚，那儿曾经是他的心。");
	text = text.replace("As if in a dream he quickly packed his belongings and set out, never to return.", "仿佛在梦中，他迅速收拾好行李出发了，再也没有回去。");
	text = text.replace("When his young and lovely wife was found dead, torn apart by wild beasts in the woods, he did not say a word.", "当他年轻可爱的妻子被森林里的野兽撕碎身亡时，他一句话也没说。");
	text = text.replace("Silently he packed his belongings and set out into the world, to start a new life somewhere far away.", "他默默地收拾好自己的行李，出发到世界上，在遥远的地方开始新的生活。");
	text = text.replace(/After hearing wild tales from a hedge knight in the tavern of (.*?), his imagination was running wild with all the possibilities out there in the world waiting for him\./, "在 $1 的酒馆里听了一个雇佣骑士的荒诞故事后，他的想象力变得狂野起来，世界上所有的可能性都在等着他。");
	text = text.replace("A drought meant business was running slow for him.", "干旱意味着他的生意不景气。");
	text = text.replace(/When (.*?) was not able to pay his debts any more his life was threatened by ruthless money collectors\./, "当 $1 无力偿还债务时，他的生命受到了无情的收债人的威胁。");
	text = text.replace("He had to disappear.", "他不得不离开。");
	text = text.replace(/Remembering his cousin, (.*?), who has made a decent living in the mercenary business, (.*?) decided to do the same\./, "想起他的堂兄，$1，他在雇佣兵生意中过着体面的生活，$2 决定也这样做。");
	text = text.replace("While looking for opportunities he met a mercenary recruiter who promised him fame and fortune.", "在寻找机会时，他遇到了一个唯利是图的雇佣兵招募者，他向他许诺名利。");
	text = text.replace(/Although he does not know the next thing about fighting, (.*?) is eager to sign up with a mercenary company hooked by the promise of adventure\./, "虽然 $1 不知道下一步该怎么打仗，但他还是很想和一家雇佣兵战队签约，这意味着可以期待的冒险生活。");
	text = text.replace(/Whether by lack of alternatives or by his free will, (.*?) stands before you now, ready to swear fealty\./, "无论是由于走投无路，还是出于他的自由意志，$1 现在站在你面前，准备宣誓效忠。");

//miner_background.nut
	text = text.replace(/To support a fatherless family, (.*?) went into the mines at a very young age\./, "为了养活一个没有父亲的家庭，$1 在很小的时候就进入了矿山。");
	text = text.replace(/An orphan, the only work (.*?) could find was working the mines of the earth\./, "作为一个孤儿，$1 唯一能找到的工作就是开采土地里的矿藏。");
	text = text.replace(/Mining is tough work, the sort of job men like (.*?) flock to\./, "采矿是一项艰苦的工作，许多像 $1 这样的人聚到了一起。");
	text = text.replace(/Even though his father died in the mines, (.*?) felt compelled to work in them himself, like most men do where he grew up\./, "尽管他的父亲死在矿井里，$1 觉得自己不得不在矿井里工作，就像大多数男人在他们干活的地方成长一样。");
	text = text.replace(/(.*?) worked in the mines as a family tradition spanning many generations\./, "$1 在矿山工作，这是一个世代相传的家族传统。");
	text = text.replace(/Whenever wars start up, miners like (.*?) are more needed than ever, lest an army wishes to go without steel to wield\./, "每当战争开始时，人们比以往任何时候都更需要像 $1 这样的矿工，以免军队没有钢铁可供使用。");
	text = text.replace(/A hardhelm and a pickaxe, the tools (.*?) has been taking deep into the earth for years\./, "一个铁盔和一把鹤嘴锄，$1 已经带着这些工具深入大地很多年了。");
	text = text.replace("But, as always, a mine doesn\'t last forever, and the miner barely escaped the last collapse.", "但是，和往常一样，一个矿井不会永远存在，矿工差点没有逃过最后一次坍塌事故。");
	text = text.replace("Sadly, he proved to be the only survivor of a shaft collapse, and there\'s no way he\'s digging back in there by himself.", "可悲的是，他被证明是竖井坍塌事故中唯一的幸存者，而且他不可能独自在那里挖掘。");
	text = text.replace("After a tragic mine collapse, the sight of dozens of widows moved the man to think of a different field of work.", "在一次悲惨的矿难之后，看到几十个寡妇让他想到了换一个工作领域。");
	text = text.replace("Surviving yet another collapse, the man\'s wife demanded he seek a new line of work no matter what it was.", "在又一次坍塌事故中幸存下来，这个男人的妻子要求他寻找一个新的工作，不管是什么。");
	text = text.replace("Bending over and scuttling about in the dark gets old, though, and so the man sought a different vocation.", "不过，在黑暗中弯腰奔走会让人衰老，所以这个人寻求了另一种职业。");
	text = text.replace("Working in environments far too dark, the man accidentally killed a coworker.", "在太暗的环境中工作，这个人不小心杀了一个同事。");
	text = text.replace("The tragedy pushed him from the field.", "那场悲剧使他离开了工作。");
	text = text.replace("After his own son lost his life in the mines, the man left the job forever.", "在他自己的儿子在矿井中丧生后，这个人永远离开了这份工作。");
	text = text.replace("But suffering from relentless coughs, the man felt maybe a career in fresh air would better serve him.", "由于不停的咳嗽，他觉得也许换个在新鲜空气中干活的工作会更好。");
	text = text.replace(/(.*?) has the stocky frame of a miner\./, "$1 有矿工般结实的身躯。");
	text = text.replace("Unfortunately, he has the lungs of one, too.", "不幸的是，他也有一个矿工的肺。");
	text = text.replace(/He\'s tough alright, but (.*?)\'s wheezing sounds like rusted blades grinding together\./, "他很坚强，但 $1 的喘息声听起来像生锈的刀片在一起研磨。");
	text = text.replace(/You have to wonder if (.*?)\'s lungs have enough metal dust in them to fashion a blade or two\./, "你一定想知道 $1 的肺里是否有足够的金属粉尘来制造一两把刀片。");
	text = text.replace(/(.*?)\'s breath could probably ink a chunk of coal\./, "$1 的吐息可能会沾上一大块煤。");
	text = text.replace(/(.*?) spent years earning keep for a company store\./, "$1 花了数年时间为一家连队仓库干活糊口。");
	text = text.replace("Now he wants to earn some real coin.", "现在他想挣一些真正的硬币。");
	text = text.replace(/(.*?) looks forward to pocketing some of that gold he spent years plucking out of the earth\./, "$1 期待着有一天能够把他多年来从土地里挖出的黄金收入囊中。");
	text = text.replace(/Annoyingly, (.*?) points at half your gear - the metal stuff, mostly - and reminds everyone who\'s responsible for it being there\./, "令人恼火的是，$1 指着你的一半装备－大部分是金属的东西——并提醒大伙这些是谁的成果。");
	text = text.replace(/(.*?) has almost catlike vision in the dark\./, "$1 在黑暗中几乎有猫一样的视觉。");
	text = text.replace("He would have made for a good assassin if it weren\'t for his damned wheezing.", "要不是他那该死的喘息声，他本可以成为一个出色的刺客。");
	text = text.replace(/(.*?) has cheated death a few times, so why not try it a few times more as mercenary\?/, "$1 已经骗过死神几次了，为什么不以佣兵的身份再试几次呢？");
	text = text.replace(/(.*?)\'s already had the earth itself out for his head so a few things above the soil don\'t scare him much\./, "$1 已经在大地下埋头干过活了，所以在土地上的一些东西不会让他太害怕。");
	text = text.replace(/If darkness truly is death\'s ambassador, (.*?)\'s already been talking to it for years\./, "如果黑暗真的是死亡的使者，$1 已经和它交谈了多年。");
	text = text.replace(/Stupidly brave souls like (.*?) can definitely find a good register in an outfit such as this\./, "像 $1 这样愚蠢却勇敢的人一定能在队伍里找个好差事。");
	text = text.replace(/(.*?) proudly boasts that, once upon a time, he could play cards in the dark\./, "$1 自豪地说，从前，他可以在黑暗中打牌。");
	text = text.replace("You don\'t doubt it.", "你相信确有其事。");
	text = text.replace(/If (.*?) can swing a sword as well as a pickaxe, then all is well\./, "如果 $1 能像挥舞鹤嘴锄一样挥剑，那么一切都很好。");

//minstrel_background.nut
	text = text.replace("I can swing a sword and cleave an axe,", "我可以挥剑劈斧，");
	text = text.replace("One might ask of me a task,", "有人可能会对我要求一个任务，");
	text = text.replace("Right with god, but in the left a flask,", "上帝在上，而酒瓶在手，");
	text = text.replace("and I say, \'You question a man who wears no mask?\'.", "我会说，“你问一个没有戴面具的人？”。");
	text = text.replace("and so I have to move quick, but not quite fast.", "我必须快点行动，但也不是那么快。");
	text = text.replace("Stare down the stuffed bears I did,", "盯着我做过的玩具熊，");
	text = text.replace("Into my frayed pantaloons I bid,", "穿上我的破裤子，");
	text = text.replace("Along the muddy roads my boots skid,", "沿着泥泞的道路，我的靴子打着滑，");
	text = text.replace("and so of many things I am rid.", "很多东西我都摆脱了。");
	text = text.replace("truth! My shameful talent is to - ferociously! - knit.", "真相！我可耻的天赋是－凶猛！－编织。");
	text = text.replace("So take me along your adventure,", "所以带我一起去冒险吧，");
	text = text.replace("Bring me with your men who clatter and clamber,", "带上我和你那些乱嚷嚷的人一起，");
	text = text.replace("Hand me your shield and that thing shaped like my member,", "把你的盾牌递给我，那看上去像我的同伴，");
	text = text.replace("and let us go and bid fear a farewell to remember!", "让我们走吧，用恐惧告别回忆！");
	text = text.replace("and let\'s - oh, ow!", "让我们－哦，噢！");
	text = text.replace("I have a splinter!", "我被扎了一根刺！");
	text = text.replace("and may we come, one and all, to a healthy next-winter!", "愿我们，所有人，来年冬天都健康！");
	text = text.replace("The man speaks gibberish.", "那人在胡言乱语。");
	text = text.replace("It rhymes!", "它很押韵！");

//monk_background.nut
	text = text.replace(/After raiders murdered his family, (.*?) retreated into the comforts of religion and became a monk at a nearby monastery\./, "在掠夺者杀害了他的家人后，$1 退身于宗教中寻求慰藉，并在附近的一个修道院成为了僧侣。");
	text = text.replace(/Often traveling away from his church and fellow monks, (.*?) spent years preaching to peasantry in remote villages\./, "$1 经常离开教堂和其他僧侣，数年间一直向偏远村庄的农民传教。");
	text = text.replace(/(.*?), a quiet monk, has spent untold days worshipping the old gods in (.*?)\'s monastery\./, "$1，一个安静的僧侣，在 $2的修道院里朝拜旧神。");
	text = text.replace(/One monk amongst many, (.*?) used to wander the steepled temples of (.*?)\./, "在众多的僧侣中，$1 曾经在神殿里闲逛那是在 $2。");
	text = text.replace(/Abandoned on the steps of a monastery, (.*?) grew up in the company of monks, and soon took to their lifestyle\./, "$1 被遗弃在修道院的台阶上，在僧侣的陪伴下长大，很快就开始了他们的生活方式。");
	text = text.replace(/Trying to find peace in a land of ruin, (.*?) became a monk\./, "为了在一片荒芜的土地上寻求安宁，$1 成了一名僧侣。");
	text = text.replace(/Always an unruly child, (.*?)\'s parents handed him over to the local monastery where he was quickly pacified as a monk\./, "$1 一直是个不听话的孩子，他的父母把他交给了当地的修道院，在那里他很快成为了一个安静的僧侣。");
	text = text.replace(/Unfortunately, his abbot\'s liking for youth and fleshen things led to a terrible scandal\. (.*?) fled to preserve his life and his faith\./, "不幸的是，他的院长对年轻肉体的癖好导致了严重的公愤。$1 为了保住小命和他的信仰逃离了那里。");
	text = text.replace("But his faith was irreversibly damaged as a hellacious attack by raiders left men castrated, women raped, and children skewered on spits.", "当掠夺者的恶毒袭击使男人被阉割，女人被强奸，孩子被叉在草叉上时，他的信仰被彻彻底底的毁灭了。");
	text = text.replace("Though a believer in the old gods, the monk could not stand what atrocities his head priest committed in their name.", "尽管他信仰旧神，但他无法忍受他的顶头牧师长以神的名义犯下的暴行。");
	text = text.replace("The monk eventually left to seek spirituality on his own terms.", "僧侣最终离开了，以自己的方式寻求灵性。");
	text = text.replace(/As the world\'s suffering grew, (.*?)\'s abbot requested that he go out and heal the people of the earth - or kill those who did them wrong\./, "随着世界苦难的加剧，$1的院长请求他出去医治大地上的人们，或者消灭那些做错事的人。");
	text = text.replace(/Cults of death, beasts of nightmare, and men of cruelty. (.*?) left the halls of his temple to purify them all\./, "对死亡的崇拜，恶梦中的野兽和残忍的人。$1 离开了神殿的大厅去净化这一切。");
	text = text.replace(/But when a child asked him a faith-shattering question, (.*?) abandoned his faith, seeking out spirituality by other means\./, "当一个孩子问了他一个破坏信仰的问题时，$1 放弃了他的信仰，用其他方式寻求灵性。");
	text = text.replace(/Unfortunately, prayer did not spare his brothers from a slaughter\. (.*?) realized that his faith was better invested in looking out for himself than muttering to some so-called god\./, "不幸的是，祈祷并没有使他的兄弟免于屠杀。$1 意识到自己的信仰比对所谓的上帝祈祷要好得多。");
	text = text.replace(/Always a fiery man, (.*?) left the safety of the monasteries to go out and \'right\' the world\./, "$1 一直是一个热心的人，离开修道院的庇护，出去“纠正”世界。");
	text = text.replace(/One of the few literate men around, (.*?) abandoned his ascetic life to learn more of the world and, hopefully, to cure that which sickened it\./, "$1 是附近为数不多的有文化的人中的一员，他放弃了苦行僧的生活，去了解更多的世界，并希望能治愈那些让它生病的原因。");
	text = text.replace("But one night a woman bedded him.", "但有一天晚上，一个女人跟他上了床。");
	text = text.replace("He woke with his faith cratered in the crumpled sheets around him.", "他醒来时，他的信仰在他周围皱巴巴的被单上摔得粉碎。");
	text = text.replace("Ashamed, he never returned to his monastery.", "羞愧异常，他再也没回过修道院。");
	text = text.replace("But he used his trusted position for ill-gotten gains, stealing from the temple\'s treasury.", "但他利用自己被信任的地位谋取不义之财，从神殿的宝库中偷窃。");
	text = text.replace("It didn\'t take long for the scandal to drive him out.", "丑闻之后没多久他就被赶走了。");
	text = text.replace("Unfortunately, a child accused him of behavior unbecoming of a monk.", "不幸的是，一个孩子指责他行为不配当僧侣。");
	text = text.replace(/Nobody knows the truth behind the story, but (.*?) did not last much longer at the church\./, "没有人知道这个故事背后的真相，但 $1 在教堂的时间不长。");
	text = text.replace("One night, he discovered an awful truth in an old tome.", "一天晚上，他在一本旧书中发现了一个可怕的事实。");
	text = text.replace(/Not long after, (.*?) quickly left the church, never quite saying what it was that he discovered\./, "不久之后，$1 很快就离开了教堂，一直没说清楚他发现了什么。");
	text = text.replace("The man hardly knows a thing about fighting, but he carries the mental fortitude of a mountain standing against a storm.", "这个人几乎不懂打仗，但他有着如同抵御风暴的高山般坚毅的信念。");
	text = text.replace(/Years of solitude and prayer have left (.*?) out of shape, but it is his steeled mind that is of most value\./, "多年的孤独和祈祷使 $1 身材走样，他坚强的信念才是最有价值的。");
	text = text.replace(/Perhaps never really content with his life, it\'s difficult to entirely know why someone like (.*?) would join a band of mercenaries\./, "也许他从来没有真正满足于他的生活，很难完全知道为什么像 $1 这样的人会加入雇佣军。");
	text = text.replace(/Maybe there are too many devils in the world, or too many inside him, but you don\'t question why (.*?) wishes to join a band of sellswords\./, "也许这个世界上有太多的恶魔，或者他内心有太多的恶魔，但是你不会疑问为什么 $1 想要加入一支佣兵小队。");
	text = text.replace(/Faith won\'t cleave a greenskin, but it won\'t have a man like (.*?) running away from one, either\./, "信仰不会劈开绿皮，但它也不会让像 $1 这样的人从绿皮身边逃跑。");
	text = text.replace(/(.*?)\'s stated desire to rid the world of \'the unfaithful\' is almost scary in its determination\./, "$1 宣称要让这个世界摆脱“不忠者”的决心几乎让人害怕。");
	text = text.replace(/While (.*?)\'s spirituality is to be commended, the constant mutterings to the old gods are a bit annoying\./, "虽然 $1的灵性值得称赞，但不断对旧神嘀咕有点烦人。");
	text = text.replace(/While (.*?)\'s hands are better clasped in prayer than around the handle of a sword, few mercenaries have the sense of resolve that he does\./, "虽然 $1的双手在祈祷时比握在剑柄上更好，但很少有雇佣兵像他那样有决心。");
	text = text.replace(/A holy book practically anchored to his wrist, (.*?) has sought the company of sellswords\./, "一本几乎固定在他手腕上的圣经，$1 寻找这一支雇佣兵战队。");
	text = text.replace(/The holy book he carries is thick enough to be used as a shield, but (.*?) looks absolutely horrified when you say as much out loud\./, "他随身携带的圣经足够厚，可以作为盾牌使用，但是当你大声说出来的时候，$1 看起来绝对吓坏了。");
	text = text.replace(/Perhaps with a romantic view of mercenaries in need of a good spiritual cleansing, (.*?) seeks to accompany sellswords\./, "也许是因为有一种浪漫的观点，雇佣兵需要一个良好的精神净化，$1 寻求与佣兵相伴。");
	text = text.replace(/Once having read of warrior priests, (.*?) now wishes to emulate those brave, unwavering soldiers of faith\./, "曾经读过战士牧师的书，$1 现在希望效仿那些勇敢、坚定的信仰战士。");
	text = text.replace(/You get the feeling (.*?) wants release from this sinful world\./, "你感觉到 $1 想要从这个罪恶的世界中解脱出来。");
	text = text.replace("If that\'s the truth then he has come to the right place.", "如果那是真的，那么他来对地方了。");

//monk_turned_flagellant_background.nut
	text = text.replace(/The world was too dark for (.*?) to continue his ways\./, "这个世界太黑暗了 $1 无法继续他的修行。");
	text = text.replace("A talk with a flagellant showed him that the old gods are not happy with man\'s pursuits of justice through reasonable means.", "一次与苦修者的谈话表明，古神对人类通过合理手段追求正义并不满意。");
	text = text.replace("Now the once-monk can be found whipping himself, bleeding righteousness into the world one strike at a time.", "现在可以看到曾经的僧侣在鞭打自己，一次一次地将正义注入世界。");

//nomad_background.nut
	text = text.replace(/Like many southerners, (.*?) is someone who grew up in the desert, roaming the dunes and waylaying caravans and lost travelers alike\./, "和许多南方人一样，$1 是在沙漠中长大的人，他们在沙丘上游荡，和在旅行中的商队以及迷路的旅行者一样。");
	text = text.replace(/Born into one of the South\'s many desert tribes, (.*?) learned the ways of the sands before he learned anything else\./, "出生于南方众多沙漠部落中的一个，$1 在学到其他东西之前就学会了沙子的使用方法。");
	text = text.replace(/Nomads pepper the southern deserts and it is in one of these roaming bands that (.*?) was born\./, "游牧民在南部的沙漠中种植辣椒，$1 就是在这些漫游的队伍中诞生的。");
	text = text.replace(/True nomads are a rare find in the cities of the south and (.*?) is no different\./, "真正的游牧民在南方的城市中很少见，$1 也不例外。");
	text = text.replace(/You rarely see a nomad outside his element in the dunes of the southern sands, but (.*?) stands, darkly tanned and gritting himself again\./, "在南部沙漠的沙丘上，你很少能看到一个游牧民，但是 $1 站在那里，黝黑的皮肤任风沙磨砺。");
	text = text.replace("However, nomadic politics are a mite complicated.", "然而，游牧政治有点复杂。");
	text = text.replace("Some event, which the nomad-turned-sellsword refuses to explain, ushered him into the cities looking for work.", "某件事使他来到城里找工作，但这个当上雇佣兵的游牧民拒绝解释。");
	text = text.replace("A rule of his tribe is that every third son must travel out to see the world and, if he so wishes, return.", "他部落的规矩是第三个儿子都要出去看看世界，如果他愿意的话，再回来。");
	text = text.replace(/So, here (.*?) stands\./, "所以，$1 站在了这里。");
	text = text.replace(/Accused of sexual impropriety with a woman not formally gifted to him, (.*?) was faced with execution or exile from the tribe\./, "被指控与一个没有正式受洗的女人发生性行为，$1 面临死刑或被驱逐出部落。");
	text = text.replace("His breathing and standing before you hints at which of the two he chose.", "他站在你面前还能呼吸暗示着他选择了哪一个。");
	text = text.replace("Having murdered one of his fellow tribesman over a gambling debt, the nomad was exiled from his tribe.", "由于欠下赌债谋杀了一个部落同胞，这个游牧民族被流放出了部落。");
	text = text.replace("But a disastrous ambush, which he was responsible for planning, saw him voted out of his particular tribe.", "但是一次灾难性的伏击，他负责策划，结果他被逐出了自己的部落。");
	text = text.replace("But the nomad wished to see more of the world, to see himself as more than what he could muster within the confines of his tribe, and so he left and ventured to the cities for adventurous work.", "但是这个游牧民希望看到更多的世界，看到自己比他在部落范围内所能聚集的更多，所以他离开并冒险去城市从事冒险的工作。");
	text = text.replace("The nomad stands before you every bit of his upbringing: darkly toned, eyes black, hands sanded down.", "游牧者站在你面前，他的每一点成长经历：肤色黝黑，眼睛发黑，双手磨砺。");
	text = text.replace("If he\'s not a warrior already, he presumably could be trained into one with time.", "如果他现在还不是一个战士的话，那么假以时日他肯定能被训练成一个。");
	text = text.replace("As a man of the unbearable sands of the south, it\'s no surprise that the nomad is physically ready to take on the tasks of sellswording.", "作为一个生活在南方难以忍受的沙漠中的人，游牧民已经准备好承担佣兵的任务也就不足为奇了。");
	text = text.replace("Whether the skills are there is another matter entirely.", "技能是否到位完全是另一回事。");
	text = text.replace(/Men who venture the desert wastes are a hardy lot and (.*?) is no different\./, "在沙漠荒地冒险的人是吃苦耐劳的，$1 也不例外。");
	text = text.replace(/Nomads such as (.*?) earn most of their combat experience ambushing caravans\./, "像 $1 这样的游牧民族得了大部分伏击商队的战斗经验。");
	text = text.replace("It could be of use in a mercenary band, though frontline work is a fair bit different than waylaying poor merchants.", "它可能在雇佣兵团中有用，尽管前线工作和欺压可怜的商人有点不同。");
	text = text.replace(/(.*?) is every bit of the South as you expect: worn down by the sands, yet standing with the constitution of a man ready to take on the day and all those to come\./, "$1 就像你所期望的那样代表着南方的每一个角落：被沙子磨破了，但却保持着一个随时准备迎接新的一天和即将到来的一切的人的身体。");
	text = text.replace(/(.*?) is unlikely to be a trained and skilled fighter quite yet, but as a man of the southern wastes there is little doubt that he has the heart and spirit of a warrior\./, "$1 可能还不是是一个训练有素、技术过硬的战士，但作为一个南方荒原的人，毫无疑问他有一颗战士的心和精神。");

//nomad_ranged_background.nut

//old_gladiator_background.nut

//orc_slayer_background.nut
	text = text.replace(/(.*?) doesn\'t talk much about himself\./, "$1 很少谈论自己。");
	text = text.replace("He just wants to kill orcs and goblins which, given the state of things, makes him a perfect fit for the company.", "他只想杀死兽人和哥布林，考虑到目前的情况，他非常适合战队。");
	text = text.replace("If he\'s true to his word, he\'ll leave as soon as the invasion is taken care of.", "如果他说了实话的话，在处理完入侵之后他会尽快离开的。");

//pacified_flagellant_background.nut
	text = text.replace(/After a long talk with a monk, (.*?) was converted to a more peaceful means of expressing his faith\./, "在和一位僧侣长谈之后，$1 被转换成用一种更和平的方式来表达他的信仰。");
	text = text.replace("Now when he picks up a weapon you can be assured it will only be pointed at someone other than himself.", "现在，当他拿起武器，你可以放心，它只会指向别人，而不是他自己。");

//peddler_background.nut
	text = text.replace("House to house,", "挨家挨户，");
	text = text.replace("Once a proud merchant, now", "曾经是一个骄傲的商人，现在");
	text = text.replace("An annoyance to most,", "对大多数人都算是烦恼，");
	text = text.replace("In tough times, everyone has to scrape by somehow, hence why", "在困难时期，每个人都得勉强度日，因此为什么");
	text = text.replace("Not a man of the trades, but instead of trade itself,", "不是商业的行家，而是交易本身，");
	text = text.replace(/(.*?) is a mere peddler\./, "$1 只是个小贩。");
	text = text.replace("He\'ll dance, he\'ll sing, he\'ll boast and he\'ll act a king, anything to make that sale.", "他会跳舞，他会唱歌，他会吹嘘，他会扮演一个国王，任何事情都可以做成这笔交易。");
	text = text.replace("Pushy and unrelenting, his tenacity is admirable.", "他有进取心和不屈不挠的精神，令人钦佩。");
	text = text.replace("He\'ll try to sell off a rusty bucket for a helm once worn by kings.", "他会试图卖掉一个生锈的水桶来换取国王曾经戴过的头盔。");
	text = text.replace("This man will sell anything.", "这个人什么都会卖。");
	text = text.replace("This man will make you crave things you never knew you wanted. No refunds, though.", "这个男人会让你渴望你从未想过想要的东西。不过，概不退货。");
	text = text.replace("He used to make a decent living selling", "他以前靠卖");
	text = text.replace(", until fierce competition drove him out of business - by breaking his arm.", "，来维持体面的生活，直到激烈的竞争害他手臂折断破了产。");
	text = text.replace("Marketing himself is what this frail man does best, though few believe his pitch about having \'Great swordsmanship and resolute bravery\'.", "推销自己是这个虚弱的人最擅长的，尽管很少有人相信他关于“剑术高超，勇往直前”的话。");
	text = text.replace("He supposedly handed out \'coupons\' for his services, whatever those are.", "他应该为他的服务发放“优惠券”，不管是什么。");
	text = text.replace("He\'s chippy, though, and any outfit these days could use a warm body no matter its real value.", "不过，他很活泼，现在任何一只队伍这些日子都需要使用一个活人，不论他是否真有价值。");
	text = text.replace("If hired, he promises, you\'ll get a special discount on a virility enhancing potion.", "他承诺，如果他被录用，你将得到一个特别的折扣购买增强男子气概的药剂。");
	text = text.replace("The man lowers his voice and tells you he\'s got a great deal on rusted arrow tips, just for you.", "那人压低了声音，告诉你他有很多生锈的箭尖，只卖给你。");
	text = text.replace("He looks disappointed at your lack of interest.", "你不感兴趣，他看起来很失望。");
	text = text.replace("This man knows a man who knows a man who knows a man.", "这个人认识一个认识一个认识一个男人的人。");
	text = text.replace("All three strangers potentially better at fighting than him.", "三个陌生人都可能比他更擅长打架。");
	text = text.replace(/A shame a man can\'t fight with his words these days\. (.*?) would be unstoppable\./, "可惜的是现在一个人不能用自己的口舌去抗争。否则 $1 将无人可挡。");

//pimp_background.nut

//poacher_background.nut
	text = text.replace("Interested in the thrill of the hunt,", "热衷于狩猎的刺激，");
	text = text.replace("Looking to support his family,", "为了养家糊口，");
	text = text.replace("With a grumbling stomach,", "肚子咕咕直响，");
	text = text.replace("After a long and hard winter that left him without a stock of food,", "度过了一个漫长而艰苦的冬天使他耗尽了食物储备，");
	text = text.replace("set off into the woods in chase of deer", "出发到树林里去追捕鹿");
	text = text.replace("sought wildlife to which, if his skittishness is any indication, he may or may not have had proper claim", "寻找的野生动物，如果说他的紧张是什么暗示话，他也许有，也可能没有狩猎许可");
	text = text.replace("ate his fill of all manner of woodland creatures, a well-used bow yoked across his shoulders indicating the means to his meals", "能吃下各种各样的林中生物，肩上戴着一把用得很好的弓，表明他吃饭的手段");
	text = text.replace("took to the woods to hunt game with bow and spear", "带着弓和矛到森林里猎取猎物");
	text = text.replace(/Hailing from (.*?), (.*?)/, "来自 $1，$2");
	text = text.replace("was, as a poacher, the hunter and the hunted", "作为一个偷猎者，猎手和以及被追猎之人");
	text = text.replace("needed to feed his wife and children back home", "需要家里的养活妻子和孩子");
	text = text.replace("sought to support himself, his own hide, and his ever-growling stomach", "他寻求养活自己，栖身之所，而他的肚子却不断咆哮");
	text = text.replace("was poaching, an act of rebellion against the order of things as much as a means to fill his belly", "一直偷猎，这是一种违背秩序的行为，也是一种填饱肚子的手段");
	text = text.replace("Fearful that his pursuits would attract bounty hunters or lawmen, he decided to settle on life as a bow for hire.", "由于担心自己的工作会吸引赏金猎人或执法人员，他决定靠出卖他的射术来过日子。");
	text = text.replace("Tired of working so hard just to put food on the table, buying a meal with a sellsword\'s pay just seemed so much easier in his mind.", "他厌倦了为了吃饭而拼命工作，当一个雇佣兵的薪水买一顿饭，在他心里似乎轻松多了。");
	text = text.replace("After a bad hunt led him to a long stay in a lord\'s dungeon, he\'d rather put his neck on the line as a mercenary now than in the noose as a poacher.", "在一次糟糕的狩猎导致他长期被关在领主的地牢里之后，他宁愿现在作为一个雇佣兵而不是作为一个偷猎者被绞死。");
	text = text.replace("Years of lonely hunting wore on the man.", "多年孤独的狩猎折磨着这个人。");
	text = text.replace("Although life as a mercenary is exceedingly dangerous, he\'d rather die with company than by himself.", "虽然佣兵的生活极其危险，但他宁愿死在有人陪伴的情况下，也不愿独自一人死去。");
	text = text.replace("His wife pleaded long that he change his ways lest the whole family pay for his crimes.", "他的妻子恳求他改过自新，以免全家为他的罪行付出代价。");
	text = text.replace("He stands here now, a testament to who won the argument.", "他现在站在这里，证明谁赢了这场争论。");

//raider_background.nut
	text = text.replace(/Living by the shore, (.*?)\'s life was peppered with the spice of sea raiders\./, "住在海边，$1的生活充满了海洋掠夺者的味道。");
	text = text.replace("As an adult, he joined them in the raiding.", "成年后，他加入了掠夺行动。");
	text = text.replace(/When his family was slaughtered, newborn (.*?) was taken in by the very raiders who did it\./, "当他的家人被屠杀的时候，新生的 $1 被做了这一切掠夺者带走了。");
	text = text.replace(/Born in a faraway place, (.*?) traveled to this land looking for towns to pillage\./, "出生在一个遥远的地方，$1 来到这片土地寻找城镇抢劫。");
	text = text.replace(/A strong man from a remote part of the land, (.*?)\'s presence here has been hellacious for local residents\./, "一个来自偏远地区的壮汉，$1的存在对当地居民来说非常可怕。");
	text = text.replace(/A raider with a strong oar-arm and an even greater axe-arm, (.*?) is part of the folklore that keeps kids in bed at night\./, "有着一只强壮如桨的臂膀和另一只更壮如斧的臂膀的掠夺者，$1 是让孩子们晚上躺在床上的民间传说中的一部分。");
	text = text.replace(/Part warrior, part criminal, (.*?) has made a good life as a raider\./, "既是战士，亦是罪犯，$1 作为一名掠夺者过得很好。");
	text = text.replace(/(.*?) decided many years ago to take by force from the weak and feeble whatever he desired, and has made his presence known by raiding caravans and villages ever since\./, "$1 多年前，他决定用虚弱的力量从村庄和弱旅中夺走他想要的东西，从那之后到如今他已经通过掠夺商队和村庄让他的存在广为知晓。");
	text = text.replace(/A poor and starved boy growing up, (.*?) took to joining robbers and cutthroats out of desperation\./, "一个贫穷挨饿的小男孩长大，出于绝望，$1 加入了强盗和杀手的行列。");
	text = text.replace("For the first time in his life he didn\'t feel hunger every night, and so he continued to take by force from others what he needed.", "这是他有生以来第一次每晚都不感到饥饿，所以他继续强行从别人那里夺走他所需要的东西。");
	text = text.replace("He learned to fight and to kill without remorse, and before long, he was a monster of a man.", "他学会了无怨无悔地战斗和杀戮，不久，他就成了一个怪物。");
	text = text.replace(/Wearing a lord\'s boots and a queen\'s torn dress as a shawl, (.*?)\'s attire reflects his years of raiding well\./, "穿着领主的靴子和女王的破烂衣服披肩，$1的着装很好地反映了他多年来的掠夺。");
	text = text.replace(/The threat that stirs lords in their sleep and rushes housewives beneath beds, (.*?) is a menacing raider\./, "让领主在梦中惊醒，害家庭主妇躲到床下，$1 是一个极具威胁的掠夺者。");
	text = text.replace(/The strong take from the weak - that is the order of things that (.*?) lives by\./, "弱肉强食，这是 $1 赖以生存的准则。");
	text = text.replace("He and his comrades raided caravans and preyed on outlying farms, only to find themselves being attacked for spoils of war one day.", "他和他的战友们掠夺商队，欺凌边远的农场，结果有一天他们发现自己遭到了掠夺袭击。");
	text = text.replace(/A small band of orcs had spotted (.*?)\'s camp and washed it away like a force of nature, scattering the few survivors into every which direction. (.*?) ran and didn\'t look behind\./, "一小群兽人发现了 $1的营地，如同自然之力般将营地洗劫，少数幸存者跑向各个方向。$2 逃走了，头也不回的。");
	text = text.replace("After many years of ill-gotten gains, the man gave up the life after a raid on an orphanage ended with an out of control fire and the deaths of those inside.", "多年来一直赚取不义之财，这名男子在一次对孤儿院的突袭中，一场失控的大火导致孤儿院内人员死亡，他放弃这种掠夺的日子。");
	text = text.replace(/A devoted believer in the old ways, (.*?) desires to die a glorious warrior\'s death to take his place beside the gods\./, "一个虔诚的旧信仰者，$1 渴望死像一个光荣的战士那样战死，以此获得在神身边的一席之地。");
	text = text.replace("But slaughtering villagers like cattle won\'t get the attention of the gods, and so he now looks for a greater challenge.", "但是像屠宰牛一样屠宰村民不会引起神的注意，所以他现在寻找一个更大的挑战。");
	text = text.replace(/But while raping and pillaging, (.*?) was noticed to have a preference for the husbands over the wives\./, "但是在强奸和抢劫的时候，$1 被注意到对丈夫比妻子更偏爱。");
	text = text.replace("His taste ostracized him from the rest of the warband.", "他的性癖使他与其他兵团相形见绌。");
	text = text.replace("It started with a good raid on a merchant caravan.", "一开始是对一个商队的突袭。");
	text = text.replace("The few guards were quickly cut down and the fleeing merchant didn\'t run fast enough - a javelin to his back attested to it.", "几个卫兵很快就被砍倒了，逃跑的商人跑得不够快－他背上的标枪证明了这一点。");
	text = text.replace("The spoils were rich, but before long there was heated argument about how they were to be shared.", "战利品很丰富，但不久就有了关于如何分赃的激烈争论。");
	text = text.replace(/By evening, most of the raiders had killed each other\. (.*?) only barely escaped and had nothing to show for his day but a limping leg\./, "到了晚上，大多数掠夺者都互相残杀了。$1 只是勉强逃过一劫，除了腿变得一瘸一拐，他一天什么都没有。");
	text = text.replace("But he always had a soft spot for women, and the constant rape and murder by his comrades pushed the raider away from this lifestyle.", "但他总是对女人有好感，战友们不断的强奸和谋杀，使这个掠夺者远离了这种生活方式。");
	text = text.replace("Caught by a lord\'s guards, the raider barely escaped, instead watching from a hilltop as his comrades were executed.", "被一个领主的卫兵抓住，掠夺者差点没没逃脱，他站在在山顶上看着他的战友被处决。");
	text = text.replace("But one village ambushed his party on a raid, cutting down everyone but himself as he stole a stable horse and escaped certain doom.", "但是有一个村庄在一次突袭中伏击了他的队伍，在他偷了马厩的马并逃脱了厄运时，除了他自己，其他人都被砍倒了。");
	text = text.replace("While staking out in a forest, the raider\'s party was attacked by vicious beasts.", "在森林里巡逻时，突击队遭到了凶猛野兽的袭击。");
	text = text.replace("He fed his own comrade to the foul things just to save his own neck.", "他为了救自己的命，把自己的同伴喂给了那些肮脏的东西。");
	text = text.replace("But as war tears the world asunder, the raider realized there was less and less to actually pillage.", "但是当战争把世界撕成碎片时，掠夺者意识到真正能抢劫的东西越来越少了。");
	text = text.replace("But as conflicts boil, every village he ran into was either dirt poor or already armed to face other fiends of the world.", "但随着冲突的加剧，他所遇到的每一个村庄要么一贫如洗，要么已经准备了武器面对世界上的其他恶魔。");
	text = text.replace(/Now, (.*?) just wants a fresh start, even in the dour field of sellswords\./, "现在，$1 只是想要一个新的开始，即使是在阴暗的佣兵领域。");
	text = text.replace(/(.*?) can\'t be wholly trusted as a mercenary, but having been in league with brigands and raiders at the very least makes him fit for the work\./, "$1 作为一个雇佣兵不能完全被信任，但至少他与强盗和掠夺者有过联盟，这至少使他适合这项工作。");
	text = text.replace("The man is not brotherly in the least, but he can wield a weapon like it\'s one of his missing fingers.", "这个人一点也不兄弟，但他可以挥舞武器，就像武器是他遗失的一根手指一样。");
	text = text.replace(/While (.*?)\'s past leaves a bad taste in anyone\'s mouth, there are even worse out there\./, "虽然 $1的过去给任何人留下了不好的印象，但还有更糟糕的。");
	text = text.replace(/(.*?) is adept at killing and looting, just make sure those skills are directed toward your enemies\./, "$1 擅长杀戮和掠夺，只要确保这些技能是针对你的敌人的。");
	text = text.replace(/While a good fighter, (.*?) is first and foremost loyal to loot\./, "虽然 $1 是一名优秀的战士，但他首先忠诚于掠夺。");
	text = text.replace(/(.*?) is here to kill things and take things\./, "$1 是来杀戮和掠夺的。");
	text = text.replace("For you, this is a good thing.", "对你来说，这是件好事。");
	text = text.replace(/(.*?) wears a necklace of ears about his neck, and another necklace adorned with those ears\' earrings\. Fancy\./, "$1 脖子上戴着一条耳朵项链，另一条项链上还戴着那对耳朵的耳环。很是花哨。");
	text = text.replace(/(.*?) is a strong fighter, but he\'s in good running to be the least-liked individual in your whole party\./, "$1 是一个强大的斗士，但他很有可能成为你们整个团队中最不受欢迎的人。");
	text = text.replace("The countryside is an alluring, green canvas upon which to build a life.", "乡村是一块诱人的绿色帆布，可以在上面建立生活。");
	text = text.replace("Maybe the raider just wants to settle down.", "也许掠夺者只是想安定下来。");
	text = text.replace(/Wearing clothes tracked with their previous owner\'s blood, (.*?) looks strikingly ready for duty\./, "穿着沾有前主人血迹的衣服，$1 看起来已经准备好了。");
	text = text.replace(/You get the feeling that (.*?) is wearing clothes that someone was probably murdered in\./, "你觉得 $1 穿的衣服可能是被谋杀的那位的。");

//ratcatcher_background.nut
	text = text.replace(/Catcher of rats, that\'s the title (.*?) once preferred\./, "老鼠捕手，这个头衔 $1 曾经很喜欢。");
	text = text.replace(/With perhaps misplaced pride, (.*?) fashions himself as a man of the sewers\./, "也许是自尊心错位，$1 把自己打扮成一个阴沟人。");
	text = text.replace(/Bowlegged and scrawny, (.*?)\'s career of hunting rats has seemingly turned him into one\./, "胖乎乎、骨瘦如柴的 $1的捕鼠生涯似乎把他变成了一只老鼠。");
	text = text.replace(/He grew up in (.*?), surviving/, "他在 $1 过活");
	text = text.replace("in the alleys", "在巷里");
	text = text.replace("on rat, the fruit of the sewers", "靠老鼠，这个下水道的果实");
	text = text.replace("alongside the furry and scuttling, as well as some rats", "除了毛茸茸的动物，还有一些老鼠");
	text = text.replace("For cheap entertainment, his father taught him the ways of snaring tiny rodents", "为了廉价的娱乐，他父亲教他如何诱捕小啮齿动物");
	text = text.replace("His fallen brother\'s body was eaten by rats, forging an angry future of rodent-revenge", "他死去的弟弟的尸体被老鼠吃掉，对啮齿类动物复仇塑造了一个愤怒的未来");
	text = text.replace("His mother demanded the finest meats he could find, and she didn\'t mean from the market", "他的母亲要求他找到能找到的最好的肉，而她并不是指从市场上买");
	text = text.replace(/But (.*?) wears on people, and it wore on (.*?) like a giant, nibbling creature\./, "但是 $1 慢慢改变着人们，它让 $2 变得像一只巨大的啮齿动物。");
	text = text.replace("Hearing of greater rats in the world", "听说世界上有更大的老鼠");
	text = text.replace("Sensing that there must be more to life than rats", "感觉到生活中一定有比老鼠更有意义的东西");
	text = text.replace("Trusting his rat-whispering skills", "相信他的老鼠的低语技巧");
	text = text.replace(/, (.*?) now seeks to/, "，$1 现在试图");
	text = text.replace("put his shriveled nose, odd gnawing habits, and quick but kind of gross hands to better use.", "把他干瘪的鼻子，奇怪的啃咬习惯，以及快速但又粗糙的手更好地使用。");
	text = text.replace("crush every rat, see them driven before him, and to hear the squeals of their kin.", "压碎每只老鼠，看它们被赶在他面前，听它们亲属的尖叫声。");
	text = text.replace("He has a thousand-yard stare and a clenched fist as he tells you this.", "当他告诉你这件事时，他瞪着千里眼，紧握着拳头。");
	text = text.replace("perhaps graduate his skills from rats to dogs and maybe humans, so he says.", "他说，也许他的技能从老鼠运用到狗，也许是人类。");
	text = text.replace("He doesn\'t appear to know what he\'s in for, but perhaps it is best to not tell him.", "他似乎不知道他在干什么，但也许最好不要告诉他。");
	text = text.replace("dish up some rat soup, rat salad, rat kebab, rat bread, rat stew, rat chicken, rat wine... after a while, you just stop listening.", "上一些老鼠汤，老鼠沙拉，老鼠肉串，老鼠面包，老鼠炖肉，老鼠鸡，老鼠酒…过了一会儿，你就听不下去了。");

//refugee_background.nut
	text = text.replace("Catastrophes are cheap.", "灾难很频繁。");
	text = text.replace("Disease, the ultimate invisible hand.", "疾病，最终无形的手。");
	text = text.replace("Win or lose a war, everything is as it has been.", "无论战争输赢，一切都还是那样。");
	text = text.replace(/(.*?) hails from a tiny village that/, "$1 来自一个小村庄");
	text = text.replace("is now only remembered by spoken word, a generation away from being forgotten.", "这个村庄现在只有口头语才能记住，还有一代人就要被彻底遗忘了。");
	text = text.replace("was destroyed, to put it succinctly.", "简而言之，它被摧毁了。");
	text = text.replace("now stands as a mere footnote, wasting little of the historian\'s ink.", "现在只不过是一个脚注，几乎不浪费历史学家的笔墨。");
	text = text.replace("suffered the world\'s wrath.", "遭受了这个世界的愤怒。");
	text = text.replace(/But (.*?) is a survivor\./, "但是 $1 是一个幸存者。");
	text = text.replace("He fled the disaster with just the clothes on his back.", "他只带着身上的衣服逃离了灾难。");
	text = text.replace("His home ablaze, he saved what he could and fled.", "他的家着火了，他尽其所能救了的，然后逃走了。");
	text = text.replace("After stumbling upon his dead family, he gathered what he could and ran.", "在偶然发现他死去的家人后，他收拾了能收拾地逃跑了。");
	text = text.replace("War, famine, disease. It\'s all a blur to him now.", "战争、饥荒、疾病。现在对他来说一切都是模糊的记忆。");
	text = text.replace(/(.*?) is merely a man anxious to look ahead rather than behind\./, "$1 只是一个急于向前看而不是向后看的人。");
	text = text.replace(/(.*?) carries little more than a sense of steeled determination, but that is something worth having\./, "$1 唯一拥有的是他坚定的决心，但这是值得拥有的东西。");
	text = text.replace("A horrific history scars his body and glazes his eyes, but the man is easily motivated to never experience that past again.", "一段可怕的过往让他伤痕累累，目光呆滞，但这个人为了再也不经历过去所经历的一切很容易被激励。");
	text = text.replace("Whatever befell the man\'s town didn\'t get him and, judging by the rumors you hear, that\'s saying something.", "不管发生在镇上的什么事都没有让他中招，从你听到的传闻来看，那儿确实发生了什么。");
	text = text.replace("The man isn\'t skilled in martial arts, but he is for damn sure determined to survive.", "这个人战力不高，但他活下去的决心很强。");
	text = text.replace("Whatever vocation he had in the past is now lost.", "他过去的工作现在都不复存在了。");
	text = text.replace("Like many others, he seeks mercenary work to get by in this increasingly bloody world.", "像许多其他人一样，他在这个日益血腥的世界里寻求雇佣兵工作。");
	text = text.replace("One of many refugees you\'ve seen, this man has decided to stop running and start fighting.", "他是你见过的众多难民中的一个，这人已经决定停止逃跑开始战斗。");

//retired_soldier_background.nut
	text = text.replace(/in the army of a local lord, (.*?)/, "在当地领主的军队中，$1");
	text = text.replace("retired from service after taking an arrow to the knee", "膝盖中了一箭后退役了");
	text = text.replace("was replaced by an aspiring youngster.", "被一个有抱负的年轻人取代");
	text = text.replace("was expelled after falling asleep on guard duty", "在守卫任务中睡着后被开除");
	text = text.replace("retired after a long and exemplary service", "在长期的模范服役后退休");
	text = text.replace("was wounded in combat and forced to retire", "在战斗中受伤被迫退休");
	text = text.replace("grew weary of the battles and bloodbaths, formally ending his service before it ruined his mind", "厌倦了战斗和血洗，正式结束他的服役生涯，以免他的思想崩溃");
	text = text.replace("battled the ferocious orc hordes, the campaigns eventually forcing him into retirement", "与凶猛的兽人部落作战，战役最终迫使他退休");
	text = text.replace("He locked his equipment in a chest along with the memories of his duty, intending to never pick up either one again", "他把自己的装备连同他的职责记忆一起锁在一个箱子里，打算再也不将他们拾起了");
	text = text.replace("He shelved both sword and shield in his study as merely relics of a military past", "他把剑和盾牌都放在书房里，仅仅当做是战争过往的遗物");
	text = text.replace("He hung his weapons above the chimney as a silent reminder of the man he used to be", "他把武器挂在烟囱上方，默默地提醒着他过去所谓何人");
	text = text.replace("But a new chapter in his life was awaiting him, one where he would not need a sword to get on with his day", "但他生命中的一个新篇章正等待着他，在那里他将迎来他不需要一把剑就可以继续他的一天");
	text = text.replace("With many years of service behind him, he could finally get some peace and quiet", "在他服役多年后，他终于可以得到一些安宁和宁静");
	text = text.replace("Absent of a military drill\'s barking, his life never felt so quiet", "没有军演的叫嚷，他的生活从来没有这么安静过");
	text = text.replace("For many years he lived a happy life with his beloved wife, until she died of old age.", "多年来，他和心爱的妻子过着幸福的生活，直到她老去。");
	text = text.replace("With nothing else to turn to", "生活再无目标");
	text = text.replace("Only when finding out that his former comrades were brutally slain in an ambush", "只有当他发现他以前的战友在伏击中惨遭杀害时");
	text = text.replace("Only when hearing rumors of a large invasion about to destroy his homeland,", "当他听到一场大规模入侵将要摧毁他的家园的传闻时，");
	text = text.replace("He tried to live as a farmer for a while, but every day he missed having a good sword in hand and standing in the shieldwall. Finally,", "他试着做了一段时间的农夫，但每天他都怀念手握好剑在身处盾墙的时光。最后，");
	text = text.replace("But life outside the army, as it turned out, was not for him, for he felt idle and useless. Finally,", "事实证明，军队以外的生活并不适合他，因为他感到无所事事，毫无用处。最后，");
	text = text.replace("For a time, he felt at ease.", "有一段时间，他感到很自在。");
	text = text.replace("But as the land was consumed by warfare,", "但是，当土地被战争消耗殆尽时，");
	text = text.replace("Time spent away from war was short-lived, as the war soon came to him.", "远离战争的时间是短暂的，因为战争很快就来到了他身边。");
	text = text.replace("It wasn\'t long until", "没过多久");
	text = text.replace(/Living out on a farm, boredom crept at (.*?)\'s wits until, finally,/, "在一个农场里生活，无聊感在 $1的头脑中蔓延，直到最后，");
	text = text.replace("he picked up arms once more. Although", "他再次拿起武器。尽管");
	text = text.replace("his best days are long over", "他最好的日子已经过去了");
	text = text.replace("not as physically fit as he once was", "身体状况不如从前");
	text = text.replace("his constitution is not that of a young man anymore", "他的体质已不再是年轻人的体质了");
	text = text.replace("he is not the brash young fighter he once was", "他不再是从前那种胆大的年轻斗士了");
	text = text.replace("time away from the service has dampened his abilities", "离开部队的日子削弱了他的能力");
	text = text.replace("his swordfighting skills are still enough to beat any young braggart", "他的剑术仍然足以打败任何一个吹牛的年轻人");
	text = text.replace("he still knows how fighting is done on the battlefield", "他仍然知道如何在战场上战斗");
	text = text.replace("his experience is second to few", "他的经验是屈指可数的");
	text = text.replace("he can rely on the combat experience of a lifetime", "他可以依靠一生的战斗经验");
	text = text.replace("he is eager to stand amongst brothers", "他渴望站在兄弟中间");
	text = text.replace("he is eager to find battle again", "他渴望再次寻求战斗");
	text = text.replace("his itch to find battle is mirrored by his capabilities to actually fight", "他渴望找到战斗的渴望反映在他实际的战斗能力上");
	text = text.replace("he still knows a thing or two about holding a shieldwall", "他还是知晓如何保持盾墙");

//sellsword_background.nut
	text = text.replace(/(.*?)\'s worked as a sellsword since his father handed down his equipment\./, "$1 从他父亲手上接过他的装备后，开始了佣兵的工作。");
	text = text.replace(/(.*?) can\'t remember a time when he wasn\'t a sword for hire\./, "$1 不记得他不是雇佣之剑的日子了。");
	text = text.replace(/As a mercenary, (.*?) has never had to look long for work\./, "作为一个雇佣兵，$1 从不需要花太长时间找工作。");
	text = text.replace(/The literate talk about letting loose the dogs of war. (.*?) is one such hound\./, "学者谈论释放战犬。$1 就是这样的猎犬。");
	text = text.replace(/In war, there is death and profit\. (.*?) causes the former to earn the latter\./, "战争中有死有利。$1 造成前者赚取后者。");
	text = text.replace(/There has never been a better time for mercenaries like (.*?) to earn a crown or two\./, "对于像 $1 这样的雇佣兵来说，赢得一两个克朗是再好不过的了。");
	text = text.replace(/After his wife ran off with his children, an angry (.*?) made a steady career as a nasty sellsword\./, "在他妻子带着孩子私奔后，愤怒 $1 把当卑鄙的佣兵当做了一个稳定的职业。");
	text = text.replace(/A decade ago (.*?) lost everything in a fire\./, "十年前 $1 在一场火灾中失去了一切。");
	text = text.replace("He\'s been working as a sellsword ever since.", "从那以后，他一直干佣兵的活。");
	text = text.replace(/(.*?) always had the mind for violence and has pursued a long career as a sellsword\./, "$1 一直有暴力的想法，并长期从事佣兵职业。");
	text = text.replace(/Once dirt poor, (.*?) has earned a very tidy sum over the years as a sellsword\./, "曾经一贫如洗的 $1 多年来作为佣兵赚了一大笔钱。");
	text = text.replace(/(.*?) prefers to keep for himself whence he came, but his reputation as a sword for hire speaks for itself\./, "$1 宁愿回归故里，但他作为雇佣兵的名声已经不言而喻。");
	text = text.replace("Well experienced, he has traveled in the company of many outfits in his time.", "经验丰富，他曾跟随许多武装战队旅行。");
	text = text.replace("Military campaigns are but notches in his belt.", "军事行动对他来说不过是小菜一碟。");
	text = text.replace(/From work as a lord\'s bodyguard to being an enforcer for a skeevy merchant, (.*?) has seen it all\./, "从一个领主的保镖到一个肮脏商人的打手，$1 已经见识了各种。");
	text = text.replace("He once made a living off slaying the wild beasts that encroach on human settlements.", "他曾经以杀戮侵占人类住区的野兽为生。");
	text = text.replace("With a grim grin, he boasts he has slain all manner of living creatures.", "他咧嘴一笑，吹嘘自己杀死了各种各样的生物。");
	text = text.replace("Through plenty of use, the mercenary has learned a thing or two about weapons you didn\'t even know existed.", "通过大量的使用，雇佣兵学会了一些你甚至不知道是否存在的武器。");
	text = text.replace("The sellsword is counting how many he has slain to this day and he appears to not be stopping any time soon.", "佣兵正在计算他今天已经杀了多少人，他似乎不会很快停止。");
	text = text.replace("With a sword and shield in hand, the mercenary appears to do what he does best for a living.", "手里拿着剑和盾牌，雇佣兵似乎在做他最擅长的工作。");
	text = text.replace("The man is no stranger to the fields of battle.", "这个人对战场并不陌生。");
	text = text.replace("The man is no stranger to the cruelties of war.", "这个人对战争的残酷并不陌生。");
	text = text.replace("He is used to the harsh realities of mercenary life.", "他已经习惯了唯利是图的残酷现实。");
	text = text.replace("He is said to be a reliable cog in any shield wall.", "据说他是任何盾墙中可靠的齿轮。");
	text = text.replace("Some say he can hold a battle line as well as an oak tree.", "有人说他能像橡树一样坚守战场。");
	text = text.replace("Rumors abound that the man enjoys the sight of blood.", "传闻说这个人喜欢看血。");
	text = text.replace("Without shame, he takes an uneasy pleasure in the misery of others on the battlefield.", "毫无羞耻，他对战场上其他人的痛苦感到一种令人不安的愉悦。");
	text = text.replace("Strangely, he seldom joins others around the campfire, instead keeping to himself.", "奇怪的是，他很少在篝火旁和其他人在一起，而是保持沉默。");
	text = text.replace("The man loves to tell a good tale about how he killed this thing or that.", "这个人喜欢讲他是怎么杀了这个或那个东西的。");
	text = text.replace("Given a chance, the man is quick to showcase a wide variety of fighting styles.", "如果有机会，这个人很快就能展示出各种各样的战斗风格。");
	text = text.replace(/As long as you have the coin, (.*?) is yours to command\./, "只要你有硬币，$1 就归你指挥了。");
	text = text.replace(/A true mercenary, (.*?) will fight anyone for the right price\./, "一个真正的唯利是图的人，只要价钱合适 $1 会与任何人战斗。");
	text = text.replace(/Displaying some fine swordsmanship, (.*?) says he can run any man through\./, "显示出高超的剑术，$1 说他可以击败任何人。");
	text = text.replace(/With but a hint of a nod, (.*?) agrees to join you if you have the crowns\./, "只要点头，$1 就同意加入你，如果你有克朗的话。");
	text = text.replace(/Excited for an opportunity to earn coin, (.*?) knocks his mug on the table\./, "$1 为有机会赚到硬币而兴奋得在桌上敲着酒杯。");

//servant_background.nut
	text = text.replace("Life is difficult. Moreso for some than others.", "生活很艰难。而对某些人来说尤其如此。");
	text = text.replace("Some men can fall from grace.", "有些人会失宠。");
	text = text.replace("Other men have nowhere to fall to, having been born already on the ground.", "其他人一出生，就无处可投靠。");
	text = text.replace("If life is a throw of dice, maybe some are fools to be men rather than mice.", "如果生活是掷骰子，也许有些人成为人而不是老鼠是愚蠢的。");
	text = text.replace("was a servant to a decadent lord.", "是一个颓废领主的仆人。");
	text = text.replace("was a servant to a decadent vizier.", "是一个颓废维齐尔大臣的仆人。");
	text = text.replace("served an abusive family where the kids played with fire.", "为一个孩子玩火的虐人家庭服务。");
	text = text.replace("was kidnapped by brigands and forced to serve their every. Last. Need.", "被强盗绑架，被迫为满足他们的要求服务。每一个。必须。");
	text = text.replace("worked feverishly for mad men who looked far too long at the stars.", "狂热地为那些盯着星星看得太久的疯子工作。");
	text = text.replace("He rarely made a mistake about his place in the world.", "他很少在自己的地位上犯错误。");
	text = text.replace("One day, though, his masters", "然而，有一天，他的主人");
	text = text.replace("beat him unconscious. When he awoke, he did so in the bed of a benevolent doctor who refused to return him to his \'employers\'.", "把他打晕了。当他醒来时，他躺在一位仁慈的医生的床上，医生拒绝把他交给他的“雇主”。");
	text = text.replace(/Instead, (.*?) was free to go and his masters were told he had died\./, "相反，$1 被告知可以自由离开，而他的主人他已经死了。");
	text = text.replace("set him free, no questions asked.", "放他自由，不问任何问题。");
	text = text.replace(/Not one to dally on ceremony, (.*?) left in earnest\./, "没人在仪式上磨蹭，$1 热心地离开了。");
	text = text.replace("invited him to a party.", "邀请他参加一个聚会。");
	text = text.replace("Believing he was a guest, he showed up in his finest attire - a shirt with hemmed sleeves and a billowy set of pantaloons that hid his skeletal frame well.", "他以为自己是客人，就穿着他最好的衣服出现了－一件袖子卷边的衬衫和一套蓬松的长裤，很好地隐藏了他嶙峋的骨架。");
	text = text.replace("Unfortunately, he was but a show for the party - they gave him a wooden shield and sword, threw him into an arena with a wild boar, and took bets as they watched the horrific spectacle.", "不幸的是，他不过是派对上的一场秀－他们给了他一个木盾和一把剑，把他和一头野猪一起扔进竞技场，一边看这可怕的场面一边下注。");
	text = text.replace("He barely escaped the \'festivities\'.", "他差点没逃过这场“庆祝活动”。");
	text = text.replace(/(.*?) has since sworn to never \'serve\' someone again\./, "$1 从此发誓不再“为”某人服务。");
	text = text.replace("The man, though now free of his duties, still bears a great deal of humiliation and pain from his long, hard life.", "这个人，虽然现在从他的差事中解脱了，但他仍然因为长期艰难的生活承受着极大的屈辱和痛苦。");

//shepherd_background.nut
	text = text.replace(/(.*?) was just a simple shepherd from a simple town, spending many years tending to his flock\./, "$1 只是一个简单的牧羊人，来自一个简单的小镇，花了很多年照顾他的羊群。");
	text = text.replace(/A lovely place like (.*?) deserved a lovely shepherd like (.*?)\./, "像 $1 这样可爱的地方应该有一个这样可爱的牧羊人，像是 $2。");
	text = text.replace(/(.*?) inherited his flock the same day he buried his father\./, "$1 在埋葬父亲的同一天继承了他的羊群。");
	text = text.replace(/As a child, (.*?) stumbled upon a dead shepherd and the listless flock beside him\./, "小时候，$1 偶然发现了一个死去的牧羊人和他身边无精打采的羊群。");
	text = text.replace("The boy took up the shepherd\'s staff and continued his work for many years.", "那男孩拿起牧羊人的手杖，接着他的工作干了了许多年。");
	text = text.replace(/More colorblind than a dog, (.*?) always enjoyed the company of color-friendly sheep\./, "比狗更色盲的 $1 总是喜欢和颜色喜人的绵羊在一起。");
	text = text.replace(/When (.*?) fell from a tower, a flock of sheep broke his fall\./, "当 $1 从塔上掉下来时，一群羊阻止了他的坠落。");
	text = text.replace("He vowed to repay their sacrifice by being the safest shepherd in the land.", "他发誓要成为这片土地上最安全的牧羊人来报答他们的牺牲。");
	text = text.replace(/(.*?) found profit in bandying sheep about from one town to the next, selling their coats to tailors and skins to tanners\./, "$1 把羊从一个镇带到另一个镇，把它们的羊毛卖给裁缝，把皮卖给制革厂，从中获利。");
	text = text.replace(/Tending sheep was the easiest job (.*?) could find\./, "放羊是 $1 能找到的最简单的工作。");
	text = text.replace(/As harmless as the sheep he tends, (.*?) took to shepherding to find peace in the cruel world\./, "和他看管的羊群一样无害，$1 通过牧羊，在残酷的世界里寻找和平。");
	text = text.replace(/Never one to find good company amongst humans, (.*?) preferred the somber sapience of sheep\./, "从来没有人能在人类中找到好朋友，$1 更喜欢羊的阴郁智慧。");
	text = text.replace(/Bullied as a child, (.*?) found peace in tending flocks of sheep\./, "从小被欺负的 $1 在放羊的过程中找到了安宁。");
	text = text.replace(/The playfully obedient sheep of (.*?)\'s life gave him the peace and calm from an otherwise rough upbringing\./, "$1 那群贪玩温顺的羊通过相当粗野的教养给了他一种平静和安详。");
	text = text.replace("Once mistaken for a", "曾经被误认为是");
	text = text.replace(/, (.*?) escaped the/, "，$1 逃脱了");
	text = text.replace(" religious hordes ", " 宗教信众 ");
	text = text.replace(" angry inquisitors ", " 愤怒的检察官 ");
	text = text.replace("by disappearing into the vocation sheep shepherding.", "是通过躲进牧羊工作做到的。");
	text = text.replace(/munch on grass all day sounds boring, but to (.*?) it was bliss\./, "在草地上吃草听起来有点无聊，但对于 $1 来说却很快乐。");
	text = text.replace(/Enthralled by a sheep herding competition, (.*?) took to shepherding as a surprisingly competitive vocation\./, "$1 因为一场牧羊比赛上了道，把牧羊当作一项竞争异常激烈的工作。");
	text = text.replace(/Always a soft, kind boy, shepherding just made sense to the likes of (.*?)\./, "一直是一个温柔善良的男孩，牧羊对这样的人来说很有意义是对于 $1。");
	text = text.replace("Escaping his abusive", "逃离虐待他的");
	text = text.replace(/, (.*?) took the tranquility of being a shepherd\./, "，$1 通过当一个牧羊人得到了宁静。");
	text = text.replace("Mixed up in a religious conflict between gods followers and cultists, his flock suffered the wrath of those looking for both scapegoats and sacrifices.", "在上帝信徒和邪教信徒之间的宗教冲突中，他的羊群受到了那些寻找替罪羊和祭品的人的愤怒。");
	text = text.replace("Once fending off", "有一次他用手杖挡开了");
	text = text.replace("with his walking stick, the shepherd wondered if maybe he was more physically capable than he once thought.", "牧羊人拿着手杖，想知道他是否比他原本以为的更加身强力壮。");
	text = text.replace("As time passed, the man felt", "随着时间的推移，这个人觉得");
	text = text.replace("as though his vocation had passed him by.", "他的职业已经离他远去了。");
	text = text.replace("like his heart just wasn\'t in it anymore.", "好像他的心思不在这上面了。");
	text = text.replace("He mournfully retired", "他悲伤地退休了");
	text = text.replace("He hung up his shepherding stick", "他挂上了他的牧羊杖");
	text = text.replace("and sought out other work.", "去找别的工作。");
	text = text.replace("Feeling as though he was seeing the world\'s beauty but not experiencing it in full, the man decided to abandon shepherding.", "他觉得自己似乎看到了世界的美丽，却没有完全体验到，于是决定放弃牧羊。");
	text = text.replace("When hulking, furry beasts slaughtered his flock, the shepherd was left looking for vengeance.", "当粗陋的、毛茸茸的野兽屠宰他的羊群时，牧羊人开始寻求复仇。");
	text = text.replace("Sadly, the man\'s sole companion, a shepherding dog, was killed by", "不幸的是，这个人唯一的同伴，一只牧羊犬，被杀于");
	text = text.replace(", leaving the peaceful man looking for revenge.", "，让这个和平的人去寻求复仇。");
	text = text.replace("Caught in a loan shark\'s schemes, though, the shepherd suddenly needed more coin than his flock of sheep could ever provide.", "然而，陷入一个诈骗者的阴谋中，牧羊人突然需要比他羊群所能提供的更多的硬币。");
	text = text.replace("However, the loneliness of his life finally got the shepherd.", "然而，他生活中的寂寞终于打倒了这个牧羊人。");
	text = text.replace("But long days and nights by himself wore on the shepherd as they would any man.", "但是长时间的日日夜夜独自一人使牧羊人和其他任何人一样疲惫不堪。");
	text = text.replace("But he could not escape the masculinity his father expected of him, and one day put down his walking stick to seek out a manlier vocation.", "但他无法摆脱父亲对他男子气概的期许，有一天他放下手杖，去寻找一个更有男子气概的职业。");
	text = text.replace("But one day, textiling while tending, he led every last sheep over a cliff.", "但有一天，他一边放牧一边织羊毛，把他的所有羊都牵到悬崖边上。");
	text = text.replace("But on a rainy afternoon he took one baaa too many: he had to do something beyond just stare at sheep all day.", "但在一个雨天的下午，他思考着：除了整天盯着羊看之外，他还得做些什么。");
	text = text.replace("One morning he awoke covered in sheep\'s blood, entrails, and bloody, entrails-laden wool.", "一天早晨，他醒来时浑身是羊血，内脏，还有带血沾满内脏的羊毛。");
	text = text.replace("Wolves howled merrily in the distance.", "狼在远处欢快地嚎叫。");
	text = text.replace("As it turned out, he had counted one too many sheep that night.", "结果，那天晚上他数了很多次羊。");
	text = text.replace("Unfortunately, rumors of what he did in the privacy of his flock were too embarrassing to face and he had to flee to greener, more accepting pastures.", "不幸的是，关于他在自己的羊群里所做的事的传闻太令人难堪了，他不得不逃到更绿、更容易接受的牧场。");
	text = text.replace("Sadly, brigands drunk on violence stumbled upon his flock.", "可悲的是，醉心于暴力的强盗们偶然发现了他的羊群。");
	text = text.replace("Sadly, nomads drunk on violence stumbled upon his flock.", "可悲的是，醉心于暴力的游牧民们偶然发现了他的羊群。");
	text = text.replace("Bessie, Little Ada, and even the newborn Goatsieg were bloodily dispatched.", "贝茜，小阿达，甚至新生的山羊羔羊都被血腥地带走了。");
	text = text.replace(/While stopping into town to think things over, (.*?) stumbled upon a call for mercenaries\./, "在进城考虑问题时，$1 无意中接到一个雇佣兵的征召。");
	text = text.replace("With nothing to lose, he is ready to sign up.", "没有什么可以损失的，他准备报名了。");
	text = text.replace("The land had no place for a peaceful shepherd.", "这片土地没有地方容得下一个平和的牧羊人。");
	text = text.replace("It was time to move on to a new life.", "是时候开始新生活了。");
	text = text.replace(/A tiny, blood-rusted bell clings below (.*?)\' neck\./, "$1的脖子下面有一个生锈的小铃铛。");
	text = text.replace("It is a relic of another life, and perhaps the sign of a new one.", "它是另一个生命的遗物，也许也是新生活的标志。");
	text = text.replace("He swears to still hear the bleating of his flock.", "他发誓仍能听到他的羊群的叫声。");
	text = text.replace("For some reason, this does not inspire much confidence in his fighting skills.", "出于某种原因，这并不能激发人们对他的战斗技巧的信心。");
	text = text.replace("Although peaceful as could be, without a flock the man is lost.", "虽然尽可能的保持平和，但没有了他的羊群，这个人还是有点迷失。");
	text = text.replace("While hardly a fighter, the man knows how to keep a tight formation.", "虽然他不是一个战士，但他知道如何保持严密的队形。");
	text = text.replace(/(.*?) knows the stars surprisingly well and can locate a sound in the darkness like a blind dog sniffing a treat\./, "$1 对星星了如指掌，能在黑暗中找到一个声音，就像一只盲狗嗅着食物一样。");
	text = text.replace(/Walking so much has given (.*?) sturdy legs, but the most combat experience he has is with a stick\./, "走了这么久使 $1 的腿变得结实，但他最有战斗经验的是使用棍子。");
	text = text.replace("The world doesn\'t usually turn to shepherds in its time of need, but this is one very needy world at the moment.", "世界在需要的时候通常不会求助于牧羊人，但现在是一个非常困难的世界。");
	text = text.replace("Staring at the shepherd, you wonder just how bad things have gotten for such a man to be standing where he is.", "盯着牧羊人，你在想，情况有多糟糕才会使这样一个站在这儿。");
	text = text.replace(/(.*?) carries almost all weapons like they\'re walking sticks, and he has a bad habit of whacking the legs of others to move them along\./, "$1 把几乎所有的武器当手杖一样带着，并且他有一个坏习惯，就是敲打别人的腿来让他们移动。");
	text = text.replace(/(.*?)\'s humility is a welcome respite from the usual gungho brethren that become sellswords\./, "$1的谦卑对成为佣兵的团结兄弟们来说是个短暂的慰藉。");
	text = text.replace(/(.*?) looks like he wouldn\'t hurt a fly, but with good training you can see to it that he\'ll hurt a lot more than that\./, "$1 看起来他不会伤害苍蝇，但是经过良好的训练，你可以看到他会造成更多的伤害。");
	text = text.replace(/(.*?) doesn\'t carry the murderous conviction of other sellswords, but like any man he can be trained up in all the right ways\./, "$1 不像其他雇佣兵那样有凶残的念头，但和其他人一样，他可以接受各种训练。");
	text = text.replace(/Some of the (.*?)\'s men are little better than sheep\./, "$1的有些人比绵羊强不了多少。");
	text = text.replace(/Maybe (.*?) has a place here after all\./, "也许 $1 在这里有一席之地。");

//slave_background.nut
	text = text.replace(/You can tell (.*?) is a northerner simply by appearance\./, "从外表就可以看出 $1 是北方人。");
	text = text.replace("And his servitude in the south has come by way of being indebted to the Gilder whom he has transgressed with his faith in the heretical old gods.", "他在南方被奴役是由于他对异端的古老神的信仰而违背了镀金者。");
	text = text.replace(/(.*?) bears the features of a northerner, easily capturing the eye of passing men or women\./, "$1 具有北方人的特征，很容易吸引路过的男人或女人的目光。");
	text = text.replace("It also happened to catch the attention of a priest who claimed the northerner was indebted to the Gilder and promptly sold the interloper into servitude.", "这件事也碰巧引起了一位牧师的注意，他声称北方人欠了镀金者的债，并立即把闯入者卖为奴隶。");
	text = text.replace(/A northerner, (.*?) was once a soldier sent south on patrol\./, "一个北方人，$1 曾经是一个被派往南方巡逻的士兵。");
	text = text.replace("Lost in the desert, his troop slowly dwindled until he was the last survivor.", "在沙漠中迷失了方向，他的部队人数慢慢地减少，直到他成为最后一个幸存者。");
	text = text.replace("Manhunters caught him and brought him back from the brink, and of course sold him into servitude once his healed body was worth something.", "搜捕者抓住了他，把他从悬崖边上救了回来，当然，一旦他治愈的身体有了价值，就把他出卖为奴隶。");
	text = text.replace(/Despite being a northerner and thus easily spotted, (.*?) unwisely sought the criminal life and was caught thieving pomegranates from a Vizier\'s garden\./, "尽管 $1 是一个北方人，因此很容易被发现，但他还是不明智地寻求犯罪生活，并在维齐尔大臣的花园偷石榴时被抓。");
	text = text.replace("He\'s lucky to have his head, but now serves as a commodity of labor on the Manhunting markets.", "他很幸运保住了自己的的脑袋，但现在却成了搜捕者市场上的劳动力商品。");

//slave_southern_background.nut
	text = text.replace(/Much of the southern city states float atop the expendable bodies of prisoners of war, criminals, and indebted, throngs of people who have slighted the Gilder or His followers and must \'earn\' salvation through hard work. (.*?) is one such unfortunate soul\./, "许多南部城邦建立在战俘、罪犯和负债者的可牺牲的尸体上，这些人蔑视了镀金者或他的追随者，必须通过努力工作来获得救赎。$1 就是这样一个不幸的灵魂。");
	text = text.replace(/Like a shocking many, (.*?) was not always a hunted man\./, "跟很多糟糕的人一样，$1 并不一直是被追捕的人。");
	text = text.replace("He worked as a traveling merchant until nomads ambushed his caravan.", "他是一个旅行商人直到被游牧民伏击了他的商队。");
	text = text.replace("The nomads took him to a Vizier, pretending the man a criminal, and sold him as a hunted man.", "游牧民族把他带到一个维齐尔大臣那里，假装这个人是罪犯，然后把他当作一个追捕的人卖掉。");
	text = text.replace(/Spotted for his handsomeness, (.*?) was kidnapped off the streets of (.*?) and sold straight to a manipulative Vizier\./, "因其英俊的外表而被发现，$1 在 $2 的街道上被绑架，然后直接卖给了一个善于操控的大臣。");
	text = text.replace("He does not speak much of what all happened, but there is a sense manual labor was not his sole duty.", "他不怎么说发生了什么事，但有一种感觉，体力劳动并不是他唯一的工作内容。");
	text = text.replace(/So great the religious transgressions of his predecessors, (.*?) was born into an indebted family, and it is uncertain how far back into his ancestry you must go before a truly free man would be found\./, "他的前辈们的宗教罪过如此之大，$1 出生在一个负债者的家庭里，不知道要翻多少辈祖先才能找到一个自由人。");
	text = text.replace(/Desperate to save his family from generational debt, (.*?) sold himself into indentured servitude to ensure his wife and children have a life to live for themselves\./, "为了挽救家庭免于一代的债务，$1 把自己出卖成契约奴役，以确保妻子和孩子有自己的生活。");
	text = text.replace(/(.*?) swears he is from the north, but the deserts of the south have left him darkly tanned and, frankly, you\'ve not much reason to believe the words of a former prisoner of war no matter where he\'s from\./, "$1 发誓他是北方人，但是南方的沙漠让他晒得黝黑，坦白地说，你没有太多的理由相信一个前战俘的话，不管他来自哪里。");
	text = text.replace(/A once sea-farer, (.*?) spent years as an oarmen traveling from harbor to harbor to drive the goods of opulent merchants\./, "一个曾经的海上旅行者，$1 花了数年的时间当划船工，从一个港口到另一个港口，为富商们的货物开船。");
	text = text.replace("Those who gave him to you stated he has a criminal past in piracy.", "把他交给你的人说他有海盗犯罪的前科。");
	text = text.replace(/(.*?) was accused of ravishing an old woman and was given the option of execution or lifelong servitude\./, "$1 被指控猥亵一位老妇人，被判死刑或终身奴役。");
	text = text.replace(/Caught stealing from a fruit stall, (.*?) was pressed into lifelong servitude\./, "在水果摊偷东西被抓，$1 被迫终身奴役。");
	text = text.replace(/Fornications with \'non-women\' led to (.*?)\'s submission to servitude per the rules of the city-state in which he broke the laws\./, "与“非女性”的通奸导致 $1 按照他违反法律的城邦的规定被奴役。");
	text = text.replace("It was either that or become a eunuch, and you can hardly blame him for choosing the hard labor in this case.", "不那样，就得当太监，你也不能怪他在这种情况下选择了苦役。");
	text = text.replace("The hardships of his life, rather quaintly, may serve as an excellent cast from which to mold a proper mercenary.", "他生活的艰辛，相当离奇，可以作为一个优秀的模子来塑造成一个合适的雇佣兵。");
	text = text.replace("His servitude no doubt made the man formidable in appearance, though it may be hard to say where his mind is at being what is essence an indentured sellsword.", "他遭受的奴役无疑使这个人在外表上令人畏惧，尽管很难说他在成为本质上是契约佣兵这件事上的想法如何。");
	text = text.replace(/Slaves for warriors are a usual sight in the southern cities and (.*?) might serve as a useful, albeit enslaved, sellsword yet\./, "在南方城市，奴隶成为战士很常见，$1 可能会成为一个有用的，尽管还是奴隶的佣兵。");
	text = text.replace(/You hope (.*?) could make a sound sellsword, but you have the feeling his primary allegiance is to that which any man wishes to taste: freedom\./, "你希望 $1 能成为一个完美的佣兵，但是你感觉到他主要效忠的是任何人都想尝到的东西：自由。");

//squire_background.nut
	text = text.replace(/A young squire, (.*?) dutifully accompanied his knight to many battles\./, "$1，一个年轻的扈从，尽职地陪伴他的骑士参加了许多战斗。");
	text = text.replace(/Squire to a harsh knight, (.*?) spent his days running errands for his lordship\./, "一位严酷的骑士的扈从，$1 终日为他的主人跑腿。");
	text = text.replace(/Although a squire, (.*?)\'s life largely meant guarding prisoners of war, much to his chagrin\./, "虽然是一个扈从，$1 的生活很大程度上意味着看守战俘，这让他非常懊恼。");
	text = text.replace(/Squire to a knight, sure, but (.*?) mostly cleaned latrines, fed dogs, and got far too much use out of a shinebox\./, "一位骑士的扈从，当然，但是 $1 主要工作是扫厕所，喂狗狗，且用了太多次擦鞋盒。");
	text = text.replace("One night, strange, shuffling men silhouetted the moonlit horizon.", "一天晚上，一群陌生鬼鬼祟祟的人在月光下显出轮廓。");
	text = text.replace(/Alarm bells met their moans and an hour later half of (.*?) lay in ruin\./, "警钟悲鸣，一个小时后，半个 $1 被毁了。");
	text = text.replace("While traveling, brigands attacked his lordship\'s wagon-train.", "在旅行中，强盗袭击了他领主的货车商队。");
	text = text.replace("Swords were drawn, heads were halved, and when it was all said and done the squire had failed: everyone he was supposed to protect lay dead.", "剑被拔出，头被砍断，当一切能说的，做的都干了扈从还是失败了：他应该保护的人都死了。");
	text = text.replace("But one evening a horde of ferocious, furred creatures came down upon his lord\'s keep.", "但是一天晚上，一大群凶猛的长毛动物来到了他主人的领地。");
	text = text.replace(/In desperation, (.*?) let a group of prisoners free, hoping they would aid him in combat\./, "在绝望中，$1 释放了一群囚犯，希望他们能在战斗中帮助他。");
	text = text.replace("Instead, they slew his lordship and ran off into the night.", "事与愿违，他们杀了他的主人，逃入了夜幕中。");
	text = text.replace("The squire, bravely, managed to survive, a dozen husky corpses at his feet, but the battle left him alone and without purpose.", "扈从勇敢地抗争活了下来，脚下有十几具强壮的尸体，但战斗让他孑然一人，再无目标。");
	text = text.replace(/Angered by a horrible crime in (.*?), he took matters into his own hands, personally slaying the criminal\./, "他被 $1 的一桩可怕的罪行激怒了，他亲自动手，杀死了罪犯。");
	text = text.replace("A just act, but also an improper one.", "一种正当的行为，也是一种不正确的行为。");
	text = text.replace("The young squire was banished for his insubordination.", "那个年轻的扈从因违命被放逐。");
	text = text.replace(/When a devilish red knight came to (.*?) for a duel, (.*?)\'s knight proved far too sick to fight\./, "当一个精力旺盛的红骑士来到 $1 进行决斗时，$2的骑士太过病弱无法战斗。");
	text = text.replace(/After downing a mug of liquid confidence, (.*?) donned his lordship\'s armor and faced the red knight himself\./, "喝下一杯充满自信的饮料后，$1 穿上了他的主人的盔甲，亲自面对红色骑士。");
	text = text.replace(/With a sword slash so fast it rang the very air, (.*?) slew his opponent down\./, "一把利剑飞快地划过天空，$1 把他的对手击倒了。");
	text = text.replace("Now there was only one task left for him - to attain knighthood.", "现在留给他的任务只有一个－获得骑士身份。");
	text = text.replace("Now the squire seeks the company of good men with which to again prove himself worthy of being a knight.", "现在扈从找了一帮好人来再次证明自己配得上骑士。");
	text = text.replace("As war ravages the land, there is now plenty of opportunity to put his skills to use.", "随着战争蹂躏大地，现在有很多机会来运用他的技能。");
	text = text.replace(/Though a bit too earnest, there is no doubt the world needs men like (.*?)\./, "虽然有点太认真了，但毫无疑问，这个世界需要像他这样的人，就是 $1。");

//swordmaster_background.nut
	text = text.replace(/(.*?) fights like a fish practices swimming\./, "$1 战斗起来如鱼在水。");
	text = text.replace(/(.*?) isn\'t just a man\'s handle, it\'s a myth\./, "$1 不仅仅是一个人的称呼，它是一个神话。");
	text = text.replace("A name used in place of words like war, combat, and death.", "用来代替战争、战斗和死亡的名字。");
	text = text.replace(/To say, \'You move like (.*?)\' is, perhaps, the greatest honor a man can bestow upon a fellow warrior\./, "说“你的动作像 $1 一样”也许是一个人能给予一个战士的最大荣誉。");
	text = text.replace(/(.*?) is considered to be one of the most dangerous swordsmen to have ever walked the earth\./, "$1 被认为是这片土地上最危险的剑客之一。");
	text = text.replace("Much of his life is founded in myth: stories like how he dismantled a realm by challenging a king and all his guardsmen to a duel - and besting them with one hand.", "他的大部分生活都是建立在神话中的：比如他如何通过和一位国王以及他的所有卫兵进行决斗，并用一只手击败他们，从而摧毁了一个王国。");
	text = text.replace("Supposedly, he fought twenty men in his own garden, slowly picking and pruning his tomatoes with the same blade he was using to kill.", "据说，他在自己的花园里和20个人搏斗，用他用来杀戮的那把刀慢慢地采摘和修剪西红柿。");
	text = text.replace("Some say he was left to sea for three-hundred days and there he learned - balancing on a piece of flotsam - how to move, how to fight, and how to survive.", "有人说他在海上呆了三百天，在那里他学会了如何移动，如何战斗，如何生存。");
	text = text.replace("A story goes that his family was murdered and he knew not by whom.", "有个故事说他的家人被谋杀了，他不知道是谁杀的。");
	text = text.replace("Wanting to be ready if he came across those responsible, he taught himself to be good enough with a blade to kill anyone.", "他想在遇到那些罪魁祸首时做好准备，他教会自己要善于用刀刃杀死任何人。");
	text = text.replace("Raised by a one-armed father, he first learned how to fight with limitations.", "被独臂的父亲养大，他一开始就学习了如何在限制的情况下战斗。");
	text = text.replace("By the time he started using both hands he could already kill anybody with just one.", "当他开始用两只手开始战斗的时候，他已经能够用任一只手杀死任何人。");
	text = text.replace(/Unfortunately, time and age have withered (.*?) into a shell of his former self\./, "不幸的是，时间和年龄已经让 $1 衰老得不比从前。");
	text = text.replace(/During the orc invasions, (.*?) managed to kill a dozen greenskins singlehandedly\./, "在兽人入侵期间，$1 设法单枪匹马地杀死了十几个绿皮。");
	text = text.replace("Sadly, an impossible feat does not come without a price: his sword-hand lost three fingers and his lead foot\'s achilles was severed.", "可悲的是，一个不可能完成的壮举并不是没有代价的：他的使剑手失去了三个手指，他的前脚的跟腱也被切断了。");
	text = text.replace("Sadly, a horde of drunks fell upon his home, each hoping to become infamous by killing the famous swordsman.", "不幸的是，一大群醉汉来到他的家里，他们都希望通过杀死著名的剑客而声名狼藉。");
	text = text.replace("He slew them all, but not before taking irreversible injuries.", "但他把他们都杀了，但是还是受了点不可逆的伤。");
	text = text.replace("Legend has it that he quarreled with a foul beast of monstrous proportions.", "传说他和一只体型巨大的邪恶野兽争吵。");
	text = text.replace("He waves the notion away with a fingerless hand and a scarred wink.", "他用一只缺指的手和一只受伤的眼将他的见解挥之而去。");
	text = text.replace("While teaching royalty how to fight, a coup that swept the entire realm had him running for his life.", "在教皇室如何战斗的时候，一场席卷整个王国的政变让他不得不逃命。");
	text = text.replace("Hired to teach noble heirs fighting skills, it wasn\'t long until he was embroiled in a web of intrigue and backstabbing, and had to leave as long as he still could.", "受聘教贵族继承人的格斗技巧，没过多久，他就卷入了一个密谋和暗算的圈套中，不得趁还能离开前离开。");
	text = text.replace("Now the old swordsman just looks to spend the rest of his fighting knowledge on the field.", "现在这位老剑客只想把剩下的战斗知识花在战场上。");
	text = text.replace("While he\'s lost his edge, the man is still plenty dangerous and some say he\'s looking to find a student before he dies.", "虽然他已经失去了优势，但他仍然很危险，有人说他正在寻找一个学生，在他死前。");
	text = text.replace("A master in the martial arts he may be, every movement he makes is echoed by the cracking of old bones.", "他可能是个武林高手，但他的每一个动作都可能让他的老骨头骨折。");
	text = text.replace(/Depressed and without purpose, (.*?) now finds meaning in simply blending in with the very men he used to teach\./, "现在，$1 感到沮丧，毫无目的地融入他以前教过的那些人寻求意义。");
	text = text.replace("The man makes it impossible to get through his defense, countering everything offered, but he no longer has the jump in his step to attack back. Admirable, but sad.", "这人让通过他的防守成为不可能，能够针对所有的进攻，但是他已经失去了反击的步伐。令人钦佩，亦令人遗憾。");
	text = text.replace("Given a sword, the old guard spins and twirls it in an impressive demonstration.", "老护卫拿到一把剑，令人印象深刻地旋转挥舞着。");
	text = text.replace("When he plants it in the ground, he leans on the pommel to catch his breath. Not so impressive.", "当他把它插在地上时，他靠在剑柄上喘着气。也没那么令人印象深刻。");
	text = text.replace("The man has been robbed of his athleticism, but his knowledge has turned swordfighting into mathematics.", "这个人的运动能力被剥夺了，但他的知识却把剑术变成了数学。");

//tailor_background.nut
	text = text.replace(/(.*?) was always curious about fabrics, seeing more science in a linen cloth than/, "$1 对织物总是很好奇，在亚麻布上看到的科学比");
	text = text.replace("a diviner would in the sands of the desert.", "一个占卜师在沙漠的沙子里看到的要多。");
	text = text.replace("a haruspex would in a toad\'s entrails.", "肠卜师从蟾蜍的内脏里看到的要多。");
	text = text.replace("an alchemist would in a mortar and pestle.", "炼金术士在研钵和研杵中看到的要多。");
	text = text.replace("An Alchemist is knowledgeable in crafting all kinds of mysterious contraptions and concoctions from exotic ingredients when given access to taxidermist equipment, and uses less material to do so.", "炼金术士在接触到动物标本师的设备后，会熟练地用异国的原料制作各种神秘的小玩意儿和混合物，而且使用的材料更少。");
	text = text.replace("AnHave at least one of the following backgrounds: Herbalist, Taxidermist, Druid, Alchemist", "至少有以下背景之一：草药师、标本师、德鲁伊、炼金术士");


	text = text.replace(/(.*?) was always an odd boy growing up, fancying a good silk dress instead of the girl beneath it\./, "$1 在成长过程中一直是一个古怪的男孩子，他喜欢一件上好的丝绸裙子，丝绸裙子下的姑娘。");
	text = text.replace("Son to a ", "他是一个父亲的儿子，他的父亲是 ");
	text = text.replace(/, (.*?)\'s turn toward fashioning clothes was a surprise to all\./, "，$1 选择时装业，这让所有人都感到意外。");
	text = text.replace(/While (.*?)\'s sisters fancied being warriors and heroes, (.*?) thought of himself as a future dresser of kings\./, "当 $1的姐妹们幻想成为战士和英雄时，$2 却认为自己是未来国王的化妆师。");
	text = text.replace(/(.*?) spent much of his youth in the company of girls, but not for the reasons one might think\./, "$1 的青年时代大部分时间都是和女孩子在一起的，却不是因为人们所想的那种原因。");
	text = text.replace(/(.*?) always fancied animals, particularly how they would look as a good coat or scarf\./, "$1 总是喜欢动物，特别是它们看起来像一件好外套或围巾。");
	text = text.replace(/As tunics and shirts grew popular, (.*?) turned to tailoring to make a crown or two\./, "随着束腰外衣和衬衫越来越受欢迎，$1 转而做裁缝来赚钱。");
	text = text.replace(/With a surge in pantaloons popularity, (.*?) went from being a tanner to a tailor to make more money\./, "随着紧身裤的流行，$1 从一个制革匠变成了一个裁缝来赚更多的钱。");
	text = text.replace(/(.*?) hails from a faraway land where how a man dresses is more important than how he fights\./, "$1 来自一个遥远的国度，在那里男人的穿着比他如何战斗更重要。");
	text = text.replace(/Tailoring is the science of colors and fabrics, by which standards (.*?) is renowned\./, "裁缝是一门关于颜色和面料的科学，$1 在裁缝界很出名。");
	text = text.replace(/Good with measuring and calculating, (.*?) turned his mathematical prowess to tailoring to earn as much as he could\./, "擅长测量和计算，$1 将他的数学能力转向了剪裁，以尽可能多地赚钱。");
	text = text.replace(/(.*?)\'s career in tailoring started when his mother pushed him into the vocation to dodge a passing noble\'s conscription\./, "$1的裁缝生涯始于他母亲为了躲避一位已经过世的领主的征兵而把他推到这一行。");
	text = text.replace(/(.*?) took up tailoring to honor his father, a tailor who was killed by an unhappy customer\./, "$1 开始做裁缝是为了纪念他的父亲，一个被不高兴的顾客杀死的裁缝。");
	text = text.replace(/Widowed by war, (.*?)\'s mother taught him how to put his hands to better use in tailoring instead of killing\./, "由于战争丧偶，$1的母亲教他如何将双手更好地用于裁缝而不是杀人。");
	text = text.replace(/When raiders attacked his home, (.*?) dressed everyone up in clever disguises\./, "当袭击者袭击他的家时，$1 把每个人都伪装了起来。");
	text = text.replace("The town was destroyed, but not a soul was lost.", "城镇被摧毁了，但没有一个人丧命。");
	text = text.replace("He spent many years dressing royalty until a fashion faux pas led his being exiled.", "他多年来一直负责打扮皇室，直到一次有失时尚导致他被流放。");
	text = text.replace(/Unfortunately, a man fancying a good fabric, as (.*?) is wont to do, left the tailor ostracized from many a village\./, "不幸的是，一个男人喜欢好的布料，就像 $1 习惯做的那样，这使得裁缝在许多村庄里被排斥在外。");
	text = text.replace("He tried to make his break in the big cities, but sadly he just could not compete with the other tailors.", "他试图在大城市里闯一闯，但遗憾的是，他无法与其他裁缝竞争。");
	text = text.replace("He tried to make his break in the city, but sadly he just could not compete with the other tailors.", "他试图在城里闯一闯，但遗憾的是，他无法与其他裁缝竞争。");
	text = text.replace(/When a lord organized an army, (.*?) handled the clothes, giving the soldiers proper uniforms\./, "当一个领主组织一支军队时，$1 负责处理衣服，给士兵们合适的制服。");
	text = text.replace(/But a fierce competition between tailors led to a linen-wrapped deadman and (.*?) coincidentally leaving his shop behind\./, "但是裁缝之间的激烈竞争导致了一个裹着亚麻布的死人，$1 恰巧离开了他的商店。");
	text = text.replace("Sadly, robbers ransacked his shop and, with the wars going on, it would be impossible to restock.", "可悲的是，劫匪洗劫了他的商店，随着战争的进行，重新补货也不可能了。");
	text = text.replace(/But when he sheared a sheep that did not belong to him, (.*?) was kicked out of town\./, "但当他剪了一只不属于他的羊时，$1 被赶出了镇子。");
	text = text.replace("He once choked out a would-be thief with a cord of measuring wire.", "有一次他用一根测量线勒死了一个想偷东西的人。");
	text = text.replace("So he says, anyway.", "不管怎样这是他说的。");
	text = text.replace("But dressing unlikeable and unfriendly nobility eventually", "但穿着不合身且不友好的贵族");
	text = text.replace("bored him.", "让他厌烦了。");
	text = text.replace("wore on him.", "让他精疲力尽了。");
	text = text.replace(/Once tasked with making a tunic embroidered with epic feats, (.*?) wondered what the outside world was really like\./, "有一次，他受命制作一件绣有史诗壮举的束腰外衣，$1 想知道外面的世界到底是什么样子。");
	text = text.replace("Designing a dress adorned with", "设计一件衣服饰有");
	text = text.replace(/, (.*?) wondered if maybe he should be the one they wove stories about\./, "，$1 想知道也许他应该是他们故事中的主角。");
	text = text.replace("Now the tailor looks for a new life, no matter where it takes him.", " 现在，裁缝开始了新生活，无论他要去哪里。");
	text = text.replace("Maybe he can dress the unit well, or something.", "也许他能把这个单位打扮得很好，或者别的什么。");
	text = text.replace("He\'s particular and peculiar, peppering everyone with clothing criticisms.", "他很挑剔而独特，对每个人的衣着都提出批评。");
	text = text.replace("He\'s no natural soldier, but he appraises a man\'s attire as if he\'s about to go to war with it.", "他不是天生的士兵，但他评价一个人的衣着，就好像他要与之作战似的。");
	text = text.replace(/The way he measures and calculates for dressing, it\'s too bad (.*?) wasn\'t a siege engineer\./, "他测量和计算着装的方式，可惜 $1 不是一个攻城工程师。");
	text = text.replace(/While hardly a soldier, (.*?)\'s earnest love for tailoring is to be admired\./, "虽然还不算是个军人，$1 对裁缝的热爱是值得钦佩的。");
	text = text.replace(/(.*?)\'s knowledge of various cloths is seriously impressive\./, "$1 对各种布料的了解令人印象深刻。");
	text = text.replace(/A bit on the nimby-pimby side, (.*?) has the footwork of a swordfighter, but the swordfighting of a soft breeze\./, "有点偏科，$1 有剑客的步法，但他的剑法如同微风吹拂般无力。");
	text = text.replace(/(.*?) would seem very out of place in a suit of armor, but boy is he going to need one\./, "$1 穿着盔甲看起来很不合适，但他真的需要一套。");
	text = text.replace(/As it turns out, (.*?) can in fact make a silk purse out of a sow\'s ear\./, "事实证明，$1 可以用母猪的耳朵做一个丝绸钱包。");
	text = text.replace(/Don\'t let his vocation fool you, (.*?) is more deft with his hands than some/, "别让他的职业愚弄了你，$1 的手的灵巧度要强于一些");
	text = text.replace("Tailors don\'t seem fit for combat, but then again neither do most of the men you run across these days.", "裁缝似乎不适合战斗，但同样的，你最近遇到的大多数人也不适合。");
	text = text.replace("A tailor seems ill-fit for combat, yet for some reason you find the finest soldiers in the strangest of places.", "裁缝似乎不适合战斗，但由于某种原因，你在最奇怪的地方找到的最好的士兵。");
	text = text.replace("With an eye", "通过一只眼睛");
	text = text.replace(/, (.*?) is a lot smarter than he lets on at first glance\./, "，$1 比他第一眼看上去要聪明得多。");

//thief_background.nut
	text = text.replace(/Raised by thieves on a diet of honeymilk and stolen gold, (.*?) started life off on the wrong foot\./, "被盗贼用蜂蜜牛奶和偷来的金子抚养长大，$1 一开始就走错了路。");
	text = text.replace(/Raised by a drunken father and an ill mother, (.*?) was parented straight into a life of thievery\./, "由一个酗酒的父亲和一个生病的母亲抚养长大的 $1 直接进入了偷窃的生活。");
	text = text.replace(/Born as the sixth-child of an already impoverished family, the budding thief (.*?) first learned the craft by stealing the last bits of dinner\./, "这个初出茅庐的小偷 $1 是一个已经很穷的家庭的第六个孩子，他是从偷最后一点晚餐开始学习这门手艺的。");
	text = text.replace(/Growing up in a family servant to a rich noble, the eventual-thief (.*?) spent many years staring at royal opulence - and stealing from it\./, "在一个富有贵族的家庭仆人家庭中长大，最终成为小偷的 $1 花了很多年的时间盯着皇室的财富，并从中窃取。");
	text = text.replace(/Taken in by a local orphanage, it wasn\'t long for (.*?) to start taking abuse from the lowly orphans\./, "被当地一家孤儿院收留，没过多久 $1 就受到那些底层孤儿的虐待。");
	text = text.replace("He fell back on thieving to survive.", "他只有靠偷窃维生。");
	text = text.replace(/Orphaned, (.*?) grew up as a street urchin, his days governed by cutting purses and picking pockets\./, "成了孤儿的 $1 从小就是一个街头顽童，他的日子都是靠剪皮包、掏口袋。");
	text = text.replace(/While never particularly in need of money, (.*?)\'s jealousy over material things led him to thieving\./, "虽然从来没有特别需要钱，$1 对物质层面上的嫉妒导致了他偷窃。");
	text = text.replace(/The profligacy of the rich amidst crowds of poor always rubbed (.*?) the wrong way\./, "富人在穷人中的挥霍一直让 $1 恼怒。");
	text = text.replace("So he stole from them both and gave to himself.", "所以他偷了他们的东西给了自己。");
	text = text.replace(/(.*?)\'s father taught him all there was to know about stealing including, unfortunately, how to backstab\./, "$1的父亲教会了他所有关于偷窃的知识，不幸的是包括，如何背陷害。");
	text = text.replace("The church steals with a silver plate.", "教堂用银盘偷东西。");
	text = text.replace("The lords do it with the taxman.", "领主通过税务局来窃取。");
	text = text.replace(/So (.*?) figured why can\'t he do it with his own two hands\?/, "所以 $1 想知道为什么他不能自己动手？");
	text = text.replace(/Impoverished while growing up, (.*?) took to stealing bread\./, "在成长过程中贫穷的 $1 开始偷起面包。");
	text = text.replace("Well-fed, he soon took to stealing crowns.", "他吃饱了，很快就开始偷克朗了。");
	text = text.replace(/After years of successful stealing, one mistake landed (.*?) in a dungeon\./, "多年的偷窃一直都很成功，但一次失误使 $1 落入地牢。");
	text = text.replace("Thankfully, years of stealing also meant years of lockpicking and he didn\'t spend long.", "谢天谢地，多年的偷窃经历也意味着多年的开锁经验，他没花太长时间。");
	text = text.replace(/But when he was caught trying to steal a temple\'s chalice, a talk with a priest convinced (.*?) to perhaps take a different path\./, "但是，当他试图偷神殿的圣杯时被抓住，一次与牧师的谈话说服了 $1 也许会另谋生路。");
	text = text.replace(/Unfortunately, a smash-and-grab at a local store ended with (.*?) being caught red-handed\./, "不幸的是，在当地一家商店的一次抢夺事件以 $1 被当场抓获而告终。");
	text = text.replace("He was soon profiled on posters everywhere, making his work difficult.", "很快他的通告贴的到处都是，使他的工作变得困难。");
	text = text.replace(/Daring to cut the purse of a fat trader, (.*?) soon found himself nursing a hand absent of a few fingers\./, "由于胆敢割下一个胖商人的钱包，导致 $1 没过多就在护理一只少了几根手指的手。");
	text = text.replace("He really liked those fingers, too.", "他也很珍惜那些手指。");
	text = text.replace(/(.*?)\'s thievery eventually placed him at the head of an entire guild\./, "$1的偷窃行为最终使他成为整个公会的头目。");
	text = text.replace("But after a dozen failed assassination attempts, the thief realized there was nobody to trust in his line of work.", "但在十几次暗杀未遂后，小偷意识到和自己的一起干活的人中没有人可以信任。");
	text = text.replace(/Partnering up with a beautiful woman, (.*?) managed to steal from everybody\./, "和一个美女搭档，$1 能从任何人身上偷到东西。");
	text = text.replace("Too bad the woman stole from him, in the end.", "可惜最后那个女人偷了他的东西。");
	text = text.replace("Trying to sell some goods, a trusted fence turned out to be a traitorous informant.", "想卖些东西，结果受信任的销赃商人，结果却成了一个背叛他的线人。");
	text = text.replace(/One bad pillory experience later and the thief was exiled from (.*?)\./, "惨痛的示众之后，小偷被流放出了 $1。");
	text = text.replace("It was the perfect heist.", "这是一次完美的抢劫。");
	text = text.replace("That\'s all that is said about it.", "关于这件事的话就这么说了。");
	text = text.replace(/Now, (.*?) just needs to lay low\./, "现在，$1 只需要保持低调。");
	text = text.replace("Tortured by a rival gang, he came to miss a number of teeth, fingernails, and any drive to return to thieving.", "在一个敌对帮派的折磨下，他失去了一些牙齿、指甲，以及任何重返偷窃的动机。");
	text = text.replace("His time as a thief came to an end when, arrested, he spent five days pilloried during tomato season.", "当他被捕后，他在番西红柿成熟的季节被人嘲笑了五天，从此他不再是小偷了。");
	text = text.replace("Naturally, it wasn\'t long until he went to prison.", "很自然，他很快就进了监狱。");
	text = text.replace("He doesn\'t speak of his time there, but it is obvious he wishes to never return.", "他没有谈过他在那里的日子，但很明显他不想再回去了。");
	text = text.replace("But one day he learned there are much better ways to spin a blade for a coin than petty thievery.", "但有一天，他知道了有比小偷小摸更好的门路去旋转刀刃赚取硬币。");
	text = text.replace("But his half-brother was captured by a local gang, forcing the thief to find new ways to pay the hefty ransom.", "但他同父异母的兄弟被当地一伙匪徒抓获，迫使这个盗贼寻找新的方法支付巨额赎金。");
	text = text.replace("But life as a brigand is not easy.", "但作为强盗的生活并不容易。");
	text = text.replace("Arrested for eating a chicken that was not his, the man forfeited two fingers and any will to keep thieving.", "那人因吃了一只不是他的鸡而被捕，失去了两个手指以及任何继续偷窃的意愿。");
	text = text.replace("After a heist went south, the man fingered all his former partners to save his own hide.", "一次劫案发生后，这名男子指认了所有以前的伙伴，以挽救自己的藏身之所。");
	text = text.replace("Now he can never go back to thieving.", "现在他再也不能回去偷东西了。");
	text = text.replace(/For all you know (.*?) is just using sellswords to hide behind\./, "据你所知，$1 只是在用佣兵的身份隐藏起来。");
	text = text.replace("Regardless of his reasons, he\'s still going to have to earn his pay.", "不管他的原因是什么，他还是要挣工资。");
	text = text.replace(/You recognize (.*?) from some posters\./, "你从海报上认出了 $1。");
	text = text.replace("Well, a man who has gotten this far without being caught must have some value.", "好吧，一个走了这么远却没被抓住的人一定有价值。");
	text = text.replace(/With one hand, (.*?) twirls a blade between his fingers\./, "$1 用一只手在手指间旋转刀片。");
	text = text.replace("With the other, he snags your purse.", "用另一只偷了你的钱包。");
	text = text.replace("Impressive. Now give it back.", "令人印象深刻。现在，把它还回来。");
	text = text.replace(/Years of thieving have made (.*?) adept at escaping trouble\./, "多年的偷窃使 $1 善于逃避麻烦。");
	text = text.replace(/(.*?) has the skills to be a good mercenary, just be sure to watch your purse while around him\./, "$1 有做一个好佣兵的本事，只要他在身边时小心你的钱包。");
	text = text.replace(/You can\'t trust a man like (.*?), but that attribute has plenty of company anyway\./, "你不能相信像 $1 这样的人，但不管怎样，偷窃的特质外还有很多别的。");
	text = text.replace(/Supposedly, somebody once shot an arrow at (.*?)\. They missed, but the thief kept the feathers\./, "据说，有人曾朝 $1 射箭。没射中，但他这个小偷却拿下了箭羽。");
	text = text.replace(/(.*?)\'s effort to join sellswords better not be a scheme to steal from your coffers\./, "$1 努力加入雇佣兵最好不是计划从你的金库中偷窃。");
	text = text.replace(/Wanted posters say (.*?) is considered \'armed and dangerous\'\. Perfect\./, "通缉海报上说 $1 被认为是“武装且危险的”。很完美。");
	text = text.replace(/There are plenty of lawmen looking for (.*?)\. Maybe you can get them to join, too\./, "有很多执法者在找 $1。也许你也可以让他们加入。");

//vagabond_background.nut
	text = text.replace(/Pushed out of his town by war, (.*?) wanders the world as a vagabond\./, "因战争被赶出他的小镇，$1 以流浪汉的身份在世界各地游荡。");
	text = text.replace(/Lazy and unmotivated, (.*?) one day put all three of his belongings into a knapsack and hit the road\./, "一天，$1 意兴阑珊，把自己仅有的三件东西都装进背包上路了。");
	text = text.replace(/Never a strong learner in school, (.*?) dropped out to wander the earth\./, "在学校里学习不是很好，$1 辍学在各地游荡。");
	text = text.replace(/(.*?) did not have the business acumen to protect his inheritance from debtors, lawmen, and other maleficent men\./, "$1 没有商业头脑来保护自己的遗产不受债务人、律师和其他不法分子的侵害。");
	text = text.replace("Now he wanders with the last of his crowns jangling in a pocket.", "现在他在口袋只剩下最后一枚克朗在叮当作响。");
	text = text.replace(/Life on the road has taught (.*?) to be a jack of all trades, and a master of none - except walking, of course\./, "在路上的生活教会了 $1 做一个什么都懂点，但什么都不精通的人，当然，除了走路。");
	text = text.replace(/Not quite one for the city, and not quite one for the wild, (.*?) spends his purposeless days traveling between both\./, "不太适合城市，也不太适合野外，$1 在这两者之间漫无目的地旅行。");
	text = text.replace(/During his drinking days, (.*?) managed to gamble away a small fortune\./, "在他酗酒的日子里，$1 成功地赌输了一大笔钱。");
	text = text.replace("Now homeless, he simply wanders.", "现在无家可归，他仅仅是四处流浪。");
	text = text.replace(/When his wife was murdered while he was away, (.*?) refused to sleep in the house\./, "在他的妻子在他离开时被谋杀后，$1 拒绝回房子里睡觉。");
	text = text.replace("The man walks the earth, trying to forget the memory.", "这个人大地上行走，试图忘记记忆。");
	text = text.replace("His son murdered five others.", "他儿子杀了五个人。");
	text = text.replace(/In shame, (.*?) abandoned his hometown to walk the earth and forget his failures as a father\./, "羞愧难当，$1 背井离乡四处游走，来忘记他是一个失败父亲。");
	text = text.replace("But when a gang of thieves took all he had - including his shoes - he knew he needed yet another change.", "但是当一伙窃贼夺走了他所有的一切-包括他的鞋子－他明白他需要再改变一次。");
	text = text.replace("But when he came to a literal fork in the road, the man realized he hadn\'t eaten in some time.", "但当他来到一个岔路口时，他意识到他已经有一段时间没吃东西了。");
	text = text.replace("His stomach demanded a change in scenery - and diet.", "他的胃需要改变一下风景和－饮食。");
	text = text.replace("Sadly, the world is not a pleasant place for those who nobody would miss.", "可悲的是，对于那些没有人会思念的人来说，这个世界不是一个令人愉快的地方。");
	text = text.replace("He was harassed and bullied every day.", "他每天都会受到骚扰和欺凌。");
	text = text.replace("After one particularly harsh day trudging through mud, he realized there was no life to be had in walking around.", "在泥泞中艰难跋涉了一天之后，他意识到四处走动是没有好日子可以过。");
	text = text.replace("Strangely, one day he came across his long-forgotten brother he-never-had who said there was plenty of walking to be done for a mercenary outfit - and they\'d pay him to do it, too!", "奇怪的是，有一天，他遇到了他那被遗忘已久的兄弟，他说为了加入一支雇佣兵的部队，他还有很多路要走－他们也会付钱给他！");
	text = text.replace("Like any good, impulsive man, he flipped a coin on whether or not to try his hand at mercenary work.", "像任何一个冲动的人一样，他掷硬币来决定是否要尝试雇佣兵工作。");
	text = text.replace(/He\'s not particularly good at anything, but (.*?) has seen and done a lot, and that\'s worth at least something\./, "他么有什么特别擅长的，但是 $1 已经见识和经历了很多事情，这至少有点价值。");
	text = text.replace("Mucking about this violent land and surviving with all his limbs is a lot more than some folks can say.", "在这片充满暴力的土地上混日子，靠他仅有的四肢生存，这比一些传说中描述的还要多。");
	text = text.replace(/A mercenary band would be but another adventure for a vagabond like (.*?)\./, "对于这样的流浪汉来说，加入雇佣兵团不过是又一次冒险，像是 $1。");
	text = text.replace("One hopes he survives to write about it.", "有人希望他能活下来书写这些。");
	text = text.replace("Through his travels his only weapon was a walking stick.", "他旅行时唯一的武器就是拐杖。");
	text = text.replace("Let\'s see how he does with something a smidge sharper.", "让我们看看他是如何使用更加稍微锋利一点的东西。");
	text = text.replace(/A thief, a scoundrel, a baker, a tailor, (.*?)\'s done it all\./, "一个小偷，一个恶棍，一个面包师，一个裁缝，$1 都做过。");
	text = text.replace("Too bad he was never good at any of those things.", "可惜他从来都不擅长这些事。");
	text = text.replace("Maybe it\'ll be different this time.", "也许这次会有所不同。");
	text = text.replace(/The world has been harsh to (.*?) for many years now\./, "多年来，世界对 $1 一直很苛刻。");
	text = text.replace("That isn\'t going to change, but at least he will be with brothers now.", "这不会改变，但至少他现在会和兄弟们在一起了。");

//wildman_background.nut
	text = text.replace("For some, the wild is a refuge.", "对一些人来说，野外是一个庇护所。");
	text = text.replace("It is said that man is born with the wilderness in him, and that he does wrong by turning his back on it.", "有人说，这个人生来就充满了狂野，而他所做的错事就是背弃了它。");
	text = text.replace("Civilization is a stain, one prolonged arming of every next-generation to better battle the ultimate enemy: Mother Nature herself.", "文明是一个污点，是每一个下一代的长久武装，来更好地与终极的敌人：大自然母亲本身战斗。");
	text = text.replace("In a time of war, it\'s not surprising that many once again seek refuge in the wild.", "在战争时期，许多人再次到野外避难也就不足为奇了。");
	text = text.replace("Some people flee from town to town.", "有些人从一个镇逃到另一个镇。");
	text = text.replace("Others stop in between, disappearing into the tranquil forests.", "另一些人停在中间，消失在宁静的森林里。");
	text = text.replace(/(.*?) once found a safe register amongst the trees, but that time is over\./,"$1 曾经在树林中找到了一个安全的居住地，但那段日子已经过去了。");
	text = text.replace(/Once a mysterious figure to hunters - the famed masskewatsthat - (.*?) now returns to civilization for reasons unknown\./, "曾经是猎人眼中的神秘人物－著名的马斯基瓦－$1 现在因为未知的原因重返文明。");
	text = text.replace(/(.*?)\'s got the hands of a blacksmith, but the hygiene of a pigsty\./, "$1 有铁匠般强壮的手，但猪圈般的卫生水平。");
	text = text.replace(/Maybe it was spurned love, or maybe just war, but (.*?) has spent the last decade far from the rest of mankind\./, "也许是被爱抛弃，也许只是战争，但是 $1 在过去的十年里远离其他人。");
	text = text.replace(/Possibly a poacher who settled where he hunted, (.*?)\'s lived amongst the trees for untold years\./, "可能是个偷猎者，在他狩猎的地方定居下来，$1 在树林中生活了不知多少年。");
	text = text.replace(/With cleverly stitched garb, (.*?)\'s atavistic appearance perhaps belies a past as a tailor or tanner\./, "穿上巧妙缝合的衣服，$1的返祖形象掩盖了过去也许是裁缝或制革工的身份。");
	text = text.replace("There is an obvious language barrier with the wildman, but for some reason he seems very willing to fight.", "这个野人有明显的语言障碍，但出于某种原因，他似乎非常愿意战斗。");
	text = text.replace("Let\'s hope his newfound \'calling\' doesn\'t have a darker purpose behind it.", "希望他新发现的“召唤”背后有更黑暗的目的。");
	text = text.replace("Colorful and permanent ritual rites circle about his body.", "五颜六色的永久仪式围绕着他的身体。");
	text = text.replace("When asked why he wishes to join a band of mercenaries, he hoots and, with a crooked finger, replicates one of his fleshen arts across the sky.", "当被问到他为什么想加入一个雇佣军，他一边叫一边用一个弯曲的手指在天空中比划他的血肉艺术。");
	text = text.replace("Wounds, old and fresh, dot his already mottled body.", "旧的和新鲜的伤口点缀着他斑驳的身体。");
	text = text.replace("And they are not superficial - this man had been fighting something fierce in the wild.", "伤口很深－这个人在野外和一些凶猛的东西搏斗。");
	text = text.replace("One has to wonder if the calamities which chased him into the forests have come to chase him back out.", "人们不禁要问，那些把他赶到森林里的灾难，是不是又把他赶出了森林。");
	text = text.replace("Judging by his wild grunting, it\'s doubtful he\'s here to rejoin civilization.", "从他狂野的呼噜声判断，让人怀疑他来这里是不是是为了重新融入文明社会。");
	text = text.replace("Years as a recluse haven\'t made the man forget what a few crowns can get you.", "多年的隐居生活并没有让他忘记一些克朗能给你带来什么。");
	text = text.replace("The question is, why did he come back?", "问题是，他为什么回来？");
	text = text.replace("He has the strength to wrestle a boar - and his many scars makes you wonder if perhaps he did.", "他有力气和野猪搏斗，他身上的许多伤疤让你怀疑他是不是真的做过。");

//witchhunter_background.nut
	text = text.replace(/(.*?) appeared one day in (.*?), some say upon request/, "$1 有一天出现在 $2 中，有人说是应要于");
	text = text.replace("of the local council", "地方议会");
	text = text.replace("of a local priest", "当地牧师");
	text = text.replace(/(.*?) has a reputation of showing up where things out of the ordinary happen and being out and about at the darkest part of the night\./, "$1 名声显赫，会在不寻常的事情发生的地方出现，并在夜晚最黑暗的时候外出行动。");
	text = text.replace(/Being a quiet and grim man, (.*?) has the tendency to make other people feel uncomfortable around him, even afraid\./, "作为一个沉默寡言、冷酷无情的人，$1 有点让周围的人感到不舒服甚至害怕。");
	text = text.replace(/The name of (.*?) is known in many a village, for he has travelled the land to wherever his talents are needed the most\./, "$1 这个名字在很多村子里都很出名，因为他走遍了最需要他的才能的地方。");
	text = text.replace("A Witchhunter he calls himself.", "他自称是女巫猎人。");
	text = text.replace("With his assortment of exotic tools he has a great deal of experience in getting people to confess in agony their sinful liaisons with demons and devils under terrible torture.", "他拥有各种各样的异国工具，在让人们痛苦地忏悔他们与魔鬼和魔鬼在可怕的折磨下的罪恶联系方面有着丰富的经验。");
	text = text.replace(/(.*?) refers to (.*?)  as a Witchhunter, but only superstitious fools would believe this and fall for his preposterous tales\./, "$1自称是一个女巫猎人，但只有迷信的傻瓜才会相信这一点，并相信他的荒谬故事。");
	text = text.replace("A Witchhunter he calls himself, and he claims to have seen horrors from beyond that would drive a lesser man insane.", "他自称是女巫猎人，他声称看过了遥远之地的恐怖，会让不够格的人发疯。");
	text = text.replace(/After his arrival in (.*?), rumors spread that he was on the hunt for devil worshippers and creatures of the night, but no one knew what the real purpose of his visit was\./, "在他到达 $1 后，有传言说他正在寻找恶魔崇拜者和午夜的生物，但没有人知道他此行的真正目的是什么。");
	text = text.replace(/In (.*?) he killed an elderly woman and was thrown into the dungeon\./, "在 $1 中，他因为杀死了一位老妇人并被扔进地牢。");
	text = text.replace("As it turned out, the woman was responsible for the abduction and death of 3 infants, and so he was set free again.", "事实证明，这名妇女是绑架和杀害3名婴儿的罪魁祸首，所以他又被释放了。");
	text = text.replace(/For nights on end he sat in (.*?)\'s pub, silently studying every patron like a bird of prey circling above, his crossbow never far away\./, "一连几个晚上，他都坐在 $1的酒吧里，像一只在上面盘旋的猛禽一样，默默地研究着每一位顾客，他的弩就在手边。");
	text = text.replace("It didn\'t sit well with the residents  but they didn\'t dare approach him.", "居民们对此感到不满，但他们不敢接近他。");
	text = text.replace(/By now most of the local folks want (.*?) to be gone rather sooner than later and would happily see him join a travelling mercenary company\./, "现在大多数当地人都希望 $1 早日离开，并且很乐意看到他加入一个旅行雇佣兵战队。");
	text = text.replace(/It seems that whatever his mission was is now accomplished and so (.*?) offers his service as a mercenary\./, "看来他的任务现在已经完成了，所以 $1 以雇佣兵的身份提供服务。");
	text = text.replace(/It is somewhat obvious that (.*?) is not easily scared and he also knows how to handle a crossbow\./, "很明显 $1 不容易被吓到，而且他也知道如何使用弩。");
	text = text.replace("Nobody was therefore surprised as he approached a mercenary company that was hiring.", "因此，当他加入一家雇佣兵的战队时，没有人感到惊讶。");
	text = text.replace("Now, a mercenary company would be just the tool he needed to fulfill his personal quest against the evil from the world beyond.", "现在，一个雇佣兵战队将是他完成个人任务，打击来超越这个世界的邪恶的工手段。");
	text = text.replace("Most people would be glad to get rid of him.", "大多数人都很乐意摆脱他。");

	text = text.replace(" and ", " 和 ");
	text = text.replace(" he ", " 他 ");
	text = text.replace(" mother", " 母亲");
	text = text.replace(" father", " 父亲");
	text = text.replace(" elder sister", " 姐姐");
	text = text.replace(" elder brother", " 哥哥");
	text = text.replace(" sisters.", " 姐妹");
	text = text.replace(" brothers", " 兄弟");
	text = text.replace(" uncle", " 叔叔");
	text = text.replace(" aunt", " 姑姑");
	text = text.replace(" took a ", " 拿着一 ");
	text = text.replace(" hot pan", " 个烧红的锅");
	text = text.replace(" a jagged knife", " 一把锯齿刀");
	text = text.replace(" boar ", " 野猪 ");
	text = text.replace(" bear ", " 熊 ");
	text = text.replace(" dog ", " 狗 ");
	text = text.replace(" hawk ", " 鹰 ");
	text = text.replace(" sellswords", " 佣兵");
	text = text.replace(" mercenaries", " 雇佣兵");
	text = text.replace(" used carts", " 二手货车");
	text = text.replace(" pots, pans and jars", " 锅碗瓢盆");
	text = text.replace("Once ", "曾经是 ");
	text = text.replace(" a sergeant ", " 一位军士 ");
	text = text.replace(" a royal guardsman ", " 一位皇家卫兵 ");
	text = text.replace(" a dedicated soldier ", " 一位专注的士兵 ");
	text = text.replace(" a respected armsman ", " 一个受人尊敬的军人 ");
	text = text.replace(" a frontliner ", " 一个前线兵 ");
	text = text.replace(" a soldier ", " 一个士兵 ");
	text = text.replace(" a footman ", " 一个步兵 ");
	text = text.replace(" prophet", " 先知");
	text = text.replace(" new messiah", " 新的救世主");
	text = text.replace("Watching ", "整天看管 ");
	text = text.replace(" sheep ", " 绵羊 ");
	text = text.replace(" white blobs of wool ", " 白色的羊毛团们 ");
	text = text.replace(" brigands", " 强盗");
	text = text.replace(" wolves", " 狼群");
	text = text.replace(" orcs", " 兽人");
	text = text.replace(" mining father", " 矿工父亲");
	text = text.replace(" squire", " 扈从");
	text = text.replace(" knight", " 骑士");
	text = text.replace(" farmhand", " 农夫");
	text = text.replace(" epic quests", " 史诗任务");
	text = text.replace(" epic feats", " 史诗壮举");
	text = text.replace(" cardsharks", " 纸牌骗子");
	text = text.replace(" jugglers", " 杂耍者");
	text = text.replace(" pickpockets", " 扒手");
	text = text.replace(" for calculations", " 计算");
	text = text.replace(" for measuring", " 测量");

	text = TranslateToolTip0(text);

	return text;
}
//新增传奇营地
var TranslateWorldScreenCampDialogModule = function(text)
{
	text = text.replace("Butcher", "屠夫帐篷");
	text = text.replace("Commanders Tent", "指挥帐篷");
	text = text.replace("Rest", "休息帐篷");
	text = text.replace("Repair Tent", "修理帐篷");
	text = text.replace("Repairs", "修理帐篷");
	text = text.replace("Painting Tent", "涂装帐篷");
	text = text.replace("Hunting", "狩猎帐篷");
	text = text.replace("Healing", "治疗帐篷");
	text = text.replace("Gatherer", "采集帐篷");
	text = text.replace("Fletcher", "弹药帐篷");
	text = text.replace("Barber", "理发帐篷");
	text = text.replace("Patrol Station", "巡逻帐篷");
	text = text.replace("Training Grounds", "训练场");
	text = text.replace("Salvage Tent", "回收帐篷");
	text = text.replace("Workshop", "回收帐篷");
	text = text.replace("Crafting", "制作帐篷");
	text = text.replace("Craft", "制作帐篷");
	text = text.replace("Enchanter", "铭刻帐篷");
	text = text.replace("Enchanting", "铭刻帐篷");
	text = text.replace("Battle Brothers Camp", "战友营地");
	text = text.replace("Items in the queue will be butchered from left to right, top to bottom. Assign butchers in the commanders tent.", "队列中的物品将从左到右、从上到下的顺序被屠宰。在指挥帐篷里安排屠夫。");
	text = text.replace("No camp tasks have been scheduled...", "没有安排营地任务...");
	text = text.replace("Select a tent, then click a brother to assign him to the tent. Bros sorted from best to worse", "选择一个帐篷，然后单击队友将其分配到帐篷。队友相应技能从高到底排序。");
	text = text.replace("Items in the queue will be repaired from left to right, top to bottom. Assign workers to repair items in the commanders tent.", "队列中的物品将从左到右、从上到下的顺序进行修复。在指挥帐篷里指派队友修理物品。");
	text = text.replace("Customize the appearance of your armor", "定制盔甲的外观");
	text = text.replace("Customize the appearance of your mercenaries at the barber", "在理发店定制队友的外观");
	text = text.replace("Tend to wounded brothers", "照顾受伤的兄弟");
	text = text.replace("While encamped, the Vala can craft powerful runes", "在扎营时，瓦拉可以制造强大的符文");
	text = text.replace("While encamped, craft all manner of useful items.", "扎营时，制作各种有用的物品。");
	text = text.replace("Salvage equipment and produce tools. Queue is left to right, top to bottom. Assign workers to salvage items in the commanders tent.", "回收物品和生产工具。队列中的物品将从左到右、从上到下的顺序进行回收。在指挥帐篷里指派队友回收物品。");
	text = text.replace("Clansman", "宗族");

	
//	text = TranslateWorldRelationsScreen1(text);
	return text;
}

//新增码头汉化
var TranslateWorldTownScreenHarborDialogModule = function(text)
{
	text = text.replace("A harbor that allows you to book passage by ship to other parts of the continent", "一个港口，可以让你订船到大陆的其他地方");
	text = text.replace("A fast ship", "一艘快船");
	text = text.replace("A sturdy ship", "一艘坚固的船");
	text = text.replace("A cog", "一艘轮船");
	text = text.replace("A longship", "一艘长船");
	text = text.replace("A small ship", "一艘小船");
	text = text.replace("A trading ship", "一艘贸易船");
	text = text.replace("A knarr", "一艘客船");
	text = text.replace("A local fishing boat", "一艘当地的渔船");
	text = text.replace("A creaking old ship", "一艘吱吱作响的老船");
	text = text.replace("Summer Daze", "夏日眩晕");
	text = text.replace("Merry Mist", "欢乐薄雾");
	text = text.replace("Howl of the Sea", "大海嚎叫");
	text = text.replace("Coral Secret", "珊瑚秘密");
	text = text.replace("Sandy Bay", "桑迪湾");
	text = text.replace("Lady of the Sea", "海上淑女");
	text = text.replace("Solitaire", "寂寞");
	text = text.replace("Brunhild", "布伦希尔德");
	text = text.replace("Mathilda", "玛蒂尔达");
	text = text.replace("Comet", "彗星");
	text = text.replace("Tetrarch", "原型");
	text = text.replace("Lofjord", "洛峡湾");
	text = text.replace("Autumn Wind", "秋风");
	text = text.replace("Brakel", "巴卡");
	text = text.replace("Seven Stars", "七星");
	text = text.replace("Dark Omen", "黑暗启示");
	text = text.replace("Concord", "和谐");
	text = text.replace("Albatros", "信天翁");
	text = text.replace("Golden Horse", "金马");
	text = text.replace("Sea Nymph", "海仙女");
	text = text.replace("Twisted Fate", "扭曲命运");
	text = text.replace("King's Bounty", "国王恩赐");
	text = text.replace("Bald Monk", "修道士");
	text = text.replace("Golden Sun", "金色太阳");
	text = text.replace("Vanity", "自负");
	text = text.replace("Brazen", "无耻");
	text = text.replace("Tiger's Claw", "虎爪");
	text = text.replace("Sycamore", "梧桐");
	text = text.replace("Noble Runner", "高贵跑步者");
	text = text.replace("Bleak Moon", "阴冷月亮");
	text = text.replace("Clansman", "宗族");
	text = text.replace("Whale's Voyage", "鲸鱼之旅");
	text = text.replace("Quickmatch", "快速匹配");
	text = text.replace("Blackfly", "黑蝇");
	text = text.replace("Ejnar Erikson", "埃纳尔·埃里克森");
	text = text.replace("Lindwurm", "林德虫");
	text = text.replace("Supreme", "至高无上");
	text = text.replace("Griffon", "狮鹫");
	text = text.replace("Axford", "阿克斯福德");
	text = text.replace("Bertha", "伯莎");
	text = text.replace("Seagull", "海鸥");
	text = text.replace("Belzebub", "苍蝇怪");
	text = text.replace("Poundmaker", "庞德马克");
	text = text.replace(/by the name of \'(.*?)\'/, "($1号)");
	text = text.replace(/would take your company onboard and to (.*?)\./, "会带着你的人去$1。");
	text = text.replace(/happens to sail to (.*?) and would take your company onboard\./, "碰巧要航行去$1，顺便带上你的人。");
	text = text.replace(/is soon to depart and could be a way to safely and quickly make passage to (.*?)\./, "即将启程，可以安全快速地到达$1。");
	text = text.replace(/could provide a means to reach (.*?) a lot faster than going overland\./, "可以比陆路更快地到达$1。");
	text = text.replace(/could drop you off at (.*?) for a full purse of crowns\./, "可以让你在$1下船赚取满满一袋克朗。");
	text = text.replace("Harbor", "港口");
	text = text.replace("Sail to", "驶向");
	
	text = TranslateWorldRelationsScreen1(text);
	return text;
}

var TranslateWorldTownScreenShopDialogModule = function(text)
{
	text = text.replace("Exotic and dangerous alchemical contraptions can be bought here", "这里可以买到各种奇特而危险的化学装置");
	text = text.replace("This armorer\'s workshop is the right place to look for well-made and durable protection", "这间盔甲店是寻找制作精良、经久耐用的防护装备的理想场所");
	text = text.replace("Customize the appearance of your men at the barber", "在理发店定制你的人的外表");
	text = text.replace("All kinds of expertly crafted ranged weaponry can be found here", "这里可以找到各种精心制作的远程武器");
	text = text.replace("Strong and fast wardogs are bred and kept at this kennel", "强壮和快速的战犬在这个狗舍里繁殖和饲养");
	text = text.replace("A lively market offering all sorts of goods common in the region", "提供该地区常见的各种商品的活跃市场");
	text = text.replace("A harbor that serves both foreign trading ships and local fishermen", "为对外贸易船和当地渔民服务的港口");
	text = text.replace("A harbor that allows you to book passage by ship to other parts of the continent", "一个港口，可以让你订船到大陆的其他地方");
	text = text.replace("Have your wounded treated by priests", "让你的伤者得到牧师的治疗");
	text = text.replace("Have your men train for combat and learn from veterans", "让你的人接受战斗训练向老兵学习");
	text = text.replace("Sail to", "驶向");
	text = text.replace("A weaponsmith\'s workshop displaying all kinds of well crafted weapons", "展示各种精心制作的武器的武器工坊");

	return text;
}

var TranslateWorldTownScreenTavernDialogModule0 = function(text)
{
	text = text.replace("A large tavern filled with patrons from all over the lands", "到处都是顾客的大酒馆");
	text = text.replace("Pay for a round to get the patrons to share more news and rumors", "付一轮钱，让顾客分享更多的新闻和谣言");
	text = text.replace("Pay a round for your men to get their spirits up", "为你的人付一轮钱，让他们振作起来");
	text = text.replace("Pay a round for your mercenaries to get their spirits up", "为你的人付一轮钱，让他们振作起来");

	text = text.replace("Tavern", "酒馆");

	return text;
}

var TranslateWorldTownScreenTavernDialogModule1 = function(text)
{
	text = text.replace("The patrons raise their cups to you, but it seems there is nothing more to be learned by talking to them tonight.","客人对你举起杯，今晚似乎没有更多与你分享的话题了。");
	text = text.replace("The patrons talk about this and that.", "客人在那里聊天。");

	text = TranslateWorldTownScreenTavernDialogModule2(text);

//gt.Const.Strings.RumorsLocation
	text = text.replace(/There\'s a place called (.*?) to the (.*?) of here\. Most people know about it, I think, but few would venture there\./, "有个地方叫做 $1 是 $2 离这里。大部分人都知道那，但没人愿意到那冒险。");
	text = text.replace(/(.*?) told me \'bout (.*?) the other day\. Full of treasure he said, (.*?) of here\. Or maybe I\'m remembering it wrong\./, "$1 在某天告诉过我一个叫做 $2 的地方。那里满是金银财宝，就在这里 $3。也可能是我记错了。");
	text = text.replace(/If it\'s adventure you seek, there\'s a place called (.*?) of here\. Don\'t know who lives there nowadays, though\./, "如果你寻求冒险，有个地方叫做 $1 离这里。但不知道现在谁在那里。");
	text = text.replace(/Heard of (.*?)\? People say it\'s haunted, the dead walking and all\. Somewhere (.*?) of here\. Maybe someone else in (.*?) can tell you more\.\.\./, "听说过 $1 吗？人们都说那里闹鬼呢，比如僵尸什么的。就在这 $2 的某处。或许 $3 的人能告诉你更多…");
	text = text.replace(/You know of\.\.\. gosh, what was it called again\? To the (.*?) from here, (.*?)\. Can\'t for the life of me remember what we used to call it\.\.\./, "你听说过…糟了，那地方叫什么来着？在这里 $1 $2。我可能这辈子都记不起那地方叫啥了…");
	text = text.replace(/Came across (.*?) on your way here\? Why, it\'s (.*?) to the (.*?)\. Someone should hire you to burn that thing to the ground\. Nothing good\'s coming from there, that\'s for sure\./, "你过来的路上碰到 $1 了吗？就在这里 $3 的 $2。应该有人请你去烧了那地方，那里真的相当不详。");
	text = text.replace(/We spotted something on our way here, hidden way off the road, (.*?) of (.*?)\. Don\'t know what the locals call it, or if they even know about it, but it might be worth it going back there\./, "我们来这的路上在路边留下了个标记，在 $1 离 $2。不知道那地儿叫啥，或者他们知道的话，真值得去那里瞧瞧。");
//gt.Const.Strings.RumorsContract
	text = text.replace(/I\'ve heard the council of (.*?) is looking to hire mercenaries\. Don\'t know what for\./, "我听说 $1 在寻找雇佣兵。不知道为什么。");
	text = text.replace(/A group of young lads left for (.*?) some days ago\. They\'re looking to hire armed men over there, willing to pay real good\. I just hope they make it back alive\./, "几天前一群年轻人去了 $1。他们到处寻找装备精良并愿意支付高额佣金的雇佣武装人员。但愿他们能活着回来吧。");
	text = text.replace(/If you lot is looking for work, I\'ve heard that they\'re hiring sellswords over at (.*?)\./, "如果你想找活干，我听说有人在招募佣兵在 $1。");
	text = text.replace(/You heard that they\'re looking to hire fighting men at (.*?)\?/, "你听说了吗有人打算雇佣战斗人员在 $1？");
	text = text.replace(/Some guy from (.*?) was here just the other day, wanted to hire strong lads for some problem they have over there\. Don\'t think many went with him, though\./, "前些天 $1 的人来过这，想寻找强壮的年轻人帮他们解决一些问题。不过我想没多少人会跟他们走的。");
	text = text.replace(/Mercenaries, eh\? We got a few of those these days\. Just some days ago a bunch that called themselves (.*?) travelled through\. On their way to (.*?), they said, good coin to be made there\./, "嗯？雇佣兵，我们这前几天也来过几个。一支自称 $1 的队伍打这经过。往 $2 的方向去了，他们说在那能弄到更多的硬币。");
	text = text.replace(/If it\'s work you\'re looking for, they\'re taking crowns in hand over at (.*?) to hire strong men\./, "如果你想找活干，他们说 $1 愿意支付克朗来寻找勇士。");
	text = text.replace(/Heard that some fancy fat merchant or so from (.*?) is looking to hire armed guards the other day\. Well, I ain\'t going to die for him, no thanks\. Have me my house and wife right here\./, "前几天听说 $1 的富商正在寻找武装护卫。好吧，我才不会为了那些人送命呢，我的老婆和房子都在这呢。");
//gt.Const.Strings.RumorsGeneral
	text = text.replace("If you\'re looking to fetch a good price for your trading goods, my friend, you should go to one of the large cities or castles and not some run-down poor village at world\'s ass.", "朋友，如果要想你的商品能卖个好价钱，你应当去任何一个大城市或者城堡，别没事老往那些破村庄跑。");
	text = text.replace(/The drinks over in (.*?) are way better than the cat piss they serve here!/, "$1 那里的酒比这的猫尿好喝多了！");
	text = text.replace("A trader came by this morning, claims he saw dead people shuffling through the hills nearby. Won\'t buy that humbug, that\'s for sure!", "今天早上来了个商人声称在这附近的山上看到过僵尸。我才不信那死骗子呢！");
	text = text.replace("There is many a place out there, long lost and forgotten, that holds great riches.", "世界上有许多长期以来被人遗忘的地方，却蕴藏着巨大的财富。");
	text = text.replace(/If you\'re ever visiting the tavern in (.*?) make sure to try their roasted goat - you\'ll never eat that good elsewhere!/, "如果你有机会去 $1 的酒馆，一定要尝尝那里的烤全羊，你在别的地方是吃不到那么好吃的东西的！");
	text = text.replace("Mercenaries aren\'t very popular around these parts. They kill, plunder and pillage like common brigands, so don\'t expect to be greeted with cheers and flowers.", "雇佣兵在这一带是不受欢迎的。他们就像普通强盗一样杀戮、抢掠和抢劫，所以你就别妄想会有欢呼与鲜花了。");
	text = text.replace(/If you\'re in need of supplies, head over to old (.*?) on the market here in (.*?)\. Tell him I send you!/, "如果你需要补给品，去 $2 的市场找 $1。告诉他是我让你来的！");
	text = text.replace(/Tomorrow night the famous minstrel (.*?) is coming to this very tavern, you better not miss it!/, "明晚著名的 $1 将会来这酒馆，你最好别错过了！");
	text = text.replace("the Songbird", "音乐鸟");
	text = text.replace("the Bard", "诗人");
	text = text.replace("the Storyteller", "说书人");
	text = text.replace("the Nightingale", "夜莺");
	text = text.replace("the Poet", "诗人");
	text = text.replace("Don\'t trust the barber\'s potions! A friend of my cousin\'s friend\'s uncle drank one and it turned him into a toad, I swear!", "不要相信理发师的药剂！我表哥朋友的朋友的叔叔喝了一瓶后变成了癞蛤蟆，我发誓这是真的！");
	text = text.replace(/So I heard of a free company by the name of (.*?) and it\'s said they collect the ears of their enemies and wear them \'round their necks!/, "我听说一支叫做 $1 的自由佣军喜欢收集敌人的耳朵并且戴在脖子上！");
	text = text.replace(/Don\'t drink the water in (.*?), let me tell you\. It\'ll give you the runs in no time!/, "我告诉你，千万别喝 $1 的水，那里的水喝了立马就会拉肚子！");
	text = text.replace(/My cousin (.*?) left town with a mercenary company like yours, (.*?) or something like that it was called\. Haven\'t heard from him since\.\.\./, "我堂兄 $1 像你一样也是雇佣兵，加入了一支好像叫做 $2 的战队。不过从他离开镇子后就再也没他的消息了…");
	text = text.replace("From one sellsword to another: If you value your reputation as a mercenary, you\'d better not double-cross your employers. Some will go to great lengths to hunt you down, tell ill of you and make you pay.", "前人的经验：如果你珍惜你的雇佣兵声誉，你最好不要欺骗雇主。不然他们会不遗余力的追捕你，说你坏话让你付出代价。");
	text = text.replace("The noble houses act like an old couple; constant quarreling and wrangling. And who suffers most from those feuds? Not the high lords up in their castle towers, no, it\'s us simple folk, of course!", "那些贵族家族就像一对老夫妇；不断的吵架和争吵。要说谁受害最深？怎么可能是那些高居城堡的贵族，当然是咱们这些老百姓！");
	text = text.replace("I\'d stay clear of swamps and marshes. There\'s ghastly diseases there just waiting to latch onto you.", "我要远离沼泽与湿地。因为那里可怕的恶疾在等着你呢。");
	text = text.replace(/I\'ve heard they have a mage on the council of (.*?), a real wizard\. Not sure if I believe that\./, "我听说 $1 的议会中有一名真正的巫士，我也不确定是不是真的。");
	text = text.replace("I love women! The way they look, the way they talk. Don\'t know what I\'d do in a world without \'em...", "我喜欢女人，无论是她们的样貌还是谈吐。难以想象没有她们的世界我该怎么办…");
	text = text.replace(/It\'s you and the (.*?)! Remember me from (.*?)\? We talked about\.\.\. well, I don\'t really remember, but here we are! Let\'s drink! How have you been faring\?/, "这是你和 $1！还记得我吗？我们在 $2 讨论过…好吧，我也不太记得讨论过什么了，但我们确实见过！来，喝一杯！你们最近怎么样？");
	text = text.replace("Death is a part of life. The sooner you accept it, the more you can cherish your stay in this world.", "死亡是生命的一部分。你越早接受它，你就能在这世上得到的越多。");
	text = text.replace("One of my teeth fell out just the other day, see? I think the others are so loose, they\'re about to follow. Can you feel it? Go on, touch. They\'re loose, right?", "前几天我掉了颗牙齿，你看到没？我觉得其他的牙齿也松了，快要掉了。你看出来的吗？来，摸一下，是不是松了？");
	text = text.replace("Gods, I need to take a piss. Will you watch that beer for me?", "上帝啊，我想去尿尿，你能帮我看着这杯啤酒吗？");
//gt.Const.Strings.RumorsCivilian
	text = text.replace("Always be sceptical towards the nobility, my friend. You never know what their real agenda might be.", "朋友，永远别轻易相信那些贵族。因为你永远不知道他们的真正目的是什么。");
	text = text.replace("Ever considered putting down your sword and settling down? Mercenaries tend to have rather short lives.", "有没有想过放下武器安定下来呢？雇佣兵生涯往往都是短暂的。");
	text = text.replace(/They found the farm of old (.*?) burned to the ground the other day\. That whole family was hanging from a nearby oak\.\.\./, "几天前有人发现 $1 的农田被夷为平地。他们全家都被吊死在附近的橡树上…");
	text = text.replace("Since some brigands burned down my old man\'s farm I switched the pitchfork for the beer mug. I hope they get what they deserve some day.", "自从某些强盗烧了我家老头的农场我就把干草叉换成啤酒杯了。那些人早晚会有报应的。");
	text = text.replace("Our militia is in a pitiful state, rusty pikes and worm-eaten shields everywhere. I wish the council would take crowns in hand and buy the poor sods some real weapons.", "我们的民兵真可怜，总拿着生锈的长矛和虫蛀的盾牌。我希望议会能给那些可怜虫买点真正的装备吧。");
	text = text.replace("We don\'t need sellswords like you here! You\'re nothing but trouble. Our militia can take care of us. Always has, always will.", "我们这里不需要佣兵！你们只会带来麻烦。咱们的民兵就一直很好地保护着我们。");
	text = text.replace("The miller\'s daughter went missing last night. They found her and she is well, but she\'s not willing to talk about it.", "昨晚碾磨工的女儿失踪了。人们找到她时却没啥事，但她什么都不肯说。");
	text = text.replace(/Farkin\' (.*?) and his farkin\' dog\. Rug of flea\'s barking day and night, rain or sunshine\. Can\'t take it much longer, I really can\'t\.\.\./, "靠，$1 和他的狗。不论晴雨，昼夜不停地吠叫。我再也受不了了，我真的不能…");
	text = text.replace("I heard some tombstones in the old graveyard have been toppled over. But no one in their right mind would go there anyways.", "我听说老坟场的一些墓碑已经倒了。但无论如何头脑正常的人都不会去那。");
	text = text.replace("Bought me this scramasax the other day from a travelling merchant. Real bargain, he said. A man\'s got to protect himself and his family, see.", "前几天我从一名路过的商人手上买了这把撒克逊大刀。这真的便宜，他说男人就该懂得保护自己和家人，明白不。");
	text = text.replace("I don\'t trust the militia here. One time, as a band of outlaws approached, they turned tail and ran for the hills without giving any fight!", "我不信任这里的民兵。有一次，一群不法之徒来了后，他们不做任何反抗就掉头往山上跑了！");
	text = text.replace(/We had a murder here\. Some bastard from (.*?) put a knife into the back of one of the merchants\. He\'ll see the noose on Sunday, you should come watch!/, "我们这里有个杀人犯。一个来自 $1 的狗杂种用刀子刺进了一名商人的后背。那家伙在星期天会被处以绞刑，你应当也来看看的！");
	text = text.replace(/They burned (.*?) at the stake last week, some witchhunter did\. Just appeared one day, accused her of sorcery and whatnot and had her burned\. The council didn\'t object and that man just left soon after\. Wish I knew who he was, really\. Good thing he saved us from that witch, I suppose\.\.\./, "上星期一名叫做 $1 的女人被女巫猎人烧死了。那人只来了一天就指出女巫的罪名然后烧死了她。议会那边也没反对，那名女巫猎人很快就走了。我很想知道他是谁。真庆幸他把我们从女巫手中救了出来，我猜想…");
//gt.Const.Strings.RumorsMilitary
	text = text.replace("Ever fought an orc? It\'s said they\'re twice as tall and thrice as strong as a man, and that they can split us clean in half with a single strike!", "跟兽人交过手吗？据说它们有两人高并且比人类强壮三倍，随手一击就能把人劈开两半！");
	text = text.replace("Picking up desperate farmers and fishers for your company is all good and well, but you should look for recruits in a castle like this one. Here you\'ll find people who actually know which end of the sword goes where.", "为你的战队招募啥也不懂的农夫和渔夫是件好事，但你应该在这样的城堡里寻找新兵。在这里，你发现那些真正知道剑的哪一头该指向哪里的人。");
	text = text.replace("A sturdy shield is a real life-saver, let me tell you. Wouldn\'t have a man fight without one.", "我告诉你，坚固的盾牌才是真正的救命稻草。所有人战斗都会带上它。");
	text = text.replace("The garrison commander fought in the Battle of Many Names. Claims large orcs just shrug off hits to the head with a waraxe, he does. Don\'t know what to make of this.", "一名经历过无数战斗的驻军指挥官声称只要耸肩就能用战斧砍中兽人的头部，也不知道他是怎么做到的，管他呢。");
	text = text.replace("There\'re things out there way more scary than some group of brigands. You\'ll see what I mean soon enough if you head out beyond the borderlands.", "外面的世界比强盗更可怕呢。如果你走出边境你很快就会明白我的意思了。");
	text = text.replace("I always rely on my axe to smash the enemy\'s shield. Even the tallest man will fall quickly once he can not defend himself any more.", "我总是依赖我的斧头来粉碎敌人的盾牌。一旦没了防护，即使最高大的战士也会很快倒下。");
	text = text.replace("If I learned one thing during my soldiering years, it\'s that the high ground wins battles. Trust me on this one.", "要问我在当兵时学到了什么，那就是高地赢得战斗。相信我一次。");
	text = text.replace("I once was a mercenary like you but then I took an arrow to the knee.", "我曾经也是一名雇佣兵，直到我的膝盖中了一箭。");
	text = text.replace(/I\'ve seen (.*?) at a tourney recently\. Damn, what a sight, that man\. The way he jousts, I mean\. Took the prize and all the ladies loved him\./, "最近我看了一名 $1 的比赛。该死的，那场景，那家伙。我是说那吊毛比赛的样子。最后得到了奖赏令所有女人都为他发狂。");
	text = text.replace("I\'m old now, but I still remember my first battle. Pissed my pants even before the first arrow flew. Ha!", "我现在老了，但我还记得我的第一场战斗。在第一根箭射出去之前我就尿裤子了，哈哈！");
	text = text.replace(/Been to (.*?) not long ago and they told me about wolves as large as a man, with teeth as long as the fingers on my hand\. Really don\'t want to meet one of those\./,"不久之前去了 $1，那里的人告诉我有一种狼像人一样高大，牙齿像我的手指那么粗。真不想遇见它们。");
	text = text.replace("You know that orcs make their armor out of what they strip from those who fall against them? Honest, I\'m not making this up. They wear it as trophies or something. If you ever meet one of them large orcs, you\'ll see. They look like it\'s a knight or two wrapped around them.", "你知道兽人喜欢剥掉它们击败的敌人身上的东西来做盔甲吗？说真的，我不是在吹水。它们喜欢穿着这些战利品。如果你有机会遇到它们就会明白了。它们看起来就像一两个骑士的合体一样。");
	text = text.replace(/1st (.*?) Company\. Best lot of halfwits and scallywags I\'ve ever served with\. Wouldn\'t trade \'em for the world\./,"$1 第一的战队。我服务过的最好的混蛋与流氓。我不会拿他们和世界做交易。");
	text = text.replace(/I miss my wife and my two daughters\. Been stationed at (.*?) for too long already, but a man\'s got to put food on the table somehow\./, "我很想念我的妻子与两个女儿。在 $1 定居很久了，但作为男人总得为她们的桌子摆上食物啊。");
	text = text.replace("We\'ll head out again soon to patrol the roads. Sometimes I feel everything would go down the shitter if it weren\'t for us keeping order \'round here.", "我们很快就要出去巡逻了。有时候我觉得如果不是我们一直守卫着的话，这里早完蛋了。");
	text = text.replace("Farkin\' patrol duty. Barely got back \'ere, blisters on me feet still from all the marchin\' and we\'re about to \'ead out again. Just put us on \'orses, I say!", "去他妈的巡逻任务。我们才刚回来，脚上还起了水泡，现在又要出去了。我说能不能给点兽皮让我们穿呢！");
	text = text.replace(/Got wounded bad some months back in a skirmish \'gainst goblins\. Couldn\'t feel me legs anymore, but the lads carried me all the way back to (.*?)\. Gods bless \'em\./, "我数月前与哥布林的战斗中受了重伤。再也感觉不到我的腿了，但小伙子们硬是扛着我跑回了 $1 。愿上帝保佑他们。");
	text = text.replace("You\'ll know greenskin territory from the idols they errect out of skulls and bones. Of human skulls and bones.", "你能通过那些插着头盖骨和骨骼的柱子来识别绿皮的领地。就是人类的头盖骨和骨骼。");
	text = text.replace("Fourteen. That\'s how many men I\'ve killed. Women I count extra, three so far. What about you?", "到目前为止我杀了十四个人了。额外加三个女人。你呢？");
	text = text.replace("I usually stand guard on the gate tower. To be honest, spitting down on some travellers is the only fun I get all day.", "我经常在岗哨楼站岗。说实在的，向过路的旅客吐唾沫是我一整天唯一的乐趣了。");
	text = text.replace("The mood amongst the garrison is pretty bad. They say that pay\'s been delayed a few times already and everyone\'s starting to loose patience.", "守卫军的情绪已经很糟糕了。他们说工资已经延迟发放好几次了，现在他们都开始失去耐心了。");
	text = text.replace(/When I was moved to (.*?) I never imagined life here to be so dull and hard\. But still better than working the fields until your back snaps, I suppose\.\.\./, "当我搬到 $1 来的时候没想到生活会如此枯燥与艰苦。但我想这也总比在田里累的直不起腰来要好…");
	text = text.replace("I prefer fighting with my flail. Hard to defend against and it don\'t matter if they carry a shield, I\'ll just swing around it and make pulp of their head!", "我更喜欢在战斗中使用链枷。即使敌人带着盾牌也很难抵御，我只要挥舞一下链枷就能让他们的脑袋开花！");
	text = text.replace("Damn nigh impossible to find a reliable shield \'round here, bloody things keep breaking in two. Been keeping a spare on me back now just incase. I should charge more for fighting men with axes, ha!", "在这附近几乎不可能找到可靠的盾牌，总是被残忍的一分为二。我身上一直带着备用的，以防万一。我应该向斧兵多要点钱，哈哈！");
	text = text.replace("One day I\'ll be standard bearer of the company. It\'s only the bravest of us all and they\'ve been with the company for years and years, y\'know, but it\'s the greatest honor for a man with common blood. I\'ve seen even a knight once shake the hand of ours.", "总有一天我会成为战队的扛旗手。这是有史以来最勇敢的人，对于普通人来说也是最高的荣誉。我甚至见过一名骑士与咱们的扛旗手握手呢。");
	text = text.replace("I\'ve trained militia before, and let me tell you, spears are the best weapons for when the men don\'t know what they\'re doing yet. Cheap and easy to hit with. Put a few men together for a spearwall and it\'s hard to even get close to them without a spear in your belly.", "我曾经训练过民兵，让我告诉你，当你的人还不明确职能的时候矛就是最好的武器。便宜而且命中高。当好几个人组成矛墙的话敌人还很难靠近。");
	text = text.replace("Ever fought goblins? Nastly little buggers, don\'t be fooled by their size. I\'d take large kite shields to protect the men from their arrows. And a pack of wardogs to run them down as they scatter, if you can afford it.", "与哥布林战斗过没？那是一种阴险的狗杂碎，不要被它们的体型糊弄了。我会带上筝型盾来防御它们的弓箭。如果你有钱的话还可以带着战犬，在它们四散逃跑时追上它们。");
//gt.Const.Strings.RumorsMiningSettlement
	text = text.replace("The other day my pickaxe broke while I was hammering away. Piece of it clipped my cheek. Not much and I\'d be missing an eye!", "有一天我的鹤嘴锄在敲打时坏掉了。飞出来的碎片蹦到我脸上。好在只是失去了一只眼睛而已！");
	text = text.replace("The mines are a real deathtrap, we\'re losing men every week. Even venturing with you might be better for longevity, ha!", "矿山就像个死亡陷阱，我们这每星期都有人挂掉。我觉得跟着你冒险还可能更长命点呢，哈哈！");
	text = text.replace("Working the mines has its merits, too, you know. We never get wet from the rain, it\'s just the dust that kills you eventually.", "你知道，采矿也有它的优点。我们从不会被雨淋湿，最终了结你的是尘土而已。");
	text = text.replace(/In the other mine shaft, (.*?) found a nugget the size of me fist! The overseer got to him before he could hide it, though\./, "在另外一个矿井，$1 找到了一块拳头大小的金块！但他还没来得及藏起来就被工头没收了。");
//gt.Const.Strings.RumorsFarmingSettlement 
	text = text.replace("Even with the bad harvest this year the landlord won\'t give us a rest! The high folks got to have their feasts, you know...", "即使今年收成不好，地主们也不让我们休息！你要知道，那些贵族还要举办盛宴呢…");
	text = text.replace(/If you\'re looking to stack up on food and supplies head over to the market and look for (.*?)\. He has the best quality and the lowest prices!/, "如果你想准备食物补给品那就去市场找 $1 。他那里的东西物美价廉。");
	text = text.replace("I\'ve been a farmhand all my life and sometimes I wish I\'d taken the chance to venture with a company like yours... well, it\'s too late for that now.", "我干了一辈子的农夫有时候真想加入到像你们一样的战队去冒险…好吧，现在一切都晚了。");
	text = text.replace("There\'s lots of young and naive lads out there looking for adventure. I hope you take good care of them and return them safely to their families one day.", "有太多无知的年轻人梦想着去冒险。我希望你能照顾好他们，并且有天能把他们安全带回家。");
//gt.Const.Strings.RumorsFishingSettlement
	text = text.replace("The sea is a fickle mistress. One moment it is as calm as a mirror and the next you find yourself in a tempest fighting for your life.", "大海就像一名喜怒无常的怨妇。前一秒还平静地像镜子一样，后一秒你就发觉自己在暴风雨中拼命了。");
	text = text.replace("Nobody knows what lives in the deep black waters, but you hear the old fishermen talk about giant fish larger than any ship, tentacles that crush boats like they were nutshells, and evil, dead eyes under the surface.", "没有人知道在漆黑的深水里生活着什么，但是你可以听到老渔民们谈论比任何船只都大的深海巨兽，有着像坚果壳一样能把船压碎的触须，以及藏着水底的恶魔之眼。");
	text = text.replace("Some of the old fishermen will tell you that those lost at sea are cursed to walk the seabed, only to be released if they drag others down to take their place. Priest says it ain\'t true, but I don\'t know. What are the elders telling it for, then?", "一些老渔民会告诉你，那些在海上失踪的人被诅咒只能在海床上行走，只有当他们把其他人拖下去接替他们的位置时才会被释放。牧师说这不是真的，但我不知道为什么长辈们要这么说？");
	text = text.replace(/The biggest fish of my catch I always place in front of (.*?)\'s door to woo her\. Some day I\'m going to reveal myself as her secret admirer and ask for her hand!/, "我总是把我能抓到最大的鱼放在 $1的门前来追求她。总有一天我会向她坦白并向她求婚！");
//gt.Const.Strings.RumorsForestSettlement
	text = text.replace("I\'ve been a lumberjack all my life, just like my father before me. But the young folk these days are all \'bout adventure and seeing the lands, you may well find some hanging \'round the market that\'ll have no qualms \'bout coming with you on the road.", "我做了一辈子伐木工，就像我的父亲一样。但是现在的年轻人都喜欢冒险，喜欢四处看看，你很可能会在市场周围发现一些到处闲逛的人，他们会毫不犹豫地和你一起上路。");
	text = text.replace("There are things in the forest... in the deep, dark parts, there are things. Nobody dares speak of them but trust me, those are no animals...", "森林最深处存在着某种生物…不过没人敢与之对话，它们可能不是普通的动物…");
	text = text.replace(/Say, you interested in woodcarvings\? The works of (.*?) are true pieces of art and made our town known throughout the realm!/, "我说，你对木雕感兴趣吗？$1 的作品就像真正的艺术一样闻名全国！");
	text = text.replace("Hiring a man of the woods could be a good idea for a mercenary like you, I\'d say. They ought to know how to fling around those large axes!", "对于像你这样的雇佣兵来说，雇佣一名伐木工对你的战队很有帮助，我说的。他们擅长挥舞巨斧！");
	text = text.replace("I\'ve been hearing folk tell of eyes watching them from the forest\'s edge. Seems to be some vile creatures making their nests in these here woods. Perhaps they\'re sizing up their prey before striking.", "我一直听到人们说有只眼睛在森林的边缘看着他们。好像是一些卑鄙的生物在树林里筑巢。也许是它们在攻击前估量猎物的大小。");
	text = text.replace("Long as I can remember the woods around here have been full of wildlife. Deer, boar, wolves and bear roam them in great number. Because of this it\'s been tradition for families to teach the art of archery at childhood. Try to outmatch any of our lads with a bow and you\'re sure to be disgraced.", "从我记事起，这附近的树林里到处都是野生动物。大量的鹿、野猪、狼和熊在森林中游荡。正因为如此，家庭从小就有教授箭术的传统。你可以尝试着和我们这的年轻人比试一下箭术，你能体会到什么叫耻辱。");
//gt.Const.Strings.RumorsTundraSettlement 
	text = text.replace("You may think our land is barren and scant but once you live here you will learn to love it like no other!", "你可能认为我们的土地即荒凉又贫瘠，但一旦你住在这里，你就会爱上它！");
	text = text.replace("The clans and families in these parts are still strong and define who we are. Those nancy southern folks will never understand how things work here in the north.", "这地区的贵族和家庭依然十分强大，并决定着我们的命运。那些南方的娘娘腔永远也不会明白北方的彪悍是怎么一回事。");
	text = text.replace("If you\'re looking to make a quick coin with some trades look around for furs. The ones from around here are the best far and wide.", "如果你想通过贸易来快速的赚一些硬币，那就去收集兽皮吧。这里附近的兽皮是最好的。");
	text = text.replace("You came to the right place if you\'re looking for able men to bolster your company. Us northern folk are strong, rugged and honest!", "如果你在寻找有能力的人来充实你的战队，那你来对地方了。我们北方的男儿既强壮坚韧又诚实！");
//gt.Const.Strings.RumorsSnowSettlement
	text = text.replace("The best remedy against biting winds and freezing cold can be found right here: Beer and mead!", "抵御刺骨寒风和严寒的最佳良药就在这里：啤酒和蜂蜜酒！");
	text = text.replace(/A fortnight ago (.*?) went missing on the way home from the tavern\. Found him frozen rock solid the next morning\. Could have sold him to some fancy noble as a statue, haha!/, "两周前，$1 从酒馆回家的路上失踪了。第二天早上发现他冻得像块石头一样。可以把他当作雕像卖给那些贵族收藏家了，哈哈!");
	text = text.replace("There are tales of figures shifting in snowstorms and unearthly howls that mix with the winds... but I wouldn\'t want to unsettle you with the common folk\'s farytales.", "有传言说暴风雪中会有人影移动，还有神秘的嚎叫会随风飘荡…但我不想让你因为民间故事而不安。");
	text = text.replace("I\'ve been told that a long time ago this land was all green with many proud castles and awe-inspiring towers. Most of them have crumbled to ruins by now and are covered with snow. But they\'ll have to be out there somewhere...", "很久以前，有人告诉我，这片土地是绿色的，有许多令人自豪的城堡和令人敬畏的岗哨塔。可到了如今，大部分都已经被夷为平地了，到处都是雪。但他们一定还在某个地方…");
	text = text.replace("Four winters. Four winters since I saw a chance for quick coin and raided a roadside chapel. Put the iron to a holy man that tried to hold me back; now no amount of crowns can repay the debt that my spirit owes.", "四年了。四年前我看到了一个快速赚硬币的机会，袭击了路边的一个小教堂。把烙铁插进了一个试图阻止我的圣人身上；现在，再多的克朗也无法偿还我精神上所欠的债。");
//gt.Const.Strings.RumorsSteppeSettlement
	text = text.replace("You men must be sweating like pigs under all that armor. Maybe you should travel when the moon is out?", "你的人穿着那些盔甲一定汗流浃背了吧。也许你应该在月亮出来的时候再出发？");
	text = text.replace("Let me tell you, the southern wine is the best you can find in all the lands. But you better start bashing in some heads or whatever it is you do so you can afford the good stuff, because it doesn\'t come cheap.", "我告诉你，南方的葡萄酒是世界上最好的。但是你最好在用酒瓶砸别人脑袋前考虑清楚，因为它不便宜。");
	text = text.replace("A trader from the north got lost in the steppe the other week. He made it back but did not stop fantasizing about some lake he discovered surrounded by lush plants and strange animals.", "前几个星期，一个北方的商人在大草原上迷了路。他回来后，经常胡思乱想，他说发现一些湖泊周围都是郁郁葱葱的植物和奇怪的动物。");
	text = text.replace("Tell your men to keep their mitts off of the innkeeper\'s daughter. The last lover boy who tried something had his nose cut right off.", "告诉你的人别打酒馆老板女儿的主意。上一个求爱者的鼻子都被削掉了。");
	text = text.replace(/I\'m from up north originally, moved to (.*?) just some years ago\. Never could stand the cold; snow and wind, day in and out\. So one day I just said to myself, (.*?), I said, go where the sun warms the earth and you\'re not shivering every time you go out to collect fire wood\. And so I did. Didn\'t regret it since\./, "我原来是北方人，几年前刚搬到 $1。因为无法忍受寒冷；没完没了的风雪。所以有一天，我对自己说，$2，去有太阳又温暖的地方吧，你就不用每次出去收集柴火时都瑟瑟发抖了。我就这样做了。至此我也没后悔过。");
//gt.Const.Strings.RumorsSwampSettlement
	text = text.replace("You like mushrooms? Well, I most certainly hate them! But there\'s not much else to be found in this stinking swamp besides biting midges and spiders.", "你喜欢蘑菇吗？嗯，我最恨它们了！但是在这片臭气熏天的沼泽里，除了咬人的蚊子和蜘蛛外，再也找不到别的东西了。");
	text = text.replace("Traders don\'t come here often. Their large carriages tend to get stuck in the mud and guess who has to help them out once that happens...", "商人不常来这里。他们的马车往往会陷在泥里，一旦发生这种情况，谁来帮助他们呢…");
	text = text.replace("There once was a stone road leading here bringing traders, customers and all kinds of folk. One day it completely sunk into the swamp and look at this place now...", "曾经有一条石路通往这里，路上有商人、游客和各种各样的人。直到有一天它完全沉入了沼泽中，现在看看这个地方…");
	text = text.replace("Don\'t wander through the swamps at night! You might get lost, yes, but out in the swamp at night there\'s far worse things that can happen to a man. Just ask anyone around here.", "晚上不要在沼泽附近闲逛！你会迷路的，真的。但在沼泽中还有更恐怖的事情呢。你问一下周围的人就知道了。");
//gt.Const.Strings.RumorsDesertSettlement
	text = text.replace("Those northeners pay good coin for our silk and spices, so we have caravans going up all the time. And caravans need escorts, you know.", "那些北方人为我们的丝绸和香料付了很多硬币，所以我们的商队一直在增加。商队需要护卫，你知道吗。");
	text = text.replace("If I can give you one piece of advice, it\'s this: don\'t venture too far out in the desert. There are things far worse than heat and sand at the edge of the world.", "如果我能给你一条建议，那就是：不要在沙漠里探索的太远。世界边缘有比热和沙更糟的事情。");
	text = text.replace("Those northern dogs have no right to come into our lands, they should stay where they belong!", "那些北方的狗无权进入我们的土地，他们应该呆在属于他们的地方！");
//gt.Const.Strings.RumorsItemsOrcs
	text = text.replace(/A caravan transporting some valuable ceremonial weapon has been raided (.*?) of here\. Rumor is the victims had every single bone broken, and a terrible stench hangs in the air\./, "听说一辆运送贵重仪式武器的商队在这里的 $1 被劫了。传言的受害者身上的每一根骨头都断了，空气中还弥漫着可怕的恶臭。");
	text = text.replace(/A patron recently spoke of some weapon called the (.*?) he wanted to sell\. Said he got spooked by some greenskinned beasts on his way to town and abandoned it (.*?) from here\./, "最近有一名顾客说他有一件叫做 $1 的武器想出售。他说来这里的路上被绿皮怪物吓了一跳并丢失在 $2 离这里。");
	text = text.replace(/A traveler told me the other day that he saw the biggest man alive wielding what he called (.*?) with his own eyes\. Sounds like hogwash to me, but if you\'re interested the guy left here towards the (.*?)\./, "一位旅行者告诉我有一天他亲眼看见一个活着的巨人挥舞着一把叫做 $1 的武器。听起来像废话，但如果你感兴趣的话你可以从这去往 $2。");
	text = text.replace(/Big cocked adventurer with a pretty face came by here a few nights ago\. He headed (.*?) of here looking to slay some greenskins\. Wore a fancy shield on his back, looked like some type o\' knight, but told me he wasn\'t\./, "几天前的一个晚上一个长着漂亮脸蛋的冒险者来过这。他向着 $1 出发猎杀绿皮去了。他戴着一个华丽的盾牌，看起来就像个骑士，但他没有承认。");
	text = text.replace(/They say that some famous shield, I forgot what it was called, once stopped a boulder from rolling down a hill and crushing a camp\. Sounds like shite to me\. Not that we\'ll ever find out if it\'s true that it\'s an orc war trophy now, hidden somewhere (.*?) to the (.*?) of here\./, "他们说有一种著名的盾牌，我忘了叫什么了，曾经阻挡了一块从山上砸向营地的大圆石。这听起来这恶心，并不是说我们会知道它现在是不是兽人的战利品，藏在离这 $1 $2 的某处。");
	text = text.replace(/Don\'t take my word for it, but supposedly some big green oafs (.*?) of here are toting around with an incredible shield simply called (.*?)\. How they might\'ve gotten it is beyond me\./, "别把我的话当真，但是假设在这的 $1 有几个绿皮智障拿着一个名叫 $2 不可思议的盾牌。我都不知道它们怎么搞到的。");
	text = text.replace(/Some nobleman\'s manor got raided by greenskins a few days ago\. They made off with some famous shield or relic\. Supposedly those greenskinned bastards are holed up somewhere (.*?) of here\./, "几天前一些贵族领地遭到绿皮掠夺。还带走了一些著名的盾牌与战利品。据说那些绿皮杂种住在这里 $1 的某个地方。");
	text = text.replace(/Familiar with orcs\? Massive beasts and strong as oxen! A mercenary band that called themselves (.*?) came through and headed (.*?) to hunt them down some weeks ago\. They never returned, but their leader wore the most impressive armor I\'ve ever seen in my life!/, "熟悉兽人？它们就是强壮如牛的野兽！数周前一支名叫 $1 的雇佣兵团朝着 $2 狩猎它们去了。然后一去不复返了，不过他们的队长穿着一件令人印象深刻的盔甲！");
	text = text.replace(/Oh, have you heard of (.*?)\? It\'s said to have been stolen ages ago during the last orc invasion\. There were sightings of it reported (.*?) of here, but me, I don\'t know any details\. I didn\'t mean to get your hopes up about it\./, "噢，你听说过 $1 吗？据说在数世纪前的兽人入侵时期被偷了。现在有人说在这里的 $2 见过它，但是我不了解细节。我不是有意让你对它抱有希望的。");
	text = text.replace(/Some famed armorsmith got slain a few days ago\. Rumor has it orcs ransacked his place and ran off with his masterpiece to somewhere (.*?) from here\. Maybe someone else can tell you more\./, "几天前好几个著名的盔甲师被杀了。据说兽人洗劫了他的住所并带走了他的杰作，跑向这里的 $1 去了。可能其他人能告诉你更多情况。");
	text = text.replace(/Word has it (.*?) got forever put to sleep by a band of greenskins (.*?) of here\. He was well known for abusing all his servants so you won\'t find anyone crying for him \'round here\. Just a shame for the mastercrafted armor he used to boast, that one could buy us a lot of pigs and cows\. And chickens!/, "带有 $1 字样的盔甲被一群绿皮永眠在这里 $2 的某处。他虐待仆人是出了名的，所以你在这里是找不到任何人为他哭泣的。对于他曾经吹嘘的精心制作的盔甲来说，这简直是一种耻辱，那件盔甲能买许多猪和牛呢。还有数不尽的鸡！");
//gt.Const.Strings.RumorsItemsGoblins
	text = text.replace(/A really pissed-off nobleman told me the other day that some stunty greenskins made off with his family heirloom after poisoning his trusted guard dogs\. He swears they hid (.*?) somewhere (.*?) from here, but I don\'t think he ever convinced anyone to retrieve it for him\. Certainly not me\./, "有一天一位非常生气的贵族跟我说有些矮小的绿皮毒死了他家的看门狗后偷走了他的传家宝。他发誓他们肯定藏在 $1 的某处是 $2 离这里，但我不认为他说服过任何人帮他找回它。至少肯定不会是我。");
	text = text.replace(/Afraid of greenskins\? Some real beaten up soldiers passed down through here the other day\. Said they wanted to wrestle a well-known weapon from goblins (.*?) of here, but it sure looked like it didn\'t go down as planned and they had to pull back\. Guess their prize is still up for the taking\./, "害怕绿皮吗？几天前一群久经沙场的士兵来过这里。据说他们想从这里 $1 的哥布林那里争取一件著名的武器，但看起来他们的计划确实没有奏效而不得不撤回来。估计他们还在商量中。");
	text = text.replace(/A farmer from up (.*?) told me he saw some small, sinister creatures on his land carrying a large, shiny shield and making devilish noises\. He says it was goblins, but I say he got pranked by some youngsters!/, "一位来自 $1 的农夫告诉我，他看见一些矮小的，阴险的生物在他的土地上，还拿着一件巨大闪亮的盾牌发出邪恶的声音。他说那些是哥布林，但我说他是被一些小孩子戏耍了！");
	text = text.replace(/They found the best shieldmaker in the whole region dead with a dart sticking out of his neck (.*?) of here\. People said they saw little creatures running off with half his wares\./, "他们发现这里 $1 最好的制盾匠死了，脖子被一根标枪给刺穿。人们还说一些矮小的生物偷走了他一半的货物。");
	text = text.replace(/Somewhere (.*?) of here be some goblins\. The only reason I know it is because every swinging dick that comes this way talks about how they just barely got away with their life\. One even claims he lost his mastercrafted shield when legging it\./, "这里 $1 的某处居住着一群哥布林。我知道这一切的唯一原因是因为每一个嘚瑟的家伙都在谈论他们是如何侥幸逃脱它们的魔掌。有人还声称在逃跑时丢了一块精良的盾牌。");
	text = text.replace(/Word has it that some overpriced and overvalued piece of armor  was stolen from the guardhouse by some small devil creatures that hauled it to the (.*?)\. (.*?) said it must\'ve been goblins, but no one here really knows what they look like\./, "有传言说一些价值连城盔甲被一群邪恶的生物从警卫室偷到 $1 去了。$2 说一定是哥布林，但没人真正看清那些家伙是啥模样的。");
	text = text.replace(/It\'s said that kobolds and goblins take a special interest in everything shiny\. I never believed this to be true myself, but I repeatedly saw something glissening in the sun (.*?) from here and heard strange stories about short and stubby creatures roaming that area\./, "据说狗头人和哥布林对那些闪闪发亮的东西十分感兴趣。我自己是不相信的，但我不断的看到有东西在阳光下闪闪发光在 $1 离这里，而且还听说有些矮小侏儒般的生物在那个地区徘徊。");
	text = text.replace(/You may be interested to learn that our old herbalist outside of town got robbed last night just as a wealthy knight payed him a visit\. The assailants, he claims it was small creatures looking like deformed kids, killed the knight and made off to (.*?) in the (.*?)\./, "你可能有兴趣知道昨晚我们镇外的老药剂师被抢劫了，还是在一个富有的骑士拜访他的前提下。他的助手声称一个看起来像畸形小孩的矮小生物杀了骑士，并逃去了 $1 是在 $2。");
//gt.Const.Strings.RumorsItemsBandits
	text = text.replace(/Word has it that a bunch of ne\'er do wells (.*?) from here got their hands on something real fancy and sharp through a brash heist\./, "有消息说一群不知哪来的强盗在这里的 $1 通过一次鲁莽的抢劫得到了一件神奇又锋利的武器。");
	text = text.replace(/Buncha lowlifes tried raiding a caravan (.*?) from here\. They all got slain, but rumor has it that some valuable weapon went missing during the fight\. The caravan guards have been searching for it frantically since\./, "一群贱民企图掠夺一个商队在 $1 离这里。然后他们都被杀死了，但有传言说有一件价值连城的武器在那次战斗中遗失了。那个商队的头领从那以后发了疯似的到处寻找。");
	text = text.replace(/A bewildered patron told me he was held prisoner by some rogues (.*?) from here\. Said they had something real pretty with them\. Some sort of curious looking weapon\./, "一位糊涂的顾客告诉我他曾经被一群流氓囚禁在 $1 地方。他说那帮人有一件外形奇怪的武器。");
	text = text.replace(/The captain of the guard deserted a while ago to join a raider camp hidden (.*?) to the (.*?)\. My uncle, who served under him, claims he raided the armory before leaving and grabbed a real prize\./, "一名守卫队的队长前段时间被革职了然后加入到一个在这里 $2 $1 的强盗营地。我的叔叔曾经在他手下工作过，而且声称那队长在离开前在军械库盗走了一件珍贵的战利品。");
	text = text.replace(/I hear the famous shield (.*?) has been sighted\. (.*?) claims that it belongs to a band of hard boiled raiders camping out (.*?) of here\. But then, (.*?) talks lots about things he knows nothing about\./, "我听说一面叫做 $1 的盾牌被发现了。$2 声称那面盾牌就在这里 $3 一群彪悍的强盗手中。然后 $4 说了很多他自己也不了解的话题。");
	text = text.replace(/All anyone talks \'bout \'round these parts are damned raiders\. \'Suppose they\'re the toast of Rumorville \'cause they gots their hands on the (.*?) or some such thing now\. Where at\? Oh, somewhere (.*?)\./, "所有人都在“抱怨”这一带都是强盗。“猜想他们是谣言制造者”是因为他们得到了一些类似 $1 的珍宝才那么猖獗吧。你问我在哪？噢，或许是在 $2。");
	text = text.replace(/A friend of a friend got robbed (.*?) from here by a group of outlaws the other day\. He claims the leader donned the most astonishing armor!/, "我的一个朋友的朋友前些天在这里的 $1 被一群不法之徒抢劫了。他宣称那个强盗头目穿了一件令人震惊的盔甲！");
	text = text.replace(/A brash young man came through just the other day, nobility methinks, looking for an old family heirloom called (.*?)\. Last I saw, he was heading (.*?) of here\./, "几天前一名傲慢的年轻人来过这，我猜是一名贵族，在寻找一件古老家族名叫 $1 的传家宝。最后我看到他从这里往 $2 去了。");
//gt.Const.Strings.RumorsItemsUndead
	text = text.replace(/Now, I don\'t want to start any rumors, but I saw a dead man walking around (.*?) of here\. His rotten hands clutched an extraordinary weapon but I\'d never dare go there again in my life!/, "我真的不是在散播谣言，但我确实看到一只僵尸从这往 $1 走去了。他那只腐烂的手还抓着一把非凡的武器，但我这辈子都没胆量去那里了！");
	text = text.replace(/Some drunk scavenger came by last night, told us he\'d tried to wrestle a weapon beset with gems from a dead man\'s hands (.*?) to the (.*?)\. Said his grip was like a vice, and then he made a sound, so he ran off\. Such nonsense, but he looked spooked as all hell\./, "昨晚来了好几个醉醺醺的流浪者，告诉我们他曾经在这里 $1 $2 碰到了一只僵尸，想从僵尸手里夺取一把镶着宝石的武器。那头僵尸吼了一下他就吓跑了。他好像被吓的胡言乱语了。");
	text = text.replace(/There\'s lots of talk about the dead walking the earth again\. (.*?) says there\'s some to the (.*?) of here\. Sounds like hogwash to me\./, "这里流传着许多僵尸重现大陆的传言。$1 还说这里的 $2 就有一些僵尸。对我来说这些就是废话。");
	text = text.replace(/Supposedly a bunch of graves (.*?) of here are turning up empty\. Someone said graverobbers were looking for a famed shield buried there\. Strangely, nobody\'s actually seen those graverobbers, so maybe it\'s all hogwash\./, "这里的 $1 有许多墓穴可能都被挖空了。有人说盗墓贼在寻找一面埋藏在那里的传奇盾牌。奇怪的是没人确切的见过那些盗墓贼，可能只是谣言吧。");
	text = text.replace(/So I watched over the steward\'s books and came across old maps that depicted an ancient noble burial ground (.*?) from here\. However, nobody was able to find it yet\. Well, some things are just not meant to be found, I suppose\./, "我在翻看管家的书籍时偶然发现了一张陈旧的地图，上面描述了一个古老的贵族的埋骨之地就在 $1 离这里。可惜的是没人能找到那墓穴。好吧，我猜想有些东西是注定找不到的。");
	text = text.replace(/So (.*?) of here is supposedly the last resting place of a mystical piece of armor\. Don\'t know the name myself, I just know a lot of adventurers go there and don\'t come back\. Dunno why I told you, really. I like your business\./, "可能有一件神秘盔甲永眠在 $1 离这里。我也不知道那件盔甲叫什么，我只知道很多冒险者去了那里就再也没回来过。我不知道为啥要告诉你这些，但我真的喜欢你的行业。");
	text = text.replace(/You heard of (.*?)\? Ask anyone around here, it\'s been haunting (.*?) since before I was born\. Folks say some armor from the gods is sealed there for all time, back from when man first settled here\./, "你听说过 $1 吗？这里所有人都知道 $2，自打我出生以来就刻在我的脑海里了。人们都说在人类定居之前有件盔甲被诸神一直封印在那里。");
//gt.Const.Strings.RumorsItemsBarbarians
	text = text.replace(/Nothing is holy to those barbarian brutes! A completely naked priest stumbled in here from (.*?)\. He was on the way to bring a revered relic to the temple but they took it from him\./, "对那些野蛮人来说，没有什么是神圣的！一个全裸的牧师从 $1 跌跌撞撞地来到这里。他正要把一件受人尊敬的遗物带到神殿里，但他们把它拿走了。");
	text = text.replace(/A mercenary company came by here hunting barbarians\. The leader wielded a weapon unlike anything I ever saw before\. They turned (.*?) and were never to be seen again\./, "一个佣兵战队来这里猎杀野蛮人。首领挥舞着一把我从未见过的武器。他们转向了 $1，再也看不见了。");
	text = text.replace(/When you head out (.*?), keep your eyes peeled for a group of fierce wild men\. They may lead you to their stash where a famed stolen weapon is said to be found\./, "当你驶出 $1 时，注意观察一群凶猛的野人。他们可能会把你带到他们的藏匿处，据说在那里发现了一件著名的被盗武器。");
	text = text.replace(/Hark! A tribe of uncultured barbarians has been seen (.*?) of here with a shield called (.*?) in their dirty hands! Slay them and get it back!/, "听我说！一个未受教育的野蛮人部落在这里的 $1 被看到，他们的脏手拿着一个名为 $2 的盾牌！杀了他们，把它拿回来！");
	text = text.replace(/A friend of a friend spotted some wildmen in the distance (.*?) of here\. He swears they carried a finely crafted shield\. I call horseshit, as everbody knows they do not use shields like we do!/, "一个朋友的朋友在这里的 $1 发现了一些野人。他发誓他们带着一个精巧的盾牌。我叫马屎，因为每个人都知道他们不像我们那样使用盾牌！");
	text = text.replace(/Only a good defense allows for a strong offense they say\. Rumors has it, a band of barbarians (.*?) to the (.*?) are in the possession of a famed shield\.\.\./, "他们说，只有良好的防守才给予有力的进攻。有传言说，一群野蛮人在 $1 的 $2 拥有一个传奇盾牌…");
	text = text.replace(/I used to be trading with some of the not-so-wild barbarians (.*?) of here\. When I last visited them there was a magnificent shield hanging in one of their huts\. They might still be hanging out there (.*?)\./, "我曾经和这里 $1 的一些不那么野蛮的野蛮人做过交易。我上次拜访他们时，他们的一间小屋里挂着一个华丽的盾牌。他们可能还在那个 $2。");
	text = text.replace(/You look like you could use some better armor, my friend\. If you are not scared of taking on fierce barbarians, there is a mighty fine armor to be claimed in one of their camps called (.*?), (.*?) of here\./, "你看起来需要更好的盔甲，我的朋友。如果你不害怕与凶猛的野蛮人作战，在他们那里有一个强大的精美盔甲，那个营地叫做 $1，$2 离这里。");
	text = text.replace(/The famed (.*?) has been guarded in the armory for decades, but when the wild men from the north came they took everything with them\. They are said to be camping out somewhere (.*?) from here\./, "著名的 $1 在军械库中被守卫了几十年，但是当北方的野人来的时候，他们带走了所有的东西。据说他们地方露营的地方在 $2 离这里。");
	text = text.replace(/I came here to pick up an heirloom from my late grandfather just to get to know it has been stolen by marauding barbarians\. They are said to loiter somewhere (.*?) of here, but I fear I will never get it back\./, "我来这里是为了从我已故祖父那里取走一件传家宝，只是知道它是被掠夺的野蛮人偷走的。据说他们游荡的地方在 $1 离这里，但我担心我永远也回不来了。");
	text = text.replace(/Are you also here to look for (.*?) like all those other fools\? It is said to lie somewhere (.*?)\. Nothing but hogwash if you ask me\.\.\./, "你也是来找 $1 的吗？据说它在 $2。如果你要我说的话，除了废话…");
//gt.Const.Strings.RumorsItemsNomads
	text = text.replace(/The nomads take what they want and hide out in the desert\. The guards have been looking for them (.*?) of here\. I think they\'re (.*?)\./, "游牧民拿走他们想要的东西，躲在沙漠里。卫兵曾经见过他们是在 $1 离这里。我想他们是 $2。");
	text = text.replace(/The days here in the south are as bright as the nights are dark\. I must have stumbled and lost my precious weapon (.*?) to the (.*?), but I gave up looking for it\./, "南方的白天和黑夜一样明亮。我一定是绊倒了，把我珍贵的武器丢到了 $1 的 $2，但我放弃了寻找它。");
	text = text.replace(/The craftsmen of the ancient times really knew how to make remarkable weapons\. Rumors has it such a weapon is with a nomad tribe hiding out in the (.*?), but who should take it from them - me\? Ha!/, "古代的工匠们真的知道如何制造非凡的武器。有传言说这样的武器被一个游牧部落藏 $1，但谁应该从他们那里拿走－我？哈！");
	text = text.replace(/A shield reflecting the sunlight like a mirror, more blinding than the midday in the desert! Where I saw that\? Some Nomads had it in the (.*?) from here, if I recall correctly\./, "一块像镜子一样反射阳光的盾牌，比在沙漠中正午的时候还要刺眼！我在哪里看到的？如果我没记错的话，那些游牧民在这里 $1 地方。");
	text = text.replace(/All my life I\'ve been hunting nomdas across the borders (.*?), but I never saw one wield a shield like this one before\. It was (.*?) to the (.*?) at one of their camps\./, "我一辈子都在边境的 $1 猎杀游牧民，但我从没见过有人像这样挥舞盾牌。他们是在 $2 $3 的一个营地。");
	text = text.replace(/Nomads do not only take from the living but from the dead as well! Word has it they plundered the so-called (.*?) from a tomb (.*?) of here where they have their camp still\. They really do not have any decency\./, "游牧民不仅从活着的人身上拿东西，也从死去的人身上拿！有消息说他们从一个坟墓里劫掠了所谓的 $1，在这里的 $2，那里还有他们的营地。他们真的一点也不体面。");
	text = text.replace(/I used to be first quartermaster to a Vizier\. When the famed armor I ordered for a guest of honor did not arrive, I lost my position\. The caravan with it was ambushed by nomads, I later learned, (.*?) of here\./, "我曾经是维齐尔的第一军需官。当我为一位贵宾订购的传奇盔甲没有到达时，我失去了我的位置。我后来得知，随行的商队在这里的 $1 遭到游牧民的伏击。");
	text = text.replace(/An oppulent armor is said to be hidden out (.*?) from here\. Many treasure seekers failed to claim it so far but maybe you have more luck\?/, "据说一件凶残的盔甲藏在 $1 离这里。到目前为止，很多寻宝者都没有找到它，但也许你运气更好？");
	text = text.replace(/The most skilled armorsmith around, who happens to be a friend of mine, got tricked by those damned nomads and they made off with one of his prize armors\. If you come across any nomads (.*?) of here, search their bodies thoroughly!/, "最熟练的盔甲师，碰巧是我的一个朋友，被那些该死的游牧民骗了，他们带走了他的一件珍贵的盔甲。如果你在这里的 $1 遇到任何游牧民，彻底搜查他们的尸体！");
//gt.Const.Strings.RumorsGreaterEvil
	text = text.replace("The nobles are quarreling again like two old hags at the garden fence. They just can\'t get over their pride!", "贵族们又在吵架了，就像花园篱笆旁的两个老太婆。他们只是无法克服他们的骄傲！");
	text = text.replace("The nobles will take all your crowns, and your sons and husbands too, and burn them in their pointless struggles - a thousand curses \'pon them!", "贵族们会拿走你所有的克朗，还有你的儿子和丈夫，他们会葬送在他们毫无意义的斗争之火中－会受到上千次的诅咒！");
	text = text.replace("I\'ve served my time in the army twenty years ago. Lost an ear, see? Now my boy\'s marching. Was snatched right out the stables and forced into the frontline. Different war, same old shit. I pray he stays low and keeps his shield up.", "二十年前我在军队服役。失去了一只耳朵，看到了吗？现在我的孩子在行军。从马厩里被抓出来，被迫进入前线。不同的战争，操蛋的老一套。我祈祷他保持低姿态，举起盾牌。");
	text = text.replace("The green tide keeps washing away one army after the other! We\'re all doomed! Doomed!", "绿色的潮水不断地冲走一支又一支的军队！我们都要完蛋了！完蛋了！");
	text = text.replace("All are running from the greenskins but not me! I will stand my ground, club in one hand, pitcher in the other! Send them my way!", "所有人都在逃离绿皮，但不是我！我要坚守阵地，一手拿棍棒，一手拿瓦罐！送他们上路！");
	text = text.replace("We barely fought off the greenskins last time at the Battle of Many Names, just barely made it, and now they\'re back.", "上一次在许多名人之战中，我们几乎没有击退绿皮，只是勉强成功，现在他们又回来了。");
	text = text.replace("We hear stories of more and more farms and hamlets getting burned every day. It\'s greenskins raiding the countryside.", "我们每天都听到越来越多的农场和村庄被烧毁的故事。是绿皮在掠夺乡村。");
	text = text.replace("May the old gods help us! The dead are stirring in their graves all over the lands. They will come and claim the living. Repent, repent and pray!", "愿老天保佑我们！死者在各地的坟墓里翻腾。他们会来索命生者。忏悔，忏悔和祈祷！");
	text = text.replace("The nobles are on their back foot, and nobody knows how to stop the undead menace coming for us. I have to keep my mind off of it - inkeeper! Another!", "贵族们在处于守势，没有人知道如何阻止对我们造成威胁的亡灵。我得把我的注意力从它身上移开－掌柜的！再来一杯！");
	text = text.replace("Maybe I should just hang myself, get it over with and join the ranks of the marching dead. This waiting is driving me insane!", "也许我应该上吊自杀，结束这一切，加入行军死者的行列。这种等待快把我逼疯了！");
	text = text.replace("A man was found dead on the road. He sat upright on a donkey cart, all dried up, like a puppet of skin, tendrils, and bone. The donkey too. \'Tis like the blood was sucked right out of \'em.", "一个人被发现死在路上。他笔直地坐在驴车上，全身干枯，成为了只剩皮、毛发和骨头的傀儡。驴子也是。就像是血从他们身上被吸了出来。");
	text = text.replace("Ghastly ghosts, empty graves, otherworldly mindless slaves\nHave a glass, find a wench before your teeth will clench!\nKill the can, don\'t stay dry, three days until we die!", "阴森的幽灵，空荡荡的坟墓，超凡脱俗的奴隶都有一个杯子，在你咬牙切齿之前找个姑娘！干掉罐子，别干了，三天之后我们就死了！");
	text = text.replace(/(.*?) had his lunch come back from the dead. Was about to take a healthy bite of stuffed goose when the thing jumped from his plate and started flapping in circles\. Sprayed baked apples across the living quarters\. Must\'ve been a sight to remember\./, "$1 的午餐是从死人那里拿回来的。就在他准备大口饱餐那个鹅的时候，那东西从他的盘子里跳了出来，并开始转起了圈儿。把烤苹果洒在起居室里。一定是个值得回忆的景象。");
	text = text.replace(/Did you hear the news\? Armies are rallying at (.*?) to march south\. I just hope the gilded don\'t strike back some day\.\.\./, "你听到消息了吗？军队在 $1 集结向南进军。我只希望镀金者有一天不要反击…");
	text = text.replace("If you are looking for coin you should head south and teach those sun-worshippers a lesson!", "如果你在找硬币，你应该往南走，给那些太阳崇拜者上一课！");
	text = text.replace("What.... WHAT!? I can\'t hear you! I was fighting those Gilder followers at the Oracle and something loud went up near my ear...", "什么…。什么！？我听不见你说话！我在神谕所和那些镀金者的追随者战斗，我耳边响起了响亮的声音…");
	text = text.replace("Want some soup? I got beef and potatoes in there. No spices, though. Ran out of \'em on account of the war.", "想喝点汤吗？我放了牛肉和土豆在里面。不过，没有香料。它们因为战争都用断货了。");
	text = text.replace("The priest says that the old gods will take you in if you don\'t make it back from the crusade. \'Tis a good thing to know, right? Those Gilder fanatics are a dangerous lot.", "牧师说如果你不能从十字军远征中回来，旧神会接纳你。知道是件好事，对吧？那些镀金狂热分子很危险。");
	text = text.replace(/Can you believe it\? (.*?) paid some nomad folk to guide his host through the desert\. Bloody folly if true, that\. Wouldn\'t trust those snakes as far as I can piss\./, "你能相信吗？$1 雇了一些游牧民带领他的主人穿过沙漠。该死的蠢事，如果是真的。我不敢相信那些蛇。");
	text = text.replace("A nephew of mine got killed in the desert. Poor lad. Set out to protect the faith and was ran through with a spear for it. Bastard who did it is still alive. Make \'em pay for it, I say. Make the thrice cursed lot o\'em pay!", "我的一个侄子在沙漠中被杀了。可怜的小伙子。为了去保卫信仰，被一支长矛刺穿了。做这事的混蛋还活着。让他们为此付出代价，我说。让这群受三倍诅咒的人付出代价！");

//情况
	text = TranslateRumors_QingKuang(text);

	text = DiXing(text);
	text = TranslateToolTip0(text);

	return text;
}

var TranslateWorldTownScreenTavernDialogModule2 = function(text)
{
	text = text.replace("The men cheer your name as they drink.", "人们一边喝酒，一边欢呼着你的名字。");
	text = text.replace("The men drink to fallen comrades.", "人们为牺牲的同伴干杯。");
	text = text.replace("The men cheer the company name as they drink.", "人们一边喝酒，一边欢呼着战队的名字。");
	text = text.replace("The men drink to women and their bosoms.", "男人们为女人和她们的丰乳干杯。");
	text = text.replace("The men drink to the loyal wardogs.", "人们为忠诚的战犬干杯。");
	text = text.replace("Laughter and light-hearted stories fills the tavern as your men drink.", "酒馆里充满了欢声笑语和轻松愉快的故事。");
	text = text.replace("Hard mercenary life takes a rest as the men share stories of their past lives and enjoy themselves.", "艰苦的雇佣兵生涯带给了他们丰富的人生经历和在休息时吹嘘的资本。");
	text = text.replace("\'Huzzah to the commander!\', the men shout.", "“向指挥官致敬！”，人们欢呼着。");
	text = text.replace("Your men boast with their accomplishments as they drink.", "你的人喝酒时总喜欢夸大自己的成就。");
	text = text.replace("The strong drinks blur the horrors of combat for a while.", "烈酒暂时模糊了战斗的恐怖。");
	text = text.replace("Your men cheer and toast to riches and a long life.", "你的人为财富与长寿干杯。");
	text = text.replace("The beer makes the hardships of the day disappear.", "啤酒让一天的疲惫都消失了。");
	text = text.replace("The patrons shout your name as they clink their cups.", "顾客们在碰杯时呼喊着你的名字。");
	text = text.replace("The drink loosens their tongues.", "酒精总能让他们畅所欲言。");
	text = text.replace("The patrons nod approvingly.", "顾客们赞许地点了点头。");
	text = text.replace("People raise their mugs in appreciation.", "人们举杯表示感谢。");
	text = text.replace("The people murmor approvingly.", "人们在默默地赞许着你。");
	text = text.replace("The people murmur approvingly.", "人们在低声地赞许着你。");
	text = text.replace("The innkeeper rings a bell to let everyone know the next round is on you.", "酒馆老板摇铃告诉大家下一轮由你请客。");

	return text;
}

var TranslateWorldTownScreenTavernDialogModule3 = function(text)
{
	text = text.replace("is now drunk.", "喝醉了。");
	text = XinQing(text);

	return text;
}

var TranslateWorldTownScreenTaxidermistDialogModule = function(text)
{
	text = text.replace("A taxidermist can create useful items from all kinds of trophies you claimed", "一个剥制师可以从你得到的各种战利品中创造有用的物品。");
	text = text.replace("A taxidermist can create useful items from all kinds of beast trophies that you bring him", "一个剥制师可以从你带给他的各种野兽战利品中创造有用的物品");
	text = text.replace("A taxidermist can create useful items from all kinds of beast trophies that you bring", "一个剥制师可以从你带给他的各种战利品中创造出有用的物品");
	text = text.replace("Taxidermist", "剥制屋");
	return text;
}

var TranslateWorldTownScreenTempleDialogModule = function(text)
{
	text = text.replace("Have your wounded treated and prayed for by priests", "让你的伤者得到牧师的治疗和祈祷");
	text = text.replace("Temple", "神殿");

	return text;
}

var TranslateWorldTownScreenTrainingDialogModule = function(text)
{
	text = text.replace("Have your men train for combat and learn from veterans", "让你的人接受战斗训练向老兵学习");
	text = text.replace("Training Hall", "训练厅");
	text = text.replace("Sparring Fight", "搏斗练习");
	text = text.replace("Veteran\'s Lessons", "老兵的功课");
	text = text.replace("Rigorous Schooling", "严格的训练");

	return text;
}

var TranslateMainMenuScreen = function(text)
{
//增加传奇
	text = text.replace("Welcome to Legends Beta.", "传奇 16.1.15 (需全DLC1.5.0.12 以上游戏本体)");
//	text = text.replace("To report bugs, share strategies and ideas, or try out new test builds, join us on https:", "报告错误、分享策划和想法，或尝试新的测试版本，请加入我们https:");
	text = text.replace("To report bugs, share strategies and ideas, or try out new test builds, join us on https://discord.gg/ZfCHGuC", "汉化基于贴吧群‘LAE.传奇汉化改+PTR’,本人新增翻译适配最新版本传奇+PTR，精力有限很多遗漏，有问题请在贴吧或加我QQ(1875666470)反馈！");

	text = text.replace("Battle Brothers is a hard game.", "战场兄弟是一个艰难的游戏。");
	text = text.replace("Even if you\'ve played similar games before, it\'s recommended that you start with \'Beginner\' difficulty and play the tutorial!", "即使你以前玩过类似的游戏，也建议你从“初学者”难度开始，先玩教程！");
	text = text.replace("Battle Brothers is a challenging game.", "战场兄弟是一个具有挑战性的游戏。");
	text = text.replace("Losses and comebacks are part of the gameplay.", "失利和复出是游戏的一部分。");
	text = text.replace("It\'s recommended that you start with \'Beginner\' difficulty and the tutorial origin!", "建议你从“初学者”难度和教程开始！");

	return text;
}
