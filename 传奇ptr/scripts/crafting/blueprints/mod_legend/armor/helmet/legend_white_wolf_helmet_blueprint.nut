this.legend_white_wolf_helmet_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_white_wolf_helmet";
		this.m.Type = this.Const.Items.ItemType.Helmet;
		this.m.PreviewCraftable = this.new("scripts/items/helmets/legendary/legend_white_wolf_helmet");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_white_wolf_pelt_item",
				Num = 2
			},
			{
				Script = "scripts/items/helmets/bascinet_with_mail",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/backgrounds/legend_blacksmith_background"
				]
			}
		];
		this.initSkills(skills);
	}

	function isQualified()
	{
		return ::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() && this.blueprint.isQualified();
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/helmets/legendary/legend_white_wolf_helmet");
		item.m.Name = "";
		_stash.add(item);
	}

});

