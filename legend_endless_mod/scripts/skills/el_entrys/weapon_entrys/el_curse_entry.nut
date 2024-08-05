this.el_curse_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
        EL_Curse = 0.0
    },
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.ID;
		this.m.Type = this.Const.SkillType.StatusEffect;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]诅咒：命中目标会使其本场战斗受到伤害 + " + this.m.EL_Curse + "%[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        for (local index = 0; index <= this.Const.EL_Item.Type.Legendary; ++index)
        {
            if (this.m.EL_Curse <= this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.ColourRange[index])
            {
                return this.Const.EL_Item.Colour[index];
            }
        }
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
	}

	function EL_createAddition()
	{
		local randomMin = this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.RandomMinCurse[this.getItem().m.EL_RankLevel];
		local randomMax = this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.RandomMaxCurse[this.getItem().m.EL_RankLevel];
		this.m.EL_Curse = this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.BaseCurse + this.Math.rand(randomMin, randomMax) * 0.01;
	}

	function EL_strengthen()
	{
		this.m.EL_Curse = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.ColourRange[this.Const.EL_Item.Type.Legendary];
	}

	function EL_onUpgradeRank()
	{
		if(EL_getEntryColour() != this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Legendary])
		{
			this.m.EL_Curse += this.Const.EL_Weapon.EL_Entry.Factor.EL_Curse.RandomMaxCurse[this.Const.EL_Item.Type.Normal] / 2 * 0.01;
		}
	}

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || !_skill.m.IsWeaponSkill) 
		{
			return;
		}
		
		//this.logInfo("curse");
        local skill = _targetEntity.getSkills().getSkillByID("el_effects.curse");
        if(skill == null)
        {
            skill = this.new("scripts/skills/el_effects/el_curse_effect");
            _targetEntity.getSkills().add(skill);
        }
        skill.EL_addBonus(this.m.EL_Curse);
	}

	function EL_refreshTotalEntry( _EL_totalEntry )
	{
		++_EL_totalEntry.m.EL_EntryNum;
		_EL_totalEntry.m.EL_Curse += this.m.EL_Curse;
	}
    
    function onSerialize( _out )
	{
		_out.writeF32(this.m.EL_Curse);
	}

	function onDeserialize( _in )
	{
		this.m.EL_Curse = _in.readF32();
	}
});