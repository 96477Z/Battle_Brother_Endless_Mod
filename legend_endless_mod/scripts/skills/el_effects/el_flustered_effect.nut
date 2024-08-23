this.el_flustered_effect <- this.inherit("scripts/skills/skill", {
	m = {
        Bonus = 0.0
    },
	function create()
	{
		this.m.ID = "el_effects.flustered";
		this.m.Name = "慌乱";
		this.m.Description = "这个角色阵脚大乱";
		this.m.Icon = "skills/icon_mummy_curse.png";
		this.m.IconMini = "mini_icon_mummy_curse";
		this.m.Overlay = "mummy_curse";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getName()
	{
		return this.m.Name + " (-" + this.m.Bonus + "防)";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "双防- [color=" + this.Const.UI.Color.NegativeValue + "]+" + this.m.Bonus + "[/color]"
			}
		]);
		return tooltip;
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense -= this.m.Bonus;
		_properties.RangedDefense -= this.m.Bonus;
	}

    function EL_addBonus( _bonus )
	{
		this.m.Bonus += _bonus;
	}
});