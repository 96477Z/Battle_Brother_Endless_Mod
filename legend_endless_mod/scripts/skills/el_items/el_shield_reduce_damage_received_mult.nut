this.el_shield_reduce_damage_received_mult <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "items.shield_reduce_damage_received_mult";
		this.m.Type = this.Const.SkillType.Item;
        this.m.Order = this.Const.SkillOrder.First;
	}

    function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}    

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}
		local weapon = _attacker.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
        if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Flail))
        {
            return;
        }
		_properties.DamageReceivedTotalMult /= 1.0 + this.m.Item.getMeleeDefense() * 0.01 + this.m.Item.getRangedDefense() * 0.01;
	}
});

