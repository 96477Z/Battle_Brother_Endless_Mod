this.perk_ptr_wear_them_down <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_wear_them_down";
		this.m.Name = this.Const.Strings.PerkName.PTRWearThemDown;
		this.m.Description = this.Const.Strings.PerkDescription.PTRWearThemDown;
		this.m.Icon = "ui/perks/ptr_wear_them_down.png";
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

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff))
		{
			return false;
		}

		return true;
	}

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if (!_skill.isAttack())
		{
			return;
		}

		local count = _attacker.getSkills().getArrayOfNegativeStatusEffects().len();

		if (_attacker.getSkills().hasSkill("effects.ptr_worn_down"))
		{
			count++;
		}

		_properties.RerollDefenseChance += 20 * count;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || !this.isEnabled())
		{
			return;
		}

		_targetEntity.getSkills().add(this.new("scripts/skills/effects/ptr_worn_down_effect"));
	}
});
