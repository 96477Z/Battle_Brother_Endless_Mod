local gt = getroottable();

::mods_registerMod("el_player_npc", 1, "el_player_npc");
::mods_queue(null, "el_world", function ()
{
	::mods_hookNewObjectOnce("factions/faction_manager", function(o) {
		local isAllied = o.isAllied;
		o.isAllied = function ( _f1, _f2 )
		{
			if (_f1 >= this.m.Factions.len() || _f2 >= this.m.Factions.len())
			{
				return false;
			}
			return isAllied(_f1, _f2);
		}
	});


	::mods_hookExactClass("entity/tactical/actor", function(o){

		o.m.EL_RankLevel <- 0;

		local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			_out.writeI32(this.m.EL_RankLevel);
			onSerialize( _out );
			//this.logInfo("this.EL_RankLevel : " + this.m.EL_RankLevel);
		}
		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			this.m.EL_RankLevel = _in.readI32();
			onDeserialize( _in );
			//this.logInfo("this.EL_RankLevel : " + this.m.EL_RankLevel);
		}

		local getFatigueMax = o.getFatigueMax;
		o.getFatigueMax = function() {
			return this.Math.max(0, getFatigueMax());
		}

		local onTurnStart = o.onTurnStart;
		o.onTurnStart = function() {
			onTurnStart();
			if (!this.isAlive())
			{
				return;
			}
			this.m.Fatigue -= this.Math.floor(this.m.CurrentProperties.Stamina / this.Const.EL_PlayerNPC.EL_ExtraFatigueRecovery.DivFactor + this.Const.EL_PlayerNPC.EL_ExtraFatigueRecovery.Offset);
			if(this.m.Fatigue < 0) {
				this.m.Fatigue = 0;
			}
			if(this.m.Fatigue > this.getFatigueMax()) {
				this.m.Fatigue = this.getFatigueMax();
			}
			return;
		}

		o.EL_getRankLevel <- function ()
		{
			return this.m.EL_RankLevel;
		}
		o.EL_setRankLevel <- function (_EL_RankLevel)
		{
			this.m.EL_RankLevel = _EL_RankLevel;
		}
		o.EL_getCombatLevel <- function ()
		{
			return this.m.CurrentProperties.EL_CombatLevel;
		}
		o.EL_setCombatLevel <- function (_EL_CombatLevel)
		{
			this.m.BaseProperties.EL_CombatLevel = _EL_CombatLevel;
		}

		o.getXPValue = function() {
			return this.Const.EL_PlayerNPC.EL_XPValue.Offset + this.EL_getCombatLevel() * this.Const.EL_PlayerNPC.EL_XPValue.Mult;
		}


        o.getXP <- function() {
            return this.m.XP;
        }

		o.getActionPointsMax = function()
		{
			return this.Math.ceil(this.m.CurrentProperties.ActionPoints * this.m.CurrentProperties.ActionPointsMult);
		}

		o.getDefense = function( _attackingEntity, _skill, _properties )
		{
			local malus = 0;
			local d = 0;

			if (!this.m.CurrentProperties.IsImmuneToSurrounding)
			{
				malus = _attackingEntity != null ? this.Math.max(0, _attackingEntity.getCurrentProperties().SurroundedBonus * _attackingEntity.getCurrentProperties().SurroundedBonusMult - this.getCurrentProperties().SurroundedDefense) * this.getSurroundedCount() : this.Math.max(0, 5 - this.getCurrentProperties().SurroundedDefense) * this.getSurroundedCount();
			}

			if (_skill.isRanged())
			{
				d = _properties.getRangedDefense();
			}
			else
			{
				d = _properties.getMeleeDefense();
			}

			if (!_skill.isRanged())
			{
				d = d - malus;
			}

			return d;
		}

		o.getTooltip = function( _targetedWithSkill = null )
		{
			if (!this.isPlacedOnMap() || !this.isAlive() || this.isDying())
			{
				return [];
			}

			if (!this.isDiscovered())
			{
				local tooltip = [
					{
						id = 1,
						type = "title",
						text = "Hidden Opponent"
					}
				];
				return tooltip;
			}

			local tooltip = [
				{
					id = 1,
					type = "title",
					text = this.getName(),
					icon = this.getLevelImagePath()
				}
			];
			if (this.isHiddenToPlayer())
			{
				tooltip.push({
					id = 3,
					type = "headerText",
					icon = "ui/tooltips/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]Not currently in sight[/color]"
				});
			}
			else
			{
				if (_targetedWithSkill != null && this.isKindOf(_targetedWithSkill, "skill"))
				{
					local tile = this.getTile();

					if (tile.IsVisibleForEntity && _targetedWithSkill.isUsableOn(tile))
					{
						local hitchance = _targetedWithSkill.getHitchance(this);
						tooltip.push({
							id = 3,
							type = "headerText",
							icon = "ui/icons/hitchance.png",
							children = _targetedWithSkill.getHitFactors(tile),
							text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + hitchance + "%[/color] chance to hit"
						});
					}
				}

				if (this.m.IsActingEachTurn)
				{
					local turnsToGo = this.Tactical.TurnSequenceBar.getTurnsUntilActive(this.getID());

					if (this.Tactical.TurnSequenceBar.getActiveEntity() == this)
					{
						tooltip.push({
							id = 4,
							type = "text",
							icon = "ui/icons/initiative.png",
							text = "Acting right now!"
						});
					}
					else if (this.m.IsTurnDone || turnsToGo == null)
					{
						tooltip.push({
							id = 4,
							type = "text",
							icon = "ui/icons/initiative.png",
							text = "Turn done"
						});
					}
					else
					{
						tooltip.push({
							id = 4,
							type = "text",
							icon = "ui/icons/initiative.png",
							text = "Acts in " + turnsToGo + (turnsToGo > 1 ? " turns" : " turn")
						});
					}
				}

				tooltip.push({
					id = 5,
					type = "progressbar",
					icon = "ui/icons/armor_head.png",
					value = this.getArmor(this.Const.BodyPart.Head),
					valueMax = this.getArmorMax(this.Const.BodyPart.Head),
					text = this.getArmor(this.Const.BodyPart.Head) + " / " + this.getArmorMax(this.Const.BodyPart.Head),
					style = "armor-head-slim"
				});
				tooltip.push({
					id = 6,
					type = "progressbar",
					icon = "ui/icons/armor_body.png",
					value = this.getArmor(this.Const.BodyPart.Body),
					valueMax = this.getArmorMax(this.Const.BodyPart.Body),
					text = this.getArmor(this.Const.BodyPart.Body) + " / " + this.getArmorMax(this.Const.BodyPart.Body),
					style = "armor-body-slim"
				});
				tooltip.push({
					id = 7,
					type = "progressbar",
					icon = "ui/icons/health.png",
					value = this.getHitpoints() >= 0 ? this.getHitpoints() : 0,
					valueMax = this.getHitpointsMax(),
					text = (this.getHitpoints() >= 0 ? this.getHitpoints() : 0) + " / " + this.getHitpointsMax(),
					style = "hitpoints-slim"
				});
				tooltip.push({
					id = 8,
					type = "progressbar",
					icon = "ui/icons/morale.png",
					value = this.getMoraleState(),
					valueMax = this.Const.MoraleState.COUNT - 1,
					text = this.Const.MoraleStateName[this.getMoraleState()],
					style = "morale-slim"
				});
				tooltip.push({
					id = 9,
					type = "progressbar",
					icon = "ui/icons/fatigue.png",
					value = this.getFatigue(),
					valueMax = this.getFatigueMax(),
					text = this.getFatigue() + " / " + this.getFatigueMax(),
					style = "fatigue-slim"
				});

				//basic info
				local melee_skill = this.getCurrentProperties().getMeleeSkill();
				local ranged_skill = this.getCurrentProperties().getRangedSkill();
				local melee_defense = this.getCurrentProperties().getMeleeDefense();
				local ranged_defense = this.getCurrentProperties().getRangedDefense();
				tooltip.push({
					id = 99,
					type = "text",
					icon = this.Const.EL_NPC.EL_Champion.Icon[this.m.EL_RankLevel],
					text = "Atk: " + melee_skill + " " + ranged_skill + " Def: " + melee_defense + " " + ranged_defense
				});

				local raicial_skills = this.getSkills().query(this.Const.SkillType.Racial, false, true);
				foreach( skill in raicial_skills )
				{
					if(skill.EL_isNPCBuff()) {
						tooltip.push({
							id = 99,
							type = "text",
							icon = skill.getIcon(),
							text = skill.getName()
						});
					}
				}

				local statusEffects = this.getSkills().query(this.Const.SkillType.StatusEffect | this.Const.SkillType.TemporaryInjury, false, true);
				foreach( i, statusEffect in statusEffects )
				{
					tooltip.push({
						id = 100 + i,
						type = "text",
						icon = statusEffect.getIcon(),
						text = statusEffect.getName()
					});
				}

				local perks = this.getSkills().query(this.Const.SkillType.Perk, false, true);
				local perk_string = "";
				for( local i = 0; i < perks.len(); ++i )
				{
					if(i != 0) {
						perk_string += ",";
					}
					perk_string += perks[i].getName();
				}
				if(perks.len() != 0) {
					tooltip.push({
						id = 200,
						type = "text",
						text = "特技："
					});
					tooltip.push({
						id = 201,
						type = "text",
						text = perk_string
					});
				}
			}

			return tooltip;
		}

		o.updateOverlay = function()
		{
			if (!this.isAlive())
			{
				return;
			}

			local headArmor = 0.0;
			local bodyArmor = 0.0;

			if (this.getArmorMax(this.Const.BodyPart.Head) > 0)
			{
				headArmor = this.getArmor(this.Const.BodyPart.Head) / this.getArmorMax(this.Const.BodyPart.Head);
			}

			if (this.getArmorMax(this.Const.BodyPart.Body) > 0)
			{
				bodyArmor = this.getArmor(this.Const.BodyPart.Body) / this.getArmorMax(this.Const.BodyPart.Body);
			}

			this.setOverlayValues(headArmor, bodyArmor, this.Math.minf(1.0, this.getHitpoints() / this.getHitpointsMax()));
			local icons = [];
			local raicial_skills = this.getSkills().query(this.Const.SkillType.Racial);
			foreach( skill in raicial_skills )
			{
				if(skill.EL_isNPCBuff()) {
					icons.push(skill.getIconMini());
				}
			}

			local status = this.getSkills().query(this.Const.SkillType.StatusEffect | this.Const.SkillType.Terrain);
			foreach( s in status )
			{
				if (s.getIconMini().len() != 0)
				{
					icons.push(s.getIconMini());
				}
			}

			this.setOverlayIcons(icons);
		}

		o.onResurrected = function( _info )
		{
			this.setFaction(_info.Faction);
			this.getItems().clear();
			_info.Items.transferTo(this.getItems());

			if (_info.Name.len() != 0) {
				local names = this.split(_info.Name, " -");
				this.m.Name = names[0];
			}

			if (_info.Description.len() != 0)
			{
				this.m.Description = _info.Description;
			}

			this.m.Hitpoints = this.getHitpointsMax() * _info.Hitpoints;
			this.m.XP = this.Math.floor(this.m.XP * _info.Hitpoints);
			this.m.BaseProperties.Armor = _info.Armor;
			this.onUpdateInjuryLayer();
		}

		local onDeath = o.onDeath;
		o.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
			onDeath(_killer, _skill, _tile, _fatalityType);
			if (_fatalityType != this.Const.FatalityType.None && _killer != null && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == _killer.getID())
			{
				if (_skill != null && _skill.isAttack() && !_skill.isRanged())
				{
					if (_killer.getSkills().hasSkill("perk.ptr_bloodbath"))
					{
						_killer.setActionPoints(this.Math.min(_killer.getActionPointsMax(), _killer.getActionPoints() - 3));
					}
				}
			}
		}

		o.checkMorale = function(_change, _difficulty, _type = this.Const.MoraleCheckType.Default, _showIconBeforeMoraleIcon = "", _noNewLine = false, _EL_noCheck = false)
		{

			if (this.isAlive() && !this.isDying())
			{
				if (_change > 0)
				{
					local acSkill = this.m.Skills.getSkillByID("perk.legend_assured_conquest");
					if (acSkill != null)
					{
						_difficulty += acSkill.getBonusResAtPositiveMoraleCheck();
					}
				}

				if (_change < 0)
				{
					local familyPride = this.m.Skills.getSkillByID("perk.ptr_family_pride");
					if (familyPride != null && this.m.MoraleState <= familyPride.getMinMoraleState())
					{
						return false;
					}
					if(this.getSkills().hasSkill("el_rarity_entry.vehemence_of_the_sky") && this.getSkills().getSkillByID("el_rarity_entry.vehemence_of_the_sky").EL_isUsable())
					{
						return false;
					}
					if (_type == this.Const.MoraleCheckType.MentalAttack)
					{
						local tsSkill = this.m.Skills.getSkillByID("perk.ptr_trauma_survivor");
						if (tsSkill != null)
						{
							_difficulty += tsSkill.getBonusRes();
						}
					}
					else
					{
						local bulwark = this.m.Skills.getSkillByID("perk.ptr_bulwark");
						if (bulwark != null)
						{
							_difficulty += bulwark.getBonus();
						}
					}
				}
			}

			if (!this.isAlive() || this.isDying())
			{
				return false;
			}

			if (this.m.MoraleState == this.Const.MoraleState.Ignore)
			{
				return false;
			}

			if (_change > 0 && this.m.MoraleState == this.Const.MoraleState.Confident)
			{
				return false;
			}

			if (_change < 0 && this.m.MoraleState == this.Const.MoraleState.Fleeing)
			{
				return false;
			}

			if (_change > 0 && this.m.MoraleState >= this.m.MaxMoraleState)
			{
				return false;
			}

			if (_change == 1 && this.m.MoraleState == this.Const.MoraleState.Fleeing)
			{
				return false;
			}

			if (this.isAlive() && !this.isDying())
			{
				if (_change < 0)
				{
					if (this.m.MoraleState <= this.Const.EL_PlayerNPC.EL_RankToMoraleMin[this.m.EL_RankLevel])
					{
						return false;
					}
				}
			}

			local myTile = this.getTile();

			if (this.isPlayerControlled() && _change > 0 && (myTile.SquareCoords.X == 0 || myTile.SquareCoords.Y == 0 || myTile.SquareCoords.X == 31 || myTile.SquareCoords.Y == 31))
			{
				return false;
			}

			_difficulty = _difficulty * this.getCurrentProperties().MoraleEffectMult;
			local bravery = (this.getBravery() + this.getCurrentProperties().MoraleCheckBravery[_type]) * this.getCurrentProperties().MoraleCheckBraveryMult[_type];

			local head_count_gap = 0;
			local threatBonus = 0;
			for( local i = 0; i != 6; i = ++i )
			{
				if (!myTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = myTile.getNextTile(i);

					if (tile.IsOccupiedByActor && tile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing)
					{
						if (tile.getEntity().isAlliedWith(this))
						{
							head_count_gap += this.Math.pow(this.Const.EL_PlayerNPC.EL_Morale.HeadCount.Factor1, tile.getEntity().m.EL_RankLevel - this.m.EL_RankLevel);
						}
						else
						{
							head_count_gap -= this.Math.pow(this.Const.EL_PlayerNPC.EL_Morale.HeadCount.Factor1, tile.getEntity().m.EL_RankLevel - this.m.EL_RankLevel);
							threatBonus = threatBonus + tile.getEntity().getCurrentProperties().Threat;
						}
					}
				}
			}
			local head_count_bouns = 0;

			if(head_count_gap < 0) {
				head_count_bouns = -this.Const.EL_PlayerNPC.EL_Morale.HeadCount.Factor3 * this.Math.pow(-head_count_gap, this.Const.EL_PlayerNPC.EL_Morale.HeadCount.Factor2);
			}

			local calculate_bravery = bravery + _difficulty + head_count_bouns - threatBonus;
			if(_EL_noCheck == true) {

			}
			else if (_change > 0)
			{
				local if_success = false;
				while(calculate_bravery > 0 && if_success == false) {
					if (this.Math.rand(1, 100) <= this.Math.minf(95, calculate_bravery)) {
						if_success = true;
					}
					if (this.Math.rand(1, 100) <= this.m.CurrentProperties.RerollMoraleChance && this.Math.rand(1, 100) <= this.Math.minf(95, calculate_bravery)) {
						if_success = true;
					}
					calculate_bravery -= 100;
				}
			}
			else if (_change < 0)
			{
				while(calculate_bravery > 0) {
					if (this.Math.rand(1, 100) <= this.Math.minf(95, calculate_bravery)) {
						return false;
					}
					if (this.Math.rand(1, 100) <= this.m.CurrentProperties.RerollMoraleChance && this.Math.rand(1, 100) <= this.Math.minf(95, calculate_bravery)) {
						return false;
					}
					calculate_bravery -= 100;
				}
			}
			else
			{
				local if_success = false;
				while(calculate_bravery > 0 && if_success == false) {
					if (this.Math.rand(1, 100) <= this.Math.minf(95, calculate_bravery)) {
						return true;
					}
					if (this.Math.rand(1, 100) <= this.m.CurrentProperties.RerollMoraleChance && this.Math.rand(1, 100) <= this.Math.minf(95, calculate_bravery)) {
						return true;
					}
					calculate_bravery -= 100;
				}
				return false;
			}

			local oldMoraleState = this.m.MoraleState;
			this.m.MoraleState = this.Math.min(this.Const.MoraleState.Confident, this.Math.max(0, this.m.MoraleState + _change));
			this.m.FleeingRounds = 0;

			if (this.m.MoraleState == this.Const.MoraleState.Confident && oldMoraleState != this.Const.MoraleState.Confident && ("State" in this.World) && this.World.State != null && this.World.Ambitions.hasActiveAmbition() && this.World.Ambitions.getActiveAmbition().getID() == "ambition.oath_of_camaraderie")
			{
				this.World.Statistics.getFlags().increment("OathtakersBrosConfident");
			}

			if (oldMoraleState == this.Const.MoraleState.Fleeing && this.m.IsActingEachTurn)
			{
				this.setZoneOfControl(this.getTile(), this.hasZoneOfControl());

				if (this.isPlayerControlled() || !this.isHiddenToPlayer())
				{
					if (_noNewLine)
					{
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + " has rallied");
					}
					else
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this) + " has rallied");
					}
				}
			}
			else if (this.m.MoraleState == this.Const.MoraleState.Fleeing)
			{
				this.setZoneOfControl(this.getTile(), this.hasZoneOfControl());
				this.m.Skills.removeByID("effects.shieldwall");
				this.m.Skills.removeByID("effects.spearwall");
				this.m.Skills.removeByID("effects.riposte");
				this.m.Skills.removeByID("effects.return_favor");
				this.m.Skills.removeByID("effects.indomitable");
			}

			local morale = this.getSprite("morale");

			if (this.Const.MoraleStateBrush[this.m.MoraleState].len() != 0)
			{
				if (this.m.MoraleState == this.Const.MoraleState.Confident)
				{
					morale.setBrush(this.m.ConfidentMoraleBrush);
				}
				else
				{
					morale.setBrush(this.Const.MoraleStateBrush[this.m.MoraleState]);
				}

				morale.Visible = true;
			}
			else
			{
				morale.Visible = false;
			}

			if (this.isPlayerControlled() || !this.isHiddenToPlayer())
			{
				if (_noNewLine)
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + this.Const.MoraleStateEvent[this.m.MoraleState]);
				}
				else
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this) + this.Const.MoraleStateEvent[this.m.MoraleState]);
				}

				if (_showIconBeforeMoraleIcon != "")
				{
					this.Tactical.spawnIconEffect(_showIconBeforeMoraleIcon, this.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
				}

				if (_change > 0)
				{
					this.Tactical.spawnIconEffect(this.Const.Morale.MoraleUpIcon, this.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
				}
				else
				{
					this.Tactical.spawnIconEffect(this.Const.Morale.MoraleDownIcon, this.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
				}
			}

			this.m.Skills.update();
			this.setDirty(true);

			if (this.m.MoraleState == this.Const.MoraleState.Fleeing && this.Tactical.TurnSequenceBar.getActiveEntity() != this)
			{
				this.Tactical.TurnSequenceBar.pushEntityBack(this.getID());
			}

			if (this.m.MoraleState == this.Const.MoraleState.Fleeing)
			{
				local actors = this.Tactical.Entities.getInstancesOfFaction(this.getFaction());

				if (actors != null)
				{
					foreach( a in actors )
					{
						if (a.getID() != this.getID())
						{
							a.onOtherActorFleeing(this);
						}
					}
				}
			}
			return true;
		}

		o.onDamageReceived = function( _attacker, _skill, _hitInfo )
		{
			if (!this.isAlive() || !this.isPlacedOnMap())
			{
				return 0;
			}

			if (_hitInfo.DamageRegular == 0 && _hitInfo.DamageArmor == 0)
			{
				return 0;
			}

			if (typeof _attacker == "instance")
			{
				_attacker = _attacker.get();
			}

			if (_attacker != null && _attacker.isAlive() && _attacker.isPlayerControlled() && !this.isPlayerControlled())
			{
				this.setDiscovered(true);
				this.getTile().addVisibilityForFaction(this.Const.Faction.Player);
				this.getTile().addVisibilityForCurrentEntity();
			}

			if (this.m.Skills.hasSkill("perk.steel_brow"))
			{
				_hitInfo.BodyDamageMult = 1.0;
			}

			local p = this.m.Skills.buildPropertiesForBeingHit(_attacker, _skill, _hitInfo);
			this.m.Items.onBeforeDamageReceived(_attacker, _skill, _hitInfo, p);
			local dmgMult = p.DamageReceivedTotalMult;

			if (_skill != null)
			{
				dmgMult = dmgMult * (_skill.isRanged() ? p.DamageReceivedRangedMult : p.DamageReceivedMeleeMult);
			}
			//this.logInfo("dmgMult before " + dmgMult);
			if(_attacker == null || _attacker.isDying() || !_attacker.isAlive()) {

			}
			else if(_attacker.EL_getCombatLevel() > this.EL_getCombatLevel()) {
				dmgMult *= this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.DamageFactor, this.Math.abs(_attacker.EL_getCombatLevel() - this.EL_getCombatLevel()));
				//this.logInfo("attackEntity combat level extra damage mult" + (this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.DamageFactor, this.Math.abs(_user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()))));
			}
			else {
				dmgMult /= this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.DamageFactor, this.Math.abs(_attacker.EL_getCombatLevel() - this.EL_getCombatLevel()));
				//this.logInfo("attackEntity combat level decrease damage mult" + (this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.DamageFactor, this.Math.abs(_user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()))));
			}
			//this.logInfo("dmgMult after " + dmgMult);
			_hitInfo.DamageRegular -= p.DamageRegularReduction;
			_hitInfo.DamageArmor -= p.DamageArmorReduction;

			_hitInfo.DamageRegular *= p.DamageReceivedRegularMult * dmgMult;
			_hitInfo.DamageArmor *= p.DamageReceivedArmorMult * dmgMult;
			if(!p.IsIgnoringArmorOnAttack)
			{
				if(p.Armor[_hitInfo.BodyPart] != 0)
				{
					_hitInfo.DamageRegular -= _hitInfo.BodyPart == this.Const.BodyPart.Head ? p.EL_DamageHeadRegularReduction : p.EL_DamageBodyRegularReduction;
				}
				_hitInfo.DamageArmor -= _hitInfo.BodyPart == this.Const.BodyPart.Head ? p.EL_DamageHeadArmorReduction : p.EL_DamageBodyArmorReduction;
			}
			local armor = 0;
			local armorDamage = 0;

			if (_hitInfo.DamageDirect < 1.0)
			{
				armor = p.Armor[_hitInfo.BodyPart] * p.ArmorMult[_hitInfo.BodyPart];
				armorDamage = this.Math.min(armor, _hitInfo.DamageArmor);
				armor = armor - armorDamage;
				_hitInfo.DamageInflictedArmor = this.Math.max(0, armorDamage);
			}

			_hitInfo.DamageFatigue *= p.FatigueEffectMult;
			this.m.Fatigue = this.Math.min(this.getFatigueMax(), this.Math.round(this.m.Fatigue + _hitInfo.DamageFatigue * p.FatigueReceivedPerHitMult * this.m.CurrentProperties.FatigueLossOnAnyAttackMult));
			local damage = 0;
			damage = damage + this.Math.maxf(0.0, _hitInfo.DamageRegular * _hitInfo.DamageDirect * p.DamageReceivedDirectMult);
			if(!p.IsIgnoringArmorOnAttack)
			{
				damage -= armor * this.Const.EL_PlayerNPC.EL_ArmorDirectDamageMitigationMult
			}

			if (armor <= 0 || (_hitInfo.DamageDirect >= 1.0 && p.DamageReceivedDirectMult != 0))
			{
				damage = damage + this.Math.max(0, _hitInfo.DamageRegular * this.Math.maxf(0.0, 1.0 - _hitInfo.DamageDirect * p.DamageReceivedDirectMult) - armorDamage);
			}
			damage = damage * _hitInfo.BodyDamageMult;
			damage = this.Math.max(0, this.Math.max(this.Math.round(damage), this.Math.min(this.Math.round(_hitInfo.DamageMinimum), this.Math.round(_hitInfo.DamageMinimum * p.DamageReceivedTotalMult))));
			_hitInfo.DamageInflictedHitpoints = damage;
			this.m.Skills.onDamageReceived(_attacker, _hitInfo.DamageInflictedHitpoints, _hitInfo.DamageInflictedArmor);

			if (armorDamage > 0 && !this.isHiddenToPlayer() && _hitInfo.IsPlayingArmorSound)
			{
				local armorHitSound = this.m.Items.getAppearance().ImpactSound[_hitInfo.BodyPart];

				if (armorHitSound.len() > 0)
				{
					this.Sound.play(armorHitSound[this.Math.rand(0, armorHitSound.len() - 1)], this.Const.Sound.Volume.ActorArmorHit, this.getPos());
				}

				if (damage < this.Const.Combat.PlayPainSoundMinDamage)
				{
					this.playSound(this.Const.Sound.ActorEvent.NoDamageReceived, this.Const.Sound.Volume.Actor * this.m.SoundVolume[this.Const.Sound.ActorEvent.NoDamageReceived] * this.m.SoundVolumeOverall);
				}
			}

			if (damage > 0)
			{
				if (!this.m.IsAbleToDie && damage >= this.m.Hitpoints)
				{
					this.m.Hitpoints = 1;
				}
				else
				{
					this.m.Hitpoints = this.Math.round(this.m.Hitpoints - damage);
				}
			}

			if (this.m.Hitpoints <= 0)
			{
				local lorekeeperPotionEffect = this.m.Skills.getSkillByID("effects.lorekeeper_potion");

				if (lorekeeperPotionEffect != null && (!lorekeeperPotionEffect.isSpent() || lorekeeperPotionEffect.getLastFrameUsed() == this.Time.getFrame()))
				{
					this.getSkills().removeByType(this.Const.SkillType.DamageOverTime);
					this.m.Hitpoints = this.getHitpointsMax();
					lorekeeperPotionEffect.setSpent(true);
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + " is reborn by the power of the Lorekeeper!");
				}
				else
				{
					local nineLivesSkill = this.m.Skills.getSkillByID("perk.nine_lives");

					if (nineLivesSkill != null && (!nineLivesSkill.isSpent() || nineLivesSkill.getLastFrameUsed() == this.Time.getFrame()))
					{
						this.getSkills().removeByType(this.Const.SkillType.DamageOverTime);
						this.m.Hitpoints = this.Math.rand(11, 15);
						nineLivesSkill.setSpent(true);
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + " has nine lives!");
					}
				}
			}

			local fatalityType = this.Const.FatalityType.None;

			if (this.m.Hitpoints <= 0)
			{
				this.m.IsDying = true;

				if (_skill != null)
				{
					if (_skill.getChanceDecapitate() >= 100 || _hitInfo.BodyPart == this.Const.BodyPart.Head && this.Math.rand(1, 100) <= _skill.getChanceDecapitate() * _hitInfo.FatalityChanceMult)
					{
						fatalityType = this.Const.FatalityType.Decapitated;
					}
					else if (_skill.getChanceSmash() >= 100 || _hitInfo.BodyPart == this.Const.BodyPart.Head && this.Math.rand(1, 100) <= _skill.getChanceSmash() * _hitInfo.FatalityChanceMult)
					{
						fatalityType = this.Const.FatalityType.Smashed;
					}
					else if (_skill.getChanceDisembowel() >= 100 || _hitInfo.BodyPart == this.Const.BodyPart.Body && this.Math.rand(1, 100) <= _skill.getChanceDisembowel() * _hitInfo.FatalityChanceMult)
					{
						fatalityType = this.Const.FatalityType.Disemboweled;
					}
				}
			}

			if (_hitInfo.DamageDirect < 1.0)
			{
				local overflowDamage = _hitInfo.DamageArmor;

				if (this.m.BaseProperties.Armor[_hitInfo.BodyPart] != 0)
				{
					overflowDamage = overflowDamage - this.m.BaseProperties.Armor[_hitInfo.BodyPart] * this.m.BaseProperties.ArmorMult[_hitInfo.BodyPart];
					this.m.BaseProperties.Armor[_hitInfo.BodyPart] = this.Math.max(0, this.m.BaseProperties.Armor[_hitInfo.BodyPart] * this.m.BaseProperties.ArmorMult[_hitInfo.BodyPart] - _hitInfo.DamageArmor);
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + "\'s armor is hit for [b]" + this.Math.floor(_hitInfo.DamageArmor) + "[/b] damage");
				}

				if (overflowDamage > 0)
				{
					this.m.Items.onDamageReceived(overflowDamage, fatalityType, _hitInfo.BodyPart == this.Const.BodyPart.Body ? this.Const.ItemSlot.Body : this.Const.ItemSlot.Head, _attacker);
				}
			}

			if (this.getFaction() == this.Const.Faction.Player && _attacker != null && _attacker.isAlive())
			{
				this.Tactical.getCamera().quake(_attacker, this, 5.0, 0.16, 0.3);
			}

			if (damage <= 0 && armorDamage >= 0)
			{
				if ((this.m.IsFlashingOnHit || this.getCurrentProperties().IsStunned || this.getCurrentProperties().IsRooted) && !this.isHiddenToPlayer() && _attacker != null && _attacker.isAlive())
				{
					local layers = this.m.ShakeLayers[_hitInfo.BodyPart];
					local recoverMult = 1.0;
					this.Tactical.getShaker().cancel(this);
					this.Tactical.getShaker().shake(this, _attacker.getTile(), this.m.IsShakingOnHit ? 2 : 3, this.Const.Combat.ShakeEffectArmorHitColor, this.Const.Combat.ShakeEffectArmorHitHighlight, this.Const.Combat.ShakeEffectArmorHitFactor, this.Const.Combat.ShakeEffectArmorSaturation, layers, recoverMult);
				}

				this.m.Skills.update();
				this.setDirty(true);
				return 0;
			}

			if (damage >= this.Const.Combat.SpawnBloodMinDamage)
			{
				this.logInfo("this.getTile() == null ? " + (this.getTile() == null));
				this.logInfo("this.getTile().X " + this.getTile().X);
				this.logInfo("this.getTile().Y " + this.getTile().Y);
				this.spawnBloodDecals(this.getTile());
			}



			if (this.m.Hitpoints <= 0)
			{
				this.logInfo("this.getTile() == null ? " + (this.getTile() == null));
				this.logInfo("this.getTile().X " + this.getTile().X);
				this.logInfo("this.getTile().Y " + this.getTile().Y);
				this.spawnBloodDecals(this.getTile());
				this.kill(_attacker, _skill, fatalityType);
			}
			else
			{
				this.setDirty(true);
				if (damage >= this.Const.Combat.SpawnBloodEffectMinDamage)
				{
					local mult = this.Math.maxf(0.75, this.Math.minf(2.0, damage / this.getHitpointsMax() * 3.0));
					this.spawnBloodEffect(this.getTile(), mult);
				}

				if (this.Tactical.State.getStrategicProperties() != null && this.Tactical.State.getStrategicProperties().IsArenaMode && _attacker != null && _attacker.getID() != this.getID())
				{
					local mult = damage / this.getHitpointsMax();

					if (mult >= 0.75)
					{
						this.Sound.play(this.Const.Sound.ArenaBigHit[this.Math.rand(0, this.Const.Sound.ArenaBigHit.len() - 1)], this.Const.Sound.Volume.Tactical * this.Const.Sound.Volume.Arena);
					}
					else if (mult >= 0.25 || this.Math.rand(1, 100) <= 20)
					{
						this.Sound.play(this.Const.Sound.ArenaHit[this.Math.rand(0, this.Const.Sound.ArenaHit.len() - 1)], this.Const.Sound.Volume.Tactical * this.Const.Sound.Volume.Arena);
					}
				}

				if (this.m.CurrentProperties.IsAffectedByInjuries && this.m.IsAbleToDie && damage >= this.Const.Combat.InjuryMinDamage && this.m.CurrentProperties.ThresholdToReceiveInjuryMult != 0 && _hitInfo.InjuryThresholdMult != 0 && _hitInfo.Injuries != null)
				{
					local potentialInjuries = [];
					local bonus = _hitInfo.BodyPart == this.Const.BodyPart.Head ? 1.25 : 1.0;

					foreach( inj in _hitInfo.Injuries )
					{
						if (inj.Threshold * _hitInfo.InjuryThresholdMult * this.Const.Combat.InjuryThresholdMult * this.m.CurrentProperties.ThresholdToReceiveInjuryMult * bonus <= damage / (this.getHitpointsMax() * 1.0))
						{
							if (!this.m.Skills.hasSkill(inj.ID) && this.m.ExcludedInjuries.find(inj.ID) == null)
							{
								potentialInjuries.push(inj.Script);
							}
						}
					}

					local appliedInjury = false;

					while (potentialInjuries.len() != 0)
					{
						local r = this.Math.rand(0, potentialInjuries.len() - 1);
						local injury = this.new("scripts/skills/" + potentialInjuries[r]);

						if (injury.isValid(this))
						{
							this.m.Skills.add(injury);

							if (this.isPlayerControlled() && this.isKindOf(this, "player"))
							{
								this.worsenMood(this.Const.MoodChange.Injury, "Suffered an injury");

								if (("State" in this.World) && this.World.State != null && this.World.Ambitions.hasActiveAmbition() && this.World.Ambitions.getActiveAmbition().getID() == "ambition.oath_of_sacrifice")
								{
									this.World.Statistics.getFlags().increment("OathtakersInjuriesSuffered");
								}
							}

							if (this.isPlayerControlled() || !this.isHiddenToPlayer())
							{
								this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + "\'s " + this.Const.Strings.BodyPartName[_hitInfo.BodyPart] + " is hit for [b]" + this.Math.floor(damage) + "[/b] damage and suffers " + injury.getNameOnly() + "!");
							}

							appliedInjury = true;
							break;
						}
						else
						{
							potentialInjuries.remove(r);
						}
					}

					if (!appliedInjury)
					{
						if (damage > 0 && !this.isHiddenToPlayer())
						{
							this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + "\'s " + this.Const.Strings.BodyPartName[_hitInfo.BodyPart] + " is hit for [b]" + this.Math.floor(damage) + "[/b] damage");
						}
					}
				}
				else if (damage > 0 && !this.isHiddenToPlayer())
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + "\'s " + this.Const.Strings.BodyPartName[_hitInfo.BodyPart] + " is hit for [b]" + this.Math.floor(damage) + "[/b] damage");
				}

				local damage_persent = damage / this.getHitpointsMax() * 100;

				if (this.m.MoraleState != this.Const.MoraleState.Ignore && this.getCurrentProperties().IsAffectedByLosingHitpoints)
				{
					while(damage_persent >= this.Const.EL_PlayerNPC.EL_Morale.Hit.PersentPurCheck) {
						if (!this.isPlayerControlled() || !this.m.Skills.hasSkill("effects.berserker_mushrooms"))
						{
							local offset = this.Const.EL_PlayerNPC.EL_Morale.Hit.Factor2 * this.Math.pow(this.getHitpoints() / this.getHitpointsMax() * 100 / this.Const.EL_PlayerNPC.EL_Morale.Hit.Factor1, this.Const.EL_PlayerNPC.EL_Morale.Hit.Factor3);
							this.checkMorale(-1, offset - (_attacker != null && _attacker.getID() != this.getID() ? _attacker.getCurrentProperties().ThreatOnHit : 0), this.Const.MoraleCheckType.Default, "", true);
							//this.logInfo("Damaged Recieve checkMorale" + (offset - (_attacker != null && _attacker.getID() != this.getID() ? _attacker.getCurrentProperties().ThreatOnHit : 0)));
						}
						damage_persent -= this.Const.EL_PlayerNPC.EL_Morale.Hit.PersentPurCheck;
					}
				}

				this.m.Skills.onAfterDamageReceived();

				if (damage >= this.Const.Combat.PlayPainSoundMinDamage && this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived].len() > 0)
				{
					local volume = 1.0;

					if (damage < this.Const.Combat.PlayPainVolumeMaxDamage)
					{
						volume = damage / this.Const.Combat.PlayPainVolumeMaxDamage;
					}

					this.playSound(this.Const.Sound.ActorEvent.DamageReceived, this.Const.Sound.Volume.Actor * this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] * this.m.SoundVolumeOverall * volume, this.m.SoundPitch);
				}

				this.m.Skills.update();
				this.onUpdateInjuryLayer();

				//bug bug bug
				// if ((this.m.IsFlashingOnHit || this.getCurrentProperties().IsStunned || this.getCurrentProperties().IsRooted) && !this.isHiddenToPlayer() && _attacker != null && _attacker.isAlive())
				// {
				// 	local layers = this.m.ShakeLayers[_hitInfo.BodyPart];
				// 	local recoverMult = this.Math.minf(1.5, this.Math.maxf(1.0, damage * 2.0 / this.getHitpointsMax()));
				// 	this.Tactical.getShaker().cancel(this);
				// 	this.Tactical.getShaker().shake(this, _attacker.getTile(), this.m.IsShakingOnHit ? 2 : 3, this.Const.Combat.ShakeEffectHitpointsHitColor, this.Const.Combat.ShakeEffectHitpointsHitHighlight, this.Const.Combat.ShakeEffectHitpointsHitFactor, this.Const.Combat.ShakeEffectHitpointsSaturation, layers, recoverMult);
				// }
			}

			return damage;
		}


		o.onOtherActorDeath = function( _killer, _victim, _skill ) {
			if (!this.m.IsAlive || this.m.IsDying)
			{
				return;
			}

			if (_victim.getXPValue() <= 1)
			{
				return;
			}
			local difficulty = this.Const.EL_PlayerNPC.EL_Morale.Death.BaseOffset +
							   this.Const.EL_PlayerNPC.EL_Morale.Death.RankFactor * (this.EL_getRankLevel() - _victim.EL_getRankLevel()) +
							   this.Math.pow(this.Const.EL_PlayerNPC.EL_Morale.Death.CombatLevelFactor, this.Math.abs(this.EL_getCombatLevel() - _victim.EL_getCombatLevel())) * (this.EL_getCombatLevel() - _victim.EL_getCombatLevel()) +
							   this.Math.pow(_victim.getTile().getDistanceTo(this.getTile()), this.Const.EL_PlayerNPC.EL_Morale.Death.DistanceFactor);
			if (_victim.getFaction() == this.getFaction() && _victim.getCurrentProperties().TargetAttractionMult >= 0.5 && this.getCurrentProperties().IsAffectedByDyingAllies)
			{
				this.checkMorale(-1, difficulty, this.Const.MoraleCheckType.Default, "", true);
				//this.logInfo("Ally death checkMorale" + difficulty);
			}
			else if (this.getAlliedFactions().find(_victim.getFaction()) == null)
			{
				this.checkMorale(1, -difficulty);
				//this.logInfo("Enemy death checkMorale" + (-difficulty));
			}
		}

		o.onOtherActorFleeing = function( _actor )
		{
			if (!this.m.IsAlive || this.m.IsDying)
			{
				return;
			}

			if (this.m.CurrentProperties.IsAffectedByFleeingAllies)
			{
				local difficulty = this.Const.EL_PlayerNPC.EL_Morale.Fleeing.BaseOffset +
								   this.Const.EL_PlayerNPC.EL_Morale.Fleeing.RankFactor * (this.EL_getRankLevel() - _actor.EL_getRankLevel()) +
								   this.Math.pow(this.Const.EL_PlayerNPC.EL_Morale.Fleeing.CombatLevelFactor, this.Math.abs(this.EL_getCombatLevel() - _actor.EL_getCombatLevel())) * (this.EL_getCombatLevel() - _actor.EL_getCombatLevel()) +
								   this.Math.pow(_actor.getTile().getDistanceTo(this.getTile()), this.Const.EL_PlayerNPC.EL_Morale.Fleeing.DistanceFactor);
				if(_actor.isAlliedWith(this)) {
					this.checkMorale(-1, difficulty);
					//this.logInfo("Ally fleeing checkMorale" + difficulty);
				}
				else {
					this.checkMorale(1, -difficulty);
					//this.logInfo("Enemy fleeing checkMorale" + (-difficulty));
				}
			}
		}

		o.onMovementFinish = function( _tile )
		{
			this.m.IsMoving = true;
			this.updateVisibility(_tile, this.m.CurrentProperties.getVision(), this.getFaction());

			if (this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getID())
			{
				this.Tactical.TurnSequenceBar.getActiveEntity().updateVisibilityForFaction();
			}

			this.setZoneOfControl(_tile, this.hasZoneOfControl());

			if (!this.m.IsExertingZoneOfOccupation)
			{
				_tile.addZoneOfOccupation(this.getFaction());
				this.m.IsExertingZoneOfOccupation = true;
			}

			if (this.Const.Tactical.TerrainEffect[_tile.Type].len() > 0 && !this.m.Skills.hasSkill(this.Const.Tactical.TerrainEffectID[_tile.Type]))
			{
				this.m.Skills.add(this.new(this.Const.Tactical.TerrainEffect[_tile.Type]));
			}

			if (_tile.IsHidingEntity)
			{
				this.m.Skills.add(this.new(this.Const.Movement.HiddenStatusEffect));
			}

			local numOfEnemiesAdjacentToMe = _tile.getZoneOfControlCountOtherThan(this.getAlliedFactions());

			if (this.m.CurrentMovementType == this.Const.Tactical.MovementType.Default)
			{
				if (this.m.MoraleState != this.Const.MoraleState.Fleeing)
				{
					for( local i = 0; i != 6; i = ++i )
					{
						if (!_tile.hasNextTile(i))
						{
						}
						else
						{
							local otherTile = _tile.getNextTile(i);

							if (!otherTile.IsOccupiedByActor)
							{
							}
							else
							{
								local otherActor = otherTile.getEntity();
								if(!otherActor.isAlliedWith(this)) {
									local numEnemies = otherTile.getZoneOfControlCountOtherThan(otherActor.getAlliedFactions());
									if(otherActor.m.MaxEnemiesThisTurn < numEnemies) {
										otherActor.m.MaxEnemiesThisTurn = numEnemies;
									}
									for(local j = 0; j < 6; ++j) {
										if (otherTile.hasNextTile(j))
										{
											local temp_tile = otherTile.getNextTile(j);
											if(temp_tile.IsOccupiedByActor) {
												local temp_actor = temp_tile.getEntity();
												if (!temp_actor.isAlliedWith(otherActor))
												{
													local difficulty = this.Const.EL_PlayerNPC.EL_Morale.Move.BaseOffset +
																	   this.Const.EL_PlayerNPC.EL_Morale.Move.RankFactor * (otherActor.EL_getRankLevel() - temp_actor.EL_getRankLevel()) +
																	   this.Math.pow(this.Const.EL_PlayerNPC.EL_Morale.Move.CombatLevelFactor, this.Math.abs(otherActor.EL_getCombatLevel() - temp_actor.EL_getCombatLevel())) * (otherActor.EL_getCombatLevel() - temp_actor.EL_getCombatLevel());
													otherActor.checkMorale(-1, difficulty);
													//this.logInfo("Step checkMorale" + difficulty);
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			else if (this.m.CurrentMovementType == this.Const.Tactical.MovementType.Involuntary)
			{
				if (this.m.MaxEnemiesThisTurn < numOfEnemiesAdjacentToMe)
				{
					local difficulty = 40.0;
					this.checkMorale(-1, difficulty);
					//this.logInfo("Involuntary checkMorale" + difficulty);
				}
			}

			this.m.CurrentMovementType = this.Const.Tactical.MovementType.Default;
			this.m.MaxEnemiesThisTurn = this.Math.max(1, numOfEnemiesAdjacentToMe);

			if (this.isPlayerControlled() && this.getMoraleState() > this.Const.MoraleState.Breaking && this.getMoraleState() != this.Const.MoraleState.Ignore && (_tile.SquareCoords.X == 0 || _tile.SquareCoords.Y == 0 || _tile.SquareCoords.X == 31 || _tile.SquareCoords.Y == 31))
			{
				local change = this.getMoraleState() - this.Const.MoraleState.Breaking;
				this.checkMorale(-change, -1000, this.Const.MoraleCheckType.Default, "", false);
				//this.logInfo("Side checkMorale");
			}
			if (this.m.IsEmittingMovementSounds && this.Const.Tactical.TerrainMovementSound[_tile.Subtype].len() != 0)
			{
				local sound = this.Const.Tactical.TerrainMovementSound[_tile.Subtype][this.Math.rand(0, this.Const.Tactical.TerrainMovementSound[_tile.Subtype].len() - 1)];
				this.Sound.play("sounds/" + sound.File, sound.Volume * this.Const.Sound.Volume.TacticalMovement * this.Math.rand(90, 100) * 0.01, this.getPos(), sound.Pitch * this.Math.rand(95, 105) * 0.01);
			}

			this.spawnTerrainDropdownEffect(_tile);

			if (_tile.Properties.Effect != null && _tile.Properties.Effect.IsAppliedOnEnter)
			{
				_tile.Properties.Effect.Callback(_tile, this);
			}

			this.m.Skills.update();
			this.m.Items.onMovementFinished();
			this.setDirty(true);
			this.m.IsMoving = false;
		}


	});

	::mods_hookNewObject("entity/tactical/player", function( o )
	{

		o.getTooltip = function( _targetedWithSkill = null )
		{
			if (!this.isPlacedOnMap() || !this.isAlive() || this.isDying())
			{
				return [];
			}

			local turnsToGo = this.Tactical.TurnSequenceBar.getTurnsUntilActive(this.getID());
			local tooltip = [
				{
					id = 1,
					type = "title",
					text = this.getName(),
					icon = "ui/tooltips/height_" + this.getTile().Level + ".png"
				}
			];

			if (!this.isPlayerControlled() && _targetedWithSkill != null && this.isKindOf(_targetedWithSkill, "skill"))
			{
				local tile = this.getTile();

				if (tile.IsVisibleForEntity && _targetedWithSkill.isUsableOn(this.getTile()))
				{
					tooltip.push({
						id = 3,
						type = "headerText",
						icon = "ui/icons/hitchance.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + _targetedWithSkill.getHitchance(this) + "%[/color] chance to hit",
						children = _targetedWithSkill.getHitFactors(tile)
					});
				}
			}

			tooltip.extend([
				{
					id = 2,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = this.Tactical.TurnSequenceBar.getActiveEntity() == this ? "Acting right now!" : this.m.IsTurnDone || turnsToGo == null ? "Turn done" : "Acts in " + turnsToGo + (turnsToGo > 1 ? " turns" : " turn")
				},
				{
					id = 3,
					type = "progressbar",
					icon = "ui/icons/armor_head.png",
					value = this.getArmor(this.Const.BodyPart.Head),
					valueMax = this.getArmorMax(this.Const.BodyPart.Head),
					text = "" + this.getArmor(this.Const.BodyPart.Head) + " / " + this.getArmorMax(this.Const.BodyPart.Head) + "",
					style = "armor-head-slim"
				},
				{
					id = 4,
					type = "progressbar",
					icon = "ui/icons/armor_body.png",
					value = this.getArmor(this.Const.BodyPart.Body),
					valueMax = this.getArmorMax(this.Const.BodyPart.Body),
					text = "" + this.getArmor(this.Const.BodyPart.Body) + " / " + this.getArmorMax(this.Const.BodyPart.Body) + "",
					style = "armor-body-slim"
				},
				{
					id = 5,
					type = "progressbar",
					icon = "ui/icons/health.png",
					value = this.getHitpoints(),
					valueMax = this.getHitpointsMax(),
					text = "" + this.getHitpoints() + " / " + this.getHitpointsMax() + "",
					style = "hitpoints-slim"
				},
				{
					id = 6,
					type = "progressbar",
					icon = "ui/icons/morale.png",
					value = this.getMoraleState(),
					valueMax = this.Const.MoraleState.COUNT - 1,
					text = this.Const.MoraleStateName[this.getMoraleState()],
					style = "morale-slim"
				},
				{
					id = 7,
					type = "progressbar",
					icon = "ui/icons/fatigue.png",
					value = this.getFatigue(),
					valueMax = this.getFatigueMax(),
					text = "" + this.getFatigue() + " / " + this.getFatigueMax() + "",
					style = "fatigue-slim"
				}
			]);

			local raicial_skills = this.getSkills().query(this.Const.SkillType.Racial, false, true);
			foreach( skill in raicial_skills )
			{
				if(skill.EL_isNPCBuff()) {
					tooltip.push({
						id = 99,
						type = "text",
						icon = skill.getIcon(),
						text = skill.getName()
					});
				}
			}

			local statusEffects = this.getSkills().query(this.Const.SkillType.StatusEffect | this.Const.SkillType.TemporaryInjury, false, true);

			foreach( i, statusEffect in statusEffects )
			{
				tooltip.push({
					id = 100 + i,
					type = "text",
					icon = statusEffect.getIcon(),
					text = statusEffect.getName()
				});
			}

			return tooltip;
		}

		o.getXPValue = function() {
			return this.actor.getXPValue();
		}

	});

	::mods_hookNewObject("ui/screens/tactical/modules/turn_sequence_bar/turn_sequence_bar", function( o )
	{

		o.convertEntityStatusEffectsToUIData = function( _entity )
		{
			if (_entity.isPlayerControlled())
			{
				local result = [];

				local raicial_skills = _entity.getSkills().query(this.Const.SkillType.Racial, false, true);
				foreach( skill in raicial_skills )
				{
					if(skill.EL_isNPCBuff()) {
						result.push({
							id = skill.getID(),
							imagePath = skill.getIcon()
						});
					}
				}


				local statusEffects = _entity.getSkills().query(this.Const.SkillType.StatusEffect);

				foreach( statusEffect in statusEffects )
				{
					if (statusEffect.isHidden())
					{
						continue;
					}

					result.push({
						id = statusEffect.getID(),
						imagePath = statusEffect.getIcon()
					});
				}

				return result;
			}

			return null;
		}

	});



	::mods_hookClass("skills/skill", function(o) {
		while(!("attackEntity" in o)) o = o[o.SuperName];
		o.m.EL_IsNPCBuff <- false;

		o.EL_isNPCBuff <- function() {
			return this.m.EL_IsNPCBuff;
		}

		o.EL_reset <- function() {}

		o.EL_isRaritySkill <- function()
		{
			return false;
		}

        o.EL_onOtherSkillUesd <- function ( _skill, _targetEntity ) {}

		o.onScheduledTargetHit = function( _info )
		{
			_info.Container.setBusy(false);

			if (!_info.TargetEntity.isAlive())
			{
				return;
			}

			local partHit = this.Math.rand(1, 100);
			local bodyPart = this.Const.BodyPart.Body;
			local bodyPartDamageMult = 1.0;

			if (partHit <= _info.Properties.getHitchance(this.Const.BodyPart.Head))
			{
				bodyPart = this.Const.BodyPart.Head;
			}
			else
			{
				bodyPart = this.Const.BodyPart.Body;
			}

			bodyPartDamageMult = bodyPartDamageMult * _info.Properties.DamageAgainstMult[bodyPart];
			local damageMult = this.m.IsRanged ? _info.Properties.RangedDamageMult : _info.Properties.MeleeDamageMult;
			damageMult = damageMult * _info.Properties.DamageTotalMult;
			local damageRegular = this.Math.rand(_info.Properties.DamageRegularMin, _info.Properties.DamageRegularMax) * _info.Properties.DamageRegularMult;
			local damageArmor = this.Math.rand(_info.Properties.DamageRegularMin, _info.Properties.DamageRegularMax) * _info.Properties.DamageArmorMult;
			damageRegular = this.Math.max(0, damageRegular + _info.DistanceToTarget * _info.Properties.DamageAdditionalWithEachTile);
			damageArmor = this.Math.max(0, damageArmor + _info.DistanceToTarget * _info.Properties.DamageAdditionalWithEachTile);
			local damageDirect = this.Math.minf(1.0, _info.Properties.DamageDirectMult * (this.m.DirectDamageMult + _info.Properties.DamageDirectAdd + (this.m.IsRanged ? _info.Properties.DamageDirectRangedAdd : _info.Properties.DamageDirectMeleeAdd)));
			local injuries;

			if (this.m.InjuriesOnBody != null && bodyPart == this.Const.BodyPart.Body)
			{
				if (_info.TargetEntity.getFlags().has("skeleton"))
				{
					injuries = this.Const.Injury.SkeletonBody;
				}
				else
				{
					injuries = this.m.InjuriesOnBody;
				}
			}
			else if (this.m.InjuriesOnHead != null && bodyPart == this.Const.BodyPart.Head)
			{
				if (_info.TargetEntity.getFlags().has("skeleton"))
				{
					injuries = this.Const.Injury.SkeletonHead;
				}
				else
				{
					injuries = this.m.InjuriesOnHead;
				}
			}

			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = damageRegular * damageMult;
			hitInfo.DamageArmor = damageArmor * damageMult;
			hitInfo.DamageDirect = damageDirect;
			hitInfo.DamageFatigue = this.Const.Combat.FatigueReceivedPerHit * _info.Properties.FatigueDealtPerHitMult;
			hitInfo.DamageMinimum = _info.Properties.DamageMinimum;
			hitInfo.BodyPart = bodyPart;
			hitInfo.BodyDamageMult = bodyPartDamageMult;
			hitInfo.FatalityChanceMult = _info.Properties.FatalityChanceMult;
			hitInfo.Injuries = injuries;
			hitInfo.InjuryThresholdMult = _info.Properties.ThresholdToInflictInjuryMult;
			hitInfo.Tile = _info.TargetEntity.getTile();

			// EL_OVERRIDE
			// local p = _info.TargetEntity.getCurrentProperties().getClone();
			// hitInfo.DamageRegular -= p.DamageRegularReduction;
			// hitInfo.DamageArmor -= p.DamageArmorReduction;
			// hitInfo.DamageArmor -= hitInfo.BodyPart == this.Const.BodyPart.Head ? p.EL_DamageHeadArmorReduction : p.EL_DamageBodyArmorReduction;


			_info.Container.onBeforeTargetHit(_info.Skill, _info.TargetEntity, hitInfo);
			local pos = _info.TargetEntity.getPos();
			local hasArmorHitSound = _info.TargetEntity.getItems().getAppearance().ImpactSound[bodyPart].len() != 0;
			_info.TargetEntity.onDamageReceived(_info.User, _info.Skill, hitInfo);

			if (hitInfo.DamageInflictedHitpoints >= this.Const.Combat.PlayHitSoundMinDamage)
			{
				if (this.m.SoundOnHitHitpoints.len() != 0)
				{
					this.Sound.play(this.m.SoundOnHitHitpoints[this.Math.rand(0, this.m.SoundOnHitHitpoints.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, pos);
				}
			}

			if (hitInfo.DamageInflictedHitpoints == 0 && hitInfo.DamageInflictedArmor >= this.Const.Combat.PlayHitSoundMinDamage)
			{
				if (this.m.SoundOnHitArmor.len() != 0)
				{
					this.Sound.play(this.m.SoundOnHitArmor[this.Math.rand(0, this.m.SoundOnHitArmor.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, pos);
				}
			}

			if (typeof _info.User == "instance" && _info.User.isNull() || !_info.User.isAlive() || _info.User.isDying())
			{
				return;
			}

			_info.Container.onTargetHit(_info.Skill, _info.TargetEntity, hitInfo.BodyPart, hitInfo.DamageInflictedHitpoints, hitInfo.DamageInflictedArmor);
			_info.User.getItems().onDamageDealt(_info.TargetEntity, this, hitInfo);

			if (hitInfo.DamageInflictedHitpoints >= this.Const.Combat.SpawnBloodMinDamage && !_info.Skill.isRanged() && (_info.TargetEntity.getBloodType() == this.Const.BloodType.Red || _info.TargetEntity.getBloodType() == this.Const.BloodType.Dark))
			{
				_info.User.addBloodied();
				local item = _info.User.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

				if (item != null && item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					item.setBloodied(true);
				}
			}
		}

		o.attackEntity = function( _user, _targetEntity, _allowDiversion = true )
		{
			if(_targetEntity == null) {
				return false;
			}

			if(this.m.Container != null)
			{
				this.m.Container.EL_onOtherSkillUesd(this, _targetEntity);
			}

			if(_user == null || _user.isDying() || !_user.isAlive())
			{
				return false;
			}

			if (_targetEntity.isRock())
			{
				if (_user.getSkills().hasSkill("perk.legend_specialist_pickaxe_damage"))
				{
					local r = this.Math.rand(0, 99);

					if (r == 99)
					{
						local loot = this.new("scripts/items/trade/uncut_gems_item");
						loot.drop(_targetEntity().getTile());
					}
					else if (r <= 5)
					{
						local loot = this.new("scripts/items/trade/salt_item");
						loot.drop(_targetEntity().getTile());
					}
					else if (r <= 15 && r > 5)
					{
						local loot = this.new("scripts/items/trade/peat_bricks_item");
						loot.drop(_targetEntity().getTile());
					}
				}

				if (this.m.SoundOnHit.len() != 0)
				{
					this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.SoundOnHitDelay, this.onPlayHitSound.bindenv(this), {
						Sound = this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)],
						Pos = _targetEntity.getPos()
					});
				}

				local tile = _targetEntity.getTile();
				local x = tile.X;
				local y = tile.Y;
				this.Tactical.getTile(x, y).removeObject();
				return true;
			}

			if (_targetEntity.isSticks())
			{
				local r = this.Math.rand(0, 4);

				if (r == 1 && _user.getSkills().hasSkill("perk.legend_specialist_woodaxe_damage"))
				{
					local loot = this.new("scripts/items/trade/legend_raw_wood_item");
					loot.drop(_targetEntity.getTile());
				}

				if (this.m.SoundOnHit.len() != 0)
				{
					this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.SoundOnHitDelay, this.onPlayHitSound.bindenv(this), {
						Sound = this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)],
						Pos = _targetEntity.getPos()
					});
				}

				local tile = _targetEntity.getTile();
				local x = tile.X;
				local y = tile.Y;
				this.Tactical.getTile(x, y).removeObject();
				return true;
			}

			if (_targetEntity.isSupplies())
			{
				local r = this.Math.rand(1, 100);

				if (r == 1)
				{
					local loot = this.new("scripts/items/supplies/ammo_small_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 2)
				{
					local loot = this.new("scripts/items/supplies/armor_parts_small_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 3)
				{
					local loot = this.new("scripts/items/supplies/medicine_small_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r >= 4 && r < 6)
				{
					local loot = this.new("scripts/items/supplies/ground_grains_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r >= 7 && r < 9)
				{
					if (this.Math.rand(1, 8) == 8)
					{
						local loot = this.new("scripts/items/supplies/legend_cooking_spices_item");
						loot.drop(_targetEntity.getTile());
					}
				}

				if (r == 10)
				{
					local loot = this.new("scripts/items/supplies/legend_fresh_fruit_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 11)
				{
					local loot = this.new("scripts/items/supplies/strange_meat_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 12)
				{
					local loot = this.new("scripts/items/supplies/legend_human_parts");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 13)
				{
					local loot = this.new("scripts/items/supplies/legend_fresh_meat_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 14)
				{
					local loot = this.new("scripts/items/supplies/beer_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 15)
				{
					local loot = this.new("scripts/items/supplies/bandage_item");
					loot.drop(_targetEntity.getTile());
				}

				if (this.m.SoundOnHit.len() != 0)
				{
					this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.SoundOnHitDelay, this.onPlayHitSound.bindenv(this), {
						Sound = this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)],
						Pos = _targetEntity.getPos()
					});
				}

				local tile = _targetEntity.getTile();
				local x = tile.X;
				local y = tile.Y;
				this.Tactical.getTile(x, y).removeObject();
				return false;
			}

			if (_targetEntity.isTree())
			{
				if (this.m.SoundOnHit.len() != 0)
				{
					this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.SoundOnHitDelay, this.onPlayHitSound.bindenv(this), {
						Sound = this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)],
						Pos = _targetEntity.getPos()
					});
				}

				local tile = _targetEntity.getTile();
				local x = tile.X;
				local y = tile.Y;
				this.Tactical.getTile(x, y).removeObject();
				this.Tactical.getTile(x, y).spawnObject("entity/tactical/objects/tree_sticks");
				return true;
			}

			if (_targetEntity.isBush())
			{
				local r = this.Math.rand(0, 99);

				if (r <= 25 && _user.getSkills().hasSkill("perk.legend_specialist_sickle_damage"))
				{
					local loot = this.new("scripts/items/supplies/roots_and_berries_item");
					loot.drop(_targetEntity.getTile());
				}

				if (r == 99 && _user.getSkills().hasSkill("perk.legend_specialist_sickle_damage"))
				{
					local loot = this.new("scripts/items/misc/mysterious_herbs_item");
					loot.drop(_targetEntity.getTile());
				}

				if (this.m.SoundOnHit.len() != 0)
				{
					this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.SoundOnHitDelay, this.onPlayHitSound.bindenv(this), {
						Sound = this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)],
						Pos = _targetEntity.getPos()
					});
				}

				local tile = _targetEntity.getTile();
				local x = tile.X;
				local y = tile.Y;
				this.Tactical.getTile(x, y).removeObject();
				return false;
			}

			if (_targetEntity != null && !_targetEntity.isAlive())
			{
				return false;
			}
			

			local properties = this.m.Container.buildPropertiesForUse(this, _targetEntity);
			local userTile = _user.getTile();
			local astray = false;
			//OVERRIDE
			local EL_isDefiniteHit = false;
			if(_user.getSkills().hasSkill("el_rarity_entry.pursuit_of_wind") && _user.getSkills().getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				EL_isDefiniteHit = true;
			}

			if (_allowDiversion && this.m.IsRanged && userTile.getDistanceTo(_targetEntity.getTile()) > 1 && !EL_isDefiniteHit)
			{
				local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(userTile, _targetEntity.getTile(), _user.getFaction());

				if (blockedTiles.len() != 0 && this.Math.rand(1, 100) <= this.Math.ceil(this.Const.Combat.RangedAttackBlockedChance * properties.RangedAttackBlockedChanceMult * 100))
				{
					_allowDiversion = false;
					astray = true;
					_targetEntity = blockedTiles[this.Math.rand(0, blockedTiles.len() - 1)].getEntity();
				}
			}

			if (!_targetEntity.isAttackable())
			{
				if (this.m.IsShowingProjectile && this.m.ProjectileType != 0)
				{
					local flip = !this.m.IsProjectileRotated && _targetEntity.getPos().X > _user.getPos().X;

					if (_user.getTile().getDistanceTo(_targetEntity.getTile()) >= this.Const.Combat.SpawnProjectileMinDist)
					{
						this.Tactical.spawnProjectileEffect(this.Const.ProjectileSprite[this.m.ProjectileType], _user.getTile(), _targetEntity.getTile(), 1.0, this.m.ProjectileTimeScale, this.m.IsProjectileRotated, flip);
					}
				}

				return false;
			}

			local defenderProperties = _targetEntity.getSkills().buildPropertiesForDefense(_user, this);
			local defense = _targetEntity.getDefense(_user, this, defenderProperties);
			local levelDifference = _targetEntity.getTile().Level - _user.getTile().Level;
			local distanceToTarget = _user.getTile().getDistanceTo(_targetEntity.getTile());
			local toHit = 0;
			local skill = this.m.IsRanged ? properties.RangedSkill * properties.RangedSkillMult : properties.MeleeSkill * properties.MeleeSkillMult;
			toHit = toHit + skill;
			toHit = toHit - defense;

			if (this.m.IsRanged)
			{
				toHit = toHit + (distanceToTarget - this.m.MinRange) * properties.HitChanceAdditionalWithEachTile * properties.HitChanceWithEachTileMult;
			}

			if (levelDifference < 0)
			{
				toHit = toHit + this.Const.Combat.LevelDifferenceToHitBonus;
			}
			else
			{
				toHit = toHit + this.Const.Combat.LevelDifferenceToHitMalus * levelDifference;
			}

			local shieldBonus = 0;
			local shield = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
			{
				shieldBonus = (this.m.IsRanged ? shield.getRangedDefense() : shield.getMeleeDefense()) * (_targetEntity.getCurrentProperties().IsSpecializedInShields ? 1.25 : 1.0);

				if (!this.m.IsShieldRelevant)
				{
					toHit = toHit + shieldBonus;
				}

				if (_targetEntity.getSkills().hasSkill("effects.shieldwall"))
				{
					if (!this.m.IsShieldwallRelevant)
					{
						toHit = toHit + shieldBonus;
					}

					shieldBonus = shieldBonus * 2;
				}
			}

			toHit = toHit * properties.TotalAttackToHitMult;
			toHit = toHit + this.Math.max(0, 100 - toHit) * (1.0 - defenderProperties.TotalDefenseToHitMult);

			if (this.m.IsRanged && !_allowDiversion && this.m.IsShowingProjectile)
			{
				toHit = toHit - 15;
				properties.DamageTotalMult *= 0.75;
			}
			//this.logInfo("attackEntity combat level extra hit chance" + ((_user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()) * this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.HitChangeFactor, this.Math.abs(_user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()))));
			toHit += this.Const.EL_PlayerNPC.EL_CombatLevel.HitChanceMult * (_user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()) * this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.HitChangeFactor, this.Math.abs(_user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()));

			if (defense > -100 && skill > -100)
			{
				toHit = this.Math.max(5, this.Math.min(95, toHit));
			}

			_targetEntity.onAttacked(_user);

			if (this.m.IsDoingAttackMove && !_user.isHiddenToPlayer() && !_targetEntity.isHiddenToPlayer())
			{
				this.Tactical.getShaker().cancel(_user);

				if (this.m.IsDoingForwardMove)
				{
					this.Tactical.getShaker().shake(_user, _targetEntity.getTile(), 5);
				}
				else
				{
					local otherDir = _targetEntity.getTile().getDirectionTo(_user.getTile());

					if (_user.getTile().hasNextTile(otherDir))
					{
						this.Tactical.getShaker().shake(_user, _user.getTile().getNextTile(otherDir), 6);
					}
				}
			}

			if (!this.isUsingHitchance())
			{
				toHit = 100;
			}

			local r = this.Math.rand(1, 100);

			if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == 0)
			{
				if (_user.isPlayerControlled())
				{
					r = this.Math.max(1, r - 5);
				}
				else if (_targetEntity.isPlayerControlled())
				{
					r = this.Math.min(100, r + 5);
				}
			}

			//OVERRIDE
			local isHit = EL_isDefiniteHit ? true : r <= toHit;

			if (!_user.isHiddenToPlayer() && !_targetEntity.isHiddenToPlayer())
			{
				local rolled = r;
				this.Tactical.EventLog.log_newline();

				if (astray)
				{
					if (this.isUsingHitchance())
					{
						if (isHit)
						{
							this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and the shot goes astray and hits " + this.Const.UI.getColorizedEntityName(_targetEntity) + " (Chance: " + this.Math.min(95, this.Math.max(5, toHit)) + ", Rolled: " + rolled + ")");
						}
						else
						{
							this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and the shot goes astray and misses " + this.Const.UI.getColorizedEntityName(_targetEntity) + " (Chance: " + this.Math.min(95, this.Math.max(5, toHit)) + ", Rolled: " + rolled + ")");
						}
					}
					else
					{
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and the shot goes astray and hits " + this.Const.UI.getColorizedEntityName(_targetEntity));
					}
				}
				else if (this.isUsingHitchance())
				{
					if (EL_isDefiniteHit)
					{
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and hits " + this.Const.UI.getColorizedEntityName(_targetEntity));
					}
					else if (isHit)
					{
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and hits " + this.Const.UI.getColorizedEntityName(_targetEntity) + " (Chance: " + this.Math.min(95, this.Math.max(5, toHit)) + ", Rolled: " + rolled + ")");
					}
					else
					{
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and misses " + this.Const.UI.getColorizedEntityName(_targetEntity) + " (Chance: " + this.Math.min(95, this.Math.max(5, toHit)) + ", Rolled: " + rolled + ")");
					}
				}
				else
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and hits " + this.Const.UI.getColorizedEntityName(_targetEntity));
				}
			}

			if (isHit && this.Math.rand(1, 100) <= _targetEntity.getCurrentProperties().RerollDefenseChance && !EL_isDefiniteHit)
			{
				r = this.Math.rand(1, 100);
				isHit = r <= toHit;

				if (!isHit)
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_targetEntity) + " got lucky.");
				}
				else
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_targetEntity) + " wasn\'t lucky enough.");
				}
			}

			if (isHit)
			{
				this.getContainer().setBusy(true);
				// if (this.m.IsShieldRelevant && shield != null)
				// {
				// 	local info = {
				// 		Skill = this,
				// 		User = _user,
				// 		TargetEntity = _targetEntity,
				// 		Shield = shield
				// 	};
				// 	this.onShieldHit(info);
				// }
				local info = {
					Skill = this,
					Container = this.getContainer(),
					User = _user,
					TargetEntity = _targetEntity,
					Properties = properties,
					DistanceToTarget = distanceToTarget
				};

				if (this.m.IsShowingProjectile && this.m.ProjectileType != 0 && _user.getTile().getDistanceTo(_targetEntity.getTile()) >= this.Const.Combat.SpawnProjectileMinDist && (!_user.isHiddenToPlayer() || !_targetEntity.isHiddenToPlayer()))
				{
					local flip = !this.m.IsProjectileRotated && _targetEntity.getPos().X > _user.getPos().X;
					local time = this.Tactical.spawnProjectileEffect(this.Const.ProjectileSprite[this.m.ProjectileType], _user.getTile(), _targetEntity.getTile(), 1.0, this.m.ProjectileTimeScale, this.m.IsProjectileRotated, flip);
					this.Time.scheduleEvent(this.TimeUnit.Virtual, time, this.onScheduledTargetHit, info);

					if (this.m.SoundOnHit.len() != 0)
					{
						this.Time.scheduleEvent(this.TimeUnit.Virtual, time + this.m.SoundOnHitDelay, this.onPlayHitSound.bindenv(this), {
							Sound = this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)],
							Pos = _targetEntity.getPos()
						});
					}
				}
				else
				{
					if (this.m.SoundOnHit.len() != 0)
					{
						this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, _targetEntity.getPos());
					}

					if (this.Tactical.State.getStrategicProperties() != null && this.Tactical.State.getStrategicProperties().IsArenaMode && toHit <= 15)
					{
						this.Sound.play(this.Const.Sound.ArenaShock[this.Math.rand(0, this.Const.Sound.ArenaShock.len() - 1)], this.Const.Sound.Volume.Tactical * this.Const.Sound.Volume.Arena);
					}

					this.onScheduledTargetHit(info);
				}

				return true;
			}
			else
			{
				local distanceToTarget = _user.getTile().getDistanceTo(_targetEntity.getTile());
				_targetEntity.onMissed(_user, this, this.m.IsShieldRelevant && shield != null && r <= toHit + shieldBonus * 2);
				this.m.Container.onTargetMissed(this, _targetEntity);
				local prohibitDiversion = false;

				if (_allowDiversion && this.m.IsRanged && !_user.isPlayerControlled() && this.Math.rand(1, 100) <= 25 && distanceToTarget > 2)
				{
					local targetTile = _targetEntity.getTile();

					for( local i = 0; i < this.Const.Direction.COUNT; i = i )
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
							else if (tile.IsOccupiedByActor && tile.getEntity().isAlliedWith(_user))
							{
								prohibitDiversion = true;
								break;
							}
						}

						i = ++i;
					}
				}

				if (_allowDiversion && this.m.IsRanged && !(this.m.IsShieldRelevant && shield != null && r <= toHit + shieldBonus * 2) && !prohibitDiversion && distanceToTarget > 2)
				{
					this.divertAttack(_user, _targetEntity);
				}
				else if (this.m.IsShieldRelevant && shield != null && r <= toHit + shieldBonus * 2)
				{
					local info = {
						Skill = this,
						User = _user,
						TargetEntity = _targetEntity,
						Shield = shield
					};

					if (this.m.IsShowingProjectile && this.m.ProjectileType != 0)
					{
						local divertTile = _targetEntity.getTile();
						local flip = !this.m.IsProjectileRotated && _targetEntity.getPos().X > _user.getPos().X;
						local time = 0;

						if (_user.getTile().getDistanceTo(divertTile) >= this.Const.Combat.SpawnProjectileMinDist)
						{
							time = this.Tactical.spawnProjectileEffect(this.Const.ProjectileSprite[this.m.ProjectileType], _user.getTile(), divertTile, 1.0, this.m.ProjectileTimeScale, this.m.IsProjectileRotated, flip);
						}

						this.Time.scheduleEvent(this.TimeUnit.Virtual, time, this.onShieldHit, info);
					}
					else
					{
						this.onShieldHit(info);
					}
				}
				else
				{
					if (this.m.SoundOnMiss.len() != 0)
					{
						this.Sound.play(this.m.SoundOnMiss[this.Math.rand(0, this.m.SoundOnMiss.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, _targetEntity.getPos());
					}

					if (this.m.IsShowingProjectile && this.m.ProjectileType != 0)
					{
						local divertTile = _targetEntity.getTile();
						local flip = !this.m.IsProjectileRotated && _targetEntity.getPos().X > _user.getPos().X;

						if (_user.getTile().getDistanceTo(divertTile) >= this.Const.Combat.SpawnProjectileMinDist)
						{
							this.Tactical.spawnProjectileEffect(this.Const.ProjectileSprite[this.m.ProjectileType], _user.getTile(), divertTile, 1.0, this.m.ProjectileTimeScale, this.m.IsProjectileRotated, flip);
						}
					}

					if (this.Tactical.State.getStrategicProperties() != null && this.Tactical.State.getStrategicProperties().IsArenaMode)
					{
						if (toHit >= 90 || _targetEntity.getHitpointsPct() <= 0.1)
						{
							this.Sound.play(this.Const.Sound.ArenaMiss[this.Math.rand(0, this.Const.Sound.ArenaBigMiss.len() - 1)], this.Const.Sound.Volume.Tactical * this.Const.Sound.Volume.Arena);
						}
						else if (this.Math.rand(1, 100) <= 20)
						{
							this.Sound.play(this.Const.Sound.ArenaMiss[this.Math.rand(0, this.Const.Sound.ArenaMiss.len() - 1)], this.Const.Sound.Volume.Tactical * this.Const.Sound.Volume.Arena);
						}
					}
				}

				return false;
			}
		}

		o.onShieldHit = function( _info )
		{
			local shield = _info.Shield;
			local user = _info.User;
			local targetEntity = _info.TargetEntity;
			local damage = this.Math.max(1, this.Math.floor(this.Const.EL_PlayerNPC.EL_ShieldDamage.Base * (1 + user.EL_getCombatLevel() * this.Const.EL_PlayerNPC.EL_ShieldDamage.MultPurCombatLevel)));
			if (_info.Skill.m.SoundOnHitShield.len() != 0)
			{
				this.Sound.play(_info.Skill.m.SoundOnHitShield[this.Math.rand(0, _info.Skill.m.SoundOnHitShield.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, user.getPos());
			}

			// local container_scripts = this.IO.scriptFilenameByHash(shield.ClassNameHash);
			// this.logInfo("Container:" + container_scripts);
			// if(container_scripts == "scripts/items/shields/")
			// {
			shield.applyShieldDamage(damage, _info.Skill.m.SoundOnHitShield.len() == 0);

			if (shield.getCondition() == 0)
			{
				if (!user.isHiddenToPlayer())
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(user) + " has destroyed " + this.Const.UI.getColorizedEntityName(targetEntity) + "\'s shield");
				}
			}
			else
			{
				if (!user.isHiddenToPlayer())
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(user) + " has hit " + this.Const.UI.getColorizedEntityName(targetEntity) + "\'s shield for 1 damage");
				}

				// if (!this.Tactical.getNavigator().isTravelling(targetEntity))
				// {
				// 	this.Tactical.getShaker().shake(targetEntity, user.getTile(), 2, this.Const.Combat.ShakeEffectSplitShieldColor, this.Const.Combat.ShakeEffectSplitShieldHighlight, this.Const.Combat.ShakeEffectSplitShieldFactor, 1.0, [
				// 		"shield_icon"
				// 	], 1.0);
				// }
			}

			_info.TargetEntity.getItems().onShieldHit(_info.User, this);
			//}
		}

		o.getHitchance = function( _targetEntity )
		{

			if (!_targetEntity.isAttackable() && !_targetEntity.isRock() && !_targetEntity.isTree() && !_targetEntity.isBush() && !_targetEntity.isSupplies())
			{
				return 0;
			}

			local user = this.m.Container.getActor();
			local properties = this.m.Container.buildPropertiesForUse(this, _targetEntity);

			if (!this.isUsingHitchance())
			{
				return 100;
			}

			local allowDiversion = this.m.IsRanged && this.m.MaxRangeBonus > 1;
			local defenderProperties = _targetEntity.getSkills().buildPropertiesForDefense(user, this);
			local skill = this.m.IsRanged ? properties.RangedSkill * properties.RangedSkillMult : properties.MeleeSkill * properties.MeleeSkillMult;
			local defense = _targetEntity.getDefense(user, this, defenderProperties);
			local levelDifference = _targetEntity.getTile().Level - user.getTile().Level;
			local distanceToTarget = user.getTile().getDistanceTo(_targetEntity.getTile());
			local toHit = skill - defense;

			if (this.m.IsRanged)
			{
				toHit = toHit + (distanceToTarget - this.m.MinRange) * properties.HitChanceAdditionalWithEachTile * properties.HitChanceWithEachTileMult;
			}

			if (levelDifference < 0)
			{
				toHit = toHit + this.Const.Combat.LevelDifferenceToHitBonus;
			}
			else
			{
				toHit = toHit + this.Const.Combat.LevelDifferenceToHitMalus * levelDifference;
			}

			if (!this.m.IsShieldRelevant)
			{
				local shield = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

				if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
				{
					local shieldBonus = (this.m.IsRanged ? shield.getRangedDefense() : shield.getMeleeDefense()) * (_targetEntity.getCurrentProperties().IsSpecializedInShields ? 1.25 : 1.0);
					toHit = toHit + shieldBonus;

					if (!this.m.IsShieldwallRelevant && _targetEntity.getSkills().hasSkill("effects.shieldwall"))
					{
						toHit = toHit + shieldBonus;
					}
				}
			}

			toHit = toHit * properties.TotalAttackToHitMult;
			toHit = toHit + this.Math.max(0, 100 - toHit) * (1.0 - defenderProperties.TotalDefenseToHitMult);
			local userTile = user.getTile();

			if (allowDiversion && this.m.IsRanged && userTile.getDistanceTo(_targetEntity.getTile()) > 1)
			{
				local blockedTiles = this.Const.Tactical.Common.getBlockedTiles(userTile, _targetEntity.getTile(), user.getFaction(), true);

				if (blockedTiles.len() != 0)
				{
					local blockChance = this.Const.Combat.RangedAttackBlockedChance * properties.RangedAttackBlockedChanceMult;
					toHit = this.Math.floor(toHit * (1.0 - blockChance));
				}
			}

			local EL_combat_level_extra_chance = (user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()) * this.Math.pow(1.08, this.Math.abs(user.EL_getCombatLevel() - _targetEntity.EL_getCombatLevel()));

			toHit += EL_combat_level_extra_chance;
			//this.logInfo("getHitchance combat level extra hit chance" + EL_combat_level_extra_chance);
			return this.Math.max(5, this.Math.min(95, toHit));
		}

		o.applyFatigueDamage = function( _targetEntity, _damage )
		{
			local user = this.m.Container.getActor();
			local defenderProperties = _targetEntity.getSkills().buildPropertiesForDefense(user, this);
			local damage_mult = 1;
			if(user.EL_getCombatLevel() > defenderProperties.EL_CombatLevel) {
				damage_mult *= this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.DamageFactor, user.EL_getCombatLevel() - defenderProperties.EL_CombatLevel);
			}
			else {
				damage_mult /= this.Math.pow(this.Const.EL_PlayerNPC.EL_CombatLevel.DamageFactor, defenderProperties.EL_CombatLevel - user.EL_getCombatLevel());
			}
			_targetEntity.setFatigue(_targetEntity.getFatigue() + _damage * defenderProperties.FatigueEffectMult * damage_mult);

		}


	});

});
