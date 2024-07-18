local gt = getroottable();

local modID = "mod_betterFencing";
::mods_registerMod(modID, 1.6, "Better Fencing 1.6.6");

gt.ModBetterFencing <- {};

::mods_queue(modID, "mod_msu, >mod_legends", function () {
	// gt.Const.AI.VerboseMode = true;

	this.Const.Items.addNewWeaponType("BFFencing", "Fencing");

	local id = gt.Const.AI.Behavior.ID.COUNT;
	gt.Const.AI.Behavior.ID.BFAttackLunge <- id;
	gt.Const.AI.Behavior.Name.push("Attack.BF_Lunge");
	gt.Const.AI.Behavior.ID.COUNT = id + 1;

	gt.Const.AI.Behavior.Order.BFAttackLunge <- this.Const.AI.Behavior.Order.Darkflight;
	gt.Const.AI.Behavior.Score.BFAttackLunge <- this.Const.AI.Behavior.Score.Attack;

	::mods_hookExactClass("ai/tactical/behaviors/ai_charge", function ( o ) {
		o.m.PossibleSkills.push("actives.bf_lunge_charge_dummy");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_default", function ( o ) {
		o.m.PossibleSkills.push("actives.bf_sword_thrust");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_engage_melee", function ( o ) {
		o.m.PossibleSkills.push("actives.bf_lunge_charge_dummy");
		local oldfunc = o.onExecute;
		o.onExecute = function( _entity )
		{
			if (this.m.IsFirstExecuted)
			{
				if (this.m.Skill != null && this.m.Skill.getID() == "actives.bf_lunge_charge_dummy")
				{
					this.m.Skill = null;
					local skill = _entity.getSkills().getSkillByID("actives.lunge");
					if (skill != null && skill.isUsable() && skill.isAffordable())
					{
						this.m.Skill = skill;
						this.m.TargetTile = this.m.TargetActor.getTile();
					}
				}
			}

			return oldfunc(_entity);
		}
	});

	gt.Const.Strings.PerkName.BFFencer <- "Fencer";
	gt.Const.Strings.PerkDescription.BFFencer <- "Master the art of fighting with a nimble sword. When using a fencing sword, skills build up [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] less Fatigue and gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] chance to hit. Additionally, the Action Point costs of Sword Thrust, Riposte and Lunge are reduced by [color=" + this.Const.UI.Color.NegativeValue + "]1[/color].";

	local perk = {
		ID = "perk.bf_fencer",
		Script = "scripts/skills/perks/perk_bf_fencer",
		Name = this.Const.Strings.PerkName.BFFencer,
		Tooltip = this.Const.Strings.PerkDescription.BFFencer,
		Icon = "ui/perks/bf_fencer.png",
		IconDisabled = "ui/perks/bf_fencer_bw.png",
	};

	gt.Const.Perks.Perks[6].push(perk);
	perk.Row <- 6;
	perk.Unlocks <- 6;
	gt.Const.Perks.LookupMap[perk.ID] <- perk;

	gt.ModBetterFencing.modSkills();
	gt.ModBetterFencing.modWeapons();

	if ("LegendMod" in gt.Const)
	{
		::mods_hookNewObject("ai/tactical/behaviors/ai_attack_default", function ( o ) {
			local idx = o.m.PossibleSkills.find("actives.lunge");
			if (idx != null)
			{
				o.m.PossibleSkills.remove(idx);
			}
		});

		gt.Const.Strings.PerkDescription.BFFencer <- "Master the art of fighting with a nimble sword. Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] less Fatigue and gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] chance to hit when using a fencing sword.\n\nFor two-handed fencing swords the range of Lunge is increased by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] tile.\n\nFor one-handed fencing swords, the Action Point costs of Sword Thrust, Riposte and Lunge are reduced by [color=" + this.Const.UI.Color.NegativeValue + "]1[/color].\n[color=#0b0084]From the Sword perk group[/color]";

		local perkDefObjects = [
			{
				ID = "perk.bf_fencer",
				Script = "scripts/skills/perks/perk_bf_fencer",
				Name = this.Const.Strings.PerkName.BFFencer,
				Tooltip = this.Const.Strings.PerkDescription.BFFencer,
				Icon = "ui/perks/bf_fencer.png",
				IconDisabled = "ui/perks/bf_fencer_bw.png",
				Const = "BFFencer"
			}
		];
		this.Const.Perks.addPerkDefObjects(perkDefObjects)

		while (this.Const.Perks.SwordTree.Tree.len() < 7)
		{
			local emptyArray = [];
			this.Const.Perks.SwordTree.Tree.push(emptyArray);
		}
		this.Const.Perks.SwordTree.Tree[6].push(this.Const.Perks.PerkDefs.BFFencer);

		while (this.Const.Perks.GreatSwordTree.Tree.len() < 7)
		{
			local emptyArray = [];
			this.Const.Perks.GreatSwordTree.Tree.push(emptyArray);
		}
		this.Const.Perks.GreatSwordTree.Tree[6].push(this.Const.Perks.PerkDefs.BFFencer);

		this.Const.Tactical.Actor.LegendFencer.ActionPoints = 9;

		::mods_hookExactClass("entity/tactical/humans/legend_noble_fencer", function(o) {
			local onInit = o.onInit;
			o.onInit = function()
			{
				onInit();

				this.m.Skills.add(this.new("scripts/skills/perks/perk_bf_fencer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
			}
		});

		::mods_hookExactClass("ai/tactical/agents/legend_fencer_agent", function (o) {
			o.m.IsFirstTurn <- true;
			o.create = function()
			{
				this.agent.create();
				this.m.ID = this.Const.AI.Agent.ID.MilitaryMelee;
				this.m.Properties.TargetPriorityHitchanceMult = 0.5;
				this.m.Properties.TargetPriorityHitpointsMult = 0.25;
				this.m.Properties.TargetPriorityRandomMult = 0.0;
				this.m.Properties.TargetPriorityDamageMult = 1.5;
				this.m.Properties.TargetPriorityFleeingMult = 0.5;
				this.m.Properties.TargetPriorityHittingAlliesMult = 0.1;
				this.m.Properties.TargetPriorityFinishOpponentMult = 3.0;
				this.m.Properties.TargetPriorityCounterSkillsMult = 0.5;
				this.m.Properties.TargetPriorityArmorMult = 0.75;
				this.m.Properties.OverallDefensivenessMult = 0.9;
				this.m.Properties.OverallFormationMult = 0.0;
				this.m.Properties.EngageFlankingMult = 10.0;
				this.m.Properties.EngageTargetMultipleOpponentsMult = 0.25;
				this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.5;
				this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 2.0;
				this.m.Properties.PreferCarefulEngage = true;
				this.m.Properties.EngageRangeMin = 1;
				this.m.Properties.EngageRangeMax = 2;
				this.m.Properties.EngageRangeIdeal = 2;
			}

			o.onAddBehaviors = function()
			{
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_flee"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));

				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_wake_up_ally"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));

				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_riposte"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_recover"));

				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_bf_attack_lunge"));
				this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_charge"));
			}

			o.onUpdate <- function()
			{
				if (this.m.IsFirstTurn)
				{
					this.m.IsFirstTurn = false;
					this.m.Properties.PreferWait = true;
				}
				else
				{
					this.m.Properties.PreferWait = false;
				}
			}
		});
	}
});
