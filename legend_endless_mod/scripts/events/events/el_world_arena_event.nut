this.el_world_arena_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
    {
        this.logInfo("Creating tournament event");
        this.m.ID = "event.location.el_world_arena";
        this.m.Title = "世界竞技场";
        this.m.Cooldown = 100;
        this.m.IsSpecial = true;

        local fight_screen = {
            ID = "fight_screen",
            Text = "[img]gfx/ui/events/legend_tournament.png[/img]欢迎来到世界竞技场，在这里你会挑战来自世界各地甚至世界之外的的各种强者，请选择你的对手，要么胜利要么死亡！",
            Image = "",
            List = [],
            Characters = [],
            Options = [],
            function start( _event )
            {
            }
        }

        fight_screen.Options.push({
            Text = "我准备好了！",
            function getResult( _event )
            {
                _event.registerToShowAfterCombat("win_screen", "lose_screen");

                local min_level = 0;

                if(!this.World.Flags.has("EL_WorldArenaNorthHuman"))
                {
                    this.World.Flags.set("EL_WorldArenaNorthHuman", 0);
                }
                local north_human_level = this.World.Flags.get("EL_WorldArenaNorthHuman");
                min_level = north_human_level;

                if(!this.World.Flags.has("EL_WorldArenaOrc"))
                {
                    this.World.Flags.set("EL_WorldArenaOrc", 0);
                }
                local orc_level = this.World.Flags.get("EL_WorldArenaOrc");
                min_level = min_level < orc_level ? min_level : orc_level;

                if(!this.World.Flags.has("EL_WorldArenaGoblin"))
                {
                    this.World.Flags.set("EL_WorldArenaGoblin", 0);
                }
                local goblin_level = this.World.Flags.get("EL_WorldArenaGoblin");
                min_level = min_level < goblin_level ? min_level : goblin_level;

                if(!this.World.Flags.has("EL_WorldArenaZombie"))
                {
                    this.World.Flags.set("EL_WorldArenaZombie", 0);
                }
                local zombie_level = this.World.Flags.get("EL_WorldArenaZombie");
                min_level = min_level < zombie_level ? min_level : zombie_level;

                if(!this.World.Flags.has("EL_WorldArenaBarbarion"))
                {
                    this.World.Flags.set("EL_WorldArenaBarbarion", 0);
                }
                local barbarion_level = this.World.Flags.get("EL_WorldArenaBarbarion");
                min_level = min_level < barbarion_level ? min_level : barbarion_level;

                if(!this.World.Flags.has("EL_WorldArenaVampire"))
                {
                    this.World.Flags.set("EL_WorldArenaVampire", 0);
                }
                local vampire_level = this.World.Flags.get("EL_WorldArenaVampire");
                min_level = min_level < vampire_level ? min_level : vampire_level;

                if(!this.World.Flags.has("EL_WorldArenaSkeleton"))
                {
                    this.World.Flags.set("EL_WorldArenaSkeleton", 0);
                }
                local skeleton_level = this.World.Flags.get("EL_WorldArenaSkeleton");
                min_level = min_level < skeleton_level ? min_level : skeleton_level;

                if(!this.World.Flags.has("EL_WorldArenaSouthHuman"))
                {
                    this.World.Flags.set("EL_WorldArenaSouthHuman", 0);
                }
                local south_human_level = this.World.Flags.get("EL_WorldArenaSouthHuman");
                min_level = min_level < south_human_level ? min_level : south_human_level;

                if(!this.World.Flags.has("EL_WorldArenaMummy"))
                {
                    this.World.Flags.set("EL_WorldArenaMummy", 0);
                }
                local mummy_level = this.World.Flags.get("EL_WorldArenaMummy");
                min_level = min_level < mummy_level ? min_level : mummy_level;

                if(!this.World.Flags.has("EL_WorldArenaWitch"))
                {
                    this.World.Flags.set("EL_WorldArenaWitch", 0);
                }
                local witch_level = this.World.Flags.get("EL_WorldArenaWitch");
                min_level = min_level < witch_level ? min_level : witch_level;

                this.World.Flags.set("EL_WorldArenaMinLevel", min_level);
                local fight_enemy = [];

                if(north_human_level == min_level) {
                    fight_enemy.push({
                        level = north_human_level,
                        team = "EL_WorldArenaNorthHuman",
                        func = _event.el_generateNorthHumanParty
                    });
                }
                if(orc_level == min_level) {
                    fight_enemy.push({
                        level = orc_level,
                        team = "EL_WorldArenaOrc",
                        func = _event.el_generateOrcParty
                    });
                }
                if(goblin_level == min_level) {
                    fight_enemy.push({
                        level = goblin_level,
                        team = "EL_WorldArenaGoblin",
                        func = _event.el_generateGoblinParty
                    });
                }
                if(zombie_level == min_level) {
                    fight_enemy.push({
                        level = zombie_level,
                        team = "EL_WorldArenaZombie",
                        func = _event.el_generateZombieParty
                    });
                }
                if(barbarion_level == min_level) {
                    fight_enemy.push({
                        level = barbarion_level,
                        team = "EL_WorldArenaBarbarion",
                        func = _event.el_generateBarbarionParty
                    });
                }
                if(vampire_level == min_level) {
                    fight_enemy.push({
                        level = vampire_level,
                        team = "EL_WorldArenaVampire",
                        func = _event.el_generateVampireParty
                    });
                }
                if(skeleton_level == min_level) {
                    fight_enemy.push({
                        level = skeleton_level,
                        team = "EL_WorldArenaSkeleton",
                        func = _event.el_generateSkeletonParty
                    });
                }
                if(south_human_level == min_level) {
                    fight_enemy.push({
                        level = south_human_level,
                        team = "EL_WorldArenaSouthHuman",
                        func = _event.el_generateSouthHumanParty
                    });
                }
                if(mummy_level == min_level) {
                    fight_enemy.push({
                        level = mummy_level,
                        team = "EL_WorldArenaMummy",
                        func = _event.el_generateMummyParty
                    });
                }
                if(witch_level == min_level) {
                    fight_enemy.push({
                        level = witch_level,
                        team = "EL_WorldArenaWitch",
                        func = _event.el_generateWitchParty
                    });
                }
                local r = this.Math.rand(0, fight_enemy.len() - 1);
                this.World.Flags.set("EL_WorldArenaTeam", fight_enemy[r].team);

                local p = this.Const.Tactical.CombatInfo.getClone();
                p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
                p.TerrainTemplate = "tactical.arena";
                p.LocationTemplate.Template[0] = "tactical.arena_floor";
                p.CombatID = "Legend Tournament";
                p.Music = this.Const.Music.ArenaTracks;
                p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
                p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
                p.IsUsingSetPlayers = true;
                p.IsFleeingProhibited = true;
                p.IsLootingProhibited = false;
                p.IsWithoutAmbience = true;
                p.IsFogOfWarVisible = false;
                p.IsArenaMode = true;
                p.IsAutoAssigningBases = false;
                p.Players = [];
                p.Entities = [];

                local roster = this.World.getPlayerRoster().getAll();

                foreach( bro in roster )
                {
                    if (bro.isInReserves() == false)
                    {
                        p.Players.push(bro);
                    }
                }

                local party = this.new("scripts/entity/world/party");
                local level = fight_enemy[r].level;
                party.EL_setFaction(this.World.FactionManager.getFactionOfType(this.Const.FactionType.Arena).getID());
                party.EL_tempPartyInit();
                party.EL_setTroopsResourse(0);
                party.EL_setHaveRandomLeader(false);
                party.EL_setHaveStrongestLeader(false);
                party.EL_setIsEliteParty(false);
                party.EL_setIsBossParty(false);
                p.Parties.push(party);

                fight_enemy[r].func(party, level);

                _event.el_strengthenUnitByLevel(party, level);

                foreach(troop in party.getTroops()) {
                    p.Entities.push(troop);
                }

                this.World.State.startScriptedCombat(p, false, false, false);
                //_event.el_generateNorthHumanParty();
                return 0;
            }
        });

        fight_screen.Options.push({
            Text = "我没准备好，下次再来。",
            function getResult( _event )
            {
                return 0;
            }
        });

        local win_screen = {
            ID = "win_screen",
            Text = "[img]gfx/ui/events/legend_tournament.png[/img]你胜利了！为我们的冠军欢呼！",
            Image = "",
            List = [],
            Characters = [],
            Options = [{
                Text = "胜利万岁！",
                function getResult( _event )
                {
                    return 0;
                }
            }],
            function start( _event )
            {
                local team = this.World.Flags.get("EL_WorldArenaTeam");
                local level = this.World.Flags.get(team);
                this.World.Flags.set(team, level + 1);

                if(level == 0) {
                    if(team == "EL_WorldArenaNorthHuman") {
                        local reward_item = this.new("scripts/items/el_weapon/el_human_emperors_sword");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaOrc") {
                        local reward_item = this.new("scripts/items/el_weapon/el_orc_berserker_axe");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaGoblin") {
                        local reward_item = this.new("scripts/items/el_weapon/el_goblin_tuchun_crossbow");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaZombie") {
                        local reward_item = this.new("scripts/items/el_weapon/el_undead_dagger");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaBarbarion") {
                        local reward_item = this.new("scripts/items/el_weapon/el_barbarians_chosen_mace");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaVampire") {
                        local reward_item = this.new("scripts/items/el_weapon/el_vampire_cleaver");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    //TODO(Johnasd4): change the reward item.
                    if(team == "EL_WorldArenaSkeleton") {
                        local reward_item = this.new("scripts/items/el_weapon/el_bone_spear");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaSouthHuman") {
                        local reward_item = this.new("scripts/items/el_weapon/el_skyfire_cannon");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaMummy") {
                        local reward_item = this.new("scripts/items/el_weapon/el_mummy_curse_cleaver");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                    if(team == "EL_WorldArenaWitch") {
                        local reward_item = this.new("scripts/items/el_weapon/el_hexe_staff");
                        this.World.Assets.getStash().makeEmptySlots(1);
                        this.World.Assets.getStash().add(reward_item);
                        this.List.push({
                            id = 16,
                            text = "你获得了 " + reward_item.getName()
                        });
                    }
                }
                local xp_level = this.Math.max(1, this.Math.min(this.World.Assets.m.EL_WorldLevel, this.Const.LevelXP.len() - 1));
                local core_xp = this.Math.floor(0.25 * (this.Const.LevelXP[xp_level] - this.Const.LevelXP[xp_level - 1]) * this.World.Assets.EL_getHalfWorldDifficultFactor());
                for(local i = 0; i < level * 3 + 3; ++i)
                {
                    local reward_item = this.new("scripts/items/el_misc/el_core_rank_4_item");
                    reward_item.EL_generateCoreXPByActorXP(core_xp);
                    this.World.Assets.getStash().makeEmptySlots(1);
                    this.World.Assets.getStash().add(reward_item);
                }
                this.List.push({
                    id = 16,
                    text = "你获得了 传奇魔核 * " + (level * 3 + 3)
                });

                this.World.Assets.EL_addEquipmentEssence(4, 3 * level + 3);
                this.List.push({
                    id = 16,
                    text = "你获得了 传奇精华 * " + (level * 3)
                });
                local reward_money = this.Math.floor(100000 * (level + 1) * this.World.Assets.EL_getHalfWorldDifficultFactor() * (1 + 0.08 * this.World.Assets.m.EL_WorldLevel));
                this.World.Assets.addMoney(reward_money);
                this.List.push({
                    id = 16,
                    text = "你获得了 克朗 * " + reward_money
                });
            }
        }

        local lose_screen = {
            ID = "lose_screen",
            Text = "[img]gfx/ui/events/legend_tournament.png[/img]你输了！带着你活着的人离开，这里不欢迎弱者！",
            Image = "",
            List = [],
            Characters = [],
            Options = [{
                Text = "好。。。",
                function getResult( _event )
                {
                    return 0;
                }
            }],
            function start( _event )
            {
            }
        }

        this.m.Screens.push(fight_screen);
        this.m.Screens.push(win_screen);
        this.m.Screens.push(lose_screen);

    }

	function onUpdateScore()
	{
		this.m.Score = 0;
	}

	function onPrepare()
	{
	}

    function el_strengthenUnitByLevel( _party, _level ) {
        foreach(troop in _party.getTroops()) {
            troop.EL_IsBossUnit = false;
            troop.EL_ExtraBuffNum[troop.EL_RankLevel] += 2;
        }
        for(local i = 0; i < _level; ++i) {
            foreach(troop in _party.getTroops()) {
                troop.EL_ExtraCombatLevel += 2;
                troop.EL_ExtraBuffNum[troop.EL_RankLevel] += 2;
            }
        }
    }

    function el_generateNorthHumanParty( _party, _level ) {
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Swordmaster
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.MasterArcher
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 15; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.HedgeKnight
            }, false, 0, i < 3 ? 3 : 1);
        }
    }

    function el_generateOrcParty( _party, _level ) {
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth
            }, false, 0, i < 5 ? 3 : 1);
        }
        for( local i = 0; i < 20; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendOrcElite
            }, false, 0, i < 0 ? 3 : 1);
        }
    }

    function el_generateGoblinParty( _party, _level ) {
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.GoblinShaman
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.GoblinOverseer
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.GoblinAmbusher
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.GoblinSkirmisher
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.GoblinWolfrider
            }, false, 0, i < 1 ? 3 : 1);
        }
    }

    function el_generateZombieParty( _party, _level ) {
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.ZombieBoss
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Ghost
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Necromancer
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendBanshee
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendDemonHound
            }, false, 0, i < 0 ? 3 : 1);
        }
        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.ZombieBodyguard
            }, false, 0, i < 0 ? 3 : 1);
        }
        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.ZombieKnight
            }, false, 0, i < 1 ? 3 : 1);
        }
    }

    function el_generateBarbarionParty( _party, _level ) {
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.BarbarianDrummer
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster
            }, false, 0, i < 0 ? 3 : 1);
        }
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.BarbarianChosen
            }, false, 0, i < 3 ? 3 : 1);
        }
        for( local i = 0; i < 8; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.BarbarianChampion
            }, false, 0, i < 0 ? 3 : 1);
        }
    }

    function el_generateVampireParty( _party, _level ) {
        for( local i = 0; i < 25; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendVampireLord
            }, false, 0, i < 5 ? 3 : 1);
        }
    }

    function el_generateSkeletonParty( _party, _level ) {
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.SkeletonBoss
            }, false, 0, i < 3 ? 3 : 1);
        }
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.SkeletonPriest
            }, false, 0, i < 2 ? 3 : 1);
        }
        for( local i = 0; i < 8; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.SkeletonHeavyBodyguard
            }, false, 0, i < 0 ? 3 : 1);
        }
        for( local i = 0; i < 10; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.SkeletonHeavy
            }, false, 0, i < 0 ? 3 : 1);
        }
    }
    //TODO(Johnasd4): change the party.
    function el_generateSouthHumanParty( _party, _level ) {
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Assassin
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Gladiator
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 4; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Executioner
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Gunner
            }, false, 0, i < 1 ? 3 : 1);
        }

        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.Officer
            }, false, 0, i < 1 ? 3 : 1);
        }
    }

    function el_generateMummyParty( _party, _level ) {
        for( local i = 0; i < 5; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendMummyPriest
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendMummyQueen
            }, false, 0, i < 3 ? 3 : 1);
        }
        for( local i = 0; i < 15; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendMummyHeavy
            }, false, 0, i < 1 ? 3 : 1);
        }
    }

    function el_generateWitchParty( _party, _level ) {
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendHexeLeader
            }, false, 0, i < 3 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendRockUnhold
            }, false, 0, i < 0 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendStollwurm
            }, false, 0, i < 0 ? 3 : 1);
        }
        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendRedbackSpider
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 6; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf
            }, false, 0, i < 1 ? 3 : 1);
        }
        for( local i = 0; i < 3; ++i )
        {
            this.Const.World.Common.addTroop(_party, {
                Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat
            }, false, 0, i < 0 ? 3 : 1);
        }
    }

	function onDetermineStartScreen()
	{
		return "fight_screen";
	}

});

