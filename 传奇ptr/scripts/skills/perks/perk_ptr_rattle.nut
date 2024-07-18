this.perk_ptr_rattle <- this.inherit("scripts/skills/skill", {
	m = {
		MinimumDamage = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_rattle";
		this.m.Name = this.Const.Strings.PerkName.PTRRattle;
		this.m.Description = this.Const.Strings.PerkDescription.PTRRattle;
		this.m.Icon = "ui/perks/ptr_rattle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_damageInflictedHitpoints < this.m.MinimumDamage)
		{
			return;
		}
		
		local actor = this.getContainer().getActor();
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(actor))
		{
			return;
		}
		
		if (!_skill.isAttack() || !_skill.getDamageType().contains(this.Const.Damage.DamageType.Blunt))
		{
			return;
		}
		
		local targetArmorItem = _bodyPart == this.Const.BodyPart.Head ? _targetEntity.getHeadItem() : _targetEntity.getBodyItem();		
		if (targetArmorItem == null)
		{
			return;
		}
		
		_targetEntity.getSkills().add(this.new("scripts/skills/effects/ptr_rattled_effect"));
	}
});

