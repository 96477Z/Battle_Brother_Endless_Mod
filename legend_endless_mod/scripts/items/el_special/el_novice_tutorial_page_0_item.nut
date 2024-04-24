this.el_novice_tutorial_page_0_item <- this.inherit("scripts/items/item", {
	m = {
    },
	function create()
	{
		this.m.ID = "el_special_item.novice_tutorial_page_0";
		this.m.Name = "引导 - 世界等级";
		this.m.Description = "新手引导，包含名词解释和内容介绍。";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = false;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/gladiator_necklace.png";
		this.m.Value = 0;
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
			id = 64,
			type = "text",
			text = "说明"
		});
		result.push({
			id = 65,
			type = "text",
			text = "Right-click to use. This item will be consumed in the process."
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		return true;
	}

});

