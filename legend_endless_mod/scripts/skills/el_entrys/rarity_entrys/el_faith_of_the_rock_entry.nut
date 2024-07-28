this.el_faith_of_the_rock_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.faith_of_the_rock";
		this.m.Name = "磐石之信(盾牌)";
		this.m.Description = "聚集敌意，高塔般的守护者，抵抗一切";//Accumulating Hostility,Towering Protector, Resistant to All.
		this.m.Icon = "el_entrys/el_faith_of_the_rock_entry.png";
		//this.m.IconMini = "el_faith_of_the_rock_entry_mini";
		this.m.Overlay = "el_faith_of_the_rock_entry";
		this.m.Type = this.Const.SkillType.StatusEffect;
	}

	function getTooltip()
	{
        local result = [
            {
				id = 1,
				type = "title",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare] + "]" + this.getName() + "[/color]"
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]人物仇恨值提升为10000倍[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]盾牌永不磨损[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]回合开始时自动释放“盾墙”技能[/color]"
			},
			{
				id = 6,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]免疫一切负面效果[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备盾牌来发挥效果[/color]"
            });
        }
		return result;
	}

	function onUpdate( _properties )
	{
		if (EL_isUsable())
		{
            _properties.TargetAttractionMult *= this.Const.EL_Rarity_Entry.Factor.EL_FaithOfTheRock.TargetAttractionMult;
            _properties.IsImmuneToOverwhelm = true;
            _properties.IsImmuneToStun = true;
            _properties.IsImmuneToDaze = true;
            _properties.IsImmuneToRoot = true;
            _properties.IsImmuneToKnockBackAndGrab = true;
            _properties.IsImmuneToRotation = true;
            _properties.IsImmuneToDisarm = true;
            _properties.IsImmuneToSurrounding = true;
            _properties.IsImmuneToBleeding = true;
            _properties.IsImmuneToPoison = true;
            _properties.IsImmuneToDamageReflection = true;
            _properties.IsImmuneToFire = true;
            _properties.IsResistantToAnyStatuses = true;
            _properties.IsResistantToPhysicalStatuses = true;
            _properties.IsResistantToMiasma = true;
		}
	}

	function onTurnStart()
	{
		if (EL_isUsable())
		{
			this.m.Container.add(this.new("scripts/skills/effects/shieldwall_effect"));
		}
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.Shield))
		{
			return true;
		}
		return false;
	}
});

