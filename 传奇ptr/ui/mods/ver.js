var wtTranslateMainMenuScreen = TranslateMainMenuScreen;
TranslateMainMenuScreen = function (text)
{
	text = text.replace("Welcome to Legends Beta.", "传奇 16.0.4 (需全DLC1.5.0.11 游戏本体)");
	text = text.replace("To report bugs, share strategies and ideas, or try out new test builds, join us on https://discord.gg/ZfCHGuC", "汉化基于贴吧群‘LAE.传奇汉化改+PTR’,本人新增翻译适配最新版本传奇+PTR，精力有限很多遗漏，有问题请在贴吧或加我QQ(1875666470)反馈！");
	text = wtTranslateMainMenuScreen.call(this,text);
	return text;
}
