this.el_devastate_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.devastate";
		this.m.Name = "Devestate(Two-Handed Hammer)";
		this.m.Description = "Armor? Shield? The weak enemies who rely on those things will be mercilessly crushed.";//盔甲？盾牌？依赖那些东西的软弱敌人将会被毫不留情的粉碎
		this.m.Icon = "el_entrys/el_devastate_entry.png";
		//this.m.IconMini = "el_devastate_entry_mini";
		this.m.Overlay = "el_devastate_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Merge and strengthen skills.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Deals additional health damage equivalent to " + this.Const.EL_Rarity_Entry.Factor.EL_Devastate.HealthDamageMult * 100 +"% of armor damage.[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Cause " + this.Const.EL_Rarity_Entry.Factor.EL_Devastate.InjuryNum + " slight injury to the base, and for each missing piece of armor, cause 1 additional slight injury.[/color]"
			},
			{
				id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Release a free split shield during the attack, deals " + this.Const.EL_Rarity_Entry.Factor.EL_Devastate.ShieldDamageMult * 100 + "% damage.[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]You need to equip Two-Handed Hammer to take effect.[/color]"
            });
        }
		return result;
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
		}
	}
    
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
            local hit_info = clone this.Const.Tactical.HitInfo;
            hit_info.DamageRegular = _damageInflictedArmor * this.Const.EL_Rarity_Entry.Factor.EL_Devastate.HealthDamageMult;
            hit_info.DamageDirect = 1.0;
            hit_info.BodyPart = _bodyPart;
            _targetEntity.onDamageReceived(this.getContainer().getActor(), this, hit_info);

            local injury_num = this.Const.EL_Rarity_Entry.Factor.EL_Devastate.InjuryNum;
            local body = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            local head = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
            if(body == null || body.getCondition() == 0)
            {
                ++injury_num;
            }
            if(head == null || head.getCondition() == 0)
            {
                ++injury_num;
            }
            local injury_num_left = this.Const.EL_Config.EL_addSlightInjurysToActor(_targetEntity, injury_num, [
				this.Const.Injury.BluntBody,
				this.Const.Injury.BluntHead
			]);
			this.Const.EL_Config.EL_addSeriousInjurysToActor(_targetEntity, injury_num_left, [
				this.Const.Injury.BluntBody,
				this.Const.Injury.BluntHead
			]);
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

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_ReplaceSkill(this.getContainer().getActor(), this.m.EL_replacedSkills, this.Const.EL_Rarity_Entry.Factor.EL_Devastate.ReplaceSkillList);
			this.getContainer().add(this.new("scripts/skills/el_actives/el_devastate_skill"));
			this.getContainer().add(this.new("scripts/skills/el_actives/el_devastate_aoe_skill"));
		}
		else
		{
			this.m.EL_replacedSkills.clear();
			this.getContainer().removeByID("el_rarity_actives.devastate_skill");
			this.getContainer().removeByID("el_rarity_actives.devastate_aoe_skill");
		}
	}

	function onRemoved()
	{
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
		this.getContainer().removeByID("el_rarity_actives.devastate_skill");
        this.getContainer().removeByID("el_rarity_actives.devastate_aoe_skill");
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer) && item.getRangeMax() == 1)
		{
			return true;
		}
		return false;
	}
});