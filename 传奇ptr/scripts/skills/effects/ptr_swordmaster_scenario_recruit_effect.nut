this.ptr_swordmaster_scenario_recruit_effect <- this.inherit("scripts/skills/effects/ptr_swordmaster_scenario_effect", {
	m = {		
		FreePerkLevels = [],
		FreePerks = [],
		IsSet = false		
	},
	function create()
	{
		this.m.ID = "effects.ptr_swordmaster_scenario_recruit";
		this.m.Name = "Swordmaster\'s Training";
		this.m.Description = "This character is being trained by a highly accomplished swordmaster, and gains increased combat effectiveness when wielding a sword. This effect becomes stronger with each level.";
		this.m.Icon = "skills/ptr_swordmaster_scenario_recruit.png";				
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
			local bonus = this.getBonus();

			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Skill"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Defense"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Initiative"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/direct_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] damage ignores armor"
				}
			]);			
		}

		local ids = [];
		local swordPerkDefs = [];
		foreach (row in this.Const.Perks.SwordTree.Tree)
		{
			foreach (perk in row)
			{
				swordPerkDefs.push(perk);
				ids.push(this.Const.Perks.PerkDefObjects[perk].ID);
			}
		}

		if (this.m.FreePerkLevels.len() != 0 && this.getContainer().getSkillsByFunction(@(_skill) ids.find(_skill) != null).len() != swordPerkDefs.len())
		{
			local potentialPerks = "";

			for (local i = swordPerkDefs.len() - this.m.FreePerkLevels.len(); i < swordPerkDefs.len(); i++)
			{
				potentialPerks += this.Const.Strings.PerkName[this.Const.Perks.PerkDefObjects[swordPerkDefs[i]]["Const"]] + ", ";
			}

			potentialPerks = potentialPerks.slice(0, -2);

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Upon gaining a level, has a [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] chance to gain a free perk from the Sword perk group. Will refund the perk points spent on already picked perks. [color=" + this.Const.UI.Color.PositiveValue + "]Potential Perks:[/color] " + potentialPerks
			});
		}

		if (this.m.FreePerks.len() > 0)
		{
			local freePerks = "";
			foreach (perk in this.m.FreePerks)
			{					
				freePerks += this.Const.Strings.PerkName[this.Const.Perks.PerkDefObjects[perk]["Const"]] + ", ";
			}

			freePerks = freePerks.slice(0, -2);

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Free Perks Gained:[/color] " + freePerks
			});	
		}

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "Will get very angry if anyone in the company uses a melee weapon other than a Sword in combat"
		});

		return tooltip;
	}

	function onAdded()
	{
		if (!this.m.IsSet)
		{
			local currLevel = this.getContainer().getActor().getLevel();

			foreach (i, row in this.Const.Perks.SwordTree.Tree)
			{
				foreach (perk in row)
				{
					if (!this.getContainer().hasSkill(this.Const.Perks.PerkDefObjects[perk].ID))
					{
						local success = this.Math.rand(1, 100) <= 50;
						this.m.FreePerkLevels.push(
							{
								Success = success,
								PerkDef = perk,
								Row = i
							}
						);
					}
				}
			}
		}
	}

	function getBonus()
	{
		return this.getContainer().getActor().getLevel() * (this.getContainer().hasSkill("perk.ptr_swordmaster_precise") ? 2 : 1);
	}

	function onUpdate( _properties )
	{
		this.ptr_swordmaster_scenario_effect.onUpdate(_properties);

		local actor = this.getContainer().getActor();
		if (this.isEnabled())
		{
			local bonus = this.getBonus();

			_properties.MeleeSkill += bonus;
			_properties.MeleeDefense += bonus;
			_properties.Initiative += bonus;
			_properties.DamageDirectAdd += bonus * 0.01;
		}
	}

	function onUpdateLevel()
	{
		if (this.m.FreePerkLevels.len() > 0)
		{
			if (this.m.FreePerkLevels[0].Success)
			{
				local perkDef = this.m.FreePerkLevels[0].PerkDef;
				this.m.FreePerks.push(perkDef);
				if (this.getContainer().hasSkill(::Const.Perks.PerkDefObjects[perkDef].ID))
				{
					this.getContainer().getActor().m.PerkPoints++;
				}
				else
				{
					this.getContainer().add(this.new(::Const.Perks.PerkDefObjects[perkDef].Script));
					this.getContainer().getActor().getBackground().addPerk(perkDef, this.m.FreePerkLevels[0].Row);
				}

				this.getContainer().getActor().getBackground().getPerk(perkDef).IsRefundable = false;
			}

			this.m.FreePerkLevels.remove(0);
		}
	}

	function evolve()
	{
		local actor = this.getContainer().getActor();
		local currentBackground = actor.getBackground();
		local oldDesc = currentBackground.m.Description;

		local bg = this.new("scripts/skills/backgrounds/ptr_young_swordmaster_background");
		bg.m.IsNew = false;

		bg.m.PerkTree = clone currentBackground.m.PerkTree;
		bg.m.PerkTreeMap = clone currentBackground.m.PerkTreeMap;
		bg.m.CustomPerkTree = clone currentBackground.m.CustomPerkTree;

		currentBackground.removeSelf();
		
		local attributes = {
			MeleeSkill = this.Math.rand(10, 15),
			MeleeDefense = this.Math.rand(10, 15),
			Stamina = this.Math.rand(5, 10),		
			Bravery = this.Math.rand(10, 20),
			Initiative = this.Math.rand(10, 20)
		};

		actor.getBaseProperties().MeleeSkill += attributes.MeleeSkill;
		actor.getBaseProperties().MeleeDefense += attributes.MeleeDefense;	
		actor.getBaseProperties().Stamina += attributes.Stamina;		
		actor.getBaseProperties().Bravery += attributes.Bravery;
		actor.getBaseProperties().Initiative += attributes.Initiative;

		actor.getSkills().add(bg);

		bg.m.RawDescription = oldDesc + " Under your tutelage, %name% has grown into a true master of the sword, having proven %their% mettle by defeating a famous swordmaster in single combat!";
		bg.buildDescription(true);
		
		foreach (i, row in this.Const.Perks.SwordTree.Tree)
		{
			foreach (perk in row)
			{
				if (!actor.getSkills().hasSkill(this.Const.Perks.PerkDefObjects[perk].ID))
				{
					actor.getSkills().add(this.new(this.Const.Perks.PerkDefObjects[perk].Script));
					bg.addPerk(perk, i);					
				}
				else if (this.m.FreePerks.find(perk) == null)
				{
					actor.m.PerkPoints++;
					actor.m.PerkPointsSpent--;
				}
			}
		}

		return attributes;
	}

	function onSerialize(_out)
	{
		this.skill.onSerialize(_out);
		_out.writeU8(this.m.FreePerkLevels.len());
		foreach (level in this.m.FreePerkLevels)
		{
			_out.writeBool(level.Success);
			_out.writeU16(level.PerkDef);
			_out.writeU8(level.Row);
		}

		_out.writeU8(this.m.FreePerks.len());
		foreach (perkDef in this.m.FreePerks)
		{
			_out.writeU16(perkDef);
		}
	}

	function onDeserialize(_in)
	{
		this.skill.onDeserialize(_in);

		this.m.IsSet = true;

		this.m.FreePerkLevels = [];
		local size = _in.readU8();
		for (local i = 0; i < size; i++)
		{
			this.m.FreePerkLevels.push(
				{
					Success = _in.readBool(),
					PerkDef = _in.readU16(),
					Row = _in.readU8()
				}
			);
		}

		this.m.FreePerks = [];
		size = _in.readU8();
		for (local i = 0; i < size; i++)
		{
			this.m.FreePerks.push(_in.readU16());
		}
	}
});
