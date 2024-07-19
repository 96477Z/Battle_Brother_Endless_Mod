this.perk_ptr_target_practice <- this.inherit("scripts/skills/skill", {
	m = {
		RangedSkillBonus = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_target_practice";
		this.m.Name = this.Const.Strings.PerkName.PTRTargetPractice;
		this.m.Description = this.Const.Strings.PerkDescription.PTRTargetPractice;
		this.m.Icon = "ui/perks/ptr_target_practice.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.ItemActionOrder = this.Const.ItemActionOrder.First;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.getID() == "actives.aimed_shot")
		{
			_properties.RangedSkill += this.m.RangedSkillBonus;
		}
	}

	function onGetHitFactors( _skill, _targetTile, _tooltip )
	{
		if (_skill.getID() == "actives.aimed_shot")
		{
			_tooltip.push({
				icon = "ui/tooltips/positive.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.RangedSkillBonus + "%[/color] " + this.getName()
			});
		}
	}

	function getItemActionCost( _items )
	{
		local count = 0;

		foreach (item in _items)
		{
			if (item != null && item.isItemType(this.Const.Items.ItemType.Ammo) && item.getSlotType() == this.Const.ItemSlot.Ammo)
			{
				count++;
			}
		}

		return count == 2 ? 0 : null;
	}
});
