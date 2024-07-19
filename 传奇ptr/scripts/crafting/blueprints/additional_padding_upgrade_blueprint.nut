this.additional_padding_upgrade_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.additional_padding_upgrade";
		this.m.Type = this.Const.Items.ItemType.Armor;

		if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
		{
			this.m.PreviewCraftable = this.new("scripts/items/legend_armor/armor_upgrades/legend_additional_padding_upgrade");
		}
		else
		{
			this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/additional_padding_upgrade");
		}

		this.m.Cost = 400;
		local ingredients = [
			{
				Script = "scripts/items/misc/frost_unhold_fur_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/werewolf_pelt_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
		{
			_stash.add(this.new("scripts/items/legend_armor/armor_upgrades/legend_additional_padding_upgrade"));
		}
		else
		{
			_stash.add(this.new("scripts/items/armor_upgrades/additional_padding_upgrade"));
		}
	}

});

