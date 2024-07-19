this.perk_ptr_sweeping_strikes <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_sweeping_strikes";
		this.m.Name = this.Const.Strings.PerkName.PTRSweepingStrikes;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSweepingStrikes;
		this.m.Icon = "ui/perks/ptr_sweeping_strikes.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(this.getContainer().getActor()))
		{
			return;
		}

		if (!_skill.isAOE() || !_skill.isAttack())
		{
			return;
		}

		local effect = this.new("scripts/skills/effects/ptr_sweeping_strikes_debuff_effect");
		_targetEntity.getSkills().add(effect);
	}
});
