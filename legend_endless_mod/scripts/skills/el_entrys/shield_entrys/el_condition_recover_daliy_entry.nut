this.el_condition_recover_daliy_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_ConditionRecoverDaliyAddition = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Shield.EL_Entry.Factor.EL_ConditionRecoverDaliy.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]Recover " + this.m.EL_ConditionRecoverDaliyAddition + "% Durability every day[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index < this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_ConditionRecoverDaliyAddition <= this.Const.EL_Shield.EL_Entry.Factor.EL_ConditionRecoverDaliy.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Shield.EL_Entry.Factor.EL_ConditionRecoverDaliy.RandomMinConditionRecoverDaliy[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Shield.EL_Entry.Factor.EL_ConditionRecoverDaliy.RandomMaxConditionRecoverDaliy[this.getItem().m.EL_RankLevel];
		this.m.EL_ConditionRecoverDaliyAddition = this.Const.EL_Shield.EL_Entry.Factor.EL_ConditionRecoverDaliy.BaseConditionRecoverDaliy + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_onNewDay( _item )
	{
		if(_item != null)
		{
			local condition_recover = this.Math.round(_item.getConditionMax() * this.m.EL_ConditionRecoverDaliyAddition * 0.01);
			_item.setCondition(this.Math.min(_item.getConditionMax(), _item.getCondition() + condition_recover));
		}
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_ShieldConditionRecoverDaliyAddition += this.m.EL_ConditionRecoverDaliyAddition;
	}
    
    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_ConditionRecoverDaliyAddition);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ConditionRecoverDaliyAddition = _in.readF32();
	}
});