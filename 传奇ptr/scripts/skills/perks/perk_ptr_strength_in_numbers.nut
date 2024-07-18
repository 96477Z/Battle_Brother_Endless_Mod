this.perk_ptr_strength_in_numbers <- this.inherit("scripts/skills/skill", {
	m = {
		BonusPerAdjacentAlly = 2,
		MaxResolveBonus = 20
	},
	function create()
	{
		this.m.ID = "perk.ptr_strength_in_numbers";
		this.m.Name = "Strength in Numbers";
		this.m.Description = "This character\'s martial prowess increases when fighting adjacent to allies.";
		this.m.Icon = "ui/perks/ptr_strength_in_numbers.png";
		// this.m.IconMini = "ptr_strength_in_numbers_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return !this.getContainer().getActor().isPlacedOnMap() || (this.getBonus() == 0 && this.getResolveBonus() == 0);
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getBonus() + "[/color] Melee Skill"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getBonus() + "[/color] Ranged Skill"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getBonus() + "[/color] Melee Defense"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getBonus() + "[/color] Ranged Defense"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getResolveBonus() + "[/color] Resolve"
		});

		return tooltip;
	}

	function getBonus()
	{
		local actor = this.getContainer().getActor();
		return (::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 1).len() - 1) * this.m.BonusPerAdjacentAlly;
	}

	function getResolveBonus()
	{
		local actor = this.getContainer().getActor();
		local others = this.Tactical.Entities.getAllInstancesAsArray();

		local count = 0;

		foreach (o in others)
		{
			if (o.isAlliedWith(actor))
			{
				count++;
			}
		}

		// Subtract 1 to remove self from the count
		return this.Math.min(this.m.MaxResolveBonus, count - 1);
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			return;
		}

		local bonus = this.getBonus();
		if (bonus > 0)
		{
			_properties.MeleeSkill += this.getBonus();
			_properties.RangedSkill += this.getBonus();
			_properties.MeleeDefense += this.getBonus();
			_properties.RangedDefense += this.getBonus();			
		}

		_properties.Bravery += this.getResolveBonus();
	}
});
