this.el_special_effect_greenskin_entry <- this.inherit("scripts/skills/el_entrys/el_accessory_entry", {
	m = {
        EL_DamageMult = 0.0,
		EL_ReduceDamageReceivedMult = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		if(this.m.EL_CurrentLevel != 1)
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]对兽人和哥布林伤害 + " + this.Math.round(this.m.EL_CurrentLevel * this.m.EL_DamageMult * 100) * 0.01 + "%，减伤 + " + this.Math.round(this.m.EL_CurrentLevel * this.m.EL_ReduceDamageReceivedMult * 100) * 0.01 + "% (" + this.m.EL_DamageMult + "%)[/color]"
			};
		}
		else
		{
			return {
				id = _id,
				type = "text",
				text = "[color=" + colour + "]对兽人和哥布林伤害 + " + this.m.EL_DamageMult + "%，减伤 + " + this.m.EL_ReduceDamageReceivedMult + "%[/color]"
			};
		}
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_DamageMult <= this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.RandomMinDamageMult[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.RandomMaxDamageMult[this.getItem().m.EL_RankLevel];
		this.m.EL_DamageMult = this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.BaseDamageMult + this.Math.rand(randomMin, randomMax) * 0.01;
		this.m.EL_ReduceDamageReceivedMult = this.m.EL_DamageMult;
	}

	function EL_strengthen()
	{
		this.m.EL_DamageMult = this.Const.EL_Accessory.EL_Entry.EntryStrengthenMult * this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.ColourRange[this.Const.EL_Item.Type.Legendary];
		this.m.EL_ReduceDamageReceivedMult = (1.0 - this.Math.pow(1.0 - this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.ColourRange[this.Const.EL_Item.Type.Legendary] * 0.01, this.Const.EL_Accessory.EL_Entry.EntryStrengthenMult)) * 100;
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_DamageMult += this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.RandomMaxDamageMult[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
			this.m.EL_ReduceDamageReceivedMult += this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.RandomMaxDamageMult[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || _targetEntity == null)
		{
			return;
		}
		foreach(valid_type in this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.ValidEntity)
		{
			if(_targetEntity.getType() == valid_type)
			{
				_properties.DamageTotalMult *= 1.0 + this.m.EL_CurrentLevel * this.m.EL_DamageMult * 0.01;
				return;
			}
		}
	}

	function onBeingAttacked( _attacker, _skill, _properties )
	{
		if(_attacker == null && _attacker.isAlive() && !_attacker.isAlliedWith(actor)) {
			return;
		}
		foreach(valid_type in this.Const.EL_Accessory.EL_Entry.Factor.EL_SpecialEffectGreenskin.ValidEntity)
		{
			if(_attacker.getType() == valid_type)
			{
				_properties.DamageReceivedTotalMult /= 1.0 + this.m.EL_CurrentLevel * this.m.EL_ReduceDamageReceivedMult * 0.01;
				return;
			}
		}
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_DamageMultForGreenskin *= 1.0 + this.m.EL_CurrentLevel * this.m.EL_DamageMult * 0.01;
		_EL_totalEntry.m.EL_DamageReceivedMultForGreenskin /= 1.0 + this.m.EL_CurrentLevel * this.m.EL_ReduceDamageReceivedMult * 0.01;
	}

    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_DamageMult);
		_out.writeF32(this.m.EL_ReduceDamageReceivedMult);
	}

	function onDeserialize( _in )
	{
		this.m.EL_DamageMult = _in.readF32();
		this.m.EL_ReduceDamageReceivedMult = _in.readF32();
	}
});