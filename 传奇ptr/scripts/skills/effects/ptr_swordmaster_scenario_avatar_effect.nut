this.ptr_swordmaster_scenario_avatar_effect <- this.inherit("scripts/skills/effects/ptr_swordmaster_scenario_effect", {
	m = {
		WrongWeaponName = null,
		OldAgeStartDays = 30,
		DaysWithoutRecruits = 0
	},
	function create()
	{
		this.m.ID = "effects.ptr_swordmaster_scenario_avatar";
		this.m.Name = "Swordmaster\'s Finesse";
		this.m.Description = "This character is a renowned swordmaster - literally the stuff of legends. This effect becomes stronger with each level. However, as time passes by, old age may cause some attributes to suffer."
		this.m.Icon = "skills/ptr_swordmaster_scenario_avatar.png";				
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		if (!this.isEnabled())
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a Sword to be equipped. Hybrid weapons do not count.[/color]"
			});
		}
		else
		{
			local skillBonus = this.getSkillBonus();

			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + skillBonus + "[/color] Melee Skill"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + skillBonus + "[/color] Melee Defense"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + skillBonus + "[/color] Resolve"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/direct_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + skillBonus + "%[/color] damage ignores armor"
				}
			]);
		}

		local skillMalus = this.getSkillMalus();

		if (skillMalus > 0)
		{
			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/health.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + skillMalus + "[/color] Hitpoints"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + skillMalus + "[/color] Fatigue"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + ::Math.floor(skillMalus * 1.5) + "[/color] Initiative"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]+" + (2 * skillMalus) + "%[/color] Fatigue"
				}
			]);
		}

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "Will get very angry if anyone in the company uses a melee weapon other than a Sword in combat"
		});

		if (this.m.DaysWithoutRecruits > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "The campaign will end if a total of 25 days pass with fewer than 3 recruits in your company. Currently " + this.m.DaysWithoutRecruits + " such days have passed"
			});
		}		

		return tooltip;
	}

	function getSkillBonus()
	{
		return this.getContainer().getActor().getLevel() * (this.getContainer().hasSkill("perk.ptr_swordmaster_precise") ? 2 : 1);
	}

	function getSkillMalus()
	{
		if (this.World.Flags.get("PTR_SwordmasterScenario_OldAgeEvent_1"))
		{
			return this.Math.min(30, this.Math.max(1, (this.World.getTime().Days - this.m.OldAgeStartDays) / 10));
		}
		
		return 0;
	}

	function onUpdate( _properties )
	{
		this.ptr_swordmaster_scenario_effect.onUpdate(_properties);
			
		local actor = this.getContainer().getActor();
		if (this.isEnabled())
		{
			local skillBonus = this.getSkillBonus();
			_properties.MeleeSkill += skillBonus;
			_properties.MeleeDefense += skillBonus;
			_properties.Bravery += skillBonus;
			_properties.DamageDirectAdd += skillBonus * 0.01;			
		}

		local skillMalus = this.getSkillMalus();
		_properties.Stamina -= skillMalus;
		_properties.Initiative -= ::Math.floor(skillMalus * 1.5);
		_properties.Hitpoints -= skillMalus;
		_properties.FatigueEffectMult *= 1.0 + 2 * skillMalus * 0.01;
	}

	function onNewDay()
	{
		local bros = this.World.getPlayerRoster().getAll();

		local hasMet = this.World.Flags.get("PTR_SwordmasterScenario_OldAgeEvent_1");
		
		if (!hasMet && bros.len() >= 3 && this.World.getTime().Days >= this.m.OldAgeStartDays)
		{
			if (this.World.Events.fire("event.ptr_swordmaster_scenario_old_age_1"))
			{
				this.World.Flags.set("PTR_SwordmasterScenario_OldAgeEvent_1", true);
			}
		}

		hasMet = this.World.Flags.get("PTR_SwordmasterScenario_OldAgeEvent_2");
		
		if (!hasMet && bros.len() >= 3 && this.World.getTime().Days >= this.m.OldAgeStartDays * 2)
		{
			if (this.World.Events.fire("event.ptr_swordmaster_scenario_old_age_2"))
			{
				this.World.Flags.set("PTR_SwordmasterScenario_OldAgeEvent_2", true);
			}
		}

		hasMet = this.World.Flags.get("PTR_SwordmasterScenario_OldAgeEvent_3");
		
		if (!hasMet && bros.len() >= 3 && this.World.getTime().Days >= this.m.OldAgeStartDays * 3)
		{
			if (this.World.Events.fire("event.ptr_swordmaster_scenario_old_age_3"))
			{
				this.World.Flags.set("PTR_SwordmasterScenario_OldAgeEvent_3", true);
			}
		}

		hasMet = this.World.Flags.get("PTR_SwordmasterScenario_OldAgeEvent_4");
		
		if (!hasMet && bros.len() >= 3 && this.World.getTime().Days >= this.m.OldAgeStartDays * 4)
		{
			if (this.World.Events.fire("event.ptr_swordmaster_scenario_old_age_4"))
			{
				this.World.Flags.set("PTR_SwordmasterScenario_OldAgeEvent_4", true);
			}
		}

		if (this.World.getPlayerRoster().getAll().len() < 3)
		{
			this.m.DaysWithoutRecruits++;
			if (this.m.DaysWithoutRecruits > 25)
			{
				this.World.Events.fire("event.ptr_swordmaster_scenario_no_recruits_force_end");
			}
		}
	}

	function onSerialize( _out )
	{
		this.ptr_swordmaster_scenario_effect.onSerialize(_out);
		_out.writeU16(this.m.DaysWithoutRecruits);
	}

	function onDeserialize( _in )
	{
		this.ptr_swordmaster_scenario_effect.onDeserialize(_in);
		this.m.DaysWithoutRecruits = _in.readU16();
	}
});
