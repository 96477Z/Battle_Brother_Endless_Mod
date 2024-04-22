this.el_npc_buff <- this.inherit("scripts/skills/skill", {
	m = {
        EL_RankLevel = 0,
    },
	function create()
	{
		this.m.Type = this.Const.SkillType.Racial;
		this.m.Order = this.Const.SkillOrder.VeryLast;
        // this.m.Icon = this.Const.EL_NPC.EL_Champion.Icon[this.m.EL_RankLevel];
        // this.m.IconMini = this.Const.EL_NPC.EL_Champion.IconMini[this.m.EL_RankLevel];
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.EL_IsNPCBuff = true;
	}

    function EL_setRankLevel(_EL_rankLevel) {
		this.m.EL_RankLevel = _EL_rankLevel;
        this.m.Icon = this.Const.EL_NPC.EL_Champion.Icon[this.m.EL_RankLevel];
        this.m.IconMini = this.Const.EL_NPC.EL_Champion.IconMini[this.m.EL_RankLevel];
    }

    function EL_getRankLevel() {
        return this.m.EL_RankLevel;
    }

    function onAfterUpdate( _properties ) {
        this.m.Icon = this.Const.EL_NPC.EL_Champion.Icon[this.m.EL_RankLevel];
        this.m.IconMini = this.Const.EL_NPC.EL_Champion.IconMini[this.m.EL_RankLevel];
    }

	function onSerialize( _out )
	{
        this.skill.onSerialize(_out);
		_out.writeI32(this.m.EL_RankLevel);
	}

	function onDeserialize( _in )
	{
        this.skill.onDeserialize(_in);
		this.m.EL_RankLevel = _in.readI32();
	}

});

