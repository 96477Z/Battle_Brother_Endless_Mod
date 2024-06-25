this.el_use_skill_fatigue_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_UseSkillfatigue = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]武器技能疲劳消耗 - " + this.Math.floor(this.m.EL_UseSkillfatigue) + "(面板)[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_UseSkillfatigue <= this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.RandomMinUseSkillfatigue[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.RandomMaxUseSkillfatigue[this.getItem().m.EL_RankLevel];
		this.m.EL_UseSkillfatigue = this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.BaseUseSkillfatigue + this.Math.rand(randomMin, randomMax);
	}

	function EL_strengthen()
	{
		this.m.EL_UseSkillfatigue = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_UseSkillfatigue += this.Const.EL_Weapon.EL_Entry.Factor.EL_UseSkillfatigue.RandomMaxUseSkillfatigue[this.Const.EL_Item.Type.Normal] / 2.0;
		}
	}

	function EL_onItemUpdate( _item )
	{
        _item.m.FatigueOnSkillUse = _item.m.EL_BaseWithRankFatigueOnSkillUse - this.Math.floor(this.m.EL_UseSkillfatigue);
	}
    
    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_UseSkillfatigue);
	}

	function onDeserialize( _in )
	{
		this.m.EL_UseSkillfatigue = _in.readF32();
	}
});