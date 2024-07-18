local gt = this.getroottable();

gt.PTR.modRunes <- function()
{
	local blueprints = [
		"legend_rune_poison_blueprint",
		"legend_rune_feeding_blueprint",
		"legend_rune_bleeding_blueprint",
		"legend_rune_resilience_blueprint"
	];

	foreach (b in blueprints)
	{
		::mods_hookExactClass("crafting/blueprints/" + b, function(o) {
			// Overwrite create function to remove this rune from blueprints
			o.create = function ()
			{
			}
		});	
	}
}