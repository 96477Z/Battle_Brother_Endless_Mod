this.perk_ptr_bear_down <- this.inherit("scripts/skills/skill", {
	m = {
		BonusPerNegativeStatusEffect = 0.05,
		Effects = [
			"effects.stunned",
			"effects.staggered",
			"effects.legend_baffled",
			"effects.dazed"
		]
	},
	function create()
	{
		this.m.ID = "perk.ptr_bear_down";
		this.m.Name = this.Const.Strings.PerkName.PTRBearDown;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBearDown;
		this.m.Icon = "ui/perks/ptr_bear_down.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || !_skill.isAttack())
		{
			return;
		}

		local count = _targetEntity.getSkills().getSkillsByFunction((@(_skill) this.m.Effects.find(_skill.getID()) != null).bindenv(this)).len();
		
		_properties.DamageTotalMult *= 1.0 + (count * this.m.BonusPerNegativeStatusEffect);
	}
});
