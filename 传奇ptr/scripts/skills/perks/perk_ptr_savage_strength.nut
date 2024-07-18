this.perk_ptr_savage_strength <- this.inherit("scripts/skills/skill", {
	m = {
		Skills = []
	},
	function create()
	{
		this.m.ID = "perk.ptr_savage_strength";
		this.m.Name = this.Const.Strings.PerkName.PTRSavageStrength;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSavageStrength;
		this.m.Icon = "ui/perks/ptr_savage_strength.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAfterUpdate( _properties )
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null)
		{
			local skills = weapon.getSkills();
			if (skills.len() == 0)
			{
				this.m.Skills.clear();
				return;
			}

			if (weapon.m.FatigueOnSkillUse > 0)
			{
				foreach (skill in skills)
				{
					if (this.m.Skills.find(skill.getID()) == null)
					{
						this.m.Skills.push(skill.getID());
						skill.m.FatigueCost -= 5;
					}
				}
			}
		}
	}

	function onRemoved()
	{
		local equippedItem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (equippedItem != null)
		{
			this.getContainer().getActor().getItems().unequip(equippedItem);
			this.getContainer().getActor().getItems().equip(equippedItem);
		}
	}
});
