this.perk_ptr_man_of_steel <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_man_of_steel";
		this.m.Name = this.Const.Strings.PerkName.PTRManOfSteel;
		this.m.Description = this.Const.Strings.PerkDescription.PTRManOfSteel;
		this.m.Icon = "ui/perks/ptr_man_of_steel.png";
		this.m.IconMini = "ptr_man_of_steel_mini";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		_properties.ArmorMult[_hitInfo.BodyPart] *= 2;
	}
});
