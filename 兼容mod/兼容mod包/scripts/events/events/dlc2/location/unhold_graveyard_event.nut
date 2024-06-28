this.unhold_graveyard_event <- this.inherit("scripts/events/event", {
	m = {
	Champion = null
	},
	function create()
	{
		this.m.ID = "event.location.unhold_graveyard";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 0.0 * this.World.getTime().SecondsPerDay;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "@@[img]gfx/ui/events/event_117.png[/img]{从远处看，这片未掩埋的墓地看起来像一个危险的地方，倾斜着。你无法清楚地验证这些骨头属于什么——当然，巨大的骨头是未折叠的，但巨大而中空的骨头是什么？那是被刺穿的人类头骨吗？你拿起它，惊恐地发现它更新鲜了，你甚至可以在上面发现一些可疑的深红色残留物。\n 显然，当一个尖锐的物体穿透他的整个脸时，头骨的主人就死了。在它附近有一条脚印的痕迹，直接通向墓地的骨骼采集中心。它们看起来像人类的足迹，至少看起来是这样。好吧，一定要有人知道。}",
            Image = "",
			List = [],
			Characters = [],
			Options = [

			],
			function start( _event )
			{
			_event.m.Title = "As you approach...";
				local raw_roster = this.World.getPlayerRoster().getAll();
				local roster = [];

				foreach( bro in raw_roster )
				{
					if (bro.getPlaceInFormation() <= 17)
					{
						roster.push(bro);
					}
				}

				roster.sort(function ( _a, _b )
				{
					if (_a.getXP() > _b.getXP())
					{
						return -1;
					}
					else if (_a.getXP() < _b.getXP())
					{
						return 1;
					}

					return 0;
				});
				local e = this.Math.min(4, roster.len());

				for( local i = 0; i < e; i = ++i )
				{
					local bro = roster[i];
					this.Options.push({
						Text = "我需要你跟踪这些脚印， " + bro.getName() + ".",
						function getResult( _event )
						{
							_event.m.Champion = bro;
							return "B";
						}

					});
					  // [057]  OP_CLOSE          0      6    0    0
				}

				this.Options.push({
					Text = "我们应该离开这个地方。",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						return 0;
					}

				});

			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "@@[img]gfx/ui/events/event_73.png[/img]{%chosen%在骨骼层中艰难行走以跟随轨迹。当接近墓地中心时，视野突然变宽，可以清楚地看到一个站着的人影。 \n %chosen%小心翼翼地走近他，但什么也没发生：他仍然像雕像一样站在那里。也许他真的是一尊雕像？就在这时，雕像突然转过身来——他是一个古老的不死生物！你在营地里见过许多骷髅，但他手上华丽的长矛是你从未见过的那种。亡灵以亡灵难以企及的速度冲向%selected%，他必须战斗以保护自己！}",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "",
					function getResult( _event )
					{
						if (this.World.State.getLastLocation() != null)
						{
							this.World.State.getLastLocation().setVisited(false);
						}

						local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						properties.Music = this.Const.Music.BeastsTracks;
						local party = this.new("scripts/entity/world/party");
						party.EL_setFaction(this.Const.Faction.Enemy);
                        party.EL_tempPartyInit();
						properties.Parties.push(party);
						party.EL_setTroopsResourse(0);
                        this.Const.World.Common.addTroop(party, {
                            Type = this.Const.World.Spawn.Troops.SkeletonCenturion
                        }, false);
						foreach(troop in party.getTroops()) {
							properties.Entities.push(troop);
						}
						properties.Players.push(_event.m.Champion);
						properties.IsUsingSetPlayers = true;
						properties.IsFleeingProhibited = true;
						properties.IsAttackingLocation = true;
						properties.BeforeDeploymentCallback = function ()
						{
							local size = this.Tactical.getMapSize();

							for( local x = 0; x < size.X; x = ++x )
							{
								for( local y = 0; y < size.Y; y = ++y )
								{
									local tile = this.Tactical.getTileSquare(x, y);
									tile.Level = this.Math.min(1, tile.Level);
								}
							}
						};
						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(properties, false, false, false);
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "As you approach...";
				this.Options[0].Text = "为你的生命而战！";
				this.Characters.push(_event.m.Champion.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "Victory",
			Text = "@@[img]gfx/ui/events/event_117.png[/img]{就像你遇到的其他亡灵一样，%chosen%将他粉碎-这次他不会再站起来了。他拿起那支华丽的长矛。多年后，它仍然没有失去光泽，看起来像刚做的一样新鲜、蓬松。这一定是丢失了几个世纪的杰作。}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "我们会好好利用它。",
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
					this.World.State.getLastLocation().setVisited(true);
				}

				this.Characters.push(_event.m.Champion.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "Defeat",
			Text = "@@[img]gfx/ui/events/event_117.png[/img]{%chosen%是一个真正有经验的战士，亡灵也是如此，但不同的是，无论战斗多么激烈，骷髅都不会筋疲力尽。你看，%selected%被击落，然后长矛直接刺穿了他的头骨。古代武士举起尸体，看起来像在庆祝。你现在要做什么？}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				_event.m.Title = "After the battle...";

				if (this.World.State.getLastLocation() != null)
				{
					this.World.State.getLastLocation().setVisited(false);
				}

				local roster = this.World.getPlayerRoster().getAll();
				roster.sort(function ( _a, _b )
				{
					if (_a.getXP() > _b.getXP())
					{
						return -1;
					}
					else if (_a.getXP() < _b.getXP())
					{
						return 1;
					}

					return 0;
				});
				local e = this.Math.min(4, roster.len());

				for( local i = 0; i < e; i = ++i )
				{
					local bro = roster[i];
					this.Options.push({
						Text = "我需要你进去, " + bro.getName() + ".",
						function getResult( _event )
						{
							_event.m.Champion = bro;
							return "B";
						}

					});
					  // [057]  OP_CLOSE          0      5    0    0
				}

				this.Options.push({
					Text = "这不值得。我们应该离开这个地方。",
					function getResult( _event )
					{
						return 0;
					}

				});
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
		_vars.push([
			"chosen",
			this.m.Champion != null ? this.m.Champion.getName() : ""
		]);
	}


	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
	}

});

