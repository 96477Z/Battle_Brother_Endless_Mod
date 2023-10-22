this.el_unbreakable_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_Attacker = null,
		EL_MaxTotalDamage = 0.0,
		EL_IsReceiveDamage = false,
		EL_MaxDamageHitInfo = {}
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.unbreakable";
		this.m.Name = "Unbreakable(One-Handed Hammer)";
		this.m.Description = "Like an iron tower, standing still.";//身如铁塔，屹立不倒
		this.m.Icon = "el_entrys/el_unbreakable_entry.png";
		//this.m.IconMini = "el_master_feat_entry_mini";
		this.m.Overlay = "el_unbreakable_entry";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.EL_MaxDamageHitInfo = clone this.Const.Tactical.HitInfo;
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Automatically release Indomitable at the beginning of each turn.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Take only one damage per turn, taking the maximum value of all single damage received in this turn.[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]You need to equip Hammer to take effect.[/color]"
            });
        }
		return result;
	}

    function onBeforeDamageReceived( _EL_Attacker, _skill, _hitInfo, _properties )
    {
		if (EL_isUsable())
        {
			local armor = 0;
			local armorDamage = 0;
			if (_hitInfo.DamageDirect < 1.0)
			{
				armor = _properties.Armor[_hitInfo.BodyPart] * _properties.ArmorMult[_hitInfo.BodyPart];
				armorDamage = this.Math.min(armor, _hitInfo.DamageArmor);
			}
			local damage = this.Math.maxf(0.0, _hitInfo.DamageRegular * _hitInfo.DamageDirect * _properties.DamageReceivedDirectMult - armor * this.Const.Combat.ArmorDirectDamageMitigationMult);
			if (armor <= 0 || _hitInfo.DamageDirect >= 1.0)
			{
				damage = damage + this.Math.max(0, _hitInfo.DamageRegular * this.Math.maxf(0.0, 1.0 - _hitInfo.DamageDirect * _properties.DamageReceivedDirectMult) - armorDamage);
			}
			damage = damage * _hitInfo.BodyDamageMult;
			damage = this.Math.max(0, this.Math.max(this.Math.round(damage), this.Math.min(this.Math.round(_hitInfo.DamageMinimum), this.Math.round(_hitInfo.DamageMinimum * _properties.DamageReceivedTotalMult))));
		
			if(!this.m.EL_IsReceiveDamage)
			{
				if(damage + armorDamage > this.m.EL_MaxTotalDamage)
				{
					this.m.EL_MaxDamageHitInfo = clone _hitInfo;
					//this.logInfo("copy_hitInfo.s DamageArmor:" + this.m.EL_MaxDamageHitInfo.DamageArmor);
					//this.logInfo("copy_hitInfo.s DamageRegular:" + this.m.EL_MaxDamageHitInfo.DamageRegular);
					this.m.EL_Attacker = _EL_Attacker;
					//this.logInfo("this.m.EL_Attacker" + this.m.EL_Attacker.getName());
					this.m.EL_MaxTotalDamage = damage + armorDamage;
				}
				//this.logInfo("this.m.EL_MaxTotalDamage:"+this.m.EL_MaxTotalDamage);
            	_properties.DamageReceivedTotalMult = 0;
			}
        }
	}

	function onTurnStart()
	{
		if (EL_isUsable())
		{
			this.m.Container.add(this.new("scripts/skills/effects/indomitable_effect"));
			this.m.EL_IsReceiveDamage = true;
			if(this.m.EL_Attacker != null)
			{
				//this.logInfo("HitInfo.s DamageArmor:" + this.m.EL_MaxDamageHitInfo.DamageArmor);
				//this.logInfo("HitInfo.s DamageRegular:" + this.m.EL_MaxDamageHitInfo.DamageRegular);
                this.getContainer().getActor().onDamageReceived(this.m.EL_Attacker, this, this.m.EL_MaxDamageHitInfo);
			}
			this.m.EL_IsReceiveDamage = false;
			this.m.EL_Attacker = null;
			this.m.EL_MaxTotalDamage = 0.0;
			this.m.EL_MaxDamageHitInfo = clone this.Const.Tactical.HitInfo;
		}
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer))
		{
			return true;
		}
		return false;
	}
});
