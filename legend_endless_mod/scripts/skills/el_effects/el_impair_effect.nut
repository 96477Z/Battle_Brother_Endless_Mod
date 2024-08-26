this.el_impair_effect <- this.inherit("scripts/skills/skill", {
	m = {
        Bonus = 0.0
    },
	function create()
	{
		this.m.ID = "el_effects.impair";
		this.m.Name = "削弱";
		this.m.Description = "这个角色状态萎靡";
		this.m.Icon = "skills/icon_mummy_curse.png";
		this.m.IconMini = "mini_icon_mummy_curse";
		this.m.Overlay = "mummy_curse";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.Order = this.Const.SkillOrder.VeryLast + 999999;
	}

	function getName()
	{
		return this.m.Name + " (-" + this.Math.floor(this.m.Bonus) + "血限)";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "生命值上限- [color=" + this.Const.UI.Color.NegativeValue + "]+" + this.m.Bonus + "[/color]"
			}
		]);
		return tooltip;
	}

	function onUpdate( _properties )
	{
		_properties.Hitpoints -= this.Math.floor(this.m.Bonus);
		if(_properties.Hitpoints < 1) {
			_properties.Hitpoints = 1
		}
	}

    function EL_addBonus( _bonus )
	{
		this.m.Bonus += _bonus;
	}
});