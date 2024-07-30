this.el_cold_lie_cashing_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_chainEntity = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.cold_lie_cashing";
		this.m.Name = "冷冽追击(双手矛)";
		this.m.Description = "冷冽的寒芒凝而不发，但没有人会怀疑它的威力";
		this.m.Icon = "el_entrys/el_cold_lie_cashing_entry.png";
		//this.m.IconMini = "el_cold_lie_cashing_entry_mini";
		this.m.Overlay = "el_cold_lie_cashing_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击范围内的每格友军都会提升你" + this.Const.EL_Rarity_Entry.Factor.EL_ColdLieCashing.DamageMultFactor * 100 + "%的伤害[/color]"
			},
			{
				id = 4,
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
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备双手矛来发挥效果[/color]"
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
			local ally_num = 0;
			local user = this.getContainer().getActor();
			local my_tile = user.getTile();
			local actors = this.Tactical.Entities.getInstancesOfFaction(user.getFaction());

			foreach( actor in actors )
			{
				if (actor.getID() == user.getID())
				{
					continue;
				}
				if (my_tile.getDistanceTo(actor.getTile()) > _skill.m.MaxRange)
				{
					continue;
				}
				if (actor.getFaction() == user.getFaction())
				{   
					++ally_num;
				}
			}
			_hitInfo.DamageRegular *= 1.0 + ally_num * this.Const.EL_Rarity_Entry.Factor.EL_ColdLieCashing.DamageMultFactor;
			_hitInfo.DamageArmor *= 1.0 + ally_num * this.Const.EL_Rarity_Entry.Factor.EL_ColdLieCashing.DamageMultFactor;
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
					this.m.EL_chainEntity.push(actor);
				}
			}
		}
	}

	function onDeath( _fatalityType )
	{
		local pursuit_skill = this.Const.EL_Rarity_Entry.EL_getAttackSkill(user);
		foreach(actor in this.m.EL_chainEntity)
		{
			local skills = actor.getSkills().getAllSkillsByID("el_rarity_effects.pursuit");
			foreach(skill in skills)
			{
				if(skill.EL_getPursuitSkill() == pursuit_skill && skill.EL_getSourceActor() == user)
				{
					actor.getSkills().remove(skill);
					break;
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
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Spear))
		{
			return true;
		}
		return false;
	}
});