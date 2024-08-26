this.el_taelia_present_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "el_accessory.taelia_present";
		this.m.Name = "泰莉亚的礼物";
		this.m.Description = "来自伯瓦尔女儿的礼物，是他在这个新世界为数不多的回忆，也是他人性的锚点。为此他加装了一个来历不明的骷髅装饰用于保护这最后的念想。";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.ShowOnCharacter = false;
		this.m.IsDroppedAsLoot = false;
		this.m.IconLarge = "accessory/taelia_present.png";
		this.m.Icon = "accessory/taelia_present.png";
		this.m.AddGenericSkill = true;
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
			id = 9,
			type = "text",
			icon = "ui/icons/bag.png",
			text = "提供 [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(this.Const.EL_LichKing.Accessory.StashModifier[this.EL_getRankLevel()] * 
					(1 + this.EL_getLevel() * this.Const.EL_LichKing.Accessory.StashModifierLevelFactor)) + "[/color] 仓库容量。"
		});
		if(this.Math.floor(this.EL_getRankLevel() * this.Const.EL_LichKing.Accessory.BraveryRankFactor * this.EL_getLevel() * this.Const.EL_LichKing.Accessory.BraveryLevelFactor))
		{
			result.push({
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(this.EL_getRankLevel() * this.Const.EL_LichKing.Accessory.BraveryRankFactor * 
																			  this.EL_getLevel() * this.Const.EL_LichKing.Accessory.BraveryLevelFactor) + "[/color] Resolve"
			});
		}
		result.push({
			id = 11,
			type = "text",
			icon = "ui/tooltips/soul_energy.png",
			text = "灵魂能量：" + this.World.Assets.EL_getSoulEnergy() + " / " + this.World.Assets.EL_getSoulEnergyMax()
		});
		result.push({
			id = 66,
                icon = "ui/icons/special.png",
			type = "text",
			text = "伯瓦尔的其他装备等级与等阶不得超过此物的等级与等阶"
		});
		return result;
	}

	function getStashModifier()
	{
		return this.Math.floor(this.Const.EL_LichKing.Accessory.StashModifier[this.EL_getRankLevel()] * 
								(1 + this.EL_getLevel() * this.Const.EL_LichKing.Accessory.StashModifierLevelFactor));
	}

	function EL_upgradeLevel()
	{
		this.accessory.EL_upgradeLevel();
		this.World.State.getPlayer().calculateStashModifier();
	}

	function EL_upgradeRank()
	{
		this.accessory.EL_upgradeRank();
		this.World.State.getPlayer().calculateStashModifier();
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);
		_properties.Bravery += this.Math.floor(this.EL_getRankLevel() * this.Const.EL_LichKing.Accessory.BraveryRankFactor * 
												this.EL_getLevel() * this.Const.EL_LichKing.Accessory.BraveryLevelFactor);
	}

    function EL_disassemble(_itemIndex)
    {
    }

	function EL_getUpgradeLevelSoulEnergy()
	{
		return (1 + this.EL_getLevel()) * this.Const.EL_LichKing.SoulEnergy.UpgradeLevelConsumptionFactor;
	}

	function EL_getUpgradeRankSoulEnergy()
	{
		return this.EL_getRankLevel() == this.EL_getRankLevelMax() ? 200 : this.Math.max((this.EL_getRankLevel() + 1)* this.Const.EL_LichKing.SoulEnergy.UpgradeRankConsumptionFactor, this.World.Assets.m.EL_SoulEnergy);
	}

	function EL_getRecraftSoulEnergy()
	{
		return this.Const.EL_LichKing.SoulEnergy.RecraftConsumption * (this.EL_getRankLevel() + 1);
	}
});

