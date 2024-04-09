local gt = getroottable();

::mods_registerMod("el_world", 1, "el_world");
::mods_queue(null, "endless_mod", function ()
{

	::mods_hookNewObjectOnce("states/world/asset_manager", function ( o )
	{
		o.m.EL_BaseWorldLevel <- this.Const.EL_World.EL_WorldLevel.Min;
		o.m.EL_WorldLevel <- this.Const.EL_World.EL_WorldLevel.Min;
		o.m.EL_WorldLevelOffset <- 0;
		o.m.EL_WorldStrength <- this.Const.EL_World.EL_WorldStrength.Min;
		o.m.EL_CurrentUpdateDay <- 0;
		o.m.EL_EquipmentEssence <- [0, 0, 0, 0, 0];

		o.m.EL_SoulEnergy <- 0;
		o.m.EL_SoulEnergyMax <- this.Const.EL_World.EL_SoulEnergy.Min;
		o.m.EL_SoulEnergyXP <- 0;
		o.m.EL_SoulEnergyGianMult <- 1.0;

		o.m.EL_LastArenaDay <- 0;
		o.m.EL_ArenaLevel <- 0;
		o.m.EL_ArenaMaxLevel <- 0;

		o.m.EL_DropParty <- null;

		o.getSellPriceMult = function ()
		{
			return this.World.Retinue.hasFollower("follower.trader") ? 1.1 * this.m.SellPriceMult : this.m.SellPriceMult;
		}

		o.addBusinessReputation = function ( _f )
		{
			local follow_mult = this.World.Retinue.hasFollower("follower.minstrel") ? 1.5 : 1.0;
			this.m.BusinessReputation += this.Math.ceil(_f * this.m.BusinessReputationRate * follow_mult);
			this.m.BusinessReputationMax = this.Math.max(this.m.BusinessReputation, this.m.BusinessReputationMax);

			if (this.m.BusinessReputation >= 1000)
			{
				this.updateAchievement("MakingAName", 1, 1);
			}

			if (this.m.BusinessReputation >= 3000)
			{
				this.updateAchievement("ManOfRenown", 1, 1);
			}

			if (this.m.BusinessReputation >= 8000)
			{
				this.updateAchievement("StuffOfLegends", 1, 1);
			}
		}

		local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			onSerialize(_out);
			_out.writeI32(this.m.EL_BaseWorldLevel);
			_out.writeI32(this.m.EL_WorldLevel);
			_out.writeI32(this.m.EL_WorldLevelOffset);
			_out.writeI32(this.m.EL_WorldStrength);
			_out.writeI32(this.m.EL_CurrentUpdateDay);

			_out.writeF32(this.m.EL_SoulEnergy);
			_out.writeI32(this.m.EL_SoulEnergyMax);
			_out.writeF32(this.m.EL_SoulEnergyXP);

			_out.writeI32(this.m.EL_LastArenaDay);
			_out.writeI32(this.m.EL_ArenaLevel);
			_out.writeI32(this.m.EL_ArenaMaxLevel);
			
			for(local i = 0; i < this.m.EL_EquipmentEssence.len(); ++i) {
                _out.writeI32(this.m.EL_EquipmentEssence[i]);
            }
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize(_in);
			this.m.EL_BaseWorldLevel = _in.readI32();
			this.m.EL_WorldLevel = _in.readI32();
			this.m.EL_WorldLevelOffset = _in.readI32();
			this.m.EL_WorldStrength = _in.readI32();
			this.m.EL_CurrentUpdateDay = _in.readI32();

			this.m.EL_SoulEnergy = _in.readF32();
			this.m.EL_SoulEnergyMax = _in.readI32();
			this.m.EL_SoulEnergyXP = _in.readF32();

			this.m.EL_LastArenaDay = _in.readI32();
			this.m.EL_ArenaLevel = _in.readI32();
			this.m.EL_ArenaMaxLevel = _in.readI32();
			for(local i = 0; i < this.m.EL_EquipmentEssence.len(); ++i) {
                this.m.EL_EquipmentEssence[i] = _in.readI32();
            }
		}

		o.EL_getWorldDifficultFactor <- function()
		{
			return this.Const.EL_World.EL_WorldChangeEvent.DifficultyMult[this.World.Flags.get("EL_WorldDifficultyChangeEvent")];
		}

		o.EL_getHalfWorldDifficultFactor <- function()
		{
			return (1 + (this.Const.EL_World.EL_WorldChangeEvent.DifficultyMult[this.World.Flags.get("EL_WorldDifficultyChangeEvent")] - 1) * 0.5);
		}

		o.EL_addEquipmentEssence <- function( _rank, _num )
		{
			this.m.EL_EquipmentEssence[_rank] += _num;
		}

		o.EL_getEquipmentEssence <- function( _rank )
		{
			return this.m.EL_EquipmentEssence[_rank];
		}

		o.EL_setEquipmentEssence <- function( _rank, _num )
		{
			this.m.EL_EquipmentEssence[_rank] = _num;
		}


		o.EL_addSoulEnergy <- function( _num )
		{
			local soul_energy_max = 100;
			local bros = this.World.getPlayerRoster().getAll();
			foreach( bro in bros )
			{
				local main_hand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
				if(main_hand != null && main_hand.getID() == "el_weapon.frostmourne")
				{
					soul_energy_max += main_hand.EL_getRankLevel() * 100;
				}
			} 
			if(_num > 0)
			{
				_num = this.Math.round(_num * this.EL_getSoulEnergyGianMult());
				this.m.EL_SoulEnergyXP += _num;
			}
			while(this.m.EL_SoulEnergyXP > this.m.EL_SoulEnergyMax - this.Const.EL_World.EL_SoulEnergy.Min)
			{
				++this.m.EL_SoulEnergyMax;
				this.m.EL_SoulEnergyXP -= this.m.EL_SoulEnergyMax - this.Const.EL_World.EL_SoulEnergy.Min;
				if(this.m.EL_SoulEnergyMax >= soul_energy_max)
				{
					this.m.EL_SoulEnergyMax = soul_energy_max;
					this.m.EL_SoulEnergyXP = 0;
				}
			}
			this.m.EL_SoulEnergy += _num;
			if(this.m.EL_SoulEnergy > this.m.EL_SoulEnergyMax)
			{
				this.m.EL_SoulEnergy = this.m.EL_SoulEnergyMax;
			}
		}

		o.EL_getSoulEnergy <- function()
		{
			return this.Math.floor(this.m.EL_SoulEnergy);
		}

		o.EL_setSoulEnergy <- function( _num )
		{
			this.m.EL_SoulEnergy = _num;
		}

		o.EL_getSoulEnergyMax <- function()
		{
			return this.m.EL_SoulEnergyMax;
		}

		o.EL_setSoulEnergyMax <- function( _num )
		{
			this.m.EL_SoulEnergyMax = _num;
		}

		o.EL_getSoulEnergyGianMult <- function()
		{
			return this.m.EL_SoulEnergyGianMult;
		}


		o.EL_UpdateWorldStrengthAndLevel <- function() {
			local day = this.World.getTime().Days;
			this.m.EL_CurrentUpdateDay = day;
			if(!this.World.Flags.has("EL_WorldDifficultyChangeEvent")) {
				this.World.Flags.set("EL_WorldDifficultyChangeEvent", this.Const.EL_World.EL_WorldChangeEvent.DefaultOption);
			}
			//Calculate world level.
			if(this.m.EL_BaseWorldLevel < this.Const.EL_World.EL_WorldLevel.BaseStableLevel){
				if(day * this.Const.EL_World.EL_WorldStartMult[this.getCombatDifficulty()] >
				    	this.Const.EL_World.EL_WorldLevel.Table[this.m.EL_BaseWorldLevel]){
					this.m.EL_BaseWorldLevel += 1;
				}
			}
			else {
				if(day * this.Const.EL_World.EL_WorldStartMult[this.getCombatDifficulty()] >
						this.Const.EL_World.EL_WorldLevel.Table[this.Const.EL_World.EL_WorldLevel.BaseStableLevel - 1] +
						(this.m.EL_BaseWorldLevel - this.Const.EL_World.EL_WorldLevel.BaseStableLevel) * this.Const.EL_World.EL_WorldLevel.BaseStableMult){
					this.m.EL_BaseWorldLevel += 1;
				}
			}
			this.m.EL_WorldLevel = this.m.EL_BaseWorldLevel + this.m.EL_WorldLevelOffset;
			if(this.m.EL_WorldLevel < this.Const.EL_World.EL_WorldLevel.Min){
				this.m.EL_WorldLevel = this.Const.EL_World.EL_WorldLevel.Min;
			}
			if(this.m.EL_WorldLevel > this.Const.EL_World.EL_WorldLevel.Max){
				this.m.EL_WorldLevel = this.Const.EL_World.EL_WorldLevel.Max;
			}
			//Calculate world strength.
			local temp_world_strength = this.Const.EL_World.EL_WorldStrength.getWorldStrength(day);
			local difficult_mult = this.World.Assets.EL_getWorldDifficultFactor() *
								   this.Const.EL_World.EL_WorldStartMult[this.getCombatDifficulty()];
			temp_world_strength *= difficult_mult;

			if(temp_world_strength > this.Const.EL_World.EL_WorldStrength.Min){
				this.m.EL_WorldStrength = this.Math.floor(temp_world_strength);
			}
			else {
				this.m.EL_WorldStrength = this.Const.EL_World.EL_WorldStrength.Min;
			}
			this.logInfo("Day " + day + " : World Level " + this.m.EL_WorldLevel);
			this.logInfo("Day " + day + " : World Strength " + this.m.EL_WorldStrength);
		}


		local update = o.update;
		o.update = function( _worldState )
		{
			if(this.m.EL_CurrentUpdateDay < this.World.getTime().Days) {
				this.EL_UpdateWorldStrengthAndLevel();
				if(this.World.Flags.get("EL_HasCrownsAmbitionRule"))
				{
					this.World.Assets.addMoney(this.Math.min(10000, this.Math.round(this.World.Assets.getMoney() * 0.01)));
				}
			}		
			
			update(_worldState);
		}


	});

	::mods_hookExactClass("entity/world/player_party", function ( o )
	{
		o.updateStrength = function ()
		{
			// local day = this.World.getTime().Days;
			// if(this.World.Assets.m.EL_CurrentUpdateDay != day) {
			// 	this.World.Assets.EL_UpdateWorldStrengthAndLevel();
			// }
			this.m.Strength = this.World.Assets.m.EL_WorldStrength;
		};
	});

	::mods_hookExactClass("states/world_state", function ( o )
	{

		o.onUpdate = function()
		{
			if (!this.m.IsGameOver && (this.World.getPlayerRoster().getSize() == 0 || !this.World.Assets.getOrigin().onCombatFinished()))
			{
				this.showGameFinishScreen(false);
				return;
			}

			this.Root.setBackgroundTaskCallback(this.onProcessInThread.bindenv(this));

			if (this.Time.getFrame() == this.m.AutoUnpauseFrame)
			{
				this.m.AutoUnpauseFrame = 0;
				this.setAutoPause(false);

				if (this.Settings.getGameplaySettings().AutoPauseAfterCity)
				{
					this.setPause(true);
				}
			}

			if (this.World.Camp.isCamping())
			{
				//this.m.LastWorldSpeedMult = this.Const.World.SpeedSettings.CampMult;

				if (!this.isPaused())
				{
					this.World.setSpeedMult(this.m.LastWorldSpeedMult);
					this.m.Camp.update(this);
				}
			}

			if (!this.isPaused())
			{
				this.m.IsRunningUpdatesWhilePaused = false;
				this.World.Contracts.update();
				this.m.Assets.update(this);
			}
			else if (this.m.IsTriggeringContractUpdatesOnce && !this.m.MenuStack.hasBacksteps() && !(this.LoadingScreen.isAnimating() || this.LoadingScreen.isVisible()))
			{
				this.m.IsTriggeringContractUpdatesOnce = false;
				this.World.Contracts.update(true);
				this.m.Events.update();
			}

			if (this.m.MenuStack.hasBacksteps())
			{
				this.resetCameraState();
			}
			else
			{
				this.updateCameraScrolling();
				this.updateCursorAndTooltip();

				if (this.Settings.getTempGameplaySettings().CameraLocked)
				{
					this.World.getCamera().setPos(this.World.State.getPlayer().getPos());
				}
			}

			this.World.getCamera().update();
			this.World.update();
			this.updateScene();
			this.updateDayTime();

			if (this.m.AIEngageCallback != null)
			{
				this.m.AIEngageCallback();
				this.m.AIEngageCallback = null;
			}
			else if (this.m.AutoEnterLocation != null && !this.m.AutoEnterLocation.isNull())
			{
				if (this.m.Player.getTile().isSameTileAs(this.m.AutoEnterLocation.getTile()) && this.m.Player.getDistanceTo(this.m.AutoEnterLocation.get()) <= this.Const.World.CombatSettings.CombatPlayerDistance)
				{
					this.enterLocation(this.m.AutoEnterLocation.get());
				}
			}
			else if (this.m.AutoAttack != null && !this.m.AutoAttack.isNull() && this.m.AutoAttack.isAlive() && !this.m.AutoAttack.isHiddenToPlayer())
			{
				if (this.m.Player.getDistanceTo(this.m.AutoAttack.get()) <= this.Const.World.CombatSettings.CombatPlayerDistance)
				{
					if (this.m.AutoAttack.isAlliedWithPlayer() && this.World.Contracts.getActiveContract() == null)
					{
						local f = this.World.FactionManager.getFaction(this.m.AutoAttack.getFaction());
						f.addPlayerRelation(-f.getPlayerRelation(), "Attacked them");
						this.m.AutoAttack.updatePlayerRelation();
						this.World.Assets.addMoralReputation(-2);
					}

					if (this.m.AutoAttack.onEnteringCombatWithPlayer())
					{
						this.showCombatDialog();
					}

					this.m.AutoAttack = null;
					this.m.Player.setPath(null);
					this.m.Player.setDestination(null);
				}
				else if (this.getVecDistance(this.m.AutoAttack.getPos(), this.m.Player.getPos()) <= this.Const.World.MovementSettings.PlayerDirectMoveRadius)
				{
					this.m.Player.setPath(null);
					this.m.Player.setDestination(this.m.AutoAttack.getPos());
				}
				else if (!this.m.Player.hasPath() || this.Time.getVirtualTimeF() - this.m.LastAutoAttackPath >= 0.1)
				{
					local navSettings = this.World.getNavigator().createSettings();
					navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost;
					navSettings.RoadMult = 1.0 / this.Const.World.MovementSettings.RoadMult;
					local path = this.World.getNavigator().findPath(this.m.Player.getTile(), this.m.AutoAttack.getTile(), navSettings, 0);

					if (!path.isEmpty())
					{
						this.m.Player.setPath(path);
					}
					else
					{
						this.m.Player.setPath(null);
					}

					this.m.LastAutoAttackPath = this.Time.getVirtualTimeF();
				}
			}
			else if (!this.m.IsGamePaused && !this.m.IsGameAutoPaused)
			{
				this.m.Events.update();
				this.m.Ambitions.update();

				if (this.Time.getRealTimeF() - this.m.LastMusicUpdate > 60.0)
				{
					this.setWorldmapMusic(true);
				}
			}

			if (this.m.LastEnteredTown == null && (this.m.LastPlayerTile == null || this.m.LastIsDaytime != this.World.getTime().IsDaytime || this.m.LastPlayerTile.ID != this.m.Player.getTile().ID))
			{
				this.m.LastPlayerTile = this.m.Player.getTile();
				this.m.LastIsDaytime = this.World.getTime().IsDaytime;
				this.Sound.setAmbience(0, this.getSurroundingAmbienceSounds(), this.Const.Sound.Volume.Ambience * this.Const.Sound.Volume.AmbienceTerrain, this.World.getTime().IsDaytime ? this.Const.Sound.AmbienceMinDelay : this.Const.Sound.AmbienceMinDelayAtNight);
				this.Sound.setAmbience(1, this.getSurroundingLocationSounds(), this.Const.Sound.Volume.Ambience * this.Const.Sound.Volume.AmbienceOutsideSettlement, this.Const.Sound.AmbienceOutsideDelay);
			}

			local zoom_banner = this.m.Player.getSprite("zoom_banner");

			if (zoom_banner.IsFadingDone)
			{
				if (this.World.getCamera().Zoom >= 4.0)
				{
					if (zoom_banner.Alpha == 0)
					{
						zoom_banner.fadeIn(300);
					}
				}
				else if (this.World.getCamera().Zoom < 4.0)
				{
					if (zoom_banner.Alpha != 0)
					{
						zoom_banner.fadeOut(300);
					}
				}
			}

			this.m.IsUpdatedOnce = true;
		}

		o.onCamp = function()
		{
			if (!this.isCampingAllowed())
			{
				return;
			}

			this.World.Camp.onCamp();

			if (this.World.Camp.isCamping())
			{
				this.m.Player.setDestination(null);
				this.m.Player.setPath(null);
				this.m.AutoEnterLocation = null;
				this.m.AutoAttack = null;
			}

			if (this.World.Camp.isCamping())
			{
				//this.m.LastWorldSpeedMult = this.Const.World.SpeedSettings.CampMult;
				this.World.TopbarDayTimeModule.enableNormalTimeButton(true);

				if (!this.isPaused())
				{
					this.World.setSpeedMult(this.m.LastWorldSpeedMult);
					//this.World.TopbarDayTimeModule.updateTimeButtons(2);
				}
				else
				{
					//this.World.TopbarDayTimeModule.updateTimeButtons(0);
				}

				this.setPause(false);
			}
			else
			{
				// this.m.LastWorldSpeedMult = 1.0;
				this.World.TopbarDayTimeModule.enableNormalTimeButton(true);

				if (!this.isPaused())
				{
					this.World.setSpeedMult(this.m.LastWorldSpeedMult);
					//this.World.TopbarDayTimeModule.updateTimeButtons(1);
				}
				else
				{
					//this.World.TopbarDayTimeModule.updateTimeButtons(0);
				}

				this.setPause(true);
			}
		}
	});


	::mods_hookExactClass("states/tactical_state", function ( o )
	{
		// o.onBattleEnded = function ()
		// {
		// 	if (this.m.IsExitingToMenu)
		// 	{
		// 		return;
		// 	}

		// 	this.m.IsBattleEnded = true;
		// 	local isVictory = this.Tactical.Entities.getCombatResult() == this.Const.Tactical.CombatResult.EnemyDestroyed || this.Tactical.Entities.getCombatResult() == this.Const.Tactical.CombatResult.EnemyRetreated;
		// 	this.m.IsFogOfWarVisible = false;
		// 	this.Tactical.fillVisibility(this.Const.Faction.Player, true);
		// 	this.Tactical.getCamera().zoomTo(2.0, 1.0);
		// 	this.Tooltip.hide();
		// 	this.m.TacticalScreen.hide();
		// 	this.Tactical.OrientationOverlay.removeOverlays();

		// 	if (isVictory)
		// 	{
		// 		this.Music.setTrackList(this.Const.Music.VictoryTracks, this.Const.Music.CrossFadeTime);

		// 		if (!this.isScenarioMode())
		// 		{
		// 			if (this.m.StrategicProperties != null && this.m.StrategicProperties.IsAttackingLocation)
		// 			{
		// 				this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnVictoryVSLocation);
		// 			}
		// 			else
		// 			{
		// 				this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnVictory);
		// 			}

		// 			this.World.Contracts.onCombatVictory(this.m.StrategicProperties != null ? this.m.StrategicProperties.CombatID : "");
		// 			this.World.Events.onCombatVictory(this.m.StrategicProperties != null ? this.m.StrategicProperties.CombatID : "");
		// 			this.World.Statistics.getFlags().set("LastPlayersAtBattleStartCount", this.m.MaxPlayers);
		// 			this.World.Statistics.getFlags().set("LastEnemiesDefeatedCount", this.m.MaxHostiles);
		// 			this.World.Statistics.getFlags().set("LastCombatResult", 1);

		// 			if (this.World.Statistics.getFlags().getAsInt("LastCombatFaction") == this.World.FactionManager.getFactionOfType(this.Const.FactionType.Beasts).getID())
		// 			{
		// 				this.World.Statistics.getFlags().increment("BeastsDefeated");
		// 			}

		// 			this.World.Assets.getOrigin().onBattleWon(this.m.CombatResultLoot);
		// 			local playerRoster = this.World.getPlayerRoster().getAll();

		// 			foreach( bro in playerRoster )
		// 			{
		// 				if (bro.getPlaceInFormation() <= 26 && !bro.isPlacedOnMap() && bro.getFlags().get("Devoured") == true)
		// 				{
		// 					bro.getSkills().onDeath(this.Const.FatalityType.Devoured);
		// 					bro.onDeath(null, null, null, this.Const.FatalityType.Devoured);
		// 					this.World.getPlayerRoster().remove(bro);
		// 				}
		// 				else if (this.m.StrategicProperties.IsUsingSetPlayers && bro.isPlacedOnMap())
		// 				{
		// 					bro.getLifetimeStats().BattlesWithoutMe = 0;

		// 					if (this.m.StrategicProperties.IsArenaMode)
		// 					{
		// 						bro.improveMood(this.Const.MoodChange.BattleWon, "Won a fight in the arena");
		// 					}
		// 					else
		// 					{
		// 						bro.improveMood(this.Const.MoodChange.BattleWon, "Won a battle");
		// 					}
		// 				}
		// 				else if (bro.getSkills().hasSkill("perk.legend_pacifist"))
		// 				{
		// 					if (bro.getLifetimeStats().BattlesWithoutMe > bro.getLifetimeStats().Battles)
		// 					{
		// 						bro.worsenMood(this.Const.MoodChange.BattleWithoutMe, "Forced into battle against their wishes");
		// 					}
		// 				}
		// 				else if (!this.m.StrategicProperties.IsUsingSetPlayers)
		// 				{
		// 					if (bro.isPlacedOnMap())
		// 					{
		// 						bro.getLifetimeStats().BattlesWithoutMe = 0;
		// 						bro.improveMood(this.Const.MoodChange.BattleWon, "Won a battle");
		// 					}
		// 					else if (bro.getMoodState() > this.Const.MoodState.Concerned && !bro.getCurrentProperties().IsContentWithBeingInReserve && !this.World.Assets.m.IsDisciplined)
		// 					{
		// 						++bro.getLifetimeStats().BattlesWithoutMe;

		// 						if (bro.getLifetimeStats().BattlesWithoutMe > this.Math.max(2, 6 - bro.getLevel()))
		// 						{
		// 							bro.worsenMood(this.Const.MoodChange.BattleWithoutMe, "Felt useless in reserve");
		// 						}
		// 					}
		// 				}

		// 				bro.getFlags().remove("TemporaryRider");
		// 			}
		// 		}
		// 	}
		// 	else
		// 	{
		// 		this.Music.setTrackList(this.Const.Music.DefeatTracks, this.Const.Music.CrossFadeTime);

		// 		if (!this.isScenarioMode())
		// 		{
		// 			local playerRoster = this.World.getPlayerRoster().getAll();

		// 			foreach( bro in playerRoster )
		// 			{
		// 				if (bro.getPlaceInFormation() <= 26 && !bro.isPlacedOnMap() && bro.getFlags().get("Devoured") == true)
		// 				{
		// 					if (bro.isAlive())
		// 					{
		// 						bro.getSkills().onDeath(this.Const.FatalityType.Devoured);
		// 						bro.onDeath(null, null, null, this.Const.FatalityType.Devoured);
		// 						this.World.getPlayerRoster().remove(bro);
		// 					}
		// 				}
		// 				else if (bro.isPlacedOnMap() && (bro.getFlags().get("Charmed") == true || bro.getFlags().get("Sleeping") == true || bro.getFlags().get("Nightmare") == true))
		// 				{
		// 					if (bro.isAlive())
		// 					{
		// 						bro.kill(null, null, this.Const.FatalityType.Suicide);
		// 					}
		// 				}
		// 				else if (bro.isPlacedOnMap())
		// 				{
		// 					bro.getLifetimeStats().BattlesWithoutMe = 0;

		// 					if (this.Tactical.getCasualtyRoster().getSize() != 0)
		// 					{
		// 						bro.worsenMood(this.Const.MoodChange.BattleLost, "Lost a battle");
		// 					}
		// 					else if (this.World.Assets.getOrigin().getID() != "scenario.deserters")
		// 					{
		// 						bro.worsenMood(this.Const.MoodChange.BattleRetreat, "Retreated from battle");
		// 					}
		// 				}
		// 				else if (bro.getMoodState() > this.Const.MoodState.Concerned && !bro.getCurrentProperties().IsContentWithBeingInReserve && (!bro.getFlags().has("TemporaryRider") || !bro.getFlags().has("IsHorse")))
		// 				{
		// 					++bro.getLifetimeStats().BattlesWithoutMe;

		// 					if (bro.getLifetimeStats().BattlesWithoutMe > this.Math.max(2, 6 - bro.getLevel()))
		// 					{
		// 						bro.worsenMood(this.Const.MoodChange.BattleWithoutMe, "Felt useless in reserve");
		// 					}
		// 				}

		// 				bro.getFlags().remove("TemporaryRider");
		// 			}

		// 			if (this.World.getPlayerRoster().getSize() != 0)
		// 			{
		// 				this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnLoss);
		// 				this.World.Contracts.onRetreatedFromCombat(this.m.StrategicProperties != null ? this.m.StrategicProperties.CombatID : "");
		// 				this.World.Events.onRetreatedFromCombat(this.m.StrategicProperties != null ? this.m.StrategicProperties.CombatID : "");
		// 				this.World.Statistics.getFlags().set("LastEnemiesDefeatedCount", 0);
		// 				this.World.Statistics.getFlags().set("LastCombatResult", 2);
		// 			}
		// 		}
		// 	}

		// 	if (this.m.StrategicProperties != null && this.m.StrategicProperties.IsArenaMode)
		// 	{
		// 		this.Sound.play(this.Const.Sound.ArenaEnd[this.Math.rand(0, this.Const.Sound.ArenaEnd.len() - 1)], this.Const.Sound.Volume.Tactical);
		// 		this.Time.scheduleEvent(this.TimeUnit.Real, 4500, function ( _t )
		// 		{
		// 			this.Sound.play(this.Const.Sound.ArenaOutro[this.Math.rand(0, this.Const.Sound.ArenaOutro.len() - 1)], this.Const.Sound.Volume.Tactical);
		// 		}, null);
		// 	}

		// 	this.gatherBrothers(isVictory);
		// 	this.gatherLoot();
		// 	this.Time.scheduleEvent(this.TimeUnit.Real, 800, this.onBattleEndedDelayed.bindenv(this), isVictory);
		// };
		// o.onBattleEndedDelayed = function ( _isVictory )
		// {
		// 	if (this.m.MenuStack.hasBacksteps())
		// 	{
		// 		this.Time.scheduleEvent(this.TimeUnit.Real, 50, this.onBattleEndedDelayed.bindenv(this), _isVictory);
		// 		return;
		// 	}

		// 	if (this.m.IsGameFinishable)
		// 	{
		// 		this.Tooltip.hide();
		// 		this.m.TacticalCombatResultScreen.show();
		// 		this.Cursor.setCursor(this.Const.UI.Cursor.Hand);
		// 		this.m.MenuStack.push(function ()
		// 		{
		// 			if (this.m.TacticalCombatResultScreen != null)
		// 			{
		// 				if (_isVictory && !this.Tactical.State.isScenarioMode() && this.m.StrategicProperties != null && (!this.m.StrategicProperties.IsLootingProhibited || this.m.StrategicProperties.IsArenaMode && !this.m.CombatResultLoot.isEmpty()) && this.Settings.getGameplaySettings().AutoLoot)
		// 				{
		// 					this.m.TacticalCombatResultScreen.onLootAllItemsButtonPressed();
		// 					this.World.Assets.consumeItems();
		// 					this.World.Assets.refillAmmo();
		// 					this.World.Assets.updateAchievements();
		// 					this.World.Assets.checkAmbitionItems();
		// 					this.World.State.updateTopbarAssets();
		// 				}

		// 				if (("Camp" in this.World) && this.World.Camp != null)
		// 				{
		// 					this.World.Camp.assignRepairs();
		// 				}

		// 				this.m.TacticalScreen.show();
		// 				this.m.TacticalCombatResultScreen.hide();
		// 			}
		// 		}, function ()
		// 		{
		// 			return false;
		// 		});
		// 	}
		// };
		o.gatherLoot = function ()
		{
			local playerKills = 0;

			foreach( bro in this.m.CombatResultRoster )
			{
				playerKills = playerKills + bro.getCombatStats().Kills;
			}

			if(!this.World.Statistics.getFlags().has("EL_IfPlayerPartyKilled")) {
				this.World.Statistics.getFlags().set("EL_IfPlayerPartyKilled", false);
			}

			if (!this.isScenarioMode())
			{
				this.World.Statistics.getFlags().set("LastCombatKills", playerKills);
			}

			local isArena = !this.isScenarioMode() && this.m.StrategicProperties != null && this.m.StrategicProperties.IsArenaMode;

			if (!isArena && !this.isScenarioMode() && this.m.StrategicProperties != null && this.m.StrategicProperties.IsLootingProhibited)
			{
				return;
			}

			local EntireCompanyRoster = this.World.getPlayerRoster().getAll();
			local CannibalsInRoster = 0;
			local CannibalisticButchersInRoster = 0;
			local zombieSalvage = 10;
			local zombieLoot = false;
			local skeletonLoot = false;

			foreach( bro in EntireCompanyRoster )
			{
				if (!bro.isAlive())
				{
					continue;
				}

				switch(bro.getBackground().getID())
				{
				case "background.vazl_cannibal":
					CannibalsInRoster = CannibalsInRoster + 1;
					break;

				case "background.gravedigger":
					zombieSalvage = zombieSalvage + 5;
					break;

				case "background.graverobber":
					zombieSalvage = zombieSalvage + 5;
					break;

				case "background.butcher":
					if (bro.getSkills().hasSkill("trait.vazl_cannibalistic"))
					{
						CannibalisticButchersInRoster = CannibalisticButchersInRoster + 1;
					}

					break;
				}

				if (bro.getSkills().hasSkill("perk.legends_reclamation"))
				{
					local skill = bro.getSkills().getSkillByID("perk.legends_reclamation");
					zombieSalvage = zombieSalvage + skill.m.LootChance;
				}

				if (bro.getSkills().hasSkill("perk.legend_resurrectionist"))
				{
					local skill = bro.getSkills().getSkillByID("perk.legend_resurrectionist");
					zombieSalvage = zombieSalvage + skill.m.LootChance;
				}

				if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_low") || bro.getSkills().hasSkill("perk.legend_spawn_zombie_med") || bro.getSkills().hasSkill("perk.legend_spawn_zombie_high"))
				{
					zombieLoot = true;
				}

				if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_low") || bro.getSkills().hasSkill("perk.legend_spawn_skeleton_med") || bro.getSkills().hasSkill("perk.legend_spawn_skeleton_high"))
				{
					skeletonLoot = true;
				}
			}

			local loot = [];
			local size = this.Tactical.getMapSize();

			for( local x = 0; x < size.X; x = x )
			{
				for( local y = 0; y < size.Y; y = y )
				{
					local tile = this.Tactical.getTileSquare(x, y);

					if (tile.IsContainingItems)
					{
						foreach( item in tile.Items )
						{
							if (isArena && item.getLastEquippedByFaction() != 1)
							{
								continue;
							}

							item.onCombatFinished();
							loot.push(item);
						}
					}

					if (zombieLoot && tile.Properties.has("Corpse"))
					{
						if (tile.Properties.get("Corpse").isHuman == 1 || tile.Properties.get("Corpse").isHuman == 2)
						{
							if (this.Math.rand(1, 100) <= zombieSalvage)
							{
								local zloot = this.new("scripts/items/spawns/zombie_item");
								loot.push(zloot);
							}
						}
					}

					if (skeletonLoot && tile.Properties.has("Corpse"))
					{
						if (tile.Properties.get("Corpse").isHuman == 1 || tile.Properties.get("Corpse").isHuman == 3)
						{
							if (this.Math.rand(1, 100) <= zombieSalvage)
							{
								local zloot = this.new("scripts/items/spawns/skeleton_item");
								loot.push(zloot);
							}
						}
					}

					if (this.Math.rand(1, 100) <= 8 && tile.Properties.has("Corpse") && tile.Properties.get("Corpse").isHuman == 1)
					{
						if (CannibalisticButchersInRoster >= 1)
						{
							local humanmeat = this.new("scripts/items/supplies/vazl_yummy_sausages");
							humanmeat.randomizeAmount();
							humanmeat.randomizeBestBefore();
							loot.push(humanmeat);
						}
						else if (CannibalisticButchersInRoster < 1 && CannibalsInRoster >= 1)
						{
							local humanmeat = this.new("scripts/items/supplies/vazl_human_parts");
							humanmeat.randomizeAmount();
							humanmeat.randomizeBestBefore();
							loot.push(humanmeat);
						}
					}

					if (tile.Properties.has("Corpse") && tile.Properties.get("Corpse").Items != null && !tile.Properties.has("IsSummoned"))
					{
						local items = tile.Properties.get("Corpse").Items.getAllItems();

						foreach( item in items )
						{
							if (isArena && item.getLastEquippedByFaction() != 1)
							{
								continue;
							}

							item.onCombatFinished();

							if (!item.isChangeableInBattle(null) && item.isDroppedAsLoot())
							{
								if (item.getCondition() > 1 && item.getConditionMax() > 1 && item.getCondition() > item.getConditionMax() * 0.66 && this.Math.rand(1, 100) <= 66)
								{
									local c = this.Math.minf(item.getCondition(), this.Math.rand(this.Math.maxf(10, item.getConditionMax() * 0.35), item.getConditionMax()));
									item.setCondition(c);
								}

								item.removeFromContainer();

								foreach( i in item.getLootLayers() )
								{
									loot.push(i);
								}
							}
						}
					}

					y = ++y;
				}

				x = ++x;
			}

			if (!isArena && this.m.StrategicProperties != null)
			{
				local player = this.World.State.getPlayer();

				if(this.World.Assets.m.EL_DropParty != null) {
					if(this.World.Statistics.getFlags().get("LastCombatResult") == 1) {
						this.World.Assets.m.EL_DropParty.onDropLootForPlayer(loot);
					}
				}

				foreach( party in this.m.StrategicProperties.Parties )
				{
					this.logInfo("win ? " + (this.World.Statistics.getFlags().get("LastCombatResult") == 1));
					//this.logInfo("tactical_state gatherLoot() party.isDroppingLoot() " + party.isDroppingLoot());
					//this.logInfo("tactical_state gatherLoot() party.isAlliedWithPlayer() " + party.isAlliedWithPlayer());
					if(this.World.Statistics.getFlags().get("LastCombatResult") == 1 && party.isAlive() && !party.isAlliedWithPlayer()) {
						//this.logInfo("tactical_state gatherLoot() party.getTroops().len() " + party.getTroops().len());
						//this.logInfo("tactical_state gatherLoot() party.isAlive() " + party.isAlive());
						this.logInfo("Remove all troops!" + party.isAlive());
						party.EL_emptyTroops();

					}
					if (party.getTroops().len() == 0 && party.isAlive() && !party.isAlliedWithPlayer() && party.isDroppingLoot() && (this.World.Statistics.getFlags().get("EL_IfPlayerPartyKilled") == true || this.m.IsDeveloperModeEnabled))
					{
						party.onDropLootForPlayer(loot);
					}
				}

				foreach( item in this.m.StrategicProperties.Loot )
				{
					loot.push(this.new(item));
				}
			}

			if (!isArena && !this.isScenarioMode())
			{
				if (this.Tactical.Entities.getAmmoSpent() > 0 && this.World.Assets.m.IsRecoveringAmmo)
				{
					local amount = this.Math.max(1, this.Tactical.Entities.getAmmoSpent() * 0.2);
					amount = this.Math.rand(amount / 2, amount);

					if (amount > 0)
					{
						local ammo = this.new("scripts/items/supplies/ammo_item");
						ammo.setAmount(amount);
						loot.push(ammo);
					}
				}

				if (this.Tactical.Entities.getArmorParts() > 0 && this.World.Assets.m.IsRecoveringArmor)
				{
					local amount = this.Math.min(60 * 0.01 * this.World.Assets.m.EL_WorldLevel, this.Math.max(1, this.Tactical.Entities.getArmorParts() * this.Const.World.Assets.ArmorPartsPerArmor * 0.15));
					amount = this.Math.rand(amount / 2, amount);

					if (amount > 0)
					{
						local parts = this.new("scripts/items/supplies/armor_parts_item");
						parts.setAmount(amount);
						loot.push(parts);
					}

					amount = this.Tactical.Entities.EL_getEquipmentEssenceNum();
					for(local i = 0; i <= this.Const.EL_Item.Type.Legendary; ++i)
					{
						if(amount[i] > 0)
						{
                			local essence = this.new("scripts/items/el_supplies/el_equipment_essence_rank_" + i + "_item");
                			essence.EL_setAmount(amount[i]);
							loot.push(essence);
						}
					}
				}
			}

			loot.extend(this.m.CombatResultLoot.getItems());
			this.m.CombatResultLoot.assign(loot);
			this.m.CombatResultLoot.sort();

			this.World.Statistics.getFlags().set("EL_IfPlayerPartyKilled", false);
			this.World.Assets.m.EL_DropParty = null;
		};
	});











});