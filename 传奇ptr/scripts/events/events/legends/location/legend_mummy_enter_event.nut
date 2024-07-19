this.legend_mummy_enter_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.location.legend_mummy_enter";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "@@[img]gfx/ui/events/event_173.png[/img]{当沙子吞没你的脚时，你爬到了下一个沙丘的顶点，山顶让位给了更多相同的地方——山谷之间令人昏昏欲睡的山峰之间的沙子部分，偶尔会撒上柱子、坍塌的入口和人类和动物的骨骼。在更远的地方，你可以看到一个更为僵硬的结构的顶点，褪色的图案首先映入你的眼帘，在一个原本荒凉的风景中，有一点点色彩。\n\n 当你涉水越近，颜色就越鲜艳；蓝绿色、栗色和黄疸黄色都呈条纹状增减，似乎讲述了一个没有人能够改变的故事。空气很暖和，但陈腐的时间似乎对这个地方的影响与你目前看到的其他地方不同。 \n\n 入口和柱子周围的小罐子和米克尔，这个地方是掘墓人的闪光灯塔，但仍然保持原样和有序。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "那就给我们更多的宝藏!",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "让我们不要打扰这里的安宁。",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

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
			Text = "@@[img]gfx/ui/events/event_89.png[/img]{当你在主整体内缓慢踱步时，温度会急剧下降到更舒适的水平。遮荫使你的皮肤因外面的炎热而感到舒适。 \n\n 房间大部分是空白的，除了刻有文字的墙壁外，唯一的特色是不同质量的石棺——一些描绘了伟大的战斗，一个鞭打仆人的人物，还有一些参加了一种仪式，被武器或凿子故意破坏。其他的仍然是空白的——要么不够重要，不值得工匠花费更多的时间，要么只是未完成。 }",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "那是什么声音？",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "@@[img]gfx/ui/events/event_89.png[/img]{当你慢慢靠近时，你开始意识到手指已经沾污并拍打着石棺的内部外壳，一些棺材已经从内部打开，而其他棺材则需要外部的帮助。 \n\n 然而，它们都是空的。 \n\n 空气突然又开始感到温暖，这个房间里的空气比你想象的要多。一个男人的身影吸引了你的目光，当它从黑暗中缓慢前行时，它张开了嘴。 \n\n 言语无法表达，只有细流的沙子和皮肤。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "亡灵来了",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local p = this.Const.Tactical.CombatInfo.getClone();
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.CombatID = "Mastaba";
						p.TerrainTemplate = "tactical.sinkhole";
						p.LocationTemplate.Template[0] = "tactical.sunken_library";
						p.Music = this.Const.Music.UndeadTracks;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.LineBack;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Center;
						p.IsWithoutAmbience = true;
						p.Entities = [];

						for( local i = 0; i < 4; i = i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.LegendMummyHeavy);
							i = ++i;
							i = i;
						}

						for( local i = 0; i < 4; i = i )
						{
							p.Entities.push(clone this.Const.World.Spawn.Troops.LegendMummyPriest);
							i = ++i;
							i = i;
						}

						local f = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getID();

						for( local i = 0; i < p.Entities.len(); i = i )
						{
							p.Entities[i].Faction <- f;
							i = ++i;
							i = i;
						}

						p.BeforeDeploymentCallback = function ()
						{
							local light = 4;
							local light_tiles = [];

							do
							{
								local x = this.Math.rand(10, 28);
								local y = this.Math.rand(4, 28);
								local tile = this.Tactical.getTileSquare(x, y);

								if (!tile.IsEmpty)
								{
								}
								else
								{
									local skip = false;

									foreach( t in light_tiles )
									{
										if (t.getDistanceTo(tile) <= 5)
										{
											skip = true;
											break;
										}
									}

									if (skip)
									{
									}
									else
									{
										local e = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/legend_vampire_lord", tile.Coords);
										e.setFaction(f);
										e.assignRandomEquipment();
										light = --light;
										light = light;
										light_tiles.push(tile);
									}
								}
							}
							while (light > 0);

							local toRise = 3;

							do
							{
								local r = this.Math.rand(0, light_tiles.len() - 1);
								local p = light_tiles[r];

								if (p.SquareCoords.X > 14)
								{
									p.Level = 1;
									toRise = --toRise;
									toRise = toRise;
								}

								light_tiles.remove(r);
							}
							while (toRise > 0 && light_tiles.len() > 0);

							local queen = 1;

							do
							{
								local x = this.Math.rand(9, 10);
								local y = this.Math.rand(15, 17);
								local tile = this.Tactical.getTileSquare(x, y);

								if (!tile.IsEmpty)
								{
								}
								else
								{
									local e = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/legend_mummy_queen", tile.Coords);
									e.setFaction(f);
									e.assignRandomEquipment();
									queen = --queen;
									queen = queen;
								}
							}
							while (queen > 0);

							local treasureHunters = 4;

							do
							{
								local x = this.Math.rand(9, 11);
								local y = this.Math.rand(11, 21);
								local tile = this.Tactical.getTileSquare(x, y);

								if (!tile.IsEmpty)
								{
								}
								else
								{
									local e = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/legend_mummy_medium", tile.Coords);
									e.setFaction(f);
									e.assignRandomEquipment();
									treasureHunters = --treasureHunters;
									treasureHunters = treasureHunters;
								}
							}
							while (treasureHunters > 0);

							local medium = 12;

							do
							{
								local x = this.Math.rand(9, 14);
								local y = this.Math.rand(8, 20);
								local tile = this.Tactical.getTileSquare(x, y);

								if (!tile.IsEmpty)
								{
								}
								else
								{
									local e = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/legend_mummy_light", tile.Coords);
									e.setFaction(f);
									e.assignRandomEquipment();
									medium = --medium;
									medium = medium;
								}
							}
							while (medium > 0);

							local heavy = 4;

							do
							{
								local x = this.Math.rand(12, 14);
								local y = this.Math.rand(12, 26);
								local tile = this.Tactical.getTileSquare(x, y);

								if (!tile.IsEmpty)
								{
								}
								else
								{
									local e = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/legend_mummy_heavy", tile.Coords);
									e.setFaction(f);
									e.assignRandomEquipment();
									heavy = --heavy;
									heavy = heavy;
								}
							}
							while (heavy > 0);
						};
						p.AfterDeploymentCallback = function ()
						{
							this.Tactical.getWeather().setAmbientLightingPreset(5);
							this.Tactical.getWeather().setAmbientLightingSaturation(0.9);
						};
						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "Victory",
			Text = "@@[img]gfx/ui/events/event_89.png[/img]{远古亡灵女王在你面前化成灰烬，房间里除了沙子什么也没有留下。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "那是什么？",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";

				if (this.World.State.getLastLocation() != null)
				{
					this.World.State.getLastLocation().die();
				}

				this.World.Assets.getStash().makeEmptySlots(1);
				local item = this.new("scripts/items/weapons/legendary/legend_mage_swordstaff");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				this.World.Flags.set("IsMastabaDefeated", true);
			}

		});
		this.m.Screens.push({
			ID = "Defeat",
			Text = "@@[img]gfx/ui/events/event_173.png[/img]雇佣军再次冲向烈日。%SPEECH_ON%也许下次吧？%SPEECH_OFF%一个雇佣兵说。%randombrother%点头。%SPEECH_ON%下次吧，是的。也许离现在很远的时候，当我退休了，和其他人在一起的时候，你们都可以潜入黑暗中，和死去的巫师闲逛。这段时间对你们都有用吗？%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "也许有一天...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";

				if (this.World.State.getLastLocation() != null)
				{
					this.World.State.getLastLocation().setVisited(false);
				}
			}

		});
	}

	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

