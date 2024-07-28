this.el_beheaded_effect <- this.inherit("scripts/skills/skill", {
	m = {
        Duration = 1,
        Killer = null
        Skill = null
    },
	function create()
	{
		this.m.ID = "el_effects.beheaded";
		this.m.Name = "终结";
		this.m.Description = "这个角色无法苟活";
		this.m.Icon = "skills/ptr_dismantled_effect.png";
		this.m.IconMini = "ptr_dismantled_effect_mini";
		this.m.Overlay = "ptr_dismantled_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.Order = this.Const.SkillOrder.VeryLast;
	}

	function onAfterUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
        if(actor.getHitpoints() == 1)
        {
			actor.setHitpoints(2);
            actor.kill(this.m.Killer, this.m.Skill);
        }
	}

	function onRoundEnd()
	{
		--this.m.Duration;
		if(!this.m.Duration)
		{
			this.removeSelf();
		}
	}

});