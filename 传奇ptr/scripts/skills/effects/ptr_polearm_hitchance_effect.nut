this.ptr_polearm_hitchance_effect <- this.inherit("scripts/skills/skill", {
	m = {
		HitChanceMalusAdjacent = -15
	},
	function create()
	{
		this.m.ID = "effects.ptr_polearm_hitchance";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";		
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function isEnabled()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.getRangeMax() > 1 && weapon.isItemType(this.Const.Items.ItemType.TwoHanded) && !weapon.isWeaponType(this.Const.Items.WeaponType.Staff))
		{
			return true;
		}

		return false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || _skill.getMaxRange() == 1 || !this.isEnabled() || !this.Tactical.TurnSequenceBar.isActiveEntity(this.getContainer().getActor()))
		{
			return;
		}

		if (this.getContainer().getActor().isEngagedInMelee())
		{
			_properties.MeleeSkill += this.m.HitChanceMalusAdjacent;
		}
	}

	function onGetHitFactors( _skill, _targetTile, _tooltip )
	{
		if (_skill.getMaxRange() > 1 && this.isEnabled())
		{			
			if (this.getContainer().getActor().isEngagedInMelee())
			{
				_tooltip.push({
					icon = "ui/tooltips/negative.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.HitChanceMalusAdjacent + "%[/color] Engaged in Melee"
				});
			}
		}
	}
});
