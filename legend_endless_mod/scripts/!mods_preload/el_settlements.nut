local gt = getroottable();

::mods_registerMod("el_settlements", 1, "el_settlements");
::mods_queue(null, "el_world", function ()
{
    ::mods_hookExactClass("entity/world/settlement", function(o) {
        local onEnter = o.onEnter;
        o.onEnter = function()
        {
            foreach( item in this.World.Assets.getStash().getItems() )
            {
                if (item == null)
                {
                    continue;
                }

                if (item.isBought())
                {
                    if (item.isItemType(this.Const.Items.ItemType.TradeGood))
                    {
                        this.World.Statistics.getFlags().increment("TradeGoodsBought");

                        if (::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
                        {
                            this.setResources(this.getResources() + item.getResourceValue());
                        }
                    }
                }

                item.setBought(false);
            }

            foreach( bro in this.World.getPlayerRoster().getAll() )
            {
                foreach( item in bro.getItems().getAllItems() )
                {
                    item.setBought(false);
                }
            }

            return onEnter();
        }

		o.updateRoster = function( _force = false )
		{
			local daysPassed = (this.Time.getVirtualTimeF() - this.m.LastRosterUpdate) / this.World.getTime().SecondsPerDay;

			if (!_force && this.m.LastRosterUpdate != 0 && daysPassed < 2)
			{
				return;
			}

			if (this.m.RosterSeed != 0)
			{
				this.Math.seedRandom(this.m.RosterSeed);
			}

			this.m.RosterSeed = this.Math.floor(this.Time.getRealTime() + this.Math.rand());
			this.m.LastRosterUpdate = this.Time.getVirtualTimeF();
			local roster = this.World.getRoster(this.getID());
			local allbros = roster.getAll();
			local current = [];

			for( local i = 0; i < allbros.len(); ++i )
			{
				if (allbros[i].isStabled())
				{
					continue;
				}
				else
				{
					current.push(allbros[i]);
				}
			}

			local iterations = this.Math.max(1, daysPassed / 2);
			local activeLocations = 0;

			foreach( loc in this.m.AttachedLocations )
			{
				if (loc.isActive())
				{
					activeLocations = ++activeLocations;
					activeLocations = activeLocations;
					activeLocations = activeLocations;
				}
			}

			local minRosterSizes = [
				0,
				3,
				6,
				9
			];
			local rosterMin = minRosterSizes[this.m.Size] + (this.isSouthern() ? 2 : 0);
			local rosterMax = minRosterSizes[this.m.Size] + activeLocations + (this.isSouthern() ? 1 : 0);

			if (this.World.FactionManager.getFaction(this.m.Factions[0]).getPlayerRelation() < 50)
			{
				rosterMin = rosterMin * (this.World.FactionManager.getFaction(this.m.Factions[0]).getPlayerRelation() / 50.0);
				rosterMax = rosterMax * (this.World.FactionManager.getFaction(this.m.Factions[0]).getPlayerRelation() / 50.0);
			}
			local follower_bonus = this.World.Retinue.hasFollower("follower.minstrel") ? 5 : 0;
			rosterMin = rosterMin * this.m.Modifiers.RecruitsMult;
			rosterMax = rosterMax * this.m.Modifiers.RecruitsMult;
			rosterMin = rosterMin + follower_bonus;
			rosterMax = rosterMax + follower_bonus;
			rosterMin = this.Math.round(rosterMin * this.World.Assets.EL_getHalfWorldDifficultFactor());
			rosterMax = this.Math.round(rosterMax * this.World.Assets.EL_getHalfWorldDifficultFactor());
			if (iterations < 7)
			{
				for( local i = 0; i < iterations; i = i )
				{
					for( local maxRecruits = this.Math.rand(this.Math.max(0, rosterMax / 2 - 1), rosterMax - 1); current.len() > maxRecruits;  )
					{
						local n = this.Math.rand(0, current.len() - 1);
						roster.remove(current[n]);
						current.remove(n);
					}

					i = ++i;
					i = i;
				}
			}
			else
			{
				for( local i = 0; i < current.len(); i = i )
				{
					roster.remove(current[i]);
					i = ++i;
					i = i;
				}

				current = [];
			}

			local maxRecruits = this.Math.rand(rosterMin, rosterMax);
			local draftList;
			draftList = this.getDraftList();

			foreach( loc in this.m.AttachedLocations )
			{
				loc.onUpdateDraftList(draftList);
			}

			foreach( b in this.m.Buildings )
			{
				if (b != null)
				{
					b.onUpdateDraftList(draftList);
				}
			}

			foreach( s in this.m.Situations )
			{
				s.onUpdateDraftList(draftList);
			}

			this.World.Assets.getOrigin().onUpdateDraftList(draftList);

			while (maxRecruits > current.len())
			{
				local bro = roster.create("scripts/entity/tactical/player");
				bro.setStartValuesEx(draftList);
				current.push(bro);
			}

			this.updateStables(_force);
			this.World.Assets.getOrigin().onUpdateHiringRoster(roster);
		}

    });

    ::mods_hookNewObject("entity/world/settlements/buildings/arena_building", function(o)
    {
        o.refreshCooldown = function()
        {
            this.m.CooldownUntil = 0;
        }
    });

    ::mods_hookNewObject("entity/world/settlements/buildings/port_building", function(o)
    {
		o.getCostTo = function( _to )
		{
			local myTile = this.getSettlement().getTile();
			local dist = _to.getTile().getDistanceTo(myTile);
			local cost = dist * this.World.getPlayerRoster().getSize() * (1 + 0.08 * this.World.Assets.m.EL_WorldLevel);
			cost = this.Math.round(cost);
			return cost;
		}
    });

	::mods_hookExactClass("ui/screens/world/modules/camp_screen/camp_painter_dialog_module", function(o) {
		o.queryRosterInformation = function()
		{
			local brothers = this.World.getPlayerRoster().getAll();
			local roster = [];

			foreach( b in brothers )
			{
				local background = b.getBackground();
				local bodyarmorbase = b.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
				local bodyarmor;
				local bodyarmorfinal = {};

				if (bodyarmorbase != null && !::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() && bodyarmorbase.EL_getArmorType() != this.Const.EL_Item.ArmorType.UnlayeredArmor)
				{
					bodyarmor = {
						Cloth = bodyarmorbase,
						Chain = bodyarmorbase.getUpgrade(this.Const.Items.ArmorUpgrades.Chain),
						Plate = bodyarmorbase.getUpgrade(this.Const.Items.ArmorUpgrades.Plate),
						Tabard = bodyarmorbase.getUpgrade(this.Const.Items.ArmorUpgrades.Tabbard),
						Cloak = bodyarmorbase.getUpgrade(this.Const.Items.ArmorUpgrades.Cloak)
					};

					foreach( key, value in bodyarmor )
					{
						if (value != null)
						{
							bodyarmorfinal[key] <- {
								Link = this.IO.scriptFilenameByHash(value.ClassNameHash),
								ID = value.m.ID,
								Value = this.Math.max(50, value.m.Value * 0.025),
								Variant = value.m.Variants.find(value.m.Variant) != null ? value.m.Variants.find(value.m.Variant) + 1 : 1,
								Variants = this.Math.max(value.m.Variants.len(), 1),
								Icon = value.m.Icon,
								IconLarge = value == bodyarmorbase ? value.m.IconLarge : value.m.OverlayIconLarge
							};
						}
						else
						{
							bodyarmorfinal[key] <- null;
						}
					}
				}
				else
				{
					bodyarmorfinal = {
						Cloth = null,
						Chain = null,
						Plate = null,
						Tabard = null,
						Cloak = null
					};
				}

				local helmetbase = b.getItems().getItemAtSlot(this.Const.ItemSlot.Head);

				if (helmetbase != null && helmetbase.getID() == "armor.head.fangshire")
				{
					helmetbase = null;
				}

				local helmet;
				local helmetfinal = {};

				if (helmetbase != null && !::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue())
				{
					helmet = {
						Hood = helmetbase,
						Helm = helmetbase.getUpgrade(this.Const.Items.HelmetUpgrades.Helm),
						Top = helmetbase.getUpgrade(this.Const.Items.HelmetUpgrades.Top),
						Vanity = helmetbase.getUpgrade(this.Const.Items.HelmetUpgrades.Vanity),
						ExtraVanity = helmetbase.getUpgrade(this.Const.Items.HelmetUpgrades.ExtraVanity)
					};

					foreach( key, value in helmet )
					{
						if (value != null)
						{
							helmetfinal[key] <- {
								Link = this.IO.scriptFilenameByHash(value.ClassNameHash),
								ID = value.m.ID,
								Value = this.Math.max(50, value.m.Value * 0.025),
								Variant = value.m.Variants.find(value.m.Variant) != null ? value.m.Variants.find(value.m.Variant) + 1 : 1,
								Variants = this.Math.max(value.m.Variants.len(), 1),
								Icon = value.m.Icon,
								IconLarge = value.m.IconLarge
							};
						}
						else
						{
							helmetfinal[key] <- null;
						}
					}
				}
				else
				{
					helmetfinal = {
						Hood = null,
						Helm = null,
						Top = null,
						Vanity = null,
						ExtraVanity = null
					};
				}

				local shield = {};

				if (b.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
				{
					local shielditem = b.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
					shield.Shield <- {
						Link = this.IO.scriptFilenameByHash(shielditem.ClassNameHash),
						ID = shielditem.m.ID,
						Value = this.Math.max(50, shielditem.m.Value * 0.025),
						Variant = shielditem.m.Variants.find(shielditem.m.Variant) != null ? shielditem.m.Variants.find(shielditem.m.Variant) + 1 : 1,
						Variants = this.Math.max(shielditem.m.Variants.len(), 1),
						Icon = shielditem.m.IconLarge,
						IconLarge = shielditem.m.IconLarge
					};

					if (shielditem.m.ID == "shield.faction_kite_shield" || shielditem.m.ID == "shield.faction_heater_shield")
					{
						shield.Shield.Variants = 20;
						shield.Shield.Variant = shielditem.m.Faction * 2 - (2 - shielditem.m.Variant);
					}
				}
				else
				{
					shield.Shield <- null;
				}

				local e = {
					ID = b.getID(),
					Name = b.getName(),
					ImagePath = b.getImagePath(),
					ImageOffsetX = b.getImageOffsetX(),
					ImageOffsetY = b.getImageOffsetY(),
					BackgroundImagePath = background.getIconColored(),
					BackgroundText = background.getDescription(),
					BodyArmor = bodyarmorfinal,
					Helmet = helmetfinal,
					Shield = shield
				};
				roster.push(e);
			}

			return {
				Title = "Painting Tent",
				SubTitle = "Customize the appearance of your armor",
				Roster = roster,
				Assets = this.m.Parent.queryAssetsInformation()
			};
		}
	});

	::mods_hookExactClass("ui/screens/world/modules/world_town_screen/town_temple_dialog_module", function(o) {

		o.queryRosterInformation = function()
		{
			local brothers = this.World.getPlayerRoster().getAll();
			local roster = [];

			foreach( b in brothers )
			{
				local injuries = [];

				local allInjuries = b.getSkills().query(this.Const.SkillType.TemporaryInjury);
				for( local i = 0; i != allInjuries.len(); i = i )
				{
					local inj = allInjuries[i];

					if (inj.isTreatable())
					{
						injuries.push({
							id = inj.getID(),
							icon = inj.getIconColored(),
							name = inj.getNameOnly(),
							price = this.Math.floor(inj.getPrice() * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * b.getLevel())),
						});
					}

					i = ++i;
				}

				local allInjuries = b.getSkills().query(this.Const.SkillType.SemiInjury);
				for( local i = 0; i != allInjuries.len(); i = i )
				{
					local inj = allInjuries[i];

					if (inj.isTreatable() || !inj.isTreatable())
					{
						injuries.push({
							id = inj.getID(),
							icon = inj.getIconColored(),
							name = inj.getNameOnly(),
							price = this.Math.floor(inj.getPrice() * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * b.getLevel())),
						});
					}

					i = ++i;
				}

				local allInjuries = b.getSkills().query(this.Const.SkillType.PermanentInjury);
				for( local i = 0; i != allInjuries.len(); i = i )
				{
					local inj = allInjuries[i];
					if (inj.getID() == "injury.legend_scarred_injury" || inj.getID() == "injury.missing_finger" || inj.getID() == "injury.missing_nose" || inj.getID() == "injury.missing_ear" )
					{
						injuries.push({
							id = inj.getID(),
							icon = inj.getIconColored(),
							name = inj.getNameOnly(),
							price = this.Math.floor(500 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * b.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult),
						});
					}
					else if ( inj.getID() == "injury.weakened_heart" || inj.getID() == "injury.traumatized" || inj.getID() == "injury.missing_hand" || inj.getID() == "injury.missing_eye" || inj.getID() == "injury.maimed_foot" || inj.getID() == "injury.collapsed_lung_part" || inj.getID() == "injury.broken_knee" || inj.getID() == "injury.broken_elbow_joint" || inj.getID() == "injury.brain_damage" )
					{
						injuries.push({
							id = inj.getID(),
							icon = inj.getIconColored(),
							name = inj.getNameOnly(),
							price = this.Math.floor(1000 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * b.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult),
						});
					}
					else if( inj.getID() == "el_effect.become_undead" )
					{
						injuries.push({
							id = inj.getID(),
							icon = inj.getIconColored(),
							name = inj.getNameOnly(),
							price = this.Math.floor(this.Math.pow(inj.m.EL_ConversionProgress, 2) / 10 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * b.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult),
						});
					}

					i = ++i;
				}

				if (injuries.len() == 0) { continue; }

				local background = b.getBackground();
				local e = {
					ID = b.getID(),
					Name = b.getName(),
					ImagePath = b.getImagePath(),
					ImageOffsetX = b.getImageOffsetX(),
					ImageOffsetY = b.getImageOffsetY(),
					BackgroundImagePath = background.getIconColored(),
					BackgroundText = background.getDescription(),
					Injuries = injuries
				};
				roster.push(e);
			}

			return {
				Title = "Temple",
				SubTitle = "Remove Injuries", //Have your wounded treated and prayed for by priests
				Roster = roster,
				Assets = this.m.Parent.queryAssetsInformation()
			};
		}


	// Treat //
		o.onTreatInjury = function( _data )
		{
			local entityID = _data[0];
			local injuryID = _data[1];
			local entity = this.Tactical.getEntityByID(entityID);
			local injury = entity.getSkills().getSkillByID(injuryID);

	//		injury.setTreated(true);
	//		this.World.Assets.addMoney(-injury.getPrice());

			if (_data[1] == "injury.legend_scarred_injury" || _data[1] == "injury.missing_finger" || _data[1] == "injury.missing_nose" || _data[1] == "injury.missing_ear" )
			{ this.World.Assets.addMoney(-this.Math.floor(500 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * entity.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult)); }
			else if ( _data[1] == "injury.weakened_heart" || _data[1] == "injury.traumatized" || _data[1] == "injury.missing_hand" || _data[1] == "injury.missing_eye" || _data[1] == "injury.maimed_foot" || _data[1] == "injury.collapsed_lung_part" || _data[1] == "injury.broken_knee" || _data[1] == "injury.broken_elbow_joint" || _data[1] == "injury.brain_damage" )
			{ this.World.Assets.addMoney(-this.Math.floor(1000 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * entity.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult)); }
			else
			{ this.World.Assets.addMoney(-this.Math.floor(injury.getPrice() * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * entity.getLevel()))) }
	//removeSelf
			injury.removeSelf();
			entity.improveMood(0.15, "Removed an injury");
	//
			entity.updateInjuryVisuals();
			local injuries = [];

			local allInjuries = entity.getSkills().query(this.Const.SkillType.TemporaryInjury);
			foreach( inj in allInjuries )
			{
	//			if (!inj.isTreated())
				if (inj.isTreatable())
				{
					injuries.push({
						id = inj.getID(),
						icon = inj.getIconColored(),
						name = inj.getNameOnly(),
						price = inj.getPrice()
					});
				}
			}

	//add SemiInjury
			local allInjuries = entity.getSkills().query(this.Const.SkillType.SemiInjury);
			foreach( inj in allInjuries )
			{
				if (inj.isTreatable() || !inj.isTreatable())
				{
					injuries.push({
						id = inj.getID(),
						icon = inj.getIconColored(),
						name = inj.getNameOnly(),
						price = inj.getPrice()
					});
				}
			}

	//add PermanentInjury
			local allInjuries = entity.getSkills().query(this.Const.SkillType.PermanentInjury);
			foreach( inj in allInjuries )
			{
				if ( inj.getID() == "injury.missing_finger" || inj.getID() == "injury.missing_nose" || inj.getID() == "injury.missing_ear" )
				{
					injuries.push({
						id = inj.getID(),
						icon = inj.getIconColored(),
						name = inj.getNameOnly(),
						price = this.Math.floor(500 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * entity.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult),
					});
				}
				else if ( inj.getID() == "injury.weakened_heart" || inj.getID() == "injury.traumatized" || inj.getID() == "injury.missing_hand" || inj.getID() == "injury.missing_eye" || inj.getID() == "injury.maimed_foot" || inj.getID() == "injury.collapsed_lung_part" || inj.getID() == "injury.broken_knee" || inj.getID() == "injury.broken_elbow_joint" || inj.getID() == "injury.brain_damage" )
				{
					injuries.push({
						id = inj.getID(),
						icon = inj.getIconColored(),
						name = inj.getNameOnly(),
						price = -this.Math.floor(1000 * (1 + this.Const.EL_Player.EL_HealInjury.LevelMult * entity.getLevel()) * this.Const.EL_Player.EL_HealInjury.PermanentMult),
					});
				}
			}
	//

			local background = entity.getBackground();
			local e = {
				ID = entity.getID(),
				Name = entity.getName(),
				ImagePath = entity.getImagePath(),
				ImageOffsetX = entity.getImageOffsetX(),
				ImageOffsetY = entity.getImageOffsetY(),
				BackgroundImagePath = background.getIconColored(),
				BackgroundText = background.getDescription(),
				Injuries = injuries
			};
			local r = {
				Entity = e,
				Assets = this.m.Parent.queryAssetsInformation()
			};
			this.World.Statistics.getFlags().increment("InjuriesTreatedAtTemple");
			this.updateAchievement("PatchedUp", 1, 1);
			return r;
		}
	});


});
