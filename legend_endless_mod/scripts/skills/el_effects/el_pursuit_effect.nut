this.el_pursuit_effect <- this.inherit("scripts/skills/skill", {
	m = {
        EL_IsExtraAttack = false
	},

	function create()
	{
		this.m.ID = "el_rarity_effects.pursuit";
		this.m.Type = this.Const.SkillType.Special;
		this.m.IsActive = false;
		this.m.IsHidden = true;
	}

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_skill.EL_isPursuitSkill())
		{
			//this.logInfo("set Actor");
			this.World.Assets.m.EL_CurrentAttackActor = this.getContainer().getActor();
			this.World.Assets.m.EL_CurrentAttackedActor = _targetEntity;
			this.World.Assets.m.EL_CurrentAttackActorIsAlive = true;
			this.World.Assets.m.EL_CurrentAttackedActorIsAlive = true;
		}
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		// local is_able_to_die = _targetEntity.m.IsAbleToDie;
		// _targetEntity.m.IsAbleToDie = false;
		EL_useFreeSkill(_skill, _targetEntity);
		// _targetEntity.m.IsAbleToDie = is_able_to_die;
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (!_skill.EL_isPursuitSkill())
		{
			//this.logInfo("set Actor");
			this.World.Assets.m.EL_CurrentAttackActor = this.getContainer().getActor();
			this.World.Assets.m.EL_CurrentAttackedActor = _targetEntity;
			this.World.Assets.m.EL_CurrentAttackActorIsAlive = true;
			this.World.Assets.m.EL_CurrentAttackedActorIsAlive = true;
		}
		EL_useFreeSkill(_skill, _targetEntity);
	}
	
	function EL_useFreeSkill( _skill, _targetEntity )
	{
		//this.logInfo("useFreeSkill Start");
		
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (_skill.EL_isPursuitSkill() || _skill.isRanged() || !_skill.m.IsWeaponSkill || _skill.getID() == "actives.split_shield")
		{
			return;
		}
		if (!this.m.EL_IsExtraAttack)
		{
			this.m.EL_IsExtraAttack = true;
			local user = this.getContainer().getActor();
			for(local i = 0; i < this.World.Assets.m.EL_PursuitList.len(); ++i)
			{
				if(this.World.Assets.m.EL_CurrentAttackActorIsAlive == false || this.World.Assets.m.EL_CurrentAttackedActorIsAlive == false)
				{
					return;
				}
				//this.logInfo(this.World.Assets.m.EL_CurrentAttackActorIsAlive);
				//this.logInfo(this.World.Assets.m.EL_CurrentAttackedActorIsAlive);
				local actor = this.World.Assets.m.EL_PursuitList[i].actor;
				local skill = this.World.Assets.m.EL_PursuitList[i].skill;
				if (!actor.isPlacedOnMap() || actor.isHiddenToPlayer())
				{
            		this.World.Assets.EL_removeByPursuitList(actor);
					continue;
				}
				if (actor == null || !actor.isAlive() || actor.isDying())
				{
            		this.World.Assets.EL_removeByPursuitList(actor);
					continue;
				}
				if (actor.getSkills().hasSkill("effects.stunned") || actor.getCurrentProperties().IsStunned)
				{
					continue;
				}
				if (actor == user)
				{
					continue;
				}
				if (_targetEntity.getTile() == null || actor.getTile() == null)
				{
					continue;
				}
				if (_targetEntity.getTile().getDistanceTo(actor.getTile()) > skill.getMaxRange())
				{
					continue;
				}
				if (actor.getFaction() == user.getFaction())
				{   
					skill.useForFree(_targetEntity.getTile());
				}
			}
		}
		this.m.EL_IsExtraAttack = false;
	}
});

