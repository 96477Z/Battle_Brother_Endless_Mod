this.ptr_swordmaster_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.ptr_swordmaster";
		this.m.Name = "Old Swordmaster (PTR)";
		this.m.Description = "[p=c][img]gfx/ui/events/event_17.png[/img][/p][p]You are a legendary swordmaster, eager to pass on your skills to others! [color=" + this.Const.UI.Color.NegativeValue + "]Read the text in the intro event for details on how this origin works![/color]\n\n[color=#bcad8c]Teacher:[/color] Upon leveling up, every recruit has a 50% chance to gain a free perk from the Sword perk group. Cannot have more than 10 recruits. Passing a total of 25 days without at least 2 other recruits will end the campaign.\n[color=#bcad8c]Swords Only:[/color] Recruits gain special bonuses when using swords. If anyone uses any weapon except swords, banner or ranged weapons in combat it will anger your entire company.\n[color=#bcad8c]Reputation:[/color] Squires and Apprentices have a lower upkeep and hiring cost. Retired Soldiers and Swordmasters cannot be hired.\n[color=#bcad8c]Avatar:[/color] If your swordmaster dies, the campaign ends.[/p]";
		this.m.Difficulty = 1;
		this.m.Order = 70;
		this.m.IsFixedLook = true;		
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(3);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(15);
		this.m.RosterTierMaxCombat = this.Const.Roster.getTierForSize(10);
		this.m.StartingBusinessReputation = 1100;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local bro;
		bro = roster.create("scripts/entity/tactical/player");
		bro.setStartValuesEx([
			"ptr_swordmaster_commander_background"
		]); //skills on start
		bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));

		bro.getFlags().set("PTRSwordmasterPerksUnlimited", true);

		local skills = [
			"scripts/skills/perks/perk_ptr_swordmaster_blade_dancer",
			"scripts/skills/perks/perk_ptr_swordmaster_metzger",
			"scripts/skills/perks/perk_ptr_swordmaster_precise",
			"scripts/skills/perks/perk_ptr_swordmaster_versatile_swordsman",
			"scripts/skills/perks/perk_ptr_swordmaster_juggernaut",
			"scripts/skills/perks/perk_ptr_swordmaster_grappler",
			"scripts/skills/perks/perk_ptr_swordmaster_reaper",

			"scripts/skills/perks/perk_ptr_versatile_weapon",
			"scripts/skills/perks/perk_ptr_exploit_opening",
			"scripts/skills/perks/perk_ptr_fluid_weapon",
			"scripts/skills/perks/perk_mastery_sword",
			"scripts/skills/perks/perk_ptr_tempo",
			"scripts/skills/perks/perk_ptr_kata",
			"scripts/skills/perks/perk_ptr_en_garde",

			"scripts/skills/perks/perk_bf_fencer",
			"scripts/skills/perks/perk_duelist"
			"scripts/skills/perks/perk_reach_advantage",
			"scripts/skills/perks/perk_shield_expert",
			"scripts/skills/perks/perk_ptr_bloody_harvest",
			"scripts/skills/perks/perk_ptr_weapon_master"
		]

		foreach (skill in skills)
		{
			bro.getSkills().add(this.new(skill));
		}

		foreach (row in bro.getBackground().getPerkTree())
		{
			foreach (perk in row)
			{
				if (skills.find(perk.Script) != null) perk.IsRefundable = false;
			}
		}

		bro.m.PerkPointsSpent += 20;

		bro.setPlaceInFormation(4);
		bro.setVeteranPerks(2);
		bro.getFlags().set("IsPlayerCharacter", true);

 		//bro.getSprite("socket").setBrush("bust_base_crusader"); //custom base
 		//bro.getSprite("socket").setBrush("bust_base_wildmen_01");
		bro.getSprite("miniboss").setBrush("bust_miniboss");
		bro.m.HireTime = this.Time.getVirtualTimeF();
		this.World.Assets.addMoralReputation(20);
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Assets.m.Ammo = 0;

		this.World.Assets.getStash().add(this.new("scripts/items/supplies/cured_venison_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/fencing_sword"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_estoc"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/arming_sword"));
		this.World.Assets.getStash().add(this.new("scripts/items/weapons/arming_sword"));

		bro.getSkills().add(this.new("scripts/skills/effects/ptr_swordmaster_scenario_avatar_effect"));
		bro.getSkills().add(this.new("scripts/skills/traits/old_trait"));
	}

	function onSpawnPlayer() //spawn location
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 1), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 1));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 1), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 1));

			if (this.World.isValidTileSquare(x, y))
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type != this.Const.World.TerrainType.Ocean && tile.Type != this.Const.World.TerrainType.Shore && tile.getDistanceTo(randomVillageTile) != 0 && tile.HasRoad)
				{
					randomVillageTile = tile;
					break;
				}				
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.State.m.Player.getSprite("body").setBrush("ptr_player_swordmaster");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/retirement_02.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.ptr_swordmaster_scenario_intro");
		}, null);
	}

	function onCombatFinished() //is avatar killed?
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}

	function onHiredByScenario( bro )
	{		
		local effect = this.new("scripts/skills/effects/ptr_swordmaster_scenario_recruit_effect");
		effect.m.FreePerks.push(this.Const.Perks.PerkDefs.PTRVersatileWeapon);
		bro.getSkills().add(effect);

		if (bro.getBackground().hasPerk(::Const.Perks.PerkDefs.SpecSword))
		{
			local masteryRow = bro.getBackground().getPerkTree()[3];
			for (local i = masteryRow.len() - 1; i >= 0; i--)
			{
				local id = masteryRow[i].ID;
				switch (id)
				{
					case "perk.mastery.sword":
					case "perk.mastery.bow":
					case "perk.mastery.crossbow":
					case "perk.mastery.throwing":
					case "perk.legend_mastery_slings":
						break;

					default:
						if (id.find("mastery") != null)
						{
							bro.getBackground().removePerk(::Const.Perks.PerkDefs[masteryRow[i].Const]);
						}
				}
			}

			foreach (perk in ::Const.Perks.SwordmasterProfessionTree.Tree[3])
			{
				bro.getBackground().addPerk(perk, 3);
			}
		}
	}

	function onUpdateHiringRoster( _roster )
	{	
		local garbage = [];
		local bros = _roster.getAll();

		foreach( bro in bros )
		{
			if (bro.getBackground().getID() == "background.squire" || bro.getBackground().getID() == "background.apprentice")
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.5);
				bro.getBaseProperties().DailyWageMult *= 0.5;
				bro.getSkills().update();
			}

			if (bro.getBackground().getID().find("swordmaster") != null || bro.getBackground().getID().find("retired") != null)
            {
                garbage.push(bro);
            }
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onBuildPerkTree( _background )
	{
		this.addScenarioPerk(_background, this.Const.Perks.PerkDefs.PTRVersatileWeapon);
	}
});

