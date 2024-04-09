local gt = getroottable();

::mods_registerMod("el_ambitions_ambitions", 1, "el_ambitions_ambitions");
::mods_queue(null, "el_world", function ()
{
	::mods_hookNewObjectOnce("states/world/asset_manager", function ( o )
	{
        o.checkAmbitionItems = function()
        {
            local supposedToHaveStandard = this.World.Ambitions.getAmbition("ambition.battle_standard").isDone();
            local supposedToHaveSergeant = this.World.Ambitions.getAmbition("ambition.sergeant").isDone();
            local hasStandard = false;
            local hasSergeant = false;

            if (supposedToHaveStandard || supposedToHaveSergeant)
            {
                local items = this.m.Stash.getItems();

                foreach( item in items )
                {
                    if (item != null)
                    {
                        if (item.getID() == "weapon.player_banner")
                        {
                            hasStandard = true;
                        }
                        else if (item.getID() == "accessory.sergeant_badge")
                        {
                            hasSergeant = true;
                        }
                    }
                }

                local roster = this.World.getPlayerRoster().getAll();

                foreach( bro in roster )
                {
                    local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

                    if (item != null && item.getID() == "weapon.player_banner")
                    {
                        hasStandard = true;
                    }

                    item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);

                    if (item != null && item.getID() == "accessory.sergeant_badge")
                    {
                        hasSergeant = true;
                    }

                    for( local i = 0; i < bro.getItems().getUnlockedBagSlots(); i = i )
                    {
                        item = bro.getItems().getItemAtBagSlot(i);

                        if (item != null && item.getID() == "weapon.player_banner")
                        {
                            hasStandard = true;
                        }
                        else if (item != null && item.getID() == "accessory.sergeant_badge")
                        {
                            hasSergeant = true;
                        }

                        i = ++i;
                    }
                }

                if (supposedToHaveStandard && !hasStandard)
                {
                    this.World.Ambitions.getAmbition("ambition.battle_standard").setDone(false);

                    foreach( bro in roster )
                    {
                        bro.worsenMood(this.Const.MoodChange.StandardLost, "The company standard was lost");
                    }
                }

                if (supposedToHaveSergeant && !hasSergeant)
                {
                    this.World.Ambitions.getAmbition("ambition.sergeant").setDone(false);
                }
            }
        }

	});

    ::mods_hookExactClass("ambitions/ambitions/armor_ambition", function(o)
    {

        o.onUpdateScore = function()
        {
            return 0;
        }

    });

    ::mods_hookExactClass("ambitions/ambitions/battle_standard_ambition", function(o)
    {

        o.onReward = function()
        {
            local item;
            local stash = this.World.Assets.getStash();
            this.World.Assets.addMoney(-1000);
            this.m.SuccessList.push({
                id = 10,
                icon = "ui/icons/asset_money.png",
                text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]1,000[/color] Crowns"
            });
            item = this.new("scripts/items/tools/player_banner");
            item.setVariant(this.World.Assets.getBannerID());
            item.EL_generateByRankAndLevel(0, 0);
            stash.add(item);
            this.m.SuccessList.push({
                id = 10,
                icon = "ui/items/" + item.getIcon(),
                text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
            });
        }
    });

    ::mods_hookExactClass("ambitions/ambitions/cart_ambition", function(o)
    {

        o.onUpdateScore = function()
        {
            return 0;
        }

    });
    ::mods_hookExactClass("ambitions/ambitions/have_y_crowns_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }

    });

    ::mods_hookExactClass("ambitions/ambitions/have_y_renown_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }

    });

    ::mods_hookExactClass("ambitions/ambitions/have_z_crowns_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }

    });

    ::mods_hookExactClass("ambitions/ambitions/have_z_renown_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }

    });

    ::mods_hookExactClass("ambitions/ambitions/have_talent_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }
    });

    ::mods_hookExactClass("ambitions/ambitions/named_item_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }
    });

    ::mods_hookExactClass("ambitions/ambitions/named_item_set_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }
    });

    ::mods_hookExactClass("ambitions/ambitions/trade_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }

    });

    ::mods_hookExactClass("ambitions/ambitions/win_x_arena_fights_ambition", function(o)
    {
        o.onUpdateScore = function ()
        {
            return;
        }

    });

});