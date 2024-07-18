this.wms_mastery_effect <- this.inherit("scripts/skills/skill", {
	m = {
		HasPolearmMastery = false
	},
	function create()
	{
		this.m.ID = "effects.wms_mastery";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsActive = false;
		this.m.IsHidden = true;
		this.m.IsRemovedAfterBattle = false;
	}

	function onUpdate(_properties)
	{
		this.m.HasPolearmMastery = _properties.IsSpecializedInPolearms;

		if(this.getContainer().getActor().hasMasteryOfEquippedWeapon(_properties))
		{
			_properties.IsSpecializedInAxes = true;
			_properties.IsSpecializedInBows = true;
			_properties.IsSpecializedInCleavers = true;
			_properties.IsSpecializedInCrossbows = true;
			_properties.IsSpecializedInDaggers = true;
			_properties.IsSpecializedInFlails = true;
			_properties.IsSpecializedInHammers = true;
			_properties.IsSpecializedInMaces = true;
			_properties.IsSpecializedInSpears = true;
			_properties.IsSpecializedInSwords = true;
			_properties.IsSpecializedInThrowing = true;
			_properties.IsSpecializedInPolearms = true;

			if ("LegendMod" in this.getroottable().Const)
			{
				_properties.IsSpecializedInGreatSwords = true;
				_properties.IsSpecializedInStaves = true;
				_properties.IsSpecializedInSlings = true;
			}
		}
	}

	function onAfterUpdate(_properties)
	{
		if (_properties.IsSpecializedInPolearms)
		{
			local weapon = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

			if (weapon != null && weapon.isItemType(this.Const.Items.ItemType.TwoHanded) && weapon.isItemType(this.Const.Items.ItemType.MeleeWeapon))
			{
				local skills = this.getContainer().getAllSkillsOfType(this.Const.SkillType.Active);
				foreach (skill in skills)
				{
					 if (skill.m.IsWeaponSkill && skill.m.MaxRange == 2 && skill.m.ActionPointCost >= 5)
					 {
						 skill.m.ActionPointCost = this.m.HasPolearmMastery ? 5 : 6;
					 }
				}
			}
		}
	}
});
