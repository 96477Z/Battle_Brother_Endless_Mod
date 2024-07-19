this.perk_ptr_hybridization <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_hybridization";
		this.m.Name = this.Const.Strings.PerkName.PTRHybridization;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHybridization;
		this.m.Icon = "ui/perks/ptr_hybridization.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local baseProperties = this.getContainer().getActor().getBaseProperties();

		local fraction = this.m.Bonus * 0.01;

		_properties.MeleeSkill += this.Math.floor(baseProperties.getRangedSkill() * fraction);

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
		{
			_properties.RangedSkill += this.Math.floor(baseProperties.getMeleeSkill() * fraction);
		}
	}
});
