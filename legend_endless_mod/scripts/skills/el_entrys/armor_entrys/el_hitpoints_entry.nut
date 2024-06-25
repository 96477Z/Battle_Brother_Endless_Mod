this.el_hitpoints_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_Hitpoints = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		if(this.m.EL_CurrentLevel != 1)
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]生命值 + " + this.Math.round(this.m.EL_CurrentLevel * this.m.EL_Hitpoints) * this.m.EL_StrengthLevel + "% (" + this.m.EL_Hitpoints * this.m.EL_StrengthLevel + "%)[/color]"
			};
		}
		else
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]生命值 + " + this.m.EL_Hitpoints * this.m.EL_StrengthLevel + "%[/color]"
			};
		}
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_Hitpoints <= this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.RandomMinHitpoints[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.RandomMaxHitpoints[this.getItem().m.EL_RankLevel];
		this.m.EL_Hitpoints = this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.BaseHitpoints + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_strengthen()
	{
		this.m.EL_Hitpoints = this.Const.EL_Armor.EL_Entry.EntryStrengthenMult * this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_Hitpoints += this.Const.EL_Armor.EL_Entry.Factor.EL_Hitpoints.RandomMaxHitpoints[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

	// function onUpdate( _properties )
	// {
	// 	local container_scripts = this.IO.scriptFilenameByHash(this.getContainer().ClassNameHash);
	// 	//this.logInfo("Container:" + this.IO.scriptFilenameByHash(container.ClassNameHash));
	// 	if(container_scripts == "scripts/skills/skill_container")
	// 	{
	// 		_properties.Hitpoints += this.Math.floor(0.01 * this.m.EL_CurrentLevel * this.m.EL_Hitpoints * this.getContainer().getActor().getBaseProperties().Hitpoints);
	// 	}
	// }

	function onUpdate( _properties )
	{
		_properties.Hitpoints += this.Math.floor(0.01 * this.m.EL_CurrentLevel * this.m.EL_Hitpoints * this.getContainer().getActor().getBaseProperties().Hitpoints * this.m.EL_StrengthLevel);
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_Hitpoints += this.Math.round(this.m.EL_CurrentLevel * this.m.EL_Hitpoints * this.m.EL_StrengthLevel);
	}

    function onSerialize( _out )
	{
		_out.writeI32(this.m.EL_Hitpoints);
		_out.writeI32(this.m.EL_StrengthLevel);
	}

	function onDeserialize( _in )
	{
		this.m.EL_Hitpoints = _in.readI32();
		this.m.EL_StrengthLevel = _in.readI32();
	}
});