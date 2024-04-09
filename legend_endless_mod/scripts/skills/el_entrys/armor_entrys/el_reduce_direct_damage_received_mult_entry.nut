this.el_reduce_direct_damage_received_mult_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_ReduceDirectDamageReceivedMult = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		if(this.m.EL_CurrentLevel != 1)
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]减少身体受到的忽视护甲伤害" + (1.0 - this.Math.round(this.Math.pow(1.0 - this.m.EL_CurrentLevel * this.m.EL_ReduceDirectDamageReceivedMult * 0.01, this.m.EL_StrengthLevel) * 100) * 0.01) * 100 +
					   "% (" + (1.0 - this.Math.round(this.Math.pow(1.0 - this.m.EL_ReduceDirectDamageReceivedMult * 0.01, this.m.EL_StrengthLevel) * 100) * 0.01) * 100 + "%)[/color]"
			};
		}
		else
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]减少身体受到的忽视护甲伤害" + (1.0 - this.Math.round(this.Math.pow(1.0 - this.m.EL_ReduceDirectDamageReceivedMult * 0.01, this.m.EL_StrengthLevel) * 100) * 0.01) * 100 + "%[/color]"
			};
		}
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_ReduceDirectDamageReceivedMult <= this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.RandomMinReduceDirectDamageReceivedMult[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.RandomMaxReduceDirectDamageReceivedMult[this.getItem().m.EL_RankLevel];
		this.m.EL_ReduceDirectDamageReceivedMult = this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.BaseReduceDirectDamageReceivedMult + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_strengthen()
	{
		this.m.EL_ReduceDirectDamageReceivedMult = (1.0 - this.Math.pow(1.0 - this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.ColourRange[this.Const.EL_Item.Type.Legendary] * 0.01, this.Const.EL_Armor.EL_Entry.EntryStrengthenMult)) * 100;
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_ReduceDirectDamageReceivedMult += this.Const.EL_Armor.EL_Entry.Factor.EL_ReduceDirectDamageReceivedMult.RandomMaxReduceDirectDamageReceivedMult[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && _hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			_properties.DamageReceivedDirectMult *= (1.0 - this.Math.round(this.Math.pow(1.0 - this.m.EL_CurrentLevel * this.m.EL_ReduceDirectDamageReceivedMult * 0.01, this.m.EL_StrengthLevel) * 100) * 0.01);
		}
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_ArmorDamageDirectReceivedMult *= this.Math.round(this.Math.pow(1.0 - this.m.EL_CurrentLevel * this.m.EL_ReduceDirectDamageReceivedMult * 0.01, this.m.EL_StrengthLevel) * 100) * 0.01;
	}

    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_ReduceDirectDamageReceivedMult);
		_out.writeI32(this.m.EL_StrengthLevel);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ReduceDirectDamageReceivedMult = _in.readF32();
		this.m.EL_StrengthLevel = _in.readI32();
	}
});