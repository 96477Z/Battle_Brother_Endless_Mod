this.ptr_realize_potential_event <- this.inherit("scripts/events/event", {
	m = {
		Dude = null
	},
	function create()
	{
		this.m.ID = "event.ptr_realize_potential";
		this.m.Title = "Along the road...";
		this.m.Cooldown = this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_82.png[/img]{You find %pauper% stretching about with surprising limberness, and looks nothing at all like the weak, worn down figure you found abandoned once. Spotting you, the mercenary nods and comes over with a quiet voice.%SPEECH_ON%I\'m glad you trusted in me, captain. Perhaps you did it out of the kindness of your heart, but I need to show you something.%SPEECH_OFF%He shows you the scars that he has earned while fighting for the company, and the strength that his once fragile body has gained through them. He shows you his skills his weapons, which are impressive indeed. This is not the man you once knew, but rather one hell of a mercenary if there ever was one.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I\'m glad I put my faith in you.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Dude.getImagePath());

				local hasPunchingBag = false;
				if (_event.m.Dude.getSkills().hasSkill("perk.ptr_punching_bag"))
				{
					hasPunchingBag = true;
				}
				local hasTraumaSurvivor = false;
				if (_event.m.Dude.getSkills().hasSkill("perk.ptr_trauma_survivor"))
				{
					hasTraumaSurvivor = true;
				}

				local bg = this.new("scripts/skills/backgrounds/sellsword_background");
				bg.m.IsNew = false;
				local oldPerkTree = _event.m.Dude.getBackground().m.CustomPerkTree;
				foreach (skill in _event.m.Dude.getSkills().m.Skills)
				{
					if (skill.getID().find("background") != null)
					{
						_event.m.Dude.getSkills().removeByID(skill.getID());
						break;
					}
				}
				_event.m.Dude.getSkills().add(bg);
				_event.m.Dude.getBackground().m.RawDescription = "Once a dreg of society, with your help, %name% has grown into a full-fledged mercenary.";
				_event.m.Dude.getBackground().buildDescription(true);
				_event.m.Dude.getBackground().rebuildPerkTree(oldPerkTree);
				_event.m.Dude.resetPerks();
				_event.m.Dude.improveMood(1.0, "Realized potential");

				if (hasPunchingBag)
				{
					_event.m.Dude.getSkills().add(this.new("scripts/skills/perks/perk_ptr_punching_bag"));
				}
				if (hasTraumaSurvivor)
				{
					_event.m.Dude.getSkills().add(this.new("scripts/skills/perks/perk_ptr_trauma_survivor"));
				}

				if (_event.m.Dude.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Dude.getMoodState()],
						text = _event.m.Dude.getName() + this.Const.MoodStateEvent[_event.m.Dude.getMoodState()]
					});
				}

				_event.m.Dude.getBaseProperties().MeleeSkill += 10;
				_event.m.Dude.getBaseProperties().MeleeDefense += 10;
				_event.m.Dude.getBaseProperties().RangedDefense += 10;
				_event.m.Dude.getBaseProperties().Hitpoints += 10;
				_event.m.Dude.getBaseProperties().Stamina += 10;
				_event.m.Dude.getBaseProperties().Initiative += 10;
				_event.m.Dude.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Melee Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Ranged Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_skill.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Melee Skill"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/fatigue.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Max Fatigue"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/initiative.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Initiative"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/health.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Hitpoints"
				});
				if (hasPunchingBag)
				{
					this.List.push({
						id = 16,
						icon = "ui/icons/special.png",
						text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+1[/color] Perk Point and the Punching Bag perk becomes permanent"
					});
				}
				if (hasTraumaSurvivor)
				{
					this.List.push({
						id = 16,
						icon = "ui/icons/special.png",
						text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+1[/color] Perk Point and the Trauma Survivor perk becomes permanent"
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		this.m.Score = 0;
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"pauper",
			this.m.Dude.getNameOnly()
		]);
	}

	function onClear()
	{
		this.m.Dude = null;
	}

});
