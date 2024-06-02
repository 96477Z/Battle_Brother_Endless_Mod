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

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult /= 1.0 + this.m.Item.getMeleeDefense() * 0.01 + this.m.Item.getRangedDefense() * 0.01;
        //this.logInfo("DamageReceivedTotalMult:" + 1 / (1.0 + this.m.Item.getMeleeDefense() * 0.01 + this.m.Item.getRangedDefense() * 0.01));
	}
});

