this.el_circle_of_life_entry <- this.inherit("scripts/skills/skill", {
	m = {
        EL_IsRising = false,
		EL_RiseTimesLeft = 0
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.circle_of_life";
		this.m.Name = "生生不息(单手棍)";
		this.m.Description = "不断涌动的生机，赐予使用者强大的恢复能力，也能够掠夺敌人的力量";//The constantly surging vitality endows users with strong recovery ability and also enables them to drain the power of enemies.
		this.m.Icon = "el_entrys/el_circle_of_life_entry.png";
		//this.m.IconMini = "el_circle_of_life_entry_mini";
		this.m.Overlay = "el_circle_of_life_entry";
		this.m.Type = this.Const.SkillType.StatusEffect;
        this.m.EL_IsRising = false;
		this.m.EL_RiseTimesLeft = 0;
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击时会夺取目标 " + this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.FatigueDrainPercent * 100 + "%的疲劳和 " + this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.HitpointsDrainPercent * 100 + "%生命值.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]回合开始时恢复 " + this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.HitpointsRecover * 100 + "%生命值, " + this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.ArmorConditonRecover * 100 + "%护甲耐久和 " + this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.FatigueRecover * 100 + "%疲劳, 同时随机清除一项负面效果[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中时必定击晕目标1回合[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]每场战斗都可以满状态复活(剩余次数: " + this.m.EL_RiseTimesLeft + ")[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备单手棍来发挥效果[/color]"
            });
        }
		return result;
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable() && this.m.EL_RiseTimesLeft > 0)
		{
			this.getContainer().getActor().setIsAbleToDie(false);
		}
		else
		{
			this.getContainer().getActor().setIsAbleToDie(true);
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
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
			this.EL_drainFatigueAndHitpoints(_skill, _targetEntity);
		}
	}

	// function onTargetMissed( _skill, _targetEntity )
	// {
	// 	if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
	// 	{
	// 		return;
	// 	}
	// 	if (EL_isUsable())
	// 	{
	// 		this.EL_drainFatigueAndHitpoints(_skill, _targetEntity);
	// 	}
	// }

	function onTurnStart()
	{
		if (EL_isUsable())
		{
			local user = this.getContainer().getActor();	
			local skills = user.getSkills();
			if(this.m.EL_IsRising)
			{
				this.m.EL_IsRising = false;
				--this.m.EL_RiseTimesLeft;
				local properties = user.getBaseProperties();
				user.m.IsAttackable = true;
				if(this.m.EL_RiseTimesLeft == 0) {
					user.setIsAbleToDie(true);
				}
				foreach( skill in skills.m.Skills ) {
					local skill_type = skill.getType();
					if(!skill.isType(this.Const.SkillType.None) &&
					!skill.isType(this.Const.SkillType.Active) &&
					!skill.isType(this.Const.SkillType.Trait) &&
					!skill.isType(this.Const.SkillType.Racial) &&
					!skill.isType(this.Const.SkillType.Special) &&
					!skill.isType(this.Const.SkillType.Item) &&
					!skill.isType(this.Const.SkillType.Perk) &&
					!skill.isType(this.Const.SkillType.Terrain) &&
					!skill.isType(this.Const.SkillType.WorldEvent) &&
					!skill.isType(this.Const.SkillType.Background) &&
					!skill.isType(this.Const.SkillType.Alert) &&
					skill != this ||
					this.Const.EL_Rarity_Entry.EL_isNegativeEffect(skill))
					{
						skills.remove(skill);
					}
				}
				user.setHitpoints(user.getHitpointsMax());
            	user.setActionPoints(user.getActionPointsMax());
				user.setFatigue(0);
                user.setMoraleState(this.Const.MoraleState.Confident);
				local armor = user.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
				if(armor != null) {
					armor.setArmor(armor.getArmorMax());
					armor.updateAppearance();
				}

				local helmet = user.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
				if(helmet != null) {
					helmet.setArmor(helmet.getArmorMax());
					helmet.updateAppearance();
				}
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " rised!");
				this.getContainer().getActor().getSkills().update();
			}
			else
			{
				local index_pool = [];
				for(local i = 0; i < skills.m.Skills.len(); ++i)
				{
					if(this.Const.EL_Rarity_Entry.EL_isNegativeEffect(skills.m.Skills[i]))
					{
						//this.logInfo("check: "+skills.m.Skills[i].getID());
						index_pool.push(i);
					}
				}
				if(index_pool.len() != 0)
				{
					local r = this.Math.rand(0, index_pool.len() - 1);
					//this.logInfo("remove: "+skills.m.Skills[r].getID());
					skills.remove(skills.m.Skills[r]);
				}
				user.setHitpoints(this.Math.min(user.getHitpointsMax(), user.getHitpoints() + this.Math.round(user.getHitpointsMax() * this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.HitpointsRecover)));
				user.setFatigue(this.Math.max(0, user.getFatigue() - this.Math.round(user.getFatigueMax() * this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.FatigueRecover)));
				local armor = user.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
				if(armor != null)
				{
					armor.setCondition(this.Math.min(armor.getConditionMax(), armor.getCondition() + this.Math.round(armor.getConditionMax() * this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.ArmorConditonRecover)));
				}
				local helmet = user.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
				if(helmet != null)
				{
					helmet.setCondition(this.Math.min(helmet.getConditionMax(), helmet.getCondition() + this.Math.round(helmet.getConditionMax() * this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.HelmetConditonRecover)));
				}
			}
		}
	}    
	
	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
    {
		if (EL_isUsable())
		{
			local user = this.getContainer().getActor();
			if ((this.m.EL_RiseTimesLeft > 0 && _damageHitpoints > user.getHitpoints()) || user.getHitpoints() <= 0)
			{
				this.m.EL_IsRising = true;
				local properties = user.getCurrentProperties();
				user.m.IsAttackable = false;
				user.setActionPoints(0);
				user.setFatigue(user.getFatigueMax());
           		user.m.MoraleState = this.Const.MoraleState.Ignore;
				local armor = user.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
				if(armor != null) {
					armor.setArmor(0);
				}
				else {
					properties.Armor[this.Const.BodyPart.Body] = 0;
				}
				local helmet = user.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
				if(helmet != null) {
					helmet.setArmor(0);
				}
				else {
					properties.Armor[this.Const.BodyPart.Head] = 0;
				}
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " is rising!");
				user.getSkills().update();
			}
		}
    }

	function onCombatStarted()
	{
		this.m.EL_RiseTimesLeft = this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.RiseNum;
	}

    function EL_drainFatigueAndHitpoints( _skill, _targetEntity )
    {
        local user = this.getContainer().getActor();
		local fatigue_drain = this.Math.min(_targetEntity.getFatigueMax() - _targetEntity.getFatigue(), _targetEntity.getFatigueMax() * this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.FatigueDrainPercent);
		//this.logInfo("fatigue_drain:" + fatigue_drain);
		this.applyFatigueDamage(_targetEntity, fatigue_drain);
		user.setFatigue(this.Math.max(0, user.getFatigue() - fatigue_drain));
		local hitpoints_drain = this.Math.min(_targetEntity.getHitpoints(), _targetEntity.getHitpointsMax() * this.Const.EL_Rarity_Entry.Factor.EL_CircleofLife.HitpointsDrainPercent);
		local hit_info = clone this.Const.Tactical.HitInfo;
		hit_info.DamageRegular = hitpoints_drain;
		hit_info.DamageDirect = 1.0;
		hit_info.BodyPart = this.Const.BodyPart.Body;
		//this.logInfo("hitpoints_drain:" + hitpoints_drain);
		_targetEntity.onDamageReceived(user, this, hit_info);
		user.setHitpoints(this.Math.min(user.getHitpointsMax(), user.getHitpoints() + hitpoints_drain));
    }
function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Mace))
		{
			return true;
		}
		return false;
	}
});