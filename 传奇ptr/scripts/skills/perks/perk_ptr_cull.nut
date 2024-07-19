this.perk_ptr_cull <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		Threshold = 0.33,
		SkillCount = 0,
		LastTargetID = 0
	},
	function create()
	{
		this.m.ID = "perk.ptr_cull";
		this.m.Name = this.Const.Strings.PerkName.PTRCull;
		this.m.Description = this.Const.Strings.PerkDescription.PTRCull;
		this.m.Icon = "ui/perks/ptr_cull.png";
		this.m.IconMini = "ptr_cull_mini";
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
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Axe))
		{
			return false;
		}

		return true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_bodyPart != this.Const.BodyPart.Head || !_skill.isAttack() || !this.isEnabled() || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.getSkills().hasSkill("effects.indomitable") || _targetEntity.getSkills().hasSkill("perk.steel_brow"))
		{
			return;
		}

		local actor = this.getContainer().getActor();
		if (_targetEntity.isAlliedWith(actor) || this.m.SkillCount == this.Const.SkillCounter && this.m.LastTargetID == _targetEntity.getID())
		{
			return;
		}

		this.m.SkillCount = this.Const.SkillCounter;
		this.m.LastTargetID = _targetEntity.getID();

		if (_targetEntity.getHitpoints() / (_targetEntity.getHitpointsMax() * 1.0) < this.m.Threshold)
		{
			if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " is going to Cull " + this.Const.UI.getColorizedEntityName(_targetEntity));
			}
			this.logDebug("[" + actor.getName() + "] is going to Cull target [" + _targetEntity.getName() + "] with skill [" + _skill.getName() + "]");
			_targetEntity.kill(actor, _skill);
		}
	}
});
