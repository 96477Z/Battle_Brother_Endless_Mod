local gt = getroottable();

::mods_registerMod("el_adaption_events_events", 1, "el_adaption_events_events");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("events/events/come_across_ritual_event", function(o){

        o.create = function()
        {
            //this.logInfo("come_across_ritual_event create");

            this.m.ID = "event.come_across_ritual";
            this.m.Title = "Along the way...";
            this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_33.png[/img]It\'s not a rare sight to find a dead body on your journey. This one, though, is rather unusual. %randombrother% takes a long look.%SPEECH_ON%What\'s that on his chest?%SPEECH_OFF%You crouch down and throw back the corpse\'s shirt. Scars run lengthwise all about his body, drawn in very familiar shapes: forests, rivers, mountains. %randombrother% walks up.%SPEECH_ON%Ain\'t that a sight. Wolves do that or something?%SPEECH_OFF%You stand back up.%SPEECH_ON%I think he did it to himself.%SPEECH_OFF%Bloody footprints lead away from the scene...",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Let\'s follow these footprints.",
                        function getResult( _event )
                        {
                            return "Arrival";
                        }

                    },
                    {
                        Text = "This doesn\'t concern us.",
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
                ID = "Arrival",
                Text = "[img]gfx/ui/events/event_140.png[/img]As you follow the foosteps, you begin to hear the murmurs of a chant. You tell the company to rest while you sneak forward, eventually finding a large bonfire with cloaked men circling around it. They stomp their feet and throw their hands up, shouting some token words to their elder god, Davkul. It\'s a bestial ceremony, roaring and growling abound, and the men dance about with their oversized clothes like darkly spirits still angry at the world they\'d departed. %randombrother% crawls up beside you and shakes his head.%SPEECH_ON%Just what is going on down there? What should we do?%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "We need to stop this now. Attack!",
                        function getResult( _event )
                        {
                            return "Attack1";
                        }

                    },
                    {
                        Text = "Let\'s wait and see what happens.",
                        function getResult( _event )
                        {
                            return "Observe1";
                        }

                    },
                    {
                        Text = "Time to leave. Now.",
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
                ID = "Observe1",
                Text = "[img]gfx/ui/events/event_140.png[/img]You decide to wait it out and see what happens. Just as you say that, the cultists drag an old man before the fire. He bows his head before the flames, opens his arms, and then falls in. There are no screams. Another man is pulled forward. He whispers words to a cultist, they both nod, and so too this man puts himself to the flame. A third is pushed forth, but unlike the others he is shackled and wild-eyed. He screams at the cultists.%SPEECH_ON%Fark your god, he means nothing! It\'s all a lie!%SPEECH_OFF%A face appears in the flames, its shape bulbous and churning in the smoke and fire. It is cruelty embodied, and could be no better painted by flames than by darkness itself. It turns and grins. One of the cultist shouts.%SPEECH_ON%Davkul awaits you!%SPEECH_OFF%But the prisoner kicks one of his imprisoners and tries to make a run for it.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "I\'ve seen enough. We need to help him, now!",
                        function getResult( _event )
                        {
                            return "Attack2";
                        }

                    },
                    {
                        Text = "Hold on, let\'s see what happens next.",
                        function getResult( _event )
                        {
                            return "Observe2";
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Cultist != null)
                    {
                        this.Options.push({
                            Text = "%cultist%, is this not your cult?",
                            function getResult( _event )
                            {
                                return "Cultist";
                            }

                        });
                    }

                    this.Options.push({
                        Text = "Time to leave. Now.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    });
                }

            });
            this.m.Screens.push({
                ID = "Observe2",
                Text = "[img]gfx/ui/events/event_140.png[/img]You decide to wait and see what happens. The bonfire\'s face returns, a great magmatic maw opening up as the chained man is pushed forward. He screams and bends backward, but it\'s no use. His clothes burn away and the tatters fly backward in flailing orange ruin. His skin peels as though it were not fire, but a thousand scalpels running across his body. By sharpened white fire he is flayed. His skull is bored out, wriggling and shaking like a snake shedding its skin, and his eyes remain forever seeing though the rest of his body is stripped away by flesh and organs and bones. When he is but a skull with eyes, the face in the fire closes its mouth and the great howls of the sacrifice come to a snapping silence. The bonfire dies out in an instant, and the man, or what\'s left of him, falls to the earth. The eyes burn bright, slowly fading like a cooling hot iron.\n\n One of the cultists bends down and picks up the skull. He easily cracks it in half, dropping the brainpan while holding onto what used to be a face. As he holds the remains outward, the bones blacken and invert, creating a cruel visage of utter darkness wreathed by a rim of bone. He puts it on and begins to leave.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Now we attack!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            for( local i = 0; i < 25; i = i )
                            {
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.Cultist
                                }, false);
                                i = ++i;
                            }
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }


                            properties.Loot = [
                                this.Const.World.Common.pickHelmet([
                                    [
                                        1,
                                        "legendary/mask_of_davkul"
                                    ]
                                ])
                            ];
                            this.World.State.startScriptedCombat(properties, false, false, true);
                            return 0;
                        }

                    },
                    {
                        Text = "We leave as well.",
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
                ID = "Cultist",
                Text = "[img]gfx/ui/events/event_140.png[/img]You ask %cultist% if he can do anything. He simply walks past you and down the hill. The group of cultists turn and look to him. He walks through the crowd to the prisoner. They talk. He whispers, the prisoner nods. When they finish, the %cultist% nods to the crowd of cultists. One member steps forward, disrobes, and pitches himself into the fire, screamless and without protest. Another cultist pitches a rake into the flames, tearing something out of it and handing it over to %cultist%. The prisoner, his life ostensibly spared in an exchange, is freed and you watch as %cultist% grabs him and takes him back up the hill. He pushes the man forward as he speaks.%SPEECH_ON%You have taken from Davkul, but the debt is paid.%SPEECH_OFF%You ask what it is he has in his hand. The cultist holds up what had been retrieved from the flames. It is a skull patched over in leathered flesh, and stretched taut over its face is a freshly singed visage, presumably of the man who had tossed himself into the fire. Slight hints of his face twist and turn, his mouth wringed ajar, misshapen by a cruel and murmuring darkness. Still holding it aloft like a native showing off a prized scalp, %cultist% speaks bluntly.%SPEECH_ON%Davkul awaits us all.%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "What\'s this?",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.Assets.addMoralReputation(-5);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation decreases greatly"
                    });
                    this.Characters.push(_event.m.Cultist.getImagePath());
                    this.World.Assets.getStash().makeEmptySlots(1);
                    local item = this.Const.World.Common.pickHelmet([
                        [
                            1,
                            "legendary/mask_of_davkul"
                        ]
                    ]);
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain " + item.getName()
                    });
                }

            });
            this.m.Screens.push({
                ID = "Attack1",
                Text = "[img]gfx/ui/events/event_140.png[/img]You give the order to attack. Your men arm themselves and rush forward. The fire dies in an instant, swirling down to nothing but ash which plumes out in a great cloud. Once it is gone, the eerie crowd opens their arms and speak in unison.%SPEECH_ON%Davkul awaits. Come and greet him.%SPEECH_OFF%",
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
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            for( local i = 0; i < 25; i = i )
                            {
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.Cultist
                                }, false);
                                i = ++i;
                            }
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
                    this.World.Assets.addMoralReputation(1);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases slightly"
                    });
                }

            });
            this.m.Screens.push({
                ID = "Attack2",
                Text = "[img]gfx/ui/events/event_140.png[/img]You won\'t stand for this injustice and decide to charge and save the man. As you stand and raise your sword to give the order, the bonfire whips forth a great magmatic tentacle that grabs the chained man and yanks him into the flames. There is but the briefest of screams and then he\'s gone. The fire condenses into a pillar that quickly collapses. A plume of ash explodes outward. The man is gone and it is as if there was no fire at all. There\'s not even smoke in the sky.\n\n The cultists turn to you and point and speak in unison.%SPEECH_ON%Bring death, yours or ours, for Davkul awaits us all.%SPEECH_OFF%You waiver a moment, then give the order to charge.",
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
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            for( local i = 0; i < 25; i = i )
                            {
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.Cultist
                                }, false);
                                i = ++i;
                            }
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
                    this.World.Assets.addMoralReputation(1);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases slightly"
                    });
                }

            });
        }


    });

	::mods_hookExactClass("events/events/cultist_finale_event", function(o){

        o.create = function()
        {
            this.m.ID = "event.cultist_finale";
            this.m.Title = "During camp...";
            this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_33.png[/img]%cultist% enters your tent and a strong, brisk wind chases in after him, rearing up your scrolls and other notes. He walks forward, hands crossed before him, a rather priestly look to his approach.%SPEECH_ON%Sir, I\'ve been spoken to and it is a grave matter which I\'ve been given responsibility for.%SPEECH_OFF%You ask the man who the hell he\'s talking about. The cultist bows forward as though the words weighed his tongue down just so.%SPEECH_ON%Davkul, sir.%SPEECH_OFF%Ah, of course, who else? You tell the man to explain what it is he needs. The man responds.%SPEECH_ON%No, not I, Davkul. Davkul is the one in need - and he needs blood, a sacrifice.%SPEECH_OFF%You tell the man the company can stop at the next town and get some chickens, lambs, or whatever else he needs if it\'s so important. %cultist% shakes his head.%SPEECH_ON%The blood of some impish beast? No, he demands the blood of a warrior. A true fighting spirit and he has trusted me to find a man of such import - and that I have.%SPEECH_OFF%The cultist straightens up, the tent\'s candlelight suddenly fickle and uneasy.%SPEECH_ON%Davkul demands the blood of %sacrifice%.%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "And what if I do or don\'t agree to this insanity?",
                        function getResult( _event )
                        {
                            return "B";
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Cultist.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "[img]gfx/ui/events/event_33.png[/img]Walking to a flickering candle, %cultist% holds his hand over the flame and the fire comes to a standstill, pointing upright and unmoving. You\'ve seen icicles more animated than it. He speaks as he stares into the glow.%SPEECH_ON%If we do this, Davkul will be most happy. If not, well, we shall see. Not even I know what may happen then.%SPEECH_OFF%You tell the cultist that he\'s asking you to kill one of your own men. He\'ll need to do better than that. Hearing this, he walks over and grabs you by the shoulders. The tent melts away, slipping into the folds of an immense and immutable darkness. The cultist is gone. In his place is a black cloak, its arms to your shoulders, a slate of granite for a head, its edges chipped and cracking. It appears there is something behind this mask, behind this futile effort to keep your mind safe from its true visage. A voice speaks, a guttural, booming voice that is yet narrowed into a brutish whisper only for you to hear.%SPEECH_ON%I\'ll give you Death, mortal, and warmed in its comforts, Death shall be visited upon your enemies. %sacrifice% will not be lost, he will be with you always, this I promise you.%SPEECH_OFF%A whiteness snaps back over you, a rush of wind, tent flaps curling outward, candleflames tilting impossibly without going out, and a frigid coolness that has your first breath seen floating across the air. %cultist% is nowhere to be seen. You quickly get up and touch your face and skin, making sure that you are all that you\'re supposed to be. The vision remains, though, and its pulsing imprint has left behind a grisly reality that what the cultist has suggested is something to be measured seriously.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Do what must be done.",
                        function getResult( _event )
                        {
                            return "C";
                        }

                    },
                    {
                        Text = "Absolutely not!",
                        function getResult( _event )
                        {
                            return "D";
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Cultist.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "C",
                Text = "[img]gfx/ui/events/event_33.png[/img]You decide to fall to the undeniable impression that Davkul would be most unhappy with your failure to obey. But %sacrifice% also has earned a departing word from you. Clearing up your face, you step out of your tent and go to speak to the man. Perhaps just hearing his voice will knock some sense into you before you step off the ledge into an insane void from which this act has no doubt been beckoned.\n\n When you get to his tent, you notice that its flap is already open and gently waving in the wind. You step inside and find the sellsword in bed, his blanket tossed over him. You take a seat, speak a few words, hoping deep down that he\'ll wake up in the middle of them.%SPEECH_ON%You\'ve been good, %sacrifice_short%, better than I could have asked for. A true brother to the %companyname% and the sort of fighter any captain would be proud to have.\n\nHey, don\'t leave me rambling here. I know you\'re awake, you lark.%SPEECH_OFF%You reach over to the blanket and draw it back. You jump to your feet and nearly knock the whole tent over. In the bed is not %sacrifice%, but a torso, its flesh torn asunder and stretched around armor made of unknown metal, teeth for rivets, tendons for strappings, bones for pauldrons, a cuirass of absolute carnage. %cultist% stands in the tent\'s opening.%SPEECH_ON%Davkul is most pleased and has graced us with an aspect of Death.%SPEECH_OFF%This... this is not what you were expecting. You don\'t even know what you were expecting, but this could never have been imagined or prepared for. What\'s done is done, and may the soul of %sacrifice% rest in peace. It is unlikely you ever will.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "May the old gods not be watching me on this night.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.Assets.addMoralReputation(-10);
                    this.Characters.push(_event.m.Sacrifice.getImagePath());
                    local dead = _event.m.Sacrifice;
                    this.World.Statistics.addFallen(dead, "Sacrificed to Davkul");
                    this.List.push({
                        id = 13,
                        icon = "ui/icons/kills.png",
                        text = _event.m.Sacrifice.getName() + " has died"
                    });
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation decreases greatly"
                    });
                    _event.m.Sacrifice.getItems().transferToStash(this.World.Assets.getStash());
                    _event.m.Sacrifice.getSkills().onDeath(this.Const.FatalityType.None);
                    this.World.getPlayerRoster().remove(_event.m.Sacrifice);
                    this.World.Assets.getStash().makeEmptySlots(1);
                    local item = this.new("scripts/items/armor/legendary/armor_of_davkul");

                    item.m.Description = "A grisly aspect of Davkul, an ancient power not from this world, and the last remnants of " + _event.m.Sacrifice.getName() + " from whose body it has been fashioned. It shall never break, but instead keep regrowing its scarred skin on the spot.";
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain the " + item.getName()
                    });
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.ConvertedCultist))
                        {
                            bro.improveMood(2.0, "Appeased Davkul");

                            if (bro.getMoodState() >= this.Const.MoodState.Neutral)
                            {
                                this.List.push({
                                    id = 10,
                                    icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                    text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                                });
                            }
                        }
                        else
                        {
                            bro.worsenMood(3.0, "Horrified by the death of " + _event.m.Sacrifice.getName());

                            if (bro.getMoodState() < this.Const.MoodState.Neutral)
                            {
                                this.List.push({
                                    id = 10,
                                    icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                    text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                                });
                            }
                        }
                    }
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_33.png[/img]Despite the horror which you have just been witness to, you decide that %sacrifice% shall live. Just as you stand to go tell %cultist% of this, half the candles in the room suddenly blow out. Tendrils of smoke waft upward, a twisting haze through which, for but a moment, you swear you see a hard edged and angry visage turn and fade away. You get the feeling that %cultist% already knows what choice you\'ve made. You stay in the tent and light those candles back up.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Somewhere along the road, this company took a wrong turn.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Cultist.getImagePath());
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.ConvertedCultist))
                        {
                            bro.worsenMood(2.0, "Was denied the chance to appease Davkul");

                            if (bro.getMoodState() < this.Const.MoodState.Neutral)
                            {
                                this.List.push({
                                    id = 10,
                                    icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                    text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                                });
                            }
                        }
                    }
                }

            });
        }


    });

	::mods_hookExactClass("events/events/drunkard_loses_stuff_event", function(o){
        o.onUpdateScore = function()
        {
            return;
        }
    });

	::mods_hookExactClass("events/events/historian_mysterious_text_event", function(o){

        o.create = function()
        {
            //this.logInfo("historian_mysterious_text_event create");

            this.m.ID = "event.historian_mysterious_text";
            this.m.Title = "Along the way...";
            this.m.Cooldown = 99999.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_57.png[/img]You come across an abandoned chapel. Cobwebs dress its cracks, and bird nests the corners. The pews are tipped over or have been chopped up for firewood. The old gods have surely left this place.\n\n %historian% the historian comes to you with what look like muddy logs in his hands.%SPEECH_ON%Would you look at this? Old scripts!%SPEECH_OFF%He blows the blackened dust and ash off the scrolls.%SPEECH_ON%Have you ever seen something so spectacular? I don\'t know what they say yet, but it\'s still a most interesting of finds!%SPEECH_OFF%Right, whatever.",
                Image = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "Just read it and tell me what it says already.",
                        function getResult( _event )
                        {
                            if (this.Math.rand(1, 100) <= 50)
                            {
                                return "B";
                            }
                            else
                            {
                                return "C";
                            }
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Historian.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "[img]gfx/ui/events/event_15.png[/img]As you make camp outside the temple, %historian% the historian enters your tent.%SPEECH_ON%Sir, I think you might be interested in this.%SPEECH_OFF%He\'s got the scrolls from the chapel in his arms and unravels a few of them across your desk. There you see the historian\'s sloppy scribblings. His notes are in a language you can\'t read, but you can easily follow the arrows he\'s drawn over the pages to connect segments together. He then unfurls another scroll, a fresh one, with all the translations.%SPEECH_ON%These are old training manuals. They speak of techniques I never knew existed. Shall I disperse them amongst the men?%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Disperse them you shall.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Historian.getImagePath());
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        bro.getBaseProperties().RangedDefense += 1;
                        bro.getSkills().update();
                        this.List.push({
                            id = 16,
                            icon = "ui/icons/ranged_defense.png",
                            text = bro.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+1[/color] Ranged Defense"
                        });
                    }
                }

            });
            this.m.Screens.push({
                ID = "C",
                Text = "[img]gfx/ui/events/event_15.png[/img]While sitting in your tent outside the abandoned temple, %historian% the historian enters in a manner best described as reluctant. In his hands are the scrolls he found in the chapel a few days back.%SPEECH_ON%Sir, uh, the scrolls... they were most interesting.%SPEECH_OFF%Bored, you inquire as to \'how interesting.\' The man explains.%SPEECH_ON%Well, they\'ve been written in a very ancient language. I\'m not well versed in it, but I can certainly read portions here and there.%SPEECH_OFF%You ask him what he wants then.%SPEECH_ON%I\'d like to read the scrolls, but I could use a little bit of confidence before I do. Would you grace the reading? That is what my old professors would do before any great undertaking.%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Alright, go on ahead and read.",
                        function getResult( _event )
                        {
                            if (this.Math.rand(1, 100) <= 50)
                            {
                                return "D";
                            }
                            else
                            {
                                return "E";
                            }
                        }

                    },
                    {
                        Text = "If you\'re so scared to read, perhaps it is best we don\'t.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Historian.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_12.png[/img]%historian% picks up the scrolls. He licks his lips, clears his throat, and begins to read aloud. The words that come forth are not ones you\'d easily recognize. They sound so lazily produced as though he were a man being wrangled from a deep sleep, and indeed bringing with him the monsters that would inhabit the dreamworlds.\n\n He stops and looks up.%SPEECH_ON%That was it. Do you feel anything?%SPEECH_OFF%You raise an eyebrow. Feel anything? Why would--\n\n Madness. You see a spiraling darkness wreathed in living shadows, the screaming specters of creatures that still yet yearn for finality in death, and amongst them swirl beings, grinning and yapping, like bestial puppet masters, maws slipped to yonder depths, their boned teeth the only light in this realm, their smiles but crescents of ill-shaped moons come to feast on the stars themselves.%SPEECH_ON%Oh naive one, does thou think Davkul does not listen?%SPEECH_OFF%You suddenly awake to %historian%\'s screams. He says all manner of monsters are afoot. With not a moment to waste you go to warn the men before all the hells and those not yet known can break loose.",
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
                            properties.Music = this.Const.Music.BeastsTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Center;
                            properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Circle;
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Direwolves, this.Math.rand(40, 70), this.Const.Faction.Enemy);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Ghouls, this.Math.rand(40, 70), this.Const.Faction.Enemy);
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
                    this.Characters.push(_event.m.Historian.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "E",
                Text = "[img]gfx/ui/events/event_15.png[/img]%historian% picks up the scroll and begins to read. The language is at both familiar and yet primordially ancient. It tickles the ear like the scratch of vipers over sand and by no means any less threatening. When he\'s finished, the historian looks up.%SPEECH_ON%Feel anything?%SPEECH_OFF%Suddenly a dark, yet soft hand wraps around the man from behind, curving down toward his loins.%SPEECH_ON%Oh, humans. We did not think you would survive this long, and indeed it has been long since our services were called upon.%SPEECH_OFF%Lithe, hip-swaying creatures slip so lightly into the tent as though they were hardly more than the wind itself. Outside, you can hear the murmur of the rest of the company being overcome by the seductive beings. One walks toward you, her shape flashing between all the women of your life, testing your response, and when your heart warms it settles on a young lady that once broke your heart. The succubus falls atop you.%SPEECH_ON%Don\'t mind me, human, this is for you. Relax.%SPEECH_OFF%You let the pleasures wash over you.\n\n Immeasurable hours later you awake with your trousers down and %historian% in the corner rubbing his head.%SPEECH_ON%They were so wonderful, but the scroll\'s gone. I think it burned up after I said the words. Oh by the old gods do I wish I remember what they said!%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Incredible.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Historian.getImagePath());
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (this.Math.rand(1, 100) <= 75)
                        {
                            bro.improveMood(1.0, "Had a pleasurable supernatural experience");

                            if (bro.getMoodState() >= this.Const.MoodState.Neutral)
                            {
                                this.List.push({
                                    id = 10,
                                    icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                    text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                                });
                            }
                        }
                    }
                }

            });
        }



    });

	::mods_hookExactClass("events/events/lawmen_after_criminal_event", function(o){

        o.create = function()
        {
            //this.logInfo("lawmen_after_criminal_event create");

            this.m.ID = "event.lawmen_after_criminal";
            this.m.Title = "Along the road...";
            this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_90.png[/img]Riders crest a nearby hill, their silhouettes dark and oddly shaped on its rim like a reef of rippling black. Not wholly able to see who they are, you order a few of your company to hide away. An ambush might be needed to defend yourself otherwise you stand no chance against such a mounted force. As the selected mercenaries dip into the bushes, the horsemen begin heading down the hill. The thunder of the hooves grows louder, but you stand resolute, hoping to give your men a good show of bravery.\n\nYou see that the bannerman is carrying a sigil of %noblehousename%. Behind him another horseman is dragging a travois with a few shackled men for cargo. When the men arrive, their leader stands up between the withers of his horse and points at you before talking.%SPEECH_ON%Mercenary! We have by the lord\'s authority the right to claim the - shackled! - hands of a %criminal%. This wretch is within your midst and must pay for past crimes. Hand the criminal over immediately and you will be rewarded.%SPEECH_OFF%You turn your head and spit. You nod at the lawman before asking him a question.%SPEECH_ON%And whose authority do you have? There are a lot of lords in these lands and not all of them pay me well.%SPEECH_OFF%The lawmen\'s captain sits back down in his saddle. His hands cross over his pommel, resting there with armored authority. He does not look the least bit amused and voices his displeasure as such.%SPEECH_ON%The punishment for willfully harboring a fugitive is death. You\'ve but one more chance to release this criminal to me or you shall face a fate well suited for a sword-selling dog.%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "The company would only suffer if we fought over this. The fugitive is yours.",
                        function getResult( _event )
                        {
                            return "B";
                        }

                    },
                    {
                        Text = "We\'ll not give up our own.",
                        function getResult( _event )
                        {
                            return "C";
                        }

                    }
                ],
                function start( _event )
                {
                    if (this.World.Assets.getMoney() >= 1500)
                    {
                        this.Options.push({
                            Text = "Surely this isn\'t something that can\'t be solved with a fat purse of crowns?",
                            function getResult( _event )
                            {
                                return "F";
                            }

                        });
                    }

                    if (this.World.Assets.getBusinessReputation() > 3000)
                    {
                        this.Options.push({
                            Text = "You know who it is you\'re threatening? The %companyname%!",
                            function getResult( _event )
                            {
                                return "G";
                            }

                        });
                    }
                    else
                    {
                        this.Options.push({
                            Text = "You got a drawing of the man you\'re after? Let me take a look.",
                            function getResult( _event )
                            {
                                return this.Math.rand(1, 100) <= 50 ? "D" : "E";
                            }

                        });
                    }

                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "[img]gfx/ui/events/event_53.png[/img]You stand no chance against these men. Although it pains you mightily, you hand %criminal% over. Your former comrade barks curses at you as the lawmen lay on chains, and swears your name into the mud as they throw the fugitive in with the rest of the bound captives. The captain of the lawmen trots his horse over to you. He sneers at you before throwing a purse of coins to the ground. His body is close and there\'s an opening in his armor. You could fit a knife in there, right between the ribs, lead the blade right to his heart. It\'d be quick. But you wouldn\'t last much long after, and all of your company would be quickly slain.\n\nInstead, you lean over and pick up the coins, swallow you pride, and say your thanks. The lawmen waste little time returning from whence they came.",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "I can\'t put the whole company on the line for you.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                    this.World.Statistics.addFallen(_event.m.Criminal, "Handed over to authorities");
                    this.List.push({
                        id = 13,
                        icon = "ui/icons/asset_brothers.png",
                        text = _event.m.Criminal.getName() + " has left the company"
                    });
                    _event.m.Criminal.getItems().transferToStash(this.World.Assets.getStash());
                    _event.m.Criminal.getSkills().onDeath(this.Const.FatalityType.None);
                    this.World.getPlayerRoster().remove(_event.m.Criminal);
                    this.World.Assets.addMoney(100);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + 100 + "[/color] Crowns"
                    });
                }

            });
            this.m.Screens.push({
                ID = "C",
                Text = "[img]gfx/ui/events/event_10.png[/img]As the lawman stares at you, waiting for an answer, you let out a sharp whistle. Half of the company emerges from the bushes, whooping and hollering in ambush. The steed pulling the travois bucks its rider to the ground before taking off altogether, a group of wide-eyed criminals going along for the ride. Another lawman retreats, abandoning his troop.\n\n%randombrother% plucks one man from his saddle while another brother drives a spear into a horse\'s chest, bringing both beast and man crashing to the ground. The captain falls off his horse when it rears up in wild fear. It\'s a hard tumble, but he manages to roll back to his feet only for the bucking horse to clip him in the head. It is a quick, blunt demise that leaves the captain face down in the cradle of his own helmet.\n\nThe rest of his men come to stand by his body and they look to you with vengeance in their eyes.",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "Charge!",
                        function getResult( _event )
                        {
                            _event.m.NobleHouse.addPlayerRelation(this.Const.World.Assets.RelationAttacked, "You killed some of their men");
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.NobleTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            properties.TemporaryEnemies = [
                                _event.m.NobleHouse.getID()
                            ];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(_event.m.NobleHouse.getID());
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Noble, this.Math.rand(80, 100) * _event.getReputationToDifficultyLightMult(), _event.m.NobleHouse.getID());
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
                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_78.png[/img]The captain of the lawmen snaps his fingers at one of the bannermen. He hands over a scroll which the captain unfurls before handing it to you. The man you see looks remarkably like %criminal%, but since you\'ve been on the road the mercenary has gained a few scars that separate his visage from the one on the paper. But they won\'t buy that. So you lie instead.%SPEECH_ON%The man you\'re looking for is dead. He was a criminal, just as you said, and we found him thieving from our foods. %other_bro% ran a sword through him when we\'d found out.%SPEECH_OFF%The brother looks at you, and then the lawmen. He nods.%SPEECH_ON%That I did. He had a mouthful of my bread when I stuck him like a pig! I saved the rest of the loaf for m\'self, thank goodness.%SPEECH_OFF%The lawmen chuckle amongst themselves. Their captain looks back on them, his gaze a quieting one. He looks back to you. You can see why they shut up: his eyes are stern, unmoving, fierce, black. The man holds you in this stare for nearly half a minute before he nods and gathers his reins.%SPEECH_ON%Alright, mercenary. Thank you for letting us know.%SPEECH_OFF%The lawmen pack up and head back from whence they came. A sigh of relief passes over the company as a whole and you order the men hiding in the bushes to come out. It\'s a long road ahead and hopefully there won\'t be more problems like this one.",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "Phew.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                    _event.m.Criminal.improveMood(2.0, "Was protected by the company");

                    if (_event.m.Criminal.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Criminal.getMoodState()],
                            text = _event.m.Criminal.getName() + this.Const.MoodStateEvent[_event.m.Criminal.getMoodState()]
                        });
                    }
                }

            });
            this.m.Screens.push({
                ID = "E",
                Text = "[img]gfx/ui/events/event_78.png[/img]The captain hands you a scroll with %criminal%\'s face on it. True, the resemblance is there. But the figutive has been in your company long enough to gain a scar or two. Maybe they won\'t recognise the image? You ask the criminal to step forward, who nervously, does as told. You look to the captain.%SPEECH_ON%Is this the one you are after? I can see why you might think this is similar, but look at these scars. The face in the drawing has none. And look at the hair! The one in the drawing is straight, and this head nest is clearly matted and curly.%SPEECH_OFF%You stop because judging by the faces of your audience this isn\'t even coming close to working. The captain draws his sword.%SPEECH_ON%Do you take me for a fool? Kill them all.%SPEECH_OFF%Well, so much for that. Before the lawmen can charge you whistle as loud as you can. Half the company surges forth from the bushes, whooping and hollering like banshees. The sudden fright drives the horses wild, pitching their riders into the dirt and the travois-puller even runs off altogether, carrying with it a couple of very confused criminals.\n\n%randombrother% comes charging across the field of mayhem with a spear in hand, and plunges it deep into the captain\'s steed, bringing both man and beast crashing to the ground. The lawmen, what\'s left of them, gather around their captain. Seemingly growling, the man wipes blood from his face and spits out a tooth. He grins a gapped smile before ordering his men to charge.",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "Form up!",
                        function getResult( _event )
                        {
                            _event.m.NobleHouse.addPlayerRelation(this.Const.World.Assets.RelationAttacked, "You killed some of their men");
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.NobleTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            properties.TemporaryEnemies = [
                                _event.m.NobleHouse.getID()
                            ];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(_event.m.NobleHouse.getID());
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Noble, this.Math.rand(80, 100) * _event.getReputationToDifficultyLightMult(), _event.m.NobleHouse.getID());
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
                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                }

            });
            this.m.Screens.push({
                ID = "F",
                Text = "[img]gfx/ui/events/event_04.png[/img]The captain\'s threats are cooled when you retrieve a large satchel of crowns. His men exchange glances as you hold the bag up.%SPEECH_ON%We\'ve no time for this. What I have here is %bribe% crowns. Take it and go away. Stay, and earn yourself a grave. Your choice, lawman.%SPEECH_OFF%Sensing the stares of his fellow riders, the captain is especially careful in mulling this one over. He sizes up your men, and briefly does the same to his men. He must see great losses for he finally nods. Jerking his horse\'s bridle, he drives his steed forward and the two of you come face to face. You smile as you hand the crowns over.%SPEECH_ON%Spend it well.%SPEECH_OFF%The captain takes the satchel and cinches it to the side of his saddle, looping the leather harness over the hilt of a sword while his men look on. He nods, but does not smile back.%SPEECH_ON%My daughter is to be wed in a fortnight. I\'d like to be there.%SPEECH_OFF%You nod and bid the humorless captain farewell.%SPEECH_ON%May her husband be kind, and her children bountiful.%SPEECH_OFF%The captain haws his horse and leads it back to his men. They depart, the hooves of their mounts steadily thumping into the distance until there is nothing but the scratch of wind-tickled grass to fill the air.",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "What I don\'t do for you lot...",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                    this.World.Assets.addMoney(-1000);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + 1000 + "[/color] Crowns"
                    });
                }

            });
            this.m.Screens.push({
                ID = "G",
                Text = "[img]gfx/ui/events/event_12.png[/img]You walk directly toward the captain, stopping halfway between your men and his. With your fists to your hips, you call out to the captain\'s lawmen, asking if they know the name of the %companyname%. You see a few of the riders shift up on their saddles, balancing tented arms on their pommels as they stare intently at your banner. They quickly sit back down and hushed whispers trickle down and back up their battle line.\n\nOne man calls out, asking if it\'s true that you shorn the noses of those you slay. It is not true, but you\'ve no reason to spill the truth. Another man asks if %randombrother% is in your ranks, and has a necklace of ears and eats bonemeal for breakfast. You stifle the urge to laugh, only nodding in return. Quite naturally, the rumors overtake your opponents and they begin to cry out that this fight is not theirs to have.\n\nThe captain tells them that you\'re full of shit and to charge, but none follow his orders. Eventually, the captain is forced to turn back, heading after his men who are now in retreat.\n\nThe supposed cannibal walks up, scratching their head.%SPEECH_ON%Bonemeal for breakfast?%SPEECH_OFF%A crackle of laughter rips through the company and soon a chant of \'don\'t eat me!\' is to be had.",
                Image = "",
                List = [],
                Characters = [],
                Banner = [],
                Options = [
                    {
                        Text = "Don\'t challenge the %companyname%!",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Banner = _event.m.NobleHouse.getUIBannerSmall();
                    this.Characters.push(_event.m.Criminal.getImagePath());
                }

            });
        }



    });

	::mods_hookExactClass("events/events/man_in_forest_event", function(o){

        o.create = function()
        {
            //this.logInfo("man_in_forest_event create");

            this.m.ID = "event.man_in_forest";
            this.m.Title = "Along the way...";
            this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_76.png[/img]While traipsing between the trees, a man suddenly emerges from one of the bushes. Twigs and brush are all twisted up in his sweat swept hair. He rears up at the sight of you.%SPEECH_ON%Please, no more.%SPEECH_OFF%You raise your hand to calm him then ask what is going on. The stranger takes a step back.%SPEECH_ON%Please, no more!%SPEECH_OFF%He turns and runs off, thrashing his way back from whence he came. %randombrother% hurries to your side.%SPEECH_ON%Should we follow him?%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Follow him, quick!",
                        function getResult( _event )
                        {
                            local r = this.Math.rand(1, 100);

                            if (r <= 45)
                            {
                                return "B";
                            }
                            else if (r <= 90)
                            {
                                return "C";
                            }
                            else
                            {
                                return "D";
                            }
                        }

                    },
                    {
                        Text = "He\'s not our concern. Let him go.",
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
                Text = "[img]gfx/ui/events/event_50.png[/img]You follow the man into the thicket. His muddy footsteps aren\'t hard to track, his ungraceful retreat leaving much evidence. But suddenly, they disappear. The man exited into a clearing and then his tracks are gone. You hear a whistle above you. Looking up, you see the man sitting on a branch. He waves.%SPEECH_ON%Howdy, strangers.%SPEECH_OFF%He glances across the clearing. Men are approaching and they are well armed. The man in the tree snorts.%SPEECH_ON%Goodbye, strangers.%SPEECH_OFF%",
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
                            properties.Music = this.Const.Music.BanditTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.BanditDefenders, this.Math.rand(90, 110) * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
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
                ID = "C",
                Text = "[img]gfx/ui/events/event_25.png[/img]The man\'s tracks lead away in the hurry that so frightfully forced him out of your sight. A scared man such as he is not hard to find, unfortunately he\'s not scared anymore, because all you find of him is thoroughly eviscerated corpse.\n\nA slight growl vibrates the nearby bushes. You look over to see slick, black fur slowly stepping out from behind a tree. You yell to the men to arm themselves.",
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
                            properties.Music = this.Const.Music.BeastsTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Direwolves, this.Math.rand(90, 110) * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
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
                ID = "D",
                Text = "[img]gfx/ui/events/event_25.png[/img]The frightened man was not hard to find. You spot him curled up at the base of a tree. He\'s clutching something to his chest as though he were seeking warmth from it on a cold night. The man himself, however, is dead. You pry the item from his glomming grasp.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "What\'s this?",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    local item = this.new("scripts/items/weapons/named/named_dagger");
                    this.World.Assets.getStash().makeEmptySlots(1);
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain " + item.getName()
                    });
                }

            });
        }




    });

	::mods_hookExactClass("events/events/religious_peasants_event", function(o){

        o.create = function()
        {
            //this.logInfo("man_in_forest_event create");

            this.m.ID = "event.religious_peasants";
            this.m.Title = "Along the way...";
            this.m.Cooldown = 200.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_59.png[/img]The forests have always been a refuge for people - the wilds from whence we came, to the wilds where we always wish to return. And here you find a great number of people, a tribe of the lost, unconcerned with their departed civilizations, draped in religious habits, and carrying great sigils of faith, and tomes of truth. They\'re impoverished almost to the point of being decadently fashionable, like great kings looking to fit in with commoners. You sit and watch this shuffle by, clinking, clanging, hollow wooden beads rattling, whispers under their breath, raspy and dry. And so they go on, hardly even bothering to look at you.",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "Let\'s see where they\'re going.",
                        function getResult( _event )
                        {
                            if (_event.m.Monk != null)
                            {
                                local r = this.Math.rand(1, 3);

                                if (r == 1)
                                {
                                    return "B";
                                }
                                else if (r == 2)
                                {
                                    return "C";
                                }
                                else
                                {
                                    return "F";
                                }
                            }
                            else
                            {
                                local r = this.Math.rand(1, 2);

                                if (r == 1)
                                {
                                    return "B";
                                }
                                else
                                {
                                    return "C";
                                }
                            }
                        }

                    },
                    {
                        Text = "Probably best to leave them be.",
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
                Text = "[img]gfx/ui/events/event_03.png[/img]Curious, you call out to the procession to ask where they are going. The man in front slowly turns to you, his eyes peering out from the dark of a wrapped shawl. He slowly draws the cloak back, revealing a head scarred in a pattern of religious rites. All the followers behind him slowly follow suit, like a row of cards falling by the brush of a chaotic and mad wind.%SPEECH_ON%Davkul shall see you in the next world!%SPEECH_OFF%One of them shouts and they charge.",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "To arms!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            for( local i = 0; i < 50; i = i )
                            {
                                this.Const.World.Common.addTroop(party, {
                                    Type = this.Const.World.Spawn.Troops.Cultist
                                }, false);
                                i = ++i;
                            }
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
                ID = "C",
                Text = "[img]gfx/ui/events/event_12.png[/img]{Obviously, this isn\'t an ordinary sight for you so, curious, you call out to the weary travelers. Words barely leave your lips before the entire line of men stops in an instant and bolts upright. Their cloaks unravel and droop from their heads, and their tomes and sticks and religious imports fall aside in a uniform clatter. The people look around, wide eyes more alive than ever. One screams. Then another. And soon they are all screaming, and some crumple to the ground, clutching their ears as though to silence the horrid howls their mouths had to give, while others wheel in circles, arms out, begging for answers.\n\n Your mere utterance has seemingly broken a spell that was so long over their heads it had brought them here, impoverished, hungry, and insane. Step by step, they were governed by a malicious higher power, and step by step they felt the control in their lives slip away, and with it the sanity all men require to be themselves. Unfortunately, you can hardly ask them what or who did this to them, for some fall over dead while others make naked sprints into the forest. | A curious sight such as this begs questioning, but the second a word leaves your lips the entire troop of religious men bolt upright, the sudden shuffle of clothes and gear clattering in such uniformity it as if a door was slammed shut. The men drop their things and begin screaming. It is a raspy chorus. They all begin to collapse, either buckling on bony knees or clutching their stomachs in pained hunger.\n\n %randombrother% comes up, shaking his head.%SPEECH_ON%Were they cursed? What could have done this?%SPEECH_OFF%You won\'t ever get an answer for a minute later every single one is dead, looking no better than corpses having recently been thawed out of the mountains. The spell must have forcibly piloted their pilgrimage here, straining the human body while keeping it alive by the mere strand of ethereal malevolence. Although they are all dead, you do not regret freeing them of such a horrid curse.}",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "May they rest in peace.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (bro.getSkills().hasSkill("trait.superstitious") || this.Math.rand(1, 100) <= 33)
                        {
                            bro.worsenMood(0.5, "Witnessed a horrible curse");

                            if (bro.getMoodState() < this.Const.MoodState.Neutral)
                            {
                                this.List.push({
                                    id = 10,
                                    icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                    text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                                });
                            }
                        }
                    }
                }

            });
            this.m.Screens.push({
                ID = "F",
                Text = "[img]gfx/ui/events/event_59.png[/img]Curious as to where these people are going, you open your mouth, but %monk% the holy one steps forward, cutting you off and going to the man in front of the troop and has quiet counsel with him. There is plenty of nodding, hrrumphing, and other gesticulations of those who dwell long on things well beyond the human realm. Eventually, the monk comes back.%SPEECH_ON%They\'re on a pilgrimage and now our name travels with them. Many shall hear of it.%SPEECH_OFF%You thank the monk for a job well done.",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "We are for sure damned souls, but they don\'t know that...",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.Characters.push(_event.m.Monk.getImagePath());
                    this.World.Assets.addMoralReputation(1);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases slightly"
                    });
                    this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
                    this.List.insert(0, {
                        id = 10,
                        icon = "ui/icons/special.png",
                        text = "The company gained renown"
                    });
                    _event.m.Monk.improveMood(1.0, "Helped spread word about the company");

                    if (_event.m.Monk.getMoodState() >= this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Monk.getMoodState()],
                            text = _event.m.Monk.getName() + this.Const.MoodStateEvent[_event.m.Monk.getMoodState()]
                        });
                    }
                }

            });
        }




    });

	::mods_hookExactClass("events/events/wildman_causes_havoc_event", function(o){

        o.create = function()
        {
            //this.logInfo("wildman_causes_havoc_event create");

            this.m.ID = "event.wildman_causes_havoc";
            this.m.Title = "At %townname%";
            this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "%townImage%Civilization is no place for a wildman like %wildman% and he quickly proves it.\n\nApparently, the damned man went crazy while in a shop and trashed the whole place. As the story goes, he just walked in and started taking things, not quite understanding the social norms of paying for goods. The shop owner then came after him with a broom, trying to shoo the man out of his store. Believing the broom a monster, the wildman proceeded to go completely crazy. Judging by the reports, it was quite the commotion, up to and including shite throwing.\n\nNow the shop owner is in your face demanding compensation for the damage done. Apparently he\'s wanting %compensation% crowns. Behind him, a few town militia stand with very watchful eyes.",
                Image = "",
                List = [],
                Characters = [],
                Options = [],
                function start( _event )
                {
                    this.Options.push({
                        Text = "This ain\'t our problem.",
                        function getResult( _event )
                        {
                            return "B";
                        }

                    });

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Options.push({
                            Text = "Fine, the company will cover the damages - but %wildman% will work it off.",
                            function getResult( _event )
                            {
                                return "D";
                            }

                        });
                    }

                    if (_event.m.Berserker != null)
                    {
                        this.Options.push({
                            Text = "Fine, the company will cover the damages - but %berserker% will work it off.",
                            function getResult( _event )
                            {
                                return "X";
                            }

                        });
                    }

                    this.Options.push({
                        Text = "Fine, the company will cover the damages.",
                        function getResult( _event )
                        {
                            return "C";
                        }

                    });

                    if (_event.m.Trader != null)
                    {
                        this.Options.push({
                            Text = "Fine, the company will cover the damages. But %trader% will assess compensation.",
                            function getResult( _event )
                            {
                                if (_event.m.Berserker != null)
                                {
                                    this.m.Compensation = this.Math.round(400 + 0.03 * this.World.Assets.getMoney());
                                }
                                else
                                {
                                    this.m.Compensation = this.Math.round(300 + 0.02 * this.World.Assets.getMoney());
                                }

                                return "T";
                            }

                        });
                    }

                    if (_event.m.Berserker != null)
                    {
                        this.Characters.push(_event.m.Berserker.getImagePath());
                    }

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Characters.push(_event.m.Wildman.getImagePath());
                    }
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "%townImage%You push the shop owner away, telling him that you owe nothing. When he jumps forward again, your hand deftly moves to the pommel of your sword, stopping the man in one swift motion. He raises his hands up, nodding as he backs off. A few townspeople see this and skirt by, trying to avoid your gaze. The militiamen notice, but they seem uncertain on whether to take action or not.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "To hell with your shop.",
                        function getResult( _event )
                        {
                            this.World.Assets.addMoralReputation(-1);
                            return this.Math.rand(1, 100) <= 80 ? "E" : 0;
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Berserker != null)
                    {
                        this.Characters.push(_event.m.Berserker.getImagePath());
                    }

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Characters.push(_event.m.Wildman.getImagePath());
                    }

                    this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail, "You refused to pay for damages caused by one of your mercenaries");
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation decreases slightly"
                    });
                }

            });
            this.m.Screens.push({
                ID = "C",
                Text = "[img]gfx/ui/events/event_01.png[/img]You go and see the shop. The wildling truly did a number on the place. And it reeks of... scent markings. It would be a bad look for the company to not handle this issue with great care. You agree to pay for the damages, something most mercenary bands would not have done. This act of kindness does not slip the townspeople by.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Charity through destruction?",
                        function getResult( _event )
                        {
                            this.World.Assets.addMoralReputation(2);
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Berserker != null)
                    {
                        this.Characters.push(_event.m.Berserker.getImagePath());
                    }

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Characters.push(_event.m.Wildman.getImagePath());
                    }

                    this.World.Assets.addMoney(-_event.m.Compensation);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
                    });
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases"
                    });
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "%townImage%Surveying the damage, you agree to compensate the businessman. But this isn\'t your fault, it\'s the wildman\'s. You dock his pay: for some time to come, the mercenary\'s earnings will be halved. Furthermore, you take what earnings he\'s made and hand them over to the shop owner. It doesn\'t even begin to cover the damages, but it\'s a start. One man is left happy, and another quite disgruntled.\n\nYou tell the wild cretin that now he\'ll think twice about smearing shit all over someone else\'s walls. But the wildman doesn\'t seem to understand you. He just understands that the gold he once owned has been given to someone else, and he eyes its departure with sadness and bottled anger.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Don\'t look at me like that, you know what you did.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.Assets.addMoney(-_event.m.Compensation);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
                    });
                    this.Characters.push(_event.m.Wildman.getImagePath());
                    _event.m.Wildman.getBaseProperties().DailyWage -= this.Math.floor(_event.m.Wildman.getDailyCost() / 4);
                    _event.m.Wildman.getSkills().update();
                    this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail, "One of your mercenaries caused havoc in town");
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_daily_money.png",
                        text = _event.m.Wildman.getName() + " is now paid [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Wildman.getDailyCost() + "[/color] crowns a day"
                    });
                    _event.m.Wildman.worsenMood(2.0, "Got a pay cut");

                    if (_event.m.Wildman.getMoodState() < this.Const.MoodState.Neutral)
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
                ID = "X",
                Text = "[img]gfx/ui/events/event_20.png[/img]Surveying the damage, you agree to compensate the businessman. But this isn\'t your fault, it\'s the wildling\'s. You dock their pay: for some time to come, the mercenary\'s earnings will be halved. %vandal% doesn\'t take this information lightly, and as their face starts to contort in anger, you question whether it was good idea to discipline such a volatile brute. %vandal% quickly reaches the limit of their restraint and jumps at you, fists eager to smash your face! You almost faint before rest of %companyname% manages to restrain %vandal%. This time compensation for damage caused by wildlings of %companyname% was paid both with crowns and blood of your men.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "That was not a good idea...",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.Assets.addMoney(-_event.m.Compensation);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
                    });
                    this.Characters.push(_event.m.Berserker.getImagePath());
                    _event.m.Berserker.getBaseProperties().DailyWage -= this.Math.floor(_event.m.Berserker.getDailyCost() / 4);
                    _event.m.Berserker.getSkills().update();
                    this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail, "One of your mercenaries caused havoc in town");
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_daily_money.png",
                        text = _event.m.Berserker.getName() + " is now paid [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Berserker.getDailyCost() + "[/color] crowns a day"
                    });
                    _event.m.Berserker.worsenMood(2.0, "Got a pay cut");

                    if (_event.m.Berserker.getMoodState() < this.Const.MoodState.Neutral)
                    {
                        this.List.push({
                            id = 10,
                            icon = this.Const.MoodStateIcon[_event.m.Berserker.getMoodState()],
                            text = _event.m.Berserker.getName() + this.Const.MoodStateEvent[_event.m.Berserker.getMoodState()]
                        });
                    }

                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (this.Math.rand(1, 100) <= 75)
                        {
                            if (this.Math.rand(1, 100) <= 66)
                            {
                                local injury = bro.addInjury(this.Const.Injury.Brawl);
                                this.List.push({
                                    id = 10,
                                    icon = injury.getIcon(),
                                    text = bro.getName() + " suffers " + injury.getNameOnly()
                                });
                            }
                            else
                            {
                                bro.addLightInjury();
                                this.List.push({
                                    id = 10,
                                    icon = "ui/icons/days_wounded.png",
                                    text = bro.getName() + " suffers light wounds"
                                });
                            }
                        }
                    }
                }

            });
            this.m.Screens.push({
                ID = "E",
                Text = "[img]gfx/ui/events/event_141.png[/img]While leaving town, you hear a bark over your shoulder. But it is from no dog: you turn \'round to find a number of militiamen converging on the road, fanning out from homes and shops. They say you did that businessman wrong and they won\'t be having your kind in a place like this no more. You can either pay up right now, or they\'ll take it from you by force.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "A shame it had to come to this.",
                        function getResult( _event )
                        {
                            this.World.Assets.addMoralReputation(-2);
                            this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationBetrayal, "You killed some of the militia");
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Militia, this.Math.rand(90, 130), this.Const.Faction.Enemy);
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            this.World.State.startScriptedCombat(properties, false, false, true);
                            return 0;
                        }

                    },
                    {
                        Text = "Fine. I did not wake up this morning looking to slaughter innocents.",
                        function getResult( _event )
                        {
                            this.World.Assets.addMoralReputation(1);
                            return "G";
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Berserker != null)
                    {
                        this.Characters.push(_event.m.Berserker.getImagePath());
                    }

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Characters.push(_event.m.Wildman.getImagePath());
                    }

                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation decreases"
                    });
                }

            });
            this.m.Screens.push({
                ID = "G",
                Text = "[img]gfx/ui/events/event_141.png[/img]The men before you are weak and frail, a force cobbled together out of the meek and downtrodden. Nowhere in their ranks is the actual businessman you had trouble with. While you admire their tenacity, you can\'t quite bring yourself to slaughter half a town over a rather small affair. You reach to your side, drawing a few gasps from the poorly armed crowd of men, only to return your hand with a purse in its palm. A deal is struck and the compensation is paid. The townspeople are relieved, though a few of the men are not so happy about backing down from a fight.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "It\'s better this way.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Berserker != null)
                    {
                        this.Characters.push(_event.m.Berserker.getImagePath());
                    }

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Characters.push(_event.m.Wildman.getImagePath());
                    }

                    this.World.Assets.addMoney(-_event.m.Compensation);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
                    });
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Combat) && this.Math.rand(1, 100) <= 33)
                        {
                            bro.worsenMood(1.0, "The company backed down from a fight");
                        }

                        if (bro.getMoodState() < this.Const.MoodState.Neutral)
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
                ID = "T",
                Text = "[img]gfx/ui/events/event_01.png[/img]%trader% goes and sees the shop. The wildling truly did a number on the place. %trader% demands a list for all caused by %vandal%. The shop owner hands it over… reluctantly. Your trader engages into heated discussion about proper evaluation of compensation for this act of vandalism. Looks like the shop owner wanted to earn extra coins on your account. Numbers on his list were so exaggerated, he could afford three new shops if you paid it. After proper evaluation of necessary compensation by %trader%,  you agree to pay for the damages, something most mercenary bands would not have done. This act of kindness does not slip the townspeople by.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "Charity through destruction?",
                        function getResult( _event )
                        {
                            this.World.Assets.addMoralReputation(2);
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    if (_event.m.Berserker != null)
                    {
                        this.Characters.push(_event.m.Berserker.getImagePath());
                    }

                    if (_event.m.Wildman != null && _event.m.Berserker == null)
                    {
                        this.Characters.push(_event.m.Wildman.getImagePath());
                    }

                    this.World.Assets.addMoney(-_event.m.Compensation);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_money.png",
                        text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
                    });
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases"
                    });
                }

            });
        }



    });

	::mods_hookExactClass("events/events/greenskins_caravan_ambush_event", function(o){

        o.create = function()
        {
            //this.logInfo("greenskins_caravan_ambush_event create");

            this.m.ID = "event.crisis.greenskins_caravan_ambush";
            this.m.Title = "Along the road...";
            this.m.Cooldown = 100.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_59.png[/img]{Cresting a small hill, you see a caravan of people along the road. They\'re trundling down the path with pots and pans clinking along the wagon sides, children swinging their legs off the edges, women at the front bidding the draught animals forward with sharp whippings. Men march together, looking at a map and arguing over it, gesticulating in different directions to show a difference in geographic opinion. And then, further up the road, beyond the travelers\' eyes, are a few goblins laying in the grass. %randombrother% sees them, too, and comments.%SPEECH_ON%We\'d best get down there now, sir, before there\'s a slaughter.%SPEECH_OFF%%randombrother2% shrugs.%SPEECH_ON%Or... we let the goblins make their move, then we swoop in and clean up the mess. Easier to fight them when they\'re tangled up, no?%SPEECH_OFF%}",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "We attack now!",
                        function getResult( _event )
                        {
                            return "B";
                        }

                    },
                    {
                        Text = "We wait for the goblins to attack first, then we charge!",
                        function getResult( _event )
                        {
                            return "C";
                        }

                    },
                    {
                        Text = "We don\'t need to get involved in this. March on!",
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
                ID = "B",
                Text = "[img]gfx/ui/events/event_48.png[/img]{You won\'t sacrifice these innocent people for tactical advantage! You order the men to attack now. The goblins immediately hear you come and turn face. In the distance, the peasants clear out, seeing the danger ahead. It appears you\'ve saved them, but now you\'ll have to face the goblins in whole!}",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "To arms!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.GoblinsTracks;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.GoblinRaiders, this.Math.rand(90, 110) * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
                            foreach(troop in party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            _event.registerToShowAfterCombat("AftermathB", null);
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
                ID = "AftermathB",
                Text = "[img]gfx/ui/events/event_83.png[/img]{With the goblins taken care of, the peasants slowly bring their wagons back around. They look at the scene with plenty of awe. One shakes your hand.%SPEECH_ON%By all the old gods, everyone we meet shall hear the name of the %companyname%!%SPEECH_OFF%A few others give you food, kisses, and plenty of thanks.}",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "It was nothing, honest.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnPartyDestroyed);
                    this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/special.png",
                        text = "The company gained renown"
                    });
                    this.World.Assets.addMoralReputation(3);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases"
                    });
                    local food = this.new("scripts/items/supplies/bread_item");
                    this.World.Assets.getStash().add(food);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + food.getIcon(),
                        text = "You gain " + food.getName()
                    });
                }

            });
            this.m.Screens.push({
                ID = "C",
                Text = "[img]gfx/ui/events/event_60.png[/img]{You order the men to wait for the right moment.\n\n When the peasants march further down the road, the goblins waylaid them with a volley of poison arrows. The arguing men go down, arrows stuck in their chests, muscles stiffening, faces drawn taut as the poison courses through. A few other men grab the reins from their wives and steer the wagons around. Some stand guard, a bunch of pitchfork-carrying farmers for a  rearguard, but they don\'t last long in the face of the dishonorable gobbos. Seeing that the goblins are scattered in their attack, you order the %companyname% to begin its own ambush.}",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "To arms!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.GoblinsTracks;
                            properties.Entities = [];
                            properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Edge;
                            properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Random;
                            local ally_party = this.new("scripts/entity/world/party");
                            ally_party.EL_setFaction(this.Const.Faction.PlayerAnimals);
                            ally_party.EL_tempPartyInit();
                            properties.Parties.push(ally_party);
                            this.Const.World.Common.addUnitsToCombat(ally_party, this.Const.World.Spawn.Peasants, this.Math.rand(40, 50) * _event.getReputationToDifficultyLightMult(), this.Const.Faction.PlayerAnimals);
                            foreach(troop in ally_party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            local enemy_party = this.new("scripts/entity/world/party");
                            enemy_party.EL_setFaction(this.Const.Faction.Enemy);
                            enemy_party.EL_tempPartyInit();
                            properties.Parties.push(enemy_party);
                            this.Const.World.Common.addUnitsToCombat(enemy_party, this.Const.World.Spawn.GoblinRaiders, this.Math.rand(90, 110) * _event.getReputationToDifficultyLightMult(), this.Const.Faction.Enemy);
                            foreach(troop in enemy_party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            _event.registerToShowAfterCombat("AftermathC", null);
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
                ID = "AftermathC",
                Text = "[img]gfx/ui/events/event_83.png[/img]{The scattered remains of the traveling peasants slowly emerge out of the strewn battlefield. An old man shakes your hand.%SPEECH_ON%Thank ye, sir, had you not happened upon us we would have all been green-meat!%SPEECH_OFF%But before he can let your hand go, another, younger man springs over, pointing with a finger.%SPEECH_ON%To hell with that, old man, I saw that bastard up on the hill just watching the whole time! He left us out as bait!%SPEECH_OFF%The old man yanks his hand back.%SPEECH_ON%Well I\'ll be. May you experience all the hells, sellsword!%SPEECH_OFF%Like you give a shite. You tell the old man that anything you find is yours. If they want to protest, they can stick their mouth on the end of a blade for all you care.}",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "Piss off, peasants.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnPartyDestroyed);
                    this.World.Assets.addMoralReputation(-2);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation decreases"
                    });
                    local food = this.new("scripts/items/supplies/bread_item");
                    this.World.Assets.getStash().add(food);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + food.getIcon(),
                        text = "You gain " + food.getName()
                    });
                    local item = this.new("scripts/items/weapons/pitchfork");
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain a " + item.getName()
                    });
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_75.png[/img]{One way or another, this isn\'t your problem. You quietly leave the scene, though a few brothers are rather disturbed that you left those poor peasants to such a gruesome fate, particularly when the whole realm is trying to survive these green savages.}",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "Get over it.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    local brothers = this.World.getPlayerRoster().getAll();

                    foreach( bro in brothers )
                    {
                        if (this.Math.rand(1, 100) <= 25)
                        {
                            bro.worsenMood(1.0, "Disappointed that you avoided battle and let peasants die");

                            if (bro.getMoodState() <= this.Const.MoodState.Neutral)
                            {
                                this.List.push({
                                    id = 10,
                                    icon = this.Const.MoodStateIcon[bro.getMoodState()],
                                    text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
                                });
                            }
                        }
                    }
                }

            });
        }



    });

	::mods_hookExactClass("events/events/greenskins_trapped_goblin_event", function(o){

        o.create = function()
        {
            //this.logInfo("greenskins_trapped_goblin_event create");

            this.m.ID = "event.crisis.greenskins_trapped_goblin";
            this.m.Title = "Along the way...";
            this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_25.png[/img]The company steps through some brush and into a clearing where they find a goblin squatting. It turns toward the company, its breath labored, its eyes somber. You see that there\'s a large bear trap tightly clenching its lower thigh. The greenskin tries a growl, but only manages to cough some blood.\n\n Beside the dying goblin is a man face down in the grass. There\'s something shiny attached to his hip, but you can\'t quite tell what it is. %randombrother% comes to your side.%SPEECH_ON%Could be a trap. A trap within a trap. The rest of his buddies are probably not far. Then again, if we leave, he might get free and tell everyone we were here. What should we do?%SPEECH_OFF%",
                Banner = "",
                Characters = [],
                Options = [
                    {
                        Text = "Kill it.",
                        function getResult( _event )
                        {
                            if (this.Math.rand(1, 100) <= 50)
                            {
                                return "B";
                            }
                            else
                            {
                                return "C";
                            }
                        }

                    },
                    {
                        Text = "Leave it.",
                        function getResult( _event )
                        {
                            if (this.Math.rand(1, 100) <= 70)
                            {
                                return "D";
                            }
                            else
                            {
                                return "E";
                            }
                        }

                    }
                ],
                function start( _event )
                {
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "[img]gfx/ui/events/event_25.png[/img]One way or another, the goblin cannot be allowed to live. You step into the clearing to put it out of its misery and, perhaps, get a glimpse at what treasures the corpse might carry. The greenskin shrinks at the sight of you, snarling and rearing up, the trap wrinkling the chains to which it is attached. %randombrother%, weapon in hand, carefully gets near to the beast and then kills it with a single blow.\n\n With the threat taken care of, you roll the dead man\'s body over and loot everything worth taking.",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "One goblin less to worry about. ",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    local item;
                    local r = this.Math.rand(1, 6);

                    if (r == 1)
                    {
                        item = this.new("scripts/items/weapons/named/named_dagger");
                    }
                    else if (r == 2)
                    {
                        item = this.new("scripts/items/weapons/rondel_dagger");
                    }
                    else if (r == 3)
                    {
                        item = this.new("scripts/items/weapons/dagger");
                    }
                    else if (r == 4)
                    {
                        item = this.new("scripts/items/weapons/knife");
                    }
                    else if (r == 5)
                    {
                        item = this.new("scripts/items/loot/golden_chalice_item");
                    }
                    else if (r == 6)
                    {
                        item = this.new("scripts/items/loot/silver_bowl_item");
                    }

                    this.World.Assets.getStash().makeEmptySlots(1);
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain " + item.getName()
                    });
                }

            });
            this.m.Screens.push({
                ID = "C",
                Text = "[img]gfx/ui/events/event_69.png[/img]This is a war of annihilation and no greenskin can be allowed to live. You step into the field and slay the foul thing. With it out of the way, you roll the dead man\'s body over and loot all that\'s worth taking. Just as you get ready to leave, a gargling growl rumbles from the treeline. %randombrother% takes out his weapon and points.%SPEECH_ON%Nachzehrers!%SPEECH_OFF%Damn! They must have smelled the dying goblin and came to feast. Some of them are already picking their teeth with orc bones...",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "A bit messier than expected...",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.BeastsTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.Ghouls, this.Math.rand(70, 90), this.Const.Faction.Enemy);
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
                    local item;
                    local r = this.Math.rand(1, 6);

                    if (r == 1)
                    {
                        item = this.new("scripts/items/weapons/named/named_dagger");
                    }
                    else if (r == 2)
                    {
                        item = this.new("scripts/items/weapons/rondel_dagger");
                    }
                    else if (r == 3)
                    {
                        item = this.new("scripts/items/weapons/dagger");
                    }
                    else if (r == 4)
                    {
                        item = this.new("scripts/items/weapons/knife");
                    }
                    else if (r == 5)
                    {
                        item = this.new("scripts/items/loot/golden_chalice_item");
                    }
                    else if (r == 6)
                    {
                        item = this.new("scripts/items/loot/silver_bowl_item");
                    }

                    this.World.Assets.getStash().makeEmptySlots(1);
                    this.World.Assets.getStash().add(item);
                    this.List.push({
                        id = 10,
                        icon = "ui/items/" + item.getIcon(),
                        text = "You gain " + item.getName()
                    });
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_25.png[/img]You\'re not going to risk the company over a single measly goblin and a dead man who may or may not have anything valuable. The company gives a wide berth to the clearing and continue on through the forest without any issue.",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "Best keep the company in shape for bigger threats.",
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
                Text = "[img]gfx/ui/events/event_48.png[/img]You\'re not going to risk the company over a single measly goblin and a dead man who may or may not have anything valuable. The company gives a wide berth to the clearing and continue on through the forest.\n\n No more than five minutes down the road do you hear a thundering of footsteps coming up from the rear. Loud and burly enough that whoever is making it has no fear of being heard. You duck and wait and, unsurprisingly, orcs and goblins come through the trees. One of them is the bastard you\'d left to the bear trap, his leg hurriedly wrapped in linens and leaves.",
                Banner = "",
                Characters = [],
                List = [],
                Options = [
                    {
                        Text = "Damn, the little runt found us!",
                        function getResult( _event )
                        {
                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.GoblinsTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            properties.EnemyBanners = [
                                "banner_goblins_03"
                            ];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.GreenskinHorde, this.Math.rand(70, 90), this.Const.Faction.Enemy);
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
        }



    });

	::mods_hookExactClass("events/events/undead_plague_or_infected_event", function(o){

        o.create = function()
        {
            //this.logInfo("undead_plague_or_infected_event create");

            this.m.ID = "event.crisis.undead_plague_or_infected";
            this.m.Title = "Along the road...";
            this.m.Cooldown = 40.0 * this.World.getTime().SecondsPerDay;
            this.m.Screens.push({
                ID = "A",
                Text = "[img]gfx/ui/events/event_59.png[/img]You come across a group of peasants sitting by the edge of the path. Men, women, children. Dirtied clothes, muddied boots, sores on their skin. A few carry wounds shaped like bitemarks. The eldest of the party speaks.%SPEECH_ON%Please, sir, do you have any food or water to give us?%SPEECH_OFF%He seems to see you eyeing the pustules and bitemarks. He shakes his head.%SPEECH_ON%Oh, don\'t mind those. Simple fox huntin\' gone awry. We could just use a bit of help and then we can be on our way.%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "We can spare a bit of food.",
                        function getResult( _event )
                        {
                            if (this.Math.rand(1, 100) <= 50)
                            {
                                return "C";
                            }
                            else
                            {
                                return "D";
                            }
                        }

                    },
                    {
                        Text = "This isn\'t our problem.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    },
                    {
                        Text = "You\'ll only make the undead ranks swell. Better we finish you now.",
                        function getResult( _event )
                        {
                            return "B";
                        }

                    }
                ],
                function start( _event )
                {
                }

            });
            this.m.Screens.push({
                ID = "B",
                Text = "[img]gfx/ui/events/event_59.png[/img]You command these sickened souls to be well - by commanding your men to kill them all. The elder leads the women and children away while the men rise up to stand their ground. One, wavering on green and peeling legs, points at you.%SPEECH_ON%What a saint you are ya prick. I hope I do come back from the dead. I hope my corpse kills the lot of you ya farkin\' savages.%SPEECH_OFF%",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "I look forward to killing you twice, then.",
                        function getResult( _event )
                        {
                            if (this.World.FactionManager.isUndeadScourge())
                            {
                                this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnPartyDestroyed);
                            }

                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            local party = this.new("scripts/entity/world/party");
                            party.EL_setFaction(this.Const.Faction.Enemy);
                            party.EL_tempPartyInit();
                            properties.Parties.push(party);
                            this.Const.World.Common.addUnitsToCombat(party, this.Const.World.Spawn.PeasantsArmed, this.Math.rand(50, 100), this.Const.Faction.Enemy);
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
                ID = "C",
                Text = "[img]gfx/ui/events/event_59.png[/img]You tell %randombrother% to hand out some food and supplies. The elder thanks you and says he\'ll speak highly of the %companyname% wherever he goes. A few of the men seem relieved that you didn\'t ask something awful of them.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "We do what we can.",
                        function getResult( _event )
                        {
                            return 0;
                        }

                    }
                ],
                function start( _event )
                {
                    this.World.Assets.addMoralReputation(3);
                    this.List.push({
                        id = 10,
                        icon = "ui/icons/asset_moral_reputation.png",
                        text = "The company\'s moral reputation increases"
                    });
                    local food = this.World.Assets.getFoodItems();

                    for( local i = 0; i < 2; i = i )
                    {
                        local idx = this.Math.rand(0, food.len() - 1);
                        local item = food[idx];
                        this.List.push({
                            id = 10,
                            icon = "ui/items/" + item.getIcon(),
                            text = "You lose " + item.getName()
                        });
                        this.World.Assets.getStash().remove(item);
                        food.remove(idx);
                        i = ++i;
                    }
                }

            });
            this.m.Screens.push({
                ID = "D",
                Text = "[img]gfx/ui/events/event_29.png[/img]You tell %randombrother% to hand out some food and supplies. The elder thanks you and says he\'ll speak highly of the %companyname% wherever he goes. Taking a piece of bread, you squat beside a sickly child and the father holding him. But when you hold the loaf out, the child turns its head up and bites into his father\'s neck. Any peasant healthy enough to stand does so and runs off. The rest... well, the rest shamble to their feet, faces pale, jaws slacked, eyes glowing red with furious hunger. You quickly order the mercenaries into formation.",
                Image = "",
                List = [],
                Characters = [],
                Options = [
                    {
                        Text = "No good deed goes unpunished.",
                        function getResult( _event )
                        {
                            if (this.World.FactionManager.isUndeadScourge())
                            {
                                this.World.FactionManager.addGreaterEvilStrength(this.Const.Factions.GreaterEvilStrengthOnPartyDestroyed);
                            }

                            local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
                            properties.CombatID = "Event";
                            properties.Music = this.Const.Music.CivilianTracks;
                            properties.IsAutoAssigningBases = false;
                            properties.Entities = [];
                            properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Center;
                            local ally_party = this.new("scripts/entity/world/party");
                            ally_party.EL_setFaction(this.Const.Faction.PlayerAnimals);
                            ally_party.EL_tempPartyInit();
                            properties.Parties.push(ally_party);
                            this.Const.World.Common.addUnitsToCombat(ally_party, this.Const.World.Spawn.Peasants, this.Math.rand(10, 30), this.Const.Faction.PlayerAnimals);
                            foreach(troop in ally_party.getTroops()) {
                                properties.Entities.push(troop);
                            }
                            local enemy_party = this.new("scripts/entity/world/party");
                            enemy_party.EL_setFaction(this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getID());
                            enemy_party.EL_tempPartyInit();
                            properties.Parties.push(enemy_party);
                            this.Const.World.Common.addUnitsToCombat(enemy_party, this.Const.World.Spawn.ZombiesLight, this.Math.rand(60, 90), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Undead).getID());
                            foreach(troop in enemy_party.getTroops()) {
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
        }




    });

});
