this.el_novice_tutorial_book_item <- this.inherit("scripts/items/item", {
	m = {
        PageNum = 33
    },
	function create()
	{
		this.m.ID = "el_special_item.novice_tutorial_book";
		this.m.Name = "新手引导书";
		this.m.Description = "使用获得新增内容名词说明。";
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
		this.World.Flags.set("EL_TotorialBookExtraStash", this.m.PageNum);
		this.calculateStashModifier();
		for(local i = 0; i < this.m.PageNum; ++i)
		{
			local page_num_str = i >= 10 ? ("" + i) : ("0" + i)
			this.World.Assets.getStash().add("scripts/items/el_special/el_novice_tutorial_page_" + i + "_item");
		}
		return true;
	}

});

