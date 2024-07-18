this.perk_ptr_bloody_harvest <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_bloody_harvest";
		this.m.Name = this.Const.Strings.PerkName.PTRBloodyHarvest;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBloodyHarvest;
		this.m.Icon = "ui/perks/ptr_bloody_harvest.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAOE() && _skill.isAttack() && !_skill.isRanged())
		{
			_properties.MeleeSkill += 10;
			_properties.DamageTotalMult *= 1.1;
		}
	}
});
