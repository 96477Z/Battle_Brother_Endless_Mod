local gt = this.getroottable();

gt.Const.WMS.modWeapon <- function()
{
	::mods_hookExactClass("items/weapons/weapon", function ( o ) {
		o.m.ForcedApplicableMasteries <- [];

		local tooltipFunc = o.getTooltip;
		o.getTooltip = function()
		{
			local tooltip = tooltipFunc();

			if (this.m.WeaponType != this.Const.Items.WeaponType.None)
			{
				local masteriesList = this.getStringOfApplicableMasteries();
				if (masteriesList != "")
				{
					tooltip.push({
						id = 20,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Applicable masteries: " + masteriesList
					});
				}
			}

			return tooltip;
		}

		o.getStringOfApplicableMasteries <- function()
		{
			local masteries = clone this.m.ForcedApplicableMasteries;

			foreach (mastery in gt.Const.WMS.Mastery)
			{
				if (this.getCategories().find(mastery) != null && masteries.find(mastery) == null)
				{
					masteries.push(mastery);
				}
			}

			local ret = "";

			foreach (mastery in masteries)
			{
				ret += mastery + ", ";
			}

			if (ret != "")
			{
				ret = ret.slice(0, -2);
			}

			return ret;
		}

		o.addForcedApplicableMastery <- function( _mastery )
		{
			if (this.m.ForcedApplicableMasteries.find(_mastery) != null)
			{
				this.logError("addForcedApplicableMastery: \'" + _mastery + "\' already exists in weapon \'" + this.getID() + "\'");
				return;				
			}

			this.m.ForcedApplicableMasteries.push(_mastery);
		}
	});
};
