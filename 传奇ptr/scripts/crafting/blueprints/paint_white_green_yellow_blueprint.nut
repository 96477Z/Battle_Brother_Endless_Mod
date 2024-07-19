this.paint_white_green_yellow_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_white_green_yellow";
		this.m.Type = this.Const.Items.ItemType.Misc;
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_white_green_yellow_item");
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/misc/ghoul_horn_item",
				Num = 2
			},
			{
				Script = "scripts/items/misc/poison_gland_item",
				Num = 3
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/backgrounds/beast_hunter_background"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/paint_white_green_yellow_item"));
	}

	function isQualified()
	{
		return ::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() && this.blueprint.isQualified();
	}

});

