this.el_stamp_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {
    },
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.stamp";
		this.m.Name = "印记";
		this.m.Description = "";
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if(_targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || _damageInflictedHitpoints + _damageInflictedArmor == 0) {
            return;
        }
        local skills = _targetEntity.getSkills();
        local skill = skills.getSkillByID("el_effects.stamp");
        if(skill == null) {
            skill = this.new("scripts/skills/el_effects/el_stamp_effect");
            skills.add(skill);
        }
		local user = this.getContainer().getActor();
		if(user == null || user.isDying() || !user.isAlive()) {
			user = null;
		}
        skill.EL_addStack(this.Const.EL_NPC.EL_NPCBuff.Factor.Stamp.StackPurHit[this.m.EL_RankLevel], user);
	}

});

