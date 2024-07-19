this.perk_ptr_bolster <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_bolster";
		this.m.Name = this.Const.Strings.PerkName.PTRBolster;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBolster;
		this.m.Icon = "ui/perks/ptr_bolster.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isInEffect()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Polearm))
		{
			return false;
		}

		return true;
	}

	function onTurnEnd()
	{
		if (this.isInEffect() && !this.getContainer().getActor().isEngagedInMelee())
		{
			local myTile = this.getContainer().getActor().getTile();
			for (local i = 0; i < 6; i++)
			{
				if (myTile.hasNextTile(i))
				{
					local nextTile = myTile.getNextTile(i);
					if (nextTile.IsOccupiedByActor)
					{
						if (nextTile.getEntity().getFaction() == this.getContainer().getActor().getFaction())
						{
							nextTile.getEntity().checkMorale(1, -0.5 * nextTile.getEntity().getBravery());
						}
					}
				}
			}
		}
	}
});
