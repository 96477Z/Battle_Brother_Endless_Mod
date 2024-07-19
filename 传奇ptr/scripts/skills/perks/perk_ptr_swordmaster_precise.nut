this.perk_ptr_swordmaster_precise <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {
		DidApply = false
	},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_precise";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterPrecise;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterPrecise;
		this.m.Icon = "ui/perks/ptr_swordmaster_precise.png";
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (_skill.isAOE()) return;

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isWeaponType(::Const.Items.WeaponType.BFFencing))
		{
			::Const.Combat.ArmorDirectDamageMitigationMult /= 2;
			this.m.DidApply = true;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.m.DidApply)
		{
			::Const.Combat.ArmorDirectDamageMitigationMult *= 2;
			this.m.DidApply = false;
		}
	}
});
