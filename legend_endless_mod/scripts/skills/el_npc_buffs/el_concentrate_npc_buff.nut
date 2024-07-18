this.el_concentrate_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {
		EL_Stack = 0,
		EL_LastAttackTarget = null
	},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.concentrate";
		this.m.Name = "专注";
		this.m.Description = "";
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if(this.m.EL_LastAttackTarget != _targetEntity) {
			this.m.EL_LastAttackTarget = _targetEntity;
			this.m.EL_Stack = 0;
		}
		++this.m.EL_Stack;
	}

	function onCombatStarted()
	{
		this.m.EL_Stack = 0;
	}

	function onCombatFinished()
	{
		this.m.EL_Stack = 0;
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if(this.m.EL_LastAttackTarget != _targetEntity) {
			this.m.EL_LastAttackTarget = _targetEntity;
			this.m.EL_Stack = 0;
		}
		++this.m.EL_Stack;
	}

	function EL_reset() {
		this.m.EL_Stack = 0;
		this.m.EL_LastAttackTarget = null;
	}

	function onUpdate( _properties )
	{
		if(this.m.EL_Stack != 0) {
			this.m.Name = "专注(x" + this.m.EL_Stack + ")";
		}
		else {
			this.m.Name = "专注";
		}
		_properties.DamageTotalMult *= 1 + this.Const.EL_NPC.EL_NPCBuff.Factor.Concentrate.DamageMultPurStack[this.m.EL_RankLevel] * this.m.EL_Stack;
        _properties.MeleeSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.Concentrate.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] * this.m.EL_Stack;
        _properties.RangedSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.Concentrate.RangedSkillOffsetPurStack[this.m.EL_RankLevel] * this.m.EL_Stack;
	}
	
    function EL_updateDescription() {
		this.m.Description = "攻击同一个目标时，增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Concentrate.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] + "点双攻，增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Concentrate.DamageMultPurStack[this.m.EL_RankLevel] * 100 + "%伤害，切换目标时清除。";
    }

});

