this.el_heart_triumphs_over_things_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_IsExtraAttack = false
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.First;
		this.m.ID = "el_rarity_entry.heart_triumphs_over_things";
		this.m.Name = "心胜万物(徒手)";
		this.m.Description = "力不竭，战不止!心不死，神不灭!";
		this.m.Icon = "el_entrys/el_heart_triumphs_over_things_entry.png";
		this.m.Overlay = "el_heart_triumphs_over_things_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]收到攻击时根据决心消耗一定比例的疲劳值来减免100%的伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]你的攻击必定命中，并根据主动值进行额外的攻击[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]每次命中额外附加当前生命值100%的伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]疲劳恢复速度翻倍[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要双手无物才能发挥效果[/color]"
            });
        }
		else {
			result.push({
                id = 8,
                type = "text",
                text = "当前额外攻击 " + EL_getExtraAttackTime() + "次"
            });
			result.push({
                id = 8,
                type = "text",
                text = "当前额外攻击距离： " + EL_getExtraAttackRange()
            });
			result.push({
                id = 8,
                type = "text",
                text = "每点疲劳可减免 " + EL_getBraveryConvertMult() + "点伤害"
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
		if (skill.getID() != "actives.hand_to_hand" && skill.getID() != "actives.legend_choke" && skill.getID() != "actives.legend_unarmed_lunge"
		 && skill.getID() != "actives.legend_grapple" && skill.getID() != "actives.legend_kick")
		{
			return;
		}
		if (EL_isUsable())
		{
			local hit_info = clone this.Const.Tactical.HitInfo;
			hit_info.DamageRegular = this.getContainer().getActor().getHitpoints() / this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ExtraDamageHitpointsCiv;
			hit_info.DamageDirect = 1.0;
			hit_info.BodyPart = _bodyPart;
            _targetEntity.onDamageReceived(this.getContainer().getActor(), this, hit_info);
			if(!this.m.EL_IsExtraAttack)
			{
				local attack_time = EL_getExtraAttackTime();
				while(attack_time)
				{
					if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
					{
						return;
					}
					local actor = this.getContainer().getActor();
					if (actor.getFatigue() + _skill.getFatigueCost() > actor.getFatigueMax())
					{
						return;
					}
					this.m.EL_IsExtraAttack = true;
					_skill.useForFree(_targetEntity.getTile());
					actor.setFatigue(actor.getFatigue() + _skill.getFatigueCost());
					this.m.EL_IsExtraAttack = false;
					--attack_time;
				}
			}
		}
	}

    function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
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
			local fatigue_cost = (damage + armorDamage) * (1.0 - this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ReceivedDamageMult) / EL_getBraveryConvertMult();
			if(fatigue_cost <= this.getContainer().getActor().getFatigueMax() - this.getContainer().getActor().getFatigue())
			{
				this.getContainer().getActor().m.Fatigue += fatigue_cost;
            	_properties.DamageReceivedTotalMult = this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ReceivedDamageMult;
			}
        }
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			local extra_attack_range = EL_getExtraAttackRange();
			local skills = this.getContainer().getActor().getSkills().m.Skills;
            foreach( skill in skills )
            {
                if (skill.getID() == "actives.hand_to_hand" || skill.getID() == "actives.legend_choke" || skill.getID() == "actives.legend_unarmed_lunge"
				 || skill.getID() == "actives.legend_grapple" || skill.getID() == "actives.legend_kick")
                {
                    skill.m.MaxRange += extra_attack_range;
					skill.m.IsUsingHitchance = false;
                }
            }
		}
	}

	function EL_getExtraAttackRange()
	{
		local bravery = this.getContainer().getActor().getInitiative() - this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ExtraAttackRangeBraveryoffset;
		local bravery_need = this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ExtraAttackRangeBraveryNeed;
		local bonus = 0;
		while(bravery >= bravery_need)
		{
			++bonus;
			bravery -= bravery_need;
			bravery_need += this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ExtraAttackRangeBraveryNeed;
		}
		return bonus;
	}

	function EL_getBraveryConvertMult()
	{
		return this.Math.max(0, this.getContainer().getActor().getBravery() / this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ReceivedDamageBraveryMult);
	}

	function EL_getExtraAttackTime()
	{
		return this.Math.max(0, this.Math.floor(this.getContainer().getActor().getInitiative() / this.Const.EL_Rarity_Entry.Factor.EL_HeartTriumphsOverThings.ExtraAttackRangeBraveryoffset));
	}

	function onTurnStart()
	{
		if (EL_isUsable())
		{
			local actor = this.getContainer().getActor();
			local bonus = actor.getCurrentProperties().Stamina;
			actor.m.Fatigue -= this.Math.floor(bonus / this.Const.EL_PlayerNPC.EL_ExtraFatigueRecovery.DivFactor + this.Const.EL_PlayerNPC.EL_ExtraFatigueRecovery.Offset);
			if(actor.m.Fatigue < 0) {
				actor.m.Fatigue = 0;
			}
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
		local item1 = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local item2 = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		if (item1 == null && item2 == null)
		{
			return true;
		}
		return false;
	}
});