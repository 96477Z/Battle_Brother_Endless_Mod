this.el_cripple_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.cripple";
		this.m.Name = "致残";
		this.m.Description = "";
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        local user = this.getContainer().getActor();
		if (_targetEntity == null || _targetEntity.isAlliedWith(user) || _targetEntity.isDying() || !_targetEntity.isAlive() || _skill.isRanged()) {
			return;
		}
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Factor.Cripple.Chance[this.m.EL_RankLevel]) {
            if(_damageInflictedHitpoints > 0) {
                local injury_num_left = this.Const.EL_Config.EL_addSlightInjurysToActor(_targetEntity, this.Const.EL_NPC.EL_NPCBuff.Factor.Cripple.InjuryNum[this.m.EL_RankLevel], [
                    this.Const.Injury.BluntBody,
                    this.Const.Injury.BluntHead,
                    this.Const.Injury.PiercingBody,
                    this.Const.Injury.PiercingHead,
                    this.Const.Injury.CuttingBody,
                    this.Const.Injury.CuttingHead,
                    this.Const.Injury.BurningBody,
                    this.Const.Injury.BurningHead
                ]);
                this.Const.EL_Config.EL_addSeriousInjurysToActor(_targetEntity, injury_num_left, [
                    this.Const.Injury.BluntBody,
                    this.Const.Injury.BluntHead,
                    this.Const.Injury.PiercingBody,
                    this.Const.Injury.PiercingHead,
                    this.Const.Injury.CuttingBody,
                    this.Const.Injury.CuttingHead,
                    this.Const.Injury.BurningBody,
                    this.Const.Injury.BurningHead
                ]);
            }
        }
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "攻击命中时" + this.Const.EL_NPC.EL_NPCBuff.Factor.Cripple.Chance[this.m.EL_RankLevel] + "%概率造成" + this.Const.EL_NPC.EL_NPCBuff.Factor.Cripple.InjuryNum[this.m.EL_RankLevel] + "个损伤（优先轻伤）。";
    }
});

