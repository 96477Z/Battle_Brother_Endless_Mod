this.el_rainstorm_pear_flower_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_IsExtraAttack = false,
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.ID = "el_rarity_entry.rainstorm_pear_flower";
		this.m.Name = "暴雨梨花(投石索)";
		this.m.Description = "暴雨倾盆，无处可藏";
		this.m.Icon = "el_entrys/el_rainstorm_pear_flower_entry.png";
		//this.m.IconMini = "el_rainstorm_pear_flower_entry_mini";
		this.m.Overlay = "el_rainstorm_pear_flower_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击时将随机攻击目标及目标周围一圈中的随机一处[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]每次攻击会随机进行10~25次[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备投石索来发挥效果[/color]"
            });
        }
		return result;
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_ReplaceSkill(this.getContainer().getActor(), this.m.EL_replacedSkills, this.Const.EL_Rarity_Entry.Factor.RainstormPearFlower.ReplaceSkillList);
            local skill = this.new("scripts/skills/el_actives/el_sling_stone_skill");
            skill.setItem(this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));
			this.getContainer().add(skill);
		}
		else
		{
			this.m.EL_replacedSkills.clear();
			this.getContainer().removeByID("actives.sling_stone");
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.sling_stone");
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
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
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Sling))
		{
			return true;
		}
		return false;
	}
});

