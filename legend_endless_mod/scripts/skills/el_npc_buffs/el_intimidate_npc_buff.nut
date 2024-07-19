this.el_intimidate_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.intimidate";
		this.m.Name = "威慑";
		this.m.Description = "";
	}

	function EL_intimidateEnemies()
	{
        local actor = this.getContainer().getActor();
        if(actor == null || actor.isDying() || !actor.isAlive()) {
            return;
        }
        local targets = this.Tactical.Entities.getAllInstances();
        local affect_targets = [];
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.MoraleCheckChance[this.m.EL_RankLevel]) {
            foreach( tar in targets )
            {
                foreach( t in tar )
                {
                    if(t!= null && !t.isDying() && t.isAlive() && !t.isAlliedWith(actor)) {
                        affect_targets.push(t);
                    }
                }
            }
        }
        for(local i = 0; i < affect_targets.len(); ++i) {
            local difficulty = -actor.getBravery() +
                               this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.BaseOffset +
                               this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.RankFactor * (affect_targets[i].EL_getRankLevel() - actor.EL_getRankLevel()) +
                               this.Math.pow(this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.CombatLevelFactor, this.Math.abs(affect_targets[i].EL_getCombatLevel() - actor.EL_getCombatLevel())) * (affect_targets[i].EL_getCombatLevel() - actor.EL_getCombatLevel()) +
                               this.Math.pow(affect_targets[i].getTile().getDistanceTo(actor.getTile()), this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.DistanceFactor);
            affect_targets[i].checkMorale(-1, difficulty);
        }

	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        local actor = this.getContainer().getActor();
        if(!_targetEntity.isAlliedWith(actor)) {
            this.EL_intimidateEnemies();
        }
	}

	function onTargetMissed( _skill, _targetEntity )
	{
        local actor = this.getContainer().getActor();
        if(!_targetEntity.isAlliedWith(actor)) {
            this.EL_intimidateEnemies();
        }
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.BraveryOffset[this.m.EL_RankLevel];
	}
	
    function EL_updateDescription() {
		this.m.Description = "决心增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.BraveryOffset[this.m.EL_RankLevel] + "点。每次攻击有" + this.Const.EL_NPC.EL_NPCBuff.Factor.Intimidate.MoraleCheckChance[this.m.EL_RankLevel] + "%的概率对周围敌人进行1次负面的决心判定，受自身决心影响。";
    }

});

