this.perk_ptr_primal_fear <- this.inherit("scripts/skills/skill", {
	m = {
		TargetsHit = [],
		BaseChance = 30,
		ChanceDropPerHit = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_primal_fear";
		this.m.Name = this.Const.Strings.PerkName.PTRPrimalFear;
		this.m.Description = this.Const.Strings.PerkDescription.PTRPrimalFear;
		this.m.Icon = "ui/perks/ptr_primal_fear.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getChance( _targetEntity )
	{
		local hits = 0;
		foreach (entry in this.m.TargetsHit)
		{
			if (entry.TargetID == _targetEntity.getID())
			{
				hits = entry.Hits;
			}
		}

		local baseChance = this.m.BaseChance - this.m.ChanceDropPerHit * hits;
		local HPChance = (1.0 - _targetEntity.getHitpointsPct()) * 100;

		return baseChance + HPChance;
	}

	function addTargetHit( _targetEntity )
	{
		foreach (entry in this.m.TargetsHit)
		{
			if (entry.TargetID == _targetEntity.getID())
			{
				entry.Hits += 1;
				return;
			}
		}

		this.m.TargetsHit.push(
			{
				TargetID = _targetEntity.getID(),
				Hits = 1
			}
		);
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_bodyPart != this.Const.BodyPart.Head || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.getMoraleState() == this.Const.MoraleState.Ignore || (_targetEntity.getMoraleState() == this.Const.MoraleState.Fleeing + 1))
		{
			return;
		}

		if (this.Math.rand(1, 100) > this.getChance(_targetEntity))
		{
			return;
		}

		local user = this.getContainer().getActor();
		local targetTile = _targetEntity.getTile();
		if (!user.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + "\'s loses morale due to Primal Fear");
		}

		this.spawnIcon("perk_ptr_primal_fear", targetTile);
		_targetEntity.setMoraleState(this.Math.max(0, _targetEntity.getMoraleState() - 1));

		this.addTargetHit(_targetEntity);
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.TargetsHit.clear();
	}
});
