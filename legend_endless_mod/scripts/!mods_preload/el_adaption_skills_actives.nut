local gt = getroottable();

::mods_registerMod("el_adaption_skills_actives", 1, "el_adaption_skills_actives");
::mods_queue(null, "el_player_npc", function ()
{


	::mods_hookExactClass("skills/actives/legend_field_repairs", function(o){

        o.getTooltip = function()
        {
            local ret = this.getDefaultUtilityTooltip();
            ret.push({
                id = 6,
                type = "text",
                icon = "ui/icons/vision.png",
                text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color]."
            });
            ret.push({
                id = 7,
                type = "text",
                icon = "ui/icons/asset_money.png",
                text = "You have [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(this.World.Assets.getArmorParts()) + "[/color] tools."
            });
            local combat_level = this.getContainer().getActor().EL_getCombatLevel();
            local max_repairs = this.Math.floor(this.World.Assets.getArmorParts() * 5 * (1 + combat_level * 0.08));
            ret.push({
                id = 8,
                type = "text",
                icon = "ui/icons/asset_money.png",
                text = "You can repair max [color=" + this.Const.UI.Color.PositiveValue + "]" + max_repairs + "[/color] points of armor."
            });
            return ret;
        }


        o.onUse = function( _user, _targetTile )
        {
            local target = _targetTile.getEntity();
            local head = target.getHeadItem();
            local headArmor = head == null ? 0 : head.getArmor();
            local maxHeadArmor = head == null ? 0 : head.getArmorMax();
            local body = target.getBodyItem();
            local bodyArmor = body == null ? 0 : body.getArmor();
            local maxBodyArmor = body == null ? 0 : body.getArmorMax();
            local combat_level = this.getContainer().getActor().EL_getCombatLevel();
            local cost = 0;
            local max_cost = this.Math.min(this.Math.floor(this.m.MaxTools * (1 + combat_level * 0.08)), this.Math.floor(this.World.Assets.getArmorParts()));

            for( ; cost < max_cost; ++cost )
            {
                if (headArmor >= bodyArmor && maxBodyArmor != bodyArmor)
                {
                    bodyArmor = this.Math.minf(maxBodyArmor, bodyArmor + this.m.RepairPerTool);
                    continue;
                }
                else if(headArmor < bodyArmor && maxHeadArmor != headArmor)
                {
                    headArmor = this.Math.minf(maxHeadArmor, headArmor + this.m.RepairPerTool);
                    continue;
                }
                else if(maxBodyArmor != bodyArmor) {
                    bodyArmor = this.Math.minf(maxBodyArmor, bodyArmor + this.m.RepairPerTool);
                    continue;
                }
                else if(maxHeadArmor != headArmor) {
                    headArmor = this.Math.minf(maxHeadArmor, headArmor + this.m.RepairPerTool);
                    continue;
                }
                break;
            }
            body.setArmor(bodyArmor);
            head.setArmor(headArmor);
            target.setDirty(true);
            this.World.Assets.addArmorParts(cost * -1);
        }

	});


	::mods_hookExactClass("skills/actives/hand_to_hand", function(o){

        o.getTooltip = function()
        {
            local ret = this.getDefaultTooltip();
            local actor = this.getContainer().getActor();

            if (actor.getOffhandItem() != null)
            {
                ret.push({
                    id = 6,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "Damage halved due to holding something in your off hand"
                });
            }

            if (actor.isSummoned() || this.m.Backgrounds.find(actor.getBackground()) != null)
            {
                ret.push({
                    id = 7,
                    type = "text",
                    icon = "ui/icons/regular_damage.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] Damage (from background)"
                });
            }

            return ret;
        }

	});


	::mods_hookExactClass("skills/actives/legend_gruesome_feast", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _targetTile = _user.getTile();

            if (_targetTile.IsVisibleForPlayer)
            {
                if (this.Const.Tactical.GruesomeFeastParticles.len() != 0)
                {
                    for( local i = 0; i < this.Const.Tactical.GruesomeFeastParticles.len(); i = i )
                    {
                        this.Tactical.spawnParticleEffect(false, this.Const.Tactical.GruesomeFeastParticles[i].Brushes, _targetTile, this.Const.Tactical.GruesomeFeastParticles[i].Delay, this.Const.Tactical.GruesomeFeastParticles[i].Quantity, this.Const.Tactical.GruesomeFeastParticles[i].LifeTimeQuantity, this.Const.Tactical.GruesomeFeastParticles[i].SpawnRate, this.Const.Tactical.GruesomeFeastParticles[i].Stages);
                        i = ++i;
                    }
                }

                if (_user.isDiscovered() && (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer))
                {
                    this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " feasts on a corpse");
                }
            }

            if (!_user.isHiddenToPlayer())
            {
                this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onRemoveCorpse, _targetTile);
            }
            else
            {
                this.onRemoveCorpse(_targetTile);
            }

            this.spawnBloodbath(_targetTile);
            _user.setHitpoints(this.Math.min(_user.getHitpoints() + 50, _user.getHitpointsMax()));
            local skills = _user.getSkills().getAllSkillsOfType(this.Const.SkillType.Injury);

            foreach( s in skills )
            {
                s.removeSelf();
            }

            local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());

            foreach( a in actors )
            {
                if (a.getID() == _user.getID())
                {
                    continue;
                }

                if (_user.getTile().getDistanceTo(a.getTile()) > 4)
                {
                    continue;
                }

                if (a.getFaction() != _user.getFaction())
                {
                    continue;
                }

                a.getSkills().add(this.new("scripts/skills/effects/legend_dazed_effect"));
                if(!actor.isSummoned())
                {
                    a.worsenMood(2.0, "Witnessed someone eat a corpse");
                }
            }

            _user.onUpdateInjuryLayer();
            return true;
        }

	});


	::mods_hookExactClass("skills/actives/legend_raise_undead", function(o){

        o.spawnUndead = function( _user, _tile )
        {
            local p = _tile.Properties.get("Corpse");
            p.Faction = _user.getFaction();

            if (p.Faction == this.Const.Faction.Player)
            {
                p.Faction = this.Const.Faction.PlayerAnimals;
            }

            local e = this.Tactical.Entities.onResurrect(p, true, _user);

            if (e != null)
            {
                e.getSprite("socket").setBrush(_user.getSprite("socket").getBrush().Name);
            }
        }

	});

	::mods_hookExactClass("skills/actives/legend_raise_undead", function(o){

        o.spawnUndead = function( _user, _tile )
        {
            local p = _tile.Properties.get("Corpse");
            p.Faction = _user.getFaction();

            if (p.Faction == this.Const.Faction.Player)
            {
                p.Faction = this.Const.Faction.PlayerAnimals;
            }

            local e = this.Tactical.Entities.onResurrect(p, true, _user);

            if (e != null)
            {
                e.getSprite("socket").setBrush(_user.getSprite("socket").getBrush().Name);
            }
        }

	});

	::mods_hookExactClass("skills/actives/legend_spawn_skill", function(o){

        o.getCostString = function()
        {
            local actor = this.getContainer().getActor();
            return "[i]Costs " + (this.isAffordableBasedOnAPPreview() ? "[b][color=" + this.Const.UI.Color.PositiveValue + "]" + this.getActionPointCost() : "[b][color=" + this.Const.UI.Color.NegativeValue + "]" + this.getActionPointCost()) + " AP[/color][/b] and [b][color=" + this.Const.UI.Color.NegativeValue + "]" + this.Math.floor(this.m.HPCost * (1 + actor.getLevel() * 0.08)) + " HP[/color][/b] to use and builds up " + (this.isAffordableBasedOnFatiguePreview() ? "[b][color=" + this.Const.UI.Color.PositiveValue + "]" + this.getFatigueCost() : "[b][color=" + this.Const.UI.Color.NegativeValue + "]" + this.getFatigueCost()) + " Fatigue[/color][/b][/i]\n";
        }

        o.isUsable <- function()
        {
            local actor = this.getContainer().getActor();
            return this.skill.isUsable() && actor.getHitpointsMax() > this.Math.floor(this.m.HPCost * (1 + actor.getLevel() * 0.08));
        }

        o.onUse = function( _user, _targetTile )
        {
            local spawnItem;
            local items = this.World.Assets.getStash().getItems();
            foreach( item in items )
            {
                if (item == null)
                {
                    continue;
                }

                if (item.getID() != this.m.SpawnItem)
                {
                    continue;
                }

                if (item.isUnleashed())
                {
                    continue;
                }

                spawnItem = item;
                this.World.Assets.getStash().remove(item);
                break;
            }

            if (spawnItem == null)
            {
                return false;
            }

            local entity = this.Const.World.Common.EL_addEntityByScript(this.getScript(), _targetTile, this.m.IsControlledByPlayer ? this.Const.Faction.Player : this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel(), true);

            entity.setItem(spawnItem);
            entity.setName(spawnItem.getName());
            entity.riseFromGround();
            entity.getFlags().add("IsSummoned", true);
            entity.getFlags().add("Summoner", _user);
            entity.setActionPoints(this.Math.round(this.m.APStartMult * entity.getActionPoints()));
            spawnItem.setEntity(entity);
            this.m.Items.push(spawnItem);
            this.spawnIcon("status_effect_01", _user.getTile());
            local skills = _user.getSkills();
            local ballance_skill = skills.getSkillByID("el_effects.summon_ballance");
            if(ballance_skill == null) {
                ballance_skill = this.new("scripts/skills/el_effects/el_summon_ballance_effect");
                _user.getSkills().add(ballance_skill);
            }
            ballance_skill.EL_addHitpointsOffset(-this.Math.floor(this.m.HPCost * (1 + _user.getLevel() * 0.08)));
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_bear", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_bear_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setName(this.m.EntityName);

            if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_dogwhisperer"))
            {
                entity.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
                entity.getSkills().add(this.new("scripts/skills/perks/perk_colossus"));
                entity.getSkills().add(this.new("scripts/skills/perks/perk_underdog"));
            }

            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_cat", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setName(this.m.EntityName);
            entity.setMoraleState(this.Const.MoraleState.Confident);
            this.m.Entity = entity;

            if (!this.World.getTime().IsDaytime)
            {
                entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
            }

            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_catapult", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_catapult_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setName(this.m.EntityName);
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_hound", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_hound_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setName(this.m.EntityName);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);

            if (!this.World.getTime().IsDaytime)
            {
                entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
            }

            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_hound", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_hound_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setName(this.m.EntityName);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_warbear", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setItem(this.m.Item);
            entity.setName(this.m.Item.getName());
            this.m.Item.setEntity(entity);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.m.IsHidden = true;
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_white_wolf", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setItem(this.m.Item);
            entity.setName(this.m.Item.getName());
            this.m.Item.setEntity(entity);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);

            this.m.IsHidden = true;
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_wolf", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_wolf_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setName(this.m.EntityName);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);
            return true;
        }

	});


	::mods_hookExactClass("skills/actives/raise_all_undead_skill", function(o){

        o.spawnUndead = function( _user, _tile )
        {
            local p = _tile.Properties.get("Corpse");
            p.Faction = _user.getFaction();
            local e = this.Tactical.Entities.onResurrect(p, true, _user);

            if (e != null)
            {
                e.getSprite("socket").setBrush(_user.getSprite("socket").getBrush().Name);
            }

            return e;
        }

	});


	::mods_hookExactClass("skills/actives/raise_undead", function(o){

        o.spawnUndead = function( _user, _tile )
        {
            local p = _tile.Properties.get("Corpse");
            p.Faction = _user.getFaction();

            if (p.Faction == this.Const.Faction.Player)
            {
                p.Faction = this.Const.Faction.PlayerAnimals;
            }

            local e = this.Tactical.Entities.onResurrect(p, true, _user);

            if (e != null)
            {
                e.getSprite("socket").setBrush(_user.getSprite("socket").getBrush().Name);
            }
        }

	});

	::mods_hookExactClass("skills/actives/swallow_whole_skill", function(o){

        o.isUsable = function()
        {
            return false;
        }

	});

	::mods_hookExactClass("skills/actives/uproot_skill", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local myTile = _user.getTile();
            local dir = myTile.getDirectionTo(_targetTile);
            this.Tactical.spawnAttackEffect("uproot", _targetTile, 0, -50, 100, 300, 100, this.createVec(0, 90), 200, this.createVec(0, -90), true);

            for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = i )
            {
                this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, _targetTile, this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.5, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages, this.createVec(0, -30));
                i = ++i;
                i = i;
            }

            if (_targetTile.IsOccupiedByActor && _targetTile.getEntity().isAttackable() && !(_targetTile.getEntity().getType() == this.Const.EntityType.Schrat || _targetTile.getEntity().getType() == this.Const.EntityType.SchratSmall || _targetTile.getEntity().getType() == this.Const.EntityType.LegendGreenwoodSchrat || _targetTile.getEntity().getType() == this.Const.EntityType.LegendGreenwoodSchratSmall))
            {
                if (_targetTile.getEntity().m.IsShakingOnHit)
                {
                    this.Tactical.getShaker().shake(_targetTile.getEntity(), _targetTile, 7);
                    _user.playSound(this.Const.Sound.ActorEvent.Move, 2.0);
                }
                if (this.attackEntity(_user, _targetTile.getEntity()) && !_targetTile.IsEmpty)
                {
                    this.applyEffectToTarget(_user, _targetTile.getEntity(), _targetTile);
                }
            }

            if (_targetTile.hasNextTile(dir))
            {
                local forwardTile = _targetTile.getNextTile(dir);
                this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, function ( _tag )
                {
                    this.Tactical.spawnAttackEffect("uproot", forwardTile, 0, -50, 100, 300, 100, this.createVec(0, 90), 200, this.createVec(0, -90), true);

                    for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = i )
                    {
                        this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, forwardTile, this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.5, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages, this.createVec(0, -30));
                        i = ++i;
                        i = i;
                    }

                    if (forwardTile.IsOccupiedByActor && forwardTile.getEntity().m.IsShakingOnHit)
                    {
                        this.Tactical.getShaker().shake(forwardTile.getEntity(), forwardTile, 7);
                        _user.playSound(this.Const.Sound.ActorEvent.Move, 2.0);
                    }
                }.bindenv(this), null);

                if (forwardTile.IsOccupiedByActor && forwardTile.getEntity().isAttackable() && this.Math.abs(forwardTile.Level - myTile.Level) <= 1 && !(forwardTile.getEntity().getType() == this.Const.EntityType.Schrat || forwardTile.getEntity().getType() == this.Const.EntityType.SchratSmall || forwardTile.getEntity().getType() == this.Const.EntityType.LegendGreenwoodSchrat || forwardTile.getEntity().getType() == this.Const.EntityType.LegendGreenwoodSchratSmall))
                {
                    if (this.attackEntity(_user, forwardTile.getEntity()) && !forwardTile.IsEmpty)
                    {
                        this.applyEffectToTarget(_user, forwardTile.getEntity(), forwardTile);
                    }
                }

                if (forwardTile.hasNextTile(dir))
                {
                    local furtherForwardTile = forwardTile.getNextTile(dir);
                    this.Time.scheduleEvent(this.TimeUnit.Virtual, 400, function ( _tag )
                    {
                        this.Tactical.spawnAttackEffect("uproot", furtherForwardTile, 0, -50, 100, 300, 100, this.createVec(0, 90), 200, this.createVec(0, -90), true);

                        for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = i )
                        {
                            this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, furtherForwardTile, this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.5, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages, this.createVec(0, -30));
                            i = ++i;
                            i = i;
                        }

                        if (furtherForwardTile.IsOccupiedByActor && furtherForwardTile.getEntity().m.IsShakingOnHit)
                        {
                            this.Tactical.getShaker().shake(furtherForwardTile.getEntity(), furtherForwardTile, 7);
                            _user.playSound(this.Const.Sound.ActorEvent.Move, 2.0);
                        }
                    }.bindenv(this), null);

                    if (furtherForwardTile.IsOccupiedByActor && furtherForwardTile.getEntity().isAttackable() && !(furtherForwardTile.getEntity().getType() == this.Const.EntityType.Schrat || furtherForwardTile.getEntity().getType() == this.Const.EntityType.SchratSmall || furtherForwardTile.getEntity().getType() == this.Const.EntityType.LegendGreenwoodSchrat || furtherForwardTile.getEntity().getType() == this.Const.EntityType.LegendGreenwoodSchratSmall))
                    {
                        if (this.attackEntity(_user, forwardTile.getEntity()) && !forwardTile.IsEmpty)
                        {
                            this.applyEffectToTarget(_user, forwardTile.getEntity(), forwardTile);
                        }
                    }

                    // [326]  OP_CLOSE          0      6    0    0
                }

                // [327]  OP_CLOSE          0      5    0    0
            }

            return true;
        }

	});

    ::mods_hookExactClass("skills/actives/serpent_bite_skill", function(o){
        o.onUse = function ( _user, _targetTile )
        {
            local tag = {
                Skill = this,
                User = _user,
                TargetTile = _targetTile
            };

            if ((!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer) && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == this.getContainer().getActor().getID())
            {
                this.getContainer().setBusy(true);
                local d = _user.getTile().getDirectionTo(_targetTile) + 3;
                d = d > 5 ? d - 6 : d;

                if (_user.getTile().hasNextTile(d))
                {
                    this.Tactical.getShaker().shake(_user, _user.getTile().getNextTile(d), 6);
                }

                return this.attackEntity(_user, _targetTile.getEntity());
            }
            else
            {
                return this.attackEntity(_user, _targetTile.getEntity());
            }
        }
    });

    ::mods_hookExactClass("skills/actives/sweep_skill", function(o){
        o.onUse = function ( _user, _targetTile )
        {
            this.m.TilesUsed = [];
            this.getContainer().setBusy(true);
            local tag = {
                Skill = this,
                User = _user,
                TargetTile = _targetTile
            };

            if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
            {
                this.onPerformAttack(tag);

                if (!_user.isPlayerControlled() && _targetTile.getEntity().isPlayerControlled())
                {
                    _user.getTile().addVisibilityForFaction(this.Const.Faction.Player);
                }
            }
            else
            {
                this.onPerformAttack(tag);
            }

            return true;
        }

        o.onPerformAttack = function( _tag )
        {
            local _targetTile = _tag.TargetTile;
            local _user = _tag.User;
            local target = _targetTile.getEntity();

            if (target == null || !target.isAlive() || target.isDying())
            {
                return false;
            }

            this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSwing);
            local ret = false;
            local ownTile = _user.getTile();
            local dir = ownTile.getDirectionTo(_targetTile);
            ret = this.attackEntity(_user, target);

            if (_user == null || !_user.isAlive() || _user.isDying() || !ret)
            {
                return ret;
            }

            if (ret && _targetTile.IsOccupiedByActor && target.isAlive() && !target.isDying())
            {
                this.applyEffectToTarget(_user, target, _targetTile);
            }

            local nextDir = dir - 1 >= 0 ? dir - 1 : this.Const.Direction.COUNT - 1;

            if (ownTile.hasNextTile(nextDir))
            {
                local nextTile = ownTile.getNextTile(nextDir);
                local success = false;

                if (nextTile.IsOccupiedByActor && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - ownTile.Level) <= 1 && !_user.isAlliedWith(nextTile.getEntity()) && nextTile.getEntity().isAlive() && !nextTile.getEntity().isDying())
                {
                    success = this.attackEntity(_user, nextTile.getEntity());
                }

                if (_user == null || !_user.isAlive() || _user.isDying())
                {
                    return success;
                }

                if (success && nextTile.IsOccupiedByActor && nextTile.getEntity().isAlive() && !nextTile.getEntity().isDying())
                {
                    this.applyEffectToTarget(_user, nextTile.getEntity(), nextTile);
                }

                ret = success || ret;
            }

            nextDir = nextDir - 1 >= 0 ? nextDir - 1 : this.Const.Direction.COUNT - 1;

            if (ownTile.hasNextTile(nextDir))
            {
                local nextTile = ownTile.getNextTile(nextDir);
                local success = false;

                if (nextTile.IsOccupiedByActor && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - ownTile.Level) <= 1 && !_user.isAlliedWith(nextTile.getEntity()) && nextTile.getEntity().isAlive() && !nextTile.getEntity().isDying())
                {
                    success = this.attackEntity(_user, nextTile.getEntity());
                }

                if (_user == null || !_user.isAlive() || _user.isDying())
                {
                    return success;
                }

                if (success && nextTile.IsOccupiedByActor && nextTile.getEntity().isAlive() && !nextTile.getEntity().isDying())
                {
                    this.applyEffectToTarget(_user, nextTile.getEntity(), nextTile);
                }

                ret = success || ret;
            }

            this.m.TilesUsed = [];
            return ret;
        }

	});

    ::mods_hookExactClass("skills/actives/sweep_zoc_skill", function(o){
        local create = o.create;
        o.create = function() {
            create();
            this.m.ActionPointCost = 4;
        }
	});

	::mods_hookExactClass("skills/actives/throw_golem_skill", function(o){


        o.isUsable = function()
        {
            local actor = this.getContainer().getActor();
            local myTile = actor.getTile();
            local empty = 0;

            for( local j = 0; j < 6; j = ++j )
            {
                if (!myTile.hasNextTile(j))
                {
                }
                else if (myTile.getNextTile(j).IsEmpty)
                {
                    empty = ++empty;
                }
            }

            return this.skill.isUsable() && this.getContainer().getActor().getSize() > 1 && empty >= 1;
        }

        o.onSpawn = function( _data )
        {
            local target_tiles = [];
            local freeTiles = [];
            local lucky = this.Math.rand(1, 100) <= 20;
            local actor = _data.User;
            if (_data.TargetTile.IsEmpty)
            {
                freeTiles.push({
                    Tile = _data.TargetTile,
                    Score = 1
                });
            }
            else
            {
                for( local i = 0; i < 6; i = ++i )
                {
                    if (!_data.TargetTile.hasNextTile(i))
                    {
                    }
                    else
                    {
                        local nextTile = _data.TargetTile.getNextTile(i);

                        if (nextTile.IsEmpty)
                        {
                            local score = 1;

                            if (lucky)
                            {
                                for( local j = 0; j < 6; j = ++j )
                                {
                                    if (!nextTile.hasNextTile(j))
                                    {
                                    }
                                    else
                                    {
                                        local veryNextTile = nextTile.getNextTile(j);

                                        if (veryNextTile.IsOccupiedByActor && veryNextTile.getEntity().getType() == this.Const.EntityType.SandGolem && veryNextTile.getEntity().getSize() == 1)
                                        {
                                            score = score + 5;
                                        }
                                    }
                                }
                            }

                            freeTiles.push({
                                Tile = nextTile,
                                Score = score
                            });
                        }
                    }
                }
            }

            if (lucky)
            {
                freeTiles.sort(function ( _a, _b )
                {
                    if (_a.Score > _b.Score)
                    {
                        return -1;
                    }
                    else if (_a.Score < _b.Score)
                    {
                        return 1;
                    }

                    return 0;
                });
            }
            else
            {
                freeTiles[0] = freeTiles[this.Math.rand(0, freeTiles.len() - 1)];
            }
            if(freeTiles.len() > 0) {
                target_tiles.push(freeTiles[0]);
                freeTiles.remove(0);
            }

            freeTiles = [];
            for( local i = 0; i < 6; i = ++i )
            {
                if (!_data.User.getTile().hasNextTile(i))
                {
                }
                else
                {
                    local nextTile = _data.User.getTile().getNextTile(i);

                    if (nextTile.IsEmpty)
                    {
                        local score = 1;

                        for( local j = 0; j < 6; j = ++j )
                        {
                            if (!nextTile.hasNextTile(j))
                            {
                            }
                            else
                            {
                                local veryNextTile = nextTile.getNextTile(j);

                                if (veryNextTile.IsOccupiedByActor && veryNextTile.getEntity().getType() == this.Const.EntityType.SandGolem && veryNextTile.getEntity().getSize() == _data.User.getSize() - 1)
                                {
                                    score = score + 5;
                                }
                            }
                        }

                        freeTiles.push({
                            Tile = nextTile,
                            Score = score
                        });
                    }
                }
            }

            freeTiles.sort(function ( _a, _b )
            {
                if (_a.Score > _b.Score)
                {
                    return -1;
                }
                else if (_a.Score < _b.Score)
                {
                    return 1;
                }

                return 0;
            });

            if(freeTiles.len() > 0) {
                target_tiles.push(freeTiles[0]);
                freeTiles.remove(0);
            }

            if(target_tiles.len() == 2) {
                _data.User.shrink();
                _data.User.setHitpoints(_data.User.getHitpointsMax());
                _data.User.getBaseProperties().Armor[0] = _data.User.getBaseProperties().ArmorMax[0];
                _data.User.getBaseProperties().Armor[1] = _data.User.getBaseProperties().ArmorMax[1];

                if (_data.User.getTile().IsVisibleForPlayer)
                {
                    for( local i = 0; i < this.Const.Tactical.SandGolemParticles.len(); i = ++i )
                    {
                        this.Tactical.spawnParticleEffect(false, this.Const.Tactical.SandGolemParticles[i].Brushes, _data.User.getTile(), this.Const.Tactical.SandGolemParticles[i].Delay, this.Const.Tactical.SandGolemParticles[i].Quantity, this.Const.Tactical.SandGolemParticles[i].LifeTimeQuantity, this.Const.Tactical.SandGolemParticles[i].SpawnRate, this.Const.Tactical.SandGolemParticles[i].Stages);
                    }
                }

                for(local i = 0; i < target_tiles.len(); ++i) {
                    local tile = target_tiles[i];
                    local entity_type = _data.User.getSize() == 1 ? this.Const.World.Spawn.Troops.SandGolem : this.Const.World.Spawn.Troops.SandGolemMEDIUM;
                    local rock = this.Const.World.Common.EL_addEntity(entity_type, tile.Tile, _data.User.getFaction(), _data.User.EL_getRankLevel(), _data.User.EL_getLevel());
                    if (_data.User.getWorldTroop() != null && ("Party" in _data.User.getWorldTroop()) && _data.User.getWorldTroop().Party != null)
                    {
                        local e = this.Const.World.Common.addTroop(_data.User.getWorldTroop().Party.get(), {
                            Type = entity_type
                        }, false);
                        rock.setWorldTroop(e);
                    }

                    rock.getSprite("body").Color = _data.User.getSprite("body").Color;
                    rock.getSprite("body").Saturation = _data.User.getSprite("body").Saturation;
                    if (tile.Tile.IsVisibleForPlayer)
                    {
                        for( local j = 0; j < this.Const.Tactical.SandGolemParticles.len(); j = ++j )
                        {
                            this.Tactical.spawnParticleEffect(false, this.Const.Tactical.SandGolemParticles[j].Brushes, tile.Tile, this.Const.Tactical.SandGolemParticles[j].Delay, this.Const.Tactical.SandGolemParticles[j].Quantity, this.Const.Tactical.SandGolemParticles[j].LifeTimeQuantity, this.Const.Tactical.SandGolemParticles[j].SpawnRate, this.Const.Tactical.SandGolemParticles[j].Stages);
                        }
                    }

                }
            }
        }

	});

	::mods_hookExactClass("skills/actives/unleash_wardog", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setItem(this.m.Item);
            entity.setName(this.m.Item.getName());
            entity.setVariant(this.m.Item.getVariant());
            this.m.Item.setEntity(entity);

            if (this.m.Item.getArmorScript() != null)
            {
                local item = this.new(this.m.Item.getArmorScript());
                entity.getItems().equip(item);
            }

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);
            this.m.IsHidden = true;
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/unleash_wolf", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, _user.EL_getRankLevel(), _user.EL_getLevel());
            entity.setItem(this.m.Item);
            entity.setName(this.m.Item.getName());
            this.m.Item.setEntity(entity);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);
            this.m.IsHidden = true;
            return true;
        }

	});

    ::mods_hookExactClass("skills/actives/aimed_shot", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += 10 + this.m.Item.getAdditionalAccuracy();
                _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
                _properties.DamageRegularMult *= 1.1;

                if (_properties.IsSharpshooter)
                {
                    _properties.DamageDirectMult += 0.05;
                }
            }
        }
	})

    ::mods_hookExactClass("skills/actives/legend_cascade_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += this.m.AdditionalAccuracy;
                _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
                _properties.DamageTotalMult *= 0.5;
                _properties.DamageTooltipMaxMult *= 3.0;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/legend_piercing_shot", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += this.m.Item.getAdditionalAccuracy();
			    _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/legend_shoot_dart", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
			    _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/legend_shoot_precise_stone_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
                _properties.FatigueDealtPerHitMult += 2.0;
			    _properties.HitChance[this.Const.BodyPart.Head] += 100.0;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/legend_shoot_stone_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
			    _properties.FatigueDealtPerHitMult += 1.5;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/quick_shot", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += this.m.Item.getAdditionalAccuracy();
                _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;

                if (_properties.IsSharpshooter)
                {
                    _properties.DamageDirectMult += 0.05;
                }
            }
        }
	})

    ::mods_hookExactClass("skills/actives/shoot_bolt", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill != this)
            {
                return;
            }

            if (_targetEntity == null)
            {
                return;
            }
            _properties.RangedSkill += 15 + this.m.Item.getAdditionalAccuracy();
			_properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;

			if (_properties.IsSharpshooter)
			{
				_properties.DamageDirectMult += 0.05;
			}
        }
	})

    ::mods_hookExactClass("skills/actives/shoot_stake", function(o){
        o.getDescription <- function()
        {
            return "A quick pull of the trigger to loose a heavy bolt. Must be reloaded after each shot to be able to fire again. Knocks targets back. Deals +" + this.Math.floor(100 * (1 + this.m.Item.EL_getCurrentLevel() * this.Const.EL_Weapon.EL_LevelFactor.RegularDamage)) + " damage to vampires";
        }

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill != this)
            {
                return;
            }

            if (_targetEntity == null)
            {
                return;
            }

            _properties.RangedSkill += 10 + this.m.Item.getAdditionalAccuracy();
            _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;

            if (_targetEntity.getType() == this.Const.EntityType.Vampire || _targetEntity.getType() == this.Const.EntityType.LegendVampireLord)
            {
                local damage_bonus = this.Math.floor(100 * (1 + this.m.Item.EL_getCurrentLevel() * this.Const.EL_Weapon.EL_LevelFactor.RegularDamage));
                _properties.DamageRegularMin += damage_bonus;
                _properties.DamageRegularMax += damage_bonus + 5;
            }

            if (_properties.IsSharpshooter)
            {
                _properties.DamageDirectMult += 0.05;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/sling_stone_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
			    _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/throw_axe", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += 20 + this.m.Item.getAdditionalAccuracy();
			    _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
            }
        }
	})

    ::mods_hookExactClass("skills/actives/throw_javelin", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                _properties.RangedSkill += 20 + this.m.Item.getAdditionalAccuracy();
                if (_properties.IsSpecializedInSpearThrust)
                {
                    this.m.AdditionalHitChance += 10;
                }
                _properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
            }
        }
	})
});
