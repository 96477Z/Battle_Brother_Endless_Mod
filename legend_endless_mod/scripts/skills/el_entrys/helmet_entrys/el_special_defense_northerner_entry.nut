this.el_special_defense_northerner_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_DamageHeadReduction = 0.0,
		EL_Bonus = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		if(this.m.EL_CurrentLevel != 1)
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]被兽人和哥布林攻击时额外 + " + this.Math.ceil(this.m.EL_CurrentLevel * this.m.EL_Bonus) + "头部血量固定减伤和头部护甲固定减伤[/color]"
			};
		}
		else
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]被兽人和哥布林攻击时额外 + " + this.Math.ceil(this.m.EL_Bonus) + "头部血量固定减伤和头部护甲固定减伤[/color]"
			};
		}
	}	

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_DamageHeadReduction * 0.1 <= this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.RandomMinDamageHeadReduction[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.RandomMaxDamageHeadReduction[this.getItem().m.EL_RankLevel];
		this.m.EL_DamageHeadReduction = this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.BaseDamageHeadReduction + this.Math.rand(randomMin, randomMax);
	}

	function EL_strengthen()
	{
		this.m.EL_DamageHeadReduction = 10 * this.Const.EL_Helmet.EL_Entry.EntryStrengthenMult * this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_DamageHeadReduction += this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.RandomMaxDamageHeadReduction[this.Const.EL_Item.Type.Normal] / 2;
		}
	}

	function EL_onItemUpdate( _item )
	{
		this.m.EL_Bonus = this.m.EL_DamageHeadReduction * 0.2 * (1.0 + _item.m.EL_CurrentLevel * this.Const.EL_Helmet.EL_LevelFactor.DamageHeadRegularReduction);
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.isAlive() && _hitInfo.HeadPart == this.Const.HeadPart.Head)
		{
			foreach(valid_type in this.Const.EL_Helmet.EL_Entry.Factor.EL_SpecialDefenseNortherner.ValidEntity)
			{
				if(_attacker.getType() == valid_type)
				{
					_properties.EL_DamageHeadReduction += this.Math.ceil(this.m.EL_CurrentLevel * this.m.EL_Bonus);
					_properties.EL_DamageHeadRegularReduction += this.Math.ceil(this.m.EL_CurrentLevel * this.m.EL_Bonus);;
					return;
				}
			}
		}
	}

    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_DamageHeadReduction);
	}

	function onDeserialize( _in )
	{
		this.m.EL_DamageHeadReduction = _in.readF32();
	}
});