this.el_recovery_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.recovery";
		this.m.Name = "恢复";
		this.m.Description = "";
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
        local properties = actor.getCurrentProperties();

		local hitpoints_added = actor.getHitpoints();
        actor.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() + this.Math.round(actor.getHitpointsMax() * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.HitpointsRecoveryRate[this.m.EL_RankLevel])));
		hitpoints_added = actor.getHitpoints() - hitpoints_added;
		local fatigue_added = actor.getFatigue();
        actor.setFatigue(this.Math.max(0, actor.getFatigue() - this.Math.round(this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.FatigueRecoveryRate[this.m.EL_RankLevel])));
		fatigue_added = actor.getFatigue() - fatigue_added;

        local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
        local body_armor_added = this.Math.round(properties.Armor[this.Const.BodyPart.Body] * properties.ArmorMult[this.Const.BodyPart.Body]);
        if(body != null) {
            body.setArmor(this.Math.min(body.getArmorMax(), body.getArmor() + this.Math.round(body.getArmorMax() * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.ArmorRecoveryRate[this.m.EL_RankLevel])));
			body.updateAppearance();
		}
        else {
            properties.Armor[this.Const.BodyPart.Body] = this.Math.min(properties.ArmorMax[this.Const.BodyPart.Body], properties.Armor[this.Const.BodyPart.Body] + this.Math.round(properties.ArmorMax[this.Const.BodyPart.Body] * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.ArmorRecoveryRate[this.m.EL_RankLevel]));
        }
        body_armor_added = this.Math.round(properties.Armor[this.Const.BodyPart.Body] * properties.ArmorMult[this.Const.BodyPart.Body]) - body_armor_added;

		local head = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
        local head_armor_added = this.Math.round(properties.Armor[this.Const.BodyPart.Head] * properties.ArmorMult[this.Const.BodyPart.Head]);
        if(head != null) {
            head.setArmor(this.Math.min(head.getArmorMax(), head.getArmor() + this.Math.round(head.getArmorMax() * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.ArmorRecoveryRate[this.m.EL_RankLevel])));
			head.updateAppearance();
		}
        else {
            properties.Armor[this.Const.BodyPart.Head] = this.Math.min(properties.ArmorMax[this.Const.BodyPart.Head], properties.Armor[this.Const.BodyPart.Head] + this.Math.round(properties.ArmorMax[this.Const.BodyPart.Head] * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.ArmorRecoveryRate[this.m.EL_RankLevel]));
        }
        head_armor_added = this.Math.round(properties.Armor[this.Const.BodyPart.Head] * properties.ArmorMult[this.Const.BodyPart.Head]) - head_armor_added;

		local main_hand = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if(main_hand != null) {
			main_hand.setCondition(this.Math.min(main_hand.getConditionMax(), main_hand.getCondition() + this.Math.floor(main_hand.getConditionMax() * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.ArmorRecoveryRate[this.m.EL_RankLevel])));
		}
		local off_hand = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		if(off_hand != null) {
			off_hand.setCondition(this.Math.min(off_hand.getConditionMax(), off_hand.getCondition() + this.Math.floor(off_hand.getConditionMax() * this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.ArmorRecoveryRate[this.m.EL_RankLevel])));
		}
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " 恢复了!");
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "每回合恢复" + this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.HitpointsRecoveryRate[this.m.EL_RankLevel] * 100 + "%的最大生命，装备耐久和" + this.Const.EL_NPC.EL_NPCBuff.Factor.Recovery.FatigueRecoveryRate[this.m.EL_RankLevel] + "的疲劳。";
    }

});

