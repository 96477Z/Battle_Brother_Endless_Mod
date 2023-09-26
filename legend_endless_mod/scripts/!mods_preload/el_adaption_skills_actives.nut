local gt = getroottable();

::mods_registerMod("el_adaption_skills_actives", 1, "el_adaption_skills_actives");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/actives/legend_spawn_skill", function(o){

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

            local entity = this.Const.World.Common.EL_addEntityByScript(this.getScript(), _targetTile, this.m.IsControlledByPlayer ? this.Const.Faction.Player : this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel(), true);

            entity.setItem(spawnItem);
            entity.setName(spawnItem.getName());
            entity.riseFromGround();
            entity.getFlags().add("IsSummoned", true);
            entity.getFlags().add("Summoner", _user);
            entity.setActionPoints(this.Math.round(this.m.APStartMult * entity.getActionPoints()));
            spawnItem.setEntity(entity);
            this.m.Items.push(spawnItem);
            this.spawnIcon("status_effect_01", _user.getTile());
            _user.setHitpoints(this.Math.max(_user.getHitpoints() - this.m.HPCost, 1));
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_bear", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_bear_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
            entity.setName(this.m.EntityName);
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/legend_unleash_hound", function(o){

        o.onUse = function( _user, _targetTile )
        {
            _user.getSkills().add(this.new("scripts/skills/effects/legend_summoned_hound_effect"));
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Script, _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
            entity.setName(this.m.EntityName);

            if (this.getContainer().hasSkill("background.houndmaster"))
            {
                entity.setMoraleState(this.Const.MoraleState.Confident);
            }

            this.addAnimalSkills(entity);
            return true;
        }

	});

	::mods_hookExactClass("skills/actives/throw_golem_skill", function(o){

        o.onSpawn = function( _data )
        {
            local freeTiles = [];
            local lucky = this.Math.rand(1, 100) <= 20;
            local actor = this.getContainer().getActor();
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

                        if (nextTile.Level > _data.TargetTile.Level + 1)
                        {
                        }
                        else if (nextTile.IsEmpty)
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

            if (freeTiles.len() != 0)
            {
                local rock = this.Const.World.Common.EL_addEntity(this.Const.World.Spawn.Troops.SandGolem, freeTiles[0].Tile, _data.User.getFaction(), actor.EL_getRankLevel(), actor.EL_getLevel());

                if (_data.User.getWorldTroop() != null && ("Party" in _data.User.getWorldTroop()) && _data.User.getWorldTroop().Party != null)
                {
                    local e = this.Const.World.Common.addTroop(_data.User.getWorldTroop().Party.get(), {
                        Type = this.Const.World.Spawn.Troops.SandGolem
                    }, false);
                    rock.setWorldTroop(e);
                }

                rock.getSprite("body").Color = _data.User.getSprite("body").Color;
                rock.getSprite("body").Saturation = _data.User.getSprite("body").Saturation;
                freeTiles = [];

                for( local i = 0; i < 6; i = ++i )
                {
                    if (!_data.User.getTile().hasNextTile(i))
                    {
                    }
                    else
                    {
                        local nextTile = _data.User.getTile().getNextTile(i);

                        if (nextTile.Level > _data.User.getTile().Level + 1)
                        {
                        }
                        else if (nextTile.IsEmpty)
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

                if (freeTiles.len() != 0)
                {
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
                }

                local n = 0;

                if (_data.User.getSize() == 2)
                {
                    n = 1;
                }

                n = --n;

                while (n >= 0 && freeTiles.len() >= 1)
                {
                    local tile = freeTiles[0].Tile;
                    freeTiles.remove(0);
                    local rock = this.Const.World.Common.EL_addEntity(this.Const.World.Spawn.Troops.SandGolemMEDIUM, freeTiles[0].Tile, _data.User.getFaction(), actor.EL_getRankLevel(), actor.EL_getLevel());

                    if (_data.User.getWorldTroop() != null && ("Party" in _data.User.getWorldTroop()) && _data.User.getWorldTroop().Party != null)
                    {
                        local e = this.Const.World.Common.addTroop(_data.User.getWorldTroop().Party.get(), {
                            Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM
                        }, false);
                        rock.setWorldTroop(e);
                    }

                    rock.getSprite("body").Color = _data.User.getSprite("body").Color;
                    rock.getSprite("body").Saturation = _data.User.getSprite("body").Saturation;

                    if (tile.IsVisibleForPlayer)
                    {
                        for( local i = 0; i < this.Const.Tactical.SandGolemParticles.len(); i = ++i )
                        {
                            this.Tactical.spawnParticleEffect(false, this.Const.Tactical.SandGolemParticles[i].Brushes, tile, this.Const.Tactical.SandGolemParticles[i].Delay, this.Const.Tactical.SandGolemParticles[i].Quantity, this.Const.Tactical.SandGolemParticles[i].LifeTimeQuantity, this.Const.Tactical.SandGolemParticles[i].SpawnRate, this.Const.Tactical.SandGolemParticles[i].Stages);
                        }
                    }
                }

                if (_data.User.getSize() == 2)
                {
                    n = 2;
                }
                else
                {
                    n = 1;
                }

                n = --n;

                while (n >= 0 && freeTiles.len() >= 1)
                {
                    local tile = freeTiles[0].Tile;
                    freeTiles.remove(0);
                    local rock = this.Const.World.Common.EL_addEntity(this.Const.World.Spawn.Troops.SandGolem, tile, _data.User.getFaction(), actor.EL_getRankLevel(), actor.EL_getLevel());

                    if (_data.User.getWorldTroop() != null && ("Party" in _data.User.getWorldTroop()) && _data.User.getWorldTroop().Party != null)
                    {
                        local e = this.Const.World.Common.addTroop(_data.User.getWorldTroop().Party.get(), {
                            Type = this.Const.World.Spawn.Troops.SandGolem
                        }, false);
                        rock.setWorldTroop(e);
                    }

                    rock.getSprite("body").Color = _data.User.getSprite("body").Color;
                    rock.getSprite("body").Saturation = _data.User.getSprite("body").Saturation;

                    if (tile.IsVisibleForPlayer)
                    {
                        for( local i = 0; i < this.Const.Tactical.SandGolemParticles.len(); i = ++i )
                        {
                            this.Tactical.spawnParticleEffect(false, this.Const.Tactical.SandGolemParticles[i].Brushes, tile, this.Const.Tactical.SandGolemParticles[i].Delay, this.Const.Tactical.SandGolemParticles[i].Quantity, this.Const.Tactical.SandGolemParticles[i].LifeTimeQuantity, this.Const.Tactical.SandGolemParticles[i].SpawnRate, this.Const.Tactical.SandGolemParticles[i].Stages);
                        }
                    }
                }
            }
        }

	});

	::mods_hookExactClass("skills/actives/unleash_wardog", function(o){

        o.onUse = function( _user, _targetTile )
        {
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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
            local entity = this.Const.World.Common.EL_addEntityByScript(this.m.Item.getScript(), _targetTile, this.Const.Faction.PlayerAnimals, 0, _user.EL_getLevel());
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







});