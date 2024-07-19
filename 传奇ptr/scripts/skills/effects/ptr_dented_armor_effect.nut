this.ptr_dented_armor_effect <- this.inherit("scripts/skills/skill", {
	m = {
		ActionPointMalus = 2
	},
	function create()
	{
		this.m.ID = "effects.ptr_dented_armor";
		this.m.Name = "Dented Armor";
		this.m.Description = "This character\'s armor has been dented severely, restricting mobility.";
		this.m.Icon = "ui/perks/ptr_dent_armor.png";
		this.m.IconMini = "ptr_dented_armor_effect_mini";
		this.m.Overlay = "ptr_dented_armor_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.ActionPointMalus + "[/color] Action Points"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.ActionPoints -= 2;
	}
});
