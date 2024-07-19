this.perk_ptr_heavy_strikes <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_heavy_strikes";
		this.m.Name = this.Const.Strings.PerkName.PTRHeavyStrikes;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHeavyStrikes;
		this.m.Icon = "ui/perks/ptr_heavy_strikes.png";
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

		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Mace))
		{
			return false;
		}

		return true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(this.getContainer().getActor()) || !_skill.isAttack())
		{
			return;
		}

		if (this.isEnabled() && (this.m.IsForceEnabled || _skill.getDamageType().contains(this.Const.Damage.DamageType.Blunt)))
		{
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_baffled_effect"));
		}
	}
});
