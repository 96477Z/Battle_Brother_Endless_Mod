this.perk_ptr_leverage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_leverage";
		this.m.Name = this.Const.Strings.PerkName.PTRLeverage;
		this.m.Description = this.Const.Strings.PerkDescription.PTRLeverage;
		this.m.Icon = "ui/perks/ptr_leverage.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack() && !_skill.isRanged() && _targetEntity != null && _targetEntity.getTile().getDistanceTo(this.getContainer().getActor().getTile()) == 2)
		{
			_properties.HitChance[this.Const.BodyPart.Head] += 20;
		}
	}
});
