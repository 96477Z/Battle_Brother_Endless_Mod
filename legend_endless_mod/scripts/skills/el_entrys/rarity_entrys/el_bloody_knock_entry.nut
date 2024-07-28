this.el_bloody_knock_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.bloody_knock";
		this.m.Name = "迎头痛击(双手连枷)";
		this.m.Description = "让他们的脑袋像西瓜一样炸开 Waghghghghghghghghgh!!!";
		this.m.Icon = "el_entrys/el_bloody_knock_entry.png";
		//this.m.IconMini = "el_bloody_knock_entry_mini";
		this.m.Overlay = "el_bloody_knock_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时100%造成眩晕和茫然[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]必定爆头[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]如果目标没有头盔，造成" + this.Const.EL_Rarity_Entry.Factor.EL_BloodyKnock.DamageMult + "倍伤害[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]否则, 对目标造成“严重脑震荡”[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备双手连枷来发挥效果[/color]"
            });
        }
		return result;
	}
    
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
            _targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
            _targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));
		}
	}
	
	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
        if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
			_hitInfo.BodyPart = this.Const.BodyPart.Head;
			_hitInfo.BodyDamageMult *= this.Const.EL_Rarity_Entry.Factor.EL_EyeOfDeath.HitHeadMult;
			local helmet = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
            if(helmet == null || helmet.getCondition() == 0)
            {
                _hitInfo.DamageArmor *= this.Const.EL_Rarity_Entry.Factor.EL_BloodyKnock.DamageMult;
				_hitInfo.DamageRegular *= this.Const.EL_Rarity_Entry.Factor.EL_BloodyKnock.DamageMult;
            }
			else
			{
                _targetEntity.getSkills().add(this.new("scripts/skills/injury/severe_concussion_injury"));
			}
		}
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Flail))
		{
			return true;
		}
		return false;
	}
});

