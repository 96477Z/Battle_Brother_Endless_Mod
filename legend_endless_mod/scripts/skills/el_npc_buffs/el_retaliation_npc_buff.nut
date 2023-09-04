this.el_retaliation_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.retaliation";
		this.m.Name = "Retaliation";
		this.m.Description = "";
	}

	function EL_getAttackSkill(_EL_distance)
	{
		local ret;
		local ap = 999;
        local skills = this.getContainer().getActor().getSkills().m.Skills;
		foreach( skill in skills )
		{
			if (!skill.isActive() || !skill.isAttack() || !skill.isTargeted() || skill.isIgnoredAsAOO() || skill.isDisabled() || !skill.isUsable())
			{
				continue;
			}

			if (_EL_distance < skill.getMinRange() || _EL_distance > skill.getMaxRange())
			{
				continue;
			}

			if (skill.getActionPointCost() < ap)
			{
				ret = skill;
				ap = skill.getActionPointCost();
			}
		}

		return ret;
	}

	function EL_attackBack(_EL_attacker) {
		if(_EL_attacker == null) {
			return;
		}
		local actor = this.getContainer().getActor();
        if(this.Math.rand(1, 100) <= this.Const.EL_NPC.EL_NPCBuff.Retaliation.AttackChance[this.m.EL_RankLevel] && (!actor.isTurnStarted || actor.isWaitActionSpent)) {
            local skill = this.EL_getAttackSkill(actor.getTile().getDistanceTo(_EL_attacker.getTile()));
            if (skill != null)
            {
                skill.useForFree(_EL_attacker.getTile());
            }
        }
	}


	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		EL_attackBack(_attacker);
	}

	function onMissed( _attacker, _skill )
	{
		EL_attackBack(_attacker);
	}

});
