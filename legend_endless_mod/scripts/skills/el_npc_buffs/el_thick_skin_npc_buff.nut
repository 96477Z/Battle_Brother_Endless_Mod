this.el_thick_skin_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.thick_skin";
		this.m.Name = "硬化皮肤";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
        _properties.DamageReceivedTotalMult *= 1.0 / (1.0 + this.Const.EL_NPC.EL_NPCBuff.Factor.ThickSkin.DamageReceivedMult[this.m.EL_RankLevel]);
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "减伤" + (1 - 1.0 / (1.0 + this.Const.EL_NPC.EL_NPCBuff.Factor.ThickSkin.DamageReceivedMult[this.m.EL_RankLevel])) * 100 + "%。";
    }

});

