this.ptr_swordmaster_scenario_student_local_duel_event <- this.inherit("scripts/events/event", {
	m = {		
		Candidates = [],		
		Champion = null,
		Partner = null,
		RandomBro = null,
		RandomBro2 = null,
		Flags = null,
		Town = null	
	},
	function create()
	{
		this.m.ID = "event.ptr_swordmaster_scenario_student_local_duel";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_50.png[/img]{Your student, %champion%, has seemed quite agitated as of late. %Their3% swings in training carry force far beyond a \'friendly\' spar. Already %they3% has shattered two wooden training blades, sending splinters flying and nearly injuring another student! Finally, you witness %champion% and %partner% in quite the furious spar. Feders clashing together and sending sparks flying! %champion% continues to batter %partner%\'s defense, while %their3% \'foe\' can barely hold on. Just as %partner% drops %their4% guard, %champion% rears up an overhead strike, aiming to smash down upon %their4% skull!\n\nYou react just in time, thrusting your own blade forward and blocking the deadly swing! Immediately you grab %their3% shoulder and pull %them3% aside, demanding an explanation for %their3% choleric wroth. %SPEECH_ON%I have heard of a swordmaster in %townname%, master. One of the best in the retinue of the local lord. I believe I am ready, I can best him and take his mantle! With your esteemed teachings and my skills, I can attain glory!%SPEECH_OFF%Passion oozes from %their3% every word, and seeing your hesitation and grimace, %they3% continues immediately.%SPEECH_ON%I have mastered the combinations, I- I have slain many in your name, master! Not a single student within your service can best me! How can some- some old wretch--%SPEECH_OFF%%They3% pauses, staring at you and dipping %their3% head. You raise your eyebrow.%SPEECH_ON%I mean no offense, master, but… I can take him. I promise you.%SPEECH_OFF%%They3% is bursting full of energy and confidence in %their3% skills… But as you know, you have had to face your own challengers - and there is only one way for these duels to end: in death. Such are the traditions... One misstep, one poor judgement, and your own student will be struck down in an instant. Is he truly ready for such a challenge?%SPEECH_ON%I am still hesitant…%SPEECH_OFF%You reply. A grimace still present on your withered and wrinkly face.%SPEECH_ON%Please. Give me this one chance. I do not wish to let your training go to waste! This is a chance for glory! Glory for all of us!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				_event.m.Title = "Prodigal Ward";			
				_event.m.Flags.set("EnemyChampionName", this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)] + " " + this.Const.Strings.SwordmasterTitles[this.Math.rand(0, this.Const.Strings.SwordmasterTitles.len() - 1)]);

				this.Options.push({
					Text = "Go with my blessing, %champion%!",
					function getResult( _event )
					{
						return "N";
					}
				});

				this.Options.push({
					Text = "You\'re not ready for this yet!",
					function getResult( _event )
					{
						if (this.Math.rand(1, 100) > 80)
						{
							return "StudentInsists";
						}
						else
						{
							return "StudentBacksOff";
						}
					}
				});

				this.Characters.push(_event.m.Champion.getImagePath());
			}
		});
		this.m.Screens.push({
			ID = "StudentBacksOff",
			Text = "[img]gfx/ui/events/event_82.png[/img]{Disappointment spreads across %champion%\'s face almost immediately. A solemn and somber expression as %they3% stews upon your words for a few moments. Running %their3% tongue over his teeth and dropping his head down.%SPEECH_ON%I… I understand, master. If you-%SPEECH_OFF%%They3% pauses to sniffle.%SPEECH_ON%If you do not think I am ready. I cannot change your mind… I shall return to my duties, th… thank you.%SPEECH_OFF%%They3% turns and begins to walk back to %their3% daily tasks, shoulders dropped low and a deep frown upon %their3% face. As unfortunate as it is, such a harsh truth strikes deep within the chest. Such a feeling is not foreign to you, of course, having had your share of let downs in your life, but, at least it is a fine lesson for all of your students. Not all battles can be won at once. Some skills must take time to mature. And in your wisdom, you don\'t think %champion% has matured -just- quite yet.\n\nA few unsure looks are shared between your students, but not one dares to question your decision.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				_event.m.Title = "Disappointment";
				_event.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;

				_event.m.Champion.worsenMood(1.5, "Prevented from taking part in a great duel");

				if (_event.m.Champion.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Champion.getMoodState()],
						text = _event.m.Champion.getName() + this.Const.MoodStateEvent[_event.m.Champion.getMoodState()]
					});
				}

				this.Options.push({
					Text = "Patience bears sweet fruit... your time will come, %champion%!",
					function getResult( _event )
					{
						return 0;
					}
				});				
			}
		});
		this.m.Screens.push({
			ID = "StudentInsists",
			Text = "[img]gfx/ui/events/event_64.png[/img]{%champion%/’s lip curls upwards into a disgusted snarl, %their3% eyes narrowing. %Their3% right leg rising into the air, abruptly stomping down like a child throwing a tantrum rather than a distinguished student. %They3% even clenches %their3% fist and seems poised to go into a rage, a tear welling up in the corner of %their3% eye. Just as you think %they3% are about to scream, %their3% mouth opens and %champion% speaks - a quiver in %their3% voice, turning %their3% chin towards the heavens.%SPEECH_ON%I… will prove you wrong. I shall not be insulted in such a way. By my own master, my own -idol- even! I shall go. I- I shall slay this wretched hasbeen! And show you I can do this!%SPEECH_OFF%%They3% sniffle and turn before you can even form a response to such an audacious display of immaturity from one of your own students. %They3% immediately storms off and begins to gather %their3% things, grasping %their3% blade and donning %their3% armor with speed you\'ve never seen before. Tightening %their3% boot laces and rising back up, standing tall as they can.%SPEECH_ON%Follow me if you\'d like, I care not. You will witness greatness! I shall fell this knave in a single stroke of my blade. Not because of what you have taught me, master, but because I have outgrown your limitations! Mark. My. Words.%SPEECH_OFF%Without another word, %they3% storms out of the camp, in the direction of %townname%. Your students give wary glances towards you, mixed emotions amongst them as some murmur in surprise, balk at such brazen disrespect, or subtly make bets with one another on the outcome. In an attempt to salvage the situation, you point towards a couple of your students, ordering them to accompany %champion% and make sure %they3% doesn\'t do anything stupid. They oblige immediately, turning and jogging after %them3%.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				_event.m.Title = "Spurned Onwards";

				this.Options.push({
					Text = "Good luck!",
					function getResult( _event )
					{
						_event.startCombat(_event);
						return 0;
					}
				});
			}
		});
		this.m.Screens.push({
			ID = "N",
			Text = "[img]gfx/ui/events/event_35.png[/img]{%champion%\'s eyes sparkle with delight at your proclamation! %They3% bows %their3% head deeply and places a hand upon %their3% chest. %They3% speaks in a confident voice. %SPEECH_ON%I will not disappoint you, master. I shall return with my comrades, or atop their shoulders. This, I promise you. Bards will tell tales of us, as I swing my blade and slay this so-called \'swordmaster\'!%SPEECH_OFF%%They3% turns %their3% head up and looks at %randombro% and %randombro2%.%SPEECH_ON%You! Come, come with me! We must go to %townname%! At once!%SPEECH_OFF%Hesitantly, the two prepare to go with %champion%, unease on their faces and a glance of concern towards you. Unexpectedly though, %partner% approaches %champion% and claps %their4% arm around %their3% shoulder, a smile on %their4% face as the clasp turns into a hug.%SPEECH_ON%I believe in you, my friend. Bring back glory for all of us! I will be the first to pour your wine and listen to your tale of victory!%SPEECH_OFF%%champion% embraces %partner% and nods. Pulling away and beaming a smile towards %them4%.%SPEECH_ON%I shall! Do not worry my friend. Very soon, we shall bask in this glory together!%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "",
					function getResult( _event )
					{
						_event.startCombat(_event);						
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "The duel!";

				if (_event.m.Champion.getSkills().hasSkill("effects.ptr_swordmaster_scenario_avatar"))
				{
					this.Options[0].Text = "Prepare to die!";					
				}
				else
				{
					this.Options[0].Text = "Make me proud, " + _event.m.Champion.getName() + "!";
				}
				
				this.Characters.push(_event.m.Champion.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "Victory",
			Text = "[img]gfx/ui/events/event_26.png[/img]{Many hours pass since %champion% has departed, much to the dismay of both yourself and your fellow students. Three spots remain free at the campfire, along with cold bowls of stew and stale chunks of bread. An uneasy silence looms over the usually happy and energetic camp. Not a single student has settled in early for bed, nor have they taken the pot off to be stored for later, awaiting the return of their dear friends.\n\nOne of them already contemplating digging a grave for %champion%, resigned to the fate before news of the fight even returned. Another has sat next to the road, asking passing travelers for any news from %townname%. Finally, just as the sun almost dips below the horizon… three silhouettes emerge on the nearby hilltop.%SPEECH_ON%They return! They return! %champion% is victorious!%SPEECH_OFF%Quiet whispers and discussion turn into cheers as the trio approaches, a battle weary and proud %champion% leading them! %Their3% blade bloodied and hair matted with sweat, blood, and mud, but %their3% face positively glowing from the glory of their victory. %champion% makes an immediate beeline for you, kneeling down and holding up a quite ornate and well balanced blade.%SPEECH_ON%The blade of the vanquished, master, I claimed it for you. I have slain my enemy, and have earned glory and renown in your name! Please… take it.%SPEECH_OFF%With a proud smile you take the blade and hold it in the air. Your students around you breaking into an overjoyed cheer!\n\n%champion% is lifted into the air and hoisted about, paraded about the camp and praised for such a fantastic and glorious return.\n\nThe young %champion% has truly shown that %they3% is skilled and worthy enough to be called… a Swordmaster, elevating %themselves3% to a level -almost- equal to yours.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I am proud of you, %champion%!",
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

				local effect = _event.m.Champion.getSkills().getSkillByID("effects.ptr_swordmaster_scenario_recruit");
				local attributes = effect.evolve();

				this.List = [
					{
						id = 10,
						icon = "ui/backgrounds/background_30.png",
						text = _event.m.Champion.getName() + " is now a Young Swordmaster"
					},
					{
						id = 10,
						icon = "ui/icons/perks.png",
						text = _event.m.Champion.getName() + " gains all Sword group perks. Any perk points spent on Sword perks are refunded."
					},
					{
						id = 10,
						icon = "ui/icons/special.png",
						text = "The company gained renown"
					}
				];

				this.List.extend([
					{
						id = 10,
						icon = "ui/icons/melee_skill.png",
						text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + attributes.MeleeSkill + "[/color] Melee Skill"
					},
					{
						id = 10,
						icon = "ui/icons/melee_defense.png",
						text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + attributes.MeleeDefense + "[/color] Melee Defense"
					},
					{
						id = 10,
						icon = "ui/icons/fatigue.png",
						text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + attributes.Stamina + "[/color] Fatigue"
					},
					{
						id = 10,
						icon = "ui/icons/bravery.png",
						text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + attributes.Bravery + "[/color] Resolve"
					},
					{
						id = 10,
						icon = "ui/icons/initiative.png",
						text = _event.m.Champion.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + attributes.Initiative + "[/color] Initiative"
					}
				]);

				_event.m.Champion.improveMood(1.0, "Won a great duel");

				if (_event.m.Champion.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Champion.getMoodState()],
						text = _event.m.Champion.getName() + this.Const.MoodStateEvent[_event.m.Champion.getMoodState()]
					});
				}

				local playerRoster = this.World.getPlayerRoster().getAll();

				foreach( bro in playerRoster )
				{
					if (bro == _event.m.Champion) continue;

					bro.improveMood(0.5, "The company\'s champion won an impressive duel");

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
		});
		this.m.Screens.push({
			ID = "Defeat",
			Text = "[img]gfx/ui/events/event_124.png[/img]{Time ticks slowly as you, along with many of your anxious students, await %champion%\'s return. A few of the students pace about, fidgeting and staring out towards the horizon, expecting to see a triumphant trio at any moment. Such a dereliction of duty brings you to slight unease, but you know it\'s most likely warranted given the circumstance. Even you stare out towards the horizon at times, looking for any sign of the return of your students, praying to the gods for good news and a victorious ward.\n\nA grave has already been dug behind %champion%\'s tent, a grim reminder of what failure entails. You even caught a student digging through their personal belongings, and upon questioning declared that if he was dead he no longer needed them.\n\nAs the sun begins to set… two figures hefting a third atop a shield crest the hilltop. A wail of despair rises from %partner% as %they4% spots them. Confusion engulfs the camp until the reality of the situation settles in… you can hardly believe it yourself.\n\nAs they walk into the camp, %champion% seems oddly at peace. A quick death, a single decisive blow that ended the fight. A fortunate way to die, at least. Not too much suffering in a single blade stroke. Something you are quite familiar with dispensing.\n\n%They3%\'s lowered into the grave quite unceremoniously, albeit with love and respect, and %randombro% approaches with a small prayer book, eyes glistening with tears. A few calming words are read out, %their3% final rites given by one of %their3% own friends… before %they3% is buried. A wooden totem is driven into the ground with his name crudely carved into it. A much less noble resting place than someone so brave deserved.}",
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

				if (_event.setupRandomBros())
				{
					local e = this.Math.min(4, _event.m.Candidates.len());

					local toRemove = [];

					for( local i = 0; i < e; i++ )
					{
						local bro = _event.m.Candidates[i];
						toRemove.push(i);

						this.Options.push({
							Text = "I need you to avenge us, " + bro.getName() + ".",
							function getResult( _event )
							{
								_event.m.Champion = bro;
								_event.startCombat(_event);
								return 0;
							}
						});
					}

					foreach (idx in toRemove)
					{
						_event.m.Candidates.remove(idx);
					}
				}

				// this.Options.push({
				// 	Text = "%enemyname%, I will cut you down myself!",
				// 	function getResult( _event )
				// 	{
				// 		foreach (bro in this.World.getPlayerRoster().getAll())
				// 		{
				// 			if (bro.getSkills().hasSkill("effects.ptr_swordmaster_scenario_avatar"))
				// 			{
				// 				_event.m.Champion = bro;
				// 				break;
				// 			}
				// 		}
						
				// 		_event.startCombat(_event);					
				// 		return 0;
				// 	}
				// });

				this.Options.push({
					Text = "Farewell %champion%! You died too young!",
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
		if (!this.World.getTime().IsDaytime || this.World.Assets.getOrigin().getID() != "scenario.ptr_swordmaster")
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getSize() > 2 || (t.getSize() > 1 && t.isMilitary()))
			{
				if (t.getTile().getDistanceTo(playerTile) <= 10 && !t.isIsolated())
				{
					town = t;
					break;
				}
			}
		}

		if (town == null)
		{
			return;
		}

		this.m.Candidates = [];

		local bros = this.World.getPlayerRoster().getAll();
		if (bros.len() < 5)
		{
			return;
		}

		local non_canditates = [];

		foreach (i, bro in bros)
		{
			if (bro.getSkills().hasSkill("effects.ptr_swordmaster_scenario_avatar"))
			{
				continue;
			}
			if (bro.getCurrentProperties().getMeleeSkill() < 100 || bro.getCurrentProperties().getMeleeDefense() < 45 || bro.getBackground().getID().find("swordmaster") != null)
			{
				non_canditates.push(bro);
			}
			else
			{
				this.m.Candidates.push(bro);
			}
		}

		if (this.m.Candidates.len() == 0)
		{
			return;
		}

		this.m.Town = town;

		this.m.Score = this.m.Candidates.len() * 25;
		
		local idx = this.Math.rand(0, this.m.Candidates.len() - 1);
		this.m.Champion = this.m.Candidates[idx];
		this.m.Candidates.remove(idx);

		non_canditates.extend(this.m.Candidates);

		idx = this.Math.rand(0, non_canditates.len() - 1);
		this.m.Partner = non_canditates[idx];
		non_canditates.remove(idx);

		this.setupRandomBros();
	}

	function setupRandomBros()
	{
		local bros = this.World.getPlayerRoster().getAll();
		local randomBros = [];
		foreach (bro in bros)
		{
			if (this.m.Champion != bro && this.m.Partner != bro && !bro.getSkills().hasSkill("effects.ptr_swordmaster_scenario_avatar"))
			{
				randomBros.push(bro);
			}
		}

		if (randomBros.len() < 2)
		{
			return false;
		}

		local idx = this.Math.rand(0, randomBros.len() - 1);
		this.m.RandomBro = randomBros[idx];
		randomBros.remove(idx);

		idx = this.Math.rand(0, randomBros.len() - 1);
		this.m.RandomBro2 = randomBros[idx];

		return true;
	}

	function onPrepare()
	{
		this.m.Flags = this.new("scripts/tools/tag_collection");
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"champion",
			this.m.Champion.getName()
		]);

		this.addPronounVars(_vars, this.m.Champion, "3");
		this.addPronounVars(_vars, this.m.Partner, "4");
		this.addPronounVars(_vars, this.m.RandomBro, "5");
		this.addPronounVars(_vars, this.m.RandomBro2, "6");

		_vars.push([
			"partner",
			this.m.Partner.getName()
		]);

		_vars.push([
			"randombro",
			this.m.RandomBro.getName()
		]);

		_vars.push([
			"randombro2",
			this.m.RandomBro2.getName()
		]);
		
		_vars.push([
			"enemyname",
			this.m.Flags.get("EnemyChampionName")
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
	}

	function onClear()
	{
		this.m.Champion = null;
		this.m.Partner = null;
		this.m.RandomBro = null;
		this.m.RandomBro2 = null;
		this.m.Flags = null;
		this.m.Town = null;
	}

	function startCombat( _event )
	{
		local name = _event.m.Flags.get("EnemyChampionName");
		local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
		properties.Music = this.Const.Music.NobleTracks;
		properties.Entities = [];

		properties.Entities.push({
			ID = this.Const.EntityType.Swordmaster,
			Variant = 0,
			Row = 0,
			Name = name,
			Script = "scripts/entity/tactical/humans/swordmaster",
			Faction = this.Const.Faction.Enemy,
			function Callback( _entity, _tag )
			{
				_entity.setName(name);
			}
		});

		properties.Players.push(_event.m.Champion);
		properties.IsUsingSetPlayers = true;
		properties.IsFleeingProhibited = true;
		properties.IsAttackingLocation = true;
		properties.BeforeDeploymentCallback = function ()
		{
			local size = this.Tactical.getMapSize();

			for( local x = 0; x < size.X; x++ )
			{
				for( local y = 0; y < size.Y; y++ )
				{
					local tile = this.Tactical.getTileSquare(x, y);
					tile.Level = this.Math.min(1, tile.Level);
				}
			}
		};
		_event.registerToShowAfterCombat("Victory", "Defeat");
		this.World.State.startScriptedCombat(properties, false, false, false);
	}
});
