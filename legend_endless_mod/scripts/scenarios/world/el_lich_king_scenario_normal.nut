this.el_lich_king_scenario_normal <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {
		OnInitOrigin = false,
		CanHire = false
	},
	function create()
	{
		this.m.ID = "scenario.el_lich_king_2normal";
		this.m.Name = "无尽-巫妖王(普通)";
		this.m.Description = "[p=c][img]gfx/ui/events/lich_king.png[/img][/p][p]异域的巫妖王穿越来到这个世界，尽管你对原本的装备做了幻形处理，但是那庞大的死亡与寒冷的气息缺无法掩盖，仍是人们眼中的异类，他们会下意识的疏远你\n\n[color=#bcad8c]独有机制:[/color] 拥有特殊的灵魂能量机制。\n[color=#bcad8c]专属装备:[/color] 获得一套不可替换的巫妖王装备。\n[color=#bcad8c]举世皆敌:[/color] 初始人数上限为1，初始声望为-500，声望获取速度为50%，招募费用与工资提升200%。\n[color=#bcad8c]化身:[/color] 如果你的巫妖王死了，战役就结束了。[/p]";
		this.m.Difficulty = 2;
		this.m.Order = -2;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(1);
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local bro = roster.create("scripts/entity/tactical/player");
		bro.m.HireTime = this.Time.getVirtualTimeF();
		bro.setStartValuesEx([
			"el_lich_king_background"
		], true, -1, true, 2);
		bro.getBackground().buildDescription(true);
		bro.setTitle("巫妖王");
		bro.setName("伯瓦尔 弗塔根");
		bro.m.BaseProperties.ActionPoints = 9;
		bro.m.BaseProperties.Hitpoints = 76;
		bro.m.BaseProperties.Bravery = 50;
		bro.m.BaseProperties.Stamina = 200;
		bro.m.BaseProperties.Initiative = 180;
		bro.m.BaseProperties.MeleeSkill = 70;
		bro.m.BaseProperties.RangedSkill = 70;
		bro.m.BaseProperties.MeleeDefense = 10;
		bro.m.BaseProperties.RangedDefense = 10;
		local talents = bro.getTalents();
		for (local i = 0; i < talents.len(); i++)
		{
			talents[i] = 4;
		}
		bro.setPlaceInFormation(4);
		bro.getFlags().set("IsPlayerCharacter", true);
		bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bro.getSkills().add(this.new("scripts/skills/traits/determined_trait"));
		bro.getSkills().add(this.new("scripts/skills/traits/deathwish_trait"));
		bro.getSkills().add(this.new("scripts/skills/traits/fearless_trait"));
		bro.getSkills().add(this.new("scripts/skills/el_traits/el_lichking_trait"));
		local accessory = this.new("scripts/items/el_accessory/el_taelia_present_item");
		accessory.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Normal, 0);
		bro.getItems().equip(accessory);
		local main_hand = this.new("scripts/items/el_weapon/el_frostmourne");
		main_hand.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Normal, 0);
		bro.getItems().equip(main_hand);
		local body = this.new("scripts/items/el_armor/el_ice_armor");
		body.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Normal, 0);
		bro.getItems().equip(body);
		local head = this.new("scripts/items/el_helmet/el_crown_of_rule");
		head.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Normal, 0);
		bro.getItems().equip(head);
		this.World.Assets.m.BusinessReputation = -500;
		this.World.Assets.m.Money = 1000;
		this.World.Assets.m.ArmorParts = 10;
		this.World.Assets.m.Medicine = 10;
		this.World.Assets.m.Ammo = 10;
		this.World.Assets.EL_setSoulEnergy(5);
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() == 1)
			{
				break;
			}

			i = ++i;
			i = i;
		}

		local randomVillageTile = randomVillage.getTile();
		this.World.Flags.set("HomeVillage", randomVillage.getName());
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;
		local f = randomVillage.getFactionOfType(this.Const.FactionType.NobleHouse);
		f.addPlayerRelation(-200.0, "You know too much");

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else if (tile.Type != this.Const.World.TerrainType.Plains && tile.Type != this.Const.World.TerrainType.Steppe && tile.Type != this.Const.World.TerrainType.Tundra && tile.Type != this.Const.World.TerrainType.Snow)
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

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(112);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		randomVillage.getFactionOfType(this.Const.FactionType.Settlement).addPlayerRelation(40.0, "Considered local heroes for keeping the village safe");
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/retirement_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.el_lich_king_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BusinessReputationRate = 0.5;
	}

	function onUpdateHiringRoster( _roster )
	{
		local bros = _roster.getAll();
		foreach( i, bro in bros )
		{
			bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 3);
			bro.getBaseProperties().DailyWageMult *= 3;
		}
	}

	// function onHiredByScenario( bro )
	// {
	// 	bro.getSkills().add(this.new("scripts/skills/el_effects/el_become_undead_effect"));
	// }

	function onActorKilled( _actor, _killer, _combatID )
	{
		local lich_king = null;
        local targets = this.Tactical.Entities.getAllInstances();
        foreach( tar in targets )
        {
            foreach( t in tar )
            {
                if (t == null || t.getID() == _actor.getID() || t.isDying() || !t.isAlive())
                {
                    continue;
                }

                local items = t.getItems();
                local main_hand = items == null ? null : items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
                if (main_hand != null && main_hand.getID() == "el_weapon.frostmourne" && _actor.getTile().getDistanceTo(t.getTile()) <= main_hand.EL_getAffectRange())
                {
                    lich_king = t;
                }
            }
        }
		if(lich_king == null || _actor.isAlliedWith(lich_king))
		{
			return;
		}
		local num = this.Const.EL_LichKing.EntityDropNum.BaseNum * (1 + _actor.EL_getLevel() * this.Const.EL_LichKing.EntityDropNum.LevelFactor) * this.Const.EL_LichKing.EntityDropNum.RankFactor[_actor.EL_getRankLevel()];
		this.World.Assets.EL_addSoulEnergy(num);
	}
});