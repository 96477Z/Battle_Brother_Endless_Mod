this.perk_ptr_bully <- this.inherit("scripts/skills/skill", {
	m = {
		DamageBonus = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_bully";
		this.m.Name = this.Const.Strings.PerkName.PTRBully;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBully;
		this.m.Icon = "ui/perks/ptr_bully.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || _targetEntity.getMoraleState() == this.Const.MoraleState.Ignore)
    {
			return;
    }

		local actor = this.getContainer().getActor();

		local difference = actor.getMoraleState() - _targetEntity.getMoraleState();

		if (difference <= 0)
		{
			return;
		}

		_properties.MeleeDamageMult *= 1.0 + this.m.DamageBonus * 0.01 * difference;
	}
});
