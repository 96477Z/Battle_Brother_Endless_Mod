this.el_have_talent_ambition_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "el_accessory.have_talent_ambition";
		this.m.Name = "规则碎片：潜能";
		this.m.Description = "";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = "accessory/el_have_talent_ambition_item.png";
		this.m.Icon = "accessory/el_have_talent_ambition_item.png";
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
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]所有兄弟加点属性提升时必定提升最大值。[/color]"
		});
		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary] + "]装备者根据团队总星数增加全属性，当前+" + EL_getBonus() + "[/color]"
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
		_properties.Hitpoints += this.Math.floor(this.EL_getBonus() * 0.01 * this.getContainer().getActor().getBaseProperties().Hitpoints);
		_properties.Bravery += this.EL_getBonus();
		_properties.Initiative += this.EL_getBonus();
		_properties.Stamina += this.EL_getBonus();
		_properties.MeleeSkill += this.EL_getBonus();
		_properties.RangedSkill += this.EL_getBonus();
		_properties.MeleeDefense += this.EL_getBonus();
		_properties.RangedDefense += this.EL_getBonus();
	}

	function onAddedToStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasTalentAmbitionRule", true);
			this.logInfo("true");
		}
	}

	function onRemovedFromStash( _stashID )
	{
		if (_stashID == "player")
		{
			this.World.Flags.set("EL_HasTalentAmbitionRule", false);
			this.logInfo("false");
		}
	}

	function EL_getBonus()
	{
        local talent_number = 0;
		local roster = this.World.getPlayerRoster().getAll();
		foreach( bro in roster )
		{
			foreach( t in bro.getTalents() )
			{
				talent_number += t;
			}
		}
        local need_factor = 10;
        local need_account = need_factor;
        local bonus = 0;
        local bonus_factor = 1;
        while(talent_number >= need_account) {
            talent_number -= need_account;
            need_account += need_factor;
            bonus += bonus_factor;
        }
        return bonus;
	}

});
