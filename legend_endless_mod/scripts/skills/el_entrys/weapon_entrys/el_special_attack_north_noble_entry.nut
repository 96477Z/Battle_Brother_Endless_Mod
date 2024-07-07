this.el_special_attack_north_noble_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_DamageMult = 0.0,
		EL_AdditionalAccuracy = 0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.ID;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]对北方贵族和村兵 + " + this.m.EL_DamageMult + "%伤害和" + this.m.EL_AdditionalAccuracy + "%命中率[/color]"
		};
		return result;
	}
	
	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_DamageMult <= this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.RandomMinDamageMult[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.RandomMaxDamageMult[this.getItem().m.EL_RankLevel];
		this.m.EL_DamageMult = this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.BaseDamageMult + this.Math.rand(randomMin, randomMax) * 0.01;
		this.m.EL_AdditionalAccuracy = this.Math.floor(this.m.EL_DamageMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.AdditionalAccuracyFactor);
	}

	function EL_strengthen()
	{
		this.m.EL_DamageMult = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.ColourRange[this.Const.EL_Item.Type.Legendary];
		this.m.EL_AdditionalAccuracy = this.Math.floor(this.m.EL_DamageMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.AdditionalAccuracyFactor);
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_DamageMult += this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.RandomMaxDamageMult[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
			this.m.EL_AdditionalAccuracy = this.Math.floor(this.m.EL_DamageMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.AdditionalAccuracyFactor);
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || _targetEntity == null)
		{
			return;
		}
		foreach(valid_type in this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.ValidEntity)
		{
			if(_targetEntity.getType() == valid_type)
			{
				_properties.RangedSkill += this.m.EL_AdditionalAccuracy;
				_properties.MeleeSkill += this.m.EL_AdditionalAccuracy;
				_properties.DamageTotalMult *= 1.0 + this.m.EL_DamageMult * 0.01;
				return;
			}
		}
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_DamageMultForNorthNoble *= 1.0 + this.m.EL_DamageMult * 0.01;
		_EL_totalEntry.m.EL_AdditionalAccuracyForNorthNoble += this.m.EL_AdditionalAccuracy;
	}
    
    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_DamageMult);
	}

	function onDeserialize( _in )
	{
		this.m.EL_DamageMult = _in.readF32();
		this.m.EL_AdditionalAccuracy = this.Math.floor(this.m.EL_DamageMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_SpecialAttackNorthNoble.AdditionalAccuracyFactor);
	}
});