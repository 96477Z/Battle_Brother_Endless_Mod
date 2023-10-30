this.el_shield_damage_mult_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_ShieldDamageMult = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]对盾牌的伤害 + " + this.m.EL_ShieldDamageMult + "%(面板)[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_ShieldDamageMult <= this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.RandomMinShieldDamageMult[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.RandomMaxShieldDamageMult[this.getItem().m.EL_RankLevel];
		this.m.EL_ShieldDamageMult = this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.BaseShieldDamageMult + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_strengthen()
	{
		this.m.EL_ShieldDamageMult = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_ShieldDamageMult += this.Const.EL_Weapon.EL_Entry.Factor.EL_ShieldDamageMult.RandomMaxShieldDamageMult[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

	function EL_onItemUpdate( _item )
	{
        _item.m.ShieldDamage = this.Math.ceil(_item.m.ShieldDamage * (1.0 + this.m.EL_ShieldDamageMult * 0.01));
	}
    
    function onSerialize( _out )
	{
		_out.writeI32(this.m.EL_ShieldDamageMult);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ShieldDamageMult = _in.readI32();
	}
});