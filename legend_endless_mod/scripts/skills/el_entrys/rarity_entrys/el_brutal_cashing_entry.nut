this.el_brutal_cashing_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.brutal_cashing";
		this.m.Name = "残暴追击(长斧)";
		this.m.Description = "残忍的猎杀者";
		this.m.Icon = "el_entrys/el_brutal_cashing_entry.png";
		//this.m.IconMini = "el_brutal_cashing_entry_mini";
		this.m.Overlay = "el_brutal_cashing_entry";
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
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]当攻击目标没有盾牌时,视为使用一次“分裂人”技能[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]当攻击目标拥有盾牌时,额外对其释放一次“劈盾”技能[/color]"
			},
			{
				id = 5,
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
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备长斧来发挥效果[/color]"
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

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_ReplaceSkill(this.getContainer().getActor(), this.m.EL_replacedSkills, this.Const.EL_Rarity_Entry.Factor.EL_BrutalCashing.ReplaceSkillList);
			this.getContainer().add(this.new("scripts/skills/el_actives/el_brutal_cashing_skill"));
		}
		else
		{
			this.m.EL_replacedSkills.clear();
			this.getContainer().removeByID("el_rarity_actives.brutal_cashing_skill");
		}
	}

	function onRemoved()
	{
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
		this.getContainer().removeByID("el_rarity_actives.brutal_cashing_skill");
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Axe) && item.getRangeMax() != 1)
		{
			return true;
		}
		return false;
	}
});