this.el_multiple_attacks_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {
        EL_IsExtraAttack = false
    },
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.multiple_attacks";
		this.m.Name = "多重攻击";
		this.m.Description = "";
	}

	function EL_attackAllEnemies(_skill, _targetEntity)
	{
        local actor = this.getContainer().getActor();
        if(actor == null || actor.isDying() || !actor.isAlive()) {
            return;
        }
        if(_skill.isActive() && _skill.isAttack() && !_skill.isRanged() && !this.m.EL_IsExtraAttack) {

            //this.logInfo("multiple attack");

            local targets = this.Tactical.Entities.getAllInstances();
            this.m.EL_IsExtraAttack = true;
            local affect_targets = [];
            foreach( tar in targets )
            {
                foreach( t in tar )
                {
                    if(!t.isAlliedWith(actor) && _skill.isInRange(t.getTile()) && t != _targetEntity) {
                        affect_targets.push(t);
                    }
                }
            }
            for(local i = 0; i < affect_targets.len(); ++i) {
                if (actor.getFatigue() + _skill.getFatigueCost() < actor.getFatigueMax())
                {
                    if(affect_targets[i] != null && !affect_targets[i].isDying() && affect_targets[i].isAlive()) {
                        if (actor != null && !actor.isDying() && actor.isAlive()) {
                            _skill.useForFree(affect_targets[i].getTile());
                            actor.setFatigue(actor.getFatigue() + _skill.getFatigueCost());
                        }
                        else {
                            break;
                        }
                    }

                }
            }
            this.m.EL_IsExtraAttack = false;

        }

	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        local actor = this.getContainer().getActor();
        if(!_targetEntity.isAlliedWith(actor)) {
            this.EL_attackAllEnemies(_skill, _targetEntity);
        }
	}

	function onTargetMissed( _skill, _targetEntity )
	{
        local actor = this.getContainer().getActor();
        if(!_targetEntity.isAlliedWith(actor)) {
            this.EL_attackAllEnemies(_skill, _targetEntity);
        }
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
        if(this.m.EL_IsExtraAttack) {
            _properties.DamageTotalMult *= this.Const.EL_NPC.EL_NPCBuff.Factor.MultipleAttacks.DamageTotalMult[this.m.EL_RankLevel];
        }
	}
	
    function EL_updateDescription() {
		this.m.Description = "攻击时会同时攻击范围内的所有敌方单位，对其他目标造成" + this.Const.EL_NPC.EL_NPCBuff.Factor.MultipleAttacks.DamageTotalMult[this.m.EL_RankLevel] * 100 + "%的伤害。仅近战单位生效。";
    }

});

