this.ptr_eyes_up_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 1
		SkillMalus = 5,
		DefenseMalus = 3
	},
	function create()
	{
		this.m.ID = "effects.ptr_eyes_up";
		this.m.Name = "Eyes Up";
		this.m.Description = "This character is being barraged by attacks coming from up high, causing %their% attention to be diverted towards them. Can stack up to 10 times.";
		this.m.Icon = "ui/perks/ptr_eyes_up.png";
		this.m.IconMini = "ptr_eyes_up_mini";
		this.m.Overlay = "ptr_eyes_up_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getName()
	{
		return this.m.Stacks == 1 ? this.m.Name : this.m.Name + " (x" + this.m.Stacks + ")";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local skillMalus = this.getSkillMalus();

		tooltip.extend(
		[
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + skillMalus + "[/color] Melee Skill"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + skillMalus + "[/color] Ranged Skill"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.getDefenseMalus() + "[/color] Melee Defense"
			}
		]);

		return tooltip;
	}

	function onRefresh()
	{
		if (this.m.Stacks < 10)
		{
			this.m.Stacks++;
			this.spawnIcon("ptr_eyes_up_effect", this.getContainer().getActor().getTile());		
		}
	}

	function getSkillMalus()
	{
		return ::Math.floor(this.m.Stacks * this.m.SkillMalus);
	}

	function getDefenseMalus()
	{
		return ::Math.floor(this.m.Stacks * this.m.DefenseMalus);
	}

	function onUpdate( _properties )
	{
		local skillMalus = this.getSkillMalus();
		_properties.MeleeSkill -= skillMalus;
		_properties.RangedSkill -= skillMalus;
		_properties.MeleeDefense -= this.getDefenseMalus();
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}
});
