local gt = getroottable();

::mods_registerMod("el_adaption_scenarios_world", 1, "el_adaption_scenarios_world");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("scenarios/world/anatomists_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 3; i = ++i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "anatomist_background"
            ]);
            bros[0].getBackground().m.RawDescription = "{Captain? Is it alright if I call you captain? Ah, of course it is. What? No, we were not calling you by another name. Yers is a smooth costard, good sir, and we would not be of such derring-do to refer to you as a sellsword who is as ordinary as any of our coetaneous clodpolls, or state that we were in some sense importuning commerce by conducting business with a man of your particular skills. No sir, we would not. We are not children of perdition, sir.}";
            bros[0].setPlaceInFormation(3);
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.equip(this.new("scripts/items/helmets/undertaker_hat"));
            items.equip(this.new("scripts/items/armor/undertaker_apron"));
            bros[1].setStartValuesEx([
                "anatomist_background"
            ]);
            bros[1].getBackground().m.RawDescription = "{Despite others\' hesitancies, I\'ve no qualms calling you a javel, sir. You are, after all, a javel. A scapegrace. Some sellsword or another, yes? I think only a man who trucks cowardice would avoid calling you what you are. That someone disrespects your intelligence, thinking you yourself know not yourself. Even I see that in you accepting who you are, you are quite a good specimen. I mean, sellsword.}";
            bros[1].setPlaceInFormation(4);
            items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.equip(this.new("scripts/items/helmets/physician_mask"));
            items.equip(this.new("scripts/items/armor/wanderers_coat"));
            items.equip(this.new("scripts/items/weapons/dagger"));
            bros[2].setStartValuesEx([
                "anatomist_background"
            ]);
            bros[2].getBackground().m.RawDescription = "{Though our quotidian dialogues are no doubt drollery, beneath the banausic surface I must admit I feel a touch of serotinous savagery lurking within you, coming to the fore as if my words be fire. Even our most desultory talks has me on edge, the way you stare at me with such hateful eyes. Well, know this, bounty hunter, I am no casuist, I speak in earnest. You are too fine a specimen-I mean captain to be lofting some sapskull\'s brickbats at. Understand?}";
            bros[2].setPlaceInFormation(5);
            items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.equip(this.new("scripts/items/helmets/masked_kettle_helmet"));
            items.equip(this.new("scripts/items/armor/reinforced_leather_tunic"));
            items.equip(this.new("scripts/items/weapons/militia_spear"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_beasts_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_greenskins_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_undead_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_legendary_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/apotheosis_potion_item"));
            this.World.Statistics.getFlags().set("isNecromancerPotionAcquired", false);
            this.World.Statistics.getFlags().set("isWiedergangerPotionAcquired", false);
            this.World.Statistics.getFlags().set("isFallenHeroPotionAcquired", false);
            this.World.Statistics.getFlags().set("isGeistPotionAcquired", false);
            this.World.Statistics.getFlags().set("isRachegeistPotionAcquired", false);
            this.World.Statistics.getFlags().set("isSkeletonWarriorPotionAcquired", false);
            this.World.Statistics.getFlags().set("isHonorGuardPotionAcquired", false);
            this.World.Statistics.getFlags().set("isAncientPriestPotionAcquired", false);
            this.World.Statistics.getFlags().set("isNecrosavantPotionAcquired", false);
            this.World.Statistics.getFlags().set("isLorekeeperPotionAcquired", false);
            this.World.Statistics.getFlags().set("isOrcYoungPotionAcquired", false);
            this.World.Statistics.getFlags().set("isOrcWarriorPotionAcquired", false);
            this.World.Statistics.getFlags().set("isOrcBerserkerPotionAcquired", false);
            this.World.Statistics.getFlags().set("isOrcWarlordPotionAcquired", false);
            this.World.Statistics.getFlags().set("isGoblinGruntPotionAcquired", false);
            this.World.Statistics.getFlags().set("isGoblinOverseerPotionAcquired", false);
            this.World.Statistics.getFlags().set("isGoblinShamanPotionAcquired", false);
            this.World.Statistics.getFlags().set("isDirewolfPotionAcquired", false);
            this.World.Statistics.getFlags().set("isLindwurmPotionAcquired", false);
            this.World.Statistics.getFlags().set("isUnholdPotionAcquired", false);
            this.World.Statistics.getFlags().set("isWebknechtPotionAcquired", false);
            this.World.Statistics.getFlags().set("isNachzehrerPotionAcquired", false);
            this.World.Statistics.getFlags().set("isAlpPotionAcquired", false);
            this.World.Statistics.getFlags().set("isHexePotionAcquired", false);
            this.World.Statistics.getFlags().set("isSchratPotionAcquired", false);
            this.World.Statistics.getFlags().set("isSerpentPotionAcquired", false);
            this.World.Statistics.getFlags().set("isKrakenPotionAcquired", false);
            this.World.Statistics.getFlags().set("isIjirokPotionAcquired", false);
            this.World.Statistics.getFlags().set("isIfritPotionAcquired", false);
            this.World.Statistics.getFlags().set("isHyenaPotionAcquired", false);
            this.World.Assets.m.Money = this.World.Assets.m.Money + 700;
        }

    });

	::mods_hookExactClass("scenarios/world/beast_hunters_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 3; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.improveMood(1.0, "Has slain a dangerous witch");
                bro.worsenMood(2.5, "Lost most of the company in a betrayal");

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "beast_hunter_background"
            ]);
            bros[0].getBackground().m.RawDescription = "%name% saved you in the brigand\'s ambush that destroyed your band of slayers. The mercenary does not hang this fact over you, for you have saved %name% many a times yourself. The beast hunter suffers no emotion that does not bid well in this world and that alone makes for a sound slayer.";
            bros[0].setPlaceInFormation(3);
            bros[0].addLightInjury();
            bros[0].getSkills().add(this.new("scripts/skills/traits/legend_beastslayers_trait"));
            bros[0].getSprite("socket").setBrush("bust_base_beasthunters");
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/boar_spear"));
            items.equip(this.new("scripts/items/tools/throwing_net"));
            bros[1].setStartValuesEx([
                "beast_hunter_background"
            ]);
            bros[1].getBackground().m.RawDescription = "A young whelp from the city, %name% got a start in beast slaying by rooting out the warrens of \'vicious rabbits\', as one puts it. You are not sure how true that is, but regardless %name% has demonstrated greats feats of arms on the battlefield more times than you can count.";
            bros[1].setPlaceInFormation(4);
            bros[1].addLightInjury();
            bros[1].getSkills().add(this.new("scripts/skills/traits/legend_beastslayers_trait"));
            bros[1].getSprite("socket").setBrush("bust_base_beasthunters");
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/spetum"));
            bros[2].setStartValuesEx([
                "beast_hunter_background"
            ]);
            bros[2].getBackground().m.RawDescription = "Grizzled vets are a rarity in beast slaying, and %name% sure ain\'t one. Instead, the \'slayer\' started the foray into monster hunting by reading books instead of training the sword. Still a good enough warrior at heart, it is the study and preparation that gives %name% the edge in battle.";
            bros[2].setPlaceInFormation(5);
            bros[2].addInjury(this.Const.Injury.Brawl);
            bros[2].getSkills().add(this.new("scripts/skills/traits/legend_beastslayers_trait"));
            bros[2].getSprite("socket").setBrush("bust_base_beasthunters");
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/hunting_bow"));
            items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
            items.equip(this.new("scripts/items/accessory/wardog_item"));

            foreach( bro in bros )
            {
                bro.EL_setLevel(2);
            }

            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Flags.set("HasLegendCampCrafting", true);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/witch_hair_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
            this.World.Assets.getStash().add(this.new("scripts/items/accessory/night_vision_elixir_item"));
            this.World.Assets.m.Money = this.Math.round(this.World.Assets.m.Money * 0.75);
        }

    });

	::mods_hookExactClass("scenarios/world/deserters_scenario", function(o){

        o.setupBro = function( _bro, _faction )
        {
            _bro.setStartValuesEx([
                "deserter_background"
            ]);
            _bro.worsenMood(1.0, "Was dragged from one bloody battle to the next");
            _bro.improveMood(1.5, "Deserted from the army");
            _bro.m.HireTime = this.Time.getVirtualTimeF();

            if (this.Math.rand(1, 100) <= 50)
            {
                _bro.addHeavyInjury();
            }
            else if (this.Math.rand(1, 100) <= 50)
            {
                _bro.addLightInjury();
            }

            local items = _bro.getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            local shield = this.new("scripts/items/shields/faction_heater_shield");
            shield.setFaction(_faction.getBanner());
            items.equip(shield);

            if (this.Math.rand(1, 100) <= 33 && items.getItemAtSlot(this.Const.ItemSlot.Head) != null)
            {
                items.getItemAtSlot(this.Const.ItemSlot.Head).setCondition(items.getItemAtSlot(this.Const.ItemSlot.Head).getRepairMax() * 0.5);
            }

            if (this.Math.rand(1, 100) <= 33 && items.getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
            {
                items.getItemAtSlot(this.Const.ItemSlot.Mainhand).setCondition(items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getRepairMax() * 0.5);
            }

            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            local armor = this.Const.World.Common.pickArmor([
                [
                    1,
                    "mail_hauberk",
                    28
                ],
                [
                    1,
                    "mail_shirt"
                ],
                [
                    1,
                    "gambeson"
                ],
                [
                    2,
                    "basic_mail_shirt"
                ]
            ]);
            armor.setCondition(armor.getConditionMax() * this.Math.rand(25, 100) * 0.01);
            items.equip(armor);
        }

        o.onSpawnPlayer = function()
        {
            local randomVillage;

            for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
            {
                randomVillage = this.World.EntityManager.getSettlements()[i];

                if (randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && !randomVillage.isSouthern())
                {
                    break;
                }

                i = ++i;
                i = i;
            }

            local randomVillageTile = randomVillage.getTile();
            local navSettings = this.World.getNavigator().createSettings();
            navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

            do
            {
                local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 7), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 7));
                local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 7), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 7));

                if (!this.World.isValidTileSquare(x, y))
                {
                }
                else
                {
                    local tile = this.World.getTileSquare(x, y);

                    if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
                    {
                    }
                    else if (tile.getDistanceTo(randomVillageTile) <= 4)
                    {
                    }
                    else if (!tile.HasRoad || tile.Type == this.Const.World.TerrainType.Shore)
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
            this.World.Assets.updateLook(12);
            this.World.getCamera().setPos(this.World.State.m.Player.getPos());
            local f = randomVillage.getFactionOfType(this.Const.FactionType.NobleHouse);
            f.addPlayerRelation(-200.0, "You and your men deserted");
            local names = [];

            for( local i = 0; i < 3; i = i )
            {
                while (true)
                {
                    local n = this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)];

                    if (names.find(n) == null)
                    {
                        names.push(n);
                        break;
                    }
                }

                i = ++i;
                i = i;
            }

            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 3; i = i )
            {
                local bro = roster.create("scripts/entity/tactical/player");
                bro.setName(names[i]);
                bro.setPlaceInFormation(3 + i);
                this.setupBro(bro, f);
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].getBackground().m.RawDescription = "{Prior to conscription into the army, %name% was a failed, illiterate baker. Poor work and frequent dessert errors made it prone to pull %name% into military ranks. Having always hated the life, the deserter was quick to join your cause and company.}";
            bros[0].getBackground().buildDescription(true);
            bros[0].EL_setLevel(2);
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/hatchet"));
            bros[1].getBackground().m.RawDescription = "{A fine fighter by any judgment, %name% simply hated the low pay of being a soldier in the army. The pursuit of the sellsword\'s life makes sense. Though quite flighty, you believe %name%\'s transient sense of allegiance will be buffered by a steady flow of good coin.}";
            bros[1].getBackground().buildDescription(true);
            bros[1].EL_setLevel(2);
            items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/shortsword"));
            bros[2].getBackground().m.RawDescription = "{%name% is like many deserters. You can see the spirit of a fighter, but the heart for it is withering. It doesn\'t make %name% a coward, as many assume deserters to be, but instead simply someone who may need change. Hopefully the coin of mercenary work can provide it.}";
            bros[2].getBackground().buildDescription(true);
            bros[2].EL_setLevel(2);
            items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/light_crossbow"));
            items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
            this.World.Flags.set("HasLegendCampScouting", true);
            this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
            {
                this.Music.setTrackList([
                    "music/retirement_02.ogg"
                ], this.Const.Music.CrossFadeTime);
                this.World.Events.fire("event.deserters_scenario_intro");
            }, null);
        }

    });

	::mods_hookExactClass("scenarios/world/gladiators_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local player_unit = this.Math.rand(0, 2);
            for( local i = 0; i < 3; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.setStartValuesEx([
                    "gladiator_origin_background"
                ], true, -1, true, i == player_unit ? 2 : 1);
                bro.getSkills().removeByID("trait.survivor");
                bro.getSkills().removeByID("trait.greedy");
                bro.getSkills().removeByID("trait.loyal");
                bro.getSkills().removeByID("trait.disloyal");
                if(i == player_unit) {
                    bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
                }
                bro.getSkills().add(this.new("scripts/skills/traits/arena_fighter_trait"));
                bro.getFlags().set("ArenaFightsWon", 5);
                bro.getFlags().set("ArenaFights", 5);
                bro.setPlaceInFormation(3 + i);
                bro.getFlags().set("IsPlayerCharacter", i == player_unit ? true : false);
                bro.getSprite("miniboss").setBrush("bust_miniboss_gladiators");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.EL_setLevel(1);
                i = ++i;
            }

            local bros = roster.getAll();
            local a;
            local u;
            bros[0].setTitle("the Lion");
            bros[0].getSkills().add(this.new("scripts/skills/traits/glorious_resolve_trait"));
            a = this.Const.World.Common.pickArmor([
                [
                    1,
                    "oriental/gladiator_harness"
                ]
            ]);
            a.setUpgrade(this.new("scripts/items/" + (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() ? "legend_armor/armor_upgrades/legend_light_gladiator_upgrade" : "armor_upgrades/light_gladiator_upgrade")));
            bros[0].getItems().equip(a);
            a = this.Const.World.Common.pickHelmet([
                [
                    1,
                    "oriental/gladiator_helmet",
                    13
                ]
            ]);
            bros[0].getItems().equip(a);
            bros[0].getItems().equip(this.new("scripts/items/weapons/scimitar"));
            bros[0].getItems().equip(this.new("scripts/items/tools/throwing_net"));
            bros[0].improveMood(0.75, "Eager to prove himself outside the arena");
            bros[1].setTitle("the Bear");
            bros[1].getSkills().add(this.new("scripts/skills/traits/glorious_endurance_trait"));
            a = this.Const.World.Common.pickArmor([
                [
                    1,
                    "oriental/gladiator_harness"
                ]
            ]);
            a.setUpgrade(this.new("scripts/items/" + (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() ? "legend_armor/armor_upgrades/legend_heavy_gladiator_upgrade" : "armor_upgrades/heavy_gladiator_upgrade")));
            bros[1].getItems().equip(a);
            a = this.Const.World.Common.pickHelmet([
                [
                    1,
                    "oriental/gladiator_helmet",
                    15
                ]
            ]);
            bros[1].getItems().equip(a);
            bros[1].getItems().equip(this.new("scripts/items/weapons/oriental/heavy_southern_mace"));
            bros[1].getItems().equip(this.new("scripts/items/shields/oriental/metal_round_shield"));
            bros[1].improveMood(0.75, "Eager to prove himself outside the arena");
            bros[2].setTitle("the Viper");
            bros[2].getSkills().add(this.new("scripts/skills/traits/glorious_quickness_trait"));
            a = this.Const.World.Common.pickArmor([
                [
                    1,
                    "oriental/gladiator_harness"
                ]
            ]);
            a.setUpgrade(this.new("scripts/items/" + (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() ? "legend_armor/armor_upgrades/legend_light_gladiator_upgrade" : "armor_upgrades/light_gladiator_upgrade")));
            bros[2].getItems().equip(a);
            a = this.Const.World.Common.pickHelmet([
                [
                    1,
                    "oriental/gladiator_helmet",
                    14
                ]
            ]);
            bros[2].getItems().equip(a);
            bros[2].getItems().equip(this.new("scripts/items/weapons/oriental/qatal_dagger"));
            bros[2].getItems().equip(this.new("scripts/items/tools/throwing_net"));
            bros[2].improveMood(0.75, "Eager to prove himself outside the arena");
            bros[0].getBackground().m.RawDescription = "{%fullname% thinks muscles make for glory. Wrong. Captain, it is I, " + bros[2].getName() + ", who commands the ladies of this realm. Need not ask me how. Behold! Look at it! Look at the size of it! Yeah. That\'s what I thought. Fools, train all you want, you can\'t have this!}";
            bros[0].getBackground().buildDescription(true);
            bros[1].getBackground().m.RawDescription = "{%fullname% is not the best warrior here, let\'s be clear. Captain, look at my muscles, is it not I, " + bros[0].getName() + ", who commands the greatest reward of life: the fear of one\'s own enemies! Look, if I lather a little and catch the light, the muscles gleam. Would it not be that the heavens were mistakened for above, when all the women say they find them right here, particularly here, upon my glorious pecs?}";
            bros[1].getBackground().buildDescription(true);
            bros[2].getBackground().m.RawDescription = "{Why are you looking at %fullname%? Captain, it is I, " + bros[1].getName() + ", who is your greatest gladiator. I am the one who swept the legs of a lindwurm and choked it out with its own tail! What you bastards say? You call that a tall tale? Pah! \'Tis a horizontal lizard at best.}";
            bros[2].getBackground().buildDescription(true);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() - 9);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_lamb_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money / 2 - (this.World.Assets.getEconomicDifficulty() == 0 ? 0 : 300);
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 2;
            this.World.Assets.m.Ammo = 0;
        }

    });

	::mods_hookExactClass("scenarios/world/legend_random_party_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local partysize = this.Math.rand(1, 6);
            local broLevelMax = this.Math.floor(6 / partysize);

            for( local i = 0; i < partysize; i = i )
            {
                local broLevel = this.Math.rand(1, broLevelMax);
                local broPerks = broLevel - 1;
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.setStartValuesEx(this.Const.CharacterBackgroundsRandom);
                bro.EL_setLevel(broLevel);
                i = ++i;
            }

            local randomFood;
            randomFood = this.Math.rand(0, 5);

            if (randomFood == 0)
            {
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/beer_item"));
            }

            if (randomFood == 1)
            {
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/goat_cheese_item"));
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
            }

            if (randomFood == 2)
            {
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/cured_venison_item"));
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
            }

            if (randomFood == 3)
            {
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/roots_and_berries_item"));
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/strange_meat_item"));
            }

            if (randomFood == 4)
            {
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            }

            if (randomFood == 5)
            {
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_fish_item"));
                this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_fruits_item"));
            }
        }

    });

	::mods_hookExactClass("scenarios/world/legend_random_solo_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 1; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.setStartValuesEx(this.Const.CharacterBackgroundsRandom, true, -1, true, 2);
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].EL_setLevel(1);
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getFlags().set("IsPlayerCharacter", true);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/beer_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money * 3;
        }

    });

	::mods_hookExactClass("scenarios/world/legends_assassin_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local bro;
            bro = roster.create("scripts/entity/tactical/player");
            bro.setStartValuesEx([
                "legend_assassin_commander_background"
            ], true, -1, true, 2);
            bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.Backstabber);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.LegendHidden);
            bro.setPlaceInFormation(4);
            bro.getFlags().set("IsPlayerCharacter", true);
            bro.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
            this.World.Assets.m.Money = 1.5 * this.World.Assets.m.Money;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo;
        }


    });

	::mods_hookExactClass("scenarios/world/legends_beggar_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 1; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.worsenMood(1.5, "Saw something awful");
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            local r;
            r = this.Math.rand(0, 3);

            if (r == 0)
            {
                bros[0].setStartValuesEx([
                    "legend_female_beggar_commander_background"
                ], true, -1, true, 2);
            }
            else
            {
                bros[0].setStartValuesEx([
                    "legend_beggar_commander_background"
                ], true, -1, true, 2);
            }

            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getFlags().set("IsPlayerCharacter", true);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 9);
            this.World.Assets.m.Money = this.World.Assets.m.Money / 2 + 2;
            this.World.Assets.m.ArmorParts = 0;
            this.World.Assets.m.Medicine = 0;
            this.World.Assets.m.Ammo = 0;
        }

    });

	::mods_hookExactClass("scenarios/world/legends_berserker_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 1; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_berserker_commander_background"
            ], true, -1, true, 2);
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.Berserk);
            bros[0].getFlags().set("IsPlayerCharacter", true);
            this.World.Assets.m.Money = this.World.Assets.m.Money;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo;
        }


    });

	::mods_hookExactClass("scenarios/world/legends_crusader_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local bro;
            bro = roster.create("scripts/entity/tactical/player");
            bro.setStartValuesEx([
                "legend_crusader_commander_background"
            ], true, -1, true, 2);
            bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.FortifiedMind);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.Rebound);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.LegendFavouredEnemyZombie);
            bro.setPlaceInFormation(4);
            bro.EL_setLevel(1);
            bro.getFlags().set("IsPlayerCharacter", true);
            bro.getSprite("socket").setBrush("bust_base_crusader");
            bro.getSprite("miniboss").setBrush("bust_miniboss_crusader");
            bro.m.HireTime = this.Time.getVirtualTimeF();
            this.World.Assets.addMoralReputation(20);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.m.Ammo = 0;
        }


    });

	::mods_hookExactClass("scenarios/world/legends_druid_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 1; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_druid_commander_background"
            ], true, -1, true, 2);
            bros[0].getBackground().m.RawDescription = "%name% has only ever known the wild woods, the worlds of men are strange and disgusting";
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_roots"));
            this.World.Assets.m.Money = this.World.Assets.m.Money * 0.5;
            bros[0].getFlags().set("IsPlayerCharacter", true);
            bros[0].setPlaceInFormation(3);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_fresh_fruit_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/roots_and_berries_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/pickled_mushrooms_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/accessory/legend_apothecary_mushrooms_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/legend_mistletoe_item"));
        }

    });

	::mods_hookExactClass("scenarios/world/legends_horse_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 3; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.worsenMood(0.5, "Encountered another caravan slaughtered by greenskins");

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_horse"
            ]);
            bros[0].setPlaceInFormation(3);
            bros[1].setStartValuesEx([
                "legend_horserider"
            ]);
            bros[1].setPlaceInFormation(3);
            bros[2].setStartValuesEx([
                "legend_trader_commander_background"
            ], true, -1, true, 2);
            bros[2].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[2].getFlags().set("IsPlayerCharacter", true);
            bros[2].setPlaceInFormation(4);
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/scimitar"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/amber_shards_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/cloth_rolls_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/dies_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/furs_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/salt_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money / 2 + 400;
        }
    });

	::mods_hookExactClass("scenarios/world/legends_inquisition_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 3; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "flagellant_background"
            ]);
            bros[0].getBackground().m.RawDescription = "{%name% has no greater joy than suffering in the name of the old gods. Pain and pleasure and intimately linked, just as creation and desctruction are intwined. Each lash of the whip is like the caress of an angel, and their belief is that in only through suffering can we find salvation. Few laymen understand this viewpoint, but it is respected by other servants of the old gods.}";
            bros[0].setPlaceInFormation(4);
            bros[0].getBaseProperties().Hitpoints += 10;
            bros[0].getBaseProperties().MeleeSkill += 10;
            bros[0].getSkills().add(this.new("scripts/skills/traits/legend_inquisition_disciple_trait"));
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.LegendMindOverBody);
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "barbarians/leather_helmet"
                ]
            ]));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/legend_cat_o_nine_tails"));
            bros[1].setStartValuesEx([
                "witchhunter_background"
            ]);
            bros[1].fillTalentValues(1, true);
            bros[1].getBaseProperties().RangedSkill += 5;
            bros[1].getBaseProperties().Bravery += 10;
            bros[1].getBackground().m.RawDescription = "{%name% has seen well the damage magic can bring to the world. The witches who steal the minds of men, the nightmares that end lives, and the necromancers who bring them back again. Hunting these foul creatures is the duty of all who serve the good of the gods. If the war is to be won, %name% will need a witch hunter army.}";
            bros[1].improveMood(1.0, "Recently purged the unworthy");
            bros[1].setPlaceInFormation(3);
            bros[1].EL_setLevel(2);
            bros[1].getSkills().add(this.new("scripts/skills/traits/legend_undead_killer_trait"));
            this.addScenarioPerk(bros[1].getBackground(), this.Const.Perks.PerkDefs.LegendMindOverBody);
            bros[2].setStartValuesEx([
                "legend_nun_background"
            ]);
            bros[2].getBaseProperties().Stamina += 10;
            bros[2].getBaseProperties().MeleeSkill += 10;
            bros[2].getBaseProperties().Hitpoints += 7;
            bros[2].getBaseProperties().Initiative -= 5;
            bros[2].getBackground().m.RawDescription = "{%name% is a huge figure, who spent many years in a temple healing and carrying the sick, learning the power of both strength and compassion. It was clear the ills of the world must be sought out and healed at their source. While healing a witch hunter, %name% was convinced to join the hunt to heal the world. }";
            bros[2].setPlaceInFormation(5);
            local heavy = this.new("scripts/skills/traits/heavy_trait");

            foreach( skill in heavy.m.Excluded )
            {
                bros[2].getSkills().removeByID(skill);
            }

            bros[2].getSkills().add(heavy);
            this.addScenarioPerk(bros[2].getBackground(), this.Const.Perks.PerkDefs.LegendMindOverBody);
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/reinforced_wooden_flail"));
            local shield = this.new("scripts/items/shields/heater_shield");
            shield.onPaintSpecificColor(23);
            items.equip(shield);
            local cloths = [
                [
                    1,
                    "cloth/legend_robes_nun"
                ]
            ];
            local armor = this.Const.World.Common.pickLegendArmor(cloths);

            if (armor != null)
            {
                local chains = [
                    [
                        1,
                        "chain/legend_armor_mail_shirt"
                    ],
                    [
                        1,
                        "chain/legend_armor_mail_shirt_simple"
                    ],
                    [
                        1,
                        "chain/legend_armor_short_mail"
                    ]
                ];
                local chain = this.Const.World.Common.pickLegendArmor(chains);

                if (chain != null)
                {
                    armor.setUpgrade(chain);
                }

                local plates = [
                    [
                        1,
                        "plate/legend_armor_leather_jacket"
                    ],
                    [
                        1,
                        "plate/legend_armor_leather_jacket_simple"
                    ]
                ];
                local plate = this.Const.World.Common.pickLegendArmor(plates);

                if (plate != null)
                {
                    armor.setUpgrade(plate);
                }

                local tabards = [
                    [
                        0,
                        ""
                    ],
                    [
                        1,
                        "tabard/legend_common_tabard"
                    ]
                ];
                local tabard = this.Const.World.Common.pickLegendArmor(tabards);

                if (tabard != null && armor != null)
                {
                    tabard.setVariant(113);
                    armor.setUpgrade(tabard);
                }

                items.equip(armor);
            }

            if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
            {
                foreach( bro in bros )
                {
                    local items = bro.getItems();
                    local armor = items.getItemAtSlot(this.Const.ItemSlot.Body);
                    local tabards = [
                        [
                            0,
                            ""
                        ],
                        [
                            1,
                            "tabard/legend_noble_tabard"
                        ]
                    ];
                    local tabard = this.Const.World.Common.pickLegendArmor(tabards);

                    if (tabard != null && armor != null)
                    {
                        tabard.setVariant(102);
                        armor.setUpgrade(tabard);
                    }
                }
            }

            this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/tools/holy_water_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_wooden_stake"));
            this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_wooden_stake"));
            this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_wooden_stake"));
            this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_wooden_stake"));
        }
    });

	::mods_hookExactClass("scenarios/world/legends_necro_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 4; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.getSprite("socket").setBrush("bust_base_undead");
                bro.getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }
            local r = this.Math.rand(0, 2);
            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_preserver_background"
            ], true, -1, true, r == 0 ? 2 : 1);
            bros[0].setPlaceInFormation(3);
            bros[0].getSprite("miniboss").setBrush("bust_miniboss_undead");
            bros[0].getFlags().set("IsPlayerCharacter", true);
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getSkills().add(this.new("scripts/skills/perks/perk_bags_and_belts"));
            bros[1].setStartValuesEx([
                "legend_warlock_summoner_background"
            ], true, -1, true, r == 1 ? 2 : 1);
            bros[1].setPlaceInFormation(4);
            bros[1].getSprite("miniboss").setBrush("bust_miniboss_undead");
            bros[1].getSkills().add(this.new("scripts/skills/traits/ailing_trait"));
            bros[1].getFlags().set("IsPlayerCharacter", true);
            bros[1].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[1].getSkills().add(this.new("scripts/skills/perks/perk_nine_lives"));
            bros[2].setStartValuesEx([
                "legend_puppet_master_background"
            ], true, -1, true, r == 2 ? 2 : 1);
            bros[2].setPlaceInFormation(5);
            bros[2].getSprite("miniboss").setBrush("bust_miniboss_undead");
            bros[2].getFlags().set("IsPlayerCharacter", true);
            bros[2].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[2].getSkills().add(this.new("scripts/skills/perks/perk_legend_possession"));
            bros[3].setStartValuesEx([
                "legend_puppet_background"
            ]);
            bros[3].getBackground().m.RawDescription = "Once a proud necromancer, %name% took three pupils under their wing to train the next generation of great necromancers. What %name% did not seeing coming is a heart attack - one that left them like a corpse like they used to command. With this macabre irony in mind, they now serve their students in unlife as little more than fodder.";
            bros[3].setPlaceInFormation(12);
            this.World.Assets.m.Money = this.World.Assets.m.Money / 1;
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/strange_meat_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/strange_meat_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/black_marsh_stew_item"));
        }

    });

	::mods_hookExactClass("scenarios/world/legends_noble_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 6; i = i )
            {
                local bro = roster.create("scripts/entity/tactical/player");

                if (i != 0)
                {
                    bro.fillTalentValues(3);
                }

                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_noble_commander_background"
            ], false, -1, true, 2);
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getFlags().set("IsPlayerCharacter", true);
            bros[0].setPlaceInFormation(13);
            bros[0].getSkills().add(this.new("scripts/skills/traits/drunkard_trait"));
            bros[0].getSkills().add(this.new("scripts/skills/traits/legend_noble_killer_trait"));
            bros[0].getSkills().add(this.new("scripts/skills/effects_world/drunk_effect"));
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.Rotation);
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.RallyTheTroops);
            bros[1].setStartValuesEx([
                "legend_noble_shield"
            ], false);
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            local r = this.Math.rand(1, 2);
            local shield;

            if (r == 1)
            {
                shield = this.new("scripts/items/shields/faction_kite_shield");
            }
            else if (r == 2)
            {
                shield = this.new("scripts/items/shields/faction_heater_shield");
            }

            items.equip(shield);
            bros[1].getBackground().m.RawDescription = "Though a lowly foot soldier %name% has one of the most upbeat outlooks on life you\'ve ever encountered. Unfortunately that extends to an over evaluation of self worth, expecting more pay than most.";
            bros[1].getBackground().buildDescription(true);
            bros[1].getSkills().add(this.new("scripts/skills/traits/optimist_trait"));
            bros[1].getSkills().add(this.new("scripts/skills/traits/determined_trait"));
            bros[1].getSkills().add(this.new("scripts/skills/traits/greedy_trait"));
            this.addScenarioPerk(bros[1].getBackground(), this.Const.Perks.PerkDefs.Rotation);
            bros[1].setPlaceInFormation(3);
            bros[2].setStartValuesEx([
                "legend_noble_2h"
            ], false);
            bros[2].getBackground().m.RawDescription = "%name% is a hulking figure, both upward and outward. Not much of a talker, but a big eater.";
            bros[2].getBackground().buildDescription(true);
            bros[2].getSkills().removeByID("trait.tiny");
            bros[2].getSkills().add(this.new("scripts/skills/traits/huge_trait"));
            bros[2].getSkills().add(this.new("scripts/skills/traits/fat_trait"));
            bros[2].getSkills().add(this.new("scripts/skills/traits/gluttonous_trait"));
            this.addScenarioPerk(bros[2].getBackground(), this.Const.Perks.PerkDefs.Rotation);
            bros[2].setPlaceInFormation(4);
            bros[3].setStartValuesEx([
                "legend_noble_shield"
            ], false);
            local items = bros[3].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            r = this.Math.rand(1, 2);
            local shield;

            if (r == 1)
            {
                shield = this.new("scripts/items/shields/faction_kite_shield");
            }
            else if (r == 2)
            {
                shield = this.new("scripts/items/shields/faction_heater_shield");
            }

            items.equip(shield);
            bros[3].getBackground().m.RawDescription = "%name%\'s parents both served your family, it runs in the blood. While %name% is dependable in a fight and would never dream of leaving you, it also reduces their %name%\'s ambition and drive";
            bros[3].getBackground().buildDescription(true);
            bros[3].getSkills().add(this.new("scripts/skills/traits/pragmatic_trait"));
            bros[3].getSkills().add(this.new("scripts/skills/traits/loyal_trait"));
            bros[3].getSkills().add(this.new("scripts/skills/traits/slack_trait"));
            this.addScenarioPerk(bros[3].getBackground(), this.Const.Perks.PerkDefs.Rotation);
            bros[3].setPlaceInFormation(5);
            bros[4].setStartValuesEx([
                "servant_background"
            ], false);
            bros[4].getBackground().m.RawDescription = "%name% has been a servant in your family for 5 generations now, it is unclear how anyone has survived this long, but there are no indications of the old coot giving up any time soon.";
            bros[4].getBackground().buildDescription(true);
            bros[4].getSkills().add(this.new("scripts/skills/traits/old_trait"));
            bros[4].getSkills().add(this.new("scripts/skills/traits/loyal_trait"));
            bros[4].getSkills().add(this.new("scripts/skills/traits/lucky_trait"));
            bros[4].getSkills().add(this.new("scripts/skills/traits/survivor_trait"));
            this.addScenarioPerk(bros[4].getBackground(), this.Const.Perks.PerkDefs.Rotation);
            bros[4].setPlaceInFormation(12);
            local items = bros[4].getItems();
            items.equip(this.Const.World.Common.pickArmor([
                [
                    1,
                    "linen_tunic"
                ]
            ]));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "feathered_hat"
                ]
            ]));
            items.equip(this.new("scripts/items/supplies/legend_pudding_item"));
            items.addToBag(this.new("scripts/items/supplies/wine_item"));
            bros[5].setStartValuesEx([
                "legend_noble_ranged"
            ], false);
            bros[5].getBackground().m.RawDescription = "%name% has won the house archery contest several years running, but never shuts up about it. The constant stream of narration makes the great aim easy to dodge.";
            bros[5].getBackground().buildDescription(true);
            bros[5].getSkills().add(this.new("scripts/skills/traits/sureshot_trait"));
            bros[5].getSkills().add(this.new("scripts/skills/traits/teamplayer_trait"));
            bros[5].getSkills().add(this.new("scripts/skills/traits/predictable_trait"));
            this.addScenarioPerk(bros[5].getBackground(), this.Const.Perks.PerkDefs.Rotation);

            if (bros[5].getBaseProperties().RangedSkill <= 60)
            {
                bros[5].getBaseProperties().RangedSkill += 5;
            }

            bros[5].setPlaceInFormation(14);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/cured_rations_item"));
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.m.Money = this.World.Assets.m.Money * 3;
        }
    });

	::mods_hookExactClass("scenarios/world/legends_rangers_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 2; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.getSprite("socket").setBrush("bust_base_wildmen_01");
                bro.getSprite("miniboss").setBrush("bust_miniboss");
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            local talents;
            bros[0].setStartValuesEx([
                "legend_ranger_commander_background"
            ], true, -1, true, 2);
            bros[0].getBackground().m.RawDescription = "{%name% grew up in the rangers and was taught the ways of the forest by veteran foresters. Running through the woods for a lifetime has made %name% particularly good at tracking enemies, or tumbling into the homes of wild druids trying to escape from the modern world}";
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.Pathfinder);
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.Footwork);
            bros[0].improveMood(1.5, "Narrowly escaped a bear");
            bros[0].addLightInjury();
            bros[0].getFlags().set("IsPlayerCharacter", true);
            bros[0].setPlaceInFormation(3);
            bros[1].setStartValuesEx([
                "legend_druid_commander_background"
            ], true, -1, true, 2);
            bros[1].getBackground().m.RawDescription = "{%name% was the bastard of a noblewoman who left them in a ditch at the edge of the forest to be taken by wolves. It worked, but instead left %name% being cared for by a wolfmother with no cubs of her own. When the she-wolf was slain by vengeful poachers %name% took it upon themselves to be as far away from society as possible. Right up until a certain ranger fell headfirst into their hovel}";
            bros[1].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bros[1].getBackground(), this.Const.Perks.PerkDefs.Pathfinder);
            this.addScenarioPerk(bros[1].getBackground(), this.Const.Perks.PerkDefs.Footwork);
            bros[1].worsenMood(1.5, "Had my home destroyed by an idiot");
            bros[1].getFlags().set("IsPlayerCharacter", true);
            bros[1].setPlaceInFormation(4);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/cured_venison_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/furs_item"));
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo * 2;
        }

    });

	::mods_hookExactClass("scenarios/world/legends_risen_legion_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local partysize = 12;
            local broLevelMax = 3;

            for( local i = 0; i < partysize; i = i )
            {
                local broLevel = this.Math.rand(1, broLevelMax);
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.EL_setLevel(broLevel);
                bro.getFlags().add("PlayerSkeleton");
                bro.getFlags().add("undead");
                bro.getFlags().add("skeleton");
                bro.getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
                bro.getSkills().add(this.new("scripts/skills/racial/skeleton_racial"));
                bro.getSkills().add(this.new("scripts/skills/traits/legend_fleshless_trait"));
                local items = bro.getItems();
                items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
                items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
                items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
                items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
                items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
                local r = this.Math.rand(1, 8);

                if (r <= 3)
                {
                    bro.setStartValuesEx([
                        "militia_background"
                    ]);
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
                    items.equip(this.Const.World.Common.pickHelmet([
                        [
                            1,
                            "ancient/legend_ancient_legionary_helmet_restored"
                        ],
                        [
                            1,
                            "ancient/ancient_legionary_helmet"
                        ]
                    ]));
                    items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
                    items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                }

                if (r == 4)
                {
                    bro.setStartValuesEx(this.Const.CharacterBackgroundsAnimated);
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
                    items.equip(this.Const.World.Common.pickHelmet([
                        [
                            1,
                            "ancient/legend_ancient_legionary_helmet_restored"
                        ],
                        [
                            1,
                            "ancient/ancient_legionary_helmet"
                        ]
                    ]));
                    items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
                    items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                }

                if (r == 5)
                {
                    bro.setStartValuesEx([
                        "beast_hunter_background"
                    ]);
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
                    items.equip(this.Const.World.Common.pickHelmet([
                        [
                            1,
                            "ancient/ancient_gladiator_helmet"
                        ]
                    ]));
                    items.equip(this.new("scripts/items/weapons/ancient/legend_gladius"));
                    items.equip(this.new("scripts/items/tools/throwing_net"));
                    items.addToBag(this.new("scripts/items/tools/throwing_net"));
                    items.addToBag(this.new("scripts/items/tools/throwing_net"));
                }

                if (r == 6)
                {
                    bro.setStartValuesEx([
                        "swordmaster_background"
                    ]);
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
                    items.equip(this.Const.World.Common.pickHelmet([
                        [
                            1,
                            "ancient/ancient_honorguard_helmet"
                        ]
                    ]));
                    items.equip(this.new("scripts/items/weapons/ancient/rhomphaia"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                }

                if (r >= 7)
                {
                    bro.setStartValuesEx([
                        "retired_soldier_background"
                    ]);
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
                    items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
                    items.equip(this.Const.World.Common.pickHelmet([
                        [
                            1,
                            "ancient/ancient_household_helmet"
                        ]
                    ]));
                    items.equip(this.new("scripts/items/weapons/ancient/bladed_pike"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                    items.addToBag(this.new("scripts/items/weapons/javelin"));
                }

                local cloths = [
                    [
                        0,
                        ""
                    ],
                    [
                        1,
                        "cloth/legend_sackcloth"
                    ],
                    [
                        1,
                        "cloth/legend_sackcloth_patched"
                    ],
                    [
                        1,
                        "cloth/legend_sackcloth_tattered"
                    ],
                    [
                        10,
                        "cloth/legend_ancient_cloth"
                    ],
                    [
                        10,
                        "cloth/legend_ancient_cloth_restored"
                    ]
                ];
                local armor = this.Const.World.Common.pickLegendArmor(cloths);
                local plates = [
                    [
                        0,
                        ""
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_brigandine"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_brigandine_hardened"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_brigandine_hardened_full"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_jacket"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_jacket_simple"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_lamellar"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_lamellar_harness_heavy"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_lamellar_harness_reinforced"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_lamellar_heavy"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_lamellar_reinforced"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_noble"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_padded"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_riveted"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_riveted_light"
                    ],
                    [
                        0,
                        "plate/legend_armor_leather_scale"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_gladiator"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_chest"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_chest_restored"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_harness"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_mail"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_scale"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_scale_coat"
                    ],
                    [
                        1,
                        "plate/legend_armor_plate_ancient_scale_harness"
                    ],
                    [
                        0,
                        "plate/legend_armor_plate_chest"
                    ],
                    [
                        0,
                        "plate/legend_armor_plate_chest_rotten"
                    ],
                    [
                        0,
                        "plate/legend_armor_plate_cuirass"
                    ],
                    [
                        0,
                        "plate/legend_armor_plate_full"
                    ],
                    [
                        0,
                        "plate/legend_armor_scale"
                    ],
                    [
                        0,
                        "plate/legend_armor_scale_coat"
                    ],
                    [
                        0,
                        "plate/legend_armor_scale_coat_rotten"
                    ],
                    [
                        0,
                        "plate/legend_armor_scale_shirt"
                    ]
                ];
                local plate = this.Const.World.Common.pickLegendArmor(plates);

                if (plate != null)
                {
                    armor.setUpgrade(plate);
                }

                items.equip(armor);
                i = ++i;
                i = i;
            }

            this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_train"));
            this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_repair"));
            this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_scout"));
            this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_heal"));
            this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_scrap"));
            this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_fletcher"));
        }

    });

	::mods_hookExactClass("scenarios/world/legends_scaling_beggar_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 1; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.worsenMood(1.5, "Saw something awful");
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_beggar_commander_op_background"
            ], true, -1, true, 2);
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getFlags().set("IsPlayerCharacter", true);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 9);
            this.World.Assets.m.Money = this.World.Assets.m.Money / 2 + 2;
            this.World.Assets.m.ArmorParts = 0;
            this.World.Assets.m.Medicine = 0;
            this.World.Assets.m.Ammo = 0;
        }


    });

	::mods_hookExactClass("scenarios/world/legends_seer_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local bro;
            bro = roster.create("scripts/entity/tactical/player");
            bro.setStartValuesEx([
                "legend_witch_commander_background"
            ], true, -1, true, 2);
            bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.LegendDaze);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.Student);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.LegendMagicMissile);
            bro.setPlaceInFormation(4);
            bro.getFlags().set("IsPlayerCharacter", true);
            bro.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
            bro.m.HireTime = this.Time.getVirtualTimeF();
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.m.Ammo = 0;
        }


    });

	::mods_hookExactClass("scenarios/world/legends_sisterhood_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 6; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.getSkills().add(this.new("scripts/skills/perks/perk_hold_out"));
                bro.m.PerkPointsSpent += 1;
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_shieldmaiden_background"
            ], true, 1);
            bros[0].setPlaceInFormation(3);
            bros[1].setStartValuesEx([
                "wildwoman_background"
            ], true, 1);
            bros[1].setPlaceInFormation(4);
            bros[2].setStartValuesEx([
                "female_thief_background"
            ], true, 1);
            bros[2].setPlaceInFormation(5);
            bros[3].setStartValuesEx([
                "female_bowyer_background"
            ], true, 1);
            bros[3].setPlaceInFormation(12);
            bros[4].setStartValuesEx([
                "legend_vala_commander_background"
            ], true, 1, true, 2);
            bros[4].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[4].getSkills().add(this.new("scripts/skills/perks/perk_legend_roster_1"));
            bros[4].getFlags().set("IsPlayerCharacter", true);
            bros[4].setPlaceInFormation(13);
            bros[5].setStartValuesEx([
                "female_adventurous_noble_background"
            ], true, 1);
            bros[5].setPlaceInFormation(14);
            this.World.Flags.set("HasLegendCampGathering", true);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
        }

    });

	::mods_hookExactClass("scenarios/world/legends_troupe_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 4; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_illusionist_background"
            ]);
            bros[0].getBackground().m.RawDescription = "{%name% learned how to entertain on the streets, using slight of hand and magic tricks to dupe unwitting punters out of their coin. Illusion is easier with a distraction, so the choice to join others was easy.}";
            bros[0].EL_setLevel(3);
            bros[0].setPlaceInFormation(13);
            bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_leap"));
            bros[1].getSkills().add(this.new("scripts/skills/perks/perk_legend_push"));
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "jesters_hat"
                ]
            ]));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/legend_slingstaff"));
            bros[1].setStartValuesEx([
                "minstrel_background"
            ]);
            bros[1].getBackground().m.RawDescription = "{%name% worked providing entertainment at inns around the country, but the bar fights and road bandits make it no life for a solo artist. Joining with others was for safety as much as the show.}";
            bros[1].setPlaceInFormation(12);
            bros[1].getSkills().add(this.new("scripts/skills/perks/perk_legend_leap"));
            bros[1].getSkills().add(this.new("scripts/skills/perks/perk_legend_drums_of_life"));
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "named/jugglers_hat"
                ]
            ]));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/lute"));
            bros[2].setStartValuesEx([
                "female_minstrel_background"
            ]);
            bros[2].getBackground().m.RawDescription = "{%name% has been in the court of a local noble for years, but the same audience every night grows tiresome. It was time to find a band, hit the road and find some new audiences for their art.}";
            bros[2].improveMood(1.0, "Got the band back together");
            bros[2].setPlaceInFormation(4);
            bros[2].EL_setLevel(4);
            bros[2].getSkills().add(this.new("scripts/skills/perks/perk_legend_leap"));
            bros[2].getSkills().add(this.new("scripts/skills/perks/perk_legend_drums_of_war"));
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "named/jugglers_hat"
                ]
            ]));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/legend_drum"));
            bros[3].setStartValuesEx([
                "juggler_background"
            ]);
            bros[3].getBackground().m.RawDescription = "{%name% was juggling and throwing knives in markets, and agreed to join the troupe to improve the show with the skills of others}";
            bros[3].setPlaceInFormation(13);
            bros[3].EL_setLevel(2);
            bros[3].getSkills().add(this.new("scripts/skills/perks/perk_legend_leap"));
            bros[3].getSkills().add(this.new("scripts/skills/perks/perk_legend_push"));
            local items = bros[3].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "named/jugglers_padded_hat"
                ]
            ]));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/greenskins/orc_javelin"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_pie_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/weapons/legend_drum"));
            this.World.Assets.getStash().add(this.new("scripts/items/weapons/greenskins/goblin_spiked_balls"));
        }

    });

	::mods_hookExactClass("scenarios/world/lone_wolf_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local bro = roster.create("scripts/entity/tactical/player");
            bro.m.HireTime = this.Time.getVirtualTimeF();
            bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_lonewolf_background"
            ], true, -1, true, 2);
            bros[0].getBackground().buildDescription(true);
            bros[0].setTitle("the Lone Wolf");
            bros[0].getSkills().add(this.new("scripts/skills/perks/perk_legend_favoured_enemy_swordmaster"));
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getSkills().add(this.new("scripts/skills/traits/legend_lw_relationship_trait"));
            bros[0].setPlaceInFormation(4);
            bros[0].getFlags().set("IsPlayerCharacter", true);
            bros[0].getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
            bros[0].m.HireTime = this.Time.getVirtualTimeF();
            bros[0].EL_setLevel(1);
            bros[0].setVeteranPerks(2);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Flags.set("HasLegendCampTraining", true);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money / 3 - (this.World.Assets.getEconomicDifficulty() == 0 ? 0 : 100);
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 3;
            this.World.Assets.m.Ammo = 0;
        }

    });

	::mods_hookExactClass("scenarios/world/mage_legends_mage_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local bro;
            bro = roster.create("scripts/entity/tactical/player");
            bro.setStartValuesEx([
                "mage_legend_mage_commander_background"
            ], true, -1, true, 2);
            bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.Student);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.LegendMindOverBody);
            this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.LegendMagicMissile);
            bro.setPlaceInFormation(4);
            bro.getFlags().set("IsPlayerCharacter", true);
            bro.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
            bro.m.HireTime = this.Time.getVirtualTimeF();
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.m.Ammo = 0;
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
        }


    });

	::mods_hookExactClass("scenarios/world/manhunters_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 6; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
            }

            local bros = roster.getAll();
            local talents;
            bros[0].setStartValuesEx([
                "manhunter_background"
            ]);
            bros[0].setTitle("the Stoic");
            bros[0].getBackground().m.RawDescription = "{In a sense, you don\'t particularly care for %name%. He\'s not hateful nor forgiving toward the prisoners of war, criminals, and the like. He just handles his business. But he\'s also this calm, unwavering way with you, and it\'s a bit bothersome. The man has so much potential, which is why you have him onboard for the %companyname%, but you just wished he showed some passion now and again.}";
            bros[0].setPlaceInFormation(12);
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.new("scripts/items/weapons/oriental/light_southern_mace"));
            bros[0].getSkills().add(this.new("scripts/skills/actives/whip_slave_skill"));
            local traits = bros[0].getSkills().getAllSkillsOfType(this.Const.SkillType.Trait);

            foreach( t in traits )
            {
                if (!t.isType(this.Const.SkillType.Special) && !t.isType(this.Const.SkillType.Background))
                {
                    bros[0].getSkills().remove(t);
                }
            }

            bros[1].setStartValuesEx([
                "manhunter_background"
            ]);
            bros[1].setTitle("the Whip");
            bros[1].getBackground().m.RawDescription = "{%name% is one of the worst people you have ever come to know. He is relentlessly brutal on the indebted, even by your measure, and is responsible for outright killing a few of your catches. That said, his mean streak will serve the company well. And given that you\'ve already whipped him a time or three for losing inventory, you know he can take a hit as well as he can give it.}";
            bros[1].setPlaceInFormation(13);
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "oriental/southern_head_wrap"
                ]
            ]));
            items.equip(this.new("scripts/items/weapons/battle_whip"));
            bros[1].getSkills().add(this.new("scripts/skills/actives/whip_slave_skill"));
            bros[1].worsenMood(0.0, "Annoyed by your recent reprimand not to mistreat your captives");
            bros[2].setStartValuesEx([
                "slave_southern_background"
            ]);
            bros[2].setTitle("the Learned");
            bros[2].getBackground().m.RawDescription = "{You found %name% being lawed by city guards. It looked like they were gonna play a game of \'catch the scimitar\' with his wrists until you intervened, opining that he owed the Gilder far before he owed any man. You hoped to offload him to high-paying Viziers, but none would take him as he was too \'learned\' and seemed the exact sort of threat to spur an uprising. Unusual to a man of his standing, he does harbor a fair bit of respect for you.}";
            bros[2].setPlaceInFormation(2);
            bros[2].getSkills().removeByID("trait.dumb");
            bros[2].getSkills().add(this.new("scripts/skills/traits/bright_trait"));
            bros[2].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/wooden_stick"));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "oriental/nomad_head_wrap"
                ]
            ]));
            bros[2].worsenMood(0.0, "Misses his books");
            bros[3].setStartValuesEx([
                "slave_background"
            ]);
            bros[3].setTitle("the Northerner");
            bros[3].getBackground().m.RawDescription = "{Not a friendly man by any means, but that\'s what the shackles are for. %name% was on the chopping block for a series of crimes when you happened upon him. You paid for his life as an investment, stating that he now owed hard work to find salvation in the Gilder\'s eyes. He\'s not so sure of your earnest beliefs, but you paid a priest to confirm that the man indeed owes his sweat to a higher sublimity.}";
            bros[3].setPlaceInFormation(3);
            bros[3].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            local items = bros[3].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/bludgeon"));
            bros[3].worsenMood(2.0, "Almost got executed");
            bros[3].improveMood(2.0, "Relieved that he escaped execution");
            bros[3].worsenMood(0.0, "Worried about what awaits him next");
            bros[4].setStartValuesEx([
                "slave_southern_background"
            ]);
            bros[4].setTitle("the Deserter");
            bros[4].getBackground().m.RawDescription = "{%name% is an heirloom of heresy, a man gifted to you by one of the Vizier\'s priests. The man was a deserter in the high lord\'s army, but through wealthy connections managed to avoid execution. However, there\'s only one way to avoid the fire of the hells, and that is through indebted gratitude. He will work for you until he finds salvation, and when that happens is entirely up to you.}";
            bros[4].setPlaceInFormation(4);
            bros[4].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            local items = bros[4].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/militia_spear"));
            bros[4].worsenMood(0.5, "Feels cursed to have deserted one army only to end up an indebted in another");
            bros[5].setStartValuesEx([
                "slave_southern_background"
            ]);
            bros[5].setTitle("the Beggar");
            bros[5].getBackground().m.RawDescription = "{Found on the streets, %name% never stood much of a chance. Being a beggar, it was physically easy to slap the chains on him, and socially no one would care. The Gilder cares not for those who do not work, and every day the man squandered without putting in his sweat he accrued a debt. Now it must be paid lest he taste that desert fire for eternity. He\'s actually healthier looking now than when you found him, though he never seems to thank you for this.}";
            bros[5].setPlaceInFormation(5);
            bros[5].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            local items = bros[5].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/wooden_stick"));
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/misc/manhunters_ledger_item"));
            this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 9);
            this.World.Assets.m.Money = this.World.Assets.m.Money;
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 2;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo / 2;
        }

    });

	::mods_hookExactClass("scenarios/world/militia_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 12; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.worsenMood(1.5, "Lost many a friend in battle");
                bro.improveMood(0.5, "Part of a militia");
                bro.getSkills().add(this.new("scripts/skills/traits/peasant_trait"));
                bro.getSprite("socket").setBrush("bust_base_militia");
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "farmhand_background"
            ]);
            bros[0].getBackground().m.RawDescription = "%name% is a farmer\'s child, and presumably wishes to have a child of their own at some point. For now, they are with you — which is quite a regrettable clash between dreams and reality.";
            bros[0].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[0].improveMood(3.0, "Has recently fallen in love");
            bros[0].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/pitchfork"));
            bros[1].setStartValuesEx(this.Const.CharacterVillageBackgrounds);
            bros[1].getBackground().m.RawDescription = "%name% owned a farmstead that has long since gone underfoot of countless passing armies, including the very ones they\'ve fought for. Their \'allegiance\' to you is arguably the result of an empty belly more than anything.";
            bros[1].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[1].worsenMood(0.5, "Was involved in a brawl");
            bros[1].addLightInjury();
            bros[1].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/warfork"));
            bros[2].setStartValuesEx([
                "poacher_background"
            ]);
            bros[2].getBackground().m.RawDescription = "It is a common joke that %name% is in fact a noble hiding away from the world, but to the best of your knowledge they were a simple poacher. The grind of the world got them to where they are today, not much else need be said other than you hope they gets back on their feet.";
            bros[2].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[2].worsenMood(0.5, "Was involved in a brawl");
            bros[2].addLightInjury();
            bros[2].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/legend_sling"));
            bros[3].setStartValuesEx([
                "vagabond_background",
                "thief_background",
                "female_thief_background",
                "gambler_background"
            ]);
            bros[3].getBackground().m.RawDescription = "You notice that %name% hides from certain noblemen. It is likely that they are a common criminal at large for some petty crime, but so long as they fight well it is no business to you.";
            bros[3].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[3].improveMood(1.5, "Stole someone\'s scramasax");
            bros[3].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            items = bros[3].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/scramasax"));
            bros[4].setStartValuesEx([
                "daytaler_background",
                "vagabond_background",
                "legend_leech_peddler_background"
            ]);
            bros[4].getBackground().m.RawDescription = "A daytaler and common laborer, %name% would rather join your outfit than go back to wasting their body building some nobleman\'s new fancy foyer.";
            bros[4].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[4].worsenMood(0.5, "Was involved in a brawl");
            bros[4].addLightInjury();
            bros[4].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            bros[5].setStartValuesEx(this.Const.CharacterVillageBackgrounds);
            bros[5].getBackground().m.RawDescription = "Seeking riches, %name% has come to the right place in your newfound mercenary band. Unfortunately, their background is in farming, milling, and laying stone, particularly none of which they were any good at.";
            bros[5].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[5].improveMood(1.0, "Looks forward to becoming rich as a sellsword");
            bros[5].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            local items = bros[5].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/pitchfork"));
            bros[6].setStartValuesEx([
                "fisherman_background"
            ]);
            bros[6].getBackground().m.RawDescription = "%name% states they were a sailor prior to coming inland and falling in with the militia and now your mercenary band. They hope to eventually own a boat and put its sails to the open ocean. You hope they can do that someday, truly.";
            bros[6].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[6].worsenMood(0.25, "Feels somewhat sickly of late");
            bros[6].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            bros[7].setStartValuesEx([
                "militia_background"
            ]);
            bros[7].getBackground().m.RawDescription = "%name% has apparently been in many militias, all of which eventually dissolved for one reason or another. At no point have they made any money in any of them, so they hope to changes that with this whole new sellswording schtick.";
            bros[7].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[7].improveMood(3.0, "Has recently become a parent");
            bros[7].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            bros[8].setStartValuesEx([
                "minstrel_background"
            ]);
            bros[8].getBackground().m.RawDescription = "%name% enjoys carousing ladies at the pub and chasing skirt in the church. You get the sense they\'ve only tagged along to spread their sense of \'fun\' around the world.";
            bros[8].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[8].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            local items = bros[8].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.equip(this.new("scripts/items/weapons/lute"));
            bros[9].setStartValuesEx(this.Const.CharacterVillageBackgrounds);
            bros[9].getBackground().m.RawDescription = "Daytaler, laborer, caravan hand, sailor, militia, %name%\'s done a bit of it all. Hopefully this new foray into mercenary work will stick for them.";
            bros[9].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[9].worsenMood(1.0, "Had their trusty scramasax stolen");
            bros[9].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            bros[10].setStartValuesEx([
                "militia_background"
            ]);
            bros[10].getBackground().m.RawDescription = "Like yourself, %name% was fed up with militias being overused to solve the crises of unprepared nobles. They were arguably the most earnest of the fighters in joining the transition to mercenary work.";
            bros[10].getSprite("accessory_special").setBrush("bust_militia_band_01");
            bros[10].worsenMood(0.5, "Disliked that some members of the militia were involved in a brawl");
            bros[10].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            bros[11].setStartValuesEx(this.Const.CharacterVillageBackgrounds);
            bros[11].getBackground().m.RawDescription = "%name% is, ostensibly, running away from their other half. You met them once and approve their escape plan entirely, and not just because it affords you another body on the front line — that wench is genuinely crazy.";
            bros[11].improveMood(1.0, "Managed to get away from their family");
            bros[11].getSkills().add(this.new("scripts/skills/traits/hate_nobles_trait"));
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 9);
            this.World.Assets.m.Money = this.World.Assets.m.Money * 2;
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 2;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo / 2;
        }

    });

	::mods_hookExactClass("scenarios/world/paladins_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 2; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "old_paladin_background"
            ]);
            bros[0].getBackground().m.RawDescription = "{Perhaps of an age more suitable for caretaking than oathtaking, %name% is a rather old, nigh on decrepit Oathtaker. While age has robbed him of his more natural talents, it has at least gifted him with learning and experience that no physical capabilities can match. He is a man of many spirits, having gone around this world in the shell of soldier, farmer, sellsword, and more. Now he is an Oathtaker, and all those skills and traits he built up over the years has made him quite a formidable one at that. | When First Oathtaker Anselm first met %name%, it is said that the prime paladin divulged details no one else could have possibly known, thus proving the aethereal power behind his beliefs. %name% is an ardent believer in the Oaths, and in seeing Young Anselm\'s vision through.}";
            bros[0].setPlaceInFormation(4);
            bros[0].EL_setLevel(3);
            bros[0].getSkills().add(this.new("scripts/skills/traits/old_trait"));
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.equip(this.new("scripts/items/helmets/heavy_mail_coif"));
            items.equip(this.new("scripts/items/armor/adorned_mail_shirt"));
            items.equip(this.new("scripts/items/accessory/oathtaker_skull_01_item"));
            local banner = this.new("scripts/items/tools/player_banner");
            banner.setVariant(this.World.Assets.getBannerID());
            items.equip(banner);
            bros[1].setStartValuesEx([
                "paladin_background"
            ]);
            bros[1].getBackground().m.RawDescription = "{%name%, like many of the Oathtakers\' more spry members, strives to be like Young Anselm. A youthful, capable man who has yet to let the world\'s horrors and grind wear him down. In moments of honesty, he reminds you of yourself. In moments of reflection, you realize that he will likely one day resemble you as you are now. But until then, to the youth of the world, for the Oaths are certainly not wasted upon them! | When Anselm set out on his quest, it was %name% whom joined him first. Despite the Young Anselm\'s untimely death, %name% still sought to see the young man\'s vision through. He is an ardent believer in the Oaths and can be frequently found idolizing and commemorating Young Anselm\'s skull.}";
            bros[1].setPlaceInFormation(5);
            items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
            items.equip(this.new("scripts/items/helmets/adorned_closed_flat_top_with_mail"));
            items.equip(this.new("scripts/items/armor/adorned_warriors_armor"));
            items.equip(this.new("scripts/items/weapons/arming_sword"));
            local shield = this.new("scripts/items/shields/heater_shield");
            shield.onPaintInCompanyColors();
            items.equip(shield);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.addMoralReputation(10.0);

            if (!this.Const.DLC.Desert)
            {
                this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 27);
            }

            this.World.Assets.m.Money = this.World.Assets.m.Money - 1000;
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 2;
            this.World.Assets.m.Ammo = this.World.Assets.m.Medicine / 2;
        }

    });

	::mods_hookExactClass("scenarios/world/ptr_swordmaster_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local bro;
            bro = roster.create("scripts/entity/tactical/player");
            bro.setStartValuesEx([
                "ptr_swordmaster_commander_background"
            ], true, -1, true, 2); //skills on start
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
    });

	::mods_hookExactClass("scenarios/world/raiders_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 4; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "barbarian_background"
            ]);
            bros[0].getBackground().m.RawDescription = "A sturdy warrior, %name% has been through many campaigns of raiding and pillaging. Although a man of few words, the raider is an absolutely vicious specimen in battle. Even for a raider, what he does to defeated villagers irks many. It is likely he came with you to satiate his more sadistic lusts.";
            bros[0].improveMood(1.0, "Had a successful raid");
            bros[0].setPlaceInFormation(3);
            bros[0].EL_setLevel(3);
            local items = bros[0].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            local warhound = this.new("scripts/items/accessory/warhound_item");
            warhound.m.Name = "Fenrir the Warhound";
            items.equip(warhound);

            if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
            {
                local armor = this.new("scripts/items/legend_armor/cloth/legend_sackcloth");
                local plate = this.new("scripts/items/legend_armor/plate/legend_reinforced_animal_hide_armor");
                armor.setUpgrade(plate);
                items.equip(armor);
            }
            else
            {
                items.equip(this.new("scripts/items/armor/barbarians/reinforced_animal_hide_armor"));
            }

            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "barbarians/bear_headpiece"
                ]
            ]));
            bros[1].setStartValuesEx([
                "barbarian_background"
            ]);
            bros[1].getBackground().m.RawDescription = "%name% was a boy when taken from a southern village and raised amongst the barbarians of the wastes. While he learned the language and culture, he never fit in and was a constant victim of cruel jokes and games. You are not sure if he has followed you to return home or to get away from his northern \'family\'.";
            bros[1].improveMood(1.0, "Had a successful raid");
            bros[1].setPlaceInFormation(4);
            bros[1].EL_setLevel(3);
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));

            if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
            {
                local armor = this.new("scripts/items/legend_armor/cloth/legend_sackcloth");
                local plate = this.new("scripts/items/legend_armor/plate/legend_scrap_metal_armor");
                armor.setUpgrade(plate);
                items.equip(armor);
            }
            else
            {
                items.equip(this.new("scripts/items/armor/barbarians/scrap_metal_armor"));
            }

            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "barbarians/leather_headband"
                ]
            ]));
            bros[2].setStartValuesEx([
                "barbarian_background"
            ]);
            bros[2].getBackground().m.RawDescription = "Barbarian raiders often take from lands foreign to them. Most see their raids as a matter of material and women, but occasionally they will enslave formidable boys with great potential. %name%, a northerner, was such a child and he was raised to be a raider himself. Half his life was with his primitive clan, and the other half with those who took him. This has made him as hardy and brutish a warrior as one can get.";
            bros[2].improveMood(1.0, "Had a successful raid");
            bros[2].setPlaceInFormation(5);
            bros[2].EL_setLevel(3);
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));

            if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
            {
                local armor = this.new("scripts/items/legend_armor/cloth/legend_sackcloth_patched");
                local plate = this.new("scripts/items/legend_armor/plate/legend_hide_and_bone_armor");
                armor.setUpgrade(plate);
                items.equip(armor);
            }
            else
            {
                items.equip(this.new("scripts/items/armor/barbarians/hide_and_bone_armor"));
            }

            items.equip(this.Const.World.Common.pickHelmet([
                [
                    1,
                    "barbarians/leather_helmet"
                ]
            ]));
            bros[3].setStartValuesEx([
                "monk_background"
            ]);
            bros[3].getBackground().m.RawDescription = "The man who put you on the path, you believe %name% may serve some greater role to your attaining immense treasures. You have seen northern gimps and one-armed men who would best him in combat, but his knowledge and intelligence may be sharper blades in good time.";
            bros[3].improveMood(2.0, "Thinks he managed to convince you to give up raiding and pillaging");
            bros[3].setPlaceInFormation(13);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.addMoralReputation(-30.0);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/goat_cheese_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/smoked_ham_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/loot/silverware_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/loot/silver_bowl_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money / 2;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo / 2;
        }
    });

	::mods_hookExactClass("scenarios/world/rangers_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 3; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            local talents;
            bros[0].setStartValuesEx([
                "hunter_background"
            ]);
            bros[0].getBackground().m.RawDescription = "{A bit of a devious runt, though a good person at heart. %name% used to hunt for the local liege, but when the nobleman died falling into an unseen ravine the hunter was blamed and kicked out of court. With some guile, %name% turned hunting talents into poaching and fur trade. Has a merchant\'s mind and was quick to engender the idea of mercenary work because of it.}";
            bros[0].setPlaceInFormation(3);
            bros[1].setStartValuesEx([
                "poacher_background"
            ]);
            bros[1].getBackground().m.RawDescription = "{%name% fell into poaching after a drought ravaged the personal farmstead. Like most poachers, %name% is not truly of the criminal mind. Long grouped together in the hunting gangs, the poacher was quick to nominate you as captain of the new sellsword outfit.}";
            bros[1].setPlaceInFormation(4);
            local items = bros[1].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/short_bow"));
            items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
            bros[2].setStartValuesEx([
                "poacher_background"
            ]);
            bros[2].getBackground().m.RawDescription = "{A former jester whose gag was to shoot three water jugs out of the sky. You do not know how %name% got into poaching and you sense bitterness about some jester-related drama, but an excellent archer nonetheless. Likes to pretend being a far better shot than you. Nonsense, of course.}";
            bros[2].setPlaceInFormation(5);
            local items = bros[2].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
            items.equip(this.new("scripts/items/weapons/legend_slingstaff"));
            this.World.Flags.set("HasLegendCampHunting", true);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/cured_venison_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/furs_item"));
            this.World.Assets.m.ArmorParts = this.World.Assets.m.ArmorParts / 2;
            this.World.Assets.m.Ammo = this.World.Assets.m.Ammo * 2;
        }
    });

	::mods_hookExactClass("scenarios/world/sato_escaped_slaves_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();

            for( local i = 0; i < 5; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "slave_background"
            ]);
            bros[0].getBackground().m.RawDescription = "%name% was a sellsword like yourself before being enslaved and made a pit fighter. The arena was where you first met, the two of you saving each other several times in a bout against an unhold. You have been as close as siblings ever since. When you escaped, %name% was the first to pick up arms and follow and you know %name% will be the last to put them down, too.";
            bros[0].getBackground().buildDescription(true);
            bros[0].setPlaceInFormation(1);
            bros[0].addLightInjury();
            bros[0].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            this.setRetireText(bros[0]);
            local skills = bros[0].getSkills();
            skills.removeByID("trait.dastard");
            skills.removeByID("trait.craven");
            skills.removeByID("trait.fainthearted");
            skills.removeByID("trait.insecure");
            skills.removeByID("trait.fragile");

            if (bros[0].getBaseProperties().Bravery <= 30)
            {
                bros[0].getBaseProperties().Bravery += 5;
            }

            bros[0].getSkills().add(this.new("scripts/skills/traits/sato_brothers_in_chains_trait"));
            bros[0].getSkills().add(this.new("scripts/skills/traits/arena_fighter_trait"));
            bros[0].getFlags().set("ArenaFightsWon", 5);
            bros[0].getFlags().set("ArenaFights", 5);
            bros[0].improveMood(2.5, "Escaped a life of slavery");
            local items = bros[0].getItems();
            this.addRandomEquipment(items);
            bros[1].setStartValuesEx([
                "slave_barbarian_background"
            ]);
            bros[1].getBackground().m.RawDescription = "A truly massive figure, %name% hulks like a boulder and has a face about as pretty. The night you escaped, you personally witnessed the savage rip a nomad\'s arm out of its socket and beat an ifrit to rubble with it. When you asked the barbarian what the newly-earned freedom meant, %name% simply responded  \'I must slay a god. Fight with you for now.\' You decided it was prudent not to press for details.";

            if (this.Math.rand(1, 100 <= 50))
            {
                local potentialTitles = [
                    "the Quiet",
                    "the Reticent",
                    "the Silent",
                    "the Cursed"
                ];
                bros[1].setTitle(potentialTitles[this.Math.rand(0, potentialTitles.len() - 1)]);
            }

            bros[1].getBackground().buildDescription(true);
            bros[1].setPlaceInFormation(2);
            bros[1].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            this.setRetireText(bros[1]);
            skills.removeByID("trait.fragile");
            bros[1].getSkills().removeByID("trait.tiny");
            bros[1].getSkills().add(this.new("scripts/skills/traits/huge_trait"));
            bros[1].getSkills().add(this.new("scripts/skills/traits/sato_brothers_in_chains_trait"));

            bros[1].improveMood(2.5, "Escaped a life of slavery");
            local items = bros[1].getItems();
            this.addRandomEquipment(items);
            bros[2].setStartValuesEx([
                "slave_southern_background"
            ]);
            bros[2].getBackground().m.RawDescription = "Formerly a gunner in a city-state regiment, %name% has never quite fit in with the rest of the Indebted. Cast out of the army and branded a heretic for some religious slight %name% refuses to talk about. The gunner was relegated to a disdained social strata and never managed to truly lose that distaste. Regardless, %name% is one of you now and shows enough talent that you are willing to overlook that personality.";
            bros[2].getBackground().buildDescription(true);
            bros[2].setPlaceInFormation(3);
            bros[2].addLightInjury();
            bros[2].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            this.setRetireText(bros[2]);
            bros[2].getSkills().add(this.new("scripts/skills/traits/sato_brothers_in_chains_trait"));
            bros[2].worsenMood(0.5, "Misses life in the army");
            bros[2].improveMood(2.5, "Escaped a life of slavery");
            local items = bros[2].getItems();
            this.addRandomEquipment(items);
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            items.equip(this.Const.World.Common.pickHelmet([
                [
                    5,
                    "oriental/gunner_hat"
                ]
            ]));
            bros[3].setStartValuesEx([
                "slave_southern_background"
            ]);
            bros[3].getBackground().m.RawDescription = "If you had to describe %name% in one word, it would be \'ornery.\' Bitter about life before becoming indebted, bitter about life as a slave, and now bitter about life on the run. Perhaps that bitterness is what compels %name% to cling to life so, having taken enough lashings and beatings for three men, endured punishments meant to kill and even gotten back up after catching an ifrit toss square in the chest. %name% is pretty bitter about that one, too.";
            bros[3].getBackground().buildDescription(true);
            bros[3].setPlaceInFormation(4);
            bros[3].addInjury(this.Const.Injury.Brawl);
            bros[3].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            this.setRetireText(bros[3]);
            bros[3].getSkills().add(this.new("scripts/skills/traits/survivor_trait"));
            bros[3].getSkills().add(this.new("scripts/skills/traits/sato_brothers_in_chains_trait"));
            bros[3].worsenMood(1.5, "Feels he deserves better in life");
            bros[3].improveMood(2.5, "Escaped a life of slavery");
            local items = bros[3].getItems();
            items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
            this.addRandomEquipment(items);
            bros[4].setStartValuesEx([
                "slave_southern_background"
            ]);
            bros[4].getBackground().m.RawDescription = "A scholar in a previous life, %name% was cast into slavery for research that was deemed offensive to the Gilder. The scholar accepted a new life with a grace few can muster. When the opportunity came to escape with you however, there was no hesitation, simply stating that this was the next fated path to take. It does not really make sense to you, but you do not care to debate after seeing the gruesome death of the conscript whose equipment %name% now wears.";
            bros[4].setTitle("the Sage");
            bros[4].getBackground().buildDescription(true);
            bros[4].setPlaceInFormation(5);
            bros[4].getSprite("miniboss").setBrush("bust_miniboss_indebted");
            this.setRetireText(bros[4]);

            bros[4].improveMood(2.5, "Escaped a life of slavery");
            bros[4].getSkills().add(this.new("scripts/skills/traits/sato_brothers_in_chains_trait"));
            local items = bros[4].getItems();
            this.addRandomEquipment(items, true);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/rice_item"));
            this.World.Assets.m.Money = this.Math.max(this.World.Assets.m.Money - 600, 150);
        }
    });

	::mods_hookExactClass("scenarios/world/trader_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 2; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.worsenMood(0.5, "Encountered another caravan slaughtered by greenskins");

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
                i = i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "legend_peddler_commander_background"
            ]);
            bros[0].setPlaceInFormation(4);
            bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
            bros[0].getFlags().set("IsPlayerCharacter", true);
            bros[0].getSprite("socket").setBrush("bust_base_caravan");
            bros[0].getSprite("miniboss").setBrush("bust_miniboss_trader");
            this.addScenarioPerk(bros[0].getBackground(), this.Const.Perks.PerkDefs.LegendPeaceful);
            bros[1].setStartValuesEx([
                "caravan_hand_background",
                "caravan_hand_southern_background"
            ]);
            bros[1].setPlaceInFormation(5);
            bros[1].getSprite("socket").setBrush("bust_base_caravan");
            bros[1].getBackground().m.RawDescription = "You found %name% being thrown out of a pub and at first glance thought that was little more than a drunken miscreant. But you watched as off three would-be muggers were soon on the ground. They still managed to take off with a coin purse in the end, sure, but they could not truly defeat %name%. Impressed, you took the newly-impoverished fighter on as a caravan hand.";
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/mead_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/amber_shards_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/cloth_rolls_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/dies_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/furs_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/trade/salt_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money * 3;
        }
    });

	::mods_hookExactClass("scenarios/world/trader_scenario", function(o){

        o.onSpawnAssets = function()
        {
            local roster = this.World.getPlayerRoster();
            local names = [];

            for( local i = 0; i < 3; i = i )
            {
                local bro;
                bro = roster.create("scripts/entity/tactical/player");
                bro.m.HireTime = this.Time.getVirtualTimeF();
                bro.worsenMood(0.5, "Lost most of the company");

                while (names.find(bro.getNameOnly()) != null)
                {
                    bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
                }

                names.push(bro.getNameOnly());
                i = ++i;
            }

            local bros = roster.getAll();
            bros[0].setStartValuesEx([
                "companion_1h_background"
            ]);
            bros[0].setPlaceInFormation(3);
            bros[1].setStartValuesEx([
                "companion_2h_background"
            ]);
            bros[1].setPlaceInFormation(4);
            bros[2].setStartValuesEx([
                "companion_ranged_background"
            ]);
            bros[2].setPlaceInFormation(5);
            this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
            this.World.Assets.m.Money = this.World.Assets.m.Money * 2;
        }

    });




});