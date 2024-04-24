this.el_novice_tutorial_package_item <- this.inherit("scripts/items/item", {
	m = {
        PageNumGiven = 0,
        PageNum = 10
    },
	function create()
	{
		this.m.ID = "el_special_item.novice_tutorial_package";
		this.m.Name = "新手引导";
		this.m.Description = "使用获得新增内容名词说明。";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = false;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/gladiator_necklace.png";
		this.m.Value = this.m.PageNum * 50;
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
			text = "剩余 " + (this.m.PageNum - this.m.PageNumGiven) + " 页未获得。"
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
		for(local i = this.m.PageNumGiven; i < this.m.PageNum; ++i)
		{
			if(this.m.PageNumGiven == i)
			{
				if(this.World.Assets.getStash().getNumberOfEmptySlots() >= 1)
				{
					this.World.Assets.getStash().add("scripts/items/el_special/el_novice_tutorial_page_" + this.m.PageNumGiven + "_item");
					++this.m.PageNumGiven;
				}
				else
				{
					break;
				}
			}
		}
		return this.m.PageNumGiven == this.m.PageNum;
	}

});

