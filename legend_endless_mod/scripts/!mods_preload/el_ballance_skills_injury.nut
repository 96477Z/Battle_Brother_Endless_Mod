local gt = getroottable();

::mods_registerMod("el_ballance_skills_injury", 1, "el_ballance_skills_injury");
::mods_queue(null, "el_player_npc", function ()
{


	::mods_hookExactClass("skills/injury/broken_arm_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] Damage Inflicted"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 50;
            _properties.RangedSkill -= 50;
            _properties.DamageTotalMult *= 0.5;
        }

	});


	::mods_hookExactClass("skills/injury/broken_leg_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]2[/color] Additional Action Point per tile moved"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MovementAPCostAdditional += 2;
            _properties.Initiative -= 40;
        }

	});


	::mods_hookExactClass("skills/injury/broken_ribs_injury", function(o){

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
                    id = 7,
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Stamina -= 40;
        }

	});

	::mods_hookExactClass("skills/injury/bruised_leg_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]1[/color] Additional Action Point per tile moved"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MovementAPCostAdditional += 1;
            _properties.Initiative -= 20;
        }

	});

	::mods_hookExactClass("skills/injury/burnt_face_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/vision.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 25;
            _properties.RangedSkill -= 25;
            _properties.MeleeDefense -= 25;
            _properties.RangedDefense -= 25;
            _properties.Vision -= 2;
        }

	});

	::mods_hookExactClass("skills/injury/burnt_hands_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 25;
            _properties.RangedSkill -= 25;
        }

	});

	::mods_hookExactClass("skills/injury/burnt_legs_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]1[/color] Additional Action Point per tile moved"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MovementAPCostAdditional += 1;
            _properties.Initiative -= 20;
        }

	});


	::mods_hookExactClass("skills/injury/crushed_finger_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 5;
            _properties.RangedSkill -= 5;
        }

	});

	::mods_hookExactClass("skills/injury/crushed_windpipe_injury", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Fatigue Recovery per turn"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Max Fatigue"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.FatigueRecoveryRate -= 10;
            _properties.Stamina -= 50;
        }

	});

	::mods_hookExactClass("skills/injury/cut_achilles_tendon_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]2[/color] Additional Action Point per tile moved"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-30[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MovementAPCostAdditional += 2;
            _properties.Initiative -= 30;
        }

	});


	::mods_hookExactClass("skills/injury/cut_arm_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 15;
            _properties.RangedSkill -= 15;
        }

	});

	::mods_hookExactClass("skills/injury/cut_leg_muscles_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Melee Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeDefense -= 40;
            _properties.Initiative -= 40;
        }

	});

	::mods_hookExactClass("skills/injury/deep_abdominal_cut_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] Hitpoints"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Max Fatigue"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            if (this.m.IsShownOutOfCombat)
            {
                _properties.HitpointsMult *= 0.75;
            }

            _properties.Stamina -= 25;
        }

	});



	::mods_hookExactClass("skills/injury/deep_chest_cut_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35%[/color] Hitpoints"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Max Fatigue"
                },
                {
                    id = 6,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            if (this.m.IsShownOutOfCombat)
            {
                _properties.HitpointsMult *= 0.65;
            }

            _properties.Stamina -= 35;
            _properties.MeleeSkill -= 35;
            _properties.RangedSkill -= 35;
        }

	});

	::mods_hookExactClass("skills/injury/deep_face_cut_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/vision.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 25;
            _properties.RangedSkill -= 25;
            _properties.MeleeDefense -= 25;
            _properties.RangedDefense -= 25;
            _properties.Vision -= 2;
        }

	});

	::mods_hookExactClass("skills/injury/fractured_elbow_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Defense"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeDefense -= 25;
        }

	});

	::mods_hookExactClass("skills/injury/fractured_hand_injury", function(o){

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
                    id = 6,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 20;
            _properties.RangedSkill -= 20;
        }

	});

	::mods_hookExactClass("skills/injury/fractured_ribs_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-30[/color] Max Fatigue"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Stamina -= 30;
        }

	});


	::mods_hookExactClass("skills/injury/fractured_skull_injury", function(o){

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
                    id = 6,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
                },
                {
                    id = 6,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Initiative"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/vision.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Vision -= 2;
            _properties.Initiative -= 50;
            _properties.MeleeSkill -= 50;
            _properties.RangedSkill -= 50;
            _properties.MeleeDefense -= 50;
            _properties.RangedDefense -= 50;
        }

	});

	::mods_hookExactClass("skills/injury/grazed_eye_socket_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/vision.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.RangedSkill -= 50;
            _properties.Vision -= 2;
        }

	});


	::mods_hookExactClass("skills/injury/infected_wound_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] Hitpoints"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Max Fatigue"
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

            if (this.m.IsShownOutOfCombat)
            {
                _properties.HitpointsMult *= 0.75;
                _properties.Stamina -= 25;
            }
        }

	});

	::mods_hookExactClass("skills/injury/inhaled_flames_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Action Points"
                },
                {
                    id = 7,
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.ActionPoints -= 2;
            _properties.Stamina -= 40;
        }

	});


	::mods_hookExactClass("skills/injury/injured_knee_cap_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]2[/color] Additional Action Point per tile moved"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MovementAPCostAdditional += 2;
            _properties.Initiative -= 40;
        }

	});

	::mods_hookExactClass("skills/injury/pierced_arm_muscles_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 25;
            _properties.RangedSkill -= 25;
        }

	});


	::mods_hookExactClass("skills/injury/pierced_chest_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Max Fatigue"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Stamina -= 20;
        }

	});


	::mods_hookExactClass("skills/injury/pierced_chest_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 20;
            _properties.RangedSkill -= 20;
        }

	});



	::mods_hookExactClass("skills/injury/pierced_leg_muscles_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-30[/color] Melee Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-30[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeDefense -= 30;
            _properties.Initiative -= 30;
        }

	});

	::mods_hookExactClass("skills/injury/pierced_lung_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-60[/color] Max Fatigue"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Stamina -= 60;
        }

	});

	::mods_hookExactClass("skills/injury/pierced_side_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Max Fatigue"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Stamina -= 20;
        }

	});

	::mods_hookExactClass("skills/injury/ripped_ear_injury", function(o){

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
                    id = 11,
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Initiative -= 15;
        }

	});

	::mods_hookExactClass("skills/injury/severe_concussion_injury", function(o){

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
                    id = 6,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
                },
                {
                    id = 6,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Defense"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Initiative"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/vision.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.Vision -= 2;
            _properties.Initiative -= 50;
            _properties.MeleeSkill -= 50;
            _properties.RangedSkill -= 50;
            _properties.MeleeDefense -= 50;
            _properties.RangedDefense -= 50;
        }

	});

	::mods_hookExactClass("skills/injury/sickness_injury", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] Hitpoints"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Max Fatigue"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Initiative"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Resolve"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 15,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Skill"
                },
                {
                    id = 16,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Defense"
                },
                {
                    id = 17,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Defense"
                },
                {
                    id = 17,
                    type = "text",
                    icon = "ui/icons/vision.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
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
            _properties.HitpointsMult *= 0.75;
            _properties.Bravery -= 25;
            _properties.Initiative -= 25;
            _properties.Stamina -= 25;
            _properties.MeleeSkill -= 25;
            _properties.RangedSkill -= 25;
            _properties.MeleeDefense -= 25;
            _properties.RangedDefense -= 25;
            _properties.Vision += -2;
        }

	});


	::mods_hookExactClass("skills/injury/smashed_hand_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 40;
            _properties.RangedSkill -= 40;
        }

	});

	::mods_hookExactClass("skills/injury/split_hand_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Skill"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MeleeSkill -= 50;
            _properties.RangedSkill -= 50;
        }

	});

	::mods_hookExactClass("skills/injury/sprained_ankle_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]1[/color] Additional Action Point per tile moved"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Initiative"
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            _properties.MovementAPCostAdditional += 1;
            _properties.Initiative -= 20;
        }

	});

	::mods_hookExactClass("skills/injury/stabbed_guts_injury", function(o){

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
                    id = 7,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-40%[/color] Hitpoints"
                },
                {
                    id = 7,
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

            if (!_properties.IsAffectedByInjuries || this.m.IsFresh && !_properties.IsAffectedByFreshInjuries)
            {
                return;
            }

            if (this.m.IsShownOutOfCombat)
            {
                _properties.HitpointsMult *= 0.6;
            }

            _properties.Stamina -= 40;
        }

	});


});
