this.perk_ptr_rising_star <- this.inherit("scripts/skills/skill", {
	m = {
		IsSet = false
		StartLevel = 8,
		LevelsRequiredForPerk = 5	
	},
	function create()
	{
		this.m.ID = "perk.ptr_rising_star";
		this.m.Name = this.Const.Strings.PerkName.PTRRisingStar;
		this.m.Description = this.Const.Strings.PerkDescription.PTRRisingStar;
		this.m.Icon = "ui/perks/ptr_rising_star.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().getLevel() < this.m.StartLevel + this.m.LevelsRequiredForPerk)
		{
			_properties.XPGainMult *= 1.2;
		}
		else
		{
			_properties.XPGainMult *= 1.05;
		}
	}

	function onUpdateLevel()
	{
		local actor = this.getContainer().getActor();
		if (actor.m.Level == this.m.StartLevel + this.m.LevelsRequiredForPerk)
		{
			actor.m.PerkPoints += 2;
		}
	}


	function onAdded()
	{
		if (!this.m.IsSet)
		{
			this.m.StartLevel = this.getContainer().getActor().getLevel();
		}
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeU8(this.m.StartLevel);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.IsSet = true;
		this.m.StartLevel = _in.readU8();
	}
});
