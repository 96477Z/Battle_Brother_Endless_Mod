this.perk_ptr_from_all_sides <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		SkillCount = 0,
		LastTargetID = 0,
	},
	function create()
	{
		this.m.ID = "perk.ptr_from_all_sides";
		this.m.Name = this.Const.Strings.PerkName.PTRFromAllSides;
		this.m.Description = this.Const.Strings.PerkDescription.PTRFromAllSides;
		this.m.Icon = "ui/perks/ptr_from_all_sides.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local actor = this.getContainer().getActor();
		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
		{
			return false;
		}

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Flail))
		{
			return false;
		}

		return true;
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		this.procIfApplicable(_skill, _targetEntity, _hitInfo);
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		this.procIfApplicable(_skill, _targetEntity);
	}

	function procIfApplicable( _skill, _targetEntity, _hitInfo = null)
	{
		if (!_skill.isAttack() || _targetEntity.isAlliedWith(this.getContainer().getActor()) || !this.isEnabled())
		{
			return;
		}

		if (this.m.SkillCount == this.Const.SkillCounter && this.m.LastTargetID == _targetEntity.getID())
		{
			return;
		}

		this.m.SkillCount = this.Const.SkillCounter;
		this.m.LastTargetID = _targetEntity.getID();

		local effect = _targetEntity.getSkills().getSkillByID("effects.ptr_from_all_sides");
		if (effect == null)
		{
			effect = this.new("scripts/skills/effects/ptr_from_all_sides_effect");			
		}		

		_targetEntity.getSkills().add(effect);

		effect.proc(_hitInfo);
	}
});
