this.perk_ptr_deep_cuts <- this.inherit("scripts/skills/skill", {
	m = {
    TargetID = 0,
		NumInjuriesBefore = 0,
		IsInjuryInflicted = false,
		InjuryThresholdReduction = 33
	},
	function create()
	{
		this.m.ID = "perk.ptr_deep_cuts";
		this.m.Name = this.Const.Strings.PerkName.PTRDeepCuts;
		this.m.Description = "This character is prepared to deal a particularly deep cut on %their% next attack against the same target.";
		this.m.Icon = "ui/perks/ptr_deep_cuts.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.TargetID == 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local e = this.Tactical.getEntityByID(this.m.TargetID);
		if (e != null && e.isAlive())
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The next [color=" + this.Const.UI.Color.NegativeValue + "]cutting[/color] attack this turn against [color=" + this.Const.UI.Color.NegativeValue + "]" + e.getName() + "[/color] has a [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.InjuryThresholdReduction + "%[/color] lower threshold to inflict injury"
			});

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "Will expire upon attacking another target or using a non-cutting type attack"
			});
		}

		return tooltip;
	}

  function onTurnEnd()
  {
    this.m.TargetID = 0;
    this.m.IsInjuryInflicted = false;
  }

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (this.m.TargetID != _targetEntity.getID() || !this.Tactical.TurnSequenceBar.isActiveEntity(this.getContainer().getActor()))
		{
			this.m.IsInjuryInflicted = false;
		}
		
		this.m.NumInjuriesBefore = _targetEntity.getSkills().getAllSkillsOfType(this.Const.SkillType.TemporaryInjury).len();
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity != null && this.m.TargetID == _targetEntity.getID() && _skill.isAttack() && _skill.getDamageType().contains(this.Const.Damage.DamageType.Cutting) && this.Tactical.TurnSequenceBar.isActiveEntity(this.getContainer().getActor()))
		{
			_properties.ThresholdToInflictInjuryMult *= 1.0 - this.m.InjuryThresholdReduction * 0.01;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || !_skill.isAttack() || !_skill.getDamageType().contains(this.Const.Damage.DamageType.Cutting) || _targetEntity.getCurrentProperties().IsImmuneToBleeding || !this.Tactical.TurnSequenceBar.isActiveEntity(this.getContainer().getActor()))
		{
			this.m.TargetID = 0;
			this.m.IsInjuryInflicted = false;
			return;
		}

		if (_targetEntity.getSkills().getAllSkillsOfType(this.Const.SkillType.TemporaryInjury).len() > this.m.NumInjuriesBefore)
    {
    	this.m.IsInjuryInflicted = true;
    }

		if (this.m.TargetID == _targetEntity.getID())
    {
      if (_damageInflictedHitpoints >= this.Const.Combat.MinDamageToApplyBleeding)
			{
				local actor = this.getContainer().getActor();
			  local effect = this.new("scripts/skills/effects/bleeding_effect");

			  if (actor.getFaction() == this.Const.Faction.Player)
			  {
			    effect.setActor(this.getContainer().getActor());
			  }

			  if (_targetEntity.getSkills().getAllSkillsOfType(this.Const.SkillType.TemporaryInjury).len() > this.m.NumInjuriesBefore)
				{
					effect.setDamage(10);
				}

			  _targetEntity.getSkills().add(effect);

			  if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " made a particularly Deep Cut inflicting additional Bleeding on " + this.Const.UI.getColorizedEntityName(_targetEntity));
				}
			}
    }
    else
    {
      this.m.TargetID = _targetEntity.getID();      
   	}
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.TargetID = 0;
		this.m.IsInjuryInflicted = false;
	}
});
