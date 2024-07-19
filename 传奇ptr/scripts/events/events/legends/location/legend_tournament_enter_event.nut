this.legend_tournament_enter_event <- this.inherit("scripts/events/event", {
	m = {
		Veteran = null,
		IsActive = false
	},
	function create()
	{
		this.logInfo("Creating tournament event");
		this.m.ID = "event.location.legend_tournament_enter";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 100;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{ 你走近了一扇巨大的金属门，门上有一道巨大的防御墙。显然只有一条路可以进去。一名卫兵从城垛上喊道%SPEECH_ON%来这里参加比赛？从没听说过你。在踏上这些神圣的土地之前，请在南方舞台上证明自己。%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "我们必须前往竞技场。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{ 你走近了一扇巨大的金属门，门上有一道巨大的防御墙。显然只有一条路可以进去。一名卫兵从城垛上喊道，向你的竞技场老兵示意 %SPEECH_ON%Hail %veteran%! 我听说了你在竞技场的表现，但这些人是谁？你的派对至少需要三名退伍军人才能让你参加盛大的锦标赛。教他们你的方法，然后回来，我们期待着在比赛中见到你。 %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "我们必须回到竞技场。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{ 你走近巨大的防御墙，金属门打开，看不到警卫。当你穿过大门时，一轮号角响起，一个声音回响。 %SPEECH_ON%欢迎%companyname%参加盛大锦标赛！%SPEECH_OFF% 宣布后，一片掌声响起，你走进了门厅。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "我们应该受到的欢迎。",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{在大厅的另一边，一扇门打开了，一个自信的女人大步走向你。喇叭再次响起，阿特米西亚-盛大比赛的元帅。她带着一副斗士的姿态，身穿斗篷，剑鞘丰满，面带欢迎的微笑。%SPEECH_ON%很高兴见到著名的%companyname%，我很高兴看到你加入我们最伟大的战士行列。你来这里是为了炫耀权利还是为了硬币？没关系，你在这里都能找到%SPEECH_OFF% 她把你带到一扇窗户前，俯瞰着一个大的草地竞技场，在那里，有钱的顾客们看着武士们在互相格斗。 %SPEECH_ON%今天我们有三个比赛项目要参加，一场对抗你选择的特定敌人的表演赛，一场针对人类无尽浪潮的挑战赛，或者一场针对所有敌人的混战赛。你今天想参加比赛吗？ %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "告诉我混战赛的情况。",
					function getResult( _event )
					{
						return "E";
					}

				},
				{
					Text = "告诉我挑战赛的情况。",
					function getResult( _event )
					{
						return "H";
					}

				},
				{
					Text = "我对表演赛感兴趣。",
					function getResult( _event )
					{
						return "I";
					}

				},
				{
					Text = "事实上，我不是...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "D2",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{你回到主厅，发现阿特梅西娅正在和一群外国拳手交谈，而他们正通过观景窗观看一场混战赛。她看到你回来，向战士们告别，并微笑着问候你。 %SPEECH_ON% 因此，%companyname%不满足于表演赛。我想我在你身上看到了更多的火花。是混战赛还是挑战赛？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "告诉我混战赛的情况。",
					function getResult( _event )
					{
						return "E";
					}

				},
				{
					Text = "告诉我挑战赛的情况。",
					function getResult( _event )
					{
						return "H";
					}

				},
				{
					Text = "对不起，我在找出去的路。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{阿特米西亚微笑着，兴奋地讲述着混战赛的规则%SPEECH_ON%这些是混战赛的强制规则， \n\n 1.你的战队会一轮又一轮地战斗，对抗各种人和动物，没有战斗规则。  \n\n 2.奖金从1000克朗开始。每次战斗，难度都会增加，奖品也会加倍。 \n\n 3.你可以保留战斗后找到的任何战利品。%SPEECH_OFF%她又兴味盎然的笑了。 %SPEECH_ON%这是最荣耀的比赛，我很高兴亲自观看你的表现。%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "混战赛是为我们准备的，让我们马上开始",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.GrandMelee, false);
						_event.registerToShowAfterCombat("F", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "告诉我挑战赛吧",
					function getResult( _event )
					{
						return "H";
					}

				},
				{
					Text = "你能告诉我关于表演赛的情况吗？",
					function getResult( _event )
					{
						return "J";
					}

				},
				{
					Text = "事实上，我不...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "F",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{战斗结束后，你会回到主赛场外的私人前厅。 阿特米西亚祝贺你打出了一轮精彩的比赛，并为你提供了一个选择，让你继续混战赛或获得奖品。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "下一轮",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.GrandMelee, false);
						_event.registerToShowAfterCombat("F", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "足够了",
					function getResult( _event )
					{
						return "G";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "F2",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{战斗结束后，你被带到武士大厅，其他武士在那里向你道贺。比赛官员祝贺你打出了一轮精彩的比赛，并为你提供继续挑战或夺取奖品的选择}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "下一轮",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.GrandGauntlet, true);
						_event.registerToShowAfterCombat("F2", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "足够了",
					function getResult( _event )
					{
						return "G2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "G",
			Text = "@@[img]gfx/ui/events/event_04.png[/img]{完成混战赛后，你将成为场上的冠军。阿特米西亚亲自给你带来一个装满奖赏的箱子，然后带你出门。 %SPEECH_ON%真是一场精彩的演出，我真的希望很快能再次见到你！好好休息吧，疲惫不堪的战士，你在这些大厅里赢得了一席之地。%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "走运",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local round = this.World.Flags.get("LegendTournamentRound");
				local payment = 1000;

				for( local i = 0; i < round && i < 5; i = i )
				{
					payment = payment * 2;
					i = ++i;
					i = i;
				}

				this.World.Assets.addMoney(payment);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = payment + " crowns as reward"
				});
				this.World.Flags.set("LegendTournamentRound", 1);
			}

		});
		this.m.Screens.push({
			ID = "G2",
			Text = "@@[img]gfx/ui/events/event_04.png[/img]{完成挑战后，您将被引导穿过主大厅。阿特米西亚扔给你一袋硬币。 %SPEECH_ON%打得好！我希望我们能在比赛中再次见到你，尽管我想你在那场比赛后需要休息。 %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "走运",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local round = this.World.Flags.get("LegendTournamentRound");
				local payment = 500;

				for( local i = 0; i < round && i < 5; i = i )
				{
					payment = payment * 2;
					i = ++i;
					i = i;
				}

				this.World.Assets.addMoney(payment);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = payment + " crowns as reward"
				});
				this.World.Flags.set("LegendTournamentRound", 1);
			}

		});
		this.m.Screens.push({
			ID = "G3",
			Text = "@@[img]gfx/ui/events/event_04.png[/img]{侍者把你带到一位比赛官员那里，他会检查一大本比赛成绩记录。  %SPEECH_ON% 啊，是的，给你。%companyname%参加了一场小型比赛。这是你的奖赏。%SPEECH_OFF% 官员递给你一个袋子，侍者带你从骑士比武的大门出去。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "走运",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local round = this.World.Flags.get("LegendTournamentRound");
				local payment = 250;

				for( local i = 0; i < round && i < 5; i = i )
				{
					payment = payment * 2;
					i = ++i;
					i = i;
				}

				this.World.Assets.addMoney(payment);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = payment + " crowns as reward"
				});
				this.World.Flags.set("LegendTournamentRound", 1);
			}

		});
		this.m.Screens.push({
			ID = "H",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{阿特米西亚在重复她多次明确发表的演讲之前，稍微叹了口气%SPEECH_ON%挑战赛的规则很简单， \n\n 一、尽可能多地连续作战。 \n\n 二、你将在没有战斗规则的情况下与来自世界各地的人类竞争对手进行战斗。 \n\n 三、奖金起价为250克朗，每次战斗难度会增加，奖金会加倍。%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "让我们开始挑战",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.GrandGauntlet, true);
						_event.registerToShowAfterCombat("F2", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "告诉我关于混战赛的事。",
					function getResult( _event )
					{
						return "E";
					}

				},
				{
					Text = "也许只是一场表演赛。",
					function getResult( _event )
					{
						return "I";
					}

				},
				{
					Text = "事实上，我不...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "I",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{阿特米西亚对你的选择点头，尽管你察觉到了一些不满。 %SPEECH_ON%表演赛是我们最基础赛事， \n\n 1. 尽可能多地连续战斗。  \n\n  2. 每一轮你都要选择你要对抗的敌人 \n\n 3. 奖品从100克朗开始，每次战斗难度会增加，奖品会加倍。 \n\n 4. 禁止获得战利品。%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "听起来很简单，我参加",
					function getResult( _event )
					{
						return "J";
					}

				},
				{
					Text = "听起来太容易了，告诉我挑战赛的事吧。",
					function getResult( _event )
					{
						return "H";
					}

				},
				{
					Text = "听起来太无聊了，不如告诉我混战赛的事吧。",
					function getResult( _event )
					{
						return "E";
					}

				},
				{
					Text = "我想我们可能需要离开并做好准备。",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "J",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{ 阿特米西亚带你去了一个较小的比赛场地，她看起来心烦意乱，或者可能有点无聊。%SPEECH_ON%祝你演出好运，我必须回到混战赛现场，我将把你交给一位能干的观众。%SPEECH_OFF% 她迅速转过身，朝着欢呼的人群走回大厅。一位侍者一直静静地站在墙边，你根本没有注意到他们，他们走上前去，带着一种中立的表情，一种长期厌倦重复任务的表情，并实事求是地问道。%SPEECH_ON%你想和哪个敌人战斗？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "让我挑选。",
					function getResult( _event )
					{
						return "J2";
					}

				},
				{
					Text = "只为我而选择",
					function getResult( _event )
					{
						local SpawnGroups = [
							this.Const.World.Spawn.Noble,
							this.Const.World.Spawn.BanditBoss,
							this.Const.World.Spawn.Barbarians,
							this.Const.World.Spawn.Southern,
							this.Const.World.Spawn.NomadRaiders,
							this.Const.World.Spawn.Mercenaries,
							this.Const.World.Spawn.Militia,
							this.Const.World.Spawn.GoblinBoss,
							this.Const.World.Spawn.OrcBoss,
							this.Const.World.Spawn.Ghouls,
							this.Const.World.Spawn.LegendHexeLeader,
							this.Const.World.Spawn.LegendRockUnhold,
							this.Const.World.Spawn.LegendSkinGhouls,
							this.Const.World.Spawn.LegendWhiteDirewolf,
							this.Const.World.Spawn.LegendRedbackSpider,
							this.Const.World.Spawn.LegendDemonAlp,
							this.Const.World.Spawn.LegendStollwurm,
							this.Const.World.Spawn.LegendGreenwoodSchrat,
							this.Const.World.Spawn.SandGolems,
							this.Const.World.Spawn.Serpents,
							this.Const.World.Spawn.Hyenas,
							this.Const.World.Spawn.UndeadArmy,
							this.Const.World.Spawn.Vampires,
							this.Const.World.Spawn.Mummies,
							this.Const.World.Spawn.Zombies,
							this.Const.World.Spawn.Ghosts,
							this.Const.World.Spawn.Necromancer,
							this.Const.World.Spawn.BountyHunters,
							this.Const.World.Spawn.GreenskinHorde
						];
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), SpawnGroups[this.Math.rand(0, SpawnGroups.len() - 1)], true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "我更愿意回到阿特米西亚身边。",
					function getResult( _event )
					{
						return "D2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "J2",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者对你的决定不屑一顾，只是重复 %SPEECH_ON%你想和哪个敌人战斗？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "绿皮",
					function getResult( _event )
					{
						return "K";
					}

				},
				{
					Text = "亡灵",
					function getResult( _event )
					{
						return "L";
					}

				},
				{
					Text = "野兽",
					function getResult( _event )
					{
						return "M";
					}

				},
				{
					Text = "人类",
					function getResult( _event )
					{
						return "N";
					}

				},
				{
					Text = "我更愿意回到阿特米西亚身边。",
					function getResult( _event )
					{
						return "D2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "J3",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{比赛结束后，你被带回到一个小房间，侍者问你是否想要另一场比赛或是领取奖励。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "让我挑选。",
					function getResult( _event )
					{
						return "K";
					}

				},
				{
					Text = "只为我而选择",
					function getResult( _event )
					{
						local SpawnGroups = [
							this.Const.World.Spawn.Noble,
							this.Const.World.Spawn.BanditBoss,
							this.Const.World.Spawn.Barbarians,
							this.Const.World.Spawn.Southern,
							this.Const.World.Spawn.NomadRaiders,
							this.Const.World.Spawn.Mercenaries,
							this.Const.World.Spawn.Militia,
							this.Const.World.Spawn.GoblinBoss,
							this.Const.World.Spawn.OrcBoss,
							this.Const.World.Spawn.Ghouls,
							this.Const.World.Spawn.LegendHexeLeader,
							this.Const.World.Spawn.LegendRockUnhold,
							this.Const.World.Spawn.LegendSkinGhouls,
							this.Const.World.Spawn.LegendWhiteDirewolf,
							this.Const.World.Spawn.LegendRedbackSpider,
							this.Const.World.Spawn.LegendDemonAlp,
							this.Const.World.Spawn.LegendStollwurm,
							this.Const.World.Spawn.LegendGreenwoodSchrat,
							this.Const.World.Spawn.SandGolems,
							this.Const.World.Spawn.Serpents,
							this.Const.World.Spawn.Hyenas,
							this.Const.World.Spawn.UndeadArmy,
							this.Const.World.Spawn.Vampires,
							this.Const.World.Spawn.Mummies,
							this.Const.World.Spawn.Zombies,
							this.Const.World.Spawn.Ghosts,
							this.Const.World.Spawn.Necromancer,
							this.Const.World.Spawn.BountyHunters,
							this.Const.World.Spawn.GreenskinHorde
						];
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), SpawnGroups[this.Math.rand(0, SpawnGroups.len() - 1)], true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "我们到此为止",
					function getResult( _event )
					{
						return "G2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "K",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者似乎对您的选择无动于衷。 %SPEECH_ON%很好，你喜欢那种绿皮？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "哥布林",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.GoblinBoss, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "狂战士",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.BerserkersOnly, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "兽人战士",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.OrcBoss, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "你决定，任何人都可以",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.GreenskinHorde, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "再想一想，也许不是绿皮",
					function getResult( _event )
					{
						return "J2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "L",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者对您的残忍请求没有反应。 %SPEECH_ON%很好，你喜欢那种亡灵呢？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "古代亡灵",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.UndeadArmy, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "僵尸",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.Necromancer, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "木乃伊",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.Mummies, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "你决定，任何人都可以",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.UndeadScourge, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "也许不是亡灵",
					function getResult( _event )
					{
						return "J2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "M",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者表情平淡。 %SPEECH_ON%很好，什么样的野兽？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "巨魔",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.LegendRockUnhold, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "蜘蛛",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.LegendRedbackSpider, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "野狼",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.LegendWhiteDirewolf, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "林德虫",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.LegendStollwurm, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "你决定，任何人都可以",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.LegendHexeLeader, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "也许不是野兽",
					function getResult( _event )
					{
						return "J2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "N",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者几乎一动不动。 %SPEECH_ON%没问题，你喜欢和哪些人战斗？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "文明人",
					function getResult( _event )
					{
						return "O";
					}

				},
				{
					Text = "暴徒",
					function getResult( _event )
					{
						return "P";
					}

				},
				{
					Text = "你决定",
					function getResult( _event )
					{
						local SpawnGroups = [
							this.Const.World.Spawn.Noble,
							this.Const.World.Spawn.Southern,
							this.Const.World.Spawn.Mercenaries,
							this.Const.World.Spawn.Militia,
							this.Const.World.Spawn.BountyHunters
						];
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), SpawnGroups[this.Math.rand(0, SpawnGroups.len() - 1)], true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "再想一想，也许是别的什么",
					function getResult( _event )
					{
						return "J2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "O",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者几乎一动不动 %SPEECH_ON%没问题，你喜欢和哪类人战斗？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "贵族",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.Noble, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "城邦",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.Southern, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "雇佣军",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.Mercenaries, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "只为我而选择",
					function getResult( _event )
					{
						local SpawnGroups = [
							this.Const.World.Spawn.Noble,
							this.Const.World.Spawn.Southern,
							this.Const.World.Spawn.Mercenaries,
							this.Const.World.Spawn.Militia,
							this.Const.World.Spawn.BountyHunters,
							this.Const.World.Spawn.BanditBoss,
							this.Const.World.Spawn.Barbarians,
							this.Const.World.Spawn.NomadDefenders
						];
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), SpawnGroups[this.Math.rand(0, SpawnGroups.len() - 1)], true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "再想一想，也许是别的什么",
					function getResult( _event )
					{
						return "J2";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "P",
			Text = "@@[img]gfx/ui/events/legend_tournament.png[/img]{侍者稍稍移动了一下，但什么也没说。%SPEECH_ON%没问题，你喜欢什么样的暴徒？%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "匪帮",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.BanditBoss, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "野蛮部落",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.Barbarians, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "游牧部落",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), this.Const.World.Spawn.NomadDefenders, true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "只为我而选择",
					function getResult( _event )
					{
						local SpawnGroups = [
							this.Const.World.Spawn.BanditBoss,
							this.Const.World.Spawn.Barbarians,
							this.Const.World.Spawn.NomadDefenders
						];
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult(), SpawnGroups[this.Math.rand(0, SpawnGroups.len() - 1)], true);
						_event.registerToShowAfterCombat("J3", "null");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "再想一想，也许是别的什么",
					function getResult( _event )
					{
						return "J2";
					}

				}
			],
			function start( _event )
			{
			}

		});
	}

	function selectFight( scale, type, lootingStopped )
	{
		local round = this.World.Flags.get("LegendTournamentRound");
		local roundDifficulty = 0.7 + round * 0.3;
		this.World.Flags.increment("LegendTournamentRound", 1);
		local p = this.Const.Tactical.CombatInfo.getClone();
		p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
		p.TerrainTemplate = "tactical.tournament";
		p.LocationTemplate.Template[0] = "tactical.legend_tournament_floor";
		p.CombatID = "Legend Tournament";
		local tracks = [
			this.Const.Music.OrcsTracks,
			this.Const.Music.NobleTracks,
			this.Const.Music.UndeadTracks,
			this.Const.Music.BanditTracks,
			this.Const.Music.CivilianTracks,
			this.Const.Music.BeastsTracks,
			this.Const.Music.GoblinsTracks,
			this.Const.Music.OrientalBanditTracks,
			this.Const.Music.OrientalCityStateTracks,
			this.Const.Music.BarbarianTracks,
			this.Const.Music.BattleTracks
		];
		p.Music = tracks[this.Math.rand(0, tracks.len() - 1)];
		p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
		p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
		p.IsUsingSetPlayers = false;
		p.IsFleeingProhibited = true;
		p.IsLootingProhibited = lootingStopped;
		p.IsWithoutAmbience = true;
		p.IsFogOfWarVisible = false;
		p.IsArenaMode = true;
		p.IsAutoAssigningBases = false;
		p.Players = [];
		p.Entities = [];
		this.Const.World.Common.addUnitsToCombat(p.Entities, type, this.Math.pow(scale, roundDifficulty), this.Const.Faction.Enemy);
		p.AfterDeploymentCallback = function ()
		{
			this.Tactical.getWeather().setAmbientLightingPreset(1);
			this.Tactical.getWeather().setAmbientLightingSaturation(1.1);
		};
		return p;
	}

	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onDetermineStartScreen()
	{
		this.World.Flags.set("LegendTournamentRound", 1);
		local candidate_veteran = [];

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			if (bro.getSkills().hasSkill("trait.arena_veteran"))
			{
				candidate_veteran.push(bro);
			}
		}

		return "C";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"veteran",
			this.m.Veteran != null ? this.m.Veteran.getNameOnly() : ""
		]);
	}

	function onClear()
	{
	}

});

