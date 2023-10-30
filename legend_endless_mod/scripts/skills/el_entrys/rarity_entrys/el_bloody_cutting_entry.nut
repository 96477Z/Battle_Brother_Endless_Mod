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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]目标已损失生命值的" + this.Const.EL_Rarity_Entry.Factor.EL_BloodyCutting.TargetHealthLossExtraDamageMultFactor * 100 + "%会转化为你的攻击伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]额外附加等量于造成血量伤害比例的流血效果[/color]"
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
			local effect = this.new("scripts/skills/effects/bleeding_effect");
			
			effect.setActor(actor);
			effect.setDamage(bleeding_damage);
			_targetEntity.getSkills().add(effect);

			if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " made a particularly Bloody Cut inflicting additional Bleeding on " + this.Const.UI.getColorizedEntityName(_targetEntity));
			}
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
			_hitInfo.DamageRegular += (_targetEntity.getHitpointsMax() - _targetEntity.getHitpoints()) * this.Const.EL_Rarity_Entry.Factor.EL_BloodyCutting.TargetHealthLossExtraDamageMultFactor;
		}
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Cleaver))
		{
			return true;
		}
		return false;
	}
});

