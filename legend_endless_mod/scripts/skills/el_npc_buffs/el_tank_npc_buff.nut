this.el_tank_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.tank";
		this.m.Name = "重装";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
		_properties.HitpointsMult *= this.Const.EL_NPC.EL_NPCBuff.Factor.Tank.HitpointsMult[this.m.EL_RankLevel];
		_properties.Stamina += this.Const.EL_NPC.EL_NPCBuff.Factor.Tank.Stamina[this.m.EL_RankLevel];
		_properties.ArmorMult[this.Const.BodyPart.Body] *= this.Const.EL_NPC.EL_NPCBuff.Factor.Tank.ArmorMult[this.m.EL_RankLevel];
		_properties.ArmorMult[this.Const.BodyPart.Head] *= this.Const.EL_NPC.EL_NPCBuff.Factor.Tank.ArmorMult[this.m.EL_RankLevel];
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "生命和护甲增加" + (this.Const.EL_NPC.EL_NPCBuff.Factor.Tank.HitpointsMult[this.m.EL_RankLevel] - 1) * 100 + "，疲劳增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Tank.Stamina[this.m.EL_RankLevel] + "。";
    }

});

