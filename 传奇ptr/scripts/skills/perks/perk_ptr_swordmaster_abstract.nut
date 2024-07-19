this.perk_ptr_swordmaster_abstract <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false
	},
	function create()
	{
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.canPick(this.getID()))
		{
			this.removeSelf();
			if (::MSU.isKindOf(this.getContainer().getActor(), "player"))
			{
				this.getContainer().getActor().m.PerkPoints++;
				this.getContainer().getActor().m.PerkPointsSpent--;
			}

			return false;
		}

		return true;
	}

	function canPick( _id )
	{
		if (this.getContainer().getActor().getFlags().has("PTRSwordmasterPerksUnlimited")) return true;

		foreach (perk in ::Const.Perks.SwordmasterProfessionTree.Tree[3])
		{
			if (::Const.Perks.PerkDefObjects[perk].ID == _id) continue;

			if (this.getContainer().hasSkill(::Const.Perks.PerkDefObjects[perk].ID)) return false;
		}

		return true;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled) return true;

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

});
