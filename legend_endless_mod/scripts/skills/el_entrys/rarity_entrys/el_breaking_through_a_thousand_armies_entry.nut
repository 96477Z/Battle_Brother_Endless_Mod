this.el_breaking_through_a_thousand_armies_entry <- this.inherit("scripts/skills/skill", {
	m = {
        EL_Stack = 0,
        EL_AdditionalRoundSwingTimes = 0,
        EL_IsFirstRoundSwing = true,
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.breaking_through_a_thousand_armies";
		this.m.Name = "力破千军(双手斧)";
		this.m.Description = "越战越勇，先登破阵";//The more you fight, the braver you become. Break through the formation.
		this.m.Icon = "el_entrys/el_breaking_through_a_thousand_armies_entry.png";
		//this.m.IconMini = "el_breaking_through_a_thousand_armies_entry_mini";
		this.m.Overlay = "el_breaking_through_a_thousand_armies_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]你的“分裂人”技能将会同时对身体的两个部位都造成100%伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]不再受伤残影响[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]根据血量损失获得加成[/color]"
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
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备双手斧来发挥效果[/color]"
            });
        }
        else if(this.m.EL_Stack)
        {
            result.push({
                id = 11,
                type = "text",
                icon = "ui/icons/bravery.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.BraveryOffset + "[/color] Resolve"
            });
            result.push({
                id = 12,
                type = "text",
				icon = "ui/icons/initiative.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.InitiativeOffset + "[/color] Initiative"
            });
            result.push({
                id = 13,
                type = "text",
                icon = "ui/icons/melee_skill.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.MeleeSkillOffset + "[/color] Melee Skill"
            });
            result.push({
                id = 14,
                type = "text",
                icon = "ui/icons/ranged_skill.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.RangedSkillOffset + "[/color] Ranged Skill"
            });
            result.push({
                id = 15,
                type = "text",
                icon = "ui/icons/melee_defense.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.MeleeDefenseOffset + "[/color] Melee Defense"
            });
            result.push({
                id = 16,
                type = "text",
                icon = "ui/icons/ranged_defense.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.RangedDefenseOffset + "[/color] Ranged Defense"
            });
            result.push({
                id = 17,
                type = "text",
                icon = "ui/icons/fatigue.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.FatigueOnSkillUseOffset + "[/color] Fatigue Cost"
            });
            result.push({
                id = 18,
                type = "text",
                icon = "ui/icons/damage_dealt.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.DamageTotalMult * 100 + "%[/color] Damage Dealt"
            });
            result.push({
                id = 19,
                type = "text",
                icon = "ui/icons/damage_received.png",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]-"+ this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.DamageReceivedTotalMult * 100 + "%[/color] Damage Received"
            });
            result.push({
                id = 20,
                type = "text",
                icon = "ui/icons/damage_received.png",
                text = "“环劈”技能将额外连击" + this.m.EL_Stack + "次"
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

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_ReplaceSkill(this.getContainer().getActor(), this.m.EL_replacedSkills, this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.ReplaceSkillList);
			this.getContainer().add(this.new("scripts/skills/el_actives/el_strengthen_split_man_skill"));
			this.getContainer().add(this.new("scripts/skills/el_actives/el_round_swing_skill"));
		}
		else
		{
			this.m.EL_replacedSkills.clear();
			this.getContainer().removeByID("el_rarity_actives.strengthen_split_man_skill");
			this.getContainer().removeByID("el_rarity_actives.round_swing");
		}
	}

	function onRemoved()
	{
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
		this.getContainer().removeByID("el_rarity_actives.strengthen_split_man_skill");
		this.getContainer().removeByID("el_rarity_actives.round_swing");
	}

	function onUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.m.EL_Stack = this.Math.floor((1.0 - (_properties.Armor[this.Const.BodyPart.Body] * _properties.ArmorMult[this.Const.BodyPart.Body] + _properties.Armor[this.Const.BodyPart.Head] * _properties.ArmorMult[this.Const.BodyPart.Head] + this.getContainer().getActor().getHitpoints())
				/ (_properties.ArmorMax[this.Const.BodyPart.Body] * _properties.ArmorMult[this.Const.BodyPart.Body] + _properties.ArmorMax[this.Const.BodyPart.Head] * _properties.ArmorMult[this.Const.BodyPart.Head] + this.getContainer().getActor().getHitpointsMax()))
				/ this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.StackPercent);

            _properties.Bravery += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.BraveryOffset;
			_properties.Initiative += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.InitiativeOffset;
			_properties.MeleeSkill += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.MeleeSkillOffset;
			_properties.RangedSkill += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.RangedSkillOffset;
			_properties.MeleeDefense += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.MeleeDefenseOffset;
			_properties.RangedDefense += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.RangedDefenseOffset;
			_properties.FatigueOnSkillUse += this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.FatigueOnSkillUseOffset;
			_properties.IsAffectedByInjuries = false;

			_properties.DamageTotalMult *= 1.0 + this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.DamageTotalMult;
			_properties.DamageReceivedTotalMult *= 1.0 - this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_BreakingThroughThousandArmies.DamageReceivedTotalMult;
		}
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Axe) && item.getRangeMax() == 1)
		{
			return true;
		}
		return false;
	}
});