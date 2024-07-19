::mods_registerMod("mod_patch", 3.7, "Bigmap LG Version");
::mods_queue("mod_patch", "mod_legends(>=16.1.4),>mod_autopilot,>mod_nggh_magic_concept,<mod_world_editor_legends", function()
{
//	::mods_registerJS("ver.js");

//解决魔法起源，女巫契约，不道德交易 BUG
	::mods_hookBaseClass("scenarios/world/starting_scenario", function (o)
	{
	
		while (!("addScenarioPerk" in o))
		{
			o = o[o.SuperName];
		}
		o.addScenarioPerk <- function( _background, _perk, _row = 0, _addSkill = true )
		{
//			this.logDebug("------------------addScenarioPerk1");
			if (_background.m.CustomPerkTree == null)
			{
				return;
			}

			local isRefundable = true;

			if (_addSkill && _background.getContainer() != null)
			{
//				this.logDebug("------------------addScenarioPerk2 Script:"+this.Const.Perks.PerkDefObjects[_perk].Script);
				_background.getContainer().add(this.new(this.Const.Perks.PerkDefObjects[_perk].Script));
				isRefundable = false;
			}
//			this.logDebug("------------------addScenarioPerk3 _perk:"+_perk);
//add by bigmap
			local flag = _background.addPerk(_perk, _row, isRefundable);
			if (flag && !isRefundable)
			{
//				this.logDebug("------------------addScenarioPerk3");
				_background.getPerk(_perk).IsRefundable = false;
			}
		}
	});
	
//防止原版的盔甲配件被使用

	::mods_hookBaseClass("items/legend_armor/legend_armor", function (o)
	{
		while (!("setUpgrade" in o))
		{
			o = o[o.SuperName];
		}
		o.setUpgrade <- function( _upgrade )
		{
//			this.logDebug("------------------setUpgrade1");
//add by bigmap
		if (_upgrade == null ||  _upgrade.getType() == -1)
		{
			this.logDebug("legend_armor--------setUpgrade2----------EORR");
			return false;
		}


		if (_upgrade != null && this.m.Blocked[_upgrade.getType()])
		{
			return false;
		}
//			this.logDebug("------------------setUpgrade3");
		local oldIndex = this.World.Assets.getStash().getItemByInstanceID(_upgrade.getInstanceID());

		if (oldIndex != null)
		{
			oldIndex = oldIndex.index;
		}

		local oldItem;
//			this.logDebug("------------------setUpgrade4");
		if (this.m.Upgrades[_upgrade.getType()] != null)
		{
			oldItem = this.removeUpgrade(_upgrade.getType());
		}

		this.m.Upgrades[_upgrade.getType()] = _upgrade;
		_upgrade.setArmor(this);
		_upgrade.setVisible(true);

		if (this.m.Container != null)
		{
			_upgrade.onEquip();
			this.getContainer().getActor().getSkills().update();
		}
//			this.logDebug("------------------setUpgrade5");
		local result = {
			item = null,
			index = oldIndex
		};

		if (oldItem != null && !oldItem.isDestroyedOnRemove())
		{
			result.item = oldItem;
		}

		this.updateAppearance();
		return result;
		}
	});

	::mods_hookExactClass("entity/world/settlement", function( obj ) 
	{
		obj.getSpriteName <- function()
		{
//add by bigmap
			if (this.m.Sprite == "")
			{
				return "";
			}
			local s = this.m.Sprite;

			if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
			{
				s = "legend_" + this.m.Sprite;
			}

			if (this.isUpgrading())
			{
				s = s + "_upgrade";
			}
			return s;
		}
	});
//修正老兵、专家的游戏难度在前期比传奇还高的BUG。感谢网友Distin的反馈和战力公式的修正。兼容魔法传奇，不兼容SS
	if (::mods_getRegisteredMod("mod_nggh_magic_concept") == null)
	{
		::mods_hookNewObject("entity/world/player_party", function ( obj )
		{
			obj.updateStrength <- function()
			{
				this.m.Strength = 0.0;
				local roster = this.World.getPlayerRoster().getAll();

				if (roster.len() > this.World.Assets.getBrothersScaleMax())
				{
					roster.sort(this.onLevelCompare);
				}

				if (roster.len() < this.World.Assets.getBrothersScaleMin())
				{
					this.m.Strength += 10.0 * (this.World.Assets.getBrothersScaleMin() - roster.len());
				}

				if (this.World.Assets.getOrigin() == null)
				{
					this.m.Strength * 0.8;
					return;
				}

				local broScale = 1.0;

				if (this.World.Assets.getOrigin().getID() == "scenario.militia")
				{
					broScale = 0.66;
				}

				if (this.World.Assets.getOrigin().getID() == "scenario.lone_wolf")
				{
					broScale = 1.66;
				}

				local zombieSummonLevel = 0;
				local skeletonSummonLevel = 0;
				local count = 0;

				foreach( i, bro in roster )
				{
					if (i >= 25)
					{
						break;
					}

					if (bro.getSkills().hasSkill("perk.legend_pacifist"))
					{
						continue;
					}

					if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_high"))
					{
						zombieSummonLevel = 7;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_med"))
					{
						zombieSummonLevel = 5;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_low"))
					{
						zombieSummonLevel = 2;
					}

					if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_high"))
					{
						skeletonSummonLevel = 7;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_med"))
					{
						skeletonSummonLevel = 5;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_low"))
					{
						skeletonSummonLevel = 2;
					}

					local brolevel = bro.getLevel();

					if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
					{
						this.m.Strength += (3 + (brolevel / 4 + (brolevel - 1)) * 1.5) * broScale;
					}
					else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Normal)
					{
						this.m.Strength += (5 + ((brolevel / 2) + (brolevel - 1)) * 1.8) * broScale
//						this.m.Strength += (10 + (brolevel / 2 + (brolevel - 1)) * 2) * broScale;
					}
					else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hard)
					{
						this.m.Strength += (6 + ((brolevel / 2) + (brolevel - 1)) * 2.2) * broScale
//						this.m.Strength += (6 + count / 2 + (brolevel / 2 + this.pow(brolevel, 1.2))) * broScale;
					}
					else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Strength += (count + (brolevel + this.pow(brolevel, 1.2))) * broScale;
					}

					local mainhand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
					local offhand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
					local body = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
					local head = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
					local mainhandvalue = 0;
					local offhandvalue = 0;
					local bodyvalue = 0;
					local headvalue = 0;

					if (mainhand != null)
					{
						mainhandvalue = mainhandvalue + mainhand.getSellPrice() / 1000;
					}

					if (offhand != null)
					{
						offhandvalue = offhandvalue + offhand.getSellPrice() / 1000;
					}

					if (body != null)
					{
						bodyvalue = bodyvalue + body.getSellPrice() / 1000;
					}

					if (head != null)
					{
						headvalue = headvalue + head.getSellPrice() / 1000;
					}

					local gearvalue = mainhandvalue + offhandvalue + bodyvalue + headvalue;
					this.m.Strength += gearvalue;
					count++;
				}

				if (zombieSummonLevel == 0 && skeletonSummonLevel == 0)
				{
					return;
				}

				local stash = this.World.Assets.getStash().getItems();
				local zCount = 0;
				local sCount = 0;

				foreach( item in stash )
				{
					if (item == null)
					{
						continue;
					}

					switch(item.getID())
					{
					case "spawns.zombie":
						if (zombieSummonLevel == 0)
						{
							continue;
						}

						zCount = ++zCount;
						break;

					case "spawns.skeleton":
						if (skeletonSummonLevel == 0)
						{
							continue;
						}

						sCount = ++sCount;
						break;
					}
				}

				if (zCount > 1)
				{
					zCount = this.Math.floor(zCount / 2.0);

					for( local i = 0; i < zCount; i = i )
					{
						this.m.Strength += 3 + (zombieSummonLevel / 2 + (zombieSummonLevel - 1)) * 2.0;
						i = ++i;
					}
				}

				if (sCount > 1)
				{
					sCount = this.Math.floor(sCount / 2.0);

					for( local i = 0; i < sCount; i = i )
					{
						this.m.Strength += 3 + (skeletonSummonLevel / 2 + (skeletonSummonLevel - 1)) * 2.0;
						i = ++i;
					}
				}
			}
		});
	}
	else
	{
		::mods_hookNewObject("entity/world/player_party", function ( obj )
		{
			obj.updateStrength <- function()
			{
				this.m.Strength = 0.0;
				local roster = this.World.getPlayerRoster().getAll();

				if (roster.len() > this.World.Assets.getBrothersScaleMax())
				{
					roster.sort(this.onLevelCompare);
				}
				if (roster.len() < this.World.Assets.getBrothersScaleMin())
				{
					this.m.Strength += 10.0 * (this.World.Assets.getBrothersScaleMin() - roster.len());
				}


				if (this.World.Assets.getOrigin() == null)
				{
					this.m.Strength * 0.8;
					return;
				}

				local broScale = 1.0;

				if (this.World.Assets.getOrigin().getID() == "scenario.militia")
				{
					broScale = 0.66;
				}

				if (this.World.Assets.getOrigin().getID() == "scenario.lone_wolf")
				{
					broScale = 1.66;
				}
				local zombieSummonLevel = 0;
				local skeletonSummonLevel = 0;
				local count = 0;

				foreach( i, bro in roster )
				{
					if (i >= 25)
					{
						break;
					}
				
					if (bro.getSkills().hasSkill("perk.legend_pacifist"))
					{
						continue;
					}

					if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_high"))
					{
						zombieSummonLevel = 7;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_med"))
					{
						zombieSummonLevel = 5;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_zombie_low"))
					{
						zombieSummonLevel = 2;
					}

					if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_high"))
					{
						skeletonSummonLevel = 7;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_med"))
					{
						skeletonSummonLevel = 5;
					}
					else if (bro.getSkills().hasSkill("perk.legend_spawn_skeleton_low"))
					{
						skeletonSummonLevel = 2;
					}
				
					local hexeOriginMult = 1.0;

					if (bro.getSkills().hasSkill("actives.mc_earthen_puppet"))
					{
						hexeOriginMult *= 2.0;
					}
				
					if (bro.getFlags().has("bewitched"))
					{
						if ("getStrength" in bro)
						{
							hexeOriginMult = bro.getStrength();
						}
						else 
						{
							hexeOriginMult = 1.0;    
						}
					}

					if ("isMounted" in bro)
					{
						hexeOriginMult *= bro.isMounted() ? 1.25 : 1.0;
					}
				
					hexeOriginMult *= bro.getSkills().hasSkill("racial.champion") ? 1.33 : 1.0;
					local brolevel = bro.getLevel();

					if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Easy)
					{
						this.m.Strength += (3 + ((brolevel / 4) + (brolevel - 1)) * 1.5) * broScale * hexeOriginMult;
					}
					else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Normal)
					{
						this.m.Strength += (5 + ((brolevel / 2) + (brolevel - 1)) * 1.8) * broScale * hexeOriginMult;
//						this.m.Strength += (10 + ((brolevel / 2) + (brolevel - 1)) * 2) * broScale * hexeOriginMult;
					}
					else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Hard)
					{
						this.m.Strength += (6 + ((brolevel / 2) + (brolevel - 1)) * 2.2) * broScale * hexeOriginMult;
//						this.m.Strength += (6 + (count / 2) + ((brolevel / 2) + (pow(brolevel,1.2)))) * broScale * hexeOriginMult;
					}
					else if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
					{
						this.m.Strength += (count + (brolevel + (pow(brolevel,1.2)))) * broScale * hexeOriginMult;
					}
					if (1)
//					if (::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue())
					{
						local mult = 1.0;
						local mainhand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
						local offhand = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
						local body = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
						local head = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
						local mainhandvalue = 0;
						local offhandvalue = 0;
						local bodyvalue = 0;
						local headvalue = 0;

						if (bro.getSkills().hasSkill("special.cosmetic"))
						{
							mult = 0.0;
						}

						if (mainhand != null)
						{
							mainhandvalue = mainhandvalue + mainhand.getSellPrice() / 1000;
						}

						if (offhand != null)
						{
							offhandvalue = offhandvalue + offhand.getSellPrice() / 1000;
						}

						if (body != null)
						{
							bodyvalue = (bodyvalue + body.getSellPrice() / 1000) * mult;
						}

						if (head != null)
						{
							headvalue = (headvalue + head.getSellPrice() / 1000) * mult;
						}

						local gearvalue = mainhandvalue + offhandvalue + bodyvalue + headvalue;
						this.m.Strength += gearvalue;
					}
					count++;
				}

				if (zombieSummonLevel == 0 && skeletonSummonLevel == 0)
				{
					return;
				}

				local stash = this.World.Assets.getStash().getItems();
				local zCount = 0;
				local sCount = 0;

				foreach( item in stash )
				{
					if (item == null)
					{
						continue;
					}

					switch(item.getID())
					{
					case "spawns.zombie":
						if (zombieSummonLevel == 0)
						{
							continue;
						}

						zCount = ++zCount;
						break;

					case "spawns.skeleton":
						if (skeletonSummonLevel == 0)
						{
							continue;
						}

						sCount = ++sCount;
						break;
					}
				}

				if (zCount > 1)
				{
					zCount = this.Math.floor(zCount / 2.0);
	
					for( local i = 0; i < zCount; i = ++i )
					{
						this.m.Strength += 3 + (zombieSummonLevel / 2 + (zombieSummonLevel - 1)) * 2.0;
					}
				}

				if (sCount > 1)
				{
					sCount = this.Math.floor(sCount / 2.0);

					for( local i = 0; i < sCount; i = ++i )
					{
						this.m.Strength += 3 + (skeletonSummonLevel / 2 + (skeletonSummonLevel - 1)) * 2.0;
					}
				}
			}
		});
	}
//解决起源开始，添加药品、弹药、工具出错的BUG。
	::mods_hookNewObject("states/world/asset_manager", function ( obj )
	{
		obj.getMaxMedicine <- function()
		{
			local meds = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Medicine;
			meds = meds + this.m.MedicineMaxAdditional;
			if(this.World.State.getPlayer() != null && "getMedsModifier" in this.World.State.getPlayer())
				meds = meds + this.World.State.getPlayer().getMedsModifier();
			return meds;
		}
		obj.getMaxAmmo <- function()
		{
			local ammo = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].Ammo;
			ammo = ammo + this.m.AmmoMaxAdditional;
			if(this.World.State.getPlayer() != null && "getAmmoModifier" in this.World.State.getPlayer())
				ammo = ammo + this.World.State.getPlayer().getAmmoModifier();
			return ammo;
		}
		obj.getMaxArmorParts <- function()
		{
			local parts = this.Const.LegendMod.MaxResources[this.m.EconomicDifficulty].ArmorParts;
			parts = parts + this.m.ArmorPartsMaxAdditional;
			if(this.World.State.getPlayer() != null && "getArmorPartsModifier" in this.World.State.getPlayer())
				parts = parts + this.World.State.getPlayer().getArmorPartsModifier();
			return parts;
		}
	});
//解决自动战斗中，偶发的丢失AI问题。

	::mods_hookExactClass("ai/tactical/behaviors/ai_engage_melee", function ( o )
	{
		o.isEngageRecommended <- function( _entity, _tile )
		{
			for( local i = 0; i < 6; i = ++i )
			{
				if (!_tile.hasNextTile(i))
				{
				}
				else
				{
					local t = _tile.getNextTile(i);

					if (!t.IsOccupiedByActor)
					{
					}
					else
					{
						local target = t.getEntity();
						//add by bigmap
						if (target == null || target.getHitpoints() <= 0)
						{
							return false;
						}
							
						if (target.isNonCombatant() || target.isAlliedWith(_entity))
						{
						}
						else if (target.getCurrentProperties().IsStunned || !target.getCurrentProperties().IsAbleToUseWeaponSkills || target.isTurnDone() || target.getActionPoints() <= 5)
						{
						}
						else if (target.getIdealRange() >= 2)
						{
						}
						else
						{
							return false;
						}
					}
				}
			}
			return true;
		}
			
		local oldfunc = o.onExecute;
		o.onExecute <- function( _entity )
		{
			if (_entity == null || _entity.getHitpoints() <= 0)
				return false;
			return oldfunc(_entity);
		}
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_bow", function ( o )
	{

		o.onExecute <- function( _entity )
		{
			if (this.m.IsFirstExecuted)
			{
				//add by bigmap
				if (this.m.TargetTile.getEntity() !=null && this.m.TargetTile.getEntity().getHitpoints() > 0 && this.m.TargetTile.getEntity().isPlayerControlled() && _entity.isHiddenToPlayer())
				{
					_entity.setDiscovered(true);
					_entity.getTile().addVisibilityForFaction(this.Const.Faction.Player);
				}

				this.getAgent().adjustCameraToTarget(this.m.TargetTile, this.m.SelectedSkill.getDelay());
				this.m.IsFirstExecuted = false;
				return false;
			}

			if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
			{
				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + _entity.getName() + ": Using " + this.m.SelectedSkill.getName() + " against " + this.m.TargetTile.getEntity().getName() + "!");
				}

				this.m.SelectedSkill.use(this.m.TargetTile);

				if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
				{
					this.getAgent().declareAction();
					this.getAgent().declareEvaluationDelay(this.m.SelectedSkill.getDelay() + 750);
				}

				this.m.TargetTile = null;
				this.m.SelectedSkill = null;
			}

			return true;
		}
	
		o.selectBestTargetAndSkill <- function( _entity, _targets, _skills )
		{
			local bestSkills;
			local bestTarget;
			local bestScore = -9000.0;
			local bestOpponentsAdjacent = 0;
			local myTile = _entity.getTile();

			foreach( target in _targets )
			{
				if (target == null)
				{
					continue;
				}
				if (target.Actor.isNull())
				{
					continue;
				}
	//ADD BY BIGMAP 解决崩溃BUG
				if (!target.Actor.isAlive())
				{
					this.logDebug("------compileTargets isDead");
					continue;
				}
				local targetTile = target.Actor.getTile();

				if (!targetTile.IsVisibleForEntity)
				{
					continue;
				}

				local skills = [];

				foreach( s in _skills )
				{
					if (s.isInRange(targetTile) && s.onVerifyTarget(_entity.getTile(), targetTile))
					{
						skills.push({
							Skill = s,
							Score = 0.0
						});
					}
				}

				if (skills.len() == 0)
				{
					continue;
				}

				local alliesAdjacent = 0;
				local opponentsAdjacent = 0;
				local score = 0.0;

				foreach( s in skills )
				{
					local tilesAffected = s.Skill.getAffectedTiles(targetTile);

					foreach( t in tilesAffected )
					{
						if (!t.IsOccupiedByActor)
						{
							continue;
						}

						if (_entity.isAlliedWith(t.getEntity()))
						{
							if (this.getProperties().TargetPriorityHittingAlliesMult < 1.0)
							{
								s.Score -= 1.0 / 6.0 * 4.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult) * t.getEntity().getCurrentProperties().TargetAttractionMult;
							}
						}
						else
						{
							s.Score += this.queryTargetValue(_entity, t.getEntity(), s.Skill);
						}
					}
				}

				local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(myTile, targetTile, _entity.getFaction());

				foreach( tile in blockedTiles )
				{
					if (!tile.IsOccupiedByActor || tile.getEntity().isAlliedWith(_entity))
					{
						score = score * this.Const.AI.Behavior.AttackLineOfFireBlockedMult;
						break;
					}
				}

				if (myTile.getDistanceTo(targetTile) > 2)
				{
					for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
					{
						if (!targetTile.hasNextTile(i))
						{
						}
						else
						{
							local tile = targetTile.getNextTile(i);

							if (tile.IsEmpty)
							{
							}
							else if (tile.IsOccupiedByActor)
							{
								if (tile.getEntity().isAlliedWith(_entity))
								{
									if (this.getProperties().TargetPriorityHittingAlliesMult < 1.0)
									{
										score = score - 1.0 / 6.0 * 4.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult) * tile.getEntity().getCurrentProperties().TargetAttractionMult;
									}

									alliesAdjacent = ++alliesAdjacent;
								}
								else
								{
									score = score + 1.0 / 6.0 * this.queryTargetValue(_entity, tile.getEntity(), null) * this.Const.AI.Behavior.AttackRangedHitBystandersMult;
									opponentsAdjacent = ++opponentsAdjacent;
								}
							}
						}
					}
				}

				if (targetTile.getZoneOfControlCount(_entity.getFaction()) < this.Const.AI.Behavior.RangedEngageIgnoreDangerMinZones)
				{
					score = score * (1.0 + (1.0 - this.Math.minf(1.0, this.queryActorTurnsNearTarget(target.Actor, myTile, _entity).Turns)) * this.Const.AI.Behavior.AttackDangerMult);
				}

				if (score > bestScore && (this.getProperties().TargetPriorityHittingAlliesMult >= 1.0 || alliesAdjacent <= this.Const.AI.Behavior.AttackRangedMaxAlliesAdjacent))
				{
					bestTarget = target;
					bestScore = score;
					bestSkills = skills;
					bestOpponentsAdjacent = opponentsAdjacent;
				}
			}

			if (bestTarget != null)
			{
				this.m.TargetTile = bestTarget.Actor.getTile();
				local chance = 0;
				local highestScore = 0;

				for( local i = 0; i < bestSkills.len(); i = ++i )
				{
					if (bestSkills[i].Score > highestScore)
					{
						highestScore = this.Math.floor(this.Math.pow(bestSkills[i].Score * 100, this.Const.AI.Behavior.AttackRangedChancePOW));
					}
				}

				for( local i = 0; i < bestSkills.len(); i = ++i )
				{
					local score = this.Math.floor(this.Math.pow(bestSkills[i].Score * 100, this.Const.AI.Behavior.AttackRangedChancePOW));

					if (score < highestScore * this.Const.AI.Behavior.AttackRangedScoreCutoff)
					{
					}
					else
					{
						chance = chance + score;
					}
				}

				if (chance != 0)
				{
					local pick = this.Math.rand(1, chance);

					for( local i = 0; i < bestSkills.len(); i = ++i )
					{
						local score = this.Math.floor(this.Math.pow(bestSkills[i].Score * 100, this.Const.AI.Behavior.AttackRangedChancePOW));

						if (score < highestScore * this.Const.AI.Behavior.AttackRangedScoreCutoff)
						{
						}
						else
						{
							if (pick <= score)
							{
								this.m.SelectedSkill = bestSkills[i].Skill;
								return this.Math.maxf(0.1, bestSkills[i].Score + this.Math.maxf(0.0, bestScore));
							}

							pick = pick - score;
						}
					}
				}
			}
			return 0.0;
		}
	});
	
	::mods_hookExactClass("ai/tactical/behaviors/ai_engage_ranged", function ( o ) {
	o.selectBestTargetTile <- function( _entity, _maxRange, _considerLineOfFire, _visibleTileNeeded )
	{

		// Function is a generator.
		local navigator = this.Tactical.getNavigator();
		local myTile = _entity.getTile();
		local myFaction = _entity.getFaction();
		local allies = this.getAgent().getKnownAllies();
		local useCoverMult = this.Math.minf(10.0, (1.0 + this.getStrategy().getStats().EnemyRangedFiring) / (1.0 + this.getStrategy().getStats().AllyRangedFiring));
		local myTileScore = -9000;
		local origin = myTile;
		local minDistance = 9000;

		foreach( target in this.m.ValidTargets )
		{
			local d = target.Tile.getDistanceTo(origin);

			if (d < minDistance)
			{
				minDistance = d;
			}
		}

		if (_maxRange < 99 && minDistance >= _maxRange)
		{
			local x = 0;
			local y = 0;

			foreach( target in this.m.ValidTargets )
			{
				x = x + target.Tile.SquareCoords.X;
				y = y + target.Tile.SquareCoords.Y;
			}

			x = this.Math.round(myTile.SquareCoords.X * 0.75 + x / this.m.ValidTargets.len() * 0.25);
			y = this.Math.round(myTile.SquareCoords.Y * 0.75 + y / this.m.ValidTargets.len() * 0.25);

			if (!this.Tactical.isValidTile(x, y))
			{
				x = myTile.SquareCoords.X;
				y = myTile.SquareCoords.Y;
			}

			origin = this.Tactical.getTileSquare(x, y);

			if (origin.getDistanceTo(myTile) > this.Math.min(12, this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange)) / 2)
			{
				origin = myTile;
			}
			else
			{
				minDistance = 9000;

				foreach( target in this.m.ValidTargets )
				{
					local d = target.Tile.getDistanceTo(origin);

					if (d < minDistance)
					{
						minDistance = d;
					}
				}
			}
		}

		if (minDistance > this.Math.min(12, this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange)))
		{
			local settings = navigator.createSettings();
			settings.ActionPointCosts = _entity.getActionPointCosts();
			settings.FatigueCosts = _entity.getFatigueCosts();
			settings.FatigueCostFactor = 0.0;
			settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
			settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
			settings.AllowZoneOfControlPassing = false;
			settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
			settings.AlliedFactions = _entity.getAlliedFactions();
			settings.Faction = _entity.getFaction();
			this.m.ValidTargets.sort(this.onSortByDistance);

			foreach( target in this.m.ValidTargets )
			{
				if (navigator.findPath(myTile, target.Tile, settings, this.Math.min(12, this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange))))
				{
					local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());

					if (movementCosts.Tiles != 0)
					{
						this.m.TargetDist = this.Math.min(12, this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange));
						this.m.TargetTile = target.Tile;
						this.m.TargetDanger = 0;
						this.logDebug("No good tile in range, engaging in the general direction of the enemy!");
						return true;
					}
				}
			}
		}

		local size = this.Tactical.getMapSize();
		local centerTile;

		if (this.Tactical.State.getStrategicProperties() != null && this.Tactical.State.getStrategicProperties().LocationTemplate != null)
		{
			centerTile = this.Tactical.getTileSquare(size.X / 2 + this.Tactical.State.getStrategicProperties().LocationTemplate.ShiftX, size.Y / 2 + this.Tactical.State.getStrategicProperties().LocationTemplate.ShiftY);
		}
		else
		{
			centerTile = this.Tactical.getTileSquare(size.X / 2, size.Y / 2);
		}

		local time = this.Time.getExactTime();
		yield null;
		time = this.Time.getExactTime();
		local tiles = {
			AI = this,
			Actor = _entity,
			Origin = myTile,
			ValidTargets = this.m.ValidTargets,
			Range = _maxRange,
			IsAlliedWithPlayer = _entity.isAlliedWithPlayer(),
			Faction = myFaction,
			Tiles = [],
			MapSize = this.Tactical.getMapSize()
		};
		this.onQueryTargetTile(myTile, tiles);
		this.Tactical.queryTilesInRange(origin, 1, this.Math.min(12, this.Math.max(this.Const.AI.Behavior.RangedEngageMinQueryRadius, _maxRange)), true, _entity.getAlliedFactions(), this.onQueryTargetTile, tiles);

		if (this.isAllottedTimeReached(time))
		{
			yield null;
			time = this.Time.getExactTime();
		}
		tiles.Tiles.sort(this.onSortByScore);

		local handgonneBehavior = this.getAgent().getBehavior(this.Const.AI.Behavior.ID.AttackHandgonne);
		local miasmaBehavior = this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Miasma);
		local horrorBehavior = this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Horror);
		local attempts = 0;
		local candidates = [];

		foreach( t in tiles.Tiles )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}
//add by bigmap
/*
			if (this.getStrategy().isDefending() && this.getStrategy().isDefendingCamp() && !this.m.IsInDangerThisRound && this.getStrategy().getStats().EnemyRangedFiring < this.getStrategy().getStats().AllyRangedFiring)
			{
				local radius = this.Const.Tactical.Settings.CampRadius + this.Tactical.State.getStrategicProperties().LocationTemplate.AdditionalRadius;

				for( ; t.Tile.getDistanceTo(centerTile) > radius;  )
				{
				}
			}
*/
			attempts = ++attempts;

			if (attempts > this.Const.AI.Behavior.RangedEngageFilterMaxAttempts && candidates.len() != 0)
			{
				break;
			}

			local score = 0.0;
			local takingCover = false;
			local tooClose = false;

			foreach( target in this.m.ValidTargets )
			{
//add by bigmap
				if(target == null || target.Actor == null || target.Actor.isNull() || target.Actor.getHitpoints() <= 0)
				{
					continue;
				}
				
				local d = t.Tile.getDistanceTo(target.Tile);

				if (d <= 1)
				{
					tooClose = true;
					  // [608]  OP_JMP            0     26    0    0
				}
				else if (d <= target.Actor.getIdealRange() && !target.Actor.getCurrentProperties().IsStunned && target.Actor.isArmedWithMeleeWeapon())

				{
					score = score + this.Const.AI.Behavior.RangedEngageInRangeOfPolearmBonus;
				}
			}

			if (tooClose)
			{
				continue;
			}

			if (this.m.Skill != null && this.m.Skill.getID() == "actives.fire_handgonne")
			{
				local c = handgonneBehavior.selectBestTarget(t.Tile, _entity, this.m.Skill);
				score = score + c * this.Const.AI.Behavior.RangedEngageTargetScoreMult;
			}
			else if (this.m.Skill != null && this.m.Skill.getID() == "actives.miasma")
			{
				local c = miasmaBehavior.selectBestTarget(t.Tile, _entity, this.m.Skill);
				score = score + c * this.Const.AI.Behavior.RangedEngageTargetScoreMult;
			}
			else if (this.m.Skill != null && this.m.Skill.getID() == "actives.horror")
			{
				local c = horrorBehavior.selectBestTarget(t.Tile, _entity, this.m.Skill);
				score = score + c * this.Const.AI.Behavior.RangedEngageTargetScoreMult;
			}
			else
			{
				local avgLevel = 0;
				local validTargets = 0;

				foreach( target in this.m.ValidTargets )
				{
					if ((this.m.Skill != null && this.m.Skill.onVerifyTarget(t.Tile, target.Tile)) && target.Tile.getDistanceTo(t.Tile) <= _maxRange + (_considerLineOfFire ? this.Math.max(0, t.Tile.Level - target.Tile.Level) : 0) && (!_considerLineOfFire || t.Tile.hasLineOfSightTo(target.Tile, _entity.getCurrentProperties().getVision())))
					{
						avgLevel = avgLevel + target.Tile.Level;
						validTargets = ++validTargets;
						local targetScore = target.Score;
						local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(t.Tile, target.Tile, myFaction);

						if (blockedTiles.len() != 0)
						{
							targetScore = targetScore * this.Const.AI.Behavior.RangedEngageBlockedMult;
						}

						foreach( tile in blockedTiles )
						{
							if (tile.IsOccupiedByActor && tile.getEntity().isAlliedWith(_entity))
							{
								targetScore = targetScore * (this.Const.AI.Behavior.RangedEngageBlockedByAllyMult * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult));
								break;
							}
						}

						score = score + targetScore * this.Const.AI.Behavior.RangedEngageTargetScoreMult;
					}
				}

				if (validTargets > 0)
				{
					avgLevel = avgLevel / validTargets;

					if (t.Tile.Level > avgLevel)
					{
						score = score + (t.Tile.Level - avgLevel) * this.Const.AI.Behavior.RangedEngageLevelAdvantageMult;
					}
				}
			}

			if (score <= 0)
			{
				continue;
			}

			if (this.getStrategy().getStats().RangedAlliedVSEnemies <= 3.0)
			{
				local dirs = [
					0,
					0,
					0,
					0,
					0,
					0
				];
				local numRangedOpponentsInRange = 0;

				foreach( opponent in this.m.ValidTargets )
				{
					if (!opponent.IsRangedUnit || opponent.Tile.getDistanceTo(t.Tile) > 10)
					{
						continue;
					}

					numRangedOpponentsInRange = ++numRangedOpponentsInRange;
					local dir = t.Tile.getDirection8To(opponent.Tile);
					local mult = 7.0 / t.Tile.getDistanceTo(opponent.Tile);

					switch(dir)
					{
					case this.Const.Direction8.W:
						dirs[this.Const.Direction.NW] += 4 * mult;
						dirs[this.Const.Direction.SW] += 4 * mult;
						break;

					case this.Const.Direction8.E:
						dirs[this.Const.Direction.NE] += 4 * mult;
						dirs[this.Const.Direction.SE] += 4 * mult;
						break;

					default:
						local dir = t.Tile.getDirectionTo(opponent.Tile);
						local dir_left = dir - 1 >= 0 ? dir - 1 : 6 - 1;
						local dir_right = dir + 1 < 6 ? dir + 1 : 0;
						dirs[dir] += 4 * mult;
						dirs[dir_left] += 3 * mult;
						dirs[dir_right] += 3 * mult;
						break;
					}
				}

				if (numRangedOpponentsInRange != 0)
				{
					for( local i = 0; i < 6; i = ++i )
					{
						if (dirs[i] <= 1)
						{
						}
						else if (!t.Tile.hasNextTile(i))
						{
						}
						else
						{
							local tile = t.Tile.getNextTile(i);

							if (tile.IsEmpty || tile.ID == myTile.ID)
							{
							}
							else
							{
								local cover = tile.getEntity();

								if (!tile.IsOccupiedByActor && !cover.isBlockingSight() || tile.IsOccupiedByActor && cover.isAlliedWith(_entity) && !this.isRangedUnit(cover))
								{
									local protectorMult = 1.0;

									if (this.getStrategy().isDefendingCamp() && t.Tile.getDistanceTo(centerTile) == this.Const.Tactical.Settings.CampRadius + this.Tactical.State.getStrategicProperties().LocationTemplate.AdditionalRadius - 1)
									{
										protectorMult = protectorMult * 1.25;
									}

									if (tile.IsOccupiedByActor && cover.isAlliedWith(_entity) && cover.getAIAgent().getProperties().BehaviorMult[this.Const.AI.Behavior.ID.Protect] >= 1.0 && cover.getAIAgent().getBehavior(this.Const.AI.Behavior.ID.Protect) != null)
									{
										protectorMult = protectorMult * 1.25;
									}

									score = score + this.Const.AI.Behavior.RangedEngageCoverMult * (dirs[i] / (numRangedOpponentsInRange * 1.0)) * (this.getStrategy().isDefending() ? 2.0 : 1.0) * useCoverMult * protectorMult * this.getProperties().OverallDefensivenessMult;
									takingCover = true;
								}
							}
						}
					}
				}
			}

			candidates.push({
				Tile = t.Tile,
				Score = score - myTile.getDistanceTo(t.Tile) + (myTile.ID == t.Tile.ID ? 1000.0 : 0.0),
				TileScore = score,
				IsTakingCover = takingCover
			});
		}

		if (candidates.len() == 0)
		{
			return true;
		}

		tiles = [];
		candidates.sort(this.onSortByScore);
		local bestDestination;
		local bestScore = -9000;
		local bestDanger = 0;
		local bestIsNextToUs = false;
		local bestIsForNextTurn = false;
		local bestAPCost = 0;
		local bestTakingCover = false;
		attempts = 0;

		foreach( t in candidates )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			attempts = ++attempts;

			if (attempts > this.Const.AI.Behavior.RangedEngageMaxAttempts && bestDestination != null)
			{
				break;
			}

			local IsNextToUs = false;
			local IsForNextTurn = false;
			local apCost = 0;
			local finalTile = t.Tile;
			local danger = 0;

			if (!t.Tile.isSameTileAs(_entity.getTile()))
			{
				local settings = navigator.createSettings();
				settings.ActionPointCosts = _entity.getActionPointCosts();
				settings.FatigueCosts = _entity.getFatigueCosts();
				settings.FatigueCostFactor = 0.0;
				settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
				settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
				settings.AllowZoneOfControlPassing = false;
				settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty;
				settings.AlliedFactions = _entity.getAlliedFactions();
				settings.Faction = _entity.getFaction();

				if (navigator.findPath(_entity.getTile(), t.Tile, settings, 0))
				{
					local movementCosts = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
					apCost = apCost + movementCosts.ActionPointsRequired;
					finalTile = movementCosts.End;

					if (!movementCosts.IsComplete && this.hasNegativeTileEffect(finalTile, _entity))
					{
						apCost = apCost + this.Const.AI.Behavior.RangedEngageNegativeEffecAtStop;
					}

					if (!movementCosts.IsComplete && movementCosts.Tiles == 0)
					{
						IsForNextTurn = true;
					}
					else if (movementCosts.IsComplete && movementCosts.Tiles <= 2)
					{
						IsNextToUs = true;
					}
					else
					{
						IsNextToUs = false;
					}
				}
				else
				{
					continue;
				}

				local dangerAtTarget = 0.0;
				local dangerAtStop = 0.0;

				foreach( d in this.m.PotentialDanger )
				{
					if (finalTile.isSameTileAs(t.Tile))
					{
						local d = this.getDangerFromActor(d, finalTile, _entity);
						dangerAtTarget = dangerAtTarget + d;
						dangerAtStop = dangerAtStop + d;
					}
					else
					{
						dangerAtTarget = dangerAtTarget + this.getDangerFromActor(d, t.Tile, _entity);
						dangerAtStop = dangerAtStop + this.getDangerFromActor(d, finalTile, _entity);
					}
				}

				danger = this.Math.maxf(dangerAtTarget, dangerAtStop);
			}
			else
			{
				danger = this.m.CurrentDanger;
			}

			if (danger > this.m.CurrentDanger + 2 + this.getProperties().EngageDangerTolerance)
			{
				continue;
			}

			local score = 0 - apCost + t.TileScore - danger * this.Const.AI.Behavior.RangedEngageDangerMult;

			if (t.Tile.isSameTileAs(_entity.getTile()))
			{
				myTileScore = score;
			}

			if (score > bestScore || score == bestScore && danger < bestDanger)
			{
				bestDestination = t.Tile;
				bestIsNextToUs = IsNextToUs;
				bestIsForNextTurn = IsForNextTurn;
				bestAPCost = apCost;
				bestDanger = danger;
				bestTakingCover = t.IsTakingCover;
				bestScore = score;
			}
		}

		if (bestDestination != null && (bestScore <= myTileScore || bestDestination.isSameTileAs(_entity.getTile())))
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": In fact, I would prefer to remain where I am (new)");
			}

			this.m.TargetDist = 0;
			this.m.TargetTile = _entity.getTile();
			this.m.TargetDanger = this.m.CurrentDanger;
			this.m.TargetAPCost = 0;
			this.m.IsTargetNextToUs = false;
			this.m.IsTargetForNextTurn = false;
			return true;
		}
		else if (bestDestination != null)
		{
			this.m.TargetScore = bestScore;
			this.m.TargetDist = 0;
			this.m.TargetTile = bestDestination;
			this.m.TargetDanger = bestDanger;
			this.m.TargetAPCost = bestAPCost;
			this.m.IsTargetNextToUs = bestIsNextToUs;
			this.m.IsTargetForNextTurn = bestIsForNextTurn;
			this.m.IsTakingCover = bestTakingCover;
			return true;
		}

		return true;
	}
	o.compileTargets <- function( _entity, _targets, _maxRange )
	{
		// Function is a generator.
		this.m.ValidTargets = [];
		this.m.PotentialDanger = [];
		this.m.CurrentDanger = 0.0;
		local myTile = _entity.getTile();
		local time = this.Time.getExactTime();

		foreach( target in _targets )
		{
			if (target == null || target.Actor == null || target.Actor.isNull())
			{
				continue;
			}
//ADD BY BIGMAP 解决崩溃BUG
			if (!target.Actor.isAlive())
			{
				this.logDebug("------compileTargets isDead");
				continue;
			}
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}
			local targetTile = target.Actor.getTile();
//			local realDist = targetTile.getDistanceTo(myTile);
			local realDist = myTile.getDistanceTo(targetTile);

			if (realDist <= this.Const.AI.Behavior.RangedEngageMaxDangerDist && target.Actor.getMoraleState() != this.Const.MoraleState.Fleeing && !this.isRangedUnit(target.Actor) && !target.Actor.isNonCombatant() && target.Actor.getHitpoints() / target.Actor.getHitpointsMax() >= this.Const.AI.Behavior.RangedEngageMinDangerHitpointsPct && targetTile.getZoneOfControlCountOtherThan(target.Actor.getAlliedFactions()) < this.Const.AI.Behavior.RangedEngageIgnoreDangerMinZones)
			{
				this.m.PotentialDanger.push(target.Actor);
				local danger = this.getDangerFromActor(target.Actor, myTile, _entity);
				this.m.CurrentDanger += danger;
			}
			local alliesAdjacent = 0;
			local opponentsAdjacent = 0;
			local score = this.queryTargetValue(_entity, target.Actor, null);

			for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
			{
				if (!targetTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = targetTile.getNextTile(i);

					if (tile.IsEmpty)
					{
					}
					else if (tile.IsOccupiedByActor)
					{
						if (tile.getEntity().isAlliedWith(_entity))
						{
							if (this.getProperties().TargetPriorityHittingAlliesMult < 1.0)
							{
								score = score - 1.0 / 6.0 * (1.0 - this.getProperties().TargetPriorityHittingAlliesMult) * tile.getEntity().getCurrentProperties().TargetAttractionMult;
							}

							alliesAdjacent = ++alliesAdjacent;
						}
						else
						{
							score = score + 1.0 / 6.0 * this.queryTargetValue(_entity, tile.getEntity(), null) * this.Const.AI.Behavior.AttackRangedHitBystandersMult;
							opponentsAdjacent = ++opponentsAdjacent;
						}
					}
				}
			}

			if (targetTile.getZoneOfControlCount(_entity.getFaction()) < this.Const.AI.Behavior.RangedEngageIgnoreDangerMinZones)
			{
				score = score * (1.0 + (1.0 - this.Math.minf(1.0, this.queryActorTurnsNearTarget(target.Actor, myTile, _entity).Turns)) * this.Const.AI.Behavior.AttackDangerMult);
			}

			this.m.ValidTargets.push({
				Actor = target.Actor,
				Tile = targetTile,
				Distance = realDist,
				IsRangedUnit = this.isRangedUnit(target.Actor),
				Score = this.Math.maxf(0.01, score),
				OpponentsAdjacent = opponentsAdjacent,
				AlliesAdjacent = alliesAdjacent
			});
		}

		return true;
		}
	});
	
//解决大地图出现的 manageAIMercenaries 崩溃问题 兼容SS  	if (::mods_getRegisteredMod("Chirutiru_balance") != null)
	::mods_hookNewObject("entity/world/entity_manager", function(o){
	
	o.manageAIMercenaries <- function()
	{
		local garbage = [];
		foreach( i, merc in this.m.Mercenaries )
		{
			if (merc.isNull() || !merc.isAlive())
			{
				garbage.push(i);
			}
		}
		garbage.reverse();

		foreach( g in garbage )
		{
			this.m.Mercenaries.remove(g);
		}
		if (this.m.LastMercUpdateTime + 3.0 > this.Time.getVirtualTimeF())
		{
			return;
		}
		this.m.LastMercUpdateTime = this.Time.getVirtualTimeF();
//add by bigmap
		local aa = 2;
		local bb = 3;
		if (::mods_getRegisteredMod("Chirutiru_balance") != null)
		{
			aa = 3;
			bb = 4;
		}
	
		if (this.m.Mercenaries.len() < aa || this.World.FactionManager.isCivilWar() && this.m.Mercenaries.len() < bb)
		{
			local playerTile = this.World.State.getPlayer().getTile();
			local candidates = [];
			foreach( s in this.World.EntityManager.getSettlements() )
			{
				if (s.isIsolated())
				{
					continue;
				}

				if (s.getTile().getDistanceTo(playerTile) <= 10)
				{
					continue;
				}

				candidates.push(s);
			}
			local start = candidates[this.Math.rand(0, candidates.len() - 1)];
			local party = this.World.spawnEntity("scripts/entity/world/party", start.getTile().Coords);
			party.setPos(this.createVec(party.getPos().X - 50, party.getPos().Y - 50));
			party.setDescription("A free mercenary company travelling the lands and lending their swords to the highest bidder.");
			party.setFootprintType(this.Const.World.FootprintsType.Mercenaries);
			party.getFlags().set("IsMercenaries", true);

			if (start.getFactions().len() == 1)
			{
				party.setFaction(start.getOwner().getID());
			}
			else
			{
				party.setFaction(start.getFactionOfType(this.Const.FactionType.Settlement).getID());
			}
//add by bigmap
			local r;
			if (::mods_getRegisteredMod("Chirutiru_balance") == null)
			{
				r = this.Math.min(330, 150 + this.World.getTime().Days);
				this.Const.World.Common.assignTroops(party, this.Const.World.Spawn.Mercenaries, this.Math.rand(r * 0.8, r));
			}
			else
			{
				r = this.Math.min(500 + this.World.getTime().Days, 200 + 2 * this.World.getTime().Days);
				this.Const.World.Common.assignTroops(party, this.Const.World.Spawn.MercenariesHIGH, this.Math.rand(r * 0.8, r * 1.2));
			}
			party.getLoot().Money = this.Math.rand(300, 600);
			party.getLoot().ArmorParts = this.Math.rand(0, 25);
			party.getLoot().Medicine = this.Math.rand(0, 10);
			party.getLoot().Ammo = this.Math.rand(0, 50);
			for( local i = 0; i < aa; i = i )
			{
				local r = this.Math.rand(1, 13);
				local loot = [
					"supplies/bread_item",
					"supplies/mead_item",
					"supplies/dried_fruits_item",
					"supplies/beer_item",
					"loot/silver_bowl_item",
					"loot/jeweled_crown_item",
					"loot/ancient_amber_item",
					"loot/webbed_valuables_item",
					"loot/looted_valuables_item",
					"loot/white_pearls_item",
					"loot/rainbow_scale_item",
					"loot/lindwurm_hoard_item",
					"loot/silverware_item"
				];
				party.addToInventory(loot[this.Math.rand(0, loot.len() - 1)]);
				i = ++i;
			}
			party.getSprite("base").setBrush("world_base_07");
			party.getSprite("body").setBrush("figure_mercenary_0" + this.Math.rand(1, 2));

			while (true)
			{
				local name = this.Const.Strings.MercenaryCompanyNames[this.Math.rand(0, this.Const.Strings.MercenaryCompanyNames.len() - 1)];

				if (name == this.World.Assets.getName())
				{
					continue;
				}

				local abort = false;

				foreach( p in this.m.Mercenaries )
				{
					if (p.getName() == name)
					{
						abort = true;
						break;
					}
				}

				if (abort)
				{
					continue;
				}

				party.setName(name);
				break;
			}
//			for( local i = 0; i < this.Const.PlayerBanners.len(); i++)
//			{
//				this.logDebug("------manageAIMercenaries PlayerBanners.len ." + this.Const.PlayerBanners[i]);
//			}
			while (true)
			{
				local banner = this.Const.PlayerBanners[this.Math.rand(0, this.Const.PlayerBanners.len() - 1)];
//跳出元凶
				if (banner == "banner_33" || banner == "banner_32" || banner == "sg_gzzq_01")
				{
					continue;
				}
				if (banner == this.World.Assets.getBanner())
				{
					continue;
				}
				local abort = false;
				foreach( p in this.m.Mercenaries )
				{
					if (p.getBanner() == banner)
					{
						abort = true;
						break;
					}
				}
				if (abort)
				{
					continue;
				}
//				this.logDebug("------manageAIMercenaries 11.");
//				this.logDebug("------manageAIMercenaries banner: " + banner);
				party.getSprite("banner").setBrush(banner);
				break;
			}
			this.m.Mercenaries.push(this.WeakTableRef(party));
		}
		foreach( merc in this.m.Mercenaries )
		{
			merc.updatePlayerRelation();

			if (!merc.getController().hasOrders())
			{
				local candidates = [];

				foreach( s in this.m.Settlements )
				{
					if (!s.isAlive() || s.isIsolated())
					{
						continue;
					}

					if (!s.isAlliedWith(merc))
					{
						continue;
					}

					if (s.getTile().ID == merc.getTile().ID)
					{
						continue;
					}

					candidates.push(s);
				}

				if (candidates.len() == 0)
				{
					continue;
				}

				local dest = candidates[this.Math.rand(0, candidates.len() - 1)];
				local c = merc.getController();
				local wait1 = this.new("scripts/ai/world/orders/wait_order");
				wait1.setTime(this.Math.rand(10, 60) * 1.0);
				c.addOrder(wait1);
				local move = this.new("scripts/ai/world/orders/move_order");
				move.setDestination(dest.getTile());
				move.setRoadsOnly(false);
				c.addOrder(move);
				local wait2 = this.new("scripts/ai/world/orders/wait_order");
				wait2.setTime(this.Math.rand(10, 60) * 1.0);
				c.addOrder(wait2);
				local mercenary = this.new("scripts/ai/world/orders/mercenary_order");
				mercenary.setSettlement(dest);
				c.addOrder(mercenary);
			}
		}
	}
	
	});
//
	::mods_hookBaseClass("factions/faction", function( obj ) 
	{
		while (!("update" in obj))
		{
			obj = obj[obj.SuperName];
		}
		
		obj.update <- function( _ignoreDelay = false, _isNewCampaign = false )
		{
			if (!this.m.IsActive)
			{
				return;
			}

			if (this.m.Deck.len() == 0)
			{
				return;
			}

			if (!_ignoreDelay && this.m.LastActionTime + this.Const.Factions.GlobalMinDelay > this.Time.getVirtualTimeF())
			{
				return;
			}

			if (!_ignoreDelay)
			{
				this.m.LastActionTime = this.Time.getVirtualTimeF();
			}

			this.onUpdateRoster();
			this.onUpdate();

			foreach( u in this.m.Units )
			{
				if (u.getTroops().len() == 0)
				{
					u.die();
				}

				if (!_ignoreDelay && this.m.Settlements.len() != 0)
				{
					if (u.getFlags().has("IsMercenaries"))
					{
						continue;
					}

					if (u.isAlive() && !u.getController().hasOrders())
					{
			//			this.logDebug("------faction->update 11.");
						local home = this.getNearestSettlement(u.getTile());
			//			this.logDebug("------faction->update 11.");
						local move = this.new("scripts/ai/world/orders/move_order");
						//add by bigmap
						if(home == null || move == null)
						{
							continue;
						}
			//			this.logDebug("------faction->update 33.");
						move.setDestination(home.getTile());
						local despawn = this.new("scripts/ai/world/orders/despawn_order");
						u.getController().addOrder(move);
						u.getController().addOrder(despawn);
					}
				}
			}

			local score = 0;
			local actionToFire;

			for( local i = 0; i < this.m.Deck.len(); i = ++i )
			{
				this.m.Deck[i].update(_isNewCampaign);

				if (this.m.Deck[i].getScore() <= 0)
				{
				}
				else
				{
					score = score + this.m.Deck[i].getScore();
				}
			}

			if (score == 0)
			{
				return;
			}

			local pick = this.Math.rand(1, score);

			for( local i = 0; i < this.m.Deck.len(); i = ++i )
			{
				if (this.m.Deck[i].getScore() <= 0)
				{
				}
				else
				{
					if (pick <= this.m.Deck[i].getScore())
					{
						actionToFire = this.m.Deck[i];
						break;
					}

					pick = pick - this.m.Deck[i].getScore();
				}
			}

			if (actionToFire == null)
			{
				return;
			}

			actionToFire.execute(_isNewCampaign);
		}
	});
	

	::mods_hookBaseClass("entity/tactical/human", function(o) {
	if("onFactionChanged" in o) // if it's the player class...
	{
		o.onFactionChanged <- function()
		{
		this.actor.onFactionChanged();
		local flip = !this.isAlliedWithPlayer();
		if (this.hasSprite("background"))
			this.getSprite("background").setHorizontalFlipping(flip);
		if (this.hasSprite("quiver"))
			this.getSprite("quiver").setHorizontalFlipping(flip);
		if (this.hasSprite("body"))
			this.getSprite("body").setHorizontalFlipping(flip);
		if (this.hasSprite("tattoo_body"))
			this.getSprite("tattoo_body").setHorizontalFlipping(flip);
		if (this.hasSprite("injury_body"))
			this.getSprite("injury_body").setHorizontalFlipping(flip);
		if (this.hasSprite("armor"))
			this.getSprite("armor").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_layer_chain"))
			this.getSprite("armor_layer_chain").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_layer_plate"))
			this.getSprite("armor_layer_plate").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_layer_tabbard"))
			this.getSprite("armor_layer_tabbard").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_layer_cloak_front"))
			this.getSprite("armor_layer_cloak_front").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_layer_cloak"))
			this.getSprite("armor_layer_cloak").setHorizontalFlipping(flip);
		if (this.hasSprite("surcoat"))
			this.getSprite("surcoat").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_upgrade_back"))
			this.getSprite("armor_upgrade_back").setHorizontalFlipping(flip);
		if (this.hasSprite("armor_upgrade_front"))
			this.getSprite("armor_upgrade_front").setHorizontalFlipping(flip);
		if (this.hasSprite("shaft"))
			this.getSprite("shaft").setHorizontalFlipping(flip);
		if (this.hasSprite("head"))
			this.getSprite("head").setHorizontalFlipping(flip);
		if (this.hasSprite("closed_eyes"))
			this.getSprite("closed_eyes").setHorizontalFlipping(flip);
		if (this.hasSprite("eye_rings"))
			this.getSprite("eye_rings").setHorizontalFlipping(flip);
		if (this.hasSprite("tattoo_head"))
			this.getSprite("tattoo_head").setHorizontalFlipping(flip);
		if (this.hasSprite("injury"))
			this.getSprite("injury").setHorizontalFlipping(flip);
		if (this.hasSprite("beard"))
			this.getSprite("beard").setHorizontalFlipping(flip);
		if (this.hasSprite("hair"))
			this.getSprite("hair").setHorizontalFlipping(flip);
		

		foreach( a in this.Const.CharacterSprites.Helmets )
		{
			if (!this.hasSprite(a))
			{
				continue;
			}

			this.getSprite(a).setHorizontalFlipping(flip);
		}
		if (this.hasSprite("beard_top"))
			this.getSprite("beard_top").setHorizontalFlipping(flip);
		if (this.hasSprite("body_blood"))
			this.getSprite("body_blood").setHorizontalFlipping(flip);
		if (this.hasSprite("accessory"))
			this.getSprite("accessory").setHorizontalFlipping(flip);
		if (this.hasSprite("accessory_special"))
			this.getSprite("accessory_special").setHorizontalFlipping(flip);
		if (this.hasSprite("dirt"))
			this.getSprite("dirt").setHorizontalFlipping(flip);
		if (this.hasSprite("permanent_injury_1"))
			this.getSprite("permanent_injury_1").setHorizontalFlipping(flip);
		if (this.hasSprite("permanent_injury_2"))
			this.getSprite("permanent_injury_2").setHorizontalFlipping(flip);
		if (this.hasSprite("permanent_injury_3"))
			this.getSprite("permanent_injury_3").setHorizontalFlipping(flip);
		if (this.hasSprite("permanent_injury_4"))
			this.getSprite("permanent_injury_4").setHorizontalFlipping(flip);
		if (this.hasSprite("permanent_injury_scarred"))
			this.getSprite("permanent_injury_scarred").setHorizontalFlipping(flip);
		if (this.hasSprite("permanent_injury_burned"))
			this.getSprite("permanent_injury_burned").setHorizontalFlipping(flip);
		if (this.hasSprite("bandage_1"))
			this.getSprite("bandage_1").setHorizontalFlipping(flip);
		if (this.hasSprite("bandage_2"))
			this.getSprite("bandage_2").setHorizontalFlipping(flip);
		if (this.hasSprite("bandage_3"))
			this.getSprite("bandage_3").setHorizontalFlipping(flip);
		}
	}
	});
	
	::mods_hookBaseClass("ai/tactical/behavior", function ( o )
	{
		while (!("IsShieldwallAvailable" in o.m))
		{
			o = o[o.SuperName];
		}

		o.queryActorTurnsNearTarget <- function( _actor, _target, _entity )
		{
			if(_target == null || _target.getEntity == null)
			{
				this.logDebug("------queryActorTurnsNearTarget _target.Name error");
			}
			if(_actor == null || !(_actor.isAlive))
			{
				this.logDebug("------queryActorTurnsNearTarget _actor.Name error");
		//		if(_actor == null || _actor.getHitpoints() <= 0)
			}
			if(_actor == null)
			{
				this.logDebug("------_actor1 _actor.Name" + _actor.m.Name);
			}
			
			if(_actor.m == null)
			{
				this.logDebug("------_actor2 _actor.Name" + _actor.m.Name);
			}

			if(!_actor.isAlive())
			{
				this.logDebug("------_actor4 _actor.Name" + _actor.m.Name);
			}

//			if(_actor == null || !(_actor.isAlive()) || _target == null || _target.getEntity() == null)
//			{
//				this.logDebug("------behavior queryActorTurnsNearTarget _actor or _target's  is null or die. ");
//				local ret = {
//					Turns = 9000.0,
//					TurnsWithAttack = 9000.0,
//					InZonesOfControl = 1,
//					InZonesOfOccupation = 1
//				};
//				return ret;
//			}

			if(_entity == null)
			{
				this.logDebug("------queryActorTurnsNearTarget _entity is null");
			}

			local actorTile = _actor.getTile();
			local entityTile = _entity.getTile();
			local ret = {
				Turns = 9000.0,
				TurnsWithAttack = 9000.0,
				InZonesOfControl = actorTile.getZoneOfControlCountOtherThan(_actor.getAlliedFactions()),
				InZonesOfOccupation = actorTile.getZoneOfOccupationCountOtherThan(_actor.getAlliedFactions())
			};

			if (_actor.isNonCombatant())
			{
				return ret;
			}
			if(actorTile.isSameTileAs(_target) || actorTile == _target)
			{
				this.logDebug("------behavior queryActorTurnsNearTarget actorTile is same _target");
				return ret;
			}
	//卡死元凶   计算双方距离时卡死  
			local distance = actorTile.getDistanceTo(_target);

			if (distance <= 1)
			{
				ret.Turns = 0.0;
				ret.TurnsWithAttack = 0.0;
				return ret;
			}
			else if (distance >= 10)
			{
				return ret;
			}

			local navigator = this.Tactical.getNavigator();
			local settings = navigator.createSettings();
			settings.ActionPointCosts = _actor.getActionPointCosts();
			settings.ActionPointCostPerLevel = _actor.getLevelActionPointCost();
			settings.FatigueCostFactor = 0.0;
			settings.AllowZoneOfControlPassing = true;
			settings.ZoneOfControlCost = 2;
			settings.AlliedFactions = _actor.getAlliedFactions();
			settings.Faction = _actor.getFaction();
			settings.TileToConsiderEmpty = entityTile;

			if (navigator.findPath(actorTile, _target, settings, 1))
			{
				ret.Turns = navigator.getTurnsRequiredForPath(_actor, settings, _actor.getActionPointsMax(), entityTile, _entity.getFaction());
				ret.TurnsWithAttack = ret.Turns + 1.0 / this.Math.maxf(1.0, _actor.getActionPointsMax()) * 4;
				return ret;
			}
			return ret;
		}

		o.queryOpponentMagnitude <- function( _tile, _maxDistance )
		{
			local ret = {
				Opponents = 0.0,
				AverageDistanceScore = 0.0,
				AverageEngaged = 0.0
			};
			local opponentsMelee = 0;
			_maxDistance = _maxDistance * 1.0;
			local targets = this.getAgent().getKnownOpponents();
			//add by bigmap
//			this.logDebug("------queryOpponentMagnitude _tile.getEntity 1");
		
//			if(_tile.getEntity() == null )
//			{
//				this.logDebug("------queryOpponentMagnitude _tile.getEntity nul or die ");
//				return ret;
//			}

			foreach( t in targets )
			{
				//ADD BY BIGMAP
				
				if(t.Actor == null || !t.Actor.isAlive())
				{
					this.logDebug("------queryOpponentMagnitude t.Actor nul or die" );
					continue;
				}

				if (t.Actor.isNull())
				{
					continue;
				}

				if (t.Actor.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					continue;
				}
				if(t.Actor.getTile().isSameTileAs(_tile) || t.Actor.getTile() == _tile)
				{
					this.logDebug("------behavior queryOpponentMagnitude actorTile is same _tile");
					continue;
				}
				local dist = t.Actor.getTile().getDistanceTo(_tile);

				if (dist <= _maxDistance)
				{
					++ret.Opponents;
					ret.AverageDistanceScore += (dist - 1) / _maxDistance;

					if (!t.Actor.isArmedWithRangedWeapon())
					{
						if (t.Actor.getAIAgent().getOrders().IsEngaging || t.Actor.getTile().hasZoneOfControlOtherThan(t.Actor.getAlliedFactions()))
						{
							++ret.AverageEngaged;
						}

						opponentsMelee = ++opponentsMelee;
					}
				}
			}

			if (ret.Opponents != 0)
			{
				ret.AverageDistanceScore /= ret.Opponents;
				ret.AverageEngaged /= this.Math.max(1, opponentsMelee);
			}

			return ret;
		}
		
	});
//ss 
	if (::mods_getRegisteredMod("Chirutiru_balance") != null)
	{
		::mods_hookExactClass("entity/tactical/actor", function ( o )
		{
			o.onMovementInZoneOfControl <- function( _entity, _isOnEnter )
			{
//this.logDebug("------onMovementInZoneOfControl 3");
				if (!this.m.IsActingEachTurn)
				{
					return false;
				}

				if (!this.m.IsUsingZoneOfControl || !this.m.IsExertingZoneOfControl)
				{
					return false;
				}

				if (this.m.MoraleState == this.Const.MoraleState.Fleeing || this.getCurrentProperties().IsStunned)
				{
					return false;
				}

				local reachadvantage = this.m.Skills.getSkillByID("perk.crReachadvantage");
				local spearwall = false;	
				if (reachadvantage != null && reachadvantage.m.Opponents.find(_entity.getID()) != null)
				{
					spearwall = true;  //if true, attack when entering ZOC
				}		
				if (_isOnEnter && !spearwall && (!this.getCurrentProperties().IsAttackingOnZoneOfControlEnter || !this.getCurrentProperties().IsAttackingOnZoneOfControlAlways && this.getTile().getZoneOfControlCountOtherThan(this.getAlliedFactions()) > 1))
				{
					return false;
				}
				if (!_entity.getCurrentProperties().IsImmuneToZoneOfControl && !_entity.isAlliedWith(this))
				{
					local skill = this.m.Skills.getAttackOfOpportunity();

					if (skill != null)
					{
						return true;
					}
				}
				return false;
			}

			o.onAttackOfOpportunity <- function( _entity, _isOnEnter )
			{
				if (!this.m.IsActingEachTurn)
				{
					return false;
				}

				if (!this.m.IsUsingZoneOfControl || !this.m.IsExertingZoneOfControl)
				{
					return false;
				}

				if (this.m.MoraleState == this.Const.MoraleState.Fleeing || this.getCurrentProperties().IsStunned)
				{
					return false;
				}

				local reachadvantage = this.m.Skills.getSkillByID("perk.crReachadvantage");
				local spearwall = false;
				if (reachadvantage != null && reachadvantage.m.Opponents.find(_entity.getID()) != null)
				{
					spearwall = true;  //if true, attack when entering ZOC
				}			
				if (_isOnEnter && !spearwall && (!this.getCurrentProperties().IsAttackingOnZoneOfControlEnter || !this.getCurrentProperties().IsAttackingOnZoneOfControlAlways && this.getTile().getZoneOfControlCountOtherThan(this.getAlliedFactions()) > 1))
				{
					return false;
				}

				if (_entity.getTile().Properties.Effect != null && _entity.getTile().Properties.Effect.Type == "smoke")
				{
					return false;
				}

				if (!_entity.getCurrentProperties().IsImmuneToZoneOfControl && !_entity.isAlliedWith(this))
				{
					local skill = this.m.Skills.getAttackOfOpportunity();

					if (skill != null)
					{
						if (skill.useForFree(_entity.getTile()))
						{
							_entity.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
							return true;
						}
					}
				}
				return false;
			}
		});
	}
/*
	::mods_hookExactClass("skills/actives/kraken_move_skill", function ( o ) {

		o.onTeleportStart <- function( _tag )
		{
			this.logDebug("------onTeleportStart 1");
			if (!_tag.IgnoreColors)
			{
				_tag.User.storeSpriteColors();
				_tag.User.fadeTo(this.createColor("ffffff00"), 0);
			}
			if(_tag == null ||_tag.User == null || _tag.TargetTile == null || _tag.OnDone == null)
				this.logDebug("------onTeleportStart 2");
			this.Tactical.getNavigator().teleport(_tag.User, _tag.TargetTile, _tag.OnDone, _tag, false, 1000.0);
		}
	});
	
	::mods_hookExactClass("states/tactical_state", function(o){
		o.onUpdate <- function( )
		{
//				this.logDebug("------onTeleportStart 1");
			this.Tactical.TurnSequenceBar.update();
//				this.logDebug("------onTeleportStart 2");
			if (this.Tactical.Entities.isCombatFinished() && !this.m.IsBattleEnded)
			{
//								this.logDebug("------onTeleportStart 3");
				if (this.m.IsAutoRetreat && this.Tactical.getRetreatRoster().getSize() != 0)
				{
//									this.logDebug("------onTeleportStart 4");
					this.Time.clearEvents();
					this.setPause(true);
					this.flee();
				}
				else
				{
//									this.logDebug("------onTeleportStart 5");
					this.onBattleEnded();
				}
			}
//				this.logDebug("------onTeleportStart 6");
			this.updateCurrentEntity();
			this.Tactical.CameraDirector.update();
			this.Tactical.getCamera().update();
//							this.logDebug("------onTeleportStart 7");
			this.Tactical.update();
			this.updateScene();
			this.updateOrientationOverlays();
			this.updateCameraScrolling();
			this.m.Factions.update();

		}
	});
*/
//for 15.0.13
	::mods_hookExactClass("entity/world/world_entity", function ( obj )
	{
		obj.isAbleToSee <- function( _entity )
		{
	//add by bigmap for 15.0.13
	//		local e = typeof _entity == "instance" ? _entity.get() : this._entity2;
			local e = typeof _entity == "instance" ? _entity.get() : _entity;
			return e.isVisibleToEntity(this, this.getVisionRadius());
		}
	});
	
	::mods_hookNewObject("skills/skill_container", function(o)
	{
		o.add = function( _skill, _order = 0 )
		{
			if (!_skill.isStacking())
			{
				foreach( i, skill in this.m.Skills )
				{
					if (!skill.isGarbage() && skill.getID() == _skill.getID())
					{
						skill.onRefresh();
						return;
					}
				}

				foreach( i, skill in this.m.SkillsToAdd )
				{
	//add by bigmap for 15.0.13
	//				if (skill.getID() == _skill.getID())
					if (!skill.isGarbage() && skill.getID() == _skill.getID())
					{
						return;
					}
				}
			}

			_skill.setContainer(this);
			_skill.setOrder(_skill.getOrder() + _order);

			if (this.m.IsUpdating)
			{
				this.m.SkillsToAdd.push(_skill);
			}
			else
			{
				this.m.Skills.push(_skill);
				_skill.onAdded();
				_skill.m.IsNew = false;
				this.m.Skills.sort(this.compareSkillsByOrder);
				this.update();
			}
		}
	});
});