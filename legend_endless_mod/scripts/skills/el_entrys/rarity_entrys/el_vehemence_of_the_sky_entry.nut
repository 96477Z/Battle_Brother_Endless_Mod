this.el_vehemence_of_the_sky_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.vehemence_of_the_sky";
		this.m.Name = "天穹之势(双手剑)";
		this.m.Description = "势若天倾，摧垮拉朽";//The momentum is as strong as the sky, crushing and corrupting.
		this.m.Icon = "el_entrys/el_vehemence_of_the_sky_entry.png";
		//this.m.IconMini = "el_vehemence_of_the_sky_entry_mini";
		this.m.Overlay = "el_vehemence_of_the_sky_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]必定自信[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]将全身护甲值上限的 " + this.Const.EL_Rarity_Entry.Factor.EL_VehemenceOfTheSky.ConvertArmorIntoDamagePercent * 100 +"% 转化为武器面板伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击时免费施加一次伤害为武器面板伤害" + this.Const.EL_Rarity_Entry.Factor.EL_VehemenceOfTheSky.ShieldDamageMult * 100 + "% 的“劈盾”技能，如果你拥有这个技能[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备双手剑来发挥效果[/color]"
            });
        }
		return result;
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_useFreeSplitShield(this.getContainer().getActor(), _targetEntity);
		}
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_useFreeSplitShield(this.getContainer().getActor(), _targetEntity);
		}
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			if(this.Tactical.isActive())
			{
				this.getContainer().getActor().setMoraleState(this.Const.MoraleState.Confident);
			}
			local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if(item.m.EL_EntryList.len() == 0 || item.m.EL_EntryList[item.m.EL_EntryList.len() - 1].getID() != "el_rarity_entry.vehemence_of_the_sky_subsidiary")
			{
				item.EL_addEntryToList(this.new("scripts/skills/el_entrys/rarity_entrys/el_vehemence_of_the_sky_subsidiary_entry"));
			}
		}
	}function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return true;
		}
		return false;
	}
});