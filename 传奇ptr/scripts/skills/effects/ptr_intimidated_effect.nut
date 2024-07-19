this.ptr_intimidated_effect <- this.inherit("scripts/skills/skill", {
	m = {
		ResolveMalus = 0
	},
	function create()
	{
		this.m.ID = "effects.ptr_intimidated";
		this.m.Name = "Intimidated";
		this.m.Description = "This character has recently faced some very intimidating attacks.";
		this.m.Icon = "ui/perks/ptr_intimidate.png";
		this.m.IconMini = "ptr_intimidated_effect_mini";
		this.m.Overlay = "ptr_intimidated_effect";
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
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.ResolveMalus + "[/color] Resolve"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.Bravery -= this.m.ResolveMalus;
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}
});
