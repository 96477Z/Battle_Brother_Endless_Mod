local gt = getroottable();

::mods_registerMod("el_ballance_items_armor_legendary", 1, "el_ballance_items_armor_legendary");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookNewObject("items/armor/legendary/armor_of_davkul", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Regenerates itself by [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color] points of durability each turn."
            });
            return result;
        }

        o.onTurnStart = function()
        {
            this.m.Condition = this.Math.minf(this.m.ConditionMax, this.Math.floor(this.m.Condition + this.m.ConditionMax * 0.4));
            this.updateAppearance();
        }

    });

	::mods_hookNewObject("items/armor/legendary/emperors_armor_fake", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Reflects [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of damage taken in melee back to the attacker"
            });
            return result;
        }

        o.onDamageReceived = function( _damage, _fatalityType, _attacker )
        {
            this.armor.onDamageReceived(_damage, _fatalityType, _attacker);

            if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && _attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) == 1 && !_attacker.getCurrentProperties().IsImmuneToDamageReflection)
            {
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.maxf(1.0, _damage * 0.5);
                hitInfo.DamageArmor = this.Math.maxf(1.0, _damage * 0.5);
                hitInfo.DamageDirect = 0.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                _attacker.onDamageReceived(_attacker, null, hitInfo);
            }
        }

    });

	::mods_hookNewObject("items/armor/legendary/emperors_armor", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Reflects [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] of damage taken in melee back to the attacker"
            });
            return result;
        }

        o.onDamageReceived = function( _damage, _fatalityType, _attacker )
        {
            this.armor.onDamageReceived(_damage, _fatalityType, _attacker);

            if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && _attacker.getTile().getDistanceTo(this.getContainer().getActor().getTile()) == 1 && !_attacker.getCurrentProperties().IsImmuneToDamageReflection)
            {
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.maxf(1.0, _damage * 0.5);
                hitInfo.DamageArmor = this.Math.maxf(1.0, _damage * 0.5);
                hitInfo.DamageDirect = 0.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                _attacker.onDamageReceived(_attacker, null, hitInfo);
            }
        }

    });


    ::mods_hookNewObject("items/armor/legendary/ijirok_armor", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]40%[/color] hitpoints of the wearer each turn"
            });
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
            local healthAdded = this.Math.min(healthMissing, this.Math.floor(actor.getHitpointsMax() * 0.4));

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

    ::mods_hookNewObject("items/armor/legendary/legend_mountain_armor", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }


        o.getTooltip = function()
        {
            local result = this.armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] of its armor each turn"
            });
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            local bodyMissing = body.getArmorMax() - body.getArmor();
            local bodyAdded = this.Math.min(bodyMissing, this.Math.floor(body.getArmorMax() * 0.2));

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

    ::mods_hookNewObject("items/armor/legendary/legend_skin_armor", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }


        o.getTooltip = function()
        {
            local result = this.armor.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/health.png",
                text = "Heals [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] of the hitpoints of the wearer each turn"
            });
            return result;
        }

        o.onTurnStart = function()
        {
            local actor = this.getContainer().getActor();
            local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
            local healthAdded = this.Math.min(healthMissing, actor.getHitpointsMax() * 0.2);

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