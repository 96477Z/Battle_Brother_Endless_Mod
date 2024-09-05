this.el_reflect_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_ReflectPercent = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.ID = this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		if(this.m.EL_CurrentLevel != 1)
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]反弹 " + this.Math.round(this.m.EL_CurrentLevel * this.m.EL_ReflectPercent * 100) * this.m.EL_StrengthLevel * 0.01 + "% (" + this.m.EL_ReflectPercent * this.m.EL_StrengthLevel + "%)头部护甲受到的伤害[/color]"
			};
		}
		else
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]反弹 " + this.m.EL_ReflectPercent * this.m.EL_StrengthLevel + "%头部护甲受到的伤害[/color]"
			};
		}
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_ReflectPercent <= this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.RandomMinReflectPercent[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.RandomMaxReflectPercent[this.getItem().m.EL_RankLevel];
		this.m.EL_ReflectPercent = this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.BaseReflectPercent + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_strengthen()
	{
		this.m.EL_ReflectPercent = this.Const.EL_Helmet.EL_Entry.EntryStrengthenMult * this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_ReflectPercent += this.Const.EL_Helmet.EL_Entry.Factor.EL_Reflect.RandomMaxReflectPercent[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.isAlive() && _attacker.getHitpoints() > 0 && _attacker.getID() != this.getContainer().getActor().getID() && _hitInfo.BodyPart == this.Const.BodyPart.Head && _skill.isAttack())
		{
			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = _hitInfo.DamageArmor * this.m.EL_ReflectPercent * this.m.EL_StrengthLevel * 0.01 / _properties.DamageTotalMult;
			hitInfo.DamageDirect = 0.0;
			hitInfo.BodyPart = this.Const.BodyPart.Head;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			_attacker.onDamageReceived(_attacker, null, hitInfo);
		}
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_HelmetReflectPercent += this.Math.round(this.m.EL_CurrentLevel * this.m.EL_ReflectPercent * 100) * this.m.EL_StrengthLevel * 0.01;
	}
    
    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_ReflectPercent);
		_out.writeI32(this.m.EL_StrengthLevel);
	}

	function onDeserialize( _in )
	{
		this.m.EL_ReflectPercent = _in.readF32();
		this.m.EL_StrengthLevel = _in.readI32();
	}
});