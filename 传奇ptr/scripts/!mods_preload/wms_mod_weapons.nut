local gt = this.getroottable();

gt.Const.WMS.modWeapons <- function()
{
	::mods_hookNewObject("items/weapons/oriental/firelance", function(o) {
		o.setWeaponType(this.Const.Items.WeaponType.Spear);
	});

	if ("LegendMod" in gt.Const)
	{
		::mods_hookNewObject("items/weapons/named/named_royal_lance", function(o) {
			o.setCategories("Spear/Sword, Two-Handed");
		});

		::mods_hookNewObject("items/weapons/staff_sling", function(o) {
			o.setCategories("Sling, Two-Handed");
		});

		::mods_hookNewObject("items/weapons/oriental/nomad_sling", function(o) {
			o.setCategories("Sling, Two-Handed");
		});

		::mods_hookNewObject("items/weapons/legend_slingstaff", function(o) {
			o.setCategories("Sling, Two-Handed");
		});

		::mods_hookNewObject("items/weapons/legend_sling", function(o) {
			o.setCategories("Sling, One-Handed");
		});
	}
};
