this.el_stunning_strike_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.stunning_strike";
		this.m.Name = "重击";
		this.m.Description = "";
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        local user = this.getContainer().getActor();
		if (_targetEntity == null || _targetEntity.isAlliedWith(user) || _targetEntity.isDying() || !_targetEntity.isAlive() || _damageInflictedHitpoints + _damageInflictedArmor == 0) {
			return;
		}
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Factor.StunningStrike.Chance[this.m.EL_RankLevel]) {
			local stunned_effect = this.new("scripts/skills/effects/stunned_effect");
			_targetEntity.getSkills().add(stunned_effect);
			stunned_effect.setTurns(this.Const.EL_NPC.EL_NPCBuff.Factor.StunningStrike.StunTurns[this.m.EL_RankLevel]);

			if (!user.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " 击晕了 " + this.Const.UI.getColorizedEntityName(_targetEntity) + " " +  this.Const.EL_NPC.EL_NPCBuff.Factor.StunningStrike.StunTurns[this.m.EL_RankLevel] + " 回合");
			}
        }
	}
	
    function getDescription() {
		return "攻击命中时" + this.Const.EL_NPC.EL_NPCBuff.Factor.StunningStrike.Chance[this.m.EL_RankLevel] + "%概率造成" + this.Const.EL_NPC.EL_NPCBuff.Factor.StunningStrike.StunTurns[this.m.EL_RankLevel] + "回合眩晕。";
    }

});



