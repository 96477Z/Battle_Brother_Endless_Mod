this.el_special_defense_undead_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_DoubleMelee = 0.0,
		EL_AdditionalAccuracy = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]对亡灵 + " + this.m.EL_DoubleMelee + "盾牌双防[/color]"
		};
		return result;
	}
	
	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_DoubleMelee <= this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.RandomMinShieldDoubleDefense[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.RandomMaxShieldDoubleDefense[this.getItem().m.EL_RankLevel];
		this.m.EL_DoubleMelee = this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.BaseShieldDoubleDefense + this.Math.rand(randomMin, randomMax);
	}

	function EL_strengthen()
	{
		this.m.EL_DoubleMelee = this.Const.EL_Shield.EL_Entry.EntryStrengthenMult * this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.ColourRange[this.Const.EL_Item.Type.Legendary];
		this.m.EL_AdditionalAccuracy = this.Math.floor(this.m.EL_DoubleMelee * this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.AdditionalAccuracyFactor);
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_DoubleMelee += this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseUndead.RandomMaxShieldDoubleDefense[this.Const.EL_Item.Type.Normal] / 2;
		}
	}

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if(_attacker == null && _attacker.isAlive() && !_attacker.isAlliedWith(actor)) {
			return;
		}
		foreach(valid_type in this.Const.EL_Shield.EL_Entry.Factor.EL_SpecialDefenseSoutherner.ValidEntity)
		{
			if(_attacker.getType() == valid_type)
			{
				_properties.MeleeDefense += this.m.EL_DoubleMelee;
				_properties.RangedDefense += this.m.EL_DoubleMelee;
				return;
			}
		}
	}
    
    function onSerialize( _out )
	{
		_out.writeI32(this.m.EL_DoubleMelee);
	}

	function onDeserialize( _in )
	{
		this.m.EL_DoubleMelee = _in.readI32();
	}
});