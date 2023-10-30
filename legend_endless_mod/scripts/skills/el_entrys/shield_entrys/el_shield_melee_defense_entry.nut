this.el_shield_melee_defense_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_ShieldMeleeDefense = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]盾牌近战防御 + " + this.m.EL_ShieldMeleeDefense + "(面板)[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_ShieldMeleeDefense <= this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.RandomMinShieldMeleeDefense[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.RandomMaxShieldMeleeDefense[this.getItem().m.EL_RankLevel];
		this.m.EL_ShieldMeleeDefense = this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.BaseShieldMeleeDefense + this.Math.rand(randomMin, randomMax);
	}

	function EL_strengthen()
	{
		this.m.EL_ShieldMeleeDefense = this.Const.EL_Shield.EL_Entry.EntryStrengthenMult * this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_ShieldMeleeDefense += this.Const.EL_Shield.EL_Entry.Factor.EL_ShieldMeleeDefense.RandomMaxShieldMeleeDefense[this.Const.EL_Item.Type.Normal] / 2;
		}
	}

	function EL_onItemUpdate( _item )
	{
        _item.m.MeleeDefense += this.m.EL_ShieldMeleeDefense;
	}
    
    function onSerialize( _out )
	{
		_out.writeI32(this.m.EL_ShieldMeleeDefense);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ShieldMeleeDefense = _in.readI32();
	}
});