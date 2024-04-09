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
		_properties.DamageTotalMult *= 1 + this.Const.EL_NPC.EL_NPCBuff.Factor.Strength.DamageTotalMult[this.m.EL_RankLevel];
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "伤害增加" + (this.Const.EL_NPC.EL_NPCBuff.Factor.Strength.DamageTotalMult[this.m.EL_RankLevel] - 1) * 100 + "%";
    }

});

