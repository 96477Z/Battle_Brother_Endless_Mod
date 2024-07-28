this.el_rarity_entry_stone_item <- this.inherit("scripts/items/item", {
	m = {
		EL_RarityEntry = null
	},
	function create()
	{
		this.m.ID = "el_item.rarity_entry_stone";
		this.m.Name = "稀有词条石";
		this.m.Description = "一块奇石，可以使饰品获得稀有词条。";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable | this.Const.Items.ItemType.Misc;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.IconLarge = "";
		this.m.Icon = "el_misc/el_rarity_entry_stone.png";
		this.m.Value = 50000;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text ="[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare] + "]" + this.getName() + "[/color]"
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare] + "]" + "它储存着: " + this.m.EL_RarityEntry.getName() + "[/color]"
			}
		];
		result.push({
			id = 65,
			type = "text",
			text = "右键单击来使用此物品，将储存的稀有词条转移至当前人物的饰品上。若当前饰品已有稀有词条，原稀有词条将被覆盖，请谨慎使用！ 此物品会在使用过程中消耗掉。"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function EL_setRarityEntry( _EL_rarityEntry )
	{
		this.m.EL_RarityEntry = _EL_rarityEntry;
	}

	function onUse( _actor, _item = null )
	{
		local accessory = _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
		if(accessory != null && accessory.EL_isValid())
		{
			if(accessory.m.EL_RarityEntry != null)
			{
				_actor.getSkills().removeByID(accessory.m.EL_RarityEntry.getID());
			}
			accessory.EL_setRarityEntry(this.m.EL_RarityEntry);
			accessory.addSkill(this.m.EL_RarityEntry);
			this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav",  this.Const.Sound.Volume.Inventory);
			return true;
		}
		return false;
	}

	function onSerialize( _out )
	{
		_out.writeBool(this.m.EL_RarityEntry != null);
		if(this.m.EL_RarityEntry != null)
		{
			_out.writeI32(this.m.EL_RarityEntry.ClassNameHash);
			this.m.EL_RarityEntry.onSerialize(_out);
		}
	}

	function onDeserialize( _in )
	{
		local has_rarity_entry = _in.readBool();
		if(has_rarity_entry)
		{
			this.m.EL_RarityEntry = this.new(this.IO.scriptFilenameByHash(_in.readI32()));
			this.m.EL_RarityEntry.onDeserialize(_in);
		}
	}
});

