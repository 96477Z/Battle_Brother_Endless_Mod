this.perk_ptr_entrenched <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 7,
		MaxBonus = 15,
		TurnsEntrenched = -1,
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_entrenched";
		this.m.Name = this.Const.Strings.PerkName.PTREntrenched;
		this.m.Description = "This character\'s confidence in combat is increased due to support from adjacent allies.";
		this.m.Icon = "ui/perks/ptr_entrenched.png";
		this.m.IconMini = "ptr_entrenched_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.TurnsEntrenched < 0;
	}

	function getName()
	{
		return this.m.TurnsEntrenched > 0 ? this.m.Name + " (x" + this.m.TurnsEntrenched + " Turns)" : this.m.Name;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local bonus = this.getBonus();

		tooltip.extend([
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Ranged Skill"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Ranged Defense"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Resolve"
			}
		]);

		if (!this.m.IsSpent)
		{
			tooltip.push(
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Can swap between two ranged weapons this turn at no Action Point cost"
			});
		}

		return tooltip;
	}

	function isEnabled()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			return false;
		}

		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap())
		{
			return false;
		}

		local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 1);
		foreach (ally in adjacentAllies)
		{
			if (!ally.isEngagedInMelee() && ally.hasZoneOfControl() && ally.getID() != actor.getID())
			{
				return true;
			}
		}

		return false;
	}

	function getBonus()
	{
		return this.Math.max(0, this.Math.min(this.m.MaxBonus, this.m.Bonus + this.m.TurnsEntrenched * 2));
	}

	function onUpdate( _properties )
	{
		if (this.m.TurnsEntrenched >= 0 && this.isEnabled())
		{
			local bonus = this.getBonus();
			_properties.RangedSkill += bonus;
			_properties.RangedDefense += bonus;
			_properties.Bravery += bonus;
		}		
	}

	function getItemActionCost( _items )
	{
		if (this.m.IsSpent || this.m.TurnsEntrenched < 0 || !this.isEnabled())
		{
			return null;
		}

		local rangedCount = 0;

		foreach (item in _items)
		{
			if (item == null)
			{
				continue;
			}

			if (item.getSlotType() == this.Const.ItemSlot.Mainhand && item.isItemType(this.Const.Items.ItemType.RangedWeapon))
			{
				rangedCount++;
			}
		}

		if (rangedCount == 2)
		{
			return 0;
		}

		return null;
	}

	function onPayForItemAction( _skill, _items )
	{
		if (_skill != null && _skill.getID() == "perk.ptr_target_practice")
		{
			return;
		}

		this.m.IsSpent = true;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;

		if (this.isEnabled())
		{
			this.m.TurnsEntrenched++;
		}
		else
		{
			this.m.TurnsEntrenched = -1;
		}
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.TurnsEntrenched = -1;		
	}
});
