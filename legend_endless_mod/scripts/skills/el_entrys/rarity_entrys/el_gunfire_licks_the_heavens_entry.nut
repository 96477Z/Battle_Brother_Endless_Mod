this.el_gunfire_licks_the_heavens_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.gunfire_licks_the_heavens";
		this.m.Name = "炮火连天(火炮)";
		this.m.Description = "炮火在喧嚣，时代在变化"//The gunfire is noisy, the times are changing.
		this.m.Icon = "el_entrys/el_gunfire_licks_the_heavens_entry.png";
		//this.m.IconMini = "el_gunfire_licks_the_heavens_entry_mini";
		this.m.Overlay = "el_gunfire_licks_the_heavens_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]基础爆炸范围提升为原来的 " + this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.ExplosionRangeMult + " 倍[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时触发一次士气降低判定[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备火炮来发挥效果[/color]"
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
			_targetEntity.checkMorale(-1, this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.CheckMoraleOffset);
		}
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).setLoaded(true);
			this.getContainer().removeByID("actives.reload_handgonne");
		}
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Firearm))
		{
			return true;
		}
		return false;
	}
});

