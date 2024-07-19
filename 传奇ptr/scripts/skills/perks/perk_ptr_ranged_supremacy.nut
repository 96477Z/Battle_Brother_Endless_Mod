this.perk_ptr_ranged_supremacy <- this.inherit("scripts/skills/skill", {
	m = {
		RangedSkillBonus = 10,
		Skills = [
			"actives.quick_shot",
			"actives.aimed_shot"
		]
	},
	function create()
	{
		this.m.ID = "perk.ptr_ranged_supremacy";
		this.m.Name = this.Const.Strings.PerkName.PTRRangedSupremacy;
		this.m.Description = this.Const.Strings.PerkDescription.PTRRangedSupremacy;
		this.m.Icon = "ui/perks/ptr_ranged_supremacy.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getRangedSkillBonus()
	{
		return this.m.RangedSkillBonus;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || !_skill.isRanged() || _targetEntity == null || !_targetEntity.isArmedWithRangedWeapon())
		{
			return;
		}
		_properties.RangedSkill += this.m.RangedSkillBonus;
	}

	function onUpdate(_properties)
	{
		_properties.Vision += 1;
	}

	function onAfterUpdate(_properties)
	{
		foreach (skill in this.m.Skills)
		{
			local s = this.getContainer().getSkillByID(skill);
			if (s != null)
			{
				s.m.MaxRange += 1;
			}
		}
	}

	function onGetHitFactors( _skill, _targetTile, _tooltip )
	{
		local targetEntity = _targetTile.getEntity();
		if (targetEntity != null && targetEntity.isArmedWithRangedWeapon() && _skill.isAttack() && _skill.isRanged())
		{
			_tooltip.push({
				icon = "ui/tooltips/positive.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.RangedSkillBonus + "%[/color] " + this.getName()
			});
		}
	}
});
