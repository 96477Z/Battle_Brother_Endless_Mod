this.el_trade_ambition_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "el_accessory.trade_ambition";
		this.m.Name = "规则碎片：交易";
		this.m.Description = "";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "accessory/el_trade_ambition_item.png";
		this.m.Icon = "accessory/el_trade_ambition_item.png";
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
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]商店购买物品价格降低10%，出售物品价格增加10%。[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]装备者根据出售商品数量增加伤害，当前+" + EL_getBonus() + "%[/color]"
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
		_properties.DamageTotalMult *= 1.0 + 0.01 * this.EL_getBonus();
	}

	function onAddedToStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasTradeAmbitionRule", true);
		}
	}

	function onRemovedFromStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasTradeAmbitionRule", false);
		}
	}

	function EL_getBonus()
	{
        local sell_account = this.World.Statistics.getFlags().getAsInt("TradeGoodsSold");
        local need_factor = 1;
        local need_account = need_factor;
        local bonus = 0;
        local bonus_factor = 1;
        while(sell_account >= need_account) {
            sell_account -= need_account;
            need_account += need_factor;
            bonus += bonus_factor;
        }
        return bonus;
	}

});
