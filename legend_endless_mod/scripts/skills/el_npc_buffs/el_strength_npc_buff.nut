this.el_strength_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.strength";
		this.m.Name = "巨力";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= this.Const.EL_NPC.EL_NPCBuff.Factor.Strength.DamageTotalMult[this.m.EL_RankLevel];
	}

});

