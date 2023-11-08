local gt = getroottable();

::mods_registerMod("el_ballance_items_weapons_legendary", 1, "el_ballance_items_weapons_legendary");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("items/weapons/legendary/legend_mage_swordstaff", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

    });

	::mods_hookExactClass("items/weapons/legendary/lightbringer_sword", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

        o.getTooltip = function()
        {
            local result = this.weapon.getTooltip();
            result.push({
                id = 6,
                type = "text",
                icon = "ui/icons/special.png",
                text = "造成[color=" + this.Const.UI.Color.DamageValue + "] 5% [/color]目标当前生命值 + [color=" + this.Const.UI.Color.DamageValue + "]20[/color] 忽视护甲的伤害。闪电链不会击中同一个单位2次。"
            });
            return result;
        }



    });


	::mods_hookExactClass("items/weapons/legendary/obsidian_dagger", function(o){

        local create = o.create;
        o.create = function()
        {
            create();
            this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
        }

    });




});
