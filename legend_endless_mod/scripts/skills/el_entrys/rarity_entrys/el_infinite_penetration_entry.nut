this.el_infinite_penetration_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_IsPenetrateAttack = false
    },
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.infinite_penetration";
		this.m.Name = "无尽穿透(投掷)";
		this.m.Description = "至锐的投掷，贯穿一切"//A sharp throw that runs through everything.
		this.m.Icon = "el_entrys/el_infinite_penetration_entry.png";
		//this.m.IconMini = "el_infinite_penetration_entry_mini";
		this.m.Overlay = "el_infinite_penetration_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击将穿透一条直线上的所有敌人[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]如果目标被命中时仍存在护甲，则此次攻击额外造成一次血量伤害[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备投掷武器来发挥效果[/color]"
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
		if (EL_isUsable() && _skill.m.IsWeaponSkill)
		{
            local item = _bodyPart == this.Const.BodyPart.Head ? _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Head) : _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            if(item == null || item.getCondition() == 0)
            {
                return; 
            }
			local hit_info = clone this.Const.Tactical.HitInfo;
            hit_info.DamageRegular = _damageInflictedHitpoints * this.Const.EL_Rarity_Entry.Factor.EL_InfinitePenetration.RegularDamageMult;
            hit_info.DamageDirect = 1.0;
            hit_info.BodyPart = _bodyPart;
            _targetEntity.onDamageReceived(this.getContainer().getActor(), this, hit_info);
		}
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (EL_isUsable() && !this.m.EL_IsPenetrateAttack && _skill.m.IsWeaponSkill)
		{
			this.m.EL_IsPenetrateAttack = true;
			local my_tile = this.getContainer().getActor().getTile();
			local target_tile = _targetEntity.getTile();
			local dir = my_tile.getDirectionTo(target_tile);

			for(local i = 0; i < this.Const.EL_Rarity_Entry.Factor.EL_InfinitePenetration.PenetrateNum; ++i)
			{
				if(target_tile.hasNextTile(dir))
				{
					target_tile = target_tile.getNextTile(dir);
					local target_entity = target_tile.getEntity();
					if(!target_tile.IsOccupiedByActor || target_entity == null || !target_entity.isAlive() || target_entity.isDying() ||!target_entity.isAttackable() || this.Math.abs(target_tile.Level - my_tile.Level) > 1)
					{
						continue;
					}
					local properties = _skill.getContainer().buildPropertiesForUse(_skill, _targetEntity);
					local info = {
						Skill = _skill,
						Container = _skill.getContainer(),
						User = this.getContainer().getActor(),
						TargetEntity = target_entity,
						Properties = properties,
						DistanceToTarget = my_tile.getDistanceTo(_targetEntity.getTile())
					};
					_skill.onScheduledTargetHit(info);
				}
			}
		}
		this.m.EL_IsPenetrateAttack = false;
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Throwing))
		{
			return true;
		}
		return false;
	}
});