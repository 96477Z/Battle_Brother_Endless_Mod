this.el_win_arena_fights_ambition_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "el_accessory.win_arena_fights_ambition";
		this.m.Name = "规则碎片：竞技";
		this.m.Description = "";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "accessory/el_win_arena_fights_ambition_item.png";
		this.m.Icon = "accessory/el_win_arena_fights_ambition_item.png";
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
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]战斗开始时所有友军强制自信。[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]装备者根据当前竞技场胜利次数增加双攻双防，当前+" + EL_getBonus() + "[/color]"
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
		_properties.MeleeSkill += this.EL_getBonus();
		_properties.RangedSkill += this.EL_getBonus();
		_properties.MeleeDefense += this.EL_getBonus();
		_properties.RangedDefense += this.EL_getBonus();
	}

	function onAddedToStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasWinArenaFightsAmbitionRule", true);
		}
	}

	function onRemovedFromStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasWinArenaFightsAmbitionRule", false);
		}
	}

	function EL_getBonus()
	{
        local win_account = this.World.Statistics.getFlags().getAsInt("ArenaFightsWon");
        local need_factor = 1;
        local need_account = need_factor;
        local bonus = 0;
        local bonus_factor = 1;
        while(win_account >= need_account) {
            win_account -= need_account;
            need_account += need_factor;
            bonus += bonus_factor;
        }
        return bonus;
	}
});
