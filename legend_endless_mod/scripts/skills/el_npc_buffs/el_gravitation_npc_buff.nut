this.el_gravitation_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.gravitation";
		this.m.Name = "引力";
		this.m.Description = "";
        this.m.SoundOnHit = [
			"sounds/combat/knockback_hit_01.wav",
			"sounds/combat/knockback_hit_02.wav",
			"sounds/combat/knockback_hit_03.wav"
		];
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _targetTile.getDirectionTo(_userTile);

		if (_targetTile.hasNextTile(dir))
		{
			local knock_to_tile = _targetTile.getNextTile(dir);

			if (knock_to_tile.IsEmpty && knock_to_tile.Level - _targetTile.Level <= 1)
			{
				return knock_to_tile;
			}
		}

		local alt_dir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_targetTile.hasNextTile(alt_dir))
		{
			local knock_to_tile = _targetTile.getNextTile(alt_dir);

			if (knock_to_tile.IsEmpty && knock_to_tile.Level - _targetTile.Level <= 1)
			{
				return knock_to_tile;
			}
		}

		alt_dir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_targetTile.hasNextTile(alt_dir))
		{
			local knock_to_tile = _targetTile.getNextTile(alt_dir);

			if (knock_to_tile.IsEmpty && knock_to_tile.Level - _targetTile.Level <= 1)
			{
				return knock_to_tile;
			}
		}

		return null;
	}

	function onTurnEnd()
	{
        local actor = this.getContainer().getActor();
        if(actor == null || actor.isDying() || !actor.isAlive()) {
            return;
        }
        local main_hand = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
        if(main_hand != null && main_hand.m.RangeMax != 1) {
            return;
        }
        local targets = this.Tactical.Entities.getAllInstances();
        local affect_targets = [];
        local used_tile = [];
        foreach( tar in targets )
        {
            foreach( t in tar )
            {
                if(t != null && !t.isDying() && t.isAlive() && !t.isAlliedWith(actor)) {
                    if (t.getCurrentProperties().IsImmuneToKnockBackAndGrab || t.getCurrentProperties().IsRooted)
                    {
                        return;
                    }
                    local temp_distance = actor.getTile().getDistanceTo(t.getTile());
                    if(temp_distance <= this.Const.EL_NPC.EL_NPCBuff.Factor.Gravitation.MaxDistance[this.m.EL_RankLevel]) {
                        local i = 0;
                        for(; i < affect_targets.len(); ++i) {
                            if(temp_distance < affect_targets[i].distance) {
                                affect_targets.insert(i, {
                                    target = t,
                                    distance = temp_distance
                                });
                                break;
                            }
                        }
                        if(i == affect_targets.len()) {
                            affect_targets.push({
                                target = t,
                                distance = temp_distance
                            });
                        }

                    }
                }
            }
        }
        for(local i = 0; i < affect_targets.len(); ++i) {
            local target_tile = affect_targets[i].target.getTile();
            local j = 0;
            local knock_to_tile = target_tile;
            for(; j < this.Const.EL_NPC.EL_NPCBuff.Factor.Gravitation.MaxMoveTime[this.m.EL_RankLevel] && actor.getTile().getDistanceTo(knock_to_tile) > 1; ++j) {
                local temp_knock_to_tile = this.findTileToKnockBackTo(actor.getTile(), knock_to_tile);
                if(temp_knock_to_tile != null) {
                    knock_to_tile = temp_knock_to_tile;
                }
                else {
                    break;
                }
            }
            if(knock_to_tile == target_tile) {
                continue;
            }
            if(actor.getTile().getDistanceTo(knock_to_tile) >= actor.getTile().getDistanceTo(target_tile)) {
                continue;
            }
            for(j = 0; j < used_tile.len(); ++j) {
                if(used_tile[j] == knock_to_tile) {
                    break;
                }
            }
            if(j != used_tile.len()) {
                continue;
            }

            used_tile.push(knock_to_tile);
            if (!actor.isHiddenToPlayer() && (target_tile.IsVisibleForPlayer || knock_to_tile.IsVisibleForPlayer))
            {
                this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " 吸引了 " + this.Const.UI.getColorizedEntityName(affect_targets[i].target));
            }

            local skills = affect_targets[i].target.getSkills();
            skills.removeByID("effects.shieldwall");
            skills.removeByID("effects.spearwall");
            skills.removeByID("effects.riposte");

            if (this.m.SoundOnHit.len() != 0)
            {
                this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, actor.getPos());
            }

            affect_targets[i].target.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
            local damage = this.Math.max(0, this.Math.abs(knock_to_tile.Level - target_tile.Level) - 1) * this.Const.Combat.FallingDamage;
            if (damage == 0)
            {
                this.Tactical.getNavigator().teleport(affect_targets[i].target, knock_to_tile, null, null, true);
            }
            else
            {
                local p = this.getContainer().getActor().getCurrentProperties();
                local tag = {
                    Attacker = actor,
                    Skill = this,
                    HitInfo = clone this.Const.Tactical.HitInfo,
                    HitInfoBash = null
                };
                tag.HitInfo.DamageRegular = damage;
                tag.HitInfo.DamageFatigue = this.Const.Combat.FatigueReceivedPerHit;
                tag.HitInfo.DamageDirect = 1.0;
                tag.HitInfo.BodyPart = this.Const.BodyPart.Body;
                tag.HitInfo.BodyDamageMult = 1.0;
                tag.HitInfo.FatalityChanceMult = 1.0;

                this.Tactical.getNavigator().teleport(affect_targets[i].target, knock_to_tile, this.onKnockedDown, tag, true);
            }
        }

	}

	function onKnockedDown( _entity, _tag )
	{
		if (_tag.HitInfo.DamageRegular != 0)
		{
			_entity.onDamageReceived(_tag.Attacker, _tag.Skill, _tag.HitInfo);
		}
	}
	
    function getDescription() {
		return "回合结束时吸引周围" + this.Const.EL_NPC.EL_NPCBuff.Factor.Gravitation.MaxDistance[this.m.EL_RankLevel] + "格范围内的敌方单位" + this.Const.EL_NPC.EL_NPCBuff.Factor.Gravitation.MaxMoveTime[this.m.EL_RankLevel] + "次,仅1射程的近战单位有效";
    }

});

