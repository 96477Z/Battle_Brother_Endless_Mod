this.el_bloody_cutting_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.bloody_cutting";
		this.m.Name = "血腥切割(单手砍刀)";
		this.m.Description = "这炙热的鲜血，让我如此的陶醉";//The scorching blood makes me so intoxicated.
		this.m.Icon = "el_entrys/el_bloody_cutting_entry.png";
		//this.m.IconMini = "el_bloody_cutting_entry_mini";
		this.m.Overlay = "el_bloody_cutting_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时额外造成一次等同于目标已损失状态" + this.Const.EL_Rarity_Entry.Factor.EL_BloodyCutting.TargetHealthLossExtraDamageMultFactor * 100 + "%的额外伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]额外附加等量于造成血量伤害比例的“血意诅咒（护甲血量同时流失）”效果[/color]"
			}
        ]
		if (!EL_isUsable())
		{  result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备单手砍刀来发挥效果[/color]"
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
			local bleeding_damage = (this.Const.EL_Rarity_Entry.Factor.EL_BloodyCutting.BleedingFactor * _damageInflictedHitpoints) / _targetEntity.getHitpointsMax() * 100;
			//this.logInfo("base bleeding_damage:" +bleeding_damage);
			local actor = this.getContainer().getActor();
			local effect = this.new("scripts/skills/el_effects/el_bleeding_effect");
			
			effect.setActor(actor);
			effect.setDamage(bleeding_damage);
			effect.EL_setBodyPart(_bodyPart);
			_targetEntity.getSkills().add(effect);
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
			local is_able_to_die = _targetEntity.m.IsAbleToDie;
			_targetEntity.m.IsAbleToDie = false;
            local hit_info = clone this.Const.Tactical.HitInfo;
            hit_info.DamageArmor = (_targetEntity.getArmorMax(_hitInfo.BodyPart) - _targetEntity.getArmor(_hitInfo.BodyPart)) * this.Const.EL_Rarity_Entry.Factor.EL_BloodyCutting.TargetHealthLossExtraDamageMultFactor;
            hit_info.DamageRegular = (_targetEntity.getHitpointsMax() - _targetEntity.getHitpoints()) * this.Const.EL_Rarity_Entry.Factor.EL_BloodyCutting.TargetHealthLossExtraDamageMultFactor;
            hit_info.DamageDirect = 1.0;
            hit_info.BodyPart = _hitInfo.BodyPart;
            _targetEntity.onDamageReceived(this.getContainer().getActor(), this, hit_info);
			_targetEntity.m.IsAbleToDie = is_able_to_die;
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
		if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Cleaver))
		{
			return true;
		}
		return false;
	}
});

