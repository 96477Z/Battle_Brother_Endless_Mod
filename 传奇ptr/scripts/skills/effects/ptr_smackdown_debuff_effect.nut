this.ptr_smackdown_debuff_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Malus = 3
	},
	function create()
	{
		this.m.ID = "effects.smackdown_debuff_effect";
		this.m.Name = "Smacked Down";
		this.m.Description = "This character has been pushed back by a heavy blow, which makes it difficult to pick oneself up and move.";
		this.m.Icon = "ui/perks/smackdown_circle.png";
		this.m.IconMini = "ptr_smackdown_debuff_effect_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + this.m.Malus + "%[/color] Action Points per tile moved"
			}
		];
	}

	function onUpdate ( _properties )
	{
		_properties.MovementAPCostAdditional += this.m.Malus;
	}
	
	function onTurnEnd()
	{
		this.removeSelf();
	}
});

