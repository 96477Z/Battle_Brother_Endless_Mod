local gt = getroottable();

::mods_registerMod("el_adaption_events_events_legends", 1, "el_adaption_events_events_legends");
::mods_queue(null, "el_player_npc", function ()
{

    ::mods_hookExactClass("events/events/legends/legend_northmen_forest_ambush_event", function(o){

        o.create = function()
        {
            //this.logInfo("legend_northmen_forest_ambush_event create");

            this.m.ID = "event.legend_northmen_forest_ambush";
            this.m.Title = "In the forest...";
            this.m.Cooldown = 80.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_55.png[/img]The forests are a quiet place where civilisation gives way to nature — but also to those cast away from society or wish to exclude themselves from it.\n It would not be the first time you ran into {a troupe of otherwise peaceful poachers trying to make ends meet | a lone knight armed to the breeches with a variety of weapons and plate | a wildman completely naked with only their weapon for comfort | two-dozen cultists running about the hills screaming at the top of their lungs about this and that | a group of sickly explorers asking for directions | a well regulated militia | three imposing figures clad in gold | a group of well organised and terrifying cultists}. The world gets much stranger out here — but also much more dangerous.\n\n From the treeline, you hear voices and branches cracking.\n\n You hear the chanting of northmen.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Form up and be ready!",
                        function getResult( _event )
                        {
                            local r = this.Math.rand(1, 100);

                            if (r <= 65)
                            {
                                return "Lightpatrol";
                            }
                            else if (r <= 35)
                            {
                                return "Heavypatrol";
                            }
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Barbarian != null)
                    {
                        this.Options.push({
                            Text = "Our barbarian, %barbarian% wants to talk to them.",
                            function getResult( _event )
                            {
                                return "Barbarian";
                            }

                        });
                    }

                    if (_event.m.Wildman != null)
                    {
                        this.Options.push({
                            Text = "%wildman% is about to break into a berserk fury...",
                            function getResult( _event )
                            {
                                return "Wildman";
                            }

                        });
                    }

                    if (_event.m.MasterArcher != null)
                    {
                        this.Options.push({
                            Text = "It seems that our master archer, %masterarcher% has a plan.",
                            function getResult( _event )
                            {
                                return "MasterArcher";
                            }

                        });
                    }

                    if (_event.m.Assassin != null)
                    {
                        this.Options.push({
                            Text = "Our assassin, %assassin% has an idea...",
                            function getResult( _event )
                            {
                                return "Assassin";
                            }

                        });
                    }
                }

            });
            this.m.Screens.push({
                ID = "Lightpatrol",
                Text = "[img]gfx/ui/events/event_135.png[/img]You hold your ground as the party approaches, thankfully smaller than it sounded at a distance.\n The group sees your formation and weighs their options before streaming out from the secluded path they were once on towards you.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "To arms!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.BarbarianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            local dif = this.Math.rand(75, 110);
                            party.EL_setTroopsResourse(party.EL_getTroopsResourse() * dif * 0.01);
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Barbarians, dif * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }

                            this.World.State.startScriptedCombat(properties, false, false, true);
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                }

            });
            this.m.Screens.push({
                ID = "Heavypatrol",
                Text = "[img]gfx/ui/events/event_135.png[/img]You hold your ground and brace for a fight — the group you heard arrives into view and quickly retreats.\n\n As you wait to see if they left for good, another, much larger group looms over the hill and charges through the trees.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Oh fark.",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.BarbarianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            local dif = this.Math.rand(100, 140);
                            party.EL_setTroopsResourse(party.EL_getTroopsResourse() * dif * 0.01);
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Barbarians, dif * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            this.World.State.startScriptedCombat(properties, false, false, true);
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                }

            });
            this.m.Screens.push({
                ID = "Barbarian",
                Text = "[img]gfx/ui/events/event_139.png[/img]%barbarian% comes forward and asks for your permission to go parlay with the group of northmen. You approve and %barbarian% lays down their weapons and approaches the group. They speak in a tongue that you can\'t make out — but sounds almost ancient in nature. Words are exchanged between %barbarian% and the raid leader, who barely move between words while the rest of the warparty twitch and pace nervously near the two negotiators.\n\n Soon the raid leader slaps %barbarian% on the shoulder and beams a smile, but not before handing them a small wooden chest wrapped in leather.\n The raiding party departs in another direction, to which the northmen resume their chanting as they march. %barbarian% jogs back to you with the chest under their bulging arm as if they had stolen it. %SPEECH_ON%They\'re traders — or so they say. They have been walking around this patch of forest for hours now trying to find a camp of bandits that took out one of their caravans. I think they mistook you for the bandits.%SPEECH_OFF% %barbarian% taps the chest under their arm. %SPEECH_ON% However, it wasn\'t a total waste. They gave us this as said to be on our way. They didn\'t say sorry but believe me — we got off lightly...",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Well done.",
                        function getResult( _event )
                        {
                            this.World.Assets.addMoralReputation(1);
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Barbarian.getImagePath());
                    local bravery = this.Math.rand(2, 4);
                    _event.m.Barbarian.getBaseProperties().Bravery += bravery;
                    _event.m.Barbarian.getSkills().update();
                    this.List.push({
                        id = 16,
                        icon = "ui/icons/bravery.png",
                        text = _event.m.Barbarian.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery + "[/color] Resolve"
                    });
                    _event.m.Barbarian.improveMood(1.0, "prevented a bloodbath in the woods");
                    if(_event.m.Rewarditems != null) {
                        _event.m.Rewarditems.getItems().transferToStash(this.World.Assets.getStash());
                    }
                    local item = this.new("scripts/items/loot/looted_valuables_item");
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain " + item.getName()
                    });

                    if (_event.m.Barbarian.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Barbarian.getMoodState()],
                            text = _event.m.Barbarian.getName() + this.Const.MoodStateEvent[_event.m.Barbarian.getMoodState()]
                        });
                    }

                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases slightly for talking it out rather than resorting to violence"
                    });
                }

            });
            this.m.Screens.push({
                ID = "Wildman",
                Text = "[img]gfx/ui/events/event_86.png[/img]%wildman% surges forward like a dog unshackled and runs toward the noise. A forward scout crests the treeline and immediately receives a rock to the temple for their efforts. %wildman% begins to scream, or rather, continue to scream but louder as he beats the scout to death with a tree bough.\n\n A handful of warriors come over the crest in an attempt to figure out what kind of animal was dying to make such a noise. The first has their jaw broken by the now splintered tree bough while the second is wrestled to the floor by %wildman% and has their eyes gouged for good measure.\n\n The rest of %companyname% do not know whether to cheer on run but continue to watch in awe at the frenzied monster clubbing the third northman to death with a sharp rock.\n\n The rest of the patrol finally assemble and %wildman% regains their wits and beats a hasty retreat back to your formation. One of their victims was much better armoured than the rest and you suspect %wildman% just accidently killed their leader before the battle has even begun.\n The patrol\'s numbers have been thinned and your wildling has only a few scratches to show for it!",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "We better go help now.",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.BarbarianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            local dif = this.Math.rand(60, 75);
                            party.EL_setTroopsResourse(party.EL_getTroopsResourse() * dif * 0.01);
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Barbarians, dif * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            this.World.State.startScriptedCombat(properties, false, false, true);
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Wildman.getImagePath());
                    local bravery = this.Math.rand(4, 6);
                    _event.m.Wildman.getBaseProperties().Bravery += bravery;
                    _event.m.Wildman.getSkills().update();
                    this.List.push({
                        id = 16,
                        icon = "ui/icons/bravery.png",
                        text = _event.m.Wildman.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery + "[/color] Resolve"
                    });
                    _event.m.Wildman.improveMood(2.0, "Had a good time");
                    _event.m.Wildman.addLightInjury();

                    if (_event.m.Wildman.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Wildman.getMoodState()],
                            text = _event.m.Wildman.getName() + this.Const.MoodStateEvent[_event.m.Wildman.getMoodState()]
                        });
                    }
                }

            });
            this.m.Screens.push({
                ID = "MasterArcher",
                Text = "[img]gfx/ui/events/event_86.png[/img]%masterarcher% drops into a low crouch and whistles to you. They point with their eyes and motion with their head to a small clearing from an old path off the trail. You order %companyname% and the wagons to be moved into the pathway and any bright colours to be removed from their clothing and armour. The company complies and quietly funnels into the offshoot and down into a deep ditch behind the treeline.\n\n The ditch is damp and cold, but you can hear the patrol passing overhead — stomping and chanting as they make their way along the road. For a moment you think they have found the path, but it turns out a few of the raiding party chose to relieve themselves in the bushes nearby rather than invesigate further.\n After a short time later, the noise dies down and the company moves out, all while %masterarcher% is grinning ear to ear.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Nicely done.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.MasterArcher.getImagePath());
                    local bravery = this.Math.rand(2, 5);
                    local initiative = this.Math.rand(3, 6);
                    _event.m.MasterArcher.getBaseProperties().Bravery += bravery;
                    _event.m.MasterArcher.getBaseProperties().Initiative += initiative;
                    _event.m.MasterArcher.getSkills().update();
                    this.List.push({
                        id = 16,
                        icon = "ui/icons/bravery.png",
                        text = _event.m.MasterArcher.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery + "[/color] Resolve"
                    });
                    this.List.push({
                        id = 16,
                        icon = "ui/icons/initiative.png",
                        text = _event.m.MasterArcher.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative + "[/color] Initiative"
                    });
                    _event.m.MasterArcher.improveMood(1.0, "Evaded a patrol");

                    if (_event.m.MasterArcher.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.MasterArcher.getMoodState()],
                            text = _event.m.MasterArcher.getName() + this.Const.MoodStateEvent[_event.m.MasterArcher.getMoodState()]
                        });
                    }
                }

            });
            this.m.Screens.push({
                ID = "Assassin",
                Text = "[img]gfx/ui/events/event_76.png[/img]%assassin% appears behind you — almost quite literally as you did not detect they were there until they spoke into your ear. %SPEECH_ON% The northmen are a ragged bunch and don\'t take any caution when announcing their presence. They rely on that fear you see, the idea that they come as a wave and there is nothing you can do to stop them. But the predator often does not take the caution it should because it does not expected to be hunted by something bigger...%SPEECH_OFF% %assassin% was being their usual strange self again. But you nod and play along for now. %SPEECH_ON% ...all we need is to take a wide angle around the forward scouts and come up on them from behind. We can steadily pick them off and encircle them.%SPEECH_OFF% You approve, and %companyname% splits into groups or single entities ordered to attack for a specific direction. %assassin% orchestrates between all the groups and you follow them as part of the plan.\n\n %assassin% brings down some of the more armoured opponents with ease, while you do the same in a messier manner. After a short time the scouts have all been dealt with and the barbarians that have wandered from the column are also picked off and hidden in the brush.\n After a time the group has noticed most of their force has gone, but at this point it is too late to react as the rest find themselves hopelessly encircled — much to the enjoyment of your assassin.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "To arms!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.BarbarianTracks;
                            properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Circle;
                            properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Center;
                            properties.LocationTemplate.Fortification = this.Const.Tactical.FortificationType.None;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            local dif = this.Math.rand(60, 70);
                            party.EL_setTroopsResourse(party.EL_getTroopsResourse() * dif * 0.01);
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Barbarians, dif * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            this.World.State.startScriptedCombat(properties, false, false, true);
                            return 0;
                        }

                        function onEntityPlaced( _entity, _tag )
                        {
                            _entity.setMoraleState(this.Const.MoraleState.Fleeing);
                            _entity.getBaseProperties().Bravery = 50;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Assassin.getImagePath());
                    local bravery = this.Math.rand(4, 7);
                    local initiative = this.Math.rand(3, 6);
                    _event.m.Assassin.getBaseProperties().Bravery += bravery;
                    _event.m.Assassin.getBaseProperties().Initiative += initiative;
                    _event.m.Assassin.getSkills().update();
                    this.List.push({
                        id = 16,
                        icon = "ui/icons/bravery.png",
                        text = _event.m.Assassin.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + bravery + "[/color] Resolve"
                    });
                    this.List.push({
                        id = 16,
                        icon = "ui/icons/initiative.png",
                        text = _event.m.Assassin.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative + "[/color] Initiative"
                    });
                    _event.m.Assassin.improveMood(1.0, "Outsmarted a raiding party");

                    if (_event.m.Assassin.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Assassin.getMoodState()],
                            text = _event.m.Assassin.getName() + this.Const.MoodStateEvent[_event.m.Assassin.getMoodState()]
                        });
                    }
                }

            });
        }


    });

    ::mods_hookExactClass("events/events/legends/legend_swordmaster_fav_enemy_event", function(o){

        o.create = function()
        {
            //this.logInfo("legend_swordmaster_fav_enemy_event create");

            this.m.ID = "event.legend_swordmaster_fav_enemy";
            this.m.Title = "As you approach...";
            this.m.Cooldown = 45.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A1",
                Text = "[img]gfx/ui/events/event_144.png[/img]{You discover a cave in the ice with its maw shielded by a gate of thick icicles. Looking through the icy bars, you find the cave quickly declines down a steep slope and toward what may be an underground riverbank that has long since frozen. Something is huddled beside it hitting the ice with a pickaxe over and over again. The wind whistles as it grates against the teeth of the cave. You call out to the huddled man, but there is no response.\n\nIt will take some time to chop through this thick ice and get in there. Fortunately, one of the sellswords reports that there may be a rear entrance. It is blocked just as well, but a strong enough man just might be able to squeeze through and face any dangers within.}",
                Image = "",
                List = [],
                Characters = [],
                Options = [],
                function start( _event )
                {
                    _event.m.Title = "As you approach...";

                    foreach( bro in _event.m.Candidates )
                    {
                        _event.m.Candidates.sort(function ( _a, _b )
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
                    }

                    local e = this.Math.min(4, _event.m.Candidates.len());

                    for( local i = 0; i < e; i = i )
                    {
                        local bro = _event.m.Candidates[i];
                        this.Options.push({
                            Text = "I need you to scout ahead, " + bro.getName() + ".",
                            function getResult( _event )
                            {
                                _event.m.Champion = bro;
                                return "B";
                            }

                        });
                          // [041]  OP_CLOSE          0      4    0    0
                        i = ++i;
                    }

                    this.Options.push({
                        Text = "We should leave this place.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    });
                    _event.m.Champion = _event.m.Candidates[this.Math.rand(0, _event.m.Candidates.len() - 1)];
                    _event.m.Flags.set("EnemyChampionName", this.Const.Strings.BarbarianNames[this.Math.rand(0, this.Const.Strings.BarbarianNames.len() - 1)] + " " + this.Const.Strings.BarbarianTitles[this.Math.rand(0, this.Const.Strings.BarbarianTitles.len() - 1)]);
                }

            });
            this.m.Screens.push({
                ID = "A2",
                Text = "[img]gfx/ui/events/event_134.png[/img]{Marching through countryside. Your feet are still tired from the strain of the last few days. Your marching is interrupted by a lean, young and eager looking fellow.%SPEECH_ON%Stop right there, rabble!%SPEECH_OFF% He shouts to you and your company. Slightly confused, your mercenaries throw glances to each other, raising their shoulders. %randombrother% replies, slightly amused.%SPEECH_ON%What in the hells do you think you´re doing, little wanker? Those rabble you\'re talking to will cut your throat just for fun. Didn\'t your parents teach you any common sense?%SPEECH_OFF%Carelessly, the young fellow proceeds. %SPEECH_ON%My name is %enemyname%. Looks like it is I who will have to teach you some common sense. It is I who decide which throats get cut! One more insolent comment like that from any of you, and I\'ll have you all hanged!%SPEECH_OFF% Your mercenaries start to fall in laughter. %randombrother2% replies with an angry voice. %SPEECH_ON% Ha. You? I don\'t see your army. Or is it the lordship himself, which wants to do all the dirty work, hm? Come here and try me.%SPEECH_OFF% %enemyname% answers. %SPEECH_ON% It is not you I want to fight. It is %chosen%. I heard he\'s a good fighter. I want to beat him. In the glory of my name, I demand a fight to life or death!%SPEECH_OFF% The haughty juvenile raises his weapon, pointing it toward %chosen%. \n\n Despite the fact that a couple meters separates the %enemyname% and %chosen%, you can feel the tension in the air.}",
                Image = "",
                List = [],
                Characters = [],
                Options = [],
                function start( _event )
                {
                    _event.m.Title = "While marching...";

                    foreach( bro in _event.m.Candidates )
                    {
                        _event.m.Candidates.sort(function ( _a, _b )
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
                    }

                    local e = this.Math.min(4, _event.m.Candidates.len());

                    for( local i = 0; i < e; i = i )
                    {
                        local bro = _event.m.Candidates[i];
                        this.Options.push({
                            Text = "Alright, teach this little wanker a lesson " + bro.getName() + ".",
                            function getResult( _event )
                            {
                                _event.m.Champion = bro;
                                return "N";
                            }

                        });
                          // [041]  OP_CLOSE          0      4    0    0
                        i = ++i;
                    }

                    this.Options.push({
                        Text = "Leave him alone. Slaughtering a kid wont bring us any fame.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    });
                    _event.m.Champion = _event.m.Candidates[this.Math.rand(0, _event.m.Candidates.len() - 1)];
                    _event.m.Flags.set("EnemyChampionName", this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]);
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "[img]gfx/ui/events/event_144.png[/img]{%chosen% heads off while you and the rest work on the front of the cave. You knock a few of the thick icicles out letting you see into the cave with better eyes. Just as you do, %chosen% comes tumbling down an adjacent slope and lands right in the middle of the cave and slides across the frozen river and rides up its embankment. He hops to his feet and dusts himself off with a childish grin.\n\n In a flash the huddled man slams the pickaxe into the ice with unhinted power and the shards splinter from one side of the embankment to the other. The clank of the metal and shattered ice reverberates as though lightning itself had struck. Now you can finally see the stranger: he is a barbarian shelled in broken armor that rattles as he moves. The icy walls mirror his steps, scattering his presence all around the cave in transient sheens. Jittery and jutting, his walk is seemingly going backwards despite his advance as though his shadow were his true self and his flesh the afterimage. Despite being in a cave, his loud voice echoes not at all.%SPEECH_ON%An interloper in my midst, a mere moment from the mist, these things I shall not miss.%SPEECH_OFF%He approaches the sellsword like a cold spider unfurling from its trapdoor. You see that his face is half-frozen, and a wry smile squeezes across the half that could still be called flesh.%SPEECH_ON%I long to leave this body, my dear fighter. Will you help guide me out and to something higher?%SPEECH_OFF%}",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "",
                        function getResult( _event )
                        {
                            local name = _event.m.Flags.get("EnemyChampionName");
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.Music = this.Const.Music.BarbarianTracks;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            party.EL_setHaveRandomLeader(false);
                            party.EL_setHaveStrongestLeader(false);
                            party.EL_setTroopsResourse(0);
                            properties.Parties.push(party);
                            this.Const.World.Common.addTroop(party, {
                                Type = this.Const.World.Spawn.Troops.BarbarianChampion
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

                                for( local x = 0; x < size.X; x = x )
                                {
                                    for( local y = 0; y < size.Y; y = y )
                                    {
                                        local tile = this.Tactical.getTileSquare(x, y);
                                        tile.Level = this.Math.min(1, tile.Level);
                                        y = ++y;
                                        y = y;
                                    }

                                    x = ++x;
                                    x = x;
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
                    this.Options[0].Text = "You can take him, %chosen%!";
                    this.Characters.push(_event.m.Champion.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "N",
                Text = "[img]gfx/ui/events/event_35.png[/img]{%chosen% heads off to confront %enemyname% while the rest of the company observes from a distance.}",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "",
                        function getResult( _event )
                        {
                            local r = this.Math.rand(0, 2);
                            local name = _event.m.Flags.get("EnemyChampionName");
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.Music = this.Const.Music.NobleTracks;
                            properties.Entities = [];

                            if (r == 0)
                            {
                                local party = this.new("scripts/entity/world/party");
                                party.EL_setFaction(this.Const.Faction.Enemy);
                                party.EL_tempPartyInit();
                                party.EL_setHaveRandomLeader(false);
                                party.EL_setHaveStrongestLeader(false);
                                party.EL_setTroopsResourse(0);
                                properties.Parties.push(party);
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.Swordmaster
                                }, false);

                                foreach(troop in party.getTroops()) {
                                    properties.Entities.push(troop);
                                }

                            }

                            if (r == 1)
                            {
                                local party = this.new("scripts/entity/world/party");
                                party.EL_setFaction(this.Const.Faction.Enemy);
                                party.EL_tempPartyInit();
                                party.EL_setHaveRandomLeader(false);
                                party.EL_setHaveStrongestLeader(false);
                                party.EL_setTroopsResourse(0);
                                properties.Parties.push(party);
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.BanditLeader
                                }, false);

                                foreach(troop in party.getTroops()) {
                                    properties.Entities.push(troop);
                                }

                            }

                            if (r == 2)
                            {
                                local party = this.new("scripts/entity/world/party");
                                party.EL_setFaction(this.Const.Faction.Enemy);
                                party.EL_tempPartyInit();
                                party.EL_setHaveRandomLeader(false);
                                party.EL_setHaveStrongestLeader(false);
                                party.EL_setTroopsResourse(0);
                                properties.Parties.push(party);
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.HedgeKnight
                                }, false);

                                foreach(troop in party.getTroops()) {
                                    properties.Entities.push(troop);
                                }
                            }

                            properties.Players.push(_event.m.Champion);
                            properties.IsUsingSetPlayers = true;
                            properties.IsFleeingProhibited = true;
                            properties.IsAttackingLocation = true;
                            properties.BeforeDeploymentCallback = function ()
                            {
                                local size = this.Tactical.getMapSize();

                                for( local x = 0; x < size.X; x = x )
                                {
                                    for( local y = 0; y < size.Y; y = y )
                                    {
                                        local tile = this.Tactical.getTileSquare(x, y);
                                        tile.Level = this.Math.min(1, tile.Level);
                                        y = ++y;
                                        y = y;
                                    }

                                    x = ++x;
                                    x = x;
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
                    _event.m.Title = "The duel!";
                    this.Options[0].Text = "You can take him, %chosen%!";
                    this.Characters.push(_event.m.Champion.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "Victory",
                Text = "[img]gfx/ui/events/event_96.png[/img]{%chosen% stands victorious over a badly wounded %enemyname%. The defeated nobleman can barely catch his breath. Every gasp of air comes with great pain for him. Bleeding and shaking, he is soon to depart from the world of the living. The duel was meant to be to the death but %chosen% does not deliver a final blow. The rest of your mercenaries gather around the winner. Most of the company is cheering the now glorious %chosen%, but some are more concerned about the unfinished business laying on the ground in a pool of his own blood. %randombrother% speaks up with strong contempt for the loser of this duel. %SPEECH_ON%What you waiting for %chosen%? You think this whipster would show you mercy?%SPEECH_OFF% The company champion answers. %SPEECH_ON%I will take his equipment as a reward, he\'s no good to me dead.%SPEECH_OFF% }",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "You did well, %chosen%.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    _event.m.Title = "After the battle...";
                    this.Characters.push(_event.m.Champion.getImagePath());
                    this.World.Assets.addBusinessReputation(50);
                    this.List = [
                        {
                            id = 10,
                            icon = "ui/icons/special.png",
                            text = "The company gained renown"
                        }
                    ];

                    if (_event.m.Champion.getBaseProperties().MeleeSkill < 100)
                    {
                        local meleeSkill = this.Math.rand(1, 3);
                        _event.m.Champion.getBaseProperties().MeleeSkill += meleeSkill;
                        _event.m.Champion.improveMood(0.5, "Improved his skills though duel");
                        this.List.push({
                            id = 16,
                            icon = "ui/icons/melee_skill.png",
                            text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + meleeSkill + "[/color] Melee Skill"
                        });
                    }

                    if (_event.m.Champion.getBaseProperties().MeleeDefense < 50)
                    {
                        local meleeDefense = this.Math.rand(1, 3);
                        _event.m.Champion.getBaseProperties().MeleeDefense += meleeDefense;
                        _event.m.Champion.improveMood(0.5, "Improved his skills though duel");
                        this.List.push({
                            id = 17,
                            icon = "ui/icons/melee_defense.png",
                            text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + meleeDefense + "[/color] Melee Defense"
                        });
                    }

                    if (_event.m.Champion.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Champion.getMoodState()],
                            text = _event.m.Champion.getName() + this.Const.MoodStateEvent[_event.m.Champion.getMoodState()]
                        });
                    }

                    _event.m.Champion.getSkills().update();
                    local playerRoster = this.World.getPlayerRoster().getAll();

                    foreach( bro in playerRoster )
                    {
                        if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Combat) && this.Math.rand(1, 100) <= 33)
                        {
                            bro.improveMood(0.5, "The company\'s champion won an impressive duel");
                        }

                        if (bro.getMoodState() > this.Const.MoodState.Neutral)
                        {
                            this.List.push({
                                id = 10,
                                icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                            });
                        }
                    }
                }

            });
            this.m.Screens.push({
                ID = "Defeat",
                Text = "[img]gfx/ui/events/event_58.png[/img]{%enemyname% emerges victorious from the duel. Winning this fight made him even more eager and confident. Looks like he wants to fight everybody in the company, one by one. With a voice full of pride he shouts to your men. %SPEECH_ON%Who\'s  next ?!%SPEECH_OFF% }",
                Image = "",
                List = [],
                Characters = [],
                Options = [],
                function start( _event )
                {
                    _event.m.Title = "After the battle...";

                    foreach( bro in _event.m.Candidates )
                    {
                        _event.m.Candidates.sort(function ( _a, _b )
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
                    }

                    local e = this.Math.min(4, _event.m.Candidates.len());

                    for( local i = 0; i < e; i = i )
                    {
                        local bro = _event.m.Candidates[i];
                        this.Options.push({
                            Text = "I need you to avenge us, " + bro.getName() + ".",
                            function getResult( _event )
                            {
                                _event.m.Champion = bro;
                                return "N";
                            }

                        });
                          // [041]  OP_CLOSE          0      4    0    0
                        i = ++i;
                    }

                    this.Options.push({
                        Text = "This isn\'t worth it. We should leave.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    });
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_144.png[/img]{As you depart the cave, a local northerner covered in bear furs stands across the company. He looks at you and then the cave entrance. He asks.%SPEECH_ON%Do you speak the southern or native tongue?%SPEECH_OFF%Keeping your guard, you confirm the former. He nods.%SPEECH_ON%And what did you see in that cave? Did you see it?%SPEECH_OFF%You tell him you found nothing, only a madman. The stranger smirks.%SPEECH_ON%A madman. A madman, that is what you think you saw. It is within us all to speak warily of the unnatural, but not within us to recognize when nature herself takes a step back. Horrors are easier said than seen. That was no ordinary man, you fool, but the Ijirok, a transient spirit that shifts from one vessel to another. No one really knows what it looks like, the whole world is simply a series of masks and it will happily go from one to the other, usually taking the shape of animals, sometimes a man if he is so weak. It is a being of absolute malice. It cannot be killed, no, it sees death, even its own, as entertainment. It remembers those who escape it, it remembers those it wishes to play with. I pray you\'ve a face worth forgetting.%SPEECH_OFF%You put your hand on the pommel of your sword and tell him that whatever mysticism and mythmaking he\'s got left he can keep to himself. You saw the madman in the cave, and that\'s all he was, a man. The stranger nods again and backs off.%SPEECH_ON%As you wish, and may you travel well.%SPEECH_OFF%} ",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Travel well.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    _event.m.Title = "After the battle...";
                }

            });
        }



    });



});
