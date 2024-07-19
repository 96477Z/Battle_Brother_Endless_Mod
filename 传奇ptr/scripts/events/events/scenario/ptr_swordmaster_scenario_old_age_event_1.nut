this.ptr_swordmaster_scenario_old_age_event_1 <- this.inherit("scripts/events/event", {
	m = {
		Swordmaster = null
	},
	function create()
	{
		this.m.ID = "event.ptr_swordmaster_scenario_old_age_1";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_17.png[/img]{%SPEECH_START%Strike! Defend! Counter-thrust! Expose your enemy so you may strike them down!%SPEECH_OFF%You bark commands towards your wards, their lively drills repeating until they perfectly master the combination. Your chest swells with pride as you see one of your wards, %randombrother%, perfectly executing a diagonal slash, before pulling back into %their1% guard and knocking away the counter blow - pushing the attack upwards and sliding %their1% blade across to press it right into %their1% partner\'s chest. %they1% repeats the motion several times, with several different partners, until %they1% meets your gaze.%SPEECH_ON%Master! Perhaps you would allow me to test the combination upon you? I believe I have mastered it!%SPEECH_OFF%With a chuckle, you nod and step forward. Taking a federschwert from another student and bracing yourself into a proper position. Raising both arms above your head, you set yourself into a high guard. Bending your creaky knees and awaiting the attack patiently. After a brief wait, %they1% strikes. Leading with %their1% wooden blade, %they1% attempts to drive %their1% weapon into your chest with a lunge. In response, you quickly bring down your guard and smack the weapon aside, pushing forward and attempting a thrust of your own. %randombrother% manages to raise up %their1% weapon and bat your feder into the air, leaving you vulnerable for a brief moment - much to your surprise as your back knee starts to buckle under your own weight!\n\nJust before the counter-strike lands, you manage to step off-line and knock the blow away with a quick, half crescent cut. Striking both the blade and your ward\'s exposed weapon hand with the blunt metal. Crossing your wrists over and following through quite cleanly. Immediately your lively ward steps back and laughs, slapping the strike area and proclaiming %SPEECH_START%Hit!%SPEECH_OFF%Breath labors to get into your lungs after this display. A hint of fatigue creeping into your arms despite such a simple motion. One you have practiced many times before without breaking a sweat. Attempting to disguise this fatigue, you gesture %randombrother% closer and sit upon a tree stump, instructing %them1% on how to better defend against longsword swings.}",
        	Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I\'ve still got it!",
					function getResult( _event )
					{
						_event.m.Swordmaster.getSkills().removeByID("perk.ptr_swordmaster_juggernaut");
						_event.m.Swordmaster.getBackground().removePerk(::Const.Perks.PerkDefs.PTRSwordmasterJuggernaut);
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
				this.List = [
					{
						id = 16,
						icon = "ui/backgrounds/ptr_old_swordmaster_background.png",
						text = _event.m.Swordmaster.getName() + " grows older"
					},
					{
						id = 16,
						icon = "ui/backgrounds/ptr_old_swordmaster_background.png",
						text = _event.m.Swordmaster.getName() + " loses the Juggernaut perk"
					},
					{
						id = 16,
						icon = "ui/backgrounds/ptr_old_swordmaster_background.png",
						text = _event.m.Swordmaster.getName() + " will lose Fatigue, Hitpoints and Initiative over time"
					}
				];
			}
		});
	}

	function onPrepare()
	{
		this.m.Title = "A Simple Motion";
		local bros = this.World.getPlayerRoster().getAll();
		foreach (i, bro in bros)
		{
			if (bro.getSkills().hasSkill("effects.ptr_swordmaster_scenario_avatar"))
			{
				this.m.Swordmaster = bro;
				bros.remove(i);
			}
		}
	}
});
