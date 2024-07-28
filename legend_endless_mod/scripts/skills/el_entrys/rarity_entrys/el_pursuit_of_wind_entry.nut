this.el_pursuit_of_wind_entry <- this.inherit("scripts/skills/skill", {
	m = {
        EL_IsComboAttack = false,
		EL_ExtraAttackTimes = 3
    },
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.pursuit_of_wind";
		this.m.Name = "风之追索(弓)";
		this.m.Description = "风是你的伙伴，萦绕在你的战弓旁，辅助你进行战斗"
		this.m.Icon = "el_entrys/el_pursuit_of_wind_entry.png";
		//this.m.IconMini = "el_pursuit_of_wind_entry_mini";
		this.m.Overlay = "el_pursuit_of_wind_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]不再消耗弹药[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击必定命中，拥有无限的射程[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]每次射击连发3根伤害为" + this.Const.EL_Rarity_Entry.Factor.EL_PursuitOfWind.DamageMult * 100 + "%的箭[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备弓来发挥效果[/color]"
            });
        }
		return result;
	}

	// function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	// {
    //     if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
	// 	{
	// 		this.m.EL_IsComboAttack = false;
	// 		this.m.EL_ExtraAttackTimes = 3;
	// 		return;
	// 	}
	// 	if (EL_isUsable() && _skill.m.IsWeaponSkill)
	// 	{
	// 		EL_comboAttack(_skill, _targetEntity);
	// 	}
	// }

	// function onTargetMissed( _skill, _targetEntity )
	// {
    //     if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
	// 	{
	// 		this.m.EL_IsComboAttack = false;
	// 		this.m.EL_ExtraAttackTimes = 3;
	// 		return;
	// 	}
	// 	if (EL_isUsable() && _skill.m.IsWeaponSkill)
	// 	{
	// 		EL_comboAttack(_skill, _targetEntity);
	// 	}
	// }
	function EL_onOtherSkillUesd( _skill, _targetEntity )
	{
        if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			this.m.EL_IsComboAttack = false;
			this.m.EL_ExtraAttackTimes = 3;
			return;
		}
		if (EL_isUsable() && _skill.m.IsWeaponSkill)
		{
			EL_comboAttack(_skill, _targetEntity);
		}
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			//_properties.Vision = 10000;
			_properties.DamageTotalMult *= this.Const.EL_Rarity_Entry.Factor.EL_PursuitOfWind.DamageMult;
			local skills = this.getContainer().getActor().getSkills().m.Skills;
            foreach( skill in skills )
            {
                if (skill.m.IsWeaponSkill || skill.getID() == "actives.legend_cascade")
                {
                    skill.m.MaxRange = 10000;
					skill.m.IsUsingHitchance = false;
                }
            }
		}
	}

    function onCombatStarted()
    {
        this.m.EL_IsComboAttack = false;
		this.m.EL_ExtraAttackTimes = 3;
    }

	function EL_comboAttack( _skill, _targetEntity )
	{
		if(!this.m.EL_IsComboAttack)
		{
			this.m.EL_IsComboAttack = true;
			_skill.useForFree(_targetEntity.getTile());
			if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
			{
				this.m.EL_IsComboAttack = false;
				this.m.EL_ExtraAttackTimes = 3;
				return;
			}
			_skill.useForFree(_targetEntity.getTile());
		}
		--this.m.EL_ExtraAttackTimes;
		if(this.m.EL_ExtraAttackTimes == 0)
		{
			this.m.EL_IsComboAttack = false;
			this.m.EL_ExtraAttackTimes = 3;
		}
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Bow))
		{
			return true;
		}
		return false;
	}
});

