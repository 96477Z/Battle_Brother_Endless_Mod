this.el_veteran_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.veteran";
		this.m.Name = "Veteran";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
		_properties.EL_CombatLevel += this.Const.EL_NPC.EL_NPCBuff.Factor.Veteran.CombatLevelOffset[this.m.EL_RankLevel];
	}

});
