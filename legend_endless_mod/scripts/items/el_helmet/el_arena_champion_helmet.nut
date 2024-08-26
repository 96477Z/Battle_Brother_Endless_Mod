this.el_arena_champion_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "el_helmet.arena_champion";
		this.m.Name = "冠军战盔";
		this.m.Description = "竞技场冠军的证明。";
		this.m.SlotType = this.Const.ItemSlot.Head;
		this.m.IsDroppedAsLoot = true;
		this.m.IsIndestructible = true;
		this.m.ShowOnCharacter = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.VariantString = "helmet_southern_named";
		this.m.Variant = 2;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 0;
		this.m.Condition = 350 * 2;
		this.m.ConditionMax = 350 * 2;
		this.m.StaminaModifier = -15;
		this.m.Vision = -2;
		this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
	}

	function updateVariant()
	{
		this.helmet.updateVariant();
		this.m.Icon = "helmets/arena_champion_helmet.png";
	}

	function getTooltip()
	{
		local result = this.helmet.getTooltip();
		for(local i = 0; i < result.len(); ++i)
		{
			if(result[i].type == "text" && result[i].text == "——————————————")
			{
				result.insert(i, {
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "护甲存在时免疫头部穿甲伤害。"
				});
				return result;
			}
		}
		return result;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		this.helmet.onBeforeDamageReceived(_attacker, _skill, _hitInfo, _properties);
		if (_hitInfo.BodyPart == this.Const.BodyPart.Head && this.getArmor() != 0)
		{
			_properties.DamageReceivedDirectMult = 0;
		}
	}

});
