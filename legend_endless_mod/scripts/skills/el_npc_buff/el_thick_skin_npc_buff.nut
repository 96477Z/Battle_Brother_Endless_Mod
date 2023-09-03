this.el_thick_skin_npc_buff <- this.inherit("scripts/skills/el_npc_buff/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buff.thick_skin";
		this.m.Name = "Thick Skin";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
        _properties.DamageReceivedDirectMult *= 1 / (1 + this.Const.EL_NPC.EL_NPCBuff.ThickSkin.DamageReceivedMult[this.m.EL_RankLevel]);
	}

});

