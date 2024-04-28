this.el_magic_thief_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.el_magic_thief";
		this.m.Name = "无尽-窃法者";
		this.m.Description = "[p=c][img]gfx/ui/events/event_80.png[/img][/p][p]窃法者非常渴望力量，会不择手段的获取力量，通过对尸体的提炼，得到装有尸体生前力量的石头，因此遭到人们的厌恶。\n\n[color=#bcad8c]随机背景:[/color] 每个开局人物都不同。\n[color=#bcad8c]随机装备:[/color] 每个开局装备都不同。\n[color=#bcad8c]窃法者专属:[/color] 击杀敌方单位时会获得装有NPCBuff的技能石，技能石最多拥有3个技能，如果目标身上不止3个技能则随机选择3个，通过使用技能石获取NPCBuff（每次使用会清除之前的NPCBuff）。\n[color=#bcad8c]难以信任:[/color] 声望获取速度为50%。[/p]";
		this.m.Difficulty = 1;
		this.m.Order = -4;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();

		for( local i = 0; i < 3; i = i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.setStartValuesEx(this.Const.CharacterBackgroundsRandom);
			bro.getSkills().add(this.new("scripts/skills/el_racials/el_magic_thief_racial"));
			i = ++i;
		}

		local bros = roster.getAll();
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/beer_item"));
	}

	function onSpawnPlayer()
	{
		local randomVillage;
		local northernmostY = 0;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			local v = this.World.EntityManager.getSettlements()[i];

			if (v.getTile().SquareCoords.Y > northernmostY && !v.isMilitary() && !v.isIsolatedFromRoads() && v.getSize() <= 2)
			{
				northernmostY = v.getTile().SquareCoords.Y;
				randomVillage = v;
			}

			i = ++i;
		}

		randomVillage.setLastSpawnTimeToNow();
		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 2), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 2));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 2), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 2));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		local attachedLocations = randomVillage.getAttachedLocations();
		local closest;
		local dist = 99999;

		foreach( a in attachedLocations )
		{
			if (a.getTile().getDistanceTo(randomVillageTile) < dist)
			{
				dist = a.getTile().getDistanceTo(randomVillageTile);
				closest = a;
			}
		}

		if (closest != null)
		{
			closest.setActive(false);
			closest.spawnFireAndSmoke();
		}

		local s = this.new("scripts/entity/world/settlements/situations/raided_situation");
		s.setValidForDays(5);
		randomVillage.addSituation(s);
		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/civilians_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_random_3_scenario_intro");
		}, null);
	}

	function onHiredByScenario( bro )
	{
		bro.getSkills().add(this.new("scripts/skills/el_racials/el_magic_thief_racial"));
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BusinessReputationRate = 0.5;
	}

});

