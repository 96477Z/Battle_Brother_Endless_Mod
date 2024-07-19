this.perk_ptr_swordlike <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,		
		Bonus = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_swordlike";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordlike;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordlike;
		this.m.Icon = "ui/perks/ptr_swordlike.png";
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
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Cleaver) && weapon.getRangeMax() == 1)
		{
			return true;
		}

		return false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.isEnabled() && _skill.getID() == "actives.cleave")
    {
      _properties.MeleeSkill += this.m.Bonus;
    }
	}

	function onQueryTooltip( _skill, _tooltip )
	{
		if (this.isEnabled() && _skill.getID() == "actives.cleave")
		{
			_tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Bonus + "%[/color] chance to hit because of the Swordlike perk"
			});
		}
	}
});
