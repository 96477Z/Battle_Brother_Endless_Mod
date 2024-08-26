this.el_curse_effect <- this.inherit("scripts/skills/skill", {
	m = {
        Bonus = 0.0
    },
	function create()
	{
		this.m.ID = "el_effects.curse";
		this.m.Name = "Curse";
		this.m.Description = "这个角色被诅咒了";
		this.m.Icon = "skills/icon_mummy_curse.png";
		this.m.IconMini = "mini_icon_mummy_curse";
		this.m.Overlay = "mummy_curse";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getName()
	{
		return this.m.Name + " (+" + this.m.Bonus + "%受伤)";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Receive [color=" + this.Const.UI.Color.NegativeValue + "]+" + this.m.Bonus + "%[/color] damage from any source"
			}
		]);
		return tooltip;
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult *= 1.0 + this.m.Bonus * 0.01;
	}

    function EL_addBonus( _bonus )
	{
		this.m.Bonus += _bonus;
	}
});