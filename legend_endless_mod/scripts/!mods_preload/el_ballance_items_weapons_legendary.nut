local gt = getroottable();

::mods_registerMod("el_ballance_items_weapons_legendary", 1, "el_ballance_items_weapons_legendary");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("items/weapons/legendary/legend_mage_swordstaff", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

    });

	::mods_hookExactClass("items/weapons/legendary/lightbringer_sword", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.weapon.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 6,
						type = "text",
						icon = "ui/icons/special.png",
                        text = "额外造成[color=" + this.Const.UI.Color.DamageValue + "] 25% [/color]目标当前生命值 + [color=" + this.Const.UI.Color.DamageValue + "]100[/color] 忽视护甲的伤害。"
					});
					break;
				}
			}
            return result;
        }
    });


	::mods_hookExactClass("items/weapons/legendary/obsidian_dagger", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
			this.m.Value = 0;
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.weapon.getTooltip();
            for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].type == "text" && result[i].text == "——————————————")
				{
					result.insert(i, {
						id = 6,
						type = "text",
                        icon = "ui/icons/special.png",
                        text = "Resurrects any human killed with it as a Wiederganger fighting for you"
					});
					break;
				}
			}
            return result;
        }
    });
});
