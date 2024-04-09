local gt = getroottable();

::mods_registerMod("el_ballance_items_legend_armor_legendary", 1, "el_ballance_items_legend_armor_legendary");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("items/legend_armor/legendary/legend_armor_mountain_named", function(o){


        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of its armor each turn"
            });
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            local bodyMissing = body.getArmorMax() - body.getArmor();
            local bodyAdded = this.Math.min(bodyMissing, this.Math.floor(body.getArmorMax() * 0.1));

            if (bodyAdded <= 0)
            {
                return;
            }

            body.setArmor(body.getArmor() + bodyAdded);
            actor.setDirty(true);

            if (!actor.isHiddenToPlayer())
            {
                this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
                this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
                this.Tactical.EventLog.log(this.Const.UI.getColorized(this.m.Name, "#1e468f") + " heals for " + bodyAdded + " points");
            }
        }

    });

	::mods_hookExactClass("items/legend_armor/legendary/legend_armor_mountain", function(o){

        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of its armor each turn"
            });
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            local bodyMissing = body.getArmorMax() - body.getArmor();
            local bodyAdded = this.Math.min(bodyMissing, this.Math.floor(body.getArmorMax() * 0.1));

            if (bodyAdded <= 0)
            {
                return;
            }

            body.setArmor(body.getArmor() + bodyAdded);
            actor.setDirty(true);

            if (!actor.isHiddenToPlayer())
            {
                this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
                this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
                this.Tactical.EventLog.log(this.Const.UI.getColorized(this.m.Name, "#1e468f") + " heals for " + bodyAdded + " points");
            }
        }

    });

	::mods_hookExactClass("items/legend_armor/legendary/legend_armor_named_warlock_cloak", function(o){

        // local create = o.create;
        // o.create = function()
        // {
        //     //this.logInfo("legend_armor_named_warlock_cloak create");
        //     create();
		// 	this.m.Value = 0;
        //     this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        // }


        o.getTooltip = function()
        {
            local result = this.legend_named_armor.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 19,
						type = "text",
						icon = "ui/icons/damage_received.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]-10%[/color] Damage Received when confident."
					});
					result.insert(i, {
						id = 18,
						type = "text",
						icon = "ui/icons/damage_dealt.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] Damage Dealt when confident."
					});
					result.insert(i, {
						id = 17,
						type = "text",
						icon = "ui/icons/fatigue.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] Fatigue Cost when confident."
					});
					result.insert(i, {
						id = 16,
						type = "text",
						icon = "ui/icons/ranged_defense.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Ranged Defense when confident."
					});
					result.insert(i, {
						id = 15,
						type = "text",
						icon = "ui/icons/melee_defense.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Defense when confident."
					});
					result.insert(i, {
						id = 14,
						type = "text",
						icon = "ui/icons/ranged_skill.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Ranged Skill when confident."
					});
					result.insert(i, {
						id = 13,
						type = "text",
						icon = "ui/icons/melee_skill.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Skill when confident."
					});
					result.insert(i, {
						id = 12,
						type = "text",
						icon = "ui/icons/initiative.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Initiative when confident."
					});
					result.insert(i, {
						id = 11,
						type = "text",
						icon = "ui/icons/bravery.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Resolve when confident."
					});
					result.insert(i, {
						id = 10,
						type = "text",
                        icon = "ui/icons/bravery.png",
                        text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Resolve when confident."
					});
					result.insert(i, {
						id = 9,
						type = "text",
						icon = "ui/icons/special.png",
                        text = "Increase max hitpoints by [color=" + this.Const.UI.Color.PositiveValue + "] +20%[/color]."
					});
					break;
				}
			}
            return result;
        }

        o.onUpdateProperties = function( _properties )
        {
            this.legend_named_armor.onUpdateProperties(_properties);
            _properties.Hitpoints += this.Math.floor(0.2 * this.getContainer().getActor().getBaseProperties().Hitpoints);

            if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Confident)
            {
                _properties.Bravery += this.Const.EL_PlayerNPC.EL_Morale.Effect.BraveryOffset[this.Const.MoraleState.Confident];
                _properties.Initiative += this.Const.EL_PlayerNPC.EL_Morale.Effect.InitiativeOffset[this.Const.MoraleState.Confident];
                _properties.MeleeSkill += this.Const.EL_PlayerNPC.EL_Morale.Effect.MeleeSkillOffset[this.Const.MoraleState.Confident];
                _properties.RangedSkill += this.Const.EL_PlayerNPC.EL_Morale.Effect.RangedSkillOffset[this.Const.MoraleState.Confident];
                _properties.MeleeDefense += this.Const.EL_PlayerNPC.EL_Morale.Effect.MeleeDefenseOffset[this.Const.MoraleState.Confident];
                _properties.RangedDefense += this.Const.EL_PlayerNPC.EL_Morale.Effect.RangedDefenseOffset[this.Const.MoraleState.Confident];

                _properties.FatigueOnSkillUse += this.Const.EL_PlayerNPC.EL_Morale.Effect.FatigueOnSkillUseOffset[this.Const.MoraleState.Confident];

                _properties.DamageTotalMult *= this.Const.EL_PlayerNPC.EL_Morale.Effect.DamageTotalMult[this.Const.MoraleState.Confident];
                _properties.DamageReceivedTotalMult *= this.Const.EL_PlayerNPC.EL_Morale.Effect.DamageReceivedTotalMult[this.Const.MoraleState.Confident];
            }
        }


    });



    ::mods_hookExactClass("items/legend_armor/legendary/legend_armor_of_davkul", function(o){

        local create = o.create;
        o.create = function()
        {
            //this.logInfo("legend_armor_of_davkul create");
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }


        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 6,
						type = "text",
						icon = "ui/icons/special.png",
                        text = "Regenerates itself by [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] points of durability each turn."
					});
					break;
				}
			}
            return result;
        }

        o.onTurnStart = function()
        {
            this.m.Condition = this.Math.minf(this.m.ConditionMax, this.Math.floor(this.m.Condition + this.m.ConditionMax * 0.2));
            this.updateAppearance();
        }

    });

	::mods_hookExactClass("items/legend_armor/legendary/legend_emperors_armor_fake", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, this.Math.min(this.World.Assets.m.EL_WorldLevel, EL_getLevelMax()));
        }

        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Reflects  [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] of damage taken in melee back to the attacker"
            });
            return result;
        }

        o.onDamageReceived = function( _damage, _fatalityType, _attacker )
        {
            this.legend_armor.onDamageReceived(_damage, _fatalityType, _attacker);

            if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && _attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) == 1 && !_attacker.getCurrentProperties().IsImmuneToDamageReflection)
            {
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.maxf(1.0, _damage * 0.25);
                hitInfo.DamageArmor = this.Math.maxf(1.0, _damage * 0.25);
                hitInfo.DamageDirect = 0.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                _attacker.onDamageReceived(_attacker, null, hitInfo);
            }
        }

    });

	::mods_hookExactClass("items/legend_armor/legendary/legend_emperors_armor", function(o){

        local create = o.create;
        o.create = function()
        {
            //this.logInfo("legend_emperors_armor create");
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }


        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 6,
						type = "text",
						icon = "ui/icons/special.png",
                        text = "Reflects  [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color] of damage taken in melee back to the attacker"
					});
					break;
				}
			}
            return result;
        }

        o.onDamageReceived = function( _damage, _fatalityType, _attacker )
        {
            this.legend_armor.onDamageReceived(_damage, _fatalityType, _attacker);

            if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && _attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) == 1 && !_attacker.getCurrentProperties().IsImmuneToDamageReflection)
            {
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.maxf(1.0, _damage * 0.25);
                hitInfo.DamageArmor = this.Math.maxf(1.0, _damage * 0.25);
                hitInfo.DamageDirect = 0.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                _attacker.onDamageReceived(_attacker, null, hitInfo);
            }
        }

    });

    ::mods_hookExactClass("items/legend_armor/legendary/legend_ijirok_armor", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }


        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 6,
						type = "text",
						icon = "ui/icons/special.png",
                        text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] hitpoints of the wearer each turn"
					});
					break;
				}
			}
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
            local healthAdded = this.Math.min(healthMissing, this.Math.floor(actor.getHitpointsMax() * 0.2));

            if (healthAdded <= 0)
            {
                return;
            }

            actor.setHitpoints(actor.getHitpoints() + healthAdded);
            actor.setDirty(true);

            if (!actor.isHiddenToPlayer())
            {
                this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
                this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
                this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + healthAdded + " points");
            }
        }

    });


    ::mods_hookExactClass("items/legend_armor/legendary/legend_skin_armor", function(o){

        // local create = o.create;
        // o.create = function()
        // {
        //     //this.logInfo("legend_skin_armor create");
        //     create();
		// 	this.m.Value = 0;
        //     this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        // }


        o.getTooltip = function()
        {
            local result = this.legend_armor.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 6,
						type = "text",
						icon = "ui/icons/special.png",
                        text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of the hitpoints of the wearer each turn"
					});
					break;
				}
			}
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
            local healthAdded = this.Math.min(healthMissing, actor.getHitpointsMax() * 0.1);

            if (healthAdded <= 0)
            {
                return;
            }

            actor.setHitpoints(actor.getHitpoints() + healthAdded);
            actor.setDirty(true);

            if (!actor.isHiddenToPlayer())
            {
                this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
                this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
                this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " heals for " + healthAdded + " points");
            }
        }

    });


});
