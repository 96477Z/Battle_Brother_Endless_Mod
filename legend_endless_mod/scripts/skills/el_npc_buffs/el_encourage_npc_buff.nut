this.el_encourage_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.encourage";
		this.m.Name = "激励";
		this.m.Description = "";
	}

	function EL_encourageAllies()
	{
        local actor = this.getContainer().getActor();
        local targets = this.Tactical.Entities.getAllInstances();
        local affect_targets = [];
        foreach( tar in targets )
        {
            foreach( t in tar )
            {
                if(t!= null && !t.isDying() && t.isAlive() && t.isAlliedWith(actor)) {
                    affect_targets.push(t);
                }
            }
        }
        for(local i = 0; i < this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.MoraleCheckTimes[this.m.EL_RankLevel]; ++i) {
            for(local i = 0; i < affect_targets.len(); ++i) {
                local difficulty = actor.getBravery() +
                                this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.BaseOffset -
                                this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.RankFactor * (affect_targets[i].EL_getRankLevel() - actor.EL_getRankLevel()) -
                                this.Math.pow(this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.CombatLevelFactor, this.Math.abs(affect_targets[i].EL_getCombatLevel() - actor.EL_getCombatLevel())) * (affect_targets[i].EL_getCombatLevel() - actor.EL_getCombatLevel()) -
                                this.Math.pow(affect_targets[i].getTile().getDistanceTo(actor.getTile()), this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.DistanceFactor);
                affect_targets[i].checkMorale(1, difficulty);
            }
        }
	}

	function onTurnStart()
	{
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.MoraleCheckChance[this.m.EL_RankLevel]) {
            EL_encourageAllies();
        }
    }

	function onUpdate( _properties )
	{
		_properties.Bravery += this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.BraveryOffset[this.m.EL_RankLevel];
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "决心增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.BraveryOffset[this.m.EL_RankLevel] + "点。回合开始时，" + this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.MoraleCheckChance[this.m.EL_RankLevel] + "%的概率激励自身和周围的队友，每次激励进行" + this.Const.EL_NPC.EL_NPCBuff.Factor.Encourage.MoraleCheckTimes[this.m.EL_RankLevel] + "次正面的决心判定，受自身决心影响。";
    }

});

