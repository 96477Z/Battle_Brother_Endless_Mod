local gt = getroottable();

::mods_registerMod("el_ballance_skills_effects", 1, "el_ballance_skills_effects");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/effects/battle_standard_effect", function(o){

        local onAfterUpdate = o.onAfterUpdate;
        o.onAfterUpdate = function( _properties )
        {
            onAfterUpdate(_properties);
            if(this.m.Difference > 0) {
                this.m.Icon = "ui/perks/perk_28.png";
                this.m.Name = "战旗光环 [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.Difference + "[/color] 决心";
            }
            else {
                this.m.Icon = "ui/perks/perk_28_sw.png";
                this.m.Name = "战旗光环 [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Difference + "[/color] 决心";
            }
        }


        o.getTooltip = function()
        {
            local bonus = this.m.Difference;
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
                }
            ];
            if(bonus > 0) {
                ret.push({
                    id = 10,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Resolve"
                });
            }
            else {
                ret.push({
                    id = 10,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + bonus + "[/color] Resolve"
                });
            }
            return ret;
        }


        o.getBonus = function( _properties )
        {

            local actor = this.getContainer().getActor();
            if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
            {
                return 0;
            }
            local targets = this.Tactical.Entities.getAllInstances();
            local bonus = 0;
            local best_bravery = 0;

            foreach( tar in targets )
            {
                foreach( t in tar )
                {
                    if (t == null || t.getID() == actor.getID() || t.isDying() || !t.isAlive())
                    {
                        continue;
                    }
                    local skills = t.getSkills()
                    local citrin = skills == null ? null : skills.getSkillByID("actives.legend_citrinitas_trance");
                    if (citrin != null && citrin.m.IsInTrance && t.isAlliedWith(actor))
                    {
                        if(best_bravery < t.getBravery())
						best_bravery = t.getBravery();
                    }

                    local items = t.getItems();
                    local banner = items == null ? null : items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
                    if (banner != null && banner.getID() == "weapon.player_banner")
                    {
                        local distance = actor.getTile().getDistanceTo(t.getTile());
                        if(distance <= banner.EL_getRange()) {
                            if(t.isAlliedWith(actor)) {
                                bonus += banner.EL_getAllyBonus();
                            }
                            else {
                                bonus -= banner.EL_getEnemyBonus();
                            }
                        }
                    }
                }
                bonus += this.Math.floor(best_bravery * 0.1);
            }
            return bonus;
        }
	});



	::mods_hookExactClass("skills/effects/bleeding_effect", function(o){

        o.getDescription = function()
        {
            return "This character is bleeding profusely from a recently received wound and will lose [color=" + this.Const.UI.Color.NegativeValue + "]" + this.Math.ceil(this.m.Damage * this.getContainer().getActor().getBaseProperties().Hitpoints * 0.01) + "[/color] hitpoints each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
        }

        o.applyDamage = function()
        {
            if (this.m.LastRoundApplied != this.Time.getRound())
            {
                this.m.LastRoundApplied = this.Time.getRound();
                local actor = this.getContainer().getActor();
                this.spawnIcon("status_effect_01", actor.getTile());
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.ceil(this.m.Damage * this.getContainer().getActor().getBaseProperties().Hitpoints * 0.01 * (actor.getSkills().hasSkill("effects.hyena_potion") ? 0.5 : 1.0));
                hitInfo.DamageDirect = 1.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                actor.onDamageReceived(this.getAttacker(), this, hitInfo);

                if (--this.m.TurnsLeft <= 0)
                {
                    this.removeSelf();
                }
            }
        }

	});

	::mods_hookExactClass("skills/effects/dazed_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] Damage"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Max Fatigue"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();

            if (!actor.getCurrentProperties().IsImmuneToDaze)
            {
                _properties.DamageTotalMult *= 0.75;
                _properties.Initiative -= 25;
                _properties.Stamina -= 25;

                if (actor.hasSprite("status_stunned") && !this.getContainer().hasSkill("effects.stunned"))
                {
                    actor.getSprite("status_stunned").setBrush("bust_dazed");
                    actor.getSprite("status_stunned").Visible = true;
                    actor.setDirty(true);
                }
            }
            else
            {
                this.removeSelf();
            }
        }

	});

	::mods_hookExactClass("skills/effects/distracted_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35%[/color] Damage"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            _properties.DamageTotalMult *= 0.65;
            _properties.Initiative -= 35;

            if (actor.hasSprite("status_stunned") && !this.getContainer().hasSkill("effects.stunned") && !this.getContainer().hasSkill("effects.dazed"))
            {
                actor.getSprite("status_stunned").setBrush("bust_distracted");
                actor.getSprite("status_stunned").Visible = true;
                actor.setDirty(true);
            }
        }

	});

	::mods_hookExactClass("skills/effects/dodge_effect", function(o){
        o.getBonus <- function()
        {
            local offset = 10;
            local initiative = this.getContainer().getActor().getInitiative();
			local initiative_need = 100.0;
			local bonus = 0;
			while(initiative > initiative_need)
			{
				++bonus;
				initiative -= initiative_need;
				initiative_need *= 2;
			}
			return this.Math.floor((bonus + (initiative / initiative_need)) * offset);
        }

        o.onAfterUpdate = function( _properties )
        {
            local initiative = getBonus();
            _properties.MeleeDefense += this.Math.max(0, initiative);
            _properties.RangedDefense += this.Math.max(0, initiative);
        }

        o.getTooltip = function()
        {
            local initiative = getBonus();
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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + initiative + "[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + initiative + "[/color] Ranged Defense"
                }
            ];
        }

	});

	::mods_hookExactClass("skills/effects/gruesome_feast_effect", function(o){
        o.m.EL_ExtraStack <- 0;
        o.addFeastStack = function()
        {
            local actor = this.getContainer().getActor();
            if(actor.getSize() < 3) {
                actor.grow();
            }
            else {
                ++this.m.EL_ExtraStack;
                this.m.Name = "Feasted(x" + this.m.EL_ExtraStack + ")";
            }
            local skills = actor.getSkills();
            foreach( skill in skills.m.Skills ) {
                if(skill.isType(this.Const.SkillType.TemporaryInjury))
                {
                    skills.remove(skill);
                }
            }
            actor.checkMorale(1, 20);
        }
        o.onUpdate = function ( _properties )
        {
            local base_properties = this.getContainer().getActor().getBaseProperties();
            local size = this.getContainer().getActor().getSize();
            this.m.IsHidden = size <= 1;

            if (size == 2)
            {
                _properties.Hitpoints += this.Math.floor(base_properties.Hitpoints * 2);
                _properties.MeleeSkill += 10;
                _properties.MeleeDefense += 5;
                _properties.RangedDefense -= 5;
                _properties.Bravery += 30;
                _properties.DamageRegularMin += 15;
                _properties.DamageRegularMax += 20;
                _properties.Initiative -= 15;
            }
            else if (size >= 3)
            {
                _properties.Hitpoints += this.Math.floor(base_properties.Hitpoints * (2 + this.m.EL_ExtraStack));
                _properties.MeleeSkill += 20 + 10 * this.m.EL_ExtraStack;
                _properties.MeleeDefense += 10 + 5 * this.m.EL_ExtraStack;
                _properties.RangedDefense -= 10 + 5 * this.m.EL_ExtraStack;
                _properties.Bravery += 60 + 30 * this.m.EL_ExtraStack;
                _properties.DamageRegularMin += 30 + 15 * this.m.EL_ExtraStack;
                _properties.DamageRegularMax += 40 + 20 * this.m.EL_ExtraStack;
                _properties.Initiative -= 30 + 15 * this.m.EL_ExtraStack;
                this.getContainer().getActor().getAIAgent().getProperties().BehaviorMult[this.Const.AI.Behavior.ID.Retreat] = 0.0;
            }


        }

	});



	::mods_hookExactClass("skills/effects/insect_swarm_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Defense"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeSkill -= 50;
            _properties.RangedSkill -= 50;
            _properties.MeleeDefense -= 50;
            _properties.RangedDefense -= 50;
            _properties.Initiative -= 50;
        }

	});

	::mods_hookExactClass("skills/effects/legend_apothecary_mushrooms_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 10 * this.m.TurnsLeft + "%[/color] Damage in Melee"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 * this.m.TurnsLeft + "[/color] Melee Defense"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 * this.m.TurnsLeft + "[/color] Ranged Defense"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/morale.png",
                    text = "No morale check triggered upon losing hitpoints"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeDefense += 10 * this.m.TurnsLeft;
            _properties.RangedDefense += 10 * this.m.TurnsLeft;
        }

	});

	::mods_hookExactClass("skills/effects/legend_baffled_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Damage"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Max Fatigue"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            _properties.DamageTotalMult *= 0.85;
            _properties.Initiative -= 15;
            _properties.Stamina -= 15;

            if (actor.hasSprite("status_stunned") && !this.getContainer().hasSkill("effects.stunned"))
            {
                actor.getSprite("status_stunned").setBrush("bust_dazed");
                actor.getSprite("status_stunned").Visible = true;
                actor.setDirty(true);
            }
        }

	});

	::mods_hookExactClass("skills/effects/legend_beer_buzz_effect", function(o){

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
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Resolve"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] Ranged Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-6[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-6[/color] Ranged Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-12[/color] Initiative"
                }
            ];
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.Bravery += 3;
            _properties.MeleeSkill += 3;
            _properties.RangedSkill += 3;
            _properties.MeleeDefense -= 6;
            _properties.RangedDefense -= 6;
            _properties.Initiative -= 12;
        }

	});

	::mods_hookExactClass("skills/effects/legend_dazed_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] Damage"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Max Fatigue"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            _properties.DamageTotalMult *= 0.5;
            _properties.Initiative -= 50;
            _properties.Stamina -= 50;

            if (actor.hasSprite("status_stunned") && !this.getContainer().hasSkill("effects.stunned"))
            {
                actor.getSprite("status_stunned").setBrush("bust_dazed");
                actor.getSprite("status_stunned").Visible = true;
                actor.setDirty(true);
            }
        }

	});


	::mods_hookExactClass("skills/effects/legend_demon_hound_aura_effect", function(o){

        o.getTooltip = function()
        {
            local penalty = this.m.Penalty;
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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + penalty * 100 + "[/color] Initative"
                }
            ];
        }

        o.onAfterUpdate = function( _properties )
        {
            local penalty = this.getPenalty(_properties);

            if (penalty == 0)
            {
                return;
            }

            _properties.Initiative -= penalty;
            this.m.Penalty = penalty;
            this.m.IsHidden = false;
        }

	});

	::mods_hookExactClass("skills/effects/legend_grappled_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Fatigue recovered per turn"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Maximum Fatigue"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Defense"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            _properties.Stamina -= 50;
            _properties.MeleeDefense -= 50;
            _properties.FatigueRecoveryRate -= 20;

            if (!actor.hasSprite("status_stunned") && !this.getContainer().hasSkill("effects.stunned"))
            {
                actor.getSprite("status_stunned").setBrush("bust_dazed");
                actor.getSprite("status_stunned").Visible = true;
                actor.setDirty(true);
            }
        }

	});

	::mods_hookExactClass("skills/effects/legend_mead_warmth_effect", function(o){

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
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+9[/color] Resolve"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+9[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+9[/color] Ranged Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-18[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-18[/color] Ranged Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-36[/color] Initiative"
                }
            ];
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.Bravery += 9;
            _properties.MeleeSkill += 9;
            _properties.RangedSkill += 9;
            _properties.MeleeDefense -= 18;
            _properties.RangedDefense -= 18;
            _properties.Initiative -= 36;
        }

	});

	::mods_hookExactClass("skills/effects/legend_motivated_effect", function(o){

        o.getTooltip <- function()
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
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Damage"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Ranged Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Resolve"
                }
            ];
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeDamageMult *= 1.1;
            _properties.MeleeSkill += 5;
            _properties.RangedSkill += 5;
            _properties.Bravery += 15;
        }

	});

	::mods_hookExactClass("skills/effects/legend_redback_spider_poison_effect", function(o){

        o.getDescription = function()
        {
            local timeDamage = this.m.Damage * this.m.TurnsLeft;

            if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
            {
                timeDamage = timeDamage * 2;
            }
            timeDamage = this.Math.ceil(timeDamage * this.getContainer().getActor().getBaseProperties().Hitpoints * 0.01);
            return "This character has a vicious poison running through his veins and will lose [color=" + this.Const.UI.Color.NegativeValue + "]" + timeDamage + "[/color] hitpoints each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
        }

        o.applyDamage = function()
        {
            if (this.m.LastRoundApplied != this.Time.getRound())
            {
                this.m.LastRoundApplied = this.Time.getRound();
                this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());

                if (this.m.SoundOnUse.len() != 0)
                {
                    this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
                }

                local timeDamage = this.m.Damage * this.m.TurnsLeft;
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.ceil(timeDamage * this.getContainer().getActor().getBaseProperties().Hitpoints * 0.01);

                if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
                {
                    local timeDamage = this.m.Damage * this.m.TurnsLeft;
                    hitInfo.DamageRegular = 2 * timeDamage;
                }

                hitInfo.DamageDirect = 1.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
            }
        }



	});


	::mods_hookExactClass("skills/effects/legend_transformed_bear_effect", function(o){

        o.getTooltip = function()
        {
            local ret = this.legend_transformed_effect.getTooltip();
            local actor = this.getContainer().getActor();
            ret.extend([
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+200%[/color] hitpoints"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+50[/color] Melee Defense"
                }
            ]);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.Hitpoints += this.Math.floor(2 * this.getContainer().getActor().getBaseProperties().Hitpoints);
            _properties.MeleeDefense += 50;
        }

	});

	::mods_hookExactClass("skills/effects/legend_transformed_boar_effect", function(o){

        o.getTooltip = function()
        {
            local ret = this.legend_transformed_effect.getTooltip();
            local actor = this.getContainer().getActor();
            ret.extend([
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] hitpoints"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100[/color] Maximum Fatigue"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] stamina recovery rate"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25[/color] Resolve"
                }
            ]);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.FatigueRecoveryRateMult *= 2.0;
            _properties.Stamina += 100;
            _properties.Hitpoints += this.Math.floor(1 * this.getContainer().getActor().getBaseProperties().Hitpoints);
            _properties.Bravery += 25;
        }

	});

	::mods_hookExactClass("skills/effects/legend_transformed_rat_effect", function(o){

        o.getTooltip = function()
        {
            local ret = this.legend_transformed_effect.getTooltip();
            local actor = this.getContainer().getActor();
            ret.extend([
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] action points"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "Poison bite"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Resolve"
                }
            ]);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.ActionPoints += 3;
            _properties.Bravery -= 50;
        }

	});

	::mods_hookExactClass("skills/effects/legend_transformed_wolf_effect", function(o){

        o.getTooltip = function()
        {
            local ret = this.legend_transformed_effect.getTooltip();
            local actor = this.getContainer().getActor();
            ret.extend([
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] AP per tile moved"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]-50[/color] fatigue cost per tile moved"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/health.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] hitpoints"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100[/color] Melee Defense"
                }
            ]);
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.MovementAPCostAdditional += -1;
            _properties.MovementFatigueCostMult *= 0.5;
            _properties.Hitpoints += this.Math.floor(1 * this.getContainer().getActor().getBaseProperties().Hitpoints);
            _properties.MeleeDefense += 100;
        }

	});

	::mods_hookExactClass("skills/effects/legend_vala_chant_fury_effect", function ( o )
	{
        o.onDamageReceived = function( _attacker, _damageHitpoints, _damageArmor )
        {
            if (_attacker == null || this.Tactical.TurnSequenceBar.getActiveEntity() == null || _attacker.isAlliedWith(this.getContainer().getActor()) || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != _attacker.getID() || !this.isInRange() || this.getContainer().getActor().getTile().getDistanceTo(_attacker.getTile()) != 1)
            {
                return;
            }

            local chance = this.getPayBackChance();

            if (this.Math.rand(1, 100) <= chance)
            {
                local payback = this.getContainer().getActor().getSkills().getAttackOfOpportunity();

                if (payback != null)
                {
                    this.getContainer().setBusy(true);
                    local attackinfo = {
                        User = this.getContainer().getActor(),
                        Skill = payback,
                        TargetTile = _attacker.getTile(),
                        Container = this.getContainer()
                    };
                    this.Time.scheduleEvent(this.TimeUnit.Virtual, this.Const.Combat.RiposteDelay, this.onPerformPaypack, attackinfo);
                }
            }


            if (_attacker == null || _attacker.isAlliedWith(this.getContainer().getActor()) || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != _attacker.getID() || !this.isInRange() || this.getContainer().getActor().getTile().getDistanceTo(_attacker.getTile()) != 1)
            {
                return;
            }
            if (!_attacker.isAlive() || _attacker.isDying())
            {
                return;
            }

            local chance = this.getPayBackChance();

            if (this.Math.rand(1, 100) <= chance)
            {
                local payback = this.getContainer().getActor().getSkills().getAttackOfOpportunity();

                if (payback != null)
                {
                    this.getContainer().setBusy(true);
                    local attackinfo = {
                        User = this.getContainer().getActor(),
                        Skill = payback,
                        TargetTile = _attacker.getTile(),
                        Container = this.getContainer()
                    };
                    this.Time.scheduleEvent(this.TimeUnit.Virtual, this.Const.Combat.RiposteDelay, this.onPerformPaypack, attackinfo);
                }
            }
        }

        o.onPerformPaypack = function( _attackinfo )
        {
            if(_attackinfo.Container == null) {
                return false;
            }
            _attackinfo.Container.setBusy(false);

            if (_attackinfo.User.isAlive() && _attackinfo.TargetTile.getEntity().isAlive())
            {
                return _attackinfo.Skill.attackEntity(_attackinfo.User, _attackinfo.TargetTile.getEntity());
            }
        }

	});


	::mods_hookExactClass("skills/effects/legend_veteran_levels_effect", function ( o )
	{
		o.onUpdateLevel = function ()
		{
		};
	});

	::mods_hookExactClass("skills/effects/legend_wine_tipsy_effect", function(o){

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
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Resolve"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Ranged Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-12[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-12[/color] Ranged Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-24[/color] Initiative"
                }
            ];
            return ret;
        }

        o.onUpdate = function( _properties )
        {
            _properties.Bravery += 6;
            _properties.MeleeSkill += 6;
            _properties.RangedSkill += 6;
            _properties.MeleeDefense -= 12;
            _properties.RangedDefense -= 12;
            _properties.Initiative -= 24;
        }

	});

	::mods_hookExactClass("skills/effects/lone_wolf_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Melee Skill"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Ranged Skill"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Melee Defense"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Ranged Defense"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Resolve"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            if (!this.getContainer().getActor().isPlacedOnMap())
            {
                this.m.IsHidden = true;
                return;
            }

            local actor = this.getContainer().getActor();
            local myTile = actor.getTile();
            local allies = this.Tactical.Entities.getInstancesOfFaction(actor.getFaction());
            local isAlone = true;

            foreach( ally in allies )
            {
                if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
                {
                    continue;
                }

                if (ally.getTile().getDistanceTo(myTile) <= 2)
                {
                    isAlone = false;
                    break;
                }
            }

            if (isAlone)
            {
                this.m.IsHidden = false;
                _properties.MeleeSkill += 15;
                _properties.RangedSkill += 15;
                _properties.MeleeDefense += 15;
                _properties.RangedDefense += 15;
                _properties.Bravery += 15;
            }
            else
            {
                this.m.IsHidden = true;
            }
        }

	});

	::mods_hookExactClass("skills/effects/net_effect", function(o){

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
                    id = 9,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]Unable to move[/color]"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-45[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-45[/color] Ranged Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-45[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.IsRooted = true;
            _properties.MeleeDefense -= 45;
            _properties.RangedDefense -= 45;
            _properties.Initiative -= 45;
        }

	});

	::mods_hookExactClass("skills/effects/overwhelmed_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.Count * 5 + "[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.Count * 5 + "[/color] Ranged Skill"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeSkill -= 5 * this.m.Count;
            _properties.RangedSkill -= 5 * this.m.Count;
        }

	});

	::mods_hookExactClass("skills/effects/ptr_swordmaster_scenario_recruit_effect", function ( o )
	{
		o.getBonus = function()
		{
			local offset = 2;
			local level = this.getContainer().getActor().getLevel();
			local level_need = 10.0;
			local bonus = 0;
			while(level > level_need)
			{
				++bonus;
				level -= level_need;
				level_need *= 2;
			}
			return this.Math.floor((bonus + (level / level_need)) * offset) * (this.getContainer().hasSkill("perk.ptr_swordmaster_precise") ? 2 : 1);
		}
	});

	::mods_hookExactClass("skills/effects/ptr_swordmaster_scenario_avatar_effect", function ( o )
	{
		o.getSkillBonus = function()
		{
			local offset = 4;
			local level = this.getContainer().getActor().getLevel();
			local level_need = 10.0;
			local bonus = 0;
			while(level > level_need)
			{
				++bonus;
				level -= level_need;
				level_need *= 2;
			}
			return this.Math.floor((bonus + (level / level_need)) * offset) * (this.getContainer().hasSkill("perk.ptr_swordmaster_precise") ? 2 : 1);
		}
	});

	::mods_hookExactClass("skills/effects/ptr_swordmasters_finesse_effect", function ( o )
	{
		o.getSkillBonus = function()
		{
			local offset = 4;
			local level = this.getContainer().getActor().getLevel();
			local level_need = 10.0;
			local bonus = 0;
			while(level > level_need)
			{
				++bonus;
				level -= level_need;
				level_need *= 2;
			}
			return this.Math.floor((bonus + (level / level_need)) * offset) * (this.getContainer().hasSkill("perk.ptr_swordmaster_precise") ? 2 : 1);
		}
	});

	::mods_hookExactClass("skills/effects/ptr_armor_fatigue_recovery_effect", function(o){
        o.getDescription <- function()
        {
            return "这个角色的盔甲降低了角色耐力，但也带来了更强的生存能力。";
        }

        o.isHidden = function()
        {
            return false;
        }

        o.getTooltip = function()
        {
            local tooltip = this.skill.getTooltip();
            local actor = this.getContainer().getActor();
            local properties = actor.getCurrentProperties();
            local armorFat = -1 * actor.getItems().getStaminaModifier([
				::Const.ItemSlot.Body,
				::Const.ItemSlot.Head
			]);
            local extra_movement_fatigue_cost = this.Math.floor((armorFat / (1.0 + actor.getLevel() * 0.08)) * 0.05 - 1);
            
            if(this.World.Flags.get("EL_HasArmorAmbitionRule"))
            {
                extra_movement_fatigue_cost = 0;
            }
            local body_armor = 0;
            local head_armor = 0;
            local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            if(body != null) {
                body_armor = body.getCondition();
            }
            else {
                body_armor = properties.Armor[this.Const.BodyPart.Body];
            }

            local head = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
            if(head != null) {
                head_armor = head.getCondition();
            }
            else {
                head_armor = properties.Armor[this.Const.BodyPart.Head];
            }

            local body_calculate_armor = body_armor / (1.0 + actor.getLevel() * 0.08);
            local head_calculate_armor = head_armor / (1.0 + actor.getLevel() * 0.08);
            local body_damage_received_direct_mult = 1 - body_calculate_armor / (200.0 + body_calculate_armor);
            local head_damage_received_direct_mult = 1 - head_calculate_armor / (200.0 + head_calculate_armor);

            if(extra_movement_fatigue_cost > 0) {
                tooltip.push({
                    id = 10,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + extra_movement_fatigue_cost + "[/color] Fatigue built per tile traveled."
                });
            }
            else if(extra_movement_fatigue_cost < 0) {
                tooltip.push({
                    id = 10,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]-" + (-extra_movement_fatigue_cost) + "[/color] Fatigue built per tile traveled."
                });
            }
            tooltip.push({
                id = 10,
                type = "text",
                icon = "ui/icons/fatigue.png",
                text = "身体只受到 [color=" + this.Const.UI.Color.NegativeValue + "]" + (this.Math.floor(body_damage_received_direct_mult * 100)) + "%[/color]忽视盔甲的伤害"
            });
            tooltip.push({
                id = 10,
                type = "text",
                icon = "ui/icons/fatigue.png",
                text = "头部只受到 [color=" + this.Const.UI.Color.NegativeValue + "]" + (this.Math.floor(head_damage_received_direct_mult * 100)) + "%[/color]忽视盔甲的伤害"
            });
            return tooltip;
        }


        o.onBeforeDamageReceived <- function( _attacker, _skill, _hitInfo, _properties )
        {
            if(_attacker != null && _attacker.getID() != this.getContainer().getActor().getID())
            {
                local calculate_armor = 0;
                local actor = this.getContainer().getActor();
                if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
                {
                    local body_armor = 0;
                    local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
                    if(body != null) {
                        body_armor = body.getCondition();
                    }
                    else {
                        body_armor = _properties.Armor[this.Const.BodyPart.Body];
                    }
                    calculate_armor = body_armor / (1.0 + actor.getLevel() * 0.08);
                }
                else
                {
                    local head_armor = 0;
                    local head = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
                    if(head != null) {
                        head_armor = head.getCondition();
                    }
                    else {
                        head_armor = _properties.Armor[this.Const.BodyPart.Head];
                    }
                    calculate_armor = head_armor / (1.0 + actor.getLevel() * 0.08);
                }
                local damage_received_direct_mult = 1 - calculate_armor / (200.0 + calculate_armor);
                _properties.DamageReceivedDirectMult *= damage_received_direct_mult;
            }
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            local armorFat = -1 * actor.getItems().getStaminaModifier([
                ::Const.ItemSlot.Body,
                ::Const.ItemSlot.Head
            ]);
            
            if(!this.World.Flags.get("EL_HasArmorAmbitionRule"))
            {
                local extra_movement_fatigue_cost = this.Math.floor((armorFat / (1.0 + actor.getLevel() * 0.08)) * 0.05 - 1);
                _properties.MovementFatigueCostAdditional += extra_movement_fatigue_cost;
            }
        }
	});


	::mods_hookExactClass("skills/effects/ptr_arrow_to_the_knee_debuff_effect", function(o){

        o.getTooltip = function()
        {
            local tooltip = this.skill.getTooltip();
            local defenseMalus = this.m.TurnsLeft * this.m.DefMalusPercentagePerTurnLeft;
            local APMalus = this.m.TurnsLeft * this.m.MovementAPCostAdditionalPerTurnLeft;
            tooltip.extend(
                [
                    {
                        id = 10,
                        type = "text",
                        icon = "ui/icons/melee_defense.png",
                        text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + defenseMalus + "[/color] Melee Defense"
                    },
                    {
                        id = 10,
                        type = "text",
                        icon = "ui/icons/ranged_defense.png",
                        text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + defenseMalus + "[/color] Ranged Defense"
                    },
                    {
                        id = 10,
                        type = "text",
                        icon = "ui/icons/action_points.png",
                        text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + APMalus + "[/color] additional Action Points per tile moved"
                    },
                    {
                        id = 10,
                        type = "text",
                        icon = "ui/icons/action_points.png",
                        text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turns remaining. This effect will reduce in intensity with fewer turns remaining."
                    }
                ]
            );

            return tooltip;
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeDefense -= this.m.TurnsLeft * this.m.DefMalusPercentagePerTurnLeft;
            _properties.RangedDefense -= this.m.TurnsLeft * this.m.DefMalusPercentagePerTurnLeft;
            _properties.MovementAPCostAdditional += this.m.TurnsLeft * this.m.MovementAPCostAdditionalPerTurnLeft;
        }

	});

	::mods_hookExactClass("skills/effects/ptr_direct_damage_limiter_effect", function(o){
        o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
        {
        }
        o.onBeforeTargetHit = function ( _skill, _targetEntity, _hitInfo )
        {
        }
        o.onQueryTooltip = function ( _skill, _tooltip )
        {
        }
	});

	::mods_hookExactClass("skills/effects/ptr_follow_up_proccer_effect", function(o){
        o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
        {
            if (!_skill.isAttack() || _skill.isRanged())
            {
                return;
            }

            local actor = this.getContainer().getActor();

            if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(actor))
            {
                return;
            }

            if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
            {
                return;
            }

            if (this.m.SkillCount == this.Const.SkillCounter)
            {
                return;
            }

            this.m.SkillCount = this.Const.SkillCounter;

            local allies = ::Tactical.Entities.getHostileActors(_targetEntity.getFaction());
            foreach (ally in allies)
            {
                if (ally.getID() == actor.getID() || !ally.isAlliedWith(actor))
                {
                    continue;
                }

                local allySkill = ally.getSkills().getSkillByID("effects.ptr_follow_up");
                if (allySkill != null)
                {
                    local attack_skill = ally.getSkills().getAttackOfOpportunity();
                    if(attack_skill == null || _targetEntity.getTile().getDistanceTo(ally.getTile()) > attack_skill.getMaxRange())
                    {
                        return;
                    }
                    allySkill.proc(_targetEntity);
                }
            }
        }
	});

	::mods_hookExactClass("skills/effects/ptr_formidable_approach_debuff_effect", function(o){

        o.getCurrentMalus = function()
        {
            this.pruneEnemies();
            return this.m.CurrentEnemies.len() * (this.getContainer().getActor().isArmedWithTwoHandedWeapon() ? 5 : 10);
        }
	});
	::mods_hookExactClass("skills/effects/ptr_immersive_damage_effect", function(o){

        local onAnySkillUsed = o.onAnySkillUsed;
        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == null || _targetEntity == null || _targetEntity.isDying() || _targetEntity.isAlive())
            {
                return;
            }
            onAnySkillUsed(_skill, _targetEntity, _properties);
        }
	});

	::mods_hookExactClass("skills/effects/ptr_sweeping_strikes_debuff_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.Malus + "[/color] Melee Skill"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeSkill -= this.m.Malus;
        }

	});

	::mods_hookExactClass("skills/effects/rooted_effect", function(o){

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
                    id = 9,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]Unable to move[/color]"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Ranged Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-35[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.IsRooted = true;
            _properties.MeleeDefense -= 35;
            _properties.RangedDefense -= 35;
            _properties.Initiative -= 35;
        }

	});

	::mods_hookExactClass("skills/effects/shellshocked_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "%[/color] Damage"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "[/color] Initiative"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "[/color] Resolve"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "[/color] Melee Skill"
                },
                {
                    id = 15,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "[/color] Ranged Skill"
                },
                {
                    id = 16,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "[/color] Melee Defense"
                },
                {
                    id = 17,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 5 * this.m.TurnsLeft + "[/color] Ranged Defense"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            _properties.DamageTotalMult *= 1.0 - 0.05 * this.m.TurnsLeft;
            _properties.Initiative -= 5 * this.m.TurnsLeft;
            _properties.Bravery -= 5 * this.m.TurnsLeft;
            _properties.MeleeSkill -= 5 * this.m.TurnsLeft;
            _properties.RangedSkill -= 5 * this.m.TurnsLeft;
            _properties.MeleeDefense -= 5 * this.m.TurnsLeft;
            _properties.RangedDefense -= 5 * this.m.TurnsLeft;
        }

	});

	::mods_hookExactClass("skills/effects/smoke_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Skill"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100[/color] Ranged Defense"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "Not affected by Zones of Control"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local tile = this.getContainer().getActor().getTile();

            if (tile.Properties.Effect == null || tile.Properties.Effect.Type != "smoke")
            {
                this.removeSelf();
            }
            else
            {
                _properties.RangedSkill -= 50;
                _properties.RangedDefense += 100;
            }
        }

	});

	::mods_hookExactClass("skills/effects/spider_poison_effect", function(o){

        o.getDescription = function()
        {
            if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
            {
                return "This character has a vicious poison running through his veins and will lose [color=" + this.Const.UI.Color.NegativeValue + "]" + 2 * this.m.Damage + "[/color] hitpoints each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
            }

            return "This character has a vicious poison running through his veins and will lose [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.Damage + "[/color] hitpoints each turn for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] more turn(s).";
            }

        o.applyDamage = function()
        {
            if (this.m.LastRoundApplied != this.Time.getRound())
            {
                this.m.LastRoundApplied = this.Time.getRound();
                this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());

                if (this.m.SoundOnUse.len() != 0)
                {
                    this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
                }

                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.m.Damage;
                if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
                {
                    hitInfo.DamageRegular = 2 * this.m.Damage;
                }
                hitInfo.DamageRegular = this.Math.ceil(hitInfo.DamageRegular * this.getContainer().getActor().getBaseProperties().Hitpoints * 0.01);
                hitInfo.DamageDirect = 1.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
            }
        }





	});

	::mods_hookExactClass("skills/effects/staggered_effect", function(o){

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
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.Initiative -= 50;
        }

	});

	::mods_hookExactClass("skills/effects/str_covering_ally_effect", function(o){

        o.getTooltip = function()
        {
            local tooltip = this.skill.getTooltip();

            tooltip.push({
                id = 10,
                type = "text",
                icon = "ui/icons/melee_defense.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfDefenseMalusPercentage + "[/color] Melee Defense"
            });

            tooltip.push({
                id = 10,
                type = "text",
                icon = "ui/icons/ranged_defense.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfDefenseMalusPercentage + "[/color] Ranged Defense"
            });

            tooltip.push({
                id = 10,
                type = "text",
                icon = "ui/icons/melee_skill.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfSkillMalusPercentage + "[/color] Melee Skill"
            });

            tooltip.push({
                id = 10,
                type = "text",
                icon = "ui/icons/ranged_skill.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.SelfSkillMalusPercentage + "[/color] Ranged Skill"
            });

            return tooltip;
        }

        o.onUpdate = function( _properties )
        {
            if (this.m.Ally == null || this.m.Ally.isNull() || !this.m.Ally.isPlacedOnMap() || this.m.Ally.getFlags().get("Devoured") == true)
            {
                this.removeSelf();
                return;
            }

            local actor = this.getContainer().getActor();
            if (actor.m.IsMoving)
            {
                this.removeSelf();
            }

            local isCoverStillValid = true;
            if (actor.getCurrentProperties().IsRooted || actor.getCurrentProperties().IsStunned || actor.getFlags().get("Devoured") == true || !actor.isArmedWithShield())
            {
                isCoverStillValid = false;
            }

            if (actor.getTile().getDistanceTo(this.m.Ally.getTile()) > 1)
            {
                isCoverStillValid = false;
            }

            if (!isCoverStillValid)
            {
                if (!this.getContainer().getActor().isHiddenToPlayer())
                {
                    this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " is no longer providing cover to " + this.Const.UI.getColorizedEntityName(this.m.Ally));
                }
                this.removeSelf();
                this.onRemoved();
                return;
            }
            local skillMalus = this.m.SelfSkillMalusPercentage;
            local defMalus = this.m.SelfDefenseMalusPercentage;
            _properties.MeleeDefense -= defMalus;
            _properties.RangedDefense -= defMalus;
            _properties.MeleeSkill -= skillMalus;
            _properties.RangedSkill -= skillMalus;
        }

	});


	::mods_hookExactClass("skills/effects/web_effect", function(o){

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
                    id = 9,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]Unable to move[/color]"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/direct_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]Twice as much damage received by a Webknecht\'s attack will ignore armor[/color]"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] Damage"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Melee Defense"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Ranged Defense"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50[/color] Initiative"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.IsRooted = true;
            _properties.DamageTotalMult *= 0.5;
            _properties.MeleeDefense -= 50;
            _properties.RangedDefense -= 50;
            _properties.Initiative -= 50;
            _properties.TargetAttractionMult *= 1.5;
        }

	});

	::mods_hookExactClass("skills/effects/whipped_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 24 + "[/color] Melee Skill"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/ranged_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 28 + "[/color] Ranged Skill"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/bravery.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + 10 + "[/color] Resolve"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 18 + "[/color] Initiative"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 + "[/color] Melee Defense"
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 + "[/color] Ranged Defense"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeSkill += 24;
            _properties.RangedSkill += 28;
            _properties.Bravery -= 10;
            _properties.MeleeDefense += 10;
            _properties.RangedDefense += 10;
            _properties.Initiative += 18;
            local actor = this.getContainer().getActor();
            actor.getSprite("status_sweat").setBrush(this.m.TurnsLeft > 1 ? "bust_slave_whipped" : "bust_slave_whipped_expiring");
            actor.setDirty(true);
        }

	});

	::mods_hookExactClass("skills/effects/withered_effect", function(o){

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
                    id = 11,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.TurnsLeft * 10 + "%[/color] Damage"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.TurnsLeft * 10 + "[/color] Initiative"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.TurnsLeft * 10 + "[/color] Max Fatigue"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.TurnsLeft * 5 + "[/color] Fatigue Recovery per turn"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            local actor = this.getContainer().getActor();
            _properties.DamageTotalMult *= 1.0 - this.m.TurnsLeft * 0.1;
            _properties.Initiative -= this.m.TurnsLeft * 10;
            _properties.Stamina -= this.m.TurnsLeft * 10;
            _properties.FatigueRecoveryRate -= this.m.TurnsLeft * 5;

            if (actor.hasSprite("status_stunned") && !this.getContainer().hasSkill("effects.stunned"))
            {
                actor.getSprite("status_stunned").setBrush("bust_withered");
                actor.getSprite("status_stunned").Visible = true;
                actor.setDirty(true);
            }
        }

	});


    gt.Const.Tactical.Common.onApplyMiasma = function( _tile, _entity )	{
		if (_entity.getFlags().has("undead"))
		{
			return;
		}

		if (_entity.getCurrentProperties().IsImmuneToPoison)
		{
			return;
		}

		local damageMult = _entity.getCurrentProperties().IsResistantToMiasma ? 0.5 : 1.0;
		this.Tactical.spawnIconEffect("status_effect_00", _tile, this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
		local sounds = [];

		if (_entity.getFlags().has("human"))
		{
			sounds = [
				"sounds/humans/human_coughing_01.wav",
				"sounds/humans/human_coughing_02.wav",
				"sounds/humans/human_coughing_03.wav",
				"sounds/humans/human_coughing_04.wav"
			];
		}
		else
		{
			sounds = [
				"sounds/enemies/miasma_appears_01.wav",
				"sounds/enemies/miasma_appears_02.wav",
				"sounds/enemies/miasma_appears_03.wav"
			];
		}

		this.Sound.play(sounds[this.Math.rand(0, sounds.len() - 1)], this.Const.Sound.Volume.Actor, _entity.getPos());
		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = this.Math.ceil(this.Math.rand(5, 10) * damageMult * _tile.getEntity().getBaseProperties().Hitpoints * 0.01);
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;
		_tile.getEntity().onDamageReceived(_entity, null, hitInfo);
	}



});
