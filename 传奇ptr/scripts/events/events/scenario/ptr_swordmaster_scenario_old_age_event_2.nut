this.ptr_swordmaster_scenario_old_age_event_2 <- this.inherit("scripts/events/event", {
	m = {
		Swordmaster = null	
	},
	function create()
	{
		this.m.ID = "event.ptr_swordmaster_scenario_old_age_2";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_17.png[/img]{You wake up once more inside your humble tent to the bustle of your students preparing for the day. The scent of a freshly made stew of wild roots, game meat, and other dubiously sourced foodstuffs wafts across your numb nose. At first this seems like any other normal day, but that quickly changes as you rise from your bedroll. Laboring to rise to your feet, bright lights flash across your vision and dizziness takes hold of you as you wobbling back and forth upon your normally deft and quick feet. This feeling fades as fast as it came, however, and you step out into the bright morning sunlight…\n\nSeveral of your students are already committed to the day. Stretching, lifting, running, and even training. Endless energy and stamina fill their bodies as they laugh and jest with one another. A sense of close comradery amongst them, together under your tutelage and leadership. %randombrother% looks at you and beams a smile forth, gesturing you closer to an iron pot precariously hung over a campfire.%SPEECH_ON%Master! Good morning to you! Come, sit with us!%SPEECH_OFF%With a small smile, you make your way over, as spry as ever, and sit down. Immersing yourself into the commotion and conversations of your students.%SPEECH_ON%It is good to see you up, some of us wondered if you would arise at all!%SPEECH_OFF%%randombrother2% jeers, nudging you playfully. You click your tongue, pausing midway through taking a bowl of food for yourself, and turn your head, cocking your brow.%SPEECH_ON%What do you mean?%SPEECH_OFF%%They2% pauses and shrugs, choosing %their2% words carefully.%SPEECH_ON%Well… You usually are up before us, is all. We worried you had perhaps fallen into a deep slumber.%SPEECH_OFF%%They2% states hesitantly, squirming on the log %they2% is sitting on.\n\nWith a scoff you shake your head.%SPEECH_ON%I\'m not that damn old, watch your tongue. I am just as spry and lively as the rest of you lot. And don\'t you forget it!%SPEECH_OFF%You shake your fist and take a scoop of stew, dumping the slop into your wooden bowl and begin to eat silently. Deep down, you find yourself contemplating on the grim truth behind your student\'s lighthearted jest.}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Time takes its toll...",
					function getResult( _event )
					{
						_event.m.Swordmaster.getSkills().removeByID("perk.ptr_swordmaster_grappler");
						_event.m.Swordmaster.getBackground().removePerk(::Const.Perks.PerkDefs.PTRSwordmasterGrappler);
						return 0;
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
						text = _event.m.Swordmaster.getName() + " loses the Grappler perk"
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
		this.m.Title = "A Lighthearted Jest";
		foreach (bro in this.World.getPlayerRoster().getAll())
		{
			if (bro.getSkills().hasSkill("effects.ptr_swordmaster_scenario_avatar"))
			{
				this.m.Swordmaster = bro;
				break;
			}
		}
	}
});
