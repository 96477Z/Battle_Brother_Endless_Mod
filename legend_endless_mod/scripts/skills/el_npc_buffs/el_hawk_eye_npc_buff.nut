this.el_hawk_eye_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.hawk_eye";
		this.m.Name = "鹰眼";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
		_properties.VisionMult *= this.Const.EL_NPC.EL_NPCBuff.Factor.HawkEye.VisionMult[this.m.EL_RankLevel];
		_properties.HitChance[this.Const.BodyPart.Head] += this.Const.EL_NPC.EL_NPCBuff.Factor.HawkEye.HeadHitChanceOffset[this.m.EL_RankLevel];
	}

	function onAfterUpdate( _properties )
	{
        local skills = this.getContainer().getActor().getSkills().m.Skills;
		this.getContainer().getActor().getSkills().removeByID("special.night");
		foreach( skill in skills )
		{
			if (skill.m.IsWeaponSkill && skill.isRanged())
			{
				skill.m.MaxRange = this.Math.ceil(skill.m.MaxRange * this.Const.EL_NPC.EL_NPCBuff.Factor.HawkEye.MaxRangeMult[this.m.EL_RankLevel]);
			}
		}
	}
	
    function getDescription() {
		return "攻击距离增加" + (this.Const.EL_NPC.EL_NPCBuff.Factor.HawkEye.MaxRangeMult[this.m.EL_RankLevel] - 1) * 100 + "%（向上取整），视野增加" + (this.Const.EL_NPC.EL_NPCBuff.Factor.HawkEye.VisionMult[this.m.EL_RankLevel] - 1) * 100 + "%，爆头率额外增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.HawkEye.HeadHitChanceOffset[this.m.EL_RankLevel] + "%。不再受到夜间视野的影响。";
    }

});

