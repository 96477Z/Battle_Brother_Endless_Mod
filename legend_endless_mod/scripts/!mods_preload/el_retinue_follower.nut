local gt = getroottable();

::mods_registerMod("el_retinue_follower", 1, "el_retinue_follower");
::mods_queue(null, "el_player_npc", function ()
{
	::mods_hookNewObjectOnce("retinue/retinue_manager", function ( o )
	{
		o.hasFollowersToRemove = function()
		{
            return false;
        }
	});
	::mods_hookExactClass("retinue/followers/agent_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Reveals available contracts and active situations in the tooltip of settlements no matter where you are",
                "合同刷新速度提高 100%"
            ];
		}
	});

	::mods_hookExactClass("retinue/followers/alchemist_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Has a 25% chance of not consuming any crafting component used by you",
                "制作物品时有25%概率额外获得1件成品（判定成功时可重复判定）",
                "Unlocks \'Snake Oil\' recipe to earn money by crafting from various low tier components"
            ];
		}
	});

	::mods_hookExactClass("retinue/followers/blacksmith_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Repairs all armor, helmets, weapons and shields worn by your men even if they\'re broken or lost because your man died",
                "Increases repair speed by 100%"
            ];
		}

		local onUpdate = o.onUpdate;
		o.onUpdate = function()
		{
            this.follower.onUpdate();

            if ("RepairSpeedMult" in this.World.Assets.m)
            {
                this.World.Assets.m.RepairSpeedMult *= 2.0;
            }

            if ("IsBlacksmithed" in this.World.Assets.m)
            {
                this.World.Assets.m.IsBlacksmithed = true;
            }
		}
	});

	::mods_hookExactClass("retinue/followers/bounty_hunter_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "显著提升遇到首领的机会",
                "为每个击杀的首领支付大量的克朗"
            ];
		}

		local onUpdate = o.onUpdate;
        o.onUpdate = function()
        {
        }

        local onUpdate = o.onUpdate;
        o.onChampionKilled = function( _champion )
        {
            local base_reward = 0;
            if(_champion.EL_getRankLevel() == 2) {
                base_reward = 5000;
            }
            if (this.Tactical.State.getStrategicProperties() == null || !this.Tactical.State.getStrategicProperties().IsArenaMode)
            {
                this.World.Assets.addMoney(this.Math.floor(base_reward * (1 + 0.08 * _champion.EL_getLevel()) * this.World.Assets.EL_getHalfWorldDifficultFactor()));
            }
        }

	});

	::mods_hookExactClass("retinue/followers/brigand_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "让你能看到所有视野之外的商队"
            ];
		}
	});

	::mods_hookExactClass("retinue/followers/cartographer_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "为每个发现的地点奖励适量的克朗。 The further away from civilization, the more you\'re paid. Legendary locations pay double."
            ];
		}

		local onLocationDiscovered = o.onLocationDiscovered;
		o.onLocationDiscovered = function(_location)
		{
            local settlements = this.World.EntityManager.getSettlements();
            local dist = 9999;

            foreach( s in settlements )
            {
                local d = s.getTile().getDistanceTo(_location.getTile());

                if (d < dist)
                {
                    dist = d;
                }
            }

            local reward = this.Math.min(500, this.Math.max(200, 10 * dist));

            if (_location.isLocationType(this.Const.World.LocationType.Unique))
            {
                reward = reward * 2;
            }
            reward = this.Math.floor(reward * (1 + 0.08 * this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor())
            this.World.Assets.addMoney(reward);
		}
	});

	::mods_hookExactClass("retinue/followers/cook_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "使所有的食物维持时间翻倍",
                "商店出售的食物类物品数量会额外增加50%"
            ];
		}

		local onUpdate = o.onUpdate;
        o.onUpdate = function()
        {
        }
	});

	::mods_hookExactClass("retinue/followers/drill_sergeant_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "低于世界等级的单位会获得更多的经验补偿",
                "高于世界等级的单位会受到更少的经验惩罚"
            ];
		}
	});

	::mods_hookExactClass("retinue/followers/lookout_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Increases your sight radius by 100%",
                "Reveals extended information about footprints"
            ];
		}

		local onUpdate = o.onUpdate;
		o.onUpdate = function()
		{
            // if ("VisionRadiusMult" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.VisionRadiusMult *= 2.0;
            // }

            if ("IsShowingExtendedFootprints" in this.World.Assets.m)
            {
                this.World.Assets.m.IsShowingExtendedFootprints = true;
            }
		}
	});

	::mods_hookExactClass("retinue/followers/minstrel_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Makes you earn 50% more renown with every action",
                "Makes tavern rumors more likely to contain useful information"
            ];
		}

		local onUpdate = o.onUpdate;
		o.onUpdate = function()
		{
            // if ("BusinessReputationRate" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.BusinessReputationRate *= 1.5;
            // }

            if ("IsNonFlavorRumorsOnly" in this.World.Assets.m)
            {
                this.World.Assets.m.IsNonFlavorRumorsOnly = true;
            }
		}
	});

	::mods_hookExactClass("retinue/followers/negotiator_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Allows for more rounds of contract negotiations and greater payment with your potential employers before they abort, and with only a 10% chance on a hit to relations. Bad relations recover faster",
                "合同收入提高 50%"
            ];
		}
	});

	::mods_hookExactClass("retinue/followers/paymaster_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Reduces the daily wage of each man by 50%",
                "Reduces the chance of desertion by 50%",
                "Prevents men demanding more pay in events"
            ];
		}

		local onUpdate = o.onUpdate;
        o.onUpdate = function()
        {
            // if ("DailyWageMult" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.DailyWageMult *= 0.50;
            // }
        }
	});

	::mods_hookExactClass("retinue/followers/quartermaster_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "仓库容量上限提升100",
                "工具上限、弹药上限与医疗用品上限提升(100+世界等级)"
            ];
		}

		local onUpdate = o.onUpdate;
		o.onUpdate = function()
		{
            if ("AmmoMaxAdditional" in this.World.Assets.m)
            {
                this.World.Assets.m.AmmoMaxAdditional = this.Math.floor(100 * (1 + 0.01 * this.World.Assets.m.EL_WorldLevel));
            }

            if ("MedicineMaxAdditional" in this.World.Assets.m)
            {
                this.World.Assets.m.MedicineMaxAdditional = this.Math.floor(100 * (1 + 0.01 * this.World.Assets.m.EL_WorldLevel));
            }

            if ("ArmorPartsMaxAdditional" in this.World.Assets.m)
            {
                this.World.Assets.m.ArmorPartsMaxAdditional = this.Math.floor(100 * (1 + 0.01 * this.World.Assets.m.EL_WorldLevel));
            }
            this.World.State.getPlayer().calculateStashModifier();
		}
	});

	::mods_hookExactClass("retinue/followers/recruiter_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Makes you pay 20% less up front for hiring new men, and 50% less for tryouts",
                "让每个定居点可以招募的新兵额外增加5人",
                "精英和英雄出现概率提升 100%"
            ];
		}

		local onUpdate = o.onUpdate;
        o.onUpdate = function()
        {
            // if ("RosterSizeAdditionalMin" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.RosterSizeAdditionalMin += 5;
            // }

            // if ("RosterSizeAdditionalMax" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.RosterSizeAdditionalMax += 5;
            // }

            // if ("HiringCostMult" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.HiringCostMult *= 0.8;
            // }

            // if ("TryoutPriceMult" in this.World.Assets.m)
            // {
            //     this.World.Assets.m.TryoutPriceMult *= 0.5;
            // }
        }
	});

	::mods_hookExactClass("retinue/followers/scavenger_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "从战斗中被你摧毁的每一件盔甲中回收工具、补给和装备精华"
            ];
		}

		local onUpdate = o.onUpdate;
        o.onUpdate = function()
        {
            if ("IsRecoveringArmor" in this.World.Assets.m)
            {
                this.World.Assets.m.IsRecoveringArmor = true;
            }
        }
	});

	::mods_hookExactClass("retinue/followers/scout_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Reduces the movement penalty of difficult terrain by 30%",
                "Prevents sickness and accidents due to terrain"
            ];
		}

		local onUpdate = o.onUpdate;
        o.onUpdate = function()
        {
            for( local i = 0; i < this.World.Assets.m.TerrainTypeSpeedMult.len(); i = i )
            {
                if (this.Const.World.TerrainTypeSpeedMult[i] <= 0.65 && this.Const.World.TerrainTypeSpeedMult[i] > 0.0)
                {
                    this.World.Assets.m.TerrainTypeSpeedMult[i] *= (this.Const.World.TerrainTypeSpeedMult[i] + 0.3) / this.Const.World.TerrainTypeSpeedMult[i];
                }

                i = ++i;
            }
        }
	});

	::mods_hookExactClass("retinue/followers/surgeon_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "Makes every man without a permanent injury guaranteed to survive an otherwise fatal blow",
                "使所有可治愈损伤的治愈时间减半"
            ];
		}
	});

	::mods_hookExactClass("retinue/followers/trader_follower", function( o )
	{
		local create = o.create;
		o.create = function()
		{
            create();
            this.m.Effects = [
                "对于每个生产贸易商品的地点，将贸易商品的销售数量翻倍",
                "使你所有物品的售价提升10%"
            ];
		}

        // o.onUpdate <- function()
        // {
        //     if ("SellPriceMult" in this.World.Assets.m)
        //     {
        //         this.World.Assets.m.SellPriceMult *= 1.1;
        //     }
        // }
	});
});