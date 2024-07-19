this.perk_ptr_head_smasher <- this.inherit("scripts/skills/skill", {
	m = {
		SteelBrowRemoved = false,
		SteelBrowMultiplier = 0.75
	},
	function create()
	{
		this.m.ID = "perk.ptr_head_smasher";
		this.m.Name = this.Const.Strings.PerkName.PTRHeadSmasher;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHeadSmasher;
		this.m.Icon = "ui/perks/ptr_head_smasher.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack())
		{
			_properties.DamageAgainstMult[this.Const.BodyPart.Head] += 0.15;
		}
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		this.m.SteelBrowRemoved = false;

		if (_hitInfo.BodyPart == this.Const.BodyPart.Head && _targetEntity.getSkills().hasSkill("perk.steel_brow"))
		{
			this.m.SteelBrowRemoved = true;

			_targetEntity.getSkills().removeByID("perk.steel_brow");
			local steelBrowReduction = _hitInfo.BodyDamageMult - 1.0;
			local newReduction = steelBrowReduction * this.m.SteelBrowMultiplier;
			_hitInfo.BodyDamageMult = 1.0 + (1.0 - newReduction);
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.m.SteelBrowRemoved && _targetEntity.isAlive() && !_targetEntity.isDying())
		{
			_targetEntity.getSkills().add(this.new("scripts/skills/perks/perk_steel_brow"));
		}
	}
});
