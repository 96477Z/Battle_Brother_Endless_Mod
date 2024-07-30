this.el_landslide_cashing_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.landslide_cashing";
		this.m.Name = "山崩追击(长锤)";
		this.m.Description = "动若山崩，抵挡者死";//Move like a landslide, those who resist will die.
		this.m.Icon = "el_entrys/el_landslide_cashing_entry.png";
		//this.m.IconMini = "el_landslide_cashing_entry_mini";
		this.m.Overlay = "el_landslide_cashing_entry";
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
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时额外造成等同于造成护甲伤害 " + this.Const.EL_Rarity_Entry.Factor.EL_LandslideCashing.HealthDamageMult * 100 +"%的血量伤害[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时额外造成 " + this.Const.EL_Rarity_Entry.Factor.EL_LandslideCashing.InjuryNum + "个轻伤, 如果目标没有护甲, 再额外造成1个轻伤[/color]"
			},
			{
				id = 6,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]当你攻击范围内的敌人被近战攻击时，你将对其进行一次免费的追击[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备长锤来发挥效果[/color]"
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
            local injury_num = this.Const.EL_Rarity_Entry.Factor.EL_LandslideCashing.InjuryNum;
            local body = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            local head = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
            if((body == null || body.getCondition() == 0) && (head == null || head.getCondition() == 0))
            {
                ++injury_num; 
            }
			if(!_targetEntity.getSkills().hasSkill("el_rarity_entry.breaking_through_a_thousand_armies") || !_targetEntity.getSkills().getSkillByID("el_rarity_entry.breaking_through_a_thousand_armies").EL_isUsable())
			{
				local injury_num_left = this.Const.EL_Config.EL_addSlightInjurysToActor(_targetEntity, injury_num, [
					this.Const.Injury.BluntBody,
					this.Const.Injury.BluntHead
				]);
				this.Const.EL_Config.EL_addSeriousInjurysToActor(_targetEntity, injury_num_left, [
					this.Const.Injury.BluntBody,
					this.Const.Injury.BluntHead
				]);
			}
            
            local hit_info = clone this.Const.Tactical.HitInfo;
            hit_info.DamageRegular = _damageInflictedArmor * this.Const.EL_Rarity_Entry.Factor.EL_LandslideCashing.HealthDamageMult;
            hit_info.DamageDirect = 1.0;
            hit_info.BodyPart = _bodyPart;
            _targetEntity.onDamageReceived(this.getContainer().getActor(), this, hit_info);
		}
	}

	function onNewRound()
	{
		local user = this.getContainer().getActor();
		local actors = this.Tactical.Entities.getInstancesOfFaction(user.getFaction());
		local pursuit_skill = this.Const.EL_Rarity_Entry.EL_getAttackSkill(user);

		foreach( actor in actors )
		{
			if (actor.getID() == user.getID())
			{
				continue;
			}
			if (actor.getFaction() == user.getFaction())
			{   
				local skills = actor.getSkills().getAllSkillsByID("el_rarity_effects.pursuit");
				local is_add = true;
				foreach(skill in skills)
				{
					if(skill.EL_getPursuitSkill() == pursuit_skill && skill.EL_getSourceActor() == user)
					{
						is_add = false;
						break;
					}
				}
				if(is_add)
				{
					local effect = this.new("scripts/skills/el_effects/el_pursuit_effect");
					effect.EL_setSourceActorAndAttackSkill(user, pursuit_skill);
					actor.getSkills().add(effect);
				}
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
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer) && item.getRangeMax() != 1)
		{
			return true;
		}
		return false;
	}
});