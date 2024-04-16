local gt = getroottable();

::mods_registerMod("el_adaption_skills_effects", 1, "el_adaption_skills_actives");
::mods_queue(null, "el_player_npc", function ()
{
    ::mods_hookExactClass("skills/effects/possessed_undead_effect", function(o){
        local onRemoved = o.onRemoved;
        o.onRemoved = function()
        {

            if(this.getContainer() != null && !this.getContainer().getActor().isSummoned())
            {
                onRemoved();
            }
            if (this.getContainer() != null)
            {
                local actor = this.getContainer().getActor();

                if (actor.hasSprite("status_rage"))
                {
                    if (actor.isHiddenToPlayer())
                    {
                        actor.getSprite("status_rage").Visible = false;
                    }
                    else
                    {
                        local sprite = actor.getSprite("status_rage");
                        sprite.fadeOutAndHide(1500);

                        if (this.m.IsAlive)
                        {
                            this.Time.scheduleEvent(this.TimeUnit.Real, 1800, function ( _d )
                            {
                                if (_d.isAlive())
                                {
                                    _d.setDirty(true);
                                }
                            }, actor);
                        }
                    }
                }
            }

            if (this.m.Possessor != null && !this.m.Possessor.isNull() && this.m.Possessor.isAlive())
            {
                local skill = this.m.Possessor.getSkills().getSkillByID("effects.possessing_undead");

                if (skill != null)
                {
                    skill.setPossessed(null);
                    this.m.Possessor.getSkills().remove(skill);
                }
            }
        }

	});
});
