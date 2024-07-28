this.el_boss_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.boss";
		this.m.Name = "极尽升华（全稀有）";
		this.m.Description = ""
		this.m.Icon = "el_skills/champion_rank_2.png";
		this.m.IconMini = "champion_rank_2_mini";
		this.m.Overlay = "champion_rank_2";
		this.m.Type = this.Const.SkillType.StatusEffect;
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.getContainer().add(this.new("scripts/skills/el_entrys/rarity_entrys/el_legendary_prestige_entry"));
	        for(local i = 0; i < this.Const.EL_Rarity_Entry.Pool.Entrys.len(); ++i) {
			    this.getContainer().add(this.new(this.Const.EL_Rarity_Entry.Pool.Entrys[i].Scripts));
            }            
		}
	}

	function EL_isUsable()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player;
	}

	function onUpdate( _properties )
	{
        if(EL_isUsable())
        {
			_properties.InitiativeForTurnOrderAdditional -= 1000;
        }
	}
});

