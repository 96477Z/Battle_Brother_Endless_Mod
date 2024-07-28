this.el_natural_dismember_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.natural_dismember";
		this.m.Name = "庖丁解牛(双手砍刀)";
		this.m.Description = "浑然天成，熟能生巧。";//It's natural, practice makes perfect.
		this.m.Icon = "el_entrys/el_natural_dismember_entry.png";
		//this.m.IconMini = "el_natural_dismember_entry_mini";
		this.m.Overlay = "el_natural_dismember_entry";
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
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]每次攻击会使目标出现大量的伤残.[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]目标拥有的每种伤残都会提升你 " + this.Const.EL_Rarity_Entry.Factor.EL_NaturalDismember.DamageMultFactor * 100 + "%的伤害[/color]"
			},
			{
				id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击时免费施加一次“劈盾”技能，如果你拥有这个技能[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备双手砍刀来发挥效果[/color]"
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
			if(_targetEntity.getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && _targetEntity.getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
			{
				return;
			}
			local injury_num = 1.0 * _damageInflictedHitpoints / _targetEntity.getHitpointsMax() / this.Const.EL_Rarity_Entry.Factor.EL_NaturalDismember.SlightInjuryPercent;
			local injury_num_left = this.Const.EL_Config.EL_addSlightInjurysToActor(_targetEntity, injury_num, [
				this.Const.Injury.CuttingBody,
				this.Const.Injury.CuttingHead
			]);
			injury_num_left += 1.0 * _damageInflictedHitpoints / _targetEntity.getHitpointsMax() / this.Const.EL_Rarity_Entry.Factor.EL_NaturalDismember.SeriousInjuryPercent;
			this.Const.EL_Config.EL_addSeriousInjurysToActor(_targetEntity, injury_num_left, [
				this.Const.Injury.CuttingBody,
				this.Const.Injury.CuttingHead
			]);
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
			this.Const.EL_Rarity_Entry.EL_useFreeSplitShield(this.getContainer().getActor(), _targetEntity);
			local injury_num = EL_getTargetInjuryNum(_targetEntity);			
			_hitInfo.DamageRegular *= 1.0 + injury_num * this.Const.EL_Rarity_Entry.Factor.EL_NaturalDismember.DamageMultFactor;
			_hitInfo.DamageArmor *= 1.0 + injury_num * this.Const.EL_Rarity_Entry.Factor.EL_NaturalDismember.DamageMultFactor;
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

	function EL_getTargetInjuryNum(_targetEntity)
	{
		local injury_num = 0;
		local skills = _targetEntity.getSkills();
		foreach( skill in skills.m.Skills ) {
			if( skill.isType(this.Const.SkillType.Injury) ||
				skill.isType(this.Const.SkillType.PermanentInjury) ||
				skill.isType(this.Const.SkillType.TemporaryInjury) ||
				skill.isType(this.Const.SkillType.SemiInjury) )
			{
				++injury_num;
			}
        }
		return injury_num;
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Cleaver))
		{
			return true;
		}
		return false;
	}
});