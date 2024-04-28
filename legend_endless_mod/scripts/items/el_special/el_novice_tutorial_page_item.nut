this.el_novice_tutorial_page_item <- this.inherit("scripts/items/item", {
	m = {
		page_num_str = "",
		page_title_str = "",
		page_info_str = ""
    },
	function create()
	{
		this.m.ID = "el_special_item.novice_tutorial_page_" + this.m.page_num_str;
		this.m.Name = "新手引导 - " + this.m.page_title_str;
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = false;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.IconLarge = "";
		this.m.Icon = "tutorial/page_" + this.m.page_num_str + ".png";
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
			text = this.m.page_info_str
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onRemovedFromStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_TotorialBookExtraStash", this.World.Flags.get("EL_TotorialBookExtraStash") - 1);
			this.calculateStashModifier();
		}
	}

	function onUse( _actor, _item = null )
	{
		return false;
	}

});

