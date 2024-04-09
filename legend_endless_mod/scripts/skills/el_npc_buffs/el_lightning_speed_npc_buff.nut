this.el_lightning_speed_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.lightning_speed";
		this.m.Name = "迅捷";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
		_properties.Initiative += this.Const.EL_NPC.EL_NPCBuff.Factor.LightningSpeed.InitiativeOffset[this.m.EL_RankLevel];
		_properties.ActionPointsMult *= this.Const.EL_NPC.EL_NPCBuff.Factor.LightningSpeed.ActionPointsMult[this.m.EL_RankLevel];
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.LightningSpeed.InitiativeOffset[this.m.EL_RankLevel] + "点主动值，行动点增加" + (this.Const.EL_NPC.EL_NPCBuff.Factor.LightningSpeed.ActionPointsMult[this.m.EL_RankLevel] - 1) * 100 + "%。";
    }

});

