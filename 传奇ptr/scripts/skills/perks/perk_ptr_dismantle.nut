this.perk_ptr_dismantle <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_dismantle";
		this.m.Name = this.Const.Strings.PerkName.PTRDismantle;
		this.m.Description = this.Const.Strings.PerkDescription.PTRDismantle;
		this.m.Icon = "ui/perks/ptr_dismantle.png";
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

		if(weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Hammer))
		{
			return false;
		}

		return true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		local actor = this.getContainer().getActor();
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(actor) || !_skill.isAttack() || !this.isEnabled())
		{
			return;
		}

		if (_targetEntity.getArmor(_bodyPart) == 0)
		{
			return;
		}

		local effect = _targetEntity.getSkills().getSkillByID("effects.ptr_dismantled");
		if (effect == null)
		{
			effect = this.new("scripts/skills/effects/ptr_dismantled_effect");			
		}

		local countsToAdd = 1;

		local weapon = actor.getMainhandItem();
		if (weapon != null && weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
		{
			countsToAdd += 1;
		}

		if (_bodyPart == this.Const.BodyPart.Body)
		{
			effect.m.BodyHitCount += countsToAdd;
		}
		else
		{
			effect.m.HeadHitCount += countsToAdd;
		}

		_targetEntity.getSkills().add(effect);
	}
});
