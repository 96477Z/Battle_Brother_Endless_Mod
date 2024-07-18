local gt = this.getroottable();

gt.Const.WMS.modPerks <- function()
{
	if ("LegendMod" in gt.Const)
	{
		::mods_hookNewObject("skills/perks/perk_mastery_sword", function(o)
		{
			local onUpdate = o.onUpdate;

			o.onUpdate <- function (_properties)
			{
				onUpdate(_properties);
				_properties.IsSpecializedInGreatSwords = true;
			}
		});

		::mods_hookNewObject("skills/perks/perk_mastery_greatsword", function(o)
		{
			local onUpdate = o.onUpdate;

			o.onUpdate <- function (_properties)
			{
				onUpdate(_properties);
				_properties.IsSpecializedInSwords = true;
			}
		});
	}
};
