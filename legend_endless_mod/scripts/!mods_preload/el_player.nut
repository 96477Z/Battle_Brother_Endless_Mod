local gt = getroottable();

::mods_registerMod("el_player", 1, "el_player");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("entity/tactical/player", function( o )
	{
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.m.Skills.add(this.new("scripts/skills/el_racials/el_player_ballance_racial"));
		}

		local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			onSerialize( _out );
		}
		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize( _in );
			this.Const.EL_Player.EL_Modifiers.EL_setModifiersLevel(this.m.Level, this.m.Background);
		}

		o.getDailyCost = function ()
		{
			if (!("State" in this.World))
			{
				return 0;
			}
			local follow_mult = this.World.Retinue.hasFollower("follower.paymaster") ? 0.5 : 1.0;
			local wageMult = this.m.CurrentProperties.DailyWageMult * (this.World.State != null ? this.World.Assets.m.DailyWageMult * follow_mult : 1.0) - (this.World.State != null ? this.World.State.getPlayer().getWageModifier() : 0.0);
			return this.Math.max(0, this.m.CurrentProperties.DailyWage * wageMult);
		}

		local onCombatStart = o.onCombatStart;
		o.onCombatStart = function ()
		{
			if(this.World.Flags.get("EL_HasWinArenaFightsAmbitionRule"))
			{
				this.setMoraleState(this.Const.MoraleState.Confident);
			}
			onCombatStart();
		}

		local getHiringTalents = o.getHiringTalents;
		o.getHiringTalents = function ()
		{
			local ret = [];

			if (!this.m.IsTryoutDone)
			{
				return ret;
			}

			local talents = this.getTalents();

			for( local i = 0; i < this.Const.Attributes.COUNT; i = i )
			{
				local r = {
					talent = "",
					value = talents[i]
				};

				switch(i)
				{
				case 0:
					r.talent = "HP";
					break;

				case 1:
					r.talent = "RES";
					break;

				case 2:
					r.talent = "FAT";
					break;

				case 3:
					r.talent = "INIT";
					break;

				case 4:
					r.talent = "MA";
					break;

				case 5:
					r.talent = "RA";
					break;

				case 6:
					r.talent = "MD";
					break;

				case 7:
					r.talent = "RD";
					break;
				}

				ret.push(r);

				i = ++i;
			}

			return ret;
		}

		local setTitle = o.setTitle;
		o.setTitle = function ( _value )
		{
			this.m.Title = _value;
			if(this.m.Title != "")
			{
				this.m.Title += " - ";
			}
			if(this.EL_getRankLevel() == 0)
			{
				this.m.Title += "普通";
			}
			else if(this.EL_getRankLevel() == 1)
			{
				this.m.Title += "精英";
			}
			else if(this.EL_getRankLevel() == 2)
			{
				this.m.Title += "英雄";
			}
			if (this.m.Background != null)
			{
				this.m.Background.buildDescription(true);
			}
		}
		local onHired = o.onHired;
		o.onHired = function ()
		{
			onHired();
			if(this.getTitle() == "")
			{
				this.setTitle("");
			}
		}
	});

	::mods_hookExactClass("ui/screens/world/modules/world_town_screen/town_hire_dialog_module", function( o )
	{
		o.onHireRosterEntry = function ( _entityID )
		{
			local entry = this.findEntityWithinRoster(_entityID);

			if (entry != null)
			{
				local roster = this.World.getPlayerRoster();
				local entities = roster.getAll();
				local currentMoney = this.World.Assets.getMoney();
				local currentFood = this.World.Assets.getFood();
				local currentBrothers = entities.len();
				local brothersMax = this.World.Assets.getBrothersMax();
				local hiring_cost_follower_mult = this.World.Retinue.hasFollower("follower.recruiter") ? 0.8 : 1.0;
				local hiringCost = this.Math.ceil(entry.getHiringCost() * this.World.Assets.m.HiringCostMult * hiring_cost_follower_mult);

				if (currentMoney < hiringCost)
				{
					return {
						Result = this.Const.UI.Error.NotEnoughMoney,
						Assets = null
					};
				}

				if (currentBrothers + 1 > brothersMax)
				{
					return {
						Result = this.Const.UI.Error.NotEnoughRosterSpace,
						Assets = null
					};
				}

				this.World.getPlayerRoster().add(entry);
				this.World.getRoster(this.m.RosterID).remove(entry);
				entry.onHired();
				this.World.Assets.addMoney(-hiringCost);
				this.World.Statistics.getFlags().increment("BrosHired");

				if (this.World.getRoster(this.m.RosterID).getSize() == 0)
				{
					this.m.Parent.getMainDialogModule().reload();
				}

				return {
					Result = 0,
					Assets = this.m.Parent.queryAssetsInformation()
				};
			}

			return {
				Result = this.Const.UI.Error.RosterEntryNotFound,
				Assets = null
			};
		}
	});

	::mods_hookNewObject("entity/tactical/player", function( o )
	{
		o.getLevelUps = function ()
		{
			if(this.m.LevelUps)
			{
				return this.m.LevelUps;
			}
			else if(this.m.PerkPoints)
			{
				return 1;
			}
			return 0;
		}

		o.EL_getLevel <- function()
		{
			return this.m.Level;
		}

		o.getDailyFood = function()
		{
			local food = this.Math.maxf(0.0, this.m.CurrentProperties.DailyFood);

			if (this.isInReserves() && !this.m.Skills.hasSkill("perk.legend_peaceful"))
			{
				food = food * 2;
			}
			food *= this.Const.EL_Player.EL_Champion.DailyFoodMult[this.m.EL_RankLevel];
			food = this.Math.max(0, food - this.World.State.getPlayer().getFoodModifier());
			return food;
		};

		o.onActorKilled = function( _actor, _tile, _skill ) {
			this.actor.onActorKilled(_actor, _tile, _skill);
			if(_actor.isAlliedWith(this)) {
				return;
			}
			local XPkiller = this.Math.floor(_actor.getXP() * this.Const.XP.XPForKillerPct);
			local XPgroup = _actor.getXP() * (1.0 - this.Const.XP.XPForKillerPct);
			this.addXP(XPkiller);
			local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

			if (brothers.len() == 1)
			{
				if (this.getSkills().hasSkill("trait.oath_of_distinction"))
				{
					return;
				}

				this.addXP(XPgroup);
			}
			else
			{
				foreach( bro in brothers )
				{
					if (bro.getCurrentProperties().IsAllyXPBlocked)
					{
						return;
					}

					bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
				}
			}

			local roster = this.World.getPlayerRoster().getAll();

			foreach( bro in roster )
			{
				if (bro.isInReserves() && bro.getSkills().hasSkill("perk.legend_peaceful"))
				{
					bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
				}
			}
		}

		local isReallyKilled = o.isReallyKilled;
		o.isReallyKilled = function( _fatalityType ) {
			local result = isReallyKilled(_fatalityType);
			if(result == false) {
				if (this.m.Hitpoints < 0) {
					this.m.Hitpoints = 1;
				}
			}
			return result;
		}


		o.updateLevel = function ()
		{
			while (this.m.Level > 0 && this.m.XP < this.Const.LevelXP[this.m.Level - 1])
			{

				--this.m.Level;
				--this.m.LevelUps;
				--this.m.BaseProperties.EL_CombatLevel;

				if(this.m.Level < this.Const.EL_Player.EL_PlayerLevel.Part1){
					--this.m.PerkPoints;
				}
				else if(this.m.Level >= this.Const.EL_Player.EL_PlayerLevel.Part1 &&
					    (this.Const.EL_Player.EL_PlayerLevel.Max - this.m.Level - 1) % this.Const.EL_Player.EL_Champion.PerkPointFrequency[this.m.EL_RankLevel] == 0){
					--this.m.PerkPoints;
				}

				this.EL_removeRandomPoints();

				this.Const.EL_Player.EL_Modifiers.EL_setModifiersLevel(this.m.Level, this.m.Background);
				//this.m.Skills.onUpdateLevel();

			}
			while (this.m.Level < this.Const.LevelXP.len() && this.m.XP >= this.Const.LevelXP[this.m.Level])
			{
				if(this.m.Level < this.Const.EL_Player.EL_PlayerLevel.Part1){
					++this.m.PerkPoints;
				}
				else if(this.m.Level >= this.Const.EL_Player.EL_PlayerLevel.Part1 &&
					    (this.Const.EL_Player.EL_PlayerLevel.Max - this.m.Level - 1) % this.Const.EL_Player.EL_Champion.PerkPointFrequency[this.m.EL_RankLevel] == 0){
					++this.m.PerkPoints;
				}
				++this.m.Level;
				++this.m.LevelUps;
				++this.m.BaseProperties.EL_CombatLevel;

				this.EL_addRandomPoints();

				this.Const.EL_Player.EL_Modifiers.EL_setModifiersLevel(this.m.Level, this.m.Background);
				this.m.Skills.onUpdateLevel();

				// if (this.m.Level == 11 && this.m.Skills.hasSkill("perk.student"))
				// {
				// 	++this.m.PerkPoints;
				// }

			}
			this.getSkills().update();
		};

		o.EL_addRandomPoints <- function() {
			for(local i = 0; i < this.Const.EL_Player.EL_Champion.ExtraLevelUpPoints[this.m.EL_RankLevel]; ++i) {
				local r = this.Math.rand(1, this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight.len() - 1]);
				if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Hitpoints]) {
					++this.m.BaseProperties.Hitpoints;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Bravery]) {
					++this.m.BaseProperties.Bravery;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Fatigue]) {
					++this.m.BaseProperties.Stamina;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Initiative]) {
					++this.m.BaseProperties.Initiative;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.MeleeSkill]) {
					if(this.m.BaseProperties.MeleeSkill > this.m.BaseProperties.RangedSkill) {
						++this.m.BaseProperties.MeleeSkill;
					}
					else {
						++this.m.BaseProperties.RangedSkill;
					}
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.MeleeDefense]) {
					++this.m.BaseProperties.MeleeDefense;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.RangedDefense]) {
					++this.m.BaseProperties.RangedDefense;
				}
			}
		}
		o.EL_removeRandomPoints <- function() {
			for(local i = 0; i < this.Const.EL_Player.EL_Champion.ExtraLevelUpPoints[this.m.EL_RankLevel]; ++i) {
				local r = this.Math.rand(1, this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight.len() - 1]);
				if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Hitpoints]) {
					--this.m.BaseProperties.Hitpoints;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Bravery]) {
					--this.m.BaseProperties.Bravery;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Fatigue]) {
					--this.m.BaseProperties.Stamina;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.Initiative]) {
					--this.m.BaseProperties.Initiative;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.MeleeSkill]) {
					if(this.m.BaseProperties.MeleeSkill > this.m.BaseProperties.RangedSkill) {
						--this.m.BaseProperties.MeleeSkill;
					}
					else {
						--this.m.BaseProperties.RangedSkill;
					}
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.MeleeDefense]) {
					--this.m.BaseProperties.MeleeDefense;
				}
				else if(r <= this.Const.EL_Player.EL_Champion.ExtraLevelUpPointsWeight[this.Const.EL_Config.EL_Attributes.RangedDefense]) {
					--this.m.BaseProperties.RangedDefense;
				}
			}
		}

		o.fillAttributeLevelUpValues = function ( _amount, _maxOnly = false, _minOnly = false)
		{
			if (this.m.Attributes.len() == 0)
			{
				this.m.Attributes.resize(this.Const.Attributes.COUNT);

				for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
				{
					this.m.Attributes[i] = [];
				}
			}

			// for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
			// {
			// 	for( local j = 0; j < _amount; j = ++j )
			// 	{
			// 		if (_minOnly)
			// 		{
			// 			this.m.Attributes[i].insert(0, this.Const.EL_Player.EL_LevelUpAttributes[i].Min[this.m.Talents[i]]);
			// 		}
			// 		else if (_maxOnly)
			// 		{
			// 			this.m.Attributes[i].insert(0, this.Const.EL_Player.EL_LevelUpAttributes[i].Max[this.m.Talents[i]]);
			// 		}
			// 		else
			// 		{
			// 			this.m.Attributes[i].insert(0, this.Math.rand(this.Const.EL_Player.EL_LevelUpAttributes[i].Min[this.m.Talents[i]],
			// 														  this.Const.EL_Player.EL_LevelUpAttributes[i].Max[this.m.Talents[i]]));
			// 		}
			// 		// this.logInfo("this.m.Attributes[" + i + "][0] = " + this.m.Attributes[i][0]);
			// 		// this.logInfo("this.m.Attributes[" + i + "][0] min = " + this.Const.EL_Player.EL_LevelUpAttributes[i].Min[this.m.Talents[i]]);
			// 		// this.logInfo("this.m.Attributes[" + i + "][0] max = " + this.Const.EL_Player.EL_LevelUpAttributes[i].Max[this.m.Talents[i]]);
			// 	}
			// }
		};

		o.getAttributeLevelUpValues = function ()
		{
			if (this.m.Attributes[0].len() == 0)
			{
				for( local i = 0; i < this.Const.Attributes.COUNT; ++i )
				{
					if(this.World.Flags.get("EL_HasTalentAmbitionRule"))
					{
						this.m.Attributes[i].insert(0, this.Const.EL_Player.EL_LevelUpAttributes[i].Max[this.m.Talents[i]]);
					}
					else
					{
						this.m.Attributes[i].insert(0, this.Math.rand(this.Const.EL_Player.EL_LevelUpAttributes[i].Min[this.m.Talents[i]],
																  this.Const.EL_Player.EL_LevelUpAttributes[i].Max[this.m.Talents[i]]));
					}

					// this.logInfo("1 this.m.Attributes[" + i + "][0] = " + this.m.Attributes[i][0]);
					// this.logInfo("1 this.m.Attributes[" + i + "][0] min = " + this.Const.EL_Player.EL_LevelUpAttributes[i].Min[this.m.Talents[i]]);
					// this.logInfo("1 this.m.Attributes[" + i + "][0] max = " + this.Const.EL_Player.EL_LevelUpAttributes[i].Max[this.m.Talents[i]]);
				}
			}
			local base_properties = this.getBaseProperties();
			local level_up_time = this.getLevelUps() >= this.Const.EL_Player.EL_LevelUpsPurTime ? this.Const.EL_Player.EL_LevelUpsPurTime : 1;

			local ret = {
				hitpoints = base_properties.Hitpoints,
				hitpointsMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.HitpointsMax,
				hitpointsIncrease = this.m.Attributes[this.Const.Attributes.Hitpoints][0] * level_up_time,
				bravery = base_properties.Bravery,
				braveryMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.BraveryMax,
				braveryIncrease = this.m.Attributes[this.Const.Attributes.Bravery][0] * level_up_time,
				fatigue = base_properties.Stamina,
				fatigueMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.FatigueMax,
				fatigueIncrease = this.m.Attributes[this.Const.Attributes.Fatigue][0] * level_up_time,
				initiative = base_properties.Initiative,
				initiativeMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.InitiativeMax,
				initiativeIncrease = this.m.Attributes[this.Const.Attributes.Initiative][0] * level_up_time,
				meleeSkill = base_properties.MeleeSkill,
				meleeSkillMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.MeleeSkillMax,
				meleeSkillIncrease = this.m.Attributes[this.Const.Attributes.MeleeSkill][0] * level_up_time,
				rangeSkill = base_properties.RangedSkill,
				rangeSkillMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.RangeSkillMax,
				rangeSkillIncrease = this.m.Attributes[this.Const.Attributes.RangedSkill][0] * level_up_time,
				meleeDefense = base_properties.MeleeDefense,
				meleeDefenseMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.MeleeDefenseMax,
				meleeDefenseIncrease = this.m.Attributes[this.Const.Attributes.MeleeDefense][0] * level_up_time,
				rangeDefense = base_properties.RangedDefense,
				rangeDefenseMax = this.Const.EL_Player.EL_PlayerAddAttributesBoard.RangeDefenseMax,
				rangeDefenseIncrease = this.m.Attributes[this.Const.Attributes.RangedDefense][0] * level_up_time
			};
			return ret;
		};


		o.setAttributeLevelUpValues = function ( _v ) {
			local b = this.getBaseProperties();
			b.Hitpoints += _v.hitpointsIncrease;
			this.m.Hitpoints += _v.hitpointsIncrease;
			b.Stamina += _v.maxFatigueIncrease;
			b.Bravery += _v.braveryIncrease;
			b.MeleeSkill += _v.meleeSkillIncrease;
			b.RangedSkill += _v.rangeSkillIncrease;
			b.MeleeDefense += _v.meleeDefenseIncrease;
			b.RangedDefense += _v.rangeDefenseIncrease;
			b.Initiative += _v.initiativeIncrease;
			if(this.m.LevelUps >= this.Const.EL_Player.EL_LevelUpsPurTime) {
				this.m.LevelUps -= this.Const.EL_Player.EL_LevelUpsPurTime;
			}
			else if(this.m.LevelUps != 0) {
				this.m.LevelUps -= 1;
			}
			else
			{
				this.m.PerkPoints -= 1;
			}

			for( local i = 0; i != this.Const.Attributes.COUNT; i = i )
			{
				this.m.Attributes[i].remove(0);
				i = ++i;
			}

			this.getSkills().update();
			this.setDirty(true);

			if (b.MeleeSkill >= 90)
			{
				this.updateAchievement("Swordmaster", 1, 1);
			}

			if (b.RangedSkill >= 90)
			{
				this.updateAchievement("Deadeye", 1, 1);
			}
		}

		o.EL_setLevel <- function(_EL_level) {
			if(_EL_level >= this.Const.LevelXP.len()) {
				_EL_level = this.Const.LevelXP.len() - 1;
			}
			this.m.XP = this.Const.LevelXP[_EL_level - 1];
			this.updateLevel();
		}

		o.addXP = function( _xp, _scale = true, _ifReservesAdds = false)
		{
			if(!_ifReservesAdds && this.isInReserves()) {
				return;
			}
			if (this.m.Level >= this.Const.LevelXP.len() || this.isGuest())
			{
				return;
			}

			_xp *= this.Const.EL_Player.EL_Champion.XPMult[this.m.EL_RankLevel];

			if (_scale)
			{
				_xp = _xp * this.Const.Combat.GlobalXPMult;
			}

			// multiply xp if more than 12 fielded
			local roster = World.getPlayerRoster().getAll();
			local in_battle_num = 0;
			foreach(brother in roster)
			{
				in_battle_num++;
			}

			if(in_battle_num > this.Const.EL_Player.EL_CombatXP.MaxDiv){
				_xp *= in_battle_num / this.Const.EL_Player.EL_CombatXP.MaxDiv;
			}

			local world_level = this.World.Assets.m.EL_WorldLevel < this.Const.EL_Player.EL_CombatXP.MaxWorldLevel ? this.World.Assets.m.EL_WorldLevel : this.Const.EL_Player.EL_CombatXP.MaxWorldLevel;
			world_level -= this.Const.EL_Player.EL_CombatXP.WorldLevelCombatLevelOffset[this.World.Assets.getCombatDifficulty()];

			//multiply xp if player level is lower then the world level
			local below_offset = this.Const.EL_Player.EL_CombatXP.BelowOffset - (this.World.Retinue.hasFollower("follower.drill_sergeant") ? this.Const.EL_Player.EL_CombatXP.BelowOffset : 0);
			local over_offset = this.Const.EL_Player.EL_CombatXP.OverOffset + (this.World.Retinue.hasFollower("follower.drill_sergeant") ? this.Const.EL_Player.EL_CombatXP.BelowOffset : 0);
			if(this.m.Level < world_level - below_offset){
				local mult_factor = this.Math.pow(1 + (world_level - this.m.Level - below_offset) * this.Const.EL_Player.EL_CombatXP.BelowMult, 3);
				if(mult_factor > this.Const.EL_Player.EL_CombatXP.BelowMultMax) {
					mult_factor = this.Const.EL_Player.EL_CombatXP.BelowMultMax;
				}
				_xp *= mult_factor;
			}
			else if (this.m.Level > world_level + over_offset){
				local mult_factor = 1.0 / (this.Math.pow(1 + (this.m.Level - world_level - over_offset) * this.Const.EL_Player.EL_CombatXP.OverMult, 3));
				if(mult_factor < this.Const.EL_Player.EL_CombatXP.OverMultMin) {
					mult_factor = this.Const.EL_Player.EL_CombatXP.OverMultMin;
				}
				_xp *= mult_factor;
			}
			_xp *= this.m.CurrentProperties.XPGainMult;
			// xp multiplying end
			if (this.m.XP + _xp >= this.Const.LevelXP[this.Const.LevelXP.len() - 1])
			{
				// Now, the XP will be wasted, hhhh
				//this.m.CombatStats.XPGained += this.Const.LevelXP[this.Const.LevelXP.len() - 1] - this.m.XP;
				this.m.XP = this.Const.LevelXP[this.Const.LevelXP.len() - 1];
				return;
			}
			this.m.XP = this.Math.min(this.Const.LevelXP[this.Math.min(this.Const.LevelXP.len() - 1, this.m.Level + this.Const.EL_Player.EL_PlayerLevel.MaxLevelImproveOnce - 1)], this.m.XP + this.Math.floor(_xp));
			this.m.CombatStats.XPGained += this.Math.floor(_xp);
		};

		o.fillTalentValues = function ( _num, _force = false )
		{
			this.m.Talents.resize(this.Const.Attributes.COUNT, 0);

			if (this.getBackground() == null)
			{
				return;
			}

			local attributes = [];
			local weights = [];
			local totalWeight = 0;

			for( local i = 0; i < this.m.StarWeights.len(); i = i )
			{
				if (this.m.Talents[i] != 0)
				{
				}
				else if (this.getBackground() != null && this.getBackground().getExcludedTalents().find(i) != null)
				{
				}
				else
				{
					if (this.getFlags().has("PlayerZombie") && (i == this.Const.Attributes.Bravery || i == this.Const.Attributes.Fatigue || i == this.Const.Attributes.Initiative))
					{
						continue;
					}
					else if (this.getFlags().has("PlayerSkeleton") && (i == this.Const.Attributes.Bravery || i == this.Const.Attributes.Fatigue || i == this.Const.Attributes.Hitpoints))
					{
						continue;
					}

					local r = this.Math.rand(1, 100);

					if (r <= this.Const.EL_Player.EL_Talent.Chance[0])
					{
						this.m.Talents[i] = 0;
					}
					else if (r <= this.Const.EL_Player.EL_Talent.Chance[1])
					{
						this.m.Talents[i] = 1;
					}
					else if (r <= this.Const.EL_Player.EL_Talent.Chance[2])
					{
						this.m.Talents[i] = 2;
					}
					else
					{
						this.m.Talents[i] = 3;
					}
					this.m.Talents[i] += this.Const.EL_Player.EL_Talent.RankBonus[this.m.EL_RankLevel];
					if(this.m.Talents[i] > this.Const.EL_Player.EL_Talent.Max[this.m.EL_RankLevel]) {
						this.m.Talents[i] = this.Const.EL_Player.EL_Talent.Max[this.m.EL_RankLevel];
					}
					attributes.push(i);
					weights.push(this.m.StarWeights[i]);
					totalWeight = totalWeight + this.m.StarWeights[i];
				}

				i = ++i;
			}

			for( local done = 0; done < _num; done = done )
			{
				local weight = this.Math.rand(1, totalWeight);
				local totalhere = 0;

				for( local i = 0; i < attributes.len(); i = i )
				{
					if (weight > totalhere && weight <= totalhere + weights[i])
					{
						local r = this.Math.rand(1, 100);
						local j = attributes[i];
						local temp_talent = this.Const.EL_Player.EL_Talent.RankBonus[this.m.EL_RankLevel];
						if (r <= this.Const.EL_Player.EL_Talent.Chance[1])
						{
							temp_talent += 1;
						}
						else if (r <= this.Const.EL_Player.EL_Talent.Chance[2])
						{
							temp_talent += 2;
						}
						else
						{
							temp_talent += 3;
						}
						if(temp_talent > this.Const.EL_Player.EL_Talent.Max[this.m.EL_RankLevel]) {
							temp_talent = this.Const.EL_Player.EL_Talent.Max[this.m.EL_RankLevel];
						}
						if(this.m.Talents[j] < temp_talent) {
							this.m.Talents[j] = temp_talent;
						}
						attributes.remove(i);
						totalWeight = totalWeight - weights[i];
						weights.remove(i);
						break;
					}
					else
					{
						totalhere = totalhere + weights[i];
					}

					i = ++i;
				}

				done = ++done;
			}

		};

		local setStartValuesEx = o.setStartValuesEx;
		o.setStartValuesEx = function( _backgrounds, _addTraits = true, _gender = -1, _addEquipment = true, _EL_rankLevel = -1 )
		{
			if(_EL_rankLevel == -1) {
				local follower_chance_mult = this.World.Retinue.hasFollower("follower.recruiter") ? 2 : 1;
				local rank_1_chance = this.Const.EL_Player.EL_Rank1Chance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor() * follower_chance_mult;
				local rank_2_chance = this.Const.EL_Player.EL_Rank2Chance.EL_getChance(this.World.Assets.m.EL_WorldLevel) * this.World.Assets.EL_getHalfWorldDifficultFactor() * follower_chance_mult;
				local temp_rank = 0;
				if(rank_2_chance * 10 >= this.Math.rand(1, 1000)) {
					temp_rank = 2;
				}
				else if(rank_1_chance * 10 >= this.Math.rand(1, 1000)) {
					temp_rank = 1;
				}
				if(temp_rank > this.m.EL_RankLevel) {
					this.m.EL_RankLevel = temp_rank;
				}
			}
			else{
				this.m.EL_RankLevel = _EL_rankLevel;
			}

			setStartValuesEx(_backgrounds, _addTraits, _gender, _addEquipment);
			this.Const.EL_Player.EL_PerkTree.EL_AddRandomPerkTreeToPlayer(this, this.Const.EL_Player.EL_Champion.PerksOffset[this.m.EL_RankLevel]);
			this.Const.EL_Player.EL_Modifiers.EL_setModifiersLevel(this.m.Level, this.m.Background);
		};

		o.getTryoutCost = function ()
		{
			local follower_mult = this.World.Retinue.hasFollower("follower.recruiter") ? 0.5 : 1;
			return this.m.CurrentProperties.DailyWage * this.Const.EL_Player.EL_Hiring.EL_TryoutCostMult * this.World.Assets.m.TryoutPriceMult * follower_mult;
		};

		function getTryoutCost()
		{
			return this.Math.ceil(this.Math.max(10, this.Math.min(this.m.HiringCost - 25, 25 + this.m.HiringCost * this.Const.Tryouts.CostMult) * this.World.Assets.m.TryoutPriceMult));
		}
		o.getXPForNextLevel = function ()
		{
			if (this.m.Level >= this.Const.LevelXP.len() - 10 && ("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.getBackground().getID() == "background.slave")
			{
				return this.Const.LevelXP[this.Const.LevelXP.len() - 10];
			}
			else
			{
				return this.m.Level < this.Const.LevelXP.len() ? this.Const.LevelXP[this.m.Level] : this.Const.LevelXP[this.Const.LevelXP.len() - 1];
			}
		};

		o.getName <- function()
		{
			return this.m.Name + " - Lv" + this.m.Level + "(" + ((this.Math.round(this.EL_getCombatLevel() * 10) * 0.1)) + ")";
		}

	});

	::mods_hookNewObject("entity/world/player_party", function( o )
	{
		local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			onSerialize( _out );
		}
		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize( _in );
			this.calculateStashModifier();
		}

		o.getVisionRadius = function ()
		{
			if (this.World.Assets.isCamping())
			{
				local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Scout);
				return tent.getVisionRadius();
			}
			local follower_mult = (this.World.Retinue.hasFollower("follower.lookout")) ? 2.0 : 1.0;
			return this.m.VisionRadius * this.World.Assets.m.VisionRadiusMult * follower_mult * this.World.getGlobalVisibilityMult() * this.Const.World.TerrainTypeVisionRadiusMult[this.getTile().Type] * (this.World.Assets.isCamping() ? 0.75 : 1.0);
		}

		local calculateStashModifier = o.calculateStashModifier;
		o.calculateStashModifier = function ( resize = true )
		{
			if (this.World.State.m.AppropriateTimeToRecalc == 1)
			{
				local s = this.Const.LegendMod.MaxResources[this.World.Assets.getEconomicDifficulty()].Stash;
				s = s + this.World.Assets.getOrigin().getStashModifier();
				s = s + this.World.Retinue.getInventoryUpgrades() * 27;

				foreach( bro in this.World.getPlayerRoster().getAll())
				{
					s = s + bro.getStashModifier();
				}
				//this.logInfo("base stash:"+s);
				local current_account = s;
				local need_factor = 2;
				local need_account = 100;
				local bonus = 0;
				local bonus_factor = 100;
				while(current_account >= need_account) {
					current_account -= need_account;
					need_account *= need_factor;
					bonus += bonus_factor;
				}
				s = bonus + this.Math.floor(100.0 * current_account / need_account);
				//this.logInfo("final stash:"+s);
				s += this.World.Retinue.hasFollower("follower.quartermaster") ? 100 : 0;
				if (resize && s != this.Stash.getCapacity())
				{
					this.Stash.resize(s);
				}

				return s;
			}
		}

	});

	::mods_hookExactClass("skills/backgrounds/character_background", function ( o )
	{

		o.m.BaseModifiers <- null;
		o.EL_getBaseModifiers <- function () {
			return this.m.BaseModifiers;
		}

		o.adjustHiringCostBasedOnEquipment = function ()
		{
			local actor = this.getContainer().getActor();
			this.logInfo("actor name:" + actor.getName());
			local items = actor.getItems().getAllItems();
			local cost = 0;
			foreach( i in items )
			{
				cost = cost + i.getValue();
			}
			this.logInfo("item value:" + cost);
			actor.m.HiringCost = this.m.HiringCost;
			this.logInfo("HiringCost:" + actor.m.HiringCost);

			actor.m.HiringCost *= this.Const.EL_Player.EL_Champion.HiringCostMult[actor.m.EL_RankLevel];
			actor.m.HiringCost += this.Const.EL_Player.EL_Champion.HiringCostOffset[actor.m.EL_RankLevel];
			this.logInfo("after rank HiringCost:" + actor.m.HiringCost);
			actor.m.HiringCost *= (1 + this.Const.EL_Player.EL_Hiring.EL_LevelMult * actor.m.Level);
			this.logInfo("after level HiringCost:" + actor.m.HiringCost);
			actor.m.HiringCost += cost * this.Const.EL_Player.EL_Hiring.EL_ItemCostMult;
			actor.m.HiringCost = this.Math.ceil(actor.m.HiringCost);
			this.logInfo("after item HiringCost:" + actor.m.HiringCost);
		};

		o.calculateAdditionalRecruitmentLevels = function ()
		{
			return this.Math.rand(0, this.Math.min(this.World.Assets.m.EL_WorldLevel, this.Const.EL_Player.EL_PlayerLevel.Max) - this.Const.EL_Player.EL_Hiring.EL_WorldLevelOffset);
		};

		o.onAdded = function ()
		{
			this.m.BaseModifiers = clone this.m.Modifiers;
			if (this.m.DailyCost > 0)
			{
				this.m.DailyCost += 1;
			}

			this.m.Level += this.calculateAdditionalRecruitmentLevels();

			local actor = this.getContainer().getActor();
			actor.m.Background = this;
			actor.m.Ethnicity = this.m.Ethnicity;

			if (!this.m.IsNew)
			{
				return;
			}

			if (("State" in this.Tactical) && this.Tactical.State != null && this.Tactical.State.isScenarioMode())
			{
				return;
			}

			this.m.IsNew = false;

			if (this.m.LastNames.len() == 0 && this.m.Ethnicity == 1)
			{
				this.m.LastNames = this.Const.Strings.SouthernNamesLast;
			}

			if (actor.getTitle() == "" && this.m.LastNames.len() != 0 && this.Math.rand(0, 1) == 1)
			{
				actor.setTitle(this.m.LastNames[this.Math.rand(0, this.m.LastNames.len() - 1)]);
			}

			if (actor.getTitle() == "" && this.m.Titles.len() != 0 && this.Math.rand(0, 3) == 3)
			{
				actor.setTitle(this.m.Titles[this.Math.rand(0, this.m.Titles.len() - 1)]);
			}

			if (actor.getNameOnly() == "")
			{
				local names = this.m.Names;

				if (names == null || this.m.Names.len() == 0)
				{
					names = this.Const.Strings.CharacterNames;

					if (this.m.Ethnicity == 1)
					{
						names = this.Const.Strings.SouthernNames;
					}
					else if (this.m.Ethnicity == 2)
					{
						names = this.Const.Strings.BarbarianNames;
					}

					if (this.isBackgroundType(this.Const.BackgroundType.Female))
					{
						names = this.Const.Strings.CharacterNamesFemale;

						if (this.m.Ethnicity == 1)
						{
							names = this.Const.Strings.SouthernFemaleNames;
						}
						else if (this.m.Ethnicity == 2)
						{
							names = this.Const.Strings.CharacterNamesFemaleNorse;
						}
					}
				}

				actor.setName(names[this.Math.rand(0, names.len() - 1)]);
			}
			actor.m.Level = 1;
			actor.m.PerkPoints += this.Const.EL_Player.EL_Champion.PerkPointsOffset[actor.m.EL_RankLevel];
			actor.m.BaseProperties.EL_CombatLevel = 1 + this.Const.EL_Player.EL_Champion.CombatLevelOffset[actor.m.EL_RankLevel];
			if(this.m.Level < this.Const.LevelXP.len()) {
				actor.m.XP = this.Const.LevelXP[this.m.Level - 1];
			}
			else {
				actor.m.XP = this.Const.LevelXP[this.Const.LevelXP.len() - 1];
			}
			actor.updateLevel();
		};

		o.onUpdate = function ( _properties )
		{
			if (this.m.DailyCost == 0 || this.getContainer().hasSkill("trait.player"))
			{
				_properties.DailyWage = 0;
			}
			else
			{
				if (this.isBackgroundType(this.Const.BackgroundType.ConvertedCultist))
				{
					this.m.DailyCost = 4;
				}
				//this.logInfo("DailyCost 1 : " + this.m.DailyCost);
				//this.logInfo("DailyWage 1 : " + _properties.DailyWage);
				local actor = this.getContainer().getActor();
				local wage = this.Math.round((this.m.DailyCost * this.Const.EL_Player.EL_Champion.DailyCostMult[actor.EL_getRankLevel()] + this.Const.EL_Player.EL_Champion.DailyCostOffset[actor.EL_getRankLevel()] ) * this.m.DailyCostMult);
				_properties.DailyWage += wage * (1 + actor.getLevel() * this.Const.EL_Player.EL_DailyCostLevelMult);
				_properties.DailyWage = this.Math.ceil(_properties.DailyWage);
				//this.logInfo("DailyWage 2 : " + _properties.DailyWage);

			}

			if (("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin() != null && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.getID() != "background.slave")
			{
				_properties.XPGainMult *= 0.9;
			}
		};

		o.buildAttributes = function ( _tag = null, _attrs = null )
		{
			local a = [];

			if (_tag == "zombie")
			{
				a = {
					Hitpoints = [
						65,
						75
					],
					Bravery = [
						30,
						40
					],
					Stamina = [
						90,
						100
					],
					MeleeSkill = [
						42,
						52
					],
					RangedSkill = [
						37,
						47
					],
					MeleeDefense = [
						0,
						0
					],
					RangedDefense = [
						0,
						0
					],
					Initiative = [
						85,
						95
					]
				};
			}
			else if (_tag == "skeleton")
			{
				a = {
					Hitpoints = [
						50,
						60
					],
					Bravery = [
						30,
						40
					],
					Stamina = [
						90,
						100
					],
					MeleeSkill = [
						42,
						52
					],
					RangedSkill = [
						37,
						47
					],
					MeleeDefense = [
						0,
						5
					],
					RangedDefense = [
						0,
						5
					],
					Initiative = [
						90,
						100
					]
				};
			}
			else
			{
				a = {
					Hitpoints = [
						50,
						60
					],
					Bravery = [
						30,
						40
					],
					Stamina = [
						90,
						100
					],
					MeleeSkill = [
						47,
						57
					],
					RangedSkill = [
						42,
						52
					],
					MeleeDefense = [
						0,
						5
					],
					RangedDefense = [
						0,
						5
					],
					Initiative = [
						100,
						110
					]
				};
			}

			local c = this.onChangeAttributes();

			local rank = this.getContainer().getActor().EL_getRankLevel();

			a.Hitpoints[0] += c.Hitpoints[0];
			a.Hitpoints[1] += c.Hitpoints[1];
			a.Bravery[0] += c.Bravery[0];
			a.Bravery[1] += c.Bravery[1];
			a.Stamina[0] += c.Stamina[0];
			a.Stamina[1] += c.Stamina[1];
			a.MeleeSkill[0] += c.MeleeSkill[0];
			a.MeleeSkill[1] += c.MeleeSkill[1];
			a.MeleeDefense[0] += c.MeleeDefense[0];
			a.MeleeDefense[1] += c.MeleeDefense[1];
			a.RangedSkill[0] += c.RangedSkill[0];
			a.RangedSkill[1] += c.RangedSkill[1];
			a.RangedDefense[0] += c.RangedDefense[0];
			a.RangedDefense[1] += c.RangedDefense[1];
			a.Initiative[0] += c.Initiative[0];
			a.Initiative[1] += c.Initiative[1];

			if(rank == 1) {
				a.Hitpoints[0] = this.Math.round((a.Hitpoints[0] + a.Hitpoints[1]) * 0.5);
				a.Bravery[0] = this.Math.round((a.Bravery[0] + a.Bravery[1]) * 0.5);
				a.Stamina[0] = this.Math.round((a.Stamina[0] + a.Stamina[1]) * 0.5);
				a.MeleeSkill[0] = this.Math.round((a.MeleeSkill[0] + a.MeleeSkill[1]) * 0.5);
				a.MeleeDefense[0] = this.Math.round((a.MeleeDefense[0] + a.MeleeDefense[1]) * 0.5);
				a.RangedSkill[0] = this.Math.round((a.RangedSkill[0] + a.RangedSkill[1]) * 0.5);
				a.RangedDefense[0] = this.Math.round((a.RangedDefense[0] + a.RangedDefense[1]) * 0.5);
				a.Initiative[0] = this.Math.round((a.Initiative[0] + a.Initiative[1]) * 0.5);
			}
			else if(rank == 2) {
				a.Hitpoints[0] = a.Hitpoints[1];
				a.Bravery[0] = a.Bravery[1];
				a.Stamina[0] = a.Stamina[1];
				a.MeleeSkill[0] = a.MeleeSkill[1];
				a.MeleeDefense[0] = a.MeleeDefense[1];
				a.RangedSkill[0] = a.RangedSkill[1];
				a.RangedDefense[0] = a.RangedDefense[1];
				a.Initiative[0] = a.Initiative[1];
			}


			// this.logInfo("rank : " + rank);
			// this.logInfo("Hitpoints : " + a.Hitpoints[0] + " " + a.Hitpoints[1]);
			// this.logInfo("Bravery : " + a.Bravery[0] + " " + a.Bravery[1]);
			// this.logInfo("Stamina : " + a.Stamina[0] + " " + a.Stamina[1]);
			// this.logInfo("MeleeSkill : " + a.MeleeSkill[0] + " " + a.MeleeSkill[1]);
			// this.logInfo("MeleeDefense : " + a.MeleeDefense[0] + " " + a.MeleeDefense[1]);
			// this.logInfo("RangedSkill : " + a.RangedSkill[0] + " " + a.RangedSkill[1]);
			// this.logInfo("RangedDefense : " + a.RangedDefense[0] + " " + a.RangedDefense[1]);
			// this.logInfo("Initiative : " + a.Initiative[0] + " " + a.Initiative[1]);

			if (_attrs != null)
			{
				a.Hitpoints[0] += _attrs.Hitpoints[0];
				a.Hitpoints[1] += _attrs.Hitpoints[1];
				a.Bravery[0] += _attrs.Bravery[0];
				a.Bravery[1] += _attrs.Bravery[1];
				a.Stamina[0] += _attrs.Stamina[0];
				a.Stamina[1] += _attrs.Stamina[1];
				a.MeleeSkill[0] += _attrs.MeleeSkill[0];
				a.MeleeSkill[1] += _attrs.MeleeSkill[1];
				a.MeleeDefense[0] += _attrs.MeleeDefense[0];
				a.MeleeDefense[1] += _attrs.MeleeDefense[1];
				a.RangedSkill[0] += _attrs.RangedSkill[0];
				a.RangedSkill[1] += _attrs.RangedSkill[1];
				a.RangedDefense[0] += _attrs.RangedDefense[0];
				a.RangedDefense[1] += _attrs.RangedDefense[1];
				a.Initiative[0] += _attrs.Initiative[0];
				a.Initiative[1] += _attrs.Initiative[1];
			}

			local b = this.getContainer().getActor().getBaseProperties();
			b.ActionPoints = 9;
			local Hitpoints1 = this.Math.rand(a.Hitpoints[0], a.Hitpoints[1]);
			local Bravery1 = this.Math.rand(a.Bravery[0], a.Bravery[1]);
			local Stamina1 = this.Math.rand(a.Stamina[0], a.Stamina[1]);
			local MeleeSkill1 = this.Math.rand(a.MeleeSkill[0], a.MeleeSkill[1]);
			local RangedSkill1 = this.Math.rand(a.RangedSkill[0], a.RangedSkill[1]);
			local MeleeDefense1 = this.Math.rand(a.MeleeDefense[0], a.MeleeDefense[1]);
			local RangedDefense1 = this.Math.rand(a.RangedDefense[0], a.RangedDefense[1]);
			local Initiative1 = this.Math.rand(a.Initiative[0], a.Initiative[1]);
			local Hitpoints2 = this.Math.rand(a.Hitpoints[0], a.Hitpoints[1]);
			local Bravery2 = this.Math.rand(a.Bravery[0], a.Bravery[1]);
			local Stamina2 = this.Math.rand(a.Stamina[0], a.Stamina[1]);
			local MeleeSkill2 = this.Math.rand(a.MeleeSkill[0], a.MeleeSkill[1]);
			local RangedSkill2 = this.Math.rand(a.RangedSkill[0], a.RangedSkill[1]);
			local MeleeDefense2 = this.Math.rand(a.MeleeDefense[0], a.MeleeDefense[1]);
			local RangedDefense2 = this.Math.rand(a.RangedDefense[0], a.RangedDefense[1]);
			local Initiative2 = this.Math.rand(a.Initiative[0], a.Initiative[1]);
			local HitpointsAvg = this.Math.round((Hitpoints1 + Hitpoints2) / 2);
			local BraveryAvg = this.Math.round((Bravery1 + Bravery2) / 2);
			local StaminaAvg = this.Math.round((Stamina1 + Stamina2) / 2);
			local MeleeSkillAvg = this.Math.round((MeleeSkill1 + MeleeSkill2) / 2);
			local RangedSkillAvg = this.Math.round((RangedSkill1 + RangedSkill2) / 2);
			local MeleeDefenseAvg = this.Math.round((MeleeDefense1 + MeleeDefense2) / 2);
			local RangedDefenseAvg = this.Math.round((RangedDefense1 + RangedDefense2) / 2);
			local InitiativeAvg = this.Math.round((Initiative1 + Initiative2) / 2);
			b.Hitpoints = HitpointsAvg;
			b.Bravery = BraveryAvg;
			b.Stamina = StaminaAvg;
			b.MeleeSkill = MeleeSkillAvg;
			b.RangedSkill = RangedSkillAvg;
			b.MeleeDefense = MeleeDefenseAvg;
			b.RangedDefense = RangedDefenseAvg;
			b.Initiative = InitiativeAvg;
			this.getContainer().getActor().m.CurrentProperties = clone b;
			this.getContainer().getActor().setHitpoints(b.Hitpoints);
			local weighted = [];

			if (a.Hitpoints[1] == a.Hitpoints[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.Hitpoints - a.Hitpoints[0]) * 100.0 / (a.Hitpoints[1] - a.Hitpoints[0])));
			}

			if (a.Bravery[1] == a.Bravery[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.Bravery - a.Bravery[0]) * 100.0 / (a.Bravery[1] - a.Bravery[0])));
			}

			if (a.Stamina[1] == a.Stamina[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.Stamina - a.Stamina[0]) * 100.0 / (a.Stamina[1] - a.Stamina[0])));
			}

			if (a.MeleeSkill[1] == a.MeleeSkill[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.MeleeSkill - a.MeleeSkill[0]) * 100.0 / (a.MeleeSkill[1] - a.MeleeSkill[0])));
			}

			if (a.RangedSkill[1] == a.RangedSkill[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.RangedSkill - a.RangedSkill[0]) * 100.0 / (a.RangedSkill[1] - a.RangedSkill[0])));
			}

			if (a.MeleeDefense[1] == a.MeleeDefense[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.MeleeDefense - a.MeleeDefense[0]) * 100.0 / (a.MeleeDefense[1] - a.MeleeDefense[0])));
			}

			if (a.RangedDefense[1] == a.RangedDefense[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.RangedDefense - a.RangedDefense[0]) * 100.0 / (a.RangedDefense[1] - a.RangedDefense[0])));
			}

			if (a.Initiative[1] == a.Initiative[0])
			{
				weighted.push(50);
			}
			else
			{
				weighted.push(this.Math.floor((b.Initiative - a.Initiative[0]) * 100.0 / (a.Initiative[1] - a.Initiative[0])));
			}

			return weighted;
		};

		o.getAttributesTooltip = function ()
		{
			if (this.getContainer().getActor().getLevel() < this.Const.EL_Player.EL_PlayerLevel.Max)
			{
				local EL_calculateAttribute = function ( _level, _attribute, _maximum = false )
				{
					local brother = this.getContainer().getActor();
					local attributeMin = this.Const.EL_Player.EL_LevelUpAttributes[_attribute].Min[brother.m.Talents[_attribute]];
					local attributeMax = this.Const.EL_Player.EL_LevelUpAttributes[_attribute].Max[brother.m.Talents[_attribute]];

					local levelUps = this.Math.max(_level - brother.getLevel() + brother.getLevelUps(), 0);
					local attributeValue = _maximum ? attributeMax * levelUps : attributeMin * levelUps;

					switch(_attribute)
					{
					case this.Const.Attributes.Hitpoints:
						return attributeValue + brother.getBaseProperties().Hitpoints;
						break;

					case this.Const.Attributes.Bravery:
						return attributeValue + brother.getBaseProperties().Bravery;
						break;

					case this.Const.Attributes.Fatigue:
						return attributeValue + brother.getBaseProperties().Stamina;
						break;

					case this.Const.Attributes.Initiative:
						return attributeValue + brother.getBaseProperties().Initiative;
						break;

					case this.Const.Attributes.MeleeSkill:
						return attributeValue + brother.getBaseProperties().MeleeSkill;
						break;

					case this.Const.Attributes.RangedSkill:
						return attributeValue + brother.getBaseProperties().RangedSkill;
						break;

					case this.Const.Attributes.MeleeDefense:
						return attributeValue + brother.getBaseProperties().MeleeDefense;
						break;

					case this.Const.Attributes.RangedDefense:
						return attributeValue + brother.getBaseProperties().RangedDefense;
						break;

					default:
						return 0;
						break;
					}
				};
				local a = {
					Hitpoints = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Hitpoints),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Hitpoints, true)
					],
					Bravery = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Bravery),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Bravery, true)
					],
					Fatigue = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Fatigue),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Fatigue, true)
					],
					Initiative = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Initiative),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.Initiative, true)
					],
					MeleeSkill = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.MeleeSkill),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.MeleeSkill, true)
					],
					RangedSkill = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.RangedSkill),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.RangedSkill, true)
					],
					MeleeDefense = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.MeleeDefense),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.MeleeDefense, true)
					],
					RangedDefense = [
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.RangedDefense),
						EL_calculateAttribute(this.Const.EL_Player.EL_PlayerLevel.Max, this.Const.Attributes.RangedDefense, true)
					]
				};
				local bufferHealth = "";
				local bufferFatigue = "";
				local bufferBravery = "";
				local bufferInitiative = "";

				if (a.Hitpoints[0] >= 100)
				{
					bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
					bufferBravery = bufferBravery + "&nbsp;&nbsp;";
					bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
				}

				if (a.Hitpoints[1] >= 100)
				{
					bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
					bufferBravery = bufferBravery + "&nbsp;&nbsp;";
					bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
				}

				if (a.Fatigue[0] >= 100)
				{
					bufferHealth = bufferHealth + "&nbsp;&nbsp;";
					bufferBravery = bufferBravery + "&nbsp;&nbsp;";
					bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
				}

				if (a.Fatigue[1] >= 100)
				{
					bufferHealth = bufferHealth + "&nbsp;&nbsp;";
					bufferBravery = bufferBravery + "&nbsp;&nbsp;";
					bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
				}

				if (a.Bravery[0] >= 100)
				{
					bufferHealth = bufferHealth + "&nbsp;&nbsp;";
					bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
					bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
				}

				if (a.Bravery[1] >= 100)
				{
					bufferHealth = bufferHealth + "&nbsp;&nbsp;";
					bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
					bufferInitiative = bufferInitiative + "&nbsp;&nbsp;";
				}

				if (a.Initiative[0] >= 100)
				{
					bufferHealth = bufferHealth + "&nbsp;&nbsp;";
					bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
					bufferBravery = bufferBravery + "&nbsp;&nbsp;";
				}

				if (a.Initiative[1] >= 100)
				{
					bufferHealth = bufferHealth + "&nbsp;&nbsp;";
					bufferFatigue = bufferFatigue + "&nbsp;&nbsp;";
					bufferBravery = bufferBravery + "&nbsp;&nbsp;";
				}
				local brother = this.getContainer().getActor();
				local tooltip = [
					{
						id = 103,
						type = "hint",
						text = "战斗等级：" + (this.Math.round(brother.EL_getCombatLevel() * 10) * 0.1)
					},
					{
						id = 104,
						type = "hint",
						text = "达到" + this.Const.EL_Player.EL_PlayerLevel.Max + "级时的时候属预估："
					},
					{
						id = 105,
						type = "hint",
						text = "[img]gfx/ui/icons/health_va11.png[/img] " + a.Hitpoints[0] + " ~ " + a.Hitpoints[1] + bufferHealth + "&nbsp;&nbsp;[img]gfx/ui/icons/melee_skill_va11.png[/img] " + a.MeleeSkill[0] + " ~ " + a.MeleeSkill[1]
					},
					{
						id = 106,
						type = "hint",
						text = "[img]gfx/ui/icons/fatigue_va11.png[/img] " + a.Fatigue[0] + " ~ " + a.Fatigue[1] + bufferFatigue + "&nbsp;&nbsp;[img]gfx/ui/icons/ranged_skill_va11.png[/img] " + a.RangedSkill[0] + " ~ " + a.RangedSkill[1]
					},
					{
						id = 107,
						type = "hint",
						text = "[img]gfx/ui/icons/bravery_va11.png[/img] " + a.Bravery[0] + " ~ " + a.Bravery[1] + bufferBravery + "&nbsp;&nbsp;[img]gfx/ui/icons/melee_defense_va11.png[/img] " + a.MeleeDefense[0] + " ~ " + a.MeleeDefense[1]
					},
					{
						id = 107,
						type = "hint",
						text = "[img]gfx/ui/icons/initiative_va11.png[/img] " + a.Initiative[0] + " ~ " + a.Initiative[1] + bufferInitiative + "&nbsp;&nbsp;[img]gfx/ui/icons/ranged_defense_va11.png[/img] " + a.RangedDefense[0] + " ~ " + a.RangedDefense[1]
					}
				];
				return tooltip;
			}
			else {
				local brother = this.getContainer().getActor();
				local tooltip = [
					{
						id = 103,
						type = "hint",
						text = "Combat Level : " + (this.Math.round(brother.EL_getCombatLevel() * 10) * 0.1)
					}
				];
				return tooltip;
			}


		};

		o.getPerkBackgroundDescription = function(_tree)
		{
			local text = "";
			if (!this.getContainer().getActor().isTryoutDone())
			{
				text += "[color=" + this.Const.UI.Color.NegativeValue + "]Try out[/color] this character to reveal [color=" + this.Const.UI.Color.PositiveValue + "]more[/color] information!";
			}
			else
			{
				local perk_tree = this.getPerkTree();
				for(local i = 0; i < perk_tree.len(); ++i) {
					if(i != 0) {
						text += "\n";
					}
					text += "第" + (i + 1) + "层：";
					for(local j = 0; j < perk_tree[i].len(); ++j) {
						if(j != 0) {
							text += "，";
						}
						text += perk_tree[i][j].Name;
					}
				}
			}
			return text;
		}

	});

	::mods_hookNewObjectOnce("states/world/asset_manager", function ( o )
	{
		o.getRosterDescription = function()
		{
			local ret = {
				Brothers = []
			};

			foreach( bro in this.World.getPlayerRoster().getAll() )
			{
				ret.Brothers.push({
					Name = bro.getNameOnly(),
					Mood = this.Const.MoodStateIcon[bro.getMoodState()],
					Level = bro.getLevel(),
					EL_CombatLevel = bro.EL_getCombatLevel(),
					Background = bro.getBackground().getNameOnly()
				});
			}

			local EL_sortByCombatLevel = function ( first, second )
			{
				if (first.EL_CombatLevel == second.EL_CombatLevel)
				{
					return 0;
				}

				if (first.EL_CombatLevel > second.EL_CombatLevel)
				{
					return -1;
				}
				return 1;
			};
			ret.Brothers.sort(EL_sortByCombatLevel);
			return ret;
		}

	});


	::mods_hookExactClass("entity/tactical/actor", function(o){

		local resetPerks = o.resetPerks;
		o.resetPerks = function()
		{
			local has_gifted = this.getSkills().getSkillByID("perk.gifted");

			resetPerks();

			if (has_gifted != null)
			{
				this.m.PerkPoints -= 1;
				local perk = ::new("scripts/skills/perks/perk_gifted");
				perk.m.IsApplied = true;
				this.getSkills().add(perk);
			}
		}

		local onTurnStart = o.onTurnStart;
		o.onTurnStart = function()
		{
			if(this.World.Flags.get("EL_HasCartAmbitionRule"))
			{
				local items = this.getItems().getAllItems();
				foreach(item in items)
				{
					if(item != null && item.isItemType(this.Const.Items.ItemType.Ammo))
					{
						item.m.Ammo = this.Math.min(item.m.Ammo + 1, item.m.AmmoMax);
					}
				}
			}
			onTurnStart();
		}
	});


	::mods_hookNewObjectOnce("ui/screens/tooltip/tooltip_events", function ( o )
	{
		local general_queryUIElementTooltipData = o.general_queryUIElementTooltipData;
		o.general_queryUIElementTooltipData = function( _entityId, _elementId, _elementOwner )
		{
			local entity;
			if (_entityId != null)
			{
				entity = this.Tactical.getEntityByID(_entityId);
			}

			switch(_elementId)
			{
				case "assets.Brothers":
					local ret = [
						{
							id = 1,
							type = "title",
							text = "Roster (I, C)"
						},
						{
							id = 2,
							type = "description",
							text = "Show the roster of the fighting force of your mercenary company. Increase your Renown to increase the Roster Size!"
						}
					];
					local data = this.World.Assets.getRosterDescription();
					local id = 4;

					if (this.World.Assets.getOrigin().getRosterTier() < this.World.Assets.getOrigin().getRosterTierMax())
					{
						local nextRenown = 0;

						foreach( rep in this.World.Assets.getOrigin().getRosterReputationTiers() )
						{
							if (this.World.Assets.getBusinessReputation() < rep)
							{
								nextRenown = rep;
								break;
							}
						}

						ret.push({
							id = id,
							type = "description",
							text = "Next Roster Size increase at Renown: " + nextRenown
						});
						id = ++id;
						id = id;
					}
					else
					{
						ret.push({
							id = id,
							type = "description",
							text = "Maximum Roster Size achieved!"
						});
						id = ++id;
						id = id;
					}

					ret.push({
						id = id,
						type = "hint",
						text = "世界等级：" + this.World.Assets.m.EL_WorldLevel +
							   "\n世界难度：" + (this.Const.EL_World.EL_WorldChangeEvent.DifficultyMult[this.World.Flags.has("EL_WorldDifficultyChangeEvent") ? this.World.Flags.get("EL_WorldDifficultyChangeEvent") : this.Const.EL_World.EL_WorldChangeEvent.DefaultOption] * 100) + "%" +
							   "\n竞技场等级：" + this.World.Assets.m.EL_ArenaLevel +
							   "\n世界竞技场等级：" + (this.World.Flags.has("EL_WorldArenaMinLevel") ? this.World.Flags.get("EL_WorldArenaMinLevel") : 0)
					});

					id = ++id;
					id = id;

					foreach( bro in data.Brothers )
					{
						ret.push({
							id = id,
							type = "hint",
							icon = bro.Mood,
							text = "Lv" + bro.Level + "(" + (this.Math.round(bro.EL_CombatLevel * 10) * 0.1) + ") " + bro.Name
						});
						id = ++id;
						id = id;
					}
					return ret;
				case "assets.Supplies":
					local desc = "Assorted tools and supplies to keep your weapons, armor, helmets and shields in good condition. Running out of supplies may result in weapons breaking in combat and will leave your armor damaged and useless. Items can only be repaired while camping. More tools can be purchased in town or salvaged from equipment while camping.";
					desc = desc + ("  You can carry " + this.World.Assets.getMaxArmorParts() + " units at most.");
					local ret = [
						{
							id = 1,
							type = "title",
							text = "Tools and Supplies"
						},
						{
							id = 2,
							type = "description",
							text = desc
						}
					];

					ret.push({
						id = 3,
						type = "text",
						text = "Equipment essences are used for upgrading and recrafting equitments, you can get equipment essences by killing enimies or disassembling equitments."
					});
					for(local i = 0; i < this.Const.EL_World.EL_EquipmentEssence.RankNums; ++i) {
						local num = this.World.Assets.EL_getEquipmentEssence(i);
						if(num != 0) {
							ret.push({
								id = 4,
								type = "hint",
								icon = "ui/tooltips/equipment_essence_rank_" + i + ".png",
								text = "X  " + num
							});
						}
					}
					return ret;
				a;
				case "character-stats.Fatigue":
					return [
						{
							id = 1,
							type = "title",
							text = "Fatigue"
						},
						{
							id = 2,
							type = "description",
							text = "Fatigue is gained for every action, like moving or using skills, and when being hit in combat or dodging in melee. It is reduced at a fixed rate of 10 each turn or as much as necessary for a character to start every turn with 10 less than their maximum fatigue. The recovery rate will be increased by 1 every 20 maximum fatigue. If a character accumulates too much fatigue they may need to rest a turn (i.e. do nothing) before being able to use more specialized skills again."
						}
					];
				case "menu-screen.new-campaign.EasyDifficulty":
					return [
						{
							id = 1,
							type = "title",
							text = "Beginner Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Recommended for players new to the game.\n\nYour men get a small bonus to hit chance, and the enemy gets a small penalty, to ease you into the game.\n\n世界等级的提升速度最慢，怪物面板属性提升所需的等级滞后，玩家角色获取经验速度大幅增加。"
						}
					];

				case "menu-screen.new-campaign.NormalDifficulty":
					return [
						{
							id = 1,
							type = "title",
							text = "Veteran Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Recommended for veterans of the game or the genre.\n\n世界等级的提升速度缓慢，怪物面板属性提升所需的等级滞后，玩家角色获取经验速度增加。\n\nProvides for a balanced playing experience that can be quite challenging."
						}
					];

				case "menu-screen.new-campaign.HardDifficulty":
					return [
						{
							id = 1,
							type = "title",
							text = "Expert Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Your opponents will be more challenging and numerous.\n\nRecommended for experts in the game who want an even deadlier challenge."
						}
					];

				case "menu-screen.new-campaign.LegendaryDifficulty":
					return [
						{
							id = 1,
							type = "title",
							text = "Legendary Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Your opponents will be brutal. This is where legends are forged.\n\n Every enemy gains a series of new perks. Zombies with poisonous bites, battleforged orcs, overwhelming barbarians, crippling goblins, underdog backstabber thugs, fearsome vampires, muscular stollwurms\n\n世界等级的提升速度加快，怪物面板属性提升所需的等级提前，玩家角色获取经验速度降低。"
						}
					];

				case "menu-screen.new-campaign.EasyDifficultyEconomic":
					return [
						{
							id = 1,
							type = "title",
							text = "Beginner Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Contracts will pay more, there will be more recruits available, and you\'ll be able to carry more resources at once. \n\n 掉落的精华、金钱、工具、药品数量大幅上升，装备升级升阶重铸所需的普通精华大幅减少，装备分解获得的所有精华大幅上升。\n\n 100% heal and repair rate outside camp. prices are 5%% better when buying and selling, +10% from contract payments, recruits are twice as common. \n\nRecommended for players new to the game."
						}
					];

				case "menu-screen.new-campaign.NormalDifficultyEconomic":
					return [
						{
							id = 1,
							type = "title",
							text = "Veteran Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Provides for a balanced playing experience that can be quite challenging. 66% heal and repair rate outside camp. +50% more recruits available. \n\n 掉落的精华、金钱、工具、药品数量上升，装备升级升阶重铸所需的普通精华减少，装备分解获得的所有精华上升。\n\nRecommended for veterans of the game or the genre."
						}
					];

				case "menu-screen.new-campaign.HardDifficultyEconomic":
					return [
						{
							id = 1,
							type = "title",
							text = "Expert Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Contracts will pay less, and deserters will take their equipment with them.\n\n 33% heal and repair rate outside camp. -5% buy -5% sell -5% payments \n\n Recommended for experts in the game who want more of a challenge managing the company\'s funds and supplies."
						}
					];

				case "menu-screen.new-campaign.LegendaryDifficultyEconomic":
					return [
						{
							id = 1,
							type = "title",
							text = "Legendary Difficulty"
						},
						{
							id = 2,
							type = "description",
							text = "Contract pay will be pitiful.\n\n  10% heal and repair rate outside camp. -10% buy, -10% sell, -10% payments -50% less recruits avaialable. \n\n 掉落的精华、金钱、工具、药品数量降低，装备升级升阶重铸所需的普通精华增加，装备分解获得的所有精华减少。\n\nRecommended for those who want the most challenging experience."
						}
					];

				}


			return general_queryUIElementTooltipData(_entityId, _elementId, _elementOwner);
		}



	});


	::mods_hookNewObjectOnce("ui/global/data_helper", function ( o )
	{
		local addCharacterToUIData = o.addCharacterToUIData;
		o.addCharacterToUIData = function( _entity, _target )
		{
			addCharacterToUIData(_entity, _target);
			_target.levelUpTimes <- _entity.m.LevelUps;
			if(_entity.getLevel() < this.Const.EL_Player.EL_PlayerLevel.Max) {
				_target.xpValue = this.Math.floor(_entity.getXP() - this.Const.LevelXP[_entity.getLevel() - 1]);
				_target.xpValueMax = this.Math.floor(this.Const.LevelXP[_entity.getLevel()] - this.Const.LevelXP[_entity.getLevel() - 1]);
			}
			else {
				_target.xpValue = this.Math.floor(this.Const.LevelXP[this.Const.EL_Player.EL_PlayerLevel.Max - 1] - this.Const.LevelXP[this.Const.EL_Player.EL_PlayerLevel.Max - 2]);
				_target.xpValueMax = this.Math.floor(this.Const.LevelXP[this.Const.EL_Player.EL_PlayerLevel.Max - 1] - this.Const.LevelXP[this.Const.EL_Player.EL_PlayerLevel.Max - 2]);
			}
		}

		local addStatsToUIData = o.addStatsToUIData;
		o.addStatsToUIData = function( _entity, _target )
		{
			addStatsToUIData(_entity, _target);
			local properties = _entity.getCurrentProperties();
			_target.initiativeMax <- this.Const.EL_Player.EL_PlayerStatesBoard.InitiativeMax;
			_target.braveryMax <- this.Const.EL_Player.EL_PlayerStatesBoard.BraveryMax;
			_target.meleeSkillMax <- this.Const.EL_Player.EL_PlayerStatesBoard.MeleeSkillMax;
			_target.rangeSkillMax <- this.Const.EL_Player.EL_PlayerStatesBoard.RangeSkillMax;
			_target.meleeDefenseMax <- this.Const.EL_Player.EL_PlayerStatesBoard.MeleeDefenseMax;
			_target.rangeDefenseMax <- this.Const.EL_Player.EL_PlayerStatesBoard.RangeDefenseMax;
			_target.actionPoints <- _entity.getActionPoints() >= 0 ? _entity.getActionPoints() : 0;
			_target.regularDamage <- properties.getRegularDamageAverage();
			_target.regularDamageMax <- this.Const.EL_Player.EL_PlayerStatesBoard.RegularDamageMax;
			_target.crushingDamageMax <- this.Const.EL_Player.EL_PlayerStatesBoard.CrushingDamageMax;
			_target.chanceToHitHeadMax <- this.Const.EL_Player.EL_PlayerStatesBoard.ChanceToHitHeadMax;
	 		_target.sightDistanceMax <- this.Const.EL_Player.EL_PlayerStatesBoard.SightDistanceMax;
		}

		local convertEntityHireInformationToUIData = o.convertEntityHireInformationToUIData;
		o.convertEntityHireInformationToUIData = function( _entity )
		{
			local result = convertEntityHireInformationToUIData(_entity);
			local background = _entity.getBackground();
			local base_properties = _entity.getBaseProperties();
			result.Name = _entity.getNameOnly();
			result.InitialMoneyCost = this.Math.ceil(_entity.getHiringCost() * this.World.Assets.m.HiringCostMult * (this.World.Retinue.hasFollower("follower.recruiter") ? 0.8 : 1.0));
			if(_entity.EL_getRankLevel() == 0)
			{
				result.tryoutName <- _entity.getNameOnly() + " - 普通";
			}
			else if(_entity.EL_getRankLevel() == 1)
			{
				result.tryoutName <- _entity.getNameOnly() + " - 精英";
			}
			else if(_entity.EL_getRankLevel() == 1)
			{
				result.tryoutName <- _entity.getNameOnly() + " - 英雄";
			}
			result.rankName <- _entity.EL_getRankLevel();
			result.hitpoints <- base_properties.Hitpoints;
			result.bravery <- base_properties.Bravery;
			result.fatigue <- base_properties.Stamina;
			result.initiative <- base_properties.Initiative;
			result.meleeSkill <- base_properties.MeleeSkill;
			result.rangeSkill <- base_properties.RangedSkill;
			result.meleeDefense <- base_properties.MeleeDefense;
			result.rangeDefense <- base_properties.RangedDefense;
			return result;
		}
	});

	::mods_hookExactClass("skills/injury", function(o){
		o.getHealingTime = function()
		{
			local time = this.getTime();
			local mint = this.Math.max(1, (this.m.IsTreated ? this.m.HealingTimeMin * 0.5 : this.m.HealingTimeMin) - this.Math.ceil((time - this.m.TimeApplied) / this.World.getTime().SecondsPerDay));
			local maxt = this.Math.max(1, (this.m.IsTreated ? this.m.HealingTimeMax * 0.5 : this.m.HealingTimeMax) - this.Math.floor((time - this.m.TimeApplied) / this.World.getTime().SecondsPerDay));

			if (("State" in this.World) && this.World.State != null && this.World.Retinue.hasFollower("follower.surgeon"))
			{
				mint = this.Math.max(1, this.Math.ceil(mint / 2));
				maxt = this.Math.max(1, this.Math.ceil(maxt / 2));
			}

			if (this.getContainer().getActor().getSkills().hasSkill("effects.nachzehrer_potion"))
			{
				mint = this.Math.max(1, mint - 1);
				maxt = this.Math.max(1, maxt - 1);
			}

			return {
				Min = mint,
				Max = maxt
			};
		}

		o.onNewDay = function()
		{
			if (!(this.getContainer().getActor().getSkills().hasSkill("trait.oath_of_sacrifice") && this.m.IsTreatable) && (this.World.Assets.getMedicine() >= this.Const.World.Assets.MedicinePerInjuryDay || !this.m.IsHealingMentioned))
			{
				if (this.m.IsHealingMentioned)
				{
					this.World.Assets.addMedicine(-this.Const.World.Assets.MedicinePerInjuryDay);
				}

				local time = this.getTime();
				local daysPassed = this.Math.ceil((time - this.m.TimeApplied) / this.World.getTime().SecondsPerDay);
				local minTime = this.m.HealingTimeMin * (this.m.IsTreated ? 0.5 : 1.0 - 0.5 * this.getTreatedPercentage());
				local maxTime = this.m.HealingTimeMax * (this.m.IsTreated ? 0.5 : 1.0 - 0.5 * this.getTreatedPercentage());

				if (this.World.Retinue.hasFollower("follower.surgeon"))
				{
					minTime = this.Math.max(1, this.Math.ceil(mint / 2));
					maxTime = this.Math.max(1, this.Math.ceil(maxt / 2));
				}

				if (this.getContainer().getActor().getSkills().hasSkill("effects.nachzehrer_potion"))
				{
					minTime = this.Math.max(1, minTime - 1);
					maxTime = this.Math.max(1, maxTime - 1);
				}

				if (daysPassed < minTime)
				{
					return;
				}

				local chance = daysPassed / (maxTime * 1.0) * 100.0;

				if (this.Math.rand(1, 100) <= chance)
				{
					this.removeSelf();
					return;
				}
			}
			else
			{
				this.m.TimeApplied = this.Math.minf(this.Time.getVirtualTimeF(), this.m.TimeApplied + this.World.getTime().SecondsPerDay);
			}
		}
	});


});
