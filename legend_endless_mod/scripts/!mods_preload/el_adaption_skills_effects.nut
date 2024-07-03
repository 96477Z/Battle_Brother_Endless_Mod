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

    ::mods_hookExactClass("skills/effects/shieldwall_effect", function(o){
        local onUpdate = o.onUpdate;
        o.onUpdate = function( _properties )
        {
            local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
            if (item != null && item.isItemType(this.Const.Items.ItemType.Shield) && item.getCondition() > 0)
            {
                local mult = 1.0;
                local proficiencyBonus = 0;

                if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInShields)
                {
                    mult = mult * 1.25;
                }

                if (this.getContainer().getActor().getCurrentProperties().IsProficientWithShieldSkills)
                {
                    proficiencyBonus = 5;
                }

                _properties.MeleeDefense += this.Math.floor(item.getMeleeDefense() * mult) + proficiencyBonus;
                _properties.RangedDefense += this.Math.floor(item.getRangedDefense() * mult) + proficiencyBonus;
            }
        }
	});

	for(local i = 0; i < this.Const.EL_Config.EL_PoisonEffectList.len(); ++i) {
		::mods_hookExactClass("skills/" + this.Const.EL_Config.EL_PoisonEffectList[i].Script, function ( o )
		{
            local onAdded = o.onAdded;
            o.onAdded = function()
            {
                if (this.getContainer().getActor().getCurrentProperties().IsImmuneToPoison)
                {
                    this.removeSelf();
                    return;
                }
                onAdded();
            }            
		});
	}
});
