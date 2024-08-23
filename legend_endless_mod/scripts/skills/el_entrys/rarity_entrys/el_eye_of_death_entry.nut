this.el_eye_of_death_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.eye_of_death";
		this.m.Name = "死亡之眼(弩)";
		this.m.Description = "死亡凝视着你的敌人"
		this.m.Icon = "el_entrys/el_eye_of_death_entry.png";
		//this.m.IconMini = "el_eye_of_death_entry_mini";
		this.m.Overlay = "el_eye_of_death_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]不再需要装填和消耗弹药[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]造成伤害无视护甲[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时100%击中头部[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]爆头伤害提升为" + this.Const.EL_Rarity_Entry.Factor.EL_EyeOfDeath.HitHeadMult + "倍[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备弩来发挥效果[/color]"
            });
        }
		return result;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity != null && _skill.m.IsWeaponSkill && EL_isUsable())
		{
			_properties.IsIgnoringArmorOnAttack = true;
			_properties.DamageArmorMult = 0.0;
			_properties.HitChanceMult[this.Const.BodyPart.Head] = 100.0;
			_properties.HitChanceMult[this.Const.BodyPart.Body] = 0.0;
			_properties.DamageTotalMult *= /*0.5;*/this.Const.EL_Rarity_Entry.Factor.EL_EyeOfDeath.HitHeadMult;
		}
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).setLoaded(true);
			this.getContainer().removeByID("actives.reload_bolt");
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
			return false;
		}
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Crossbow))
		{
			return true;
		}
		return false;
	}
});

