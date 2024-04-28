this.el_reduce_damage_received_mult_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_ReduceDamageReceivedMult = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		if(this.m.EL_CurrentLevel != 1)
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]受到伤害 - " + this.Math.round(this.m.EL_CurrentLevel * this.m.EL_ReduceDamageReceivedMult * 100) * 0.01 + "% (" + this.m.EL_ReduceDamageReceivedMult + "%)[/color]"
			};
		}
		else
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]受到伤害 - " + this.m.EL_ReduceDamageReceivedMult + "%[/color]"
			};
		}
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_ReduceDamageReceivedMult <= this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.RandomMinReduceDamageReceivedMult[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.RandomMaxReduceDamageReceivedMult[this.getItem().m.EL_RankLevel];
		this.m.EL_ReduceDamageReceivedMult = this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.BaseReduceDamageReceivedMult + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_strengthen()
	{
		this.m.EL_ReduceDamageReceivedMult = (1.0 - this.Math.pow(1.0 - this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.ColourRange[this.Const.EL_Item.Type.Legendary] * 0.01, this.Const.EL_Accessory.EL_Entry.EntryStrengthenMult)) * 100;
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_ReduceDamageReceivedMult += this.Const.EL_Accessory.EL_Entry.Factor.EL_ReduceDamageReceivedMult.RandomMaxReduceDamageReceivedMult[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult /= 1.0 + this.m.EL_CurrentLevel * this.m.EL_ReduceDamageReceivedMult * 0.01;
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_DamageReceivedMult += this.Math.round(this.m.EL_CurrentLevel * this.m.EL_ReduceDamageReceivedMult * 100) * 0.01;
	}

    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_ReduceDamageReceivedMult);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ReduceDamageReceivedMult = _in.readF32();
	}
});