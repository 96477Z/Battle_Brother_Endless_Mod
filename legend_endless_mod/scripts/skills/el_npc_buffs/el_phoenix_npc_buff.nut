this.el_phoenix_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
    m = {
        EL_RiseTimesLeft = 0,
        EL_IsRising = false,
        EL_RisingReset = false,
        EL_MoraleState = 0
    },
    function create()
    {
        this.el_npc_buff.create();
        this.m.ID = "el_npc_buffs.phoenix";
        this.m.Name = "不死鸟";
        this.m.Description = "";
    }

    function EL_setRankLevel(_EL_rankLevel) {
        this.el_npc_buff.EL_setRankLevel(_EL_rankLevel);
        this.m.EL_RiseTimesLeft = this.Const.EL_NPC.EL_NPCBuff.Factor.Phoenix.RiseTimes[this.m.EL_RankLevel];
    }

	function onAdded()
	{
        local actor = this.getContainer().getActor();
        actor.setIsAbleToDie(false);
	}

	function onCombatStarted()
	{
        local actor = this.getContainer().getActor();
        actor.setIsAbleToDie(false);
		this.m.EL_RiseTimesLeft = this.Const.EL_NPC.EL_NPCBuff.Factor.Phoenix.RiseTimes[this.m.EL_RankLevel];
	}

	function onCombatFinished()
	{
        local actor = this.getContainer().getActor();
        actor.setIsAbleToDie(true);
        if(this.m.EL_MoraleState != this.Const.MoraleState.Ignore) {
            actor.setMoraleState(this.Const.MoraleState.Steady);
        }
        else {
            actor.setMoraleState(this.Const.MoraleState.Ignore);
        }
		this.m.EL_RiseTimesLeft = 0;
	}



	function onTurnStart()
	{
        if(this.m.EL_IsRising) {
            this.m.EL_IsRising = false;
            this.m.EL_RisingReset = true;
            --this.m.EL_RiseTimesLeft;
            local actor = this.getContainer().getActor();
            local properties = actor.getBaseProperties();
            actor.m.IsAttackable = true;
            if(this.m.EL_RiseTimesLeft == 0) {
                actor.setIsAbleToDie(true);
            }
            actor.EL_resetOtherStates();
            actor.setHitpoints(actor.getHitpointsMax());
            actor.setActionPoints(actor.getActionPointsMax());
            actor.setFatigue(0);
            if(this.m.EL_MoraleState != this.Const.MoraleState.Ignore) {
                actor.setMoraleState(this.Const.MoraleState.Confident);
            }
            local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            if(body != null) {
                body.setArmor(body.getArmorMax());
                body.updateAppearance();
            }
            else {
                properties.Armor[this.Const.BodyPart.Body] = properties.ArmorMax[this.Const.BodyPart.Body];
            }

            local head = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
            if(head != null) {
                head.setArmor(head.getArmorMax());
                head.updateAppearance();
            }
            else {
                properties.Armor[this.Const.BodyPart.Head] = properties.ArmorMax[this.Const.BodyPart.Head];
            }

            if (!actor.isHiddenToPlayer())
            {
                this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " 复活了!");
            }
            actor.getSkills().update();
        }
	}


    function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
    {
        if(this.m.EL_IsRising) {
            return;
        }
        local actor = this.getContainer().getActor();
        if ((this.m.EL_RiseTimesLeft > 0 && _damageHitpoints > actor.getHitpoints()) || actor.getHitpoints() <= 0)
        {
            this.m.EL_IsRising = true;
            local actor = this.getContainer().getActor();
            local properties = actor.getCurrentProperties();
            actor.m.IsAttackable = false;
            actor.setActionPoints(0);
            actor.setFatigue(actor.getFatigueMax());
            this.m.EL_MoraleState = actor.getMoraleState();
            actor.m.MoraleState = this.Const.MoraleState.Ignore;
            local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
            if(body != null) {
                body.setArmor(0);
            }
            else {
                properties.Armor[this.Const.BodyPart.Body] = 0;
            }

            local head = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
            if(head != null) {
                head.setArmor(0);
            }
            else {
                properties.Armor[this.Const.BodyPart.Head] = 0;
            }
            local skills = actor.getSkills();
            foreach( skill in skills.m.Skills ) {
                local skill_type = skill.getType();
                if(!skill.isType(this.Const.SkillType.None) &&
                   !skill.isType(this.Const.SkillType.Active) &&
                   !skill.isType(this.Const.SkillType.Trait) &&
                   !skill.isType(this.Const.SkillType.Racial) &&
                   !skill.isType(this.Const.SkillType.StatusEffect) &&
                   !skill.isType(this.Const.SkillType.Special) &&
                   !skill.isType(this.Const.SkillType.Item) &&
                   !skill.isType(this.Const.SkillType.Perk) &&
                   !skill.isType(this.Const.SkillType.Terrain) &&
                   !skill.isType(this.Const.SkillType.WorldEvent) &&
                   !skill.isType(this.Const.SkillType.Background) &&
                   !skill.isType(this.Const.SkillType.Alert) &&
                   skill.getID() != "effects.gruesome_feast"
                )
                {
                    skills.remove(skill);
                }
            }
            // local stunned_effect = skills.getSkillByID("effects.stunned");
            // if(stunned_effect != null)
            // {
            //     skills.remove(stunned_effect);
            // }
            if (!actor.isHiddenToPlayer())
            {
                this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " 正在复活!");
            }
            actor.getSkills().update();

        }
    }

    function onUpdate( _properties )
    {
        if(this.m.EL_IsRising) {
            _properties.IsStunned = true;
        }
        if(this.m.EL_RisingReset == true) {
            this.m.EL_RisingReset = false;
            _properties.IsStunned = false;
        }
		if(this.m.EL_RiseTimesLeft != 0) {
			this.m.Name = "不死鸟(x" + this.m.EL_RiseTimesLeft + ")";
		}
		else {
			this.m.Name = "不死鸟";
		}
    }
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "受到致死攻击进入涅槃状态，再下个回合开始阶段退出涅槃状态并恢复全部血量，护甲，疲劳和行动点，清空所有buff，士气恢复为自信。每场可生效" + this.Const.EL_NPC.EL_NPCBuff.Factor.Phoenix.RiseTimes[this.m.EL_RankLevel] + "次";
    }

});

