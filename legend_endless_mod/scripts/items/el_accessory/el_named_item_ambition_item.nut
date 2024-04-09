this.el_named_item_ambition_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "el_accessory.named_item_ambition";
		this.m.Name = "规则碎片：传奇";
		this.m.Description = "";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "accessory/el_named_item_ambition_item.png";
		this.m.Icon = "accessory/el_named_item_ambition_item.png";
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
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]商店，制造和意外获取高阶装备的概率提升50%。[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]装备者根据拥有的传奇装备数量提升增伤减伤，当前+" + EL_getBonus() + "%[/color]"
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
		_properties.DamageTotalMult *= 1.0 + EL_getBonus() * 0.01;
		_properties.DamageReceivedTotalMult *= 1.0 - EL_getBonus() * 0.01;
	}

	function onAddedToStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasNamedItemAmbitionRule", true);
		}
	}

	function onRemovedFromStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasNamedItemAmbitionRule", false);
		}
	}

	function EL_getBonus()
	{
		local legendary_item_account = 0;

		local items = this.World.Assets.getStash().getItems();
		foreach( item in items )
		{
			if (item != null)
			{
				if (item.EL_getRankLevelMax() == this.Const.EL_Item.Type.Legendary)
				{
					++legendary_item_account;
				}
			}
		}

		local roster = this.World.getPlayerRoster().getAll();
		foreach( bro in roster )
		{
			local items = bro.getItems().getAllItems();
			foreach( item in items )
			{
				if (item != null)
				{
					if (item.EL_getRankLevelMax() == this.Const.EL_Item.Type.Legendary)
					{
						++legendary_item_account;
					}
				}
			}
		}
        local need_factor = 1;
        local need_account = need_factor;
        local bonus = 0;
        local bonus_factor = 1;
        while(legendary_item_account >= need_account) {
            legendary_item_account -= need_account;
            need_account += need_factor;
            bonus += bonus_factor;
        }
        return bonus;
	}

});
