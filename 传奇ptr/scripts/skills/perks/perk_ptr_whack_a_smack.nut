this.perk_ptr_whack_a_smack <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		MeleeSkillMalus = 20
	},
	function create()
	{
		this.m.ID = "perk.ptr_whack_a_smack";
		this.m.Name = this.Const.Strings.PerkName.PTRWhackASmack;
		this.m.Description = "This character is prepared to immediately counter-attack on any failed attempt to attack %them% in melee.";
		this.m.Icon = "ui/perks/ptr_whack_a_smack.png";
		this.m.IconMini = "ptr_whack_a_smack_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return !this.isEnabled();
	}

	function isEnabled()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || !actor.hasZoneOfControl())
		{
			return false;
		}

		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local weapon = actor.getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff))
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		if (this.isEnabled())
		{
			_properties.IsRiposting = true;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() == this.getContainer().getActor().getID() || !this.isEnabled())
		{
			return;
		}

		_properties.MeleeSkill -= this.m.MeleeSkillMalus;

		if (_properties.IsSpecializedInStaffStun)
		{
			_properties.MeleeSkill += 10;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() == this.getContainer().getActor().getID() || !this.isEnabled())
		{
			return;
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying() || !_skill.isAttack() || _skill.isRanged())
		{
			return;
		}

		local effect = this.new("scripts/skills/effects/legend_baffled_effect");
		_targetEntity.getSkills().add(effect);
		effect.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
	}
});
