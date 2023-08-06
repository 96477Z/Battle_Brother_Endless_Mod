local gt = getroottable();

::mods_registerMod("el_player_level_up", 1, "el_player_level_up");
::mods_queue(null, ">el_world_difficulty", function ()
{
	::mods_hookExactClass("skills/effects/legend_veteran_levels_effect", function ( o )
	{
		o.onUpdateLevel = function ()
		{
			local actor = this.getContainer().getActor();
			if (actor.getLevel() > this.Const.EL_PlayerLevelUp.EL_PlayerLevelPart1)
			{

				if (actor.m.Level >= this.Const.EL_PlayerLevelUp.EL_PlayerLevelPart1 &&
					(this.Const.EL_PlayerLevelUp.EL_PlayerLevelMax - actor.m.Level - 1) % this.Const.EL_PlayerLevelUp.EL_PlayerLevelPart2PerkFrequency == 0)
				{
					++actor.m.PerkPoints;
				}
			}
		};
	});
	::mods_hookClass("entity/tactical/player", function (o)
	{
		while(!("updateLevel" in o)) o = o[o.SuperName];
		o.updateLevel = function()
		{
			while (this.m.Level < this.Const.LevelXP.len() && this.m.XP >= this.Const.LevelXP[this.m.Level])
			{
				if(this.m.Level < this.Const.EL_PlayerLevelUp.EL_PlayerLevelPart1){
					++this.m.PerkPoints;
				}
				else if(this.m.Level >= this.Const.EL_PlayerLevelUp.EL_PlayerLevelPart1 &&
					    (this.Const.EL_PlayerLevelUp.EL_PlayerLevelMax - this.m.Level - 1) % this.Const.EL_PlayerLevelUp.EL_PlayerLevelPart2PerkFrequency == 0){
					++this.m.PerkPoints;
				}
				++this.m.Level;
				++this.m.LevelUps;

				this.m.Skills.onUpdateLevel();

				if (this.m.Level == 11)
				{
					this.updateAchievement("OldAndWise", 1, 1);
				}

				if (this.m.Level == 11 && this.m.Skills.hasSkill("trait.player"))
				{
					this.updateAchievement("TooStubbornToDie", 1, 1);
				}
			}
		}
	});
	::mods_hookExactClass("entity/tactical/player", function(obj)
	{
		::mods_override(obj, "getAttributeLevelUpValues", function ()
		{
			if (this.m.Attributes.len() == 0)
			{
				for( local count = 0; count != this.Const.Attributes.COUNT; ++count )
				{
					this.m.Attributes[count].insert(0, this.Math.rand(this.Const.AttributesLevelUp[count].Min + (this.m.Talents[count] == 3 ? 2 : this.m.Talents[count]), this.Const.AttributesLevelUp[count].Max + (this.m.Talents[count] == 3 ? 1 : 0)));
				}
			}

			local ret = {
				hitpoints = b.Hitpoints,
				hitpointsMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayHitpointsMax,
				hitpointsIncrease = this.m.Attributes[this.Const.Attributes.Hitpoints][0],
				bravery = b.Bravery,
				braveryMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayBraveryMax,
				braveryIncrease = this.m.Attributes[this.Const.Attributes.Bravery][0],
				fatigue = b.Stamina,
				fatigueMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayStaminaMax,
				fatigueIncrease = this.m.Attributes[this.Const.Attributes.Fatigue][0],
				initiative = b.Initiative,
				initiativeMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayInitiativeMax,
				initiativeIncrease = this.m.Attributes[this.Const.Attributes.Initiative][0],
				meleeSkillMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayMeleeSkillMax,
				meleeSkillIncrease = this.m.Attributes[this.Const.Attributes.MeleeSkill][0],
				rangeSkill = b.RangedSkill,
				rangeSkillMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayRangedSkillMax,
				rangeSkillIncrease = this.m.Attributes[this.Const.Attributes.RangedSkill][0],
				meleeDefense = b.MeleeDefense,
				meleeDefenseMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayMeleeDefenseMax,
				meleeDefenseIncrease = this.m.Attributes[this.Const.Attributes.MeleeDefense][0],
				rangeDefense = b.RangedDefense,
				rangeDefenseMax = this.Const.EL_PlayerLevelUp.EL_PlayerDisplayRangedDefenseMax,
				rangeDefenseIncrease = this.m.Attributes[this.Const.Attributes.RangedDefense][0]
			};
			return ret;
		});
	});
});
