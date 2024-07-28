this.el_legendary_prestige_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.legendary_prestige";
		this.m.Name = "传奇威仪(野兽)";
		this.m.Description = "生命形态产生了蜕变，举手投足皆带来大恐怖。";
		this.m.Icon = "el_entrys/el_legendary_prestige_entry.png";
		//this.m.IconMini = "el_legendary_prestige_entry_mini";
		this.m.Overlay = "el_legendary_prestige_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]血量 + 200%[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]双攻双防 + 100[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]决心 + 100[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]主动值 + 500[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]疲劳 + 500[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]造成伤害翻倍，收到伤害减半。[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]战斗等级 + 10。[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]行动点 + 3。[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]免疫强制位移。[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]当前无法生效。[/color]"
            });
        }
		return result;
	}
    
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying()  || _targetEntity.getCurrentProperties().IsImmuneToBleeding || !this.Tactical.TurnSequenceBar.isActiveEntity(this.getContainer().getActor()))
		{
			return;
		}
		if (EL_isUsable())
		{
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_dazed_effect"));
		}
	}

	function onUpdate( _properties )
	{
		if (EL_isUsable())
		{
			_properties.Initiative += 500;
			_properties.Stamina += 500;
			_properties.Bravery += 100;
			_properties.MeleeSkill += 100;
			_properties.RangedSkill += 100;
			_properties.MeleeDefense += 100;
			_properties.RangedDefense += 100;
			_properties.ActionPoint += 3;
			_properties.EL_CombatLevel += 10;
			_properties.Hitpoints += 2 * this.getContainer().getActor().getBaseProperties().Hitpoints;

			_properties.DamageTotalMult *= 2;
			_properties.DamageReceivedTotalMult *= 0.5;
			
            _properties.IsImmuneToKnockBackAndGrab = true;
            _properties.IsImmuneToRotation = true;
		}
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
		if (item != null && item.getID() == "el_accessory.core")
		{
			return true;
		}
		return false;
	}
});

