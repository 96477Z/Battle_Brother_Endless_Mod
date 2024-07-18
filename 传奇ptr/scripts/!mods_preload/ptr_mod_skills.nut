local gt = this.getroottable();

gt.PTR.modSkills <- function()
{
	::mods_hookExactClass("skills/actives/footwork", function(o) {
		local onAfterUpdate = o.onAfterUpdate;
		o.onAfterUpdate = function( _properties )
		{
			this.m.FatigueCost = 10;
			local fat = this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]) * -1;
			this.m.FatigueCost = ::Math.min(20, this.m.FatigueCost + fat);
			onAfterUpdate(_properties);
		}
	});

	::mods_hookExactClass("skills/perks/perk_nimble", function(o) {
		o.isHidden = function()
		{
			return (::Math.floor(this.getReductionChance(0.4) * 100) >= 100) && (::Math.floor(this.getReductionChance(0.6) * 100) >= 100);
		}

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			local chanceMin = ::Math.round(this.getReductionChance(0.4) * 100);
			local chanceMax = ::Math.round(this.getReductionChance(0.6) * 100);

			if (chanceMin >= 100 && chanceMax >= 100)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/tooltips/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy to gain any benefit from being nimble[/color]"
				});
			}
			else
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage to hitpoints from attacks is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + (100-chanceMin) + "%[/color] to [color=" + this.Const.UI.Color.PositiveValue + "]" + (100-chanceMax) + "%[/color]"
				});
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage to armor from attacks is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + ((100-chanceMin)/2) + "%[/color] to [color=" + this.Const.UI.Color.PositiveValue + "]" + ((100-chanceMax)/2) + "%[/color]"
				});
			}

			return tooltip;
		}

		o.getReductionChance <- function( _reduction )
		{
			local fat = 0;
			local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (body != null)
			{
				fat = fat + body.getStaminaModifier();
			}

			if (head != null)
			{
				fat = fat + head.getStaminaModifier();
			}

			fat = this.Math.min(0, fat + 15);
			return this.Math.minf(1.0, 1.0 - _reduction + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
		}

		function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
		{
			if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
			{
				return;
			}

			local reduction = ::MSU.Math.randf(0.4, 0.6);
			_properties.DamageReceivedRegularMult *= this.getReductionChance(reduction);
			_properties.DamageReceivedArmorMult *= this.getReductionChance(reduction/2);
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_lithe", function(o) {
		o.isHidden <- function()
		{
			return this.getContainer().hasSkill("perk.nimble") || (::Math.floor(this.getHitpointsDamageReduction() * 100) >= 100 && ::Math.floor(this.getArmorDamageReduction() * 100) >= 100);
		}

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			local hpBonus = ::Math.round(this.getHitpointsDamageReduction() * 100);
			if (hpBonus < 100)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage to hitpoints from attacks is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + (100-hpBonus) + "%[/color]"
				});
			}
			local armorBonus = ::Math.round(this.getArmorDamageReduction() * 100);
			if (armorBonus < 100)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Damage to armor from attacks is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]" + (100-armorBonus) + "%[/color]"
				});
			}

			if (hpBonus >= 100 && armorBonus >= 100)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/tooltips/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy to gain any benefit from being lithe[/color]"
				});
			}

			return tooltip;
		}

		o.getHitpointsDamageReduction <- function()
		{
			local fat = this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]);
			fat = ::Math.min(0, fat + 35);
			return ::Math.minf(1.0, 1.0 - 0.3 + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
		}

		o.getArmorDamageReduction <- function()
		{
			local fat = this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]);
			fat = ::Math.min(0, fat + 35);
			return ::Math.minf(1.0, 1.0 - 0.15 + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
		}

		function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
		{
			if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
			{
				return;
			}

			if (this.getContainer().hasSkill("perk.nimble")) return;

			_properties.DamageReceivedRegularMult *= this.getHitpointsDamageReduction();
			_properties.DamageReceivedArmorMult *= this.getArmorDamageReduction();
		}
	});

	::mods_hookNewObject("skills/perks/perk_legend_balance", function(o) {
		o.m.Description = "%name% gains increased speed and endurance by balancing their armor and mobility.";

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			local initBonus = this.getInitiativeBonus()
			if (initBonus > 0)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + initBonus + "[/color] Initiative"
				});
			}
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Initiative loss due to built Fatigue is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color]"
			});

			return tooltip;
		}

		o.getInitiativeBonus <- function()
		{
			return ::Math.floor(this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]) * -1 * 0.3);
		}

		o.onUpdate = function( _properties )
		{
			_properties.FatigueToInitiativeRate *= 0.5;
			_properties.Initiative += this.getInitiativeBonus();
		}

		o.onAfterUpdate = function( _properties )
		{
			// overwrite original function
		}
	});

	::mods_hookExactClass("skills/actives/root_skill", function(o) {
		o.m.Cooldown <- 0;
		o.onTurnStart <- function()
		{
			this.m.Cooldown = ::Math.max(0, this.m.Cooldown - 1);
		}

		local isUsable = o.isUsable;
		o.isUsable = function()
		{
			return isUsable() && (this.getContainer().getActor().isPlayerControlled() || this.m.Cooldown == 0);
		}

		local onUse = o.onUse;
		o.onUse = function( _user, _targetTile )
		{
			local ret = onUse(_user, _targetTile);
			this.m.Cooldown = 3;
			return ret;
		}
	});
	
	::mods_hookExactClass("skills/actives/line_breaker", function(o) {
		o.findTileToKnockBackTo = function( _userTile, _targetTile )
		{
			local getValidTileInDir = function( _dir )
			{
				if (_targetTile.hasNextTile(_dir))
				{
					local tile = _targetTile.getNextTile(_dir);
					if (tile.IsEmpty && (tile.Level <= _targetTile.Level || tile.Level - _targetTile.Level == 1))
					{
						return tile;
					}
				}

				return null;			
			}

			local dir = _userTile.getDirectionTo(_targetTile);
			local knockToTile = getValidTileInDir(dir);

			if (knockToTile != null) return knockToTile;

			local altdir = dir - 1 >= 0 ? dir - 1 : 5;
			knockToTile = getValidTileInDir(altdir);

			if (knockToTile != null) return knockToTile;

			altdir = dir + 1 <= 5 ? dir + 1 : 0;
			knockToTile = getValidTileInDir(altdir);
			
			if (knockToTile != null) return knockToTile;

			return null;
		}
	});
	
	::mods_hookExactClass("skills/traits/huge_trait", function(o) {
		o.m.SkillOrder <- this.Const.SkillOrder.Last;
		o.m.Skills <- [];

		local getTooltip = o.getTooltip;
		o.getTooltip = function()
		{
			local tooltip = getTooltip();
			tooltip.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Weapons with extra Fatigue build-up on skills have this penalty reduced by [color=" + this.Const.UI.Color.PositiveValue + "]-2[/color]"
			});

			return tooltip;
		}

		o.onAfterUpdate <- function( _properties )
		{
			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon != null)
			{
				local skills = weapon.getSkills();
				if (skills.len() == 0)
				{
					this.m.Skills.clear();
					return;
				}

				if (weapon.m.FatigueOnSkillUse > 0)
				{
					foreach (skill in skills)
					{
						if (this.m.Skills.find(skill.getID()) == null)
						{
							this.m.Skills.push(skill.getID());
							skill.m.FatigueCost -= this.Math.min(2, weapon.m.FatigueOnSkillUse);
						}
					}
				}
			}
		}

		o.onRemoved <- function()
		{
			local equippedItem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if (equippedItem != null)
			{
				this.getContainer().getActor().getItems().unequip(equippedItem);
				this.getContainer().getActor().getItems().equip(equippedItem);
			}
		}
	});
	
	::mods_hookExactClass("skills/actives/legend_fortify_skill", function(o) {
		o.onAfterUpdate <- function( _properties )
		{
			if (!::Tactical.isActive()) return;
			local actor = this.getContainer().getActor();
			if (actor.isPlacedOnMap())
			{
				local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 2)
				foreach (ally in adjacentAllies)
				{
					if (ally.getID() == actor.getID()) continue;

					if (ally.getSkills().hasSkill("perk.legend_shields_up"))
					{
						this.m.ActionPointCost = this.Math.max(this.m.ActionPointCost * 0.5, 2);
						this.m.FatigueCostMult *= 0.5;
						return;
					}
				}
			}
		}
	});
	
	::mods_hookExactClass("skills/actives/shieldwall", function(o) {
		o.onAfterUpdate <- function( _properties )
		{
			if (!::Tactical.isActive()) return;
			local actor = this.getContainer().getActor();
			if (actor.isPlacedOnMap())
			{
				local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 2)
				foreach (ally in adjacentAllies)
				{
					if (ally.getID() == actor.getID()) continue;

					if (ally.getSkills().hasSkill("perk.legend_shields_up"))
					{
						this.m.ActionPointCost = this.Math.max(this.m.ActionPointCost * 0.5, 2);
						this.m.FatigueCostMult *= 0.5;
						return;
					}
				}
			}
		}

		o.onTurnStart <- function()
		{
			local actor = this.getContainer().getActor();
			if (actor.getCurrentProperties().IsStunned || actor.getMoraleState() == this.Const.MoraleState.Fleeing || this.getContainer().hasSkill("effects.shieldwall"))
			{
				return;
			}

			local hasPerk = this.getContainer().hasSkill("perk.legend_shields_up");
			local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 1);
			foreach (ally in adjacentAllies)
			{
				if (ally.getID() == actor.getID()) continue;

				if (this.Math.abs(ally.getTile().Level - actor.getTile().Level) <= 1 && ally.getSkills().hasSkill("actives.shieldwall") && (hasPerk || ally.getSkills().hasSkill("perk.legend_shields_up")))
				{
					this.getContainer().add(this.new("scripts/skills/effects/shieldwall_effect"));					
					this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, actor.getPos());
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " uses Shieldwall due to " + this.Const.UI.getColorizedEntityName(hasPerk ? actor : ally) + "\'s Shields Up perk");
					return;
				}
			}
		}

		o.onTurnEnd <- function()
		{
			local actor = this.getContainer().getActor();
			if (actor.getCurrentProperties().IsStunned || actor.getMoraleState() == this.Const.MoraleState.Fleeing || this.getContainer().hasSkill("effects.shieldwall"))
			{
				return;
			}
			
			local hasPerk = this.getContainer().hasSkill("perk.legend_shields_up");
			local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 1);
			foreach (ally in adjacentAllies)
			{
				if (ally.getID() == actor.getID()) continue;

				if (this.Math.abs(ally.getTile().Level - actor.getTile().Level) <= 1 && ally.getSkills().hasSkill("actives.shieldwall") && (hasPerk || ally.getSkills().hasSkill("perk.legend_shields_up")))
				{
					this.getContainer().add(this.new("scripts/skills/effects/shieldwall_effect"));					
					this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, actor.getPos());
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " uses Shieldwall due to " + this.Const.UI.getColorizedEntityName(hasPerk ? actor : ally) + "\'s Shields Up perk");
					return;
				}
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_shields_up", function(o) {
		o.onCombatStarted = function()
		{
			local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());
			foreach (ally in allies)
			{
				local skill = ally.getSkills().getSkillByID("actives.shieldwall");
				if (skill != null)
				{
					ally.getSkills().add(this.new("scripts/skills/effects/shieldwall_effect"));
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(ally) + " uses Shieldwall due to " + this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + "\'s Shields Up perk");
				}
			}
		}
	});

	::mods_hookExactClass("skills/effects/disarmed_effect", function(o) {
		o.onUpdate = function( _properties )
		{
			local actor = this.getContainer().getActor();
			local weapon = actor.getMainhandItem();
			if (weapon != null && weapon.getInstanceID() != this.m.WeaponID)
			{
				this.removeSelf();
				return;
			}

			if (!actor.getCurrentProperties().IsImmuneToDisarm)
			{
				if (this.m.TurnsLeft != 0)
				{
					_properties.IsAbleToUseWeaponSkills = false;
					actor.getSprite("arms_icon").Visible = false;

					if (!this.getContainer().hasSkill("effects.stunned") && actor.hasSprite("status_stunned"))
					{
						actor.getSprite("status_stunned").setBrush("bust_disarmed");
						actor.getSprite("status_stunned").Visible = true;
					}

					actor.setDirty(true);
				}
				else
				{
					actor.getSprite("arms_icon").Visible = true;

					if (!this.getContainer().hasSkill("effects.stunned") && actor.hasSprite("status_stunned"))
					{
						actor.getSprite("status_stunned").Visible = false;
					}

					actor.setDirty(true);
				}
			}
			else
			{
				this.removeSelf();
			}
		}
	});

	::mods_hookExactClass("skills/actives/legend_hold_the_line", function(o) {
		o.getTooltip = function()
		{
			local tooltip = this.skill.getDefaultUtilityTooltip();
			tooltip.extend([
				{
					id = 6,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "Gain [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Defense"
				},
				{
					id = 6,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "Receive only [color=" + this.Const.UI.Color.PositiveValue + "]90%[/color] of any damage"
				}
			]);

			return tooltip;
		}

		o.onAdded <- function()
		{
			local actor = this.getContainer().getActor();
			if (actor.isPlayerControlled())
			{
				return;
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.LegendHoldTheLine) == null)
			{
				agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_legend_hold_the_line"));
				agent.finalizeBehaviors();
			}
		}
	});

	::mods_hookExactClass("skills/effects/legend_holding_the_line", function(o) {
		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			tooltip.extend([
				{
					id = 6,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Defense"
				},
				{
					id = 6,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "Receive only [color=" + this.Const.UI.Color.PositiveValue + "]90%[/color] of any damage"
				}
			]);

			return tooltip;
		}

		o.onUpdate = function( _properties )
		{
			_properties.MeleeDefense += 10;
			_properties.DamageReceivedTotalMult *= 0.9;
		}
	});
	
	::mods_hookExactClass("skills/perks/perk_legend_specialist_staff_skill", function(o) {
		o.onUpdate = function( _properties )
		{
			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon != null)
			{
				if (weapon.isWeaponType(this.Const.Items.WeaponType.Staff))
				{
					_properties.MeleeDefense += 16;
				}
				else if(weapon.isWeaponType(this.Const.Items.WeaponType.Musical))
				{
					_properties.MeleeDefense += 8;	
				}
			}
		}
	});

	::mods_hookExactClass("skills/actives/lunge_skill", function(o) {
		o.isDuelistValid <- function()
		{
			return this.b.ActionPointCost <= 4;
		}
	});

	::mods_hookExactClass("skills/actives/sprint_skill_5", function(o) {
		local getTooltip = o.getTooltip;
		o.getTooltip = function()
		{
			local tooltip = getTooltip();
			if (this.getContainer().hasSkill("effects.perfect_focus"))
			{
				tooltip.push({
					id = 11,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "Not usable when under the effects of Perfect Focus"
				});
			}

			return tooltip;
		}

		local isUsable = o.isUsable;
		o.isUsable = function()
		{
			local ret = isUsable();
			if (ret && this.getContainer().hasSkill("effects.perfect_focus"))
			{
				ret = false;
			}

			return ret;
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_hair_splitter", function(o) {
		o.onUpdate = function( _properties )
		{
			_properties.HitChance[this.Const.BodyPart.Head] += 10;
		}
	});	

	::mods_hookExactClass("skills/perks/perk_inspiring_presence", function(o) {
		o.m.IsForceEnabled <- false;

		o.isEnabled <- function()
		{
			if (this.m.IsForceEnabled)
			{
				return true;
			}

			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon != null && weapon.getID().find("banner") != null)
			{
				return true;
			}

			return false;
		}

		// Overwrite the Legends functions to be empty.
		o.onCombatStarted = function()
		{
		}

		o.onUpdate = function( _properties )
		{			
		}
	});

	::mods_hookNewObject("skills/perks/perk_vengeance", function(o) {
		o.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		o.m.Description = "This character hits harder after having received hits.";
		o.m.Stacks <- 0;

		o.isHidden <- function()
		{
			return this.m.Stacks == 0;
		}

		o.getTooltip <- function()
		{
			local tooltip = this.skill.getTooltip();
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/damage_dealt.png",
				text = "Damage increased by [color=" + this.Const.UI.Color.NegativeValue + "]" + (this.m.Stacks * 25) + "%[/color]"
			});

			return tooltip;
		}

		o.onBeforeDamageReceived = function( _attacker, _skill, _hitInfo, _properties )
		{
			this.m.Stacks++;
		}

		o.onAnySkillExecuted <- function( _skill, _targetTile, _targetEntity, _forFree )
		{
			if (_skill.isAttack())
			{
				this.m.Stacks = 0;
			}
		}

		o.onUpdate <- function( _properties )
		{
			_properties.DamageTotalMult *= 1.0 + 25 * this.m.Stacks * 0.01;
		}

		o.onTurnEnd <- function()
		{
			this.m.Stacks = 0;
		}

		o.onCombatStarted <- function()
		{
			this.m.Stacks = 0;
		}

		o.onCombatFinished <- function()
		{
			this.skill.onCombatFinished();
			this.m.Stacks = 0;
		}
	});

	::mods_hookExactClass("skills/perks/perk_sundering_strikes", function(o) {
		o.onUpdate = function ( _properties )
		{
			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon == null)
			{
				_properties.DamageArmorMult += 0.2;
			}
			else
			{
				_properties.DamageArmorMult += weapon.getArmorDamageMult() / 5;
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_underdog", function(o) {
		o.onUpdate = function( _properties )
		{
			if (!this.getContainer().hasSkill("perk.legend_battleheart"))
			{
				_properties.SurroundedDefense += 3;
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_battleheart", function(o) {
		o.onUpdate = function( _properties )
		{
			_properties.SurroundedDefense += 5;
		}
	});

	::mods_hookExactClass("skills/effects/legend_baffled_effect", function(o) {
		o.onAdded = function()
		{
			this.m.TurnsLeft = this.Math.max(1, 1 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
		}

		o.onRefresh = function()
		{
			this.m.TurnsLeft = this.Math.max(1, 1 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
			this.spawnIcon("status_effect_87", this.getContainer().getActor().getTile());
		}
	});

	::mods_hookExactClass("skills/perks/perk_overwhelm", function(o) {
		local onTargetHit = o.onTargetHit;
		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			if (!_skill.isRanged())
			{
				onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor);
			}
		}

		local onTargetMissed = o.onTargetMissed;
		o.onTargetMissed = function( _skill, _targetEntity )
		{
			if (!_skill.isRanged())
			{
				onTargetMissed(_skill, _targetEntity);
			}
		}
	});

	::mods_hookExactClass("skills/effects/overwhelmed_effect", function(o) {
		o.getTooltip = function()
		{
			return [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 2,
					type = "description",
					text = this.getDescription()
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + (this.m.Count * 10) + "%[/color] Melee Skill"
				},
				{
					id = 11,
					type = "text",
					icon = "ui/icons/ranged_skill.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + (this.m.Count * 10) + "%[/color] Ranged Skill"
				}
			];
		}

		o.onUpdate = function( _properties )
		{
			_properties.MeleeSkillMult = this.Math.maxf(0.0, _properties.MeleeSkillMult - 0.1 * this.m.Count);
			_properties.RangedSkillMult = this.Math.maxf(0.0, _properties.RangedSkillMult - 0.1 * this.m.Count);
		}

		local onRefresh  = o.onRefresh;
		o.onRefresh = function()
		{
			onRefresh();
			this.m.Count = this.Math.min(this.m.Count, 7);
		}
	});

	::mods_hookExactClass("skills/effects/indomitable_effect", function(o) {
		local getTooltip = o.getTooltip;
		o.getTooltip = function()
		{
			local tooltip = getTooltip();
			tooltip.push(
				{
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Immune to being Culled"
				}
			);

			return tooltip;
		}		
	});
	
	::mods_hookExactClass("skills/actives/lunge_skill", function(o) {
		local onAdded = ::mods_getMember(o, "onAdded");
		::mods_override(o, "onAdded", function(o) {
			onAdded();
			if (!this.getContainer().getActor().isPlayerControlled())
			{
				local weapon = this.getContainer().getActor().getMainhandItem();
				if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.BFFencing))
				{
					this.getContainer().add(this.new("scripts/skills/perks/perk_bf_fencer"));
				}
			}			
		});		
	});

	::mods_hookExactClass("skills/perks/perk_legend_muscularity", function(o) {
		local onUpdate = o.onUpdate;
		o.onUpdate = function( _properties )
		{
			// Overwrite base function
		}

		o.onAnySkillUsed <- function( _skill, _targetEntity, _properties )
		{
			local item = _skill.getItem();
			if (!_skill.isRanged() || (item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Throwing)))
			{
				local hp = this.getContainer().getActor().getHitpoints();
				local bonus = _skill.b.ActionPointCost <= 4 ? this.Math.min(50, this.Math.floor(hp * 0.075)) : this.Math.min(50, this.Math.floor(hp * 0.15));
				_properties.DamageRegularMin += bonus;
				_properties.DamageRegularMax += bonus;
			}
		}
	});
	
	::mods_hookExactClass("skills/actives/cascade_skill", function(o) {
		o.m.RerollDamageMult <- 1.0;
		o.m.IsAttacking <- false;	

		o.onUse = function( _user, _targetTile )
		{
			this.m.RerollDamageMult = 1.0;			
			this.m.IsUsingHitchance = true;

			this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectChop);
			local target = _targetTile.getEntity();

			local hitChance = this.getHitchance(target);						
			for (local i = 0; i < 2; i++)
			{				
				local roll = this.Math.rand(1, 100);
				if (roll <= hitChance)
				{
					this.m.IsUsingHitchance = false;
					break;
				}

				this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and misses " + this.Const.UI.getColorizedEntityName(target) + " (Chance: " + hitChance + ", Rolled: " + roll + ")");

				this.m.RerollDamageMult -= 0.33;
			}

			this.m.IsAttacking = true;
			local ret = this.attackEntity(_user, target);
			this.m.IsAttacking = false;
			this.m.IsUsingHitchance = true;
			return ret;
		}

		// Set IsUsingHitChance to true before target hit so that the Nimble perk works properly
		o.onBeforeTargetHit <- function( _skill, _targetEntity, _hitInfo )
		{
			this.m.IsUsingHitchance = true;
		}

		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			if (_skill == this && this.m.IsAttacking)
			{
				_properties.DamageTotalMult *= this.m.RerollDamageMult;				
			}
		}
	});

	::mods_hookExactClass("skills/actives/hail_skill", function(o) {
		o.m.RerollDamageMult <- 1.0;
		o.m.IsAttacking <- false;	

		o.onUse = function( _user, _targetTile )
		{
			this.m.RerollDamageMult = 1.0;			
			this.m.IsUsingHitchance = true;

			this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectChop);
			local target = _targetTile.getEntity();

			local hitChance = this.getHitchance(target);						
			for (local i = 0; i < 2; i++)
			{				
				local roll = this.Math.rand(1, 100);
				if (roll <= hitChance)
				{
					this.m.IsUsingHitchance = false;
					break;
				}

				this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_user) + " uses " + this.getName() + " and misses " + this.Const.UI.getColorizedEntityName(target) + " (Chance: " + hitChance + ", Rolled: " + roll + ")");

				this.m.RerollDamageMult -= 0.33;
			}

			this.m.IsAttacking = true;
			local ret = this.attackEntity(_user, target);
			this.m.IsAttacking = false;
			this.m.IsUsingHitchance = true;
			return ret;
		}

		// Set IsUsingHitChance to true before target hit so that the Nimble perk works properly
		o.onBeforeTargetHit <- function( _skill, _targetEntity, _hitInfo )
		{
			this.m.IsUsingHitchance = true;
		}

		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			if (_skill == this)
			{
				_properties.HitChance[this.Const.BodyPart.Head] += 100.0;

				if (this.m.IsAttacking)
				{
					_properties.DamageTotalMult *= this.m.RerollDamageMult;		
				}
			}
		}
	});

	local shieldWallRelated = [
		"skills/actives/legend_fortify_skill",
		"skills/actives/shieldwall",
		"skills/effects/shieldwall_effect",
		"skills/effects/legend_fortify_effect"
	];

	foreach (skill in shieldWallRelated)
	{
		::mods_hookExactClass(skill, function(o) {
			local getTooltip = o.getTooltip;
			o.getTooltip = function()
			{
				local tooltip = getTooltip();
				tooltip.push(
					{
						id = 6,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Grants immunity to stun, but is removed upon receiving a stunning blow"
					}
				);

				return tooltip;
			}
		});
	}	

	::mods_hookExactClass("skills/effects/stunned_effect", function(o) {
		local setTurns = o.setTurns;
		o.setTurns = function( _t )
		{
			if (!this.isGarbage())
			{
				setTurns(_t);
			}
		}

		local onAdded = o.onAdded;
		o.onAdded = function()
		{
			local skill = this.getContainer().getSkillByID("effects.shieldwall");

			if (skill == null)
			{
				skill = this.getContainer().getSkillByID("effects.legend_fortify");
			}

			if (skill != null)
			{
				if (this.getContainer().getActor().getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " shakes off the stun but loses " + skill.getName());
				}
				skill.removeSelf();
				this.removeSelf();
				return;
			}		

			onAdded();
		}
	});

	::mods_hookExactClass("skills/actives/return_favor", function(o) {
		o.getTooltip = function()
		{
			local tooltip = this.skill.getDefaultUtilityTooltip();
			tooltip.extend([
				{
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Until this character\'s next turn, any attacker within this character\'s attack range who misses a melee attack against this character will have a:"
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] chance to be Stunned"
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] chance to be Dazed"
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]75%[/color] chance to be Staggered"
				}
			]);

			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon != null && !weapon.isItemType(::Const.Items.ItemType.MeleeWeapon))
			{
				tooltip.push({
					id = 7,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires being unarmed or armed with a melee weapon[/color]"
				});
			}

			return tooltip;
		}

		local isUsable = o.isUsable;
		o.isUsable = function()
		{
			local ret = isUsable();
			if (ret)
			{
				local weapon = this.getContainer().getActor().getMainhandItem();
				if (weapon != null && !weapon.isItemType(::Const.Items.ItemType.MeleeWeapon)) return false;
			}
			return ret;
		}
	});

	::mods_hookExactClass("skills/effects/return_favor_effect", function(o) {
		o.getTooltip = function()
		{
			local tooltip = this.skill.getDefaultTooltip();
			tooltip.extend([
				{
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Any attacker who misses a melee attack against this character has a:"
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] chance to be Stunned"
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] chance to be Dazed"
				},
				{
					id = 7,
					type = "text",
					icon = "ui/icons/initiative.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]75%[/color] chance to be Staggered"
				}
			]);

			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon != null && !weapon.isItemType(::Const.Items.ItemType.MeleeWeapon))
			{
				tooltip.push({
					id = 7,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires being unarmed or armed with a melee weapon[/color]"
				});
			}

			return tooltip;
		}

		o.onMissed = function( _attacker, _skill )
		{
			if (!_skill.isRanged())
			{
				local actor = this.getContainer().getActor();
				local weapon = actor.getMainhandItem();
				if (weapon != null && !weapon.isItemType(::Const.Items.ItemType.MeleeWeapon)) return;

				local distance = _attacker.getTile().getDistanceTo(actor.getTile());
				if (distance == 1 || (weapon != null && weapon.getRangeMax() >= distance))
				{
					local r = ::Math.rand(1, 100);

					if (r <= 10 && !_attacker.getCurrentProperties().IsImmuneToStun)
					{
						local effect = ::new("scripts/skills/effects/stunned_effect");
						effect.addTurns(1);
						_attacker.getSkills().add(effect);
						if (!actor.isHiddenToPlayer() && _attacker.getTile().IsVisibleForPlayer)
						{
							::Tactical.EventLog.log(::Const.UI.getColorizedEntityName(actor) + " has stunned " + this.Const.UI.getColorizedEntityName(_attacker) + " for one turn");
						}
					}
					else if (r <= 50)
					{
						_attacker.getSkills().add(::new("scripts/skills/effects/dazed_effect"));
						if (!actor.isHiddenToPlayer() && _attacker.getTile().IsVisibleForPlayer)
						{
							::Tactical.EventLog.log(::Const.UI.getColorizedEntityName(actor) + " has dazed " + this.Const.UI.getColorizedEntityName(_attacker) + " for one turn");
						}
					}
					else if (r <= 75)
					{
						_attacker.getSkills().add(::new("scripts/skills/effects/staggered_effect"));
						if (!actor.isHiddenToPlayer() && _attacker.getTile().IsVisibleForPlayer)
						{
							::Tactical.EventLog.log(::Const.UI.getColorizedEntityName(actor) + " has staggered " + this.Const.UI.getColorizedEntityName(_attacker) + " for one turn");
						}
					}
				}
			}
		}
	});

	::mods_hookExactClass("skills/actives/knock_back", function(o) {
		local getTooltip = o.getTooltip;
		o.getTooltip = function()
		{
			local ret = getTooltip();
			if (this.getContainer().hasSkill("perk.shield_expert"))
			{
				ret.push({
					id = 7,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Will stagger the target if successfully knocked back"
				});
			}

			return ret;
		}

		local onUse = o.onUse;
		o.onUse = function( _user, _targetTile )
		{
			local targetEntity = _targetTile.getEntity();
			local ret = onUse( _user, _targetTile );

			if (ret && targetEntity != null && targetEntity.isAlive() && !targetEntity.isDying() && this.getContainer().hasSkill("perk.shield_expert"))
			{
				local effect = this.new("scripts/skills/effects/staggered_effect");
				targetEntity.getSkills().add(effect);
				if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has staggered " + this.Const.UI.getColorizedEntityName(targetEntity) + " for " + effect.m.TurnsLeft + " turns");
				}
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_tumble", function(o) {
		local onAfterUpdate = o.onAfterUpdate;
		o.onAfterUpdate = function(_properties)
		{
			local lunge = this.getContainer().getSkillByID("actives.lunge");
			if (lunge == null)
			{
				onAfterUpdate(_properties);
				return;
			}

			local APCostBefore = lunge.m.ActionPointCost;

			onAfterUpdate(_properties);
			
			lunge.m.ActionPointCost = APCostBefore;
		}
	});

	::mods_hookExactClass("skills/actives/fire_handgonne_skill", function(o) {
		o.getAffectedTiles = function( _targetTile )
		{
			local ret = [
				_targetTile
			];
			local ownTile = this.m.Container.getActor().getTile();
			local dir = ownTile.getDirectionTo(_targetTile);
			local dist = ownTile.getDistanceTo(_targetTile);
			local isTakingAim = this.getContainer().hasSkill("effects.ptr_take_aim");

			if (_targetTile.hasNextTile(dir))
			{
				local forwardTile = _targetTile.getNextTile(dir);

				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					ret.push(forwardTile);
				}

				if (dist < 3 && isTakingAim)
				{
					if (forwardTile.hasNextTile(dir))
					{
						forwardTile = forwardTile.getNextTile(dir);

						if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
						{
							ret.push(forwardTile);
						}
					}
				}
			}

			local left = dir - 1 < 0 ? 5 : dir - 1;

			if (_targetTile.hasNextTile(left))
			{
				local forwardTile = _targetTile.getNextTile(left);

				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					ret.push(forwardTile);
				}

				if (forwardTile.hasNextTile(dir))
				{
					forwardTile = forwardTile.getNextTile(dir);

					if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
					{
						ret.push(forwardTile);
					}
				}

				if (dist < 3 && isTakingAim)
				{
					if (forwardTile.hasNextTile(dir))
					{
						forwardTile = forwardTile.getNextTile(dir);

						if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
						{
							ret.push(forwardTile);
						}
					}
				}
			}

			local right = dir + 1 > 5 ? 0 : dir + 1;

			if (_targetTile.hasNextTile(right))
			{
				local forwardTile = _targetTile.getNextTile(right);

				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					ret.push(forwardTile);
				}

				if (forwardTile.hasNextTile(dir))
				{
					forwardTile = forwardTile.getNextTile(dir);

					if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
					{
						ret.push(forwardTile);
					}
				}

				if (dist < 3 && isTakingAim)
				{
					if (forwardTile.hasNextTile(dir))
					{
						forwardTile = forwardTile.getNextTile(dir);

						if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
						{
							ret.push(forwardTile);
						}
					}
				}
			}

			return ret;
		}
	});

	::mods_hookExactClass("skills/actives/legend_relax", function(o) {
		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			tooltip.push(
					{
						id = 7,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Doubles the Fatigue Recovery of the target on their next turn"
					}
			);

			tooltip.push(
					{
						id = 7,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Cannot be used on the same target two turns in a row"
					}
			);

			if (this.getContainer().getActor().isEngagedInMelee())
			{
				tooltip.push(
						{
							id = 7,
							type = "text",
							icon = "ui/icons/warning.png",
							text = "Not usable when engaged in melee"
						}
				);
			}

			return tooltip;
		}

		o.isUsable <- function()
		{
			return this.skill.isUsable() && !this.getContainer().getActor().isEngagedInMelee();
		}

		local onVerifyTarget = o.onVerifyTarget;
		o.onVerifyTarget = function( _originTile, _targetTile )
		{
			local ret = onVerifyTarget( _originTile, _targetTile );

			if (ret)
			{
				local target = _targetTile.getEntity();
				if (target == null || target.isEngagedInMelee() || target.getSkills().hasSkill("effects.ptr_relaxed"))
				{
					return false;
				}
			}

			return ret;
		}

		o.onUse = function( _user, _targetTile )
		{
			local target = _targetTile.getEntity();
			target.getSkills().add(this.new("scripts/skills/effects/ptr_relaxed_effect"));

			if (!target.isHiddenToPlayer())
			{
				target.playSound(this.Const.Sound.ActorEvent.Fatigue, this.Const.Sound.Volume.Actor * target.getSoundVolume(this.Const.Sound.ActorEvent.Fatigue));
			}

			return true;
		}
	});

	::mods_hookExactClass("skills/perks/perk_double_strike", function(o) {
		local onTargetHit = o.onTargetHit;
		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			if (_skill == null || !_skill.isAttack() || _skill.isRanged())
			{
				return;
			}

			onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor );
		}
	});

	::mods_hookExactClass("skills/actives/throw_spear_skill", function(o) {
		o.m.ShieldDamage <- 0;
		o.onAdded <- function()
		{
			this.m.ShieldDamage = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getShieldDamage();
		}

		local onAnySkillUsed = o.onAnySkillUsed;
		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			onAnySkillUsed( _skill, _targetEntity, _properties );
			if (_skill == this && _properties.IsSpecializedInThrowing)
			{
				local weapon = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
				weapon.m.ShieldDamage = this.m.ShieldDamage;
				if (_targetEntity != null && _targetEntity.getCurrentProperties().IsSpecializedInShields)
				{
					weapon.m.ShieldDamage *= 2;
				}
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_feint", function(o) {
		o.onAdded <- function()
		{
			if (!this.getContainer().getActor().isPlayerControlled())
			{
				this.removeSelf();
			}
		}
	});

	::mods_hookNewObject("skills/actives/legend_mark_target", function(o) {
		o.m.ActionPointCost = 7;
	});

	::mods_hookExactClass("skills/perks/perk_quick_hands", function(o) {
		local getItemActionCost = o.getItemActionCost;
		o.getItemActionCost = function(_items)
		{
			local twoHandedItemsCount = 0;
			foreach (i in _items)
			{
				if (i == null)
				{
					continue;
				}

				if (i.isItemType(this.Const.Items.ItemType.Shield))
				{
					return null;
				}

				if (i.isItemType(this.Const.Items.ItemType.TwoHanded) && i.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					twoHandedItemsCount++;
				}
			}

			if (twoHandedItemsCount == 2)
			{
				return null;
			}

			return getItemActionCost(_items);
		}		
	});

	::mods_hookExactClass("skills/actives/rally_the_troops", function(o) {
		o.m.TurnsRemaining <- 0;

		local onAfterUpdate = ::mods_getMember(o, "onAfterUpdate");
		o.onAfterUpdate <- function( _properties )
		{
			onAfterUpdate(_properties);
			local actor = this.getContainer().getActor();
			if (!actor.isPlayerControlled() && (actor.getType() == this.Const.EntityType.BanditLeader || actor.getType() == this.Const.EntityType.NomadLeader || actor.getType() == this.Const.EntityType.BanditWarlord))
			{
				this.m.ActionPointCost = 3;
			}
		}

		local onUse = o.onUse;
		o.onUse = function( _user, _targetTile )
		{
			local ret = onUse( _user, _targetTile );

			if (ret && !_user.isPlayerControlled() && (_user.getType() == this.Const.EntityType.BanditLeader || _user.getType() == this.Const.EntityType.NomadLeader || _user.getType() == this.Const.EntityType.BanditWarlord))
			{
				this.m.TurnsRemaining = 3;
			}

			return ret;
		}

		local isUsable = o.isUsable;
		o.isUsable = function()
		{
			local ret = isUsable();

			if (ret && this.m.TurnsRemaining > 0)
			{
					return false;
			}

			return ret;
		}

		o.onTurnEnd <- function()
		{
			this.m.TurnsRemaining = this.Math.max(0, this.m.TurnsRemaining - 1);
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_smashing_shields", function(o) {
		o.m.Modifier = 1.15;
	});

	::mods_hookExactClass("skills/actives/split_shield", function(o) {
		local onUse = o.onUse;
		o.onUse = function(_user, _targetTile)
		{
			local shield = _targetTile.getEntity().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			local ret = onUse(_user, _targetTile);

			if (ret && shield != null && shield.getCondition() == 0 && this.getContainer().hasSkill("perk.legend_smashing_shields"))
			{
				_user.setActionPoints(this.Math.min(_user.getActionPointsMax(), _user.getActionPoints() + 4));
				this.spawnIcon("perk_legend_smashing_shields", _user.getTile());
			}

			return ret;
		}
	});

	::mods_hookNewObject("skills/perks/perk_last_stand", function(o) {
		o.m.IsSpent <- false;
		o.onUpdate = function(_properties)
		{
			local currentPercent = this.getContainer().getActor().getHitpointsPct();
			local bonus = 0;

			if (currentPercent < 0.66)
			{
				bonus = this.Math.floor(100 * (0.66 - currentPercent) / 2.0);
			}

			if (currentPercent < 0.4)
			{
				if (!this.m.IsSpent)
				{
					this.m.IsSpent = true;
					local injuries = this.getContainer().getAllSkillsOfType(this.Const.SkillType.TemporaryInjury);
					foreach (injury in injuries)
					{
						injury.m.IsFresh = false;
					}
				}
				_properties.IsAffectedByFreshInjuries = false;
				_properties.IsAffectedByLosingHitpoints = false;
			}

			_properties.MeleeDefense += bonus;
			_properties.RangedDefense += bonus;
		}

		o.onCombatFinished <- function()
		{
			this.skill.onCombatFinished();
			this.m.IsSpent = false;
		}
	});

	::mods_hookNewObject("skills/perks/perk_duelist", function(o) {
		o.onUpdate = function( _properties )
		{
			// Overwrite vanilla function
		}

		o.onAnySkillUsed <- function( _skill, _targetEntity, _properties )
		{
			if (_skill.isDuelistValid())
			{
				local weapon = this.getContainer().getActor().getMainhandItem();
				if (weapon == null || weapon.isItemType((this.Const.Items.ItemType.OneHanded)))
				{
					_properties.DamageDirectAdd += 0.25;
				}
				else
				{
					_properties.DamageDirectAdd += 0.15;
				}
			}
		}
	});

	::mods_hookNewObject("skills/effects/duelist_defense_effect", function(o) {
		local isEnabled = o.isEnabled;
		o.isEnabled = function()
		{
			local ret = isEnabled();
			if (!ret)
			{
				local attack = this.getContainer().getAttackOfOpportunity();
				if (attack != null && attack.isDuelistValid())
				{
					return true;
				}
			}

			return ret;
		}
	});

	::mods_hookExactClass("skills/perks/perk_mastery_throwing", function(o) {
		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			if (_targetEntity == null || !_skill.isRanged()) return;

			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon == null || !weapon.isWeaponType(::Const.Items.WeaponType.Throwing)) return;

			local actor = this.getContainer().getActor();
			local distance = _targetEntity.getTile().getDistanceTo(actor.getTile());
			if (distance <= 3)
			{
				_properties.RangedSkill += ::Math.floor(0.25 * actor.getCurrentProperties().getMeleeSkill() * (distance == 2 ? 1.0 : 0.5));
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_close_combat_archer", function(o) {
		o.m.IsForceEnabled <- false;

		o.isEnabled <- function()
		{
			if (this.m.IsForceEnabled)
			{
				return true;
			}

			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
			{
				return false;
			}

			return true;
		}

		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			if (_targetEntity == null || !this.isEnabled())
			{
				return;
			}

			local d = this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile());

			if (d <= 2)
			{
				_properties.DamageTotalMult *= 1.4;
			}
			else if (d <= 3)
			{
				_properties.DamageTotalMult *= 1.2;
			}
		}

		o.onGetHitFactors <- function( _skill, _targetTile, _tooltip )
		{
			local targetEntity = _targetTile.getEntity();
			if (targetEntity != null)
			{
				if (_skill.isAttack() && _skill.isRanged() && this.isEnabled() && targetEntity.getTile().getDistanceTo(this.getContainer().getActor().getTile()) <= 3)
				{
					_tooltip.push({
						icon = "ui/tooltips/positive.png",
						text = this.getName()
					});
				}
			}
		}

		o.onTargetHit <- function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			if (!_targetEntity.isAlive() || _targetEntity.isDying() || !this.isEnabled() || !_skill.isRanged())
			{
				return;
			}

			local distance = this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile());
			if (distance > 3)
			{
				return;
			}

			local actor = this.getContainer().getActor();

			if (_skill.getDamageType().contains(::Const.Damage.DamageType.Blunt))
			{
				local chance = distance == 2 ? 100 : 50;
				local roll = this.Math.rand(1, 100);

				if (roll <= chance)
				{
					local staggeredEffect = _targetEntity.getSkills().getSkillByID("effects.staggered");
					if (staggeredEffect != null && !_targetEntity.getCurrentProperties().IsImmuneToStun)
					{
						local effect = this.new("scripts/skills/effects/stunned_effect");
						_targetEntity.getSkills().add(effect);
						effect.m.TurnsLeft = 1;
						if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
						{
							this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has stunned " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for " + effect.m.TurnsLeft + " turn");
						}
					}
					else
					{
						local effect = this.new("scripts/skills/effects/staggered_effect");
						_targetEntity.getSkills().add(effect);
						effect.m.TurnsLeft = 1;
						if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
						{
							this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has staggered " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for " + effect.m.TurnsLeft + " turn");
						}
					}
				}
			}
			else if (_skill.getDamageType().contains(::Const.Damage.DamageType.Piercing))
			{
				local chance = distance == 2 ? 100 : 50;
				local roll = this.Math.rand(1, 100);

				if (roll <= chance)
				{
					local effect = ::new("scripts/skills/effects/ptr_arrow_to_the_knee_debuff_effect");
					_targetEntity.getSkills().add(effect);
					if (!actor.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " has impaled " + this.Const.UI.getColorizedEntityName(_targetEntity) + " for " + effect.m.TurnsLeft + " turns");
					}
				}
			}
			else if (_skill.getDamageType().contains(::Const.Damage.DamageType.Cutting))
			{
				local chance = distance == 2 ? 100 : 50;
				local roll = this.Math.rand(1, 100);

				if (roll <= chance)
				{
					_targetEntity.getSkills().add(::new("scripts/skills/effects/overwhelmed_effect"));
				}
			}
		}
	});

	::mods_hookNewObject("skills/actives/legend_push_forward", function(o) {
		local onAdded = ::mods_getMember(o, "onAdded");
		o.onAdded <- function()
		{
			onAdded();
			local actor = this.getContainer().getActor();
			if (actor.isPlayerControlled())
			{
				return;
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.LegendPushForward) == null)
			{
				agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_legend_push_forward"));
				agent.finalizeBehaviors();
			}
		}
	});

	::mods_hookNewObject("skills/perks/perk_legend_freedom_of_movement", function(o) {
		o.m.Description = "Owing to %their% light-weight armor, this character is gaining increased mobility and can strike more accurately."

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			local bonus = this.getBonus();
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Skill"
			});

			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Defense"
			});

			return tooltip;
		}

		o.onBeforeDamageReceived = function( _attacker, _skill, _hitInfo, _properties )
		{
		}

		o.getBonus <- function()
		{
			local actor = this.getContainer().getActor();

			local fat = 0;
			local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);

			if (body != null)
			{
				fat = fat + body.getStaminaModifier();
			}

			if (head != null)
			{
				fat = fat + head.getStaminaModifier();
			}

			// Because staminaModifiers are negative!
			fat = this.Math.min(0, fat + 15);
			local maxFatMult = this.Math.maxf(0, 0.1 - this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);

			return this.Math.floor(actor.getFatigueMax() * maxFatMult);
		}

		o.onUpdate <- function(_properties)
		{
			local bonus = this.getBonus();
			_properties.MeleeSkill += bonus;
			_properties.MeleeDefense += bonus;
		}
	});

	::mods_hookNewObject("skills/perks/perk_legend_clarity", function(o) {
		o.m.Type = this.Const.SkillType.Perk;
		o.onUpdate = function(_properties)
		{
			_properties.FatigueEffectMult *= 0.8;
		}
	});

	::mods_hookNewObject("skills/actives/adrenaline_skill", function(o) {
		local onAdded = ::mods_getMember(o, "onAdded");
		o.onAdded <- function()
		{
			onAdded();
			local actor = this.getContainer().getActor();
			if (actor.isPlayerControlled())
			{
				return;
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.Adrenaline) == null)
			{
				agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_adrenaline"));
				agent.finalizeBehaviors();
			}
		}
	});

	::mods_hookNewObject("skills/actives/rally_the_troops", function(o) {
		local onAdded = ::mods_getMember(o, "onAdded");
		o.onAdded <- function()
		{
			onAdded();
			local actor = this.getContainer().getActor();
			if (actor.isPlayerControlled())
			{
				return;
			}

			local agent = actor.getAIAgent();

			if (agent.findBehavior(this.Const.AI.Behavior.ID.Rally) == null)
			{
				agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_rally"));
				agent.finalizeBehaviors();
			}
		}
	});

	::mods_hookNewObject("skills/perks/perk_legend_onslaught", function(o) {
		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			if (!_targetEntity.isAlive() || _targetEntity.isDying())
			{
				return false;
			}

			if (_targetEntity.getCurrentProperties().IsImmuneToStun)
			{
				return false;
			}

			if (_targetEntity.isNonCombatant())
			{
				return false;
			}

			local user = this.getContainer().getActor();
			local ourInit = user.getInitiative();
			local targetInit = _targetEntity.getInitiative();

			if (ourInit <= targetInit)
			{
				return false;
			}

			local weapon = user.getMainhandItem();
			local chance = 50;
			if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Staff))
			{
				chance = 100;
			}

			if (this.Math.rand(1, 100) > chance)
			{
				return false;
			}

			if (!_targetEntity.getSkills().hasSkill("effects.stunned"))
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_baffled_effect"));

				if (!user.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " battered " + this.Const.UI.getColorizedEntityName(_targetEntity) + " leaving them baffled");
				}
			}

			return true;
		}
	});

	::mods_hookNewObject("skills/actives/aimed_shot", function(o) {
		o.m.FieldsChangedByFlamingArrows <- false;
		o.m.TargetTile <- null;

		local onAfterUpdate = o.onAfterUpdate;
		o.onAfterUpdate = function( _properties )
		{
			onAfterUpdate(_properties);

			if (this.getContainer().hasSkill("perk.ptr_flaming_arrows"))
			{
				if (this.m.FieldsChangedByFlamingArrows == false)
				{
					this.m.Description = "A focused and carefully aimed shot with a good outlook of hitting its intended target even at a distance. On a successful hit, will light the target tile on fire and trigger a morale check for the target. Can not be used while engaged in melee.";
					this.m.ProjectileType = this.Const.ProjectileType.FlamingArrow;
					this.m.FieldsChangedByFlamingArrows = true;
				}
			}
			else if (this.m.FieldsChangedByFlamingArrows)
			{
				this.resetField("Description");
				this.m.FieldsChangedByFlamingArrows = false;
			}
		}
	});

	# ::mods_hookNewObject("skills/actives/legend_cheer_on_skill", function(o) {
	# 	local oldisUsable = o.isUsable;
	# 	o.isUsable = function( )
	# 	{
	# 		return this.skill.isUsable();
	# 	}
	# });
	#
	::mods_hookNewObject("skills/actives/legend_prepare_knockback_skill", function(o) {
		o.isUsable = function()
		{
			return this.skill.isUsable() && !this.getContainer().hasSkill("effects.legend_knockback_prepared");
	 	}
	});

	::mods_hookNewObject("skills/perks/perk_legend_smackdown", function(o) {
		local onTargetHit = o.onTargetHit;
		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			local success = onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor );

			if (success && _targetEntity.isAlive() && !_targetEntity.isDying())
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/ptr_smackdown_debuff_effect"));
			}

			return success;
		}
	});

	::mods_hookNewObject("skills/perks/perk_legend_assured_conquest", function(o) {
		o.m.Type = ::Const.SkillType.Perk | ::Const.SkillType.StatusEffect;
		o.m.Description = "This character believes that %their% victory is an absolute certainty."

		o.getTooltip <- function()
		{
			local tooltip = this.skill.getTooltip();

			local isConfident = this.getContainer().getActor().getMoraleState() == ::Const.MoraleState.Confident;

			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + (isConfident ? 20 : 10) + "%[/color] Resolve"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + (isConfident ? 20 : 10) + "[/color] Resolve at positive morale checks"
				}
			]);

			if (isConfident)
			{
				tooltip.extend([
					{
						id = 10,
						type = "text",
						icon = "ui/icons/melee_skill.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Melee Skill"
					},
					{
						id = 10,
						type = "text",
						icon = "ui/icons/ranged_skill.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Ranged Skill"
					},
					{
						id = 10,
						type = "text",
						icon = "ui/icons/melee_defense.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Melee Defense"
					},
					{
						id = 10,
						type = "text",
						icon = "ui/icons/ranged_defense.png",
						text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Ranged Defense"
					}
				]);
			}

			return tooltip;
		}

		o.onUpdate = function( _properties )
		{	
			if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Confident)
			{
				_properties.BraveryMult *= 1.2;
				_properties.MeleeSkillMult *= 1.05;
				_properties.RangedSkillMult *= 1.05;
				_properties.MeleeDefenseMult *= 1.05;
				_properties.RangedDefenseMult *= 1.05;
			}
			else
			{
				_properties.BraveryMult *= 1.1;
			}
		}

		o.getBonusResAtPositiveMoraleCheck <- function()
		{
			return this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Confident ? 20 : 10;
		}
	});

	::mods_hookNewObject("skills/actives/perfect_focus", function(o) {
		o.m.ActionPointCost = 0;
		o.getTooltip = function()
		{
			local tooltip = this.skill.getDefaultUtilityTooltip();

			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/action_points.png",
					text = "Action Points will be doubled for the remainder of this round, capped at [color=" + this.Const.UI.Color.PositiveValue + "]18[/color]"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Become immune to being knocked back, grabbed or swallowed"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "You will [color=" + this.Const.UI.Color.NegativeValue + "]not be able to move[/color] from your position"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "You will be [color=" + this.Const.UI.Color.NegativeValue + "]exhausted[/color] on your next turn"
				}
			]);

			if (this.getContainer().hasSkill("effects.ptr_exhausted"))
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "Not usable when Exhausted"
				});
			}

			if (this.getContainer().getActor().isArmedWithRangedWeapon())
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "Not usable when armed with a ranged weapon"
				});
			}			

			return tooltip;
		}

		o.isUsable = function()
		{
			return this.skill.isUsable() && !this.getContainer().getActor().isArmedWithRangedWeapon() && !this.getContainer().hasSkill("effects.perfect_focus") && !this.getContainer().hasSkill("effects.ptr_exhausted");
		}
	});

	::mods_hookNewObject("skills/effects/perfect_focus_effect", function(o) {
		o.m.StartingAPFraction <- 1;
		o.m.SkillsUsedCount <- 0;
		o.m.MalusPerCount <- 10;
		o.m.Description = "This character has achieved perfect focus as if time itself were to stand still, gaining additional Action Points for this turn.";
		o.m.IsSpent <- false;

		o.getTooltip <- function()
		{
			local tooltip = this.skill.getTooltip();
			if (this.m.SkillsUsedCount > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + this.getMalus() + "%[/color] Fatigue built"
				});
			}

			if (this.m.IsSpent)
			{
				tooltip.extend([
					{
						id = 10,
						type = "text",
						icon = "ui/icons/warning.png",
						text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character has lost focus due to switching to a ranged weapon[/color]"
					},
					{
						id = 10,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Action Point and Fatigue costs of movement are greatly increased"
					}
				]);
			}
			else
			{
				tooltip.extend([
					{
						id = 10,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Cannot move from this position"
					},
					{
						id = 10,
						type = "text",
						icon = "ui/icons/special.png",
						text = "Immune to being knocked back, grabbed, or swallowed"
					},
					{
						id = 10,
						type = "text",
						icon = "ui/icons/warning.png",
						text = "[color=" + this.Const.UI.Color.NegativeValue + "]Will be lost upon switching to a ranged weapon[/color]"
					}
				]);
			}

			return tooltip;
		}

		o.onAdded <- function()
		{
			local actor = this.getContainer().getActor();
			actor.setActionPoints(this.Math.min(18, actor.getActionPoints() * 2));
		}

		o.onUpdate = function (_properties)
		{
			if (this.m.IsSpent)
			{
				_properties.MovementAPCostAdditional += 99;
				_properties.MovementFatigueCostAdditional += 99;
				return;
			}

			local actor  = this.getContainer().getActor();
			if (actor.isArmedWithRangedWeapon())
			{
				actor.setActionPoints(actor.getActionPoints() / 2);
				this.m.IsSpent = true;
				return;
			}
			else
			{
				_properties.IsRooted = true;
				_properties.IsImmuneToKnockBackAndGrab = true;
				_properties.ActionPointsMult = 2.0;
			}
		}

		o.onRemoved <- function()
		{
			this.getContainer().add(this.new("scripts/skills/effects/ptr_exhausted_effect"));
		}

		o.onAnySkillExecuted <- function(_skill, _targetTile, _targetEntity, _forFree)
		{
			if (this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == this.getContainer().getActor().getID())
			{
				this.m.SkillsUsedCount++;
			}
		}

		o.getMalus <- function()
		{
			return this.m.SkillsUsedCount * this.m.MalusPerCount;
		}

		o.onAnySkillUsed <- function( _skill, _targetEntity, _properties )
		{
			local malus = this.getMalus() * 0.01;
			_properties.FatigueEffectMult *= 1.0 + malus;
		}
	});

	::mods_hookNewObject("skills/perks/perk_coup_de_grace", function(o) {
		o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
		{
			if (_targetEntity == null || !_skill.isAttack())
			{
				return;
			}

			if (_targetEntity.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				_properties.DamageTotalMult *= 1.2;
			}

			if (_targetEntity.getSkills().hasSkill("effects.stunned") || _targetEntity.getSkills().hasSkill("effects.net") || _targetEntity.getSkills().hasSkill("effects.sleeping") || _targetEntity.getSkills().hasSkill("effects.debilitated"))
			{
				_properties.DamageTotalMult *= 1.2;
			}
		}
	});

	::mods_hookNewObject("skills/perks/perk_legend_back_to_basics", function(o) {
		o.m.Order = this.Const.SkillType.Perk;
		o.m.AttackSkillThreshold <- 70;
		o.m.DefenseSkillThreshold <- 40;
		o.m.ResolveThreshold <- 50;
		o.m.Description = "This character is using %their% training to gain at least a passable understanding of the fundamentals of combat, especially in areas %they% lacks.";

		if ("onDamageReceived" in o)
		{
			o.onDamageReceived = function( _attacker, _damageHitpoints, _damageArmor )
			{
				# overwrite legends function
			}
		}

		o.getTooltip <- function()
		{
			local tooltip = this.skill.getTooltip();

			local b = this.getContainer().getActor().getBaseProperties();
			local meleeSkillBonus = this.getMeleeSkillBonus(b);
			local rangedSkillBonus = this.getRangedSkillBonus(b);
			local meleeDefenseBonus = this.getMeleeDefenseBonus(b);
			local rangedDefenseBonus = this.getRangedDefenseBonus(b);
			local braveryBonus = this.getBraveryBonus(b);

			if (meleeSkillBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + meleeSkillBonus + "[/color] Melee Skill"
				});
			}

			if (meleeDefenseBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + meleeDefenseBonus + "[/color] Melee Defense"
				});
			}

			if (rangedSkillBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/ranged_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + rangedSkillBonus + "[/color] Ranged Skill"
				});
			}

			if (rangedDefenseBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + rangedDefenseBonus + "[/color] Ranged Defense"
				});
			}

			if (braveryBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/bravery.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + braveryBonus + "[/color] Resolve"
				});
			}

			return tooltip;
		}

		function getMeleeSkillBonus(_baseProperties)
		{
			local baseValue = _baseProperties.getMeleeSkill();
			local bonus = this.Math.round((this.m.AttackSkillThreshold - baseValue) * 0.01 * baseValue);
			return this.Math.max(0, bonus);
		}

		function getRangedSkillBonus(_baseProperties)
		{
			local baseValue = _baseProperties.getRangedSkill();
			local bonus = this.Math.round((this.m.AttackSkillThreshold - baseValue) * 0.01 * baseValue);
			return this.Math.max(0, bonus);
		}

		function getMeleeDefenseBonus(_baseProperties)
		{
			local baseValue = _baseProperties.getMeleeDefense();
			local bonus = this.Math.round((this.m.DefenseSkillThreshold - baseValue) * 0.01 * baseValue);
			return this.Math.max(0, bonus);
		}

		function getRangedDefenseBonus(_baseProperties)
		{
			local baseValue = _baseProperties.getRangedDefense();
			local bonus = this.Math.round((this.m.DefenseSkillThreshold - baseValue) * 0.01 * baseValue);
			return this.Math.max(0, bonus);
		}

		function getBraveryBonus(_baseProperties)
		{
			local baseValue = _baseProperties.getBravery();
			local bonus = this.Math.round((this.m.ResolveThreshold - baseValue) * 0.01 * baseValue);
			return this.Math.max(0, bonus);
		}

		o.onUpdate = function(_properties)
		{
			local b = this.getContainer().getActor().getBaseProperties();

			_properties.MeleeSkill += this.getMeleeSkillBonus(b);
			_properties.MeleeDefense += this.getMeleeDefenseBonus(b);
			_properties.RangedSkill += this.getRangedSkillBonus(b);
			_properties.RangedDefense += this.getRangedDefenseBonus(b);
			_properties.Bravery += this.getBraveryBonus(b);
		}
	});
}
