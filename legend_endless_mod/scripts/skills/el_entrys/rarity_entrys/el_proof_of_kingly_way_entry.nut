this.el_proof_of_kingly_way_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.proof_of_kingly_way";
		this.m.Name = "王道之证(战旗)";
		this.m.Description = "荣光尚在，万众一心震敌胆";//Glory is still present, and the unity of all hearts shakes the enemy's courage.
		this.m.Icon = "el_entrys/el_proof_of_kingly_way_entry.png";
		//this.m.IconMini = "el_proof_of_kingly_way_entry_mini";
		this.m.Overlay = "el_proof_of_kingly_way_entry";
		this.m.Type = this.Const.SkillType.StatusEffect;
	}

	function getTooltip()
	{
        local result = [
            {
				id = 1,
				type = "title",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare] + "]" + this.getName() + "[/color]"
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]提升战旗带来的的决心加成比例为 " + this.Const.EL_Rarity_Entry.Factor.EL_ProofOfKinglyWay.BraveryMult * 100 + "%，对战旗影响范围内的敌人造成同等数值的决心降低.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]每回合开始时，战旗影响范围内的友军士气提升，敌军士气降低[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备战旗来发挥效果[/color]"
            });
        }
		return result;
	}

	function onTurnStart()
	{
		if(EL_isUsable())
		{
			local actor = this.getContainer().getActor();
			local targets = this.Tactical.Entities.getAllInstances();
			local affect_distance = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).EL_getRange();
			foreach( tar in targets )
			{
				foreach( t in tar )
				{
					if(t != null && actor.getTile().getDistanceTo(t.getTile()) <= affect_distance && t.getMoraleState() != this.Const.MoraleState.Ignore) 
					{
						if(!t.isAlliedWith(actor))
						{
							if(t.m.MoraleState > this.Const.EL_PlayerNPC.EL_RankToMoraleMin[t.m.EL_RankLevel])
							{
								t.setMoraleState(this.Math.max(this.Const.MoraleState.Fleeing, t.getMoraleState() - 1));
							}
						}
						else
						{
							t.setMoraleState(this.Math.min(this.Const.MoraleState.Confident, t.getMoraleState() + 1));
						}
					}
				}
			}
		}
	}
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
		if (item != null && item.getID() == "el_accessory.core")
		{
			return false;
		}
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.getID() == "weapon.player_banner")
		{
			return true;
		}
		return false;
	}
});

