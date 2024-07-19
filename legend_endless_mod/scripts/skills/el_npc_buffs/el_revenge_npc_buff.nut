this.el_revenge_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {
        EL_Stack = 0
    },
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.revenge";
		this.m.Name = "复仇";
		this.m.Description = "";
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if(_damageHitpoints + _damageArmor == 0) {
			return;
		}
        ++this.m.EL_Stack;
        this.getContainer().getActor().getSkills().update();
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if(_damageInflictedHitpoints + _damageInflictedArmor == 0) {
			return;
		}
        this.m.EL_Stack = 0;
        this.getContainer().getActor().getSkills().update();
	}

	function onCombatStarted()
	{
		this.m.EL_Stack = 0;
	}

	function onCombatFinished()
	{
		this.m.EL_Stack = 0;
	}


	function onUpdate( _properties )
	{
		if(this.m.EL_Stack != 0) {
			this.m.Name = "复仇(x" + this.m.EL_Stack + ")";
		}
		else {
			this.m.Name = "复仇";
		}
        _properties.DamageTotalMult *= 1 + this.Const.EL_NPC.EL_NPCBuff.Factor.Revenge.DamageMultPurStack[this.m.EL_RankLevel] * this.m.EL_Stack;
        _properties.MeleeSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.Revenge.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] * this.m.EL_Stack;
        _properties.RangedSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.Revenge.RangedSkillOffsetPurStack[this.m.EL_RankLevel] * this.m.EL_Stack;

    }

	function EL_reset() {
		this.m.EL_Stack = 0;
	}

    function EL_updateDescription() {
		this.m.Description = "每次受到伤害增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Revenge.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] + "点双攻和" + this.Const.EL_NPC.EL_NPCBuff.Factor.Revenge.DamageMultPurStack[this.m.EL_RankLevel] * 100 + "%伤害，可叠加，命中后重置。";
    }

});

