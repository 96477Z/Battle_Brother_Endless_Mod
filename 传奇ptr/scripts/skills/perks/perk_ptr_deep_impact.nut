this.perk_ptr_deep_impact <- this.inherit("scripts/skills/skill", {
	m = {
		AppliedMultiplier = 1.0,
		DidApply = false,
		ArmorEffectivenessMult = 0.2,
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_deep_impact";
		this.m.Name = this.Const.Strings.PerkName.PTRDeepImpact;
		this.m.Description = this.Const.Strings.PerkDescription.PTRDeepImpact;
		this.m.Icon = "ui/perks/ptr_deep_impact.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isEnabled()
	{
		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		this.m.AppliedMultiplier = _properties.DamageArmorMult * this.m.ArmorEffectivenessMult;
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (_skill.isAttack() && (_hitInfo.DamageType == ::Const.Damage.DamageType.Blunt || this.m.IsForceEnabled))
		{
			::Const.Combat.ArmorDirectDamageMitigationMult *= 1.0 - this.m.AppliedMultiplier;
			this.m.DidApply = true;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.m.DidApply)
		{
			::Const.Combat.ArmorDirectDamageMitigationMult /= 1.0 - this.m.AppliedMultiplier;
			this.m.DidApply = false;
		}
	}
});
