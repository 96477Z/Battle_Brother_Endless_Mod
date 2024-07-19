this.paint_black_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_black";
		this.m.Type = this.Const.Items.ItemType.Misc;
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_black_item");
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/misc/petrified_scream_item",
				Num = 1
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
		_stash.add(this.new("scripts/items/misc/paint_black_item"));
	}

	function isQualified()
	{
		return ::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() && this.blueprint.isQualified();
	}

});

