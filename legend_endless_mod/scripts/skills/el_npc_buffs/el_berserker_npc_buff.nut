this.el_berserker_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.berserker";
		this.m.Name = "狂战士";
	}

	function onCombatStarted()
	{
		this.m.Name = "狂战士";
	}

	function onCombatFinished()
	{
		this.m.Name = "狂战士";
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local stack = this.Math.floor(10 - ((properties.Armor[this.Const.BodyPart.Body] * properties.Armor[this.Const.BodyPart.Body] + properties.Armor[this.Const.BodyPart.Head] * properties.Armor[this.Const.BodyPart.Head] + actor.getHitpoints())/(properties.ArmorMax[this.Const.BodyPart.Body] * properties.ArmorMult[this.Const.BodyPart.Body] + properties.ArmorMax[this.Const.BodyPart.Head] * properties.ArmorMult[this.Const.BodyPart.Head] + actor.getHitpointsMax()) * 10));
		if(stack != 0) {
			this.m.Name = "狂战士(x" + stack + ")";
		}
		else {
			this.m.Name = "狂战士";
		}
		_properties.DamageTotalMult *= 1 + this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.DamageMultPurStack[this.m.EL_RankLevel] * stack;
		_properties.MeleeSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] * stack;
        _properties.RangedSkill += this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.RangedSkillOffsetPurStack[this.m.EL_RankLevel] * stack;
	}

    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
		this.m.Description = "计算时护甲值视为生命值，每少10%的生命值，增加" +  this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] + "点双攻以及" + this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.DamageMultPurStack[this.m.EL_RankLevel] * 100 + "%的伤害。";
    }

	// function getTooltip()
	// {
	// 	local actor = this.getContainer().getActor();
	// 	local stack = this.Math.floor(10 - (actor.getHitpointsPct() * 10));
    //     local result = [
    //         {
	// 			id = 1,
	// 			type = "title",
	// 			text = this.m.Name
	// 		},
	// 		{
	// 			id = 2,
	// 			type = "description",
	// 			text = this.getDescription()
	// 		},
	// 		{
	// 			id = 3,
    //             type = "text",
	// 			text = "当前增加"
	// 		},
	// 		{
	// 			id = 4,
    //             type = "text",
    //             icon = "ui/icons/special.png",
    //             text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]不再受伤残影响[/color]"
	// 		},
	// 		{
	// 			id = 5,
    //             type = "text",
    //             icon = "ui/icons/special.png",
    //             text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]根据血量损失获得加成[/color]"
	// 		},
	// 		{
	// 			id = 6,
    //             type = "text",
    //             icon = "ui/icons/special.png",
    //             text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]攻击时免费施加一次“劈盾”技能，如果你拥有这个技能[/color]"
	// 		}
    //     ]
	// 	if(stack > 0)
	// 	{
    //         result.push({
    //             id = 8,
    //             type = "text",
    //             text = "当前增加" + this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.MeleeSkillOffsetPurStack[this.m.EL_RankLevel] * stack + "点双攻和" + this.Const.EL_NPC.EL_NPCBuff.Factor.Berserker.DamageMultPurStack[this.m.EL_RankLevel] * stack + "%伤害"
    //         });
	// 	}
	// 	return result;
	// }

});

