this.perk_ptr_through_the_ranks <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 50
	},
	function create()
	{
		this.m.ID = "perk.ptr_through_the_ranks";
		this.m.Name = this.Const.Strings.PerkName.PTRThroughTheRanks;
		this.m.Description = this.Const.Strings.PerkDescription.PTRThroughTheRanks;
		this.m.Icon = "ui/perks/ptr_through_the_ranks.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack() && _targetEntity != null && _targetEntity.getID() != this.getContainer().getActor().getID() && _targetEntity.getFaction() == this.getContainer().getActor().getFaction())
		{
			_properties.RangedSkillMult *= this.m.Bonus * 0.01;
		}
	}
});
