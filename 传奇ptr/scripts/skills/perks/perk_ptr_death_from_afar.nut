this.perk_ptr_death_from_afar <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_death_from_afar";
		this.m.Name = this.Const.Strings.PerkName.PTRDeathFromAfar;
		this.m.Description = this.Const.Strings.PerkDescription.PTRDeathFromAfar;
		this.m.Icon = "ui/perks/ptr_death_from_afar.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || !_skill.isRanged() || _targetEntity == null )
		{
			return;
		}

		local myTile = this.getContainer().getActor().getTile();
		local targetTile = _targetEntity.getTile();

		local distance = myTile.getDistanceTo(targetTile);

		_properties.DamageTotalMult *= 1 + (0.02 * distance);
	}
});
