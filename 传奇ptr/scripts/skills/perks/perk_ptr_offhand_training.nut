this.perk_ptr_offhand_training <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = true,
		IsUsingFreeSkill = false,
		IsFreeUse = false,
		Skills = []
	},
	function create()
	{
		this.m.ID = "perk.ptr_offhand_training";
		this.m.Name = this.Const.Strings.PerkName.PTROffhandTraining;
		this.m.Description = this.Const.Strings.PerkDescription.PTROffhandTraining;
		this.m.Icon = "ui/perks/ptr_offhand_training.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.ItemActionOrder = this.Const.ItemActionOrder.BeforeLast;
	}

	function getItemActionCost(_items)
	{
		if (this.m.IsSpent)
		{
			return null;
		}

		local validItemsCount = 0;

		foreach (i in _items)
		{
			if (i == null)
			{
				continue;
			}

			if (i.getSlotType() == this.Const.ItemSlot.Mainhand)
			{
				return null;
			}

			if (i.isItemType(this.Const.Items.ItemType.Shield))
			{
				 if (i.getID().find("buckler") != null || i.getID().find("parrying_dagger") != null)
				 {
					 validItemsCount++;
				 }
				 else
				 {
					 return null;
				 }
			}

			if (i.isItemType(this.Const.Items.ItemType.Tool))
			{
				validItemsCount++;
			}
		}

		if (validItemsCount > 0)
		{
			return 0;
		}

		return null;
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.Skills.find(_skill.getID()) != null)
		{
			this.m.IsUsingFreeSkill = true;
		}
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.IsUsingFreeSkill)
		{
			this.m.IsFreeUse = false;
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.Skills.clear();
		local off = this.getContainer().getActor().getOffhandItem();
		if (this.m.IsFreeUse && off != null && off.isItemType(this.Const.Items.ItemType.Tool))
		{
			foreach (skill in off.getSkills())
			{
				this.m.Skills.push(skill.getID());
				skill.m.ActionPointCost = 0;
			}
		}
	}

	function onTurnStart()
	{
		this.m.IsUsingFreeSkill = false;
		this.m.IsFreeUse = true;
		this.m.IsSpent = false;
	}

	function onCombatFinished()
	{
		this.m.IsUsingFreeSkill = false;
		this.m.IsFreeUse = false;
		this.m.IsSpent = true;
	}

	function onPayForItemAction(_skill, _items)
	{
		if (_skill != null && _skill.getID() != "perk.ptr_target_practice")
		{
			this.m.IsSpent = true;
		}
	}
});
