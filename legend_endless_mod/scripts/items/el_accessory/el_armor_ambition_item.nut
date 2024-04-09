this.el_armor_ambition_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "el_accessory.armor_ambition";
		this.m.Name = "规则碎片：厚重";
		this.m.Description = "";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "accessory/el_armor_ambition_item.png";
		this.m.Icon = "accessory/el_armor_ambition_item.png";
		this.m.Value = 0;
		this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/asset_business_reputation.png",
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]所有兄弟免疫负重的负面效果。[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]装备者根据拥有的著名重甲数量提升护甲量，当前+" + EL_getBonus() + "%[/color]"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);
		_properties.ArmorMult[this.Const.BodyPart.Body] *= 1 + EL_getBonus() * 0.01;
		_properties.ArmorMult[this.Const.BodyPart.Head] *= 1 + EL_getBonus() * 0.01;
	}

	function onAddedToStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasArmorAmbitionRule", true);
		}
	}

	function onRemovedFromStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasArmorAmbitionRule", false);
		}
	}

	function EL_getBonus()
	{
		local armor_account = 0;

		local items = this.World.Assets.getStash().getItems();
		foreach( item in items )
		{
			if (item != null)
			{
				if ((item.isItemType(this.Const.Items.ItemType.Named) || item.isItemType(this.Const.Items.ItemType.Legendary)) && item.getArmorMax() >= 200)
				{
					++armor_account;
				}
			}
		}

		local roster = this.World.getPlayerRoster().getAll();
		foreach( bro in roster )
		{
			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
			if (item != null)
			{
				if ((item.isItemType(this.Const.Items.ItemType.Named) || item.isItemType(this.Const.Items.ItemType.Legendary)) && item.getArmorMax() >= 200)
				{
					++armor_account;
				}
			}
			item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			if (item != null)
			{
				if ((item.isItemType(this.Const.Items.ItemType.Named) || item.isItemType(this.Const.Items.ItemType.Legendary)) && item.getArmorMax() >= 200)
				{
					++armor_account;
				}
			}
		}
        return 4 * armor_account;
	}

});
