local gt = getroottable();

::mods_registerMod("el_player_other", 1, "el_player_other");
::mods_queue(null, "el_player", function ()
{
	::mods_hookExactClass("skills/backgrounds/legend_puppet_background", function ( o )
	{
		o.adjustHiringCostBasedOnEquipment = function ()
		{
            this.character_background.adjustHiringCostBasedOnEquipment();
		};
	});

	::mods_hookExactClass("skills/effects/legend_veteran_levels_effect", function ( o )
	{
		o.onUpdateLevel = function ()
		{
			local actor = this.getContainer().getActor();
			if (actor.getLevel() > this.Const.EL_Player.EL_PlayerLevel.Part1)
			{

				if (actor.m.Level >= this.Const.EL_Player.EL_PlayerLevel.Part1 &&
					(this.Const.EL_Player.EL_PlayerLevel.Max - actor.m.Level - 1) % this.Const.EL_Player.EL_Champion.PerkPointFrequency[actor.EL_getRankLevel()] == 0)
				{
					++actor.m.PerkPoints;
				}
			}
		};
	});

	::mods_hookExactClass("skills/backgrounds/legend_donkey_background", function ( o )
	{
		local onAdded = o.onAdded;
		o.onAdded = function ()
		{
			local actor = this.getContainer().getActor();
			this.m.Modifiers.Ammo = this.Const.EL_PlayerOther.EL_Donkey.Ammo[actor.EL_getRankLevel()];
			this.m.Modifiers.ArmorParts = this.Const.EL_PlayerOther.EL_Donkey.ArmorParts[actor.EL_getRankLevel()];
			this.m.Modifiers.Meds = this.Const.EL_PlayerOther.EL_Donkey.Meds[actor.EL_getRankLevel()];
			this.m.Modifiers.Stash = this.Const.EL_PlayerOther.EL_Donkey.Stash[actor.EL_getRankLevel()];
			onAdded();
		};
	});

});