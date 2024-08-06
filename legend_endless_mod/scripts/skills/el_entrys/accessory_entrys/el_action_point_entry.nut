this.el_action_point_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_ActionPoint = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Accessory.EL_Entry.Factor.EL_ActionPoint.ID;
		this.m.EL_ActionPoint = this.Const.EL_Accessory.EL_Entry.Factor.EL_ActionPoint.ActionPoint;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]行动点 + " + this.m.EL_ActionPoint + "[/color]"
		};
		if(this.m.EL_CurrentLevel != 1)
		{
			result.text += "[color=" + this.Const.EL_Item.Type.Normal + "] (等级不足，暂不生效)[/color]";
		}
		return result;
	}
	function EL_getEntryColour()
	{
		if(this.m.EL_ActionPoint > this.Const.EL_Accessory.EL_Entry.Factor.EL_ActionPoint.ActionPoint)
		{
			return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
		}
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special];
	}

	function EL_strengthen()
	{
		this.m.EL_ActionPoint = this.Const.EL_Accessory.EL_Entry.EntryStrengthenMult * this.Const.EL_Accessory.EL_Entry.Factor.EL_ActionPoint.ActionPoint;
	}

	function onUpdate( _properties )
	{
		if(this.m.EL_CurrentLevel == 1)
		{
			_properties.ActionPoints += this.m.EL_ActionPoint;
		}
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		if(this.m.EL_CurrentLevel == 1)
		{
			++_EL_totalEntry.m.EL_EntryNum;
			_EL_totalEntry.m.EL_ActionPoint += this.m.EL_ActionPoint;
		}
	}

    function onSerialize( _out )
	{
		_out.writeI32(this.m.EL_ActionPoint);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ActionPoint = _in.readI32();
	}
});