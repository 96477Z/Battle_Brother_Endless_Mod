this.el_poisoned_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.poisoned";
		this.m.Name = "淬毒";
		this.m.Description = "";
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        local user = this.getContainer().getActor();
		if (_targetEntity == null || _targetEntity.isAlliedWith(user) || _targetEntity.isDying() || !_targetEntity.isAlive() || _damageInflictedHitpoints + _damageInflictedArmor == 0) {
			return;
		}
		if (_targetEntity.getCurrentProperties().IsImmuneToPoison)
		{
			return;
		}
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Factor.Poisoned.Chance[this.m.EL_RankLevel]) {

            local poison_num_left = this.Const.EL_Config.EL_addPoisonsToActor(_targetEntity, this.Const.EL_NPC.EL_NPCBuff.Factor.Poisoned.PoisonNum[this.m.EL_RankLevel]);
            this.Const.EL_Config.EL_addPoisonsToActorNoRepeatCheck(_targetEntity, poison_num_left);
        }
	}
	
    function getDescription() {
		return "攻击命中时" + this.Const.EL_NPC.EL_NPCBuff.Factor.Poisoned.Chance[this.m.EL_RankLevel] + "%使目标获得" + this.Const.EL_NPC.EL_NPCBuff.Factor.Poisoned.PoisonNum[this.m.EL_RankLevel] + "种中毒状态。";
    }

});

