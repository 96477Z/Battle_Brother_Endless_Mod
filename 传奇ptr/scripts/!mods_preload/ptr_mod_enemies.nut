local gt = this.getroottable();

gt.PTR.modEnemies <- function()
{
	this.Const.Tactical.Actor.LegendStollwurm.ActionPoints = 7;
	this.Const.Tactical.Actor.GoblinFighter.Bravery = 55;		
	this.Const.Tactical.Actor.BanditWarlord.Hitpoints = 200;
	this.Const.Tactical.Actor.BanditWarlord.Bravery = 140;	
	this.Const.Tactical.Actor.BanditWarlord.MeleeSkill = 110;
	this.Const.Tactical.Actor.BanditWarlord.MeleeDefense = 30;
	this.Const.Tactical.Actor.BanditWarlord.RangedDefense = 30;
	this.Const.Tactical.Actor.BanditWarlord.Initiative = 170;
	this.Const.Tactical.Actor.BanditWarlord.FatigueRecoveryRate = 20;
	this.Const.Tactical.Actor.Mercenary.Hitpoints = 90;
	this.Const.Tactical.Actor.Mercenary.MeleeDefense = 20;

	::mods_hookExactClass("entity/tactical/goblin", function(o) {
		local onInit = o.onInit;
		o.onInit = function ()
		{
			onInit();
			this.getSkills().add(this.new("scripts/skills/racial/ptr_goblin_racial"));
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/alp", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/alp_shadow", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/bandit_leader", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.removeByID("perk.sundering_strikes");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_shields_up"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rally_the_troops"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_hold_the_line"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_push_forward"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
				this.m.Skills.removeByID("perk.legend_composure");
				this.m.Skills.removeByID("perk.underdog");
				this.m.Skills.removeByID("perk.relentless");				

			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.Protect) != null)
			{
				agent.removeBehavior(this.Const.AI.Behavior.ID.Protect);
				agent.finalizeBehaviors();
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local weapon = this.getMainhandItem();
			local off = this.getOffhandItem();
			if (weapon == null && off != null)
			{
				this.m.Items.unequip(off);
				this.m.Items.equip(this.new("scripts/items/weapons/legend_glaive"));
			}

			if (weapon != null)
			{
				if (weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
					}

					this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
				}
				else
				{
					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
						this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition")); 
					}
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}
			}

			this.m.Skills.addTreeOfEquippedWeapon();
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));					
				}
			}

			return ret;
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_marksman", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByID("perk.close_combat_archer");

			this.m.Skills.addTreeOfEquippedWeapon(4);

			if (this.Math.rand(1,100) <= 25)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flaming_arrows"));
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));				
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/bandit_marksman_low", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/bandit_poacher", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));								
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));

				local weapon = this.getMainhandItem();
				if (weapon != null)
				{
					if (weapon.isWeaponType(this.Const.Items.WeaponType.Sling))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_sling_skill"));
					}
					else
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
					}
				}

			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_rabble", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Hammer))
				{
					this.m.Skills.addTreeOfEquippedWeapon(2);
				}
				else
				{
					this.m.Skills.addTreeOfEquippedWeapon(1);
				}
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("effects.dodge");				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));				
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_rabble_poacher", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.backstabber");
				this.m.Skills.removeByID("trait.determined");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));				
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_raider", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			local offhandItem = this.getOffhandItem();
			if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			}
			else
			{
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				local mainhandItem = this.getMainhandItem();
				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.OneHanded))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				}
			}

			this.m.Skills.addTreeOfEquippedWeapon(4);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));				
				this.m.Skills.addTreeOfEquippedWeapon(5);

				local offhandItem = this.getOffhandItem();
				if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));	
				}
				else
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));	
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_raider_low", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);

			this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			this.m.Skills.addTreeOfEquippedWeapon(3);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));

				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));								
				this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
				this.m.Skills.addTreeOfEquippedWeapon(4);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_raider_wolf", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));

			this.m.Skills.addTreeOfEquippedWeapon(4);

			if (this.LegendsMod.Configs().LegendTherianthropyEnabled())
			{
				if (this.Math.rand(1, 10) == 1)
				{
					this.m.Skills.add(this.new("scripts/skills/injury_permanent/legend_lycanthropy_injury"));
					this.m.Skills.add(this.new("scripts/skills/traits/weasel_trait"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_back_to_basics"));
				}
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
				this.m.Skills.addTreeOfEquippedWeapon(5);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/bandit_thug", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));

			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Spear) || weapon.isWeaponType(this.Const.Items.WeaponType.Sword) || weapon.isWeaponType(this.Const.Items.WeaponType.Hammer))
				{
					this.m.Skills.addTreeOfEquippedWeapon(3);
				}
				else
				{
					this.m.Skills.addTreeOfEquippedWeapon(2);
				}
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("effects.dodge");								
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/direwolf", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bear_down"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));


			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));
				local b = this.getBaseProperties();
				b.MeleeDefense += 10;
				b.RangedDefense += 10;
				local c = this.getCurrentProperties();
				c.MeleeDefense += 10;
				c.RangedDefense += 10;
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/direwolf_high", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));


			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.nimble");				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/ghost", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.getFlags().add("ghost");
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/ghost_knight", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.getFlags().add("ghost");
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/ghoul", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_cuts"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_muscularity");
				local b = this.getBaseProperties();
				b.MeleeDefense += 5;
				b.RangedDefense += 5;
				local c = this.getCurrentProperties();
				c.MeleeDefense += 5;
				c.RangedDefense += 5;
				// in new mod replace +5 mdef/rdef with dodge this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodlust"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/ghoul_high", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/traits/iron_jaw_trait"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodbath"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/ghoul_medium", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/traits/iron_jaw_trait"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodbath"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/goblin_ambusher", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_marksmanship"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addPerkTree(this.Const.Perks.DaggerTree, 4);
			}
			else
			{
				this.m.Skills.addPerkTree(this.Const.Perks.DaggerTree, 3);
			}
			this.m.Skills.addTreeOfEquippedWeapon(5);
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.removeByID("perk.head_hunter");
			}

			return ret;
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/goblin_ambusher_low", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.ptr_ranged_supremacy");
			this.m.Skills.removeByID("perk.mastery.bow");
			this.m.Skills.removeByID("perk.ptr_light_weapon");				

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("effects.dodge");	
				this.m.Skills.removeByID("perk.relentless");
				this.m.Skills.removeByID("perk.berserk");		
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addPerkTree(this.Const.Perks.DaggerTree, 4);
			}
			else
			{
				this.m.Skills.addPerkTree(this.Const.Perks.DaggerTree, 3);
			}
			this.m.Skills.addTreeOfEquippedWeapon(5);
		}
		
	});

	::mods_hookExactClass("entity/tactical/enemies/goblin_fighter", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_tempo"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mastery_nets"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_skirmisher"));						
			local kata = this.new("scripts/skills/perks/perk_ptr_kata");
			kata.m.IsForceEnabled = true;
			this.m.Skills.add(kata);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hybridization"));			
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));		
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(4);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.addTreeOfEquippedWeapon();
				this.m.Skills.addPerkTree(this.Const.Perks.DaggerTree);
				this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
				this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
				this.m.Skills.addPerkTree(this.Const.Perks.ThrowingTree, 4);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fortified_mind"));
			}

			return ret;
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/goblin_fighter_low", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mastery_nets"));					
			local kata = this.new("scripts/skills/perks/perk_ptr_kata");
			kata.m.IsForceEnabled = true;
			this.m.Skills.add(kata);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{			
				this.m.Skills.addTreeOfEquippedWeapon(3);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(2);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/goblin_leader", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.getBaseProperties().DamageDirectMult = 1.0;
			this.m.Skills.addPerkTree(this.Const.Perks.SwordTree, 7);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_power_shot"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.removeByID("perk.inspiring_presence");
				this.m.Skills.removeByID("perk.legend_composure");
			}
		}

	});

	#
	# ::mods_hookExactClass("entity/tactical/enemies/goblin_shaman", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/goblin_wolfrider", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.DaggerTree, 3);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bear_down"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			local kata = this.new("scripts/skills/perks/perk_ptr_kata");
			kata.m.IsForceEnabled = true;
			this.m.Skills.add(kata);

			if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 50)
			{
				if (this.World.getTime().Days < 100)
				{
					local b = this.getBaseProperties();
					b.MeleeDefense += 5;
					b.RangedDefense += 5;
					local c = this.getCurrentProperties();
					c.MeleeDefense += 5;
					c.RangedDefense += 5;
				}
				else
				{
					this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				}
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.fast_adaption");					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_push_the_advantage"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(5);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/hexe", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/hyena", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			local softMetalPerk = this.new("scripts/skills/perks/perk_ptr_soft_metal");
			softMetalPerk.m.IsForceEnabled = true;
			this.m.Skills.add(softMetalPerk);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodlust"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));				
				local dismantlePerk = this.new("scripts/skills/perks/perk_ptr_dismantle");
				dismantlePerk.m.IsForceEnabled = true;
				this.m.Skills.add(dismantlePerk);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/hyena_high", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_cuts"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				maulerPerk.m.IsForceEnabled = true;
				this.m.Skills.add(maulerPerk);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/kobold_fighter", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/kobold_wolfrider", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/kraken", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/kraken_tentacle", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/legend_bandit_outrider", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/legend_bandit_veteran", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByType(this.Const.SkillType.Perk);
			this.m.Skills.addTreeOfEquippedWeapon();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);	

			this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			//this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_lithe"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));				
				this.m.Skills.addPerkTree(this.Const.Perks.ThrowingTree);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));

				local weapon = this.getMainhandItem();
				if (weapon != null)
				{
					if(weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
					}

					if (weapon.isWeaponType(this.Const.Items.WeaponType.Polearm))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));			
					}
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_bandit_warlord", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.sundering_strikes");
			this.m.Skills.removeByID("perk.rally_the_troops");
			this.m.Skills.removeByID("perk.legend_full_force");
			this.m.Skills.removeByID("perk.lone_wolf");	
			this.m.Skills.removeByID("perk.legend_composure");	
			this.m.Skills.removeByID("perk.underdog");		
			this.m.Skills.removeByID("perk.legend_true_believer");										
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));	
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));		

			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.relentless");				
				this.m.Skills.removeByID("perk.legend_lithe");	
				this.m.Skills.removeByID("effects.dodge");		
				this.m.Skills.removeByID("perk.legend_battleheart");	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_rally_the_troops"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));										
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.Protect) != null)
			{
				agent.removeBehavior(this.Const.AI.Behavior.ID.Protect);
				agent.finalizeBehaviors();
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local weapon = this.getMainhandItem();
			local off = this.getOffhandItem();
			if (weapon == null && off != null)
			{
				this.m.Items.unequip(off);
				this.m.Items.equip(this.new("scripts/items/weapons/legend_battle_glaive"));
			}
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_banshee", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.getFlags().add("ghost");
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_bear", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.removeByID("perk.steel_brow");


			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				maulerPerk.m.IsForceEnabled = true;
				this.m.Skills.add(maulerPerk);				
				this.m.Skills.removeByID("perk.last_stand");
			}
		}
	});



	# ::mods_hookExactClass("entity/tactical/enemies/legend_catapult", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/legend_demon_alp", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/enemies/legend_demon_hound", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.nimble");
		}
	});
	
	::mods_hookExactClass("entity/tactical/enemies/legend_greenwood_schrat", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Hitpoints = this.getBaseProperties().Hitpoints;						 		
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/legend_greenwood_schrat_small", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/enemies/legend_hexe_leader", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
			}
		}
	});
	#
	# ::mods_hookExactClass("entity/tactical/enemies/legend_horse", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/enemies/legend_mummy_heavy", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);			
			this.m.Skills.removeByID("perk.legend_slaughter");
			this.m.Skills.removeByID("perk.legend_bloodbath");
			// if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			// {

			// }
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_mummy_light", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (this.isArmedWithMeleeWeapon())
			{
				this.m.Skills.addTreeOfEquippedWeapon(3);
			}

			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));

			if (this.Math.rand(1,100) <= 25)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hip_shooter"));
			}

		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_mummy_medium", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(5);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));

			if (this.Math.rand(1,100) <= 25)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
			}

		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_mummy_priest", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}

	});

	::mods_hookExactClass("entity/tactical/enemies/legend_mummy_queen", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_feint"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_tempo"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fluid_weapon"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_en_garde"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_orc_behemoth", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.removeByID("perk.duelist");
			this.m.Skills.removeByID("perk.berserk");			

			this.m.Skills.add(this.new("scripts/skills/racial/ptr_orc_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));				

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local intimidatePerk = this.new("scripts/skills/perks/perk_ptr_intimidate");
				intimidatePerk.m.IsForceEnabled = true;
				this.m.Skills.add(intimidatePerk);			
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));					
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.legend_second_wind");				
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.removeByID("perk.adrenalin");				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			}

			return ret;
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			this.m.Skills.removeByID("perk.ptr_kata");
			this.m.Skills.removeByID("perk.ptr_swordlike");	
			this.m.Skills.removeByID("perk.ptr_exploit_opening");					
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_orc_elite", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.removeByID("perk.duelist");
			this.m.Skills.removeByID("perk.perfect_focus");					

			this.m.Skills.add(this.new("scripts/skills/racial/ptr_orc_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				local intimidatePerk = this.new("scripts/skills/perks/perk_ptr_intimidate");
				intimidatePerk.m.IsForceEnabled = true;
				this.m.Skills.add(intimidatePerk);
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.underdog");								
				this.m.Skills.removeByID("perk.legend_full_force");	
				this.m.Skills.removeByID("perk.legend_second_wind");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));												
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));			
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));			

			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			this.m.Skills.removeByID("perk.ptr_kata");
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			this.m.Skills.removeByID("perk.last_stand");
			return ret;
		}			
	});

	# ::mods_hookExactClass("entity/tactical/enemies/legend_redback_spider", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	# ::mods_hookExactClass("entity/tactical/enemies/legend_redback_spider_bodyguard", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/legend_rock_unhold", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Hitpoints = this.getBaseProperties().Hitpoints;			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);
			this.m.Skills.addPerkTree(this.Const.Perks.HammerTree);
			this.m.Skills.getSkillByID("perk.ptr_dismantle").m.IsForceEnabled = true;
			local dentArmorPerk = this.m.Skills.getSkillByID("perk.ptr_dent_armor");
			dentArmorPerk.m.IsForceEnabled = true;
			dentArmorPerk.m.IsForceTwoHanded = true;

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			this.m.Skills.removeByID("perk.last_stand");
			
			local returnFavor = this.new("scripts/skills/effects/return_favor_effect");
			returnFavor.onTurnStart = function() {}; // overwrite the original function which removes it
			this.m.Skills.add(returnFavor);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_skeleton_gladiator", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_two_for_one"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_a_better_grip"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_through_the_gaps"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hybridization"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_skin_ghoul", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			this.m.Skills.add(this.new("scripts/skills/traits/iron_jaw_trait"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_cuts"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodlust"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_skin_ghoul_high", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_dismemberment"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodbath"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sanguinary"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_skin_ghoul_med", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodbath"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sanguinary"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_stollwurm", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			// this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			// this.m.Skills.addPerkTree(this.Const.Perks.AxeTree);
			// this.m.Skills.getSkillByID("perk.ptr_cull").m.IsForceEnabled = true;

			// this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));

			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);

			// local softMetalPerk = this.new("scripts/skills/perks/perk_ptr_soft_metal");
			// softMetalPerk.m.IsForceEnabled = true;
			// this.m.Skills.add(softMetalPerk);

			// local dentArmorPerk = this.new("scripts/skills/perks/perk_ptr_dent_armor");
			// dentArmorPerk.m.IsForceEnabled = true;
			// dentArmorPerk.m.IsForceTwoHanded = true;
			// this.m.Skills.add(dentArmorPerk);
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
				this.m.ActionPoints = this.getBaseProperties().ActionPoints;		
				// local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				// maulerPerk.m.IsForceEnabled = true;
				// this.m.Skills.add(maulerPerk);
			}
		}
	});
	
	::mods_hookExactClass("entity/tactical/enemies/legend_stollwurm_tail", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
			this.m.ActionPoints = this.getBaseProperties().ActionPoints;		 		
		}
	});
	

	::mods_hookExactClass("entity/tactical/enemies/legend_vampire_lord", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_cleaver"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_cuts"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sanguinary"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodbath"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_swordlike"));
			}
		}
	});


	::mods_hookExactClass("entity/tactical/enemies/legend_white_direwolf", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
				local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				maulerPerk.m.IsForceEnabled = true;
				this.m.Skills.add(maulerPerk);
			}
		}
	});

	#
	# ::mods_hookExactClass("entity/tactical/enemies/legend_white_direwolf_bodyguard", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/lindwurm", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.AxeTree);
			this.m.Skills.getSkillByID("perk.ptr_cull").m.IsForceEnabled = true;

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);

			local softMetalPerk = this.new("scripts/skills/perks/perk_ptr_soft_metal");
			softMetalPerk.m.IsForceEnabled = true;
			this.m.Skills.add(softMetalPerk);

			local dentArmorPerk = this.new("scripts/skills/perks/perk_ptr_dent_armor");
			dentArmorPerk.m.IsForceEnabled = true;
			dentArmorPerk.m.IsForceTwoHanded = true;
			this.m.Skills.add(dentArmorPerk);
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
				this.m.ActionPoints = this.getBaseProperties().ActionPoints;					
				local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				maulerPerk.m.IsForceEnabled = true;
				this.m.Skills.add(maulerPerk);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/lindwurm_tail", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
			this.m.ActionPoints = this.getBaseProperties().ActionPoints;				
			this.m.Skills.addPerkTree(this.Const.Perks.HammerTree, 4);
			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/necromancer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);	
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/orc_berserker", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.removeByID("perk.duelist");
			this.m.Skills.removeByID("perk.last_stand");

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/racial/ptr_orc_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));	

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.getBaseProperties().MeleeSkill -= 10;
				this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));				
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon();
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/orc_warlord", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.removeByID("perk.duelist");

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/racial/ptr_orc_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_true_believer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.inspiring_presence");				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));									
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			}

			return ret;
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/orc_warrior", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/racial/ptr_orc_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));						
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
			}

			this.m.Skills.removeByID("perk.ptr_kata");
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/orc_warrior_low", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/orc_young", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/racial/ptr_orc_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));

			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(4);
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/orc_young_low", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/enemies/sand_golem", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));		
			this.m.Skills.removeByID("perk.last_stand");

		}
	});
	#
	# ::mods_hookExactClass("entity/tactical/enemies/schrat", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/enemies/schrat_small", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/enemies/serpent", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			local btrPerk = this.new("scripts/skills/perks/perk_ptr_between_the_ribs");
			btrPerk.m.IsForceEnabled = true;
			this.m.Skills.add(btrPerk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local fasPerk = this.new("scripts/skills/perks/perk_ptr_from_all_sides");
				fasPerk.m.IsForceEnabled = true;
				this.m.Skills.add(fasPerk);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				local poisonEffect = this.new("scripts/skills/effects/poison_coat_effect");
				poisonEffect.m.Name = "Serpent Venom";
				this.m.Skills.add(poisonEffect);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_adrenalin"));
			}
		}
	});
	
	::mods_hookExactClass("entity/tactical/enemies/skeleton_boss", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));			
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));											
			}	 		
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/skeleton_heavy", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));				
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
			}

			return ret;
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/skeleton_heavy_bodyguard", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));				
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/skeleton_heavy_polearm", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/skeleton_lich", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/skeleton_light", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.shield_expert");
				this.m.Skills.removeByID("perk.crippling_strikes");
				this.m.Skills.removeByID("perk.coup_de_grace");		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));																	
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(3);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/skeleton_medium", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));

			if (this.Math.rand(1,100) <= 25)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(5);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/skeleton_medium_polearm", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(6);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/skeleton_priest", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);	 		
		}
	});
	
	::mods_hookExactClass("entity/tactical/enemies/spider", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("effects.dodge");							
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));

				if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 30)
				{
					local b = this.getBaseProperties();
					b.MeleeDefense += 10;
					b.RangedDefense += 10;
					local c = this.getCurrentProperties();
					c.MeleeDefense += 10;
					c.RangedDefense += 10;
				}

				if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 90)
				{
					local b = this.getBaseProperties();
					b.MeleeDefense += 10;
					b.RangedDefense += 10;
					local c = this.getCurrentProperties();
					c.MeleeDefense += 10;
					c.RangedDefense += 10;
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/trickster_god", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.nimble");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_internal_hemorrhage"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_impact"));
			local dentArmorPerk = this.new("scripts/skills/perks/perk_ptr_dent_armor");
			dentArmorPerk.m.IsForceEnabled = true;
			dentArmorPerk.m.IsForceTwoHanded = true;
			this.m.Skills.add(dentArmorPerk);

			local returnFavor = this.new("scripts/skills/effects/return_favor_effect");
			returnFavor.onTurnStart = function() {}; // overwrite the original function which removes it
			this.m.Skills.add(returnFavor);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/unhold", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local dismantle = this.new("scripts/skills/perks/perk_ptr_dismantle");
			dismantle.m.IsForceEnabled = true;
			this.m.Skills.add(dismantle);			
			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;
				this.m.Skills.removeByID("perk.legend_battleheart");
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_impact"));												
				local dentArmorPerk = this.new("scripts/skills/perks/perk_ptr_dent_armor");
				dentArmorPerk.m.IsForceEnabled = true;
				dentArmorPerk.m.IsForceTwoHanded = true;
				this.m.Skills.add(dentArmorPerk);

				local returnFavor = this.new("scripts/skills/effects/return_favor_effect");
				returnFavor.onTurnStart = function() {}; // overwrite the original function which removes it
				this.m.Skills.add(returnFavor);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/unhold_armored", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.ptr_survival_instinct");
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/unhold_bog", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local dismantle = this.new("scripts/skills/perks/perk_ptr_dismantle");
			dismantle.m.IsForceEnabled = true;
			this.m.Skills.add(dismantle);			
			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;
				this.m.Skills.removeByID("perk.legend_bog_unhold_racial");				
				this.m.Skills.removeByID("perk.legend_battleheart");
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_impact"));												
				local dentArmorPerk = this.new("scripts/skills/perks/perk_ptr_dent_armor");
				dentArmorPerk.m.IsForceEnabled = true;
				dentArmorPerk.m.IsForceTwoHanded = true;
				this.m.Skills.add(dentArmorPerk);

				local returnFavor = this.new("scripts/skills/effects/return_favor_effect");
				returnFavor.onTurnStart = function() {}; // overwrite the original function which removes it
				this.m.Skills.add(returnFavor);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/unhold_frost", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.legend_muscularity");
			this.m.Skills.removeByID("perk.last_stand");

			this.m.Skills.addPerkTree(this.Const.Perks.HammerTree);
			this.m.Skills.getSkillByID("perk.ptr_dismantle").m.IsForceEnabled = true;
			local dentArmorPerk = this.m.Skills.getSkillByID("perk.ptr_dent_armor");
			dentArmorPerk.m.IsForceEnabled = true;
			dentArmorPerk.m.IsForceTwoHanded = true;

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));

			local faPerk = this.new("scripts/skills/perks/perk_ptr_formidable_approach");
			faPerk.m.IsForceEnabled = true;
			this.m.Skills.add(faPerk);

			local returnFavor = this.new("scripts/skills/effects/return_favor_effect");
			returnFavor.onTurnStart = function() {}; // overwrite the original function which removes it
			this.m.Skills.add(returnFavor);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/unhold_frost_armored", function(o) {		
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.ptr_survival_instinct");
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/vampire", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.getBaseProperties().MeleeSkill -= 10;
			this.m.Skills.removeByID("perk.legend_bloodbath");

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.getBaseProperties().IsImmuneToStun = false;
				this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon();
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/wolf", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/zombie", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.nine_lives");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_leverage"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bear_down"));
			local wearDownPerk = this.new("scripts/skills/perks/perk_ptr_wear_them_down");
			wearDownPerk.m.IsForceEnabled = true;
			this.m.Skills.add(wearDownPerk);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));				
				local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				maulerPerk.m.IsForceEnabled = true;
				this.m.Skills.add(maulerPerk);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/zombie_betrayer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				// local cullPerk = this.new("scripts/skills/perks/perk_ptr_cull");
				// cullPerk.m.IsForceEnabled = true;
				// this.m.Skills.add(cullPerk);
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/zombie_boss", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/zombie_knight", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local b = this.getBaseProperties();

			this.m.Skills.removeByID("perk.ptr_kata");

			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bear_down"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
			this.m.Skills.addPerkTree(this.Const.Perks.OneHandedTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.nine_lives");
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));							
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/zombie_nomad", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	# ::mods_hookExactClass("entity/tactical/enemies/zombie_treasure_hunter", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/enemies/zombie_yeoman", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_leverage"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bear_down"));
			local wearDownPerk = this.new("scripts/skills/perks/perk_ptr_wear_them_down");
			wearDownPerk.m.IsForceEnabled = true;
			this.m.Skills.add(wearDownPerk);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.nine_lives");
				this.m.Skills.removeByID("perk.last_stand");				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));								
				local maulerPerk = this.new("scripts/skills/perks/perk_ptr_mauler");
				maulerPerk.m.IsForceEnabled = true;
				this.m.Skills.add(maulerPerk);
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/enemies/zombie_yeoman_bodyguard", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/humans/assassin", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.removeByID("perk.underdog");
			this.m.Skills.removeByID("perk.adrenalin");		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));							

			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
				{
					this.m.Skills.addTreeOfEquippedWeapon(4);
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_kata"));
					this.m.Skills.removeByID("perk.footwork");	
				}
				else if (weapon.isWeaponType(this.Const.Items.WeaponType.Dagger))
				{
					this.m.Skills.addTreeOfEquippedWeapon(5);
				}
			}
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon();
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_alert"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));	
				if (weapon != null)
				{
					if (weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
					}
					else if (weapon.isWeaponType(this.Const.Items.WeaponType.Dagger))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_tempo"));
					}										
				}
			}
		}
	});
	#
	# ::mods_hookExactClass("entity/tactical/humans/barbarian_beastmaster", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });


	::mods_hookExactClass("entity/tactical/humans/barbarian_champion", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.underdog");
			this.m.Skills.removeByID("perk.crippling_strikes");			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sweeping_strikes"));									

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.legend_alert");		
				this.m.Skills.removeByID("perk.legend_balance");
				this.m.Skills.removeByID("perk.backstabber");		
				this.m.Skills.removeByID("perk.mastery_fist");																										
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/humans/barbarian_chosen", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.removeByID("perk.devastating_strikes");	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rally_the_troops"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_balance");
				this.m.Skills.removeByID("perk.backstabber");		
				this.m.Skills.removeByID("perk.mastery_fist");	
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fruits_of_labor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}


		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_devastating_strikes"));
			}

			return ret;
		}
	});

	::mods_hookExactClass("entity/tactical/humans/barbarian_drummer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{

			onInit();
			this.m.Skills.removeByID("perk.underdog");			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			}			
		}
	});

	::mods_hookExactClass("entity/tactical/humans/barbarian_madman", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addPerkTree(this.Const.Perks.CleaverTree);
			this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));				
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/barbarian_marauder", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));
			this.m.Skills.removeByID("perk.underdog");		
			this.m.Skills.removeByID("perk.hold_out");
			this.m.Skills.removeByID("perk.bullseye");						
			
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.legend_alert");	
				this.m.Skills.removeByID("perk.legend_balance");	
				this.m.Skills.removeByID("perk.backstabber");		
				this.m.Skills.removeByID("perk.mastery_fist");											
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));

			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);
			}
			local mainhandItem = this.getMainhandItem();
			if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/barbarian_thrall", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.hold_out");
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.legend_balance");	
				this.m.Skills.removeByID("perk.backstabber");		
				this.m.Skills.removeByID("perk.mastery_fist");											
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(3);
		}
	});

	::mods_hookExactClass("entity/tactical/humans/bounty_hunter", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(4);			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
				this.m.Skills.removeByID("perk.legend_mastery_nets");
				this.m.Skills.removeByID("perk.trophy_hunter");
				this.m.Skills.removeByID("perk.legend_big_game_hunter");
				this.m.Skills.removeByID("perk.legend_back_to_basics");				
				local weapon = this.getMainhandItem();
				local offhandItem = this.getOffhandItem();	

				if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Sword) && weapon.isItemType(this.Const.Items.ItemType.OneHanded))
				{		
					if (offhandItem == null || offhandItem.isItemType(this.Const.Items.ItemType.Tool))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
					}
				}

				if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Tool))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_alert"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mastery_nets"));					
				}

				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_line_breaker"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/bounty_hunter_ranged", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.trophy_hunter");
				this.m.Skills.removeByID("perk.legend_big_game_hunter");
				this.m.Skills.removeByID("perk.legend_back_to_basics");	
				this.m.Skills.removeByID("perk.head_hunter");					
			}
			else
			{
				this.m.Skills.removeByID("perk.nimble");
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_ranged_supremacy"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_bow"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flaming_arrows"));
					}
				}
				else if (weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_through_the_ranks"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));					
					this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_crossbow"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_iron_sights"));
					}
				}
			}

		}
	});

	::mods_hookExactClass("entity/tactical/humans/caravan_guard", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_efficient_packing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_skillful_stacking"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);
				this.m.Skills.removeByID("perk.legend_alert");				
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(3);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/caravan_hand", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(1);
			this.m.Skills.removeByID("perk.underdog");			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_efficient_packing"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_skillful_stacking"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hybridization"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(2);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/conscript", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(4);					
			this.m.Skills.removeByID("perk.fast_adaption");					
			this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));	
			
			if (this.Math.rand(1,100) <= 25)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
			}			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);						
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_alert"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fresh_and_furious"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hale_and_hearty"));			
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));	
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/conscript_polearm", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();			
			this.m.Skills.removeByType(this.Const.SkillType.Perk);
			this.m.Skills.addTreeOfEquippedWeapon(4);			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));							
			this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(7);	
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_alert"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fresh_and_furious"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hale_and_hearty"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/humans/councilman", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/humans/desert_devil", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(5);	

			local mainhandItem = this.getMainhandItem();
			if (mainhandItem != null)
			{
				if(mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sweeping_strikes"));
					}
				}
				else
				{
					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
					}
				}
			}

			this.m.Skills.removeByID("perk.fast_adaption");			
			this.m.Skills.removeByID("perk.adrenalin");
			this.m.Skills.removeByID("perk.underdog");		
			this.m.Skills.removeByID("perk.head_hunter");		
			local kata = this.new("scripts/skills/perks/perk_ptr_kata");
			kata.m.IsForceEnabled = true;
			this.m.Skills.add(kata);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{			
				this.m.Skills.addTreeOfEquippedWeapon(7);	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));		
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));	

				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.OneHanded))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
				}

			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				local cullPerk = this.new("scripts/skills/perks/perk_ptr_cull");
				cullPerk.m.IsForceEnabled = true;
				this.m.Skills.add(cullPerk);

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
				}
			}

			return ret;
		}

	});

	::mods_hookExactClass("entity/tactical/humans/desert_stalker", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.getBaseProperties().Vision = 7;
			this.getBaseProperties().DamageDirectMult = 1.0;
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.head_hunter");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_small_target"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hip_shooter"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flaming_arrows"));																				
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_hair_splitter"));							
				this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));							
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/humans/engineer", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/humans/envoy", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });

	::mods_hookExactClass("entity/tactical/humans/executioner", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.steel_brow");
			this.m.Skills.removeByID("perk.battle_flow");
			this.m.Skills.removeByID("perk.relentless");			
			this.m.Skills.removeByID("perk.devastating_strikes");	
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.crippling_strikes");			
			this.m.Skills.removeByID("perk.coup_de_grace");																	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.underdog");		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));				
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));							
				this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));							
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sweeping_strikes"));
				this.m.Skills.removeByID("perk.reach_advantage");		

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
				}
			}

			return ret;
		}

	});

	# ::mods_hookExactClass("entity/tactical/humans/firstborn", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/humans/gladiator", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			this.m.Skills.addPerkTree(this.Const.Perks.ThrowingTree);
			this.m.Skills.removeByID("perk.fast_adaption");		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));						
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_tempo"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));

				local mainhandItem = this.getMainhandItem();
				local attack = this.getSkills().getAttackOfOpportunity();			    
				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					if (attack != null && !attack.isDuelistValid())
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));	
					}			
				}

				if (attack != null && attack.isDuelistValid())
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
			}

			return ret;
		}
	});

	::mods_hookExactClass("entity/tactical/humans/gunner", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_muscle_memory"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_take_aim"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_power_shot"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			}
		}

	});

	::mods_hookExactClass("entity/tactical/humans/hedge_knight", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.devastating_strikes");				
			this.m.Skills.removeByID("perk.battle_flow");		
			this.m.Skills.removeByID("perk.fearsome");
			this.m.Skills.removeByID("perk.fast_adaption");		
			this.m.Skills.removeByID("perk.crippling_strikes");		
			this.m.Skills.removeByID("perk.berserk");	
			this.m.Skills.removeByID("perk.killing_frenzy");
			this.m.Skills.removeByID("perk.last_stand");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));								

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.steel_brow");
				this.m.Skills.removeByID("perk.feint");		
				this.m.Skills.removeByID("perk.legend_specialist_shield_skill");
				this.m.Skills.removeByID("perk.legend_specialist_shield_push");
				this.m.Skills.removeByID("perk.legend_smashing_shields");
				this.m.Skills.removeByID("perk.legend_back_to_basics");
				this.m.Skills.removeByID("perk.shield_bash");
				this.m.Skills.removeByID("perk.legend_full_force");	
				this.m.Skills.removeByID("perk.bloody_harvest");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local offhandItem = this.getOffhandItem();
				if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_line_breaker"));
				}
			}
			local mainhandItem = this.getMainhandItem();
			local attack = this.getSkills().getAttackOfOpportunity();			    
			if (mainhandItem != null)
			{
				if (mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
					if (attack != null && !attack.isDuelistValid())
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));		
					}
				}
				else
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
				}
			}
			if (attack != null && attack.isDuelistValid())
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{	
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
				}
			}

			return ret;
		}		
	});

	::mods_hookExactClass("entity/tactical/humans/knight", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.crippling_strikes");
			this.m.Skills.removeByID("perk.coup_de_grace");		
			this.m.Skills.removeByID("perk.reach_advantage");
			this.m.Skills.removeByID("perk.berserk");
			this.m.Skills.removeByID("perk.last_stand");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.steel_brow");
				this.m.Skills.removeByID("perk.feint");
				this.m.Skills.removeByID("perk.legend_specialist_shield_skill");
				this.m.Skills.removeByID("perk.legend_specialist_shield_push");
				this.m.Skills.removeByID("perk.legend_smashing_shields");
				this.m.Skills.removeByID("perk.shield_bash");
				this.m.Skills.removeByID("perk.legend_back_to_basics");
				this.m.Skills.removeByID("perk.legend_full_force");
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.legend_forceful_swing");
				this.m.Skills.removeByID("perk.bloody_harvest");
				this.m.Skills.removeByID("perk.legend_composure");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.Protect) != null)
			{
				agent.removeBehavior(this.Const.AI.Behavior.ID.Protect);
				agent.finalizeBehaviors();
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			local offhandItem = this.getOffhandItem();

			if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
			{
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));
				}
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_line_breaker"));
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local mainhandItem = this.getMainhandItem();
				local attack = this.getSkills().getAttackOfOpportunity();
				if (attack != null && attack.isDuelistValid())
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}

				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));				
					if (attack != null && !attack.isDuelistValid())
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));				
					}
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_noble_fencer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.footwork");
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.legend_back_to_basics");
			this.m.Skills.removeByID("perk.feint");
			this.m.Skills.removeByID("perk.berserk");
			this.m.Skills.removeByID("perk.reach_advantage");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));				
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bf_fencer"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;
				this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));								
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_noble_halberdier", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			this.m.Skills.removeByID("perk.backstabber");
			this.m.Skills.removeByID("perk.footwork");
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.coup_de_grace");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_follow_up"));
			this.m.Skills.removeByID("perk.berserk");

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));				
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_noble_slinger", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.bullseye");	
			this.m.Skills.removeByID("perk.rotation");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));					
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mastery_slings"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_sling_skill"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_sling_damage"));				
			this.m.Skills.add(this.new("scripts/skills/perks/perk_footwork"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_heavy_projectiles"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_blacksmith", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addPerkTree(this.Const.Perks.BlacksmithProfessionTree);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_rattle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_soft_metal"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smackdown"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_dismantle"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_butcher", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addPerkTree(this.Const.Perks.ButcherProfessionTree);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_swordlike"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_cleaver"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fruits_of_labor"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_cuts"));
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodbath"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloodlust"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_mauler"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			}

			return ret;
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_farmhand", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addPerkTree(this.Const.Perks.FarmerProfessionTree);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bolster"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_intimidate"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fruits_of_labor"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
				this.m.Skills.removeByID("perk.stalwart");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_leverage"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_utilitarian"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_miner", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addPerkTree(this.Const.Perks.MinerProfessionTree);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_rattle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_impact"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fruits_of_labor"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
				this.m.Skills.removeByID("perk.stalwart");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_dent_armor"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_minstrel", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;
			}

		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_monk", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_poacher", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_ranged_supremacy"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_marksmanship"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_squire", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_versatile_weapon"));
				}
				else if (weapon.isWeaponType(this.Const.Items.WeaponType.Flail))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_from_all_sides"));
				}
			}

			this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				if (weapon != null)
				{
					if (weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_en_garde"));
					}
					else if (weapon.isWeaponType(this.Const.Items.WeaponType.Flail))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flail_spinner"));
					}
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_witchhunter", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_take_aim"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_iron_sights"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_versatile_weapon"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_wind_reader"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_muscle_memory"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/legend_peasant_woodsman", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fruits_of_labor"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_heft"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_dismemberment"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/master_archer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.getBaseProperties().Vision = 7;
			this.getBaseProperties().DamageDirectMult = 1.0;

			this.m.Skills.removeByID("perk.head_hunter");
			this.m.Skills.removeByID("perk.fast_adaption");												
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_through_the_ranks"));	

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));				
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local weapon = this.getMainhandItem();
			if (weapon != null)
			{			
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
				{
					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));
					}					
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));	
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_ranged_supremacy"));	
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flaming_arrows"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hip_shooter"));	
				}
				else //if crossbow
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_power_shot"));	
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_iron_sights"));				
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_muscle_memory"));
					}			
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/mercenary", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.legend_smashing_shields");
			this.m.Skills.removeByID("perk.crippling_strikes");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_skirmisher"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.underdog");
				this.m.Skills.removeByID("perk.stalwart");
				this.m.Skills.removeByID("perk.steel_brow");				
				this.m.Skills.addPerkTree(this.Const.Perks.ThrowingTree);
				this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local attack = this.getSkills().getAttackOfOpportunity();
				if (attack != null)
				{
					if (attack.isDuelistValid())
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
					}
					else
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));				
					}
				}

				local weapon = this.getMainhandItem();
				if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Polearm))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
				}
			}
			local offhandItem = this.getOffhandItem();
			if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_line_breaker"));			    			    
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/mercenary_low", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.nimble");
			this.m.Skills.removeByID("perk.backstabber");
			this.m.Skills.removeByID("perk.overwhelm");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(5);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);
				local weapon = this.getMainhandItem();
				if (weapon != null)
				{
					if (weapon.isWeaponType(this.Const.Items.WeaponType.Polearm))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
					}

					if (weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
					}
					else if (weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
					{
						local offhandItem = this.getOffhandItem();
						if (offhandItem == null || offhandItem.isItemType(this.Const.Items.ItemType.Tool))
						{
							this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
						}
					}
				}
			}
			local offhandItem = this.getOffhandItem();
			if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
			{
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
				}				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));	    			    
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/mercenary_ranged", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.overwhelm");				

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.nine_lives");
				this.m.Skills.removeByID("perk.lone_wolf");
				this.m.Skills.removeByID("perk.berserk");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));							
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
				{

					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_ranged_supremacy"));						
					}	
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_hip_shooter"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flaming_arrows"));
				}
				else if (weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow))
				{
					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_iron_sights"));
					}		
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_power_shot"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_muscle_memory"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));
				}
			}
		}

	});

	::mods_hookExactClass("entity/tactical/humans/militia", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.legend_specialist_militia_skill"); 		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			if (this.Math.rand(1,100) <= 25)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));				
				this.m.Skills.removeByID("perk.legend_specialist_spearwall");
				this.m.Skills.removeByID("perk.legend_specialist_spearthrust");
				this.m.Skills.removeByID("perk.legend_specialist_militia_damage");
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(2);
			}
		}

	});

	::mods_hookExactClass("entity/tactical/humans/militia_captain", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local b = this.getBaseProperties();
			b.RangedDefense += 10;
			local c = this.getCurrentProperties();
			c.RangedDefense += 10;	 		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_shields_up"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_hold_the_line"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_push_forward"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_composure");	
				this.m.Skills.removeByID("perk.legend_back_to_basics");	
				this.m.Skills.removeByID("perk.legend_smashing_shields");	
				this.m.Skills.removeByID("perk.legend_full_force");															
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fortified_mind"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
			}
		}

	});

	::mods_hookExactClass("entity/tactical/humans/militia_guest", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.legend_specialist_militia_skill");	 		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_specialist_militia_damage");				
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(2);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/militia_guest_ranged", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_bow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/militia_ranged", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_bow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/militia_veteran", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			local b = this.getBaseProperties();
			b.RangedDefense += 10;
			local c = this.getCurrentProperties();
			c.RangedDefense += 10;	
			this.m.Skills.removeByID("perk.shield_expert");
			this.m.Skills.removeByID("perk.legend_specialist_militia_skill");				
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));	
		
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_specialist_militia_damage");					
				this.m.Skills.removeByID("perk.legend_specialist_spearwall");
				this.m.Skills.removeByID("perk.legend_specialist_spearthrust");
				this.m.Skills.removeByID("perk.legend_smashing_shields");
				this.m.Skills.removeByID("perk.coup_de_grace");		
				this.m.Skills.removeByID("perk.legend_back_to_basics");						
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			local mainhandItem = this.getMainhandItem();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.OneHanded))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));			   		
				}
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);		    
				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));	
					}
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_formidable_approach"));
				}

				local offhandItem = this.getOffhandItem();
				if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));	
					if (this.Math.rand(1,100) <= 25)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
					}						    
				}
			}
		}
	});

	# ::mods_hookExactClass("entity/tactical/humans/noble", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/humans/noble_arbalester", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_know_their_weakness"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_through_the_ranks"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_entrenched"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_power_shot"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_primal_fear"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.lone_wolf");
				this.m.Skills.removeByID("perk.feint");				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_muscle_memory"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));				
			}
		}

	});

	::mods_hookExactClass("entity/tactical/humans/noble_billman", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.ptr_bloodlust");
			this.m.Skills.removeByID("perk.ptr_dent_armor");
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.backstabber");						
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_follow_up"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;
				this.m.Skills.removeByID("perk.coup_de_grace");
				this.m.Skills.removeByID("perk.feint");
				this.m.Skills.removeByID("perk.legend_full_force");
				this.m.Skills.removeByID("perk.berserk");										
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));												
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(7);
			}	
			this.m.Skills.addTreeOfEquippedWeapon(5);						
		}
	});

	::mods_hookExactClass("entity/tactical/humans/noble_footman", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon(4);		
			this.m.Skills.removeByID("perk.fast_adaption");	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			
			if (this.Math.rand(1,100) <= 25)
			{
				if (this.Math.rand(1,100) > 50)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_line_breaker"));
				}
				else
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));

				}
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(6);
				this.m.Skills.removeByID("perk.steel_brow");
				this.m.Skills.removeByID("perk.feint");
				this.m.Skills.removeByID("perk.stalwart");
				this.m.Skills.removeByID("perk.legend_specialist_shield_skill");
				this.m.Skills.removeByID("perk.legend_specialist_shield_push");
				this.m.Skills.removeByID("perk.legend_smashing_shields");
				this.m.Skills.removeByID("perk.legend_back_to_basics");
				this.m.Skills.removeByID("perk.shield_bash");
				this.m.Skills.removeByID("perk.legend_full_force");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_return_favor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));				

			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/noble_greatsword", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.berserk");
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.steel_brow");
			this.m.Skills.removeByID("perk.relentless");
			this.m.Skills.removeByID("perk.overwhelm");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_fluid_weapon"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_kata"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.feint");
				this.m.Skills.removeByID("perk.legend_back_to_basics");
				this.m.Skills.removeByID("perk.bloody_harvest");
				this.m.Skills.removeByID("perk.legend_full_force");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_versatile_weapon"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exploit_opening"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_tempo"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_en_garde"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_sweeping_strikes"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));

			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/noble_sergeant", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TacticianClassTree);
			this.m.Skills.removeByID("perk.fast_adaption");	
			this.m.Skills.removeByID("perk.duelist");					
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rally_the_troops"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.last_stand");
				this.m.Skills.removeByID("perk.legend_composure");
				this.m.Skills.removeByID("perk.feint");
				this.m.Skills.removeByID("perk.legend_back_to_basics");
				this.m.Skills.removeByID("perk.legend_full_force");
				this.m.Skills.removeByID("trait.fearless");		
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));	
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			local mainhandItem = this.getMainhandItem();		    					
			local attack = this.getSkills().getAttackOfOpportunity();			    
			if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
			{
				if (attack != null && !attack.isDuelistValid())
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
				}			
			}

			if (attack != null && attack.isDuelistValid())
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/nomad_archer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			if (this.Math.rand(1,100) <= 25)
			{
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_target_practice"));
				}				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_flaming_arrows"));
			}
			else
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_eyes_up"));				
			}


			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}

	});

	::mods_hookExactClass("entity/tactical/humans/nomad_cutthroat", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));				
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));				
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();

			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Spear) || weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
				{
					this.m.Skills.addTreeOfEquippedWeapon(3);
				}
				else
				{
					this.m.Skills.addTreeOfEquippedWeapon(2);
				}
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/nomad_leader", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_shields_up"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rally_the_troops"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_hold_the_line"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_push_forward"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.Protect) != null)
			{
				agent.removeBehavior(this.Const.AI.Behavior.ID.Protect);
				agent.finalizeBehaviors();
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
				}
			}

			return ret;
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				local mainhandItem = this.getMainhandItem();		    					
				local attack = this.getSkills().getAttackOfOpportunity();			    
				if (mainhandItem != null && mainhandItem.isItemType(this.Const.Items.ItemType.TwoHanded))
				{
					if (attack != null && !attack.isDuelistValid())
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
					}			
				}

				if (attack != null && attack.isDuelistValid())
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}		
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/nomad_outlaw", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.quick_hands");				
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));			

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.addTreeOfEquippedWeapon(5);
			}
			else
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/nomad_slinger", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.head_hunter");	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mastery_slings"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));

			if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 30)
			{
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_heavy_projectiles"));
				}					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_small_target"));
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/officer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.addPerkTree(this.Const.Perks.TacticianClassTree);
			this.m.Skills.removeByID("perk.fast_adaption");	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rally_the_troops"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));								
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));								
			local inspiringPresencePerk = this.new("scripts/skills/perks/perk_inspiring_presence");
			inspiringPresencePerk.m.IsForceEnabled = true;
			this.m.Skills.add(inspiringPresencePerk);
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vengeful_spite"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.underdog");					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_fortified_mind"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_second_wind"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));												
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
			}

			return ret;
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.addTreeOfEquippedWeapon();

			local attack = this.getSkills().getAttackOfOpportunity();
			if (attack != null)
			{
				if (attack.isDuelistValid())
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}
				else
				{					
					this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
				}
			}

			local offhandItem = this.getOffhandItem();
			if (offhandItem != null && offhandItem.isItemType(this.Const.Items.ItemType.Shield))
			{
				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{				
					this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));					
				}				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/peasant", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;				
				this.m.Skills.removeByID("perk.nimble");
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/peasant_armed", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Hitpoints = this.getBaseProperties().Hitpoints;									
				this.m.Skills.removeByID("perk.nimble");
			}
		}
	});
	
	::mods_hookExactClass("entity/tactical/humans/peasant_armed_infected", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Hitpoints = this.getBaseProperties().Hitpoints;					
		}
	});
	
	::mods_hookExactClass("entity/tactical/humans/peasant_southern", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}
		}
	});
	#
	# ::mods_hookExactClass("entity/tactical/humans/sato_manhunter", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/humans/sato_manhunter_ranged", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/humans/sato_manhunter_veteran", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/humans/sato_manhunter_veteran_ranged", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	::mods_hookExactClass("entity/tactical/humans/slave", function(o) {
		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));			
			local weapon = this.getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Hammer))
				{
					this.m.Skills.addTreeOfEquippedWeapon(2);
				}
				else
				{
					this.m.Skills.addTreeOfEquippedWeapon(1);
				}
			}

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.add(this.new("scripts/skills/effects/dodge_effect"));
				this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/standard_bearer", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.removeByID("perk.steel_brow");
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_back_to_basics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bolster"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_intimidate"));
			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_hold_the_line");
				this.m.Skills.removeByID("perk.legend_push_forward");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_mastery_polearm"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_long_reach"));			
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
			}
		}
	});

	::mods_hookExactClass("entity/tactical/humans/swordmaster", function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();		
			this.m.Skills.removeByID("perk.fast_adaption");
			this.m.Skills.removeByID("perk.duelist");			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bf_fencer"));

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
				this.m.Skills.removeByID("perk.legend_full_force");	
				this.m.Skills.removeByID("perk.feint");
				this.m.Skills.removeByID("perk.head_hunter");
				this.m.Skills.removeByID("perk.return_favor");							
				this.m.Skills.removeByID("perk.legend_composure");
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));				
			}
		}

		local assignRandomEquipment = o.assignRandomEquipment;
		o.assignRandomEquipment = function()
		{
			assignRandomEquipment();
			if (this.Const.DLC.Unhold && this.Math.rand(1,100) <= 20)
			{
				local weapon = this.getMainhandItem();
				if (weapon != null && weapon.getID().find("named") == null)
				{
					this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
					this.m.Items.equip(this.new("scripts/items/weapons/fencing_sword"));
				}
			}
			this.m.Skills.addTreeOfEquippedWeapon();

			local attack = this.getSkills().getAttackOfOpportunity();			    
			if (attack != null)
			{
				if (attack.isDuelistValid())
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				}
				else
				{					
					this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
				}
			}
		}

		local makeMiniboss = o.makeMiniboss;
		o.makeMiniboss = function()
		{
			local ret = makeMiniboss();
			if (ret)
			{
				if (this.Const.DLC.Unhold && this.Math.rand(1,100) <= 20)
				{
					this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
					this.m.Items.equip(this.new("scripts/items/weapons/named/named_fencing_sword"));
				}

				local cullPerk = this.new("scripts/skills/perks/perk_ptr_cull");
				cullPerk.m.IsForceEnabled = true;
				this.m.Skills.add(cullPerk);

				if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
				}
			}

			return ret;
		}
	});

	# ::mods_hookExactClass("entity/tactical/humans/vizier", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
	#
	# ::mods_hookExactClass("entity/tactical/humans/wildman", function(o) {
	# 	local onInit = o.onInit;
	# 	o.onInit = function()
	# 	{
	# 		onInit();
	# 	}
	# });
}
