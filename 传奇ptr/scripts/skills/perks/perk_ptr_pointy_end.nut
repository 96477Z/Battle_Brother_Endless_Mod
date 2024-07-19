this.perk_ptr_pointy_end <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		MeleeSkillBonus = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_pointy_end";
		this.m.Name = this.Const.Strings.PerkName.PTRPointyEnd;
		this.m.Description = this.Const.Strings.PerkDescription.PTRPointyEnd;
		this.m.Icon = "ui/perks/ptr_pointy_end.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || _targetEntity.isArmedWithShield() || !_skill.isAttack())
		{
			return;
		}

		if (!_skill.isRanged() && (this.m.IsForceEnabled || _skill.getDamageType().contains(this.Const.Damage.DamageType.Piercing)))
		{
			_properties.MeleeSkill += this.m.MeleeSkillBonus;
		}
	}

	function onGetHitFactors( _skill, _targetTile, _tooltip )
	{
		local targetEntity = _targetTile.getEntity();
		if (targetEntity != null && !targetEntity.isArmedWithShield() && _skill.isAttack() && !_skill.isRanged() && (this.m.IsForceEnabled || _skill.getDamageType().contains(this.Const.Damage.DamageType.Piercing)))
		{
			_tooltip.push({
				icon = "ui/tooltips/positive.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MeleeSkillBonus + "%[/color] " + this.getName()
			});
		}
	}
});
