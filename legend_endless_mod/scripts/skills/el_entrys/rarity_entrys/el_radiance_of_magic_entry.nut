this.el_radiance_of_magic_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.radiance_of_magic";
		this.m.Name = "魔灵之辉(法杖)";
		this.m.Description = "魔法世界的宝库，向你敞开了大门。";
		this.m.Icon = "el_entrys/el_radiance_of_magic_entry.png";
		//this.m.IconMini = "el_radiance_of_magic_entry_mini";
		this.m.Overlay = "el_radiance_of_magic_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]获得“飞弹”、“闪电链”、“火焰弹”技能。[/color]"
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]拥有“注魔姿态”和“滞灵姿态”两种形态。[/color]"
			}
        ];
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备法杖来发挥效果[/color]"
            });
        }
		return result;
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.getContainer().add(this.new("scripts/skills/actives/legend_magic_missile"));
			this.getContainer().add(this.new("scripts/skills/actives/mage_legend_magic_chain_lightning"));
			this.getContainer().add(this.new("scripts/skills/actives/legend_firefield_skill"));
			this.getContainer().add(this.new("scripts/skills/el_actives/el_stagnant_spirit_form"));
			this.getContainer().add(this.new("scripts/skills/el_actives/el_infuse_magic_form"));
		}
		else
		{
			this.getContainer().removeByID("actives.legend_magic_missile");
			this.getContainer().removeByID("actives.mage_legend_magic_chain_lightning");
			this.getContainer().removeByID("actives.legend_firefield");
			this.getContainer().removeByID("el_actives.infuse_magic_form");
			this.getContainer().removeByID("el_actives.stagnant_spirit_form");
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.legend_magic_missile");
		this.getContainer().removeByID("actives.mage_legend_magic_chain_lightning");
		this.getContainer().removeByID("actives.legend_firefield");
		this.getContainer().removeByID("el_actives.infuse_magic_form");
		this.getContainer().removeByID("el_actives.stagnant_spirit_form");
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
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.MagicStaff))
		{
			return true;
		}
		return false;
	}
});

