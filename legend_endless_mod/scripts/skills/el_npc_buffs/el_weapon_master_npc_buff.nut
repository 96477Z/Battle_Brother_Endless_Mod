this.el_weapon_master_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.weapon_master";
		this.m.Name = "武器大师";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
        _properties.MeleeSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.WeaponMaster.MeleeSkillOffset[this.m.EL_RankLevel];
        _properties.RangedSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.WeaponMaster.RangedSkillOffset[this.m.EL_RankLevel];
	}
	
    function getDescription() {
		return "双攻增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.WeaponMaster.MeleeSkillOffset[this.m.EL_RankLevel] + "。";
    }

});

