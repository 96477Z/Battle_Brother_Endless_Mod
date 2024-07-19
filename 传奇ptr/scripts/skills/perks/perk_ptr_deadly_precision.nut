this.perk_ptr_deadly_precision <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		MinBonus = 0,
		MaxBonus = 25
	},
	function create()
	{
		this.m.ID = "perk.ptr_deadly_precision";
		this.m.Name = this.Const.Strings.PerkName.PTRDeadlyPrecision;
		this.m.Description = this.Const.Strings.PerkDescription.PTRDeadlyPrecision;
		this.m.Icon = "ui/perks/ptr_deadly_precision.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local weapon = this.getContainer().getActor().getMainhandItem();		
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Flail))
		{
			return false;
		}

		return true;
	}
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.isEnabled())
		{
			_properties.DamageDirectAdd += 0.01 * (_targetEntity == null ? this.m.MaxBonus : this.Math.rand(this.m.MinBonus, this.m.MaxBonus)); 
		}
	}
});

