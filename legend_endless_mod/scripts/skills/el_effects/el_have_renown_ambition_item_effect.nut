this.el_have_renown_ambition_item_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "el_effect.have_renown_ambition_item";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
        if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		_targetEntity.checkMorale(-1, this.World.Assets.getBusinessReputation() * 0.001);
	}

	function onTargetMissed( _skill, _targetEntity )
	{
        if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		_targetEntity.checkMorale(-1, this.World.Assets.getBusinessReputation() * 0.001);
	}
});

