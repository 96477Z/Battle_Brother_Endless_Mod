this.ptr_swordmaster_active_abstract <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function isEnabled()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || (!weapon.isWeaponType(::Const.Items.WeaponType.BFFencing) && !weapon.isWeaponType(::Const.Items.WeaponType.Sword, true)))
		{
			return false;
		}

		return true;
	}

	function addEnabledTooltip( _tooltip )
	{
		if (!this.isEnabled())
		{
			_tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a non-hybrid sword[/color]"
			});
		}
	}

	function isUsable()
	{
		return this.skill.isUsable() && this.isEnabled();
	}

});
