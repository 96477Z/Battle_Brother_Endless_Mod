this.el_devastate_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.devastate";
		this.m.Name = "毁灭打击(双手锤)";
		this.m.Description = "盔甲？盾牌？依赖那些东西的软弱敌人将会被毫不留情的粉碎";//Armor? Shield? The weak enemies who rely on those things will be mercilessly crushed.
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]武器技能强化[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时额外造成等同于造成护甲伤害 " + this.Const.EL_Rarity_Entry.Factor.EL_Devastate.HealthDamageMult * 100 +"%的血量伤害[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时额外造成 " + this.Const.EL_Rarity_Entry.Factor.EL_Devastate.InjuryNum + "个轻伤, 目标每缺少1件护甲, 再额外造成1个轻伤[/color]"
			},
			{
				id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击时免费施加一次正常 " + this.Const.EL_Rarity_Entry.Factor.EL_Devastate.ShieldDamageMult * 100 + "%伤害的“劈盾”技能，如果你拥有这个技能[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备双手锤来发挥效果[/color]"
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
			if(_targetEntity.getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") && _targetEntity.getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
			{
				return;
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
			this.getContainer().removeByID("actives.smite");
			this.getContainer().removeByID("actives.shatter");
		}
	}

	function onRemoved()
	{
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
		this.getContainer().removeByID("actives.smite");
		this.getContainer().removeByID("actives.shatter");
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
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer) && item.getRangeMax() == 1)
		{
			return true;
		}
		return false;
	}
});