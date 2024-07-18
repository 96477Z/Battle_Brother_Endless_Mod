this.perk_str_phalanx <- this.inherit("scripts/skills/skill", {
	m = {
		Count = 0,
		BonusPerCount = 5
	},
	function create()
	{
		this.m.ID = "perk.str_phalanx";
		this.m.Name = this.Const.Strings.PerkName.STRPhalanx;
		this.m.Description = "This character is highly skilled in fighting in a shielded formation and gains bonuses when adjacent to allies with shields."
		this.m.Icon = "ui/perks/ptr_phalanx.png";
		this.m.IconMini = "ptr_phalanx_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.Count == 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local bonus = this.getBonus();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Defense"
		});

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Spear))
		{
			tooltip.push({
				type = "text",
				id = 10,
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Skill"
			});
		}

		return tooltip;
	}

	function getBonus()
	{
		return this.m.Count * this.m.BonusPerCount;
	}

	function onUpdate(_properties)
	{
		this.m.Count = 0;

		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || !actor.isArmedWithShield() || !actor.isEngagedInMelee())
		{
			return;
		}

		if (::Tactical.isActive())
		{
			local adjacentAllies = ::Tactical.Entities.getAlliedActors(actor.getFaction(), actor.getTile(), 1);

			foreach (ally in adjacentAllies)
			{
				if (!ally.isArmedWithShield() || !ally.isEngagedInMelee() || ally.getID() == actor.getID())
				{
					continue;
				}

				this.m.Count += 1;
			}
		}

		local bonus = this.getBonus();

		_properties.MeleeDefense += bonus;

		local weapon = actor.getMainhandItem();
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Spear))
		{
			_properties.MeleeSkill += bonus;
		}
	}
});
