this.perk_ptr_through_the_gaps <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		Bonus = 0.1
	},
	function create()
	{
		this.m.ID = "perk.ptr_through_the_gaps";
		this.m.Name = this.Const.Strings.PerkName.PTRThroughTheGaps;
		this.m.Description = this.Const.Strings.PerkDescription.PTRThroughTheGaps;
		this.m.Icon = "ui/perks/ptr_through_the_gaps.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack() && (this.m.IsForceEnabled || (!_skill.isRanged() && _skill.getDamageType().contains(this.Const.Damage.DamageType.Piercing))))
		{
			_properties.DamageDirectAdd += this.m.Bonus;
		}
	}
});
