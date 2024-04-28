this.el_novice_tutorial_book_item <- this.inherit("scripts/items/item", {
	m = {
        PageNum = 33
    },
	function create()
	{
		this.m.ID = "el_special_item.novice_tutorial_book";
		this.m.Name = "新手引导书";
		this.m.Description = "使用获得新增内容名词说明（可重复使用补充缺少的说明）。";
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
			id = 65,
			type = "text",
			text = "右键点击使用"
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
		this.World.State.getPlayer().calculateStashModifier();
		for(local i = 0; i < this.m.PageNum; ++i)
		{
			local page_num_str = i >= 10 ? ("" + i) : ("0" + i)
			local items = this.World.Assets.getStash().getItems();
			local has_page = false;
			foreach( item in items )
			{
				if (item != null)
				{
					if (item.getID() == "el_special_item.novice_tutorial_page_" + page_num_str)
					{
						has_page = true;
						break;
					}
				}
			}
			if(has_page == false)
			{
				local page = this.new("scripts/items/el_special/el_novice_tutorial_page_" + page_num_str + "_item");
				this.World.Assets.getStash().add(page);
			}
		}
		return false;
	}

});

