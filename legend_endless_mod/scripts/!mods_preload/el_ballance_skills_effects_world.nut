local gt = getroottable();

::mods_registerMod("el_ballance_skills_effects_world", 1, "el_ballance_skills_effects_world");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/effects_world/afraid_effect", function(o){

        o.getTooltip = function()
        {
            return [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Resolve"
                },
                {
                    id = 16,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "Is content with being in reserve"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.Bravery -= 50;
            _properties.IsContentWithBeingInReserve = true;
        }

	});

	::mods_hookExactClass("skills/effects_world/drunk_effect", function(o){

        o.getTooltip = function()
        {
            local ret = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25[/color] Resolve"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Initiative"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "Has a [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color] chance to be followed by a hangover"
                }
            ];
            this.addTooltipHint(ret);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            this.injury.onUpdate(_properties);
            if (this.getContainer().getActor().getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
            {
                this.removeSelf();
                return;
            }
            _properties.Bravery += 25;
            _properties.MeleeSkill -= 25;
            _properties.RangedSkill -= 25;
            _properties.MeleeDefense -= 25;
            _properties.RangedDefense -= 25;
            _properties.Initiative -= 25;
        }

	});

	::mods_hookExactClass("skills/effects_world/exhausted_effect", function(o){

        o.getTooltip = function()
        {
            local ret = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Max Fatigue"
                }
            ];
            this.addTooltipHint(ret);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            this.injury.onUpdate(_properties);
            if (this.getContainer().getActor().getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
            {
                this.removeSelf();
                return;
            }
            _properties.Stamina -= 40;
        }
	});

	::mods_hookExactClass("skills/effects_world/hangover_effect", function(o){

        o.getTooltip = function()
        {
            local ret = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Resolve"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Melee Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Ranged Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Melee Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Ranged Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Initiative"
                }
            ];
            this.addTooltipHint(ret);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            this.injury.onUpdate(_properties);
            if (this.getContainer().getActor().getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
            {
                this.removeSelf();
                return;
            }
            _properties.Bravery -= 10;
            _properties.MeleeSkill -= 10;
            _properties.RangedSkill -= 10;
            _properties.MeleeDefense -= 10;
            _properties.RangedDefense -= 10;
            _properties.Initiative -= 10;
        }
	});

	::mods_hookExactClass("skills/effects_world/legend_headache_effect", function(o){

        o.getTooltip = function()
        {
            local ret = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Resolve"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Melee Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Ranged Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Melee Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Ranged Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Initiative"
                }
            ];
            this.addTooltipHint(ret);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            this.injury.onUpdate(_properties);
            if (this.getContainer().getActor().getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
            {
                this.removeSelf();
                return;
            }
            _properties.Bravery -= 15;
            _properties.MeleeSkill -= 15;
            _properties.RangedSkill -= 15;
            _properties.MeleeDefense -= 15;
            _properties.RangedDefense -= 15;
            _properties.Initiative -= 15;
        }
	});

	::mods_hookExactClass("skills/effects_world/legend_irritable_effect", function(o){

        o.getTooltip = function()
        {
            local ret = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Resolve"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Melee Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Ranged Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Melee Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Ranged Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Initiative"
                }
            ];
            this.addTooltipHint(ret);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            this.injury.onUpdate(_properties);
            if (this.getContainer().getActor().getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
            {
                this.removeSelf();
                return;
            }
            _properties.Bravery -= 15;
            _properties.MeleeSkill -= 15;
            _properties.RangedSkill -= 15;
            _properties.MeleeDefense -= 15;
            _properties.RangedDefense -= 15;
            _properties.Initiative -= 15;
        }
	});

	::mods_hookExactClass("skills/effects_world/legend_well_tended_effect", function(o){

        o.getTooltip = function()
        {
            local ret = [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Hitpoints"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Resolve"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Fatigue"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Ranged skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "Is content with being in reserve"
                }
            ];
            this.addTooltipHint(ret);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            this.injury.onUpdate(_properties);
            if (this.getContainer().getActor().getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
            {
                this.removeSelf();
                return;
            }
            _properties.Hitpoints += this.Math.floor(0.05 * this.getContainer().getActor().getBaseProperties().Hitpoints);
            _properties.Bravery += 5;
            _properties.Stamina += 3;
            _properties.MeleeSkill += 5;
            _properties.RangedSkill += 5;
        }
	});






});
