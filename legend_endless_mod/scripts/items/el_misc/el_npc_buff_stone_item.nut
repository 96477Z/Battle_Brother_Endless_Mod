this.el_npc_buff_stone_item <- this.inherit("scripts/items/trade/trading_good_item", {
	m = {
		EL_NPCBuffs = []
	},
	function create()
	{
		this.m.ID = "accessory.npc_buff_stone";
		this.m.Name = "魔法石";
		this.m.Description = "装有力量的石头，使用以获得力量。\n注意：会清除目前已有的NPCBuff，如果角色等阶小于NPCBuff等阶，每三场战斗NPCBuff会降低一阶，直到持平为止。";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.TradeGood | this.Const.Items.ItemType.Usable | this.Const.Items.ItemType.Misc;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.IconLarge = "";
		this.m.Icon = "el_misc/el_npc_buff_stone_0.png";
		this.m.Value = 0;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		result.push({
			id = 10,
			type = "text",
			text = this.getValueString()
		});
		foreach(skill in this.m.EL_NPCBuffs) {
			skill.EL_updateDescription();
			local names = this.split(skill.getName(), "(");
			local name = names[0];
			result.push({
				id = 10,
				type = "text",
				icon = "ui/el_icons/magic_stone_rank_" + skill.EL_getRankLevel() + ".png",
				text = name
			});
			result.push({
				id = 10,
				type = "text",
				text = skill.getDescription()
			});
		}
		result.push({
			id = 65,
			type = "text",
			text = "右键或者拖拽到当前选中的单位使用。此物品会在使用过程中消耗掉。"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		local skills = _actor.getSkills();
		local skills_to_remove = [];
		foreach(skill in skills.m.Skills) {
			if(skill.EL_isNPCBuff()) {
				skills_to_remove.push(skill);
				continue;
			}
			if(skill.getID() == "el_items.npc_buff_stone_skill") {
				skills_to_remove.push(skill);
			}
		}
		foreach(skill in skills_to_remove) {
			skills.remove(skill);
		}
		foreach(skill in this.m.EL_NPCBuffs) {
			skills.add(skill);
		}
		local skill = this.new("scripts/skills/el_items/el_npc_buff_stone_skill");
		skills.add(skill);
		skill.EL_updateRankLevel()
		return true;
	}

	function onSerialize( _out )
	{
		_out.writeI32(this.m.EL_NPCBuffs.len());
		foreach(skill in this.m.EL_NPCBuffs) {
			_out.writeI32(skill.ClassNameHash);
			skill.onSerialize(_out);
		}
	}

	function onDeserialize( _in )
	{
		local num = _in.readI32();
		for(local i = 0; i < num; ++i) {
			this.m.EL_NPCBuffs.push(this.new(this.IO.scriptFilenameByHash(_in.readI32())));
			this.m.EL_NPCBuffs[i].onDeserialize(_in);
		}
	}

	function getIcon()
	{
		if(this.m.EL_NPCBuffs.len())
		{
			this.m.Icon = "el_misc/el_npc_buff_stone_" + this.m.EL_NPCBuffs[0].m.EL_RankLevel + ".png";
		}

		return this.m.Icon;
	}

	// function getIconOverlay()
	// {
	// 	local L = [];

	// 	L.push(this.m.Icon);
	// 	L.push("layers/layer_" + (this.m.EL_NPCBuffs[0].m.EL_RankLevel + 1) + ".png");

	// 	return L;
	// }

	function EL_generateByNPCBuffs( _EL_npcBuffs )
	{
		local num = 0;
		local max_num = this.Math.floor((this.World.Assets.EL_getWorldDifficultFactor() - 0.5) * 2);
		local chance = (this.World.Assets.EL_getWorldDifficultFactor() * 200) % 100;
		max_num += (this.Math.rand(1, 100) <= chance) ? 1 : 0;
		while(_EL_npcBuffs.len() != 0 && num < this.Math.max(max_num, 1)) {
			local r = this.Math.rand(0, _EL_npcBuffs.len() - 1);
			_EL_npcBuffs[r].onCombatFinished();
			this.m.EL_NPCBuffs.push(_EL_npcBuffs[r]);
			_EL_npcBuffs.remove(r);
			++num;
		}
	}

});

