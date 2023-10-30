this.el_master_feat_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_IsRetaliate = false,
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.master_feat";
		this.m.Name = "宗师技艺(单手剑)";
		this.m.Description = "游刃有余";
		this.m.Icon = "el_entrys/el_master_feat_entry.png";
		//this.m.IconMini = "el_master_feat_entry_mini";
		this.m.Overlay = "el_master_feat_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]忽视来自你射程之外敌人的攻击[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]被射程内敌人攻击时100%反击.[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]根据你和目标的主动值之差，获得额外的命中率，闪避率和伤害加成[/color]"
			}
        ]
		if (!EL_isUsable())
        {
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备单手剑来发挥效果[/color]"
            });
        }
		return result;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (EL_isUsable())
        {
		    EL_attackBack(_attacker);
        }
	}

	function onMissed( _attacker, _skill )
	{
		if (EL_isUsable())
        {
		    EL_attackBack(_attacker);
        }
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_ReplaceSkill(this.getContainer().getActor(), this.m.EL_replacedSkills, this.Const.EL_Rarity_Entry.Factor.EL_MasterFeat.ReplaceSkillList);
		}
		else
		{
			this.m.EL_replacedSkills.clear();
		}
	}

	function onRemoved()
	{
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity != null && _skill.m.IsWeaponSkill && EL_isUsable())
		{
            local user = this.getContainer().getActor();
            local bonus = this.Math.max(0, user.getInitiative() - _targetEntity.getInitiative());
            //this.logInfo("before skill:"+_properties.MeleeSkill);
            //this.logInfo("before damage_mult:"+_properties.DamageTotalMult);
			_properties.MeleeSkill += bonus * this.Const.EL_Rarity_Entry.Factor.EL_MasterFeat.MeleeSkillFactor;
			_properties.DamageTotalMult *= (1.0 + bonus * this.Const.EL_Rarity_Entry.Factor.EL_MasterFeat.DamageMultFactor);
           // this.logInfo("after skill:"+_properties.MeleeSkill);
            //this.logInfo("after damage_mult:"+_properties.DamageTotalMult);
		}
	}

    function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
    {
        if (EL_isUsable())
        {
            local user = this.getContainer().getActor();
			local distance = _attacker.getTile().getDistanceTo(user.getTile());
			local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if(distance > item.getRangeMax())
            {
                _properties.DamageReceivedTotalMult = 0;
            }
        }
    }

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if(_attacker == null && _attacker.isAlive() && !_attacker.isAlliedWith(actor)) {
			return;
		}
		if (EL_isUsable())
        {
            local user = this.getContainer().getActor();
            local bonus = this.Math.max(0, user.getInitiative() - _attacker.getInitiative());
            //this.logInfo("before defense:"+_properties.MeleeDefense + "::"+_properties.RangedDefense);
			_properties.MeleeDefense += bonus * this.Const.EL_Rarity_Entry.Factor.EL_MasterFeat.MeleeDefenseFactor;
			_properties.RangedDefense += bonus * this.Const.EL_Rarity_Entry.Factor.EL_MasterFeat.RangedDefenseFactor;
            //this.logInfo("after defense:"+_properties.MeleeDefense + "::"+_properties.RangedDefense);
        }
	}

	function EL_attackBack( _attacker ) 
	{
		if(this.m.EL_IsRetaliate)
		{
			return;
		}
		if(_attacker == null && _attacker.isAlive() && !_attacker.isAlliedWith(actor)) {
			return;
		}
		local actor = this.getContainer().getActor();
		if(actor.getSkills().hasSkill("effects.stunned") || actor.getCurrentProperties().IsStunned)
		{
			return;
		}
        local skill = this.Const.EL_Rarity_Entry.EL_getAttackSkill(actor);
		if(skill.getMaxRange() < _attacker.getTile().getDistanceTo(actor.getTile()))
		{
			return;
		}
		this.m.EL_IsRetaliate = true;
        skill.useForFree(_attacker.getTile());
		this.m.EL_IsRetaliate = false;
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return true;
		}
		return false;
	}
});

