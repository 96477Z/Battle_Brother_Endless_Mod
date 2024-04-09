this.el_equipment_essence_item <- this.inherit("scripts/items/item", {
	m = {
		EL_Amount = 0
	},

	function getAmountString()
	{
		if(this.m.EL_Amount < this.Math.pow(10, 3)) {
			return this.m.EL_Amount;
		}
		else if(this.m.EL_Amount < this.Math.pow(10, 6)) {
			return this.Math.floor(this.m.EL_Amount / this.Math.pow(10, 3)) + "k";
		}
		else if(this.m.EL_Amount < this.Math.pow(10, 9)) {
			return this.Math.floor(this.m.EL_Amount / this.Math.pow(10, 6)) + "m";
		}
		else {
			return this.Math.floor(this.m.EL_Amount / this.Math.pow(10, 9)) + "b";
		}
	}

	function isAmountShown()
	{
		return true;
	}

	function create()
	{
		this.m.ID = "el_supplies.equipment_essence_rank_" + this.m.EL_RankLevel;
		this.m.Name = "[color=" + this.Const.EL_Item.Colour[this.m.EL_RankLevel] + "]装备精华[/color]";
		this.m.Icon = "el_supplies/equipment_essence_rank_" + this.m.EL_RankLevel + ".png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Supply;
		this.m.IsDroppedAsLoot = true;
		this.m.IsConsumed = true;
		this.m.Value = 0;
		this.m.EL_Amount = 0;
	}

	function consume()
	{
		this.World.Assets.EL_addEquipmentEssence(this.m.EL_RankLevel, this.m.EL_Amount);
	}

	function playInventorySound(_eventType)
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
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
				text = "数量为 [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.EL_Amount + "[/color] 的装备精华, 可以在武器店或者盔甲点升级、升阶、重铸装备。一旦你重新进入世界地图，将会自动添加到你的库存中。"
			}
		];

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
			id = 66,
			type = "text",
			text = this.getValueString()
		});
		return result;
	}

	function getAmount()
	{
		return this.m.EL_Amount; 
	}

	function setAmount( _EL_Amount )
	{
		this.m.EL_Amount = this.Math.floor(_EL_Amount);
	}


	function EL_getAmount()
	{
		return this.m.EL_Amount;
	}

	function EL_setAmount(_EL_Amount)
	{
		this.m.EL_Amount = this.Math.floor(_EL_Amount);
	}

	function EL_addAmount(_EL_Amount)
	{
		this.m.EL_Amount += this.Math.floor(_EL_Amount);
	}

	function onSerialize( _out )
	{
		_out.writeI32(this.m.Value);
		_out.writeI32(this.m.EL_Amount);
	}

	function onDeserialize( _in )
	{
		this.m.Value = _in.readI32();
		this.m.EL_Amount = _in.readI32();
	}
});

