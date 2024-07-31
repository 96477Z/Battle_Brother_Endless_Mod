this.el_evasion_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {
        EL_DefenseState = this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.RangeState
    },
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.evasion";
		this.m.Name = "闪避";
		this.m.Description = "";
        this.m.EL_DefenseState = this.Math.rand(1, 2) == 1 ? this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.RangeState : this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.MeleeState;
	}

	function onTurnStart()
	{
        if(this.m.EL_DefenseState == this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.MeleeState) {
            this.m.EL_DefenseState = this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.RangeState;
        }
        else {
            this.m.EL_DefenseState = this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.MeleeState;
        }
        this.getContainer().getActor().getSkills().update();
	}


	function onUpdate( _properties )
	{
        if(this.m.EL_DefenseState == this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.MeleeState) {
            _properties.MeleeDefense += this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffset[this.m.EL_RankLevel] * this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffsetSelectedMult;
            _properties.RangedDefense += this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffset[this.m.EL_RankLevel];
            this.m.Name = "闪避(近战)";
        }
        else {
            _properties.MeleeDefense += this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffset[this.m.EL_RankLevel];
            _properties.RangedDefense += this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffset[this.m.EL_RankLevel] * this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffsetSelectedMult;
            this.m.Name = "闪避(远程)";
        }
    }
	
    function getDescription() {
		return "增加近战和远程防御" + this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffset[this.m.EL_RankLevel] + "，每回合切换远程和近战偏向，对应的偏向防御增幅" + this.Const.EL_NPC.EL_NPCBuff.Factor.Evasion.DefenseOffsetSelectedMult + "倍。";
    }

});

