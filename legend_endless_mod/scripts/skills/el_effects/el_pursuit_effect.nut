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
		EL_useFreeSkill(_skill, _targetEntity);
	}
	
	function EL_useFreeSkill( _skill, _targetEntity )
	{
		if (!this.m.EL_IsExtraAttack)
		{
			this.m.EL_IsExtraAttack = true;
			local user = this.getContainer().getActor();
			for(local i = 0; i < this.World.Assets.m.EL_PursuitList.len(); ++i)
			{
				local actor = this.World.Assets.m.EL_PursuitList[i].actor;
				local skill = this.World.Assets.m.EL_PursuitList[i].skill;
				if (actor.getSkills().hasSkill("effects.stunned") || actor.getCurrentProperties().IsStunned)
				{
					continue;
				}
				if (actor.getID() == user.getID())
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

