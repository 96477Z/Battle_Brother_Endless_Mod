this.el_wither_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.wither";
		this.m.Name = "凋零";
		this.m.Description = "";
	}

	function onTurnEnd()
	{
        local actor = this.getContainer().getActor();
        if(actor == null || actor.isDying() || !actor.isAlive()) {
            return;
        }
        local targets = this.Tactical.Entities.getAllInstances();
        local damage = this.Math.floor((this.Const.EL_NPC.EL_NPCBuff.Factor.Wither.DamageBase * (1 + actor.EL_getCombatLevel() * this.Const.EL_NPC.EL_NPCBuff.Factor.Wither.DamageMultPurCombatLevel)) * this.Const.EL_NPC.EL_NPCBuff.Factor.Wither.DamageRate[this.m.EL_RankLevel]);
        if(actor.EL_isNonHumanoid()) {
            local level_ups = actor.EL_getLevel();
            if(level_ups > this.Const.EL_NPC.EL_LevelUp.MaxXPLevel) {
                level_ups = this.Const.EL_NPC.EL_LevelUp.MaxXPLevel + (level_ups - this.Const.EL_NPC.EL_LevelUp.MaxXPLevel) * this.Const.EL_NPC.EL_LevelUp.PropertiesLevelUpMultAfterMaxXPLevel;
            }
            level_ups -= this.Const.EL_NPC.EL_LevelUp.LevelUpsOffset;
            if(level_ups < 0) {
                level_ups = 0;
            }
            damage = this.Math.floor(damage / (1.0 + this.Const.EL_NPC.EL_LevelUp.LevelUpDamageMult * level_ups));
        }
        local affect_targets = [];
        foreach( tar in targets )
        {
            foreach( t in tar )
            {
                if(t != null && !t.isAlliedWith(actor) && !t.isDying() && t.isAlive()) {
                    local distance = actor.getTile().getDistanceTo(t.getTile());
                    if(distance <= this.Const.EL_NPC.EL_NPCBuff.Factor.Wither.MaxDistance) {
                        affect_targets.push(t);
                    }
                }
            }
        }

        for(local i = 0; i < affect_targets.len(); ++i) {
            if(affect_targets[i] == null || affect_targets[i].isDying() || !affect_targets[i].isAlive()) {
                continue;
            }
            local distance = actor.getTile().getDistanceTo(affect_targets[i].getTile());
            local damage_persent = this.Math.pow(this.Const.EL_NPC.EL_NPCBuff.Factor.Wither.DamageDecayRatePurTile, (distance - 1));
			local hit_info = clone this.Const.Tactical.HitInfo;
			hit_info.DamageRegular = this.Math.ceil(damage_persent * damage);
			hit_info.DamageDirect = 1;
			hit_info.BodyPart = this.Const.BodyPart.Body;
			hit_info.BodyDamageMult = 1.0;
			hit_info.FatalityChanceMult = 0.0;
			affect_targets[i].onDamageReceived(actor, this, hit_info);

        }

        if (!actor.isHiddenToPlayer())
        {
            this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " 周围凋零了!");
        }
	}
	
    function EL_updateDescription() {
		this.m.Description = "回合结束时对周围4格范围内所有敌方单位造成一段无视护甲的伤害，每远离1格衰减百分之50%伤害。";
    }
});

