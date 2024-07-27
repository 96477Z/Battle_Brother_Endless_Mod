this.el_charge_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.charge";
		this.m.Name = "冲撞";
		this.m.Description = "";
        this.m.SoundOnHit = [
			"sounds/combat/knockback_hit_01.wav",
			"sounds/combat/knockback_hit_02.wav",
			"sounds/combat/knockback_hit_03.wav"
		];
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _userTile.getDirectionTo(_targetTile);

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

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        local user = this.getContainer().getActor();
		if (_targetEntity == null || _targetEntity.isAlliedWith(user) || _targetEntity.isDying() || !_targetEntity.isAlive() || _skill.isRanged()) {
			return;
		}
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Factor.Charge.Chance[this.m.EL_RankLevel]) {
            _targetEntity.getSkills().add(this.new(this.Const.EL_NPC.EL_NPCBuff.Factor.Charge.DazeEffect[this.m.EL_RankLevel]));
            
			if(!_targetEntity.getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") || !_targetEntity.getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
			{
                if(_damageInflictedHitpoints > 0) {
                    if(_skill.isRanged()) {
                        local injury_num_left = this.Const.EL_Config.EL_addSlightInjurysToActor(_targetEntity, this.Const.EL_NPC.EL_NPCBuff.Factor.Charge.InjuryNum[this.m.EL_RankLevel], [
                            this.Const.Injury.PiercingBody,
                            this.Const.Injury.PiercingHead
                        ]);
                        this.Const.EL_Config.EL_addSeriousInjurysToActor(_targetEntity, injury_num_left, [
                            this.Const.Injury.PiercingBody,
                            this.Const.Injury.PiercingHead
                        ]);
                    }
                    else {
                        local injury_num_left = this.Const.EL_Config.EL_addSlightInjurysToActor(_targetEntity, this.Const.EL_NPC.EL_NPCBuff.Factor.Charge.InjuryNum[this.m.EL_RankLevel], [
                            this.Const.Injury.BluntBody,
                            this.Const.Injury.BluntHead
                        ]);
                        this.Const.EL_Config.EL_addSeriousInjurysToActor(_targetEntity, injury_num_left, [
                            this.Const.Injury.BluntBody,
                            this.Const.Injury.BluntHead
                        ]);
                    }
                }
            }

            local target_tile = _targetEntity.getTile();

            local knock_to_tile = this.findTileToKnockBackTo(user.getTile(), target_tile);

            if (knock_to_tile == null)
            {
                return;
            }
            if (_targetEntity.getCurrentProperties().IsImmuneToKnockBackAndGrab || _targetEntity.getCurrentProperties().IsRooted)
            {
                return;
            }

            if (!user.isHiddenToPlayer() && (target_tile.IsVisibleForPlayer || knock_to_tile.IsVisibleForPlayer))
            {
                this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " 击退了 " + this.Const.UI.getColorizedEntityName(_targetEntity));
            }

            local skills = _targetEntity.getSkills();
            skills.removeByID("effects.shieldwall");
            skills.removeByID("effects.spearwall");
            skills.removeByID("effects.riposte");

            if (this.m.SoundOnHit.len() != 0)
            {
                this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, user.getPos());
            }

            _targetEntity.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
            local damage = this.Math.max(0, this.Math.abs(knock_to_tile.Level - target_tile.Level) - 1) * this.Const.Combat.FallingDamage;

            if (damage == 0)
            {
                this.Tactical.getNavigator().teleport(_targetEntity, knock_to_tile, null, null, true);
            }
            else
            {
                local p = this.getContainer().getActor().getCurrentProperties();
                local tag = {
                    Attacker = user,
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

                this.Tactical.getNavigator().teleport(_targetEntity, knock_to_tile, this.onKnockedDown, tag, true);
            }
            return;
        }
	}

	function onKnockedDown( _entity, _tag )
	{
		if (_tag.HitInfo.DamageRegular != 0)
		{
			_entity.onDamageReceived(_tag.Attacker, _tag.Skill, _tag.HitInfo);
		}
	}

});

