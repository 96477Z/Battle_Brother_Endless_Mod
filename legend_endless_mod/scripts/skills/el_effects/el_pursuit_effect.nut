this.el_pursuit_effect <- this.inherit("scripts/skills/skill", {
	m = {
		EL_SourceActor = null,
        EL_PursuitSkill = null,
        EL_IsExtraAttack = false,
		IsHidden = true
	},

	function create()
	{
		this.m.ID = "el_rarity_effects.pursuit";
		this.m.Type = this.Const.SkillType.Special;
		this.m.IsActive = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = true;
	}

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		local is_able_to_die = _targetEntity.m.IsAbleToDie;
		_targetEntity.m.IsAbleToDie = false;
		EL_useFreeSkill(_skill, _targetEntity);
		_targetEntity.m.IsAbleToDie = is_able_to_die;
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		EL_useFreeSkill(_skill, _targetEntity);
	}

	function onDeath( _fatalityType )
	{
		if(this.m.EL_SourceActor != null && this.m.EL_SourceActor.isAlive() && !this.m.EL_SourceActor.isDying())
		{
			local user = this.getContainer().getActor();
			local skills = actor.getSkills().getAllSkillsByID("el_rarity_effects.pursuit");
			foreach(skill in skills)
			{
				if(skill.EL_getSourceActor() == this.m.EL_SourceActor)
				{
					foreach(actor in skill.m.EL_chainEntity)
					{
						if(user == actor)
						{
							skill.m.EL_chainEntity.remove(user);
							return;
						}
					}
				}
			}
		}
	}
	
	function EL_useFreeSkill( _skill, _targetEntity )
	{
        if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying() || !_skill.isAttack() || _skill.isRanged())
		{
			return;
		}
		if (this.m.EL_PursuitSkill == null || this.m.EL_SourceActor == null || !this.m.EL_SourceActor.isAlive() || this.m.EL_SourceActor.isDying()
										   || this.m.EL_SourceActor.getSkills().hasSkill("effects.stunned") || this.m.EL_SourceActor.getCurrentProperties().IsStunned)
		{
			return;
		}
        if (!this.m.EL_IsExtraAttack)
		{
			this.m.EL_IsExtraAttack = true;
            local distance = _targetEntity.getTile().getDistanceTo(this.m.EL_SourceActor.getTile());
            if(distance <= this.m.EL_PursuitSkill.getMaxRange() && EL_isUsable())
            {
                this.m.EL_PursuitSkill.useForFree(_targetEntity.getTile());
            }
		}
		this.m.EL_IsExtraAttack = false;
	}

    function EL_setSourceActorAndAttackSkill( _EL_sourceActor, _EL_pursuitSkill )
	{
		this.m.EL_SourceActor = _EL_sourceActor;
		this.m.EL_PursuitSkill = _EL_pursuitSkill;
	}

    function EL_getSourceActor()
	{
		return this.m.EL_SourceActor;
	}

    function EL_getPursuitSkill()
	{
		return this.m.EL_PursuitSkill;
	}

    function EL_isUsable()
	{
		local skills = this.m.EL_SourceActor.getSkills();
		foreach(skill in skills.m.Skills)
		{
			if( skill.getID() == "el_rarity_entry.brutal_cashing" || skill.getID() == "el_rarity_entry.cold_lie_cashing" || 
				skill.getID() == "el_rarity_entry.landslide_cashing" || skill.getID() == "el_rarity_entry.stun_cashing" )
			{
				return skill.EL_isUsable();
			}
		}
		return false;
	}
});

