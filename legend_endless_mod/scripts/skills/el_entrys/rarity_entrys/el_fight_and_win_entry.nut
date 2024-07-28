this.el_fight_and_win_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.fight_and_win";
		this.m.Name = "战而胜之(单手连枷)";
		this.m.Description = "暴风般的压制，目标破绽百出，胜利已尽在掌握";//Storm like suppression, target riddled with flaws, victory in control.
		this.m.Icon = "el_entrys/el_fight_and_win_entry.png";
		//this.m.IconMini = "el_fight_and_win_entry_mini";
		this.m.Overlay = "el_fight_and_win_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击敌人时, 使他决心 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenBravery + ", 主动值 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenInitiative + ", 近战技能 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenMeleeSkill + ", 远程技能 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenRangedSkill + ", 近战防御 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenMeleeDefense + ", 远程防御 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenRangedDefense + ", 受到伤害 + " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.TempWeakenDamageReceivedTotalMult * 100 + "%直到目标回合结束[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]命中敌人时, 使他决心 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenBravery + ", 主动值 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenInitiative + ", 近战技能 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenMeleeSkill + ", 远程技能 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenRangedSkill + ", 近战防御 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenMeleeDefense + ", 远程防御 - " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenRangedDefense + ", 受到伤害 + " + this.Const.EL_Rarity_Entry.Factor.EL_FightAndWin.WeakenDamageReceivedTotalMult * 100 + "%直到战斗结束[/color]"
			},
			{
				id = 5,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]三头连枷的每次攻击效果减半[/color]"
			},
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备单手连枷来发挥效果[/color]"
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
			_targetEntity.getSkills().add(this.new("scripts/skills/el_effects/el_temp_weaken_effect"));
			_targetEntity.getSkills().add(this.new("scripts/skills/el_effects/el_weaken_effect"));
			if(!EL_isHalf())
			{	
				_targetEntity.getSkills().add(this.new("scripts/skills/el_effects/el_temp_weaken_effect"));
				_targetEntity.getSkills().add(this.new("scripts/skills/el_effects/el_weaken_effect"));
			}
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
			_targetEntity.getSkills().add(this.new("scripts/skills/el_effects/el_temp_weaken_effect"));
			if(!EL_isHalf())
			{	
				_targetEntity.getSkills().add(this.new("scripts/skills/el_effects/el_temp_weaken_effect"));
			}
		}
	}

	function EL_isHalf()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item.getID() == "weapon.three_headed_flail" || item.getID() == "weapon.named_three_headed_flail")
		{
			return true;
		}
		return false;
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Flail))
		{
			return true;
		}
		return false;
	}
});

