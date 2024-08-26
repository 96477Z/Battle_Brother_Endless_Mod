this.el_arena_champion_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "el_armor.arena_champion";
		this.m.Name = "冠军战甲";
		this.m.Description = "竞技场冠军的证明。";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IsIndestructible = true;
		this.m.Variant = 100;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 0;
		this.m.Condition = 350 * 2;
		this.m.ConditionMax = 350 * 2;
		this.m.StaminaModifier = -25;
		this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
	}

	function updateVariant()
	{
		this.armor.updateVariant();
		this.m.IconLarge = "armor/arena_champion_armor.png";
		this.m.Icon = "armor/icon_arena_champion_armor.png";
	}

	function getTooltip()
	{
		local result = this.armor.getTooltip();
		for(local i = 0; i < result.len(); ++i)
		{
			if(result[i].type == "text" && result[i].text == "——————————————")
			{
				result.insert(i, {
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "护甲存在时免疫身体穿甲伤害。"
				});
				return result;
			}
		}
		return result;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		this.armor.onBeforeDamageReceived(_attacker, _skill, _hitInfo, _properties);
		if (_hitInfo.BodyPart == this.Const.BodyPart.Body && this.getArmor() != 0)
		{
			_properties.DamageReceivedDirectMult = 0;
		}
	}

});
