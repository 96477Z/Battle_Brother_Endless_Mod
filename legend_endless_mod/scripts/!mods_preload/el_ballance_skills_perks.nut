local gt = getroottable();

::mods_registerMod("el_ballance_skills_perks", 1, "el_ballance_skills_perks");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/perks/perk_anticipation", function ( o )
	{

		o.getDescription <- function()
		{
			return "By watching your opponent/\'s aim, you have more time to react.\n\nWhen being attacked with ranged weapons, gain [color=" + this.Const.UI.Color.PositiveValue + "]+5 Ranged Defense[/color] as additional Ranged Defense per tile that the attacker is away, and always at least [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] to Ranged Defense.";
		}

		o.onBeingAttacked = function( _attacker, _skill, _properties )
		{
			local actor = this.getContainer().getActor();
            if(actor != null && !actor.isDying() && actor.isAlive()) {
				local dist = _attacker.getTile().getDistanceTo(actor.getTile());
				_properties.RangedDefense += this.Math.max(10, this.Math.floor(dist * 5));
            }

		}
	});

	::mods_hookExactClass("skills/perks/perk_battle_forged", function ( o )
	{

		o.getReductionPercentage = function()
		{
			local armor = this.getContainer().getActor().getArmor(this.Const.BodyPart.Head) + this.getContainer().getActor().getArmor(this.Const.BodyPart.Body);
			return this.Math.floor((1 - 100/(100 + armor * 0.05)) * 10000) * 0.01;
		}

	});

	::mods_hookExactClass("skills/perks/perk_colossus", function ( o )
	{

		o.getDescription <- function()
		{
			return "Bring it on! Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color], which also reduces the chance to sustain debilitating injuries when being hit.";
		}


		o.onUpdate = function( _properties )
		{
			_properties.Hitpoints += this.Math.floor(0.25 * this.getContainer().getActor().getBaseProperties().Hitpoints);
		}

	});

	::mods_hookExactClass("skills/perks/perk_double_strike", function ( o )
	{

		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			local actor = this.getContainer().getActor();

			if (actor.isAlive() && !actor.isDying() && !actor.getSkills().hasSkill("effect.double_strike"))
			{
				actor.getSkills().add(this.new("scripts/skills/effects/double_strike_effect"));
			}
		}

	});

	::mods_hookExactClass("skills/perks/perk_fortified_mind", function ( o )
	{

		o.getDescription <- function()
		{
			return "An iron will is not swayed from the true path easily. Resolve is increased by [color=" + this.Const.UI.Color.PositiveValue + "]+15[/color].";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Bravery += 15;
		}

	});

	::mods_hookExactClass("skills/perks/perk_horse_hippology", function ( o )
	{

		o.getDescription <- function()
		{
			return "Knowledge of horse physiology allows for better diet, exercise and care. Increases hitpoints by +25%";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Hitpoints += this.Math.floor(0.25 * this.getContainer().getActor().getBaseProperties().Hitpoints);
		}

	});

	::mods_hookExactClass("skills/perks/perk_horse_impulsion", function ( o )
	{

		o.getDescription <- function()
		{
			return "Effective leverage of equestrian physiology relaxes the spinal column and allows the hindquarters to engage effectively. Increases Initiative by +30";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Initiative += 30;
		}

	});

	::mods_hookExactClass("skills/perks/perk_horse_leg_control", function ( o )
	{

		o.getDescription <- function()
		{
			return "it is not possible to hold the reins while firing a bow. Horse and rider must learn to communicate through the rider\'s legs. Increases ranged attack in battle by +25";
		}

		o.onUpdate = function( _properties )
		{
			_properties.RangedSkill += 25;
		}

	});

	::mods_hookExactClass("skills/perks/perk_horse_longeing", function ( o )
	{

		o.getDescription <- function()
		{
			return "Time spent working on a long rope helps build trust between horse and rider. Increases resolve by +15";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Bravery += 15;
		}

	});

	::mods_hookExactClass("skills/perks/perk_horse_tempi_change", function ( o )
	{

		o.getDescription <- function()
		{
			return "the most challenging form of lead change, a tempi change requires shifting back and forth between lead legs. This form of training can allow the horse to change lead leg according to the situation, useful when under fire. Increases ranged defense by +25";
		}

		o.onUpdate = function( _properties )
		{
			_properties.RangedSkill += 25;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_alert", function ( o )
	{

		o.getDescription <- function()
		{
			return "Pay close attention at all times, surveying the surroundings and assessing every clue for an insight. Gain [color=" + this.Const.UI.Color.PositiveValue + "]+30[/color] Initiative.";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Initiative += 30;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_ammo_binding", function ( o )
	{

		o.getDescription <- function()
		{
			return "Expertise in making ammunition lets you strip it down to pack the parts for storage, it also lets you draw out arrows faster. Increases maximum ammunition storage by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] and Ranged skill by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color].";
		}

		o.onUpdate = function( _properties )
		{
			_properties.RangedSkill += 5;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_ammo_bundles", function ( o )
	{

		o.getDescription <- function()
		{
			return "Using blankets and ropes to group large bundles of ammunition together you are able to carry far more. These bundles can also be used to shield yourself from enemy fire. Increases maximum ammunition storage by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] and Ranged Defense by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]";
		}

		o.onUpdate = function( _properties )
		{
			_properties.RangedSkill += 5;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_assured_conquest", function ( o )
	{

		o.getDescription <- function()
		{
			return "你的信心影响的发挥。自信时获得 [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] 近攻，远攻，近防和远防。加成的属性会在士气衰减时衰减。稳定士气[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]，溃散士气[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color]，逃跑士气[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color]。";
		}

		o.onUpdate = function( _properties )
		{
			if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Confident)
			{
				_properties.RangedSkill += 10;
				_properties.MeleeSkill += 10;
				_properties.MeleeDefense += 10;
				_properties.RangedDefense += 10;
			}

			if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Steady)
			{
				_properties.RangedSkill += 5;
				_properties.MeleeSkill += 5;
				_properties.MeleeDefense += 5;
				_properties.RangedDefense += 5;
			}

			if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Breaking)
			{
				_properties.RangedSkill -= 5;
				_properties.MeleeSkill -= 5;
				_properties.MeleeDefense -= 5;
				_properties.RangedDefense -= 5;
			}

			if (this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				_properties.RangedSkill -= 10;
				_properties.MeleeSkill -= 10;
				_properties.MeleeDefense -= 10;
				_properties.RangedDefense -= 10;
			}
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_balance", function ( o )
	{

		o.getBonus = function()
		{
			local actor = this.getContainer().getActor();
			local bodyitem = actor.getBodyItem();

			if (bodyitem == null)
			{
				return 0;
			}

			local armorFatPen = actor.getItems().getStaminaModifier([
				::Const.ItemSlot.Body,
				::Const.ItemSlot.Head
			]) * -1;
			armorFatPen /= (1 + actor.EL_getCombatLevel() * 0.04);
			local bonus = this.m.BonusMax - this.Math.abs(armorFatPen - 35) / 2;
			local currIni = actor.getInitiative();

			if (currIni < armorFatPen * 2)
			{
				bonus = bonus - (armorFatPen * 2 - currIni) / 10;
			}

			return this.Math.max(this.m.BonusMin, bonus);
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_bloodbath", function ( o )
	{

		o.getTooltip = function()
		{
			local bleeders = this.getBleeders();
			local bonus = bleeders * 100;
			local tooltip = this.skill.getTooltip();

			if (bleeders > 0.8)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "There are a lot of characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] to resolve and fatigue"
				});
			}
			else if (bleeders > 0.5)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "There are some characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] to resolve and fatigue"
				});
			}
			else if (bleeders > 0.3)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "There are a few characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] to resolve and fatigue"
				});
			}

			return tooltip;
		}

		o.onUpdate = function( _properties )
		{
			local bonus = this.getBleeders();
			_properties.Bravery += bonus * 100;
			_properties.Stamina += bonus * 100;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_cascade", function ( o )
	{
		o.onAdded <- function()
		{
			//this.logInfo("add actives");
			if (!this.m.Container.hasSkill("actives.legend_cascade"))
			{
				this.m.Container.add(this.new("scripts/skills/actives/legend_cascade_skill"));
			}
		}

		o.onRemoved <- function()
		{
			this.m.Container.removeByID("actives.legend_cascade");
		}

	});

	::mods_hookExactClass("skills/legend_favoured_enemy_skill", function ( o )
	{

		o.getTooltip = function()
		{
			local stats = this.getTotalKillStats();
			local resp = [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 2,
					type = "description",
					text = "对该类敌人有着另类的执着。"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 20 + "%[/color] Melee Skill due to being a favored enemy"
				},
				{
					id = 11,
					type = "text",
					icon = "ui/icons/ranged_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 20 + "%[/color] Range Skill due to being a favored enemy"
				},
				{
					id = 11,
					type = "text",
					icon = "ui/icons/damage_dealt.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 20 + "%[/color] Max Damage due to being a favored enemy"
				}
			];
			return resp;
		}

		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			if (_targetEntity == null)
			{
				return;
			}

			if (this.validTarget(_targetEntity.getType()))
			{
				_properties.MeleeSkill += 20;
				_properties.RangedSkill += 20
				_properties.DamageRegularMax *= 1.2;
			}
			else
			{
				return;
			}
		}

		o.onUpdate = function( _properties )
		{
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_barter_greed", function ( o )
	{
		o.m.OffensiveMult = 3;
		o.m.DefensiveMult = 3;
		o.m.ResolveMult = 3;

		o.calculateBonus = function( _multiplier )
		{
			local money = this.World.Assets.getMoney();
			local bonus = 0;
			local money_need = 10000.0;
			while(money > 0) {
				bonus += _multiplier;
				money -= money_need;
				money_need *= 2.0;
			}
			return this.Math.floor(bonus + (money / money_need) * _multiplier);
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_freedom_of_movement", function ( o )
	{

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Gain hit point damage reduction proportional to the difference between your current initiative and your attacker\'s."
			});
			return tooltip;
		}

		o.onBeforeDamageReceived = function( _attacker, _skill, _hitInfo, _properties )
		{
			if (_attacker == null || _attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
			{
				return;
			}

			local ourCurrentInitiative = this.getContainer().getActor().getInitiative();
			local enemyCurrentInitiative = _attacker.getInitiative();
			local bonus = 1;

			if (ourCurrentInitiative > enemyCurrentInitiative)
			{
				local diff = (ourCurrentInitiative - enemyCurrentInitiative) / 100.0;
				bonus = 1 / (1 + diff);
			}

			_properties.DamageReceivedRegularMult *= bonus;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_lithe", function ( o )
	{
		o.isHidden <- function()
		{
			return this.getContainer().hasSkill("perk.nimble") || (::Math.floor(this.getHitpointsDamageReduction() * 100) >= 100 && ::Math.floor(this.getArmorDamageReduction() * 100) >= 100);
		}

		o.getTooltip = function()
		{
			local actor = this.getContainer().getActor();
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
			tooltip.push({
				id = 6,
				type = "hint",
				text = "装备重量在[color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(25 * (1 + 0.04 * actor.EL_getCombatLevel())) + "[/color] ~ [color=" + this.Const.UI.Color.PositiveValue + "]" +
					   this.Math.floor(35 * (1 + 0.04 * actor.EL_getCombatLevel())) + "[/color]最合适。"
			});
			return tooltip;
		}

		o.getHitpointsDamageReduction <- function()
		{
			local actor = this.getContainer().getActor();
			local fat = this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]) / (1 + 0.04 * actor.EL_getCombatLevel());
			fat = ::Math.min(0, fat + 35);
			return ::Math.minf(1.0, 1.0 - 0.3 + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
		}

		o.getArmorDamageReduction <- function()
		{
			local actor = this.getContainer().getActor();
			local fat = this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]) / (1 + 0.04 * actor.EL_getCombatLevel());
			fat = ::Math.min(0, fat + 35);
			return ::Math.minf(1.0, 1.0 - 0.15 + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
		}

		o.onBeforeDamageReceived <- function ( _attacker, _skill, _hitInfo, _properties )
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


	::mods_hookExactClass("skills/perks/perk_legend_med_ingredients", function ( o )
	{

		o.getDescription <- function()
		{
			return "Learning the plants of the healing trade allows you to fashion crude healing supplies from common ingredients. Unlocks crafting bandages and medicine. Also increases maximum medicine storage by 10 and resolve by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color].";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Bravery += 5;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_med_packages", function ( o )
	{

		o.getDescription <- function()
		{
			return "Not all of a plant is required for healing, your knowledge of the active ingredients lets you throw away excess leaves and roots.Your knowledge of medicines lets you repack them into more efficient packages. Increases maximum medicine storage by 30 and resolve by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Bravery += 5;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_muscularity", function ( o )
	{

		o.getDescription <- function()
		{
			local bodyHealth = this.getContainer().getActor().getHitpointsMax();
			return "把你的重量运用到每次攻击，增加 [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.floor(this.Math.pow(bodyHealth, 0.5)) + "%[/color] 最大生命值的最小伤害和最大伤害。";
		}

		o.onUpdate = function( _properties )
		{
			local bodyHealth = this.getContainer().getActor().getHitpointsMax();
			_properties.DamageTotalMult *= 1 + this.Math.pow(bodyHealth, 0.5) * 0.01;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_pacifist", function ( o )
	{

		o.getDescription <- function()
		{
			return "Fighting is a brutal thuggish pastime, most folk prefer a life without frequent bouts of extreme violence.  This character does not count towards your party strength when determining game difficulty. They will gain [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] resolve. They become content with being in reserve, and will grow unhappy if they are in more than half of the battles your company takes.";
		}

		o.onUpdate = function( _properties )
		{
			_properties.IsContentWithBeingInReserve = true;
			_properties.Bravery += 10;
		}

	});

	::mods_hookExactClass("skills/perks/perk_legend_perfect_fit", function ( o )
	{

		o.getBonus = function()
		{
			local actor = this.getContainer().getActor();
			local bodyitem = actor.getBodyItem();

			if (bodyitem == null)
			{
				return 0;
			}

			local armorFatPen = -1 * actor.getItems().getStaminaModifier([
				::Const.ItemSlot.Body,
				::Const.ItemSlot.Head
			]);
			armorFatPen /= (1 + 0.04 * actor.EL_getCombatLevel());
			local maxFat = actor.getFatigueMax();
			local armorFatPenMult = 0;

			if (armorFatPen * 2 <= maxFat)
			{
				armorFatPenMult = 1;
			}
			else
			{
				armorFatPenMult = this.Math.maxf(0, 1 - 0.01 * this.Math.pow(armorFatPen - maxFat / 2.0, 2.44));
			}

			return this.m.BonusMax * armorFatPenMult;
		}

		o.getInitiativeBonus = function( _bonus )
		{
			local actor = this.getContainer().getActor();
			return this.Math.floor(0.01 * _bonus * actor.getItems().getStaminaModifier([
				::Const.ItemSlot.Body,
				::Const.ItemSlot.Head
			]) * -1 / (1 + 0.04 * actor.EL_getCombatLevel()));
		}


	});

	::mods_hookExactClass("skills/perks/perk_legend_specialist_cult_armor", function ( o )
	{

		o.getResolveBonus = function()
		{
			local actor = this.getContainer().getActor();
			local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			local cultItems = [];

			if (item != null)
			{
				if (item.isItemType(this.Const.Items.ItemType.Cultist))
				{
					cultItems.push(item);
				}

				if (!::Legends.Mod.ModSettings.getSetting("UnlayeredArmor").getValue() && ::MSU.isKindOf(item, "legend_armor"))
				{
					foreach( upgrade in item.m.Upgrades )
					{
						if (upgrade != null && upgrade.isItemType(this.Const.Items.ItemType.Cultist))
						{
							cultItems.push(upgrade);
						}
					}
				}
			}

			if (cultItems.len() > 0)
			{
				return this.Math.floor((actor.getHitpointsMax() - actor.getHitpoints()) / actor.getHitpointsMax() * 100);
			}

			return 0;
		}
	});

	::mods_hookExactClass("skills/perks/perk_legend_tumble", function ( o )
	{

		o.onAfterUpdate = function( _properties )
		{
			local skills = this.getContainer().getAllSkillsOfType(this.Const.SkillType.Active);

			foreach( skill in skills )
			{
				if (this.m.Skills.find(skill.getID()) != null)
				{
					skill.m.FatigueCostMult *= 0.5;

					if (skill.getID() == "actives.legend_leap")
					{
						skill.m.ActionPointCost /= 2;
					}
					else
					{
						skill.m.ActionPointCost -= 1;
					}
				}
			}
		}
	});


	::mods_hookExactClass("skills/perks/perk_lone_wolf", function ( o )
	{

		o.getDescription <- function()
		{
			return "I work best alone. With no ally within 2 tiles of distance, gain a [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] bonus to Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve.";
		}
	});

	::mods_hookExactClass("skills/perks/perk_nimble", function ( o )
	{

		o.getTooltip = function()
		{
			local actor = this.getContainer().getActor();
			local fm = this.Math.round(this.getReductionChance(0) * 100);
			local tooltip = this.skill.getTooltip();

			if (fm < 100)
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Only receive [color=" + this.Const.UI.Color.PositiveValue + "]" + fm + "%[/color] of any damage to hitpoints from attacks"
				});
			}
			else
			{
				tooltip.push({
					id = 6,
					type = "text",
					icon = "ui/tooltips/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy as to gain any benefit from being nimble[/color]"
				});
			}
			tooltip.push({
				id = 6,
				type = "hint",
				text = "装备重量低于[color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(15 * (1 + 0.04 * actor.EL_getCombatLevel())) + "[/color]最合适。"
			});
			return tooltip;
		}

		o.getChance = function ()
		{
			local fat = 0;
			local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);
			local actor = this.getContainer().getActor();

			if (body != null)
			{
				fat = fat + body.getStaminaModifier();
			}

			if (head != null)
			{
				fat = fat + head.getStaminaModifier();
			}

			fat /= (1 + actor.EL_getCombatLevel() * 0.04);
			fat = this.Math.min(0, fat + 15);
			local ret = this.Math.minf(1.0, 1.0 - 0.6 + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
			return ret;
		}

		o.getReductionChance = function ( _reduction )
		{
			local fat = 0;
			local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
			local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);
			local actor = this.getContainer().getActor();

			if (body != null)
			{
				fat = fat + body.getStaminaModifier();
			}

			if (head != null)
			{
				fat = fat + head.getStaminaModifier();
			}

			fat /= (1 + actor.EL_getCombatLevel() * 0.04);
			fat = this.Math.min(0, fat + 15);
			local ret = this.Math.minf(1.0, 1.0 - 0.6 + this.Math.pow(this.Math.abs(fat), 1.23) * 0.01);
			return ret;
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_bloodbath", function ( o )
	{
		o.m.EL_CurrentTurnActionPointsOffset <- 0;
		o.m.EL_NextTurnActionPointsOffset <- 0;

		local create = o.create;
		o.create = function()
		{
			create();
			this.m.RestoredActionPoints = 0;
		}

		o.onTargetKilled <- function( _targetEntity, _skill )
		{
			if(_skill != null && _skill.getDamageType().contains(this.Const.Damage.DamageType.Cutting)) {
				this.m.EL_NextTurnActionPointsOffset += 3;
			}
		}

		o.onTurnEnd <- function()
		{
			this.m.EL_CurrentTurnActionPointsOffset = this.Math.min(9, this.m.EL_NextTurnActionPointsOffset);
			this.m.EL_NextTurnActionPointsOffset = this.Math.max(0, this.m.EL_NextTurnActionPointsOffset - 9);
		}

		o.onCombatStarted <- function()
		{
			this.m.EL_CurrentTurnActionPointsOffset = 0;
			this.m.EL_NextTurnActionPointsOffset = 0;
			this.skill.onCombatStarted();
		}

		o.onCombatFinished <- function()
		{
			this.m.EL_CurrentTurnActionPointsOffset = 0;
			this.m.EL_NextTurnActionPointsOffset = 0;
			this.skill.onCombatFinished();
		}

		o.onUpdate <- function( _properties )
		{
			_properties.ActionPoints += this.m.EL_CurrentTurnActionPointsOffset;
		}

	});

	::mods_hookExactClass("skills/perks/perk_ptr_bulwark", function ( o )
	{
		o.m.ArmorPercentageAsBonus = 5;

        o.getBonus <- function()
        {
            local armor = this.getContainer().getActor().getArmor(this.Const.BodyPart.Head) + this.getContainer().getActor().getArmor(this.Const.BodyPart.Body);
			local armor_need = 100.0;
			local bonus = 0;
			while(armor > armor_need)
			{
				++bonus;
				armor -= armor_need;
				armor_need *= 2;
			}
			return this.Math.floor((bonus + (armor / armor_need)) * this.m.ArmorPercentageAsBonus);
        }
	});

	::mods_hookExactClass("skills/perks/perk_ptr_cull", function ( o )
	{
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.Description = "对生命值低于50%的单位造成200%的伤害。";
		}

		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
		}

		o.onAnySkillUsed <- function ( _skill, _targetEntity, _properties )
		{
			if(!this.isEnabled())
			{
				return;
			}
			if (_targetEntity != null && _targetEntity.isAttackable() && _targetEntity.getHitpointsPct() <= 0.5)
			{
				_properties.DamageTotalMult *= 2;
			}
		}

	});


	::mods_hookExactClass("skills/perks/perk_ptr_dent_armor", function ( o )
	{
		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			local actor = this.getContainer().getActor();
			if (!_skill.isAttack() || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(actor))
			{
				return;
			}

			local targetArmorItem = _bodyPart == this.Const.BodyPart.Head ? _targetEntity.getHeadItem() : _targetEntity.getBodyItem();
			if (targetArmorItem == null)
			{
				return;
			}
			local weapon = actor.getMainhandItem();
			if (!this.isEnabled(_skill, weapon))
			{
				return;
			}

			local isTwoHanded = this.m.IsForceTwoHanded || (weapon != null && weapon.isItemType(this.Const.Items.ItemType.TwoHanded));

			local roll = this.Math.rand(1, 100);
			if (roll <= this.m.ChanceOneHanded || (roll <= this.m.ChanceTwoHanded && isTwoHanded))
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/ptr_dented_armor_effect"));
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_discovered_talent", function ( o )
	{
		o.onAdded = function()
		{
			local actor = this.getContainer().getActor();
			if (this.m.IsApplied || !this.getContainer().getActor().isPlayerControlled() || actor.m.Talents.len() < this.Const.Attributes.COUNT)
			{
				return;
			}
			this.m.IsApplied = true;
			actor.m.LevelUps += 1;
			for(local i = 0 ;i < this.Const.Attributes.COUNT; ++i) {
				actor.m.Talents[i] = this.Math.max(actor.m.Talents[i], this.Math.min(this.Const.EL_Player.EL_Talent.Max[actor.EL_getRankLevel()], actor.m.Talents[i] + 1));
				actor.m.Attributes[i] = [];
			}

		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_fruits_of_labor", function ( o )
	{

		o.getDescription <- function()
		{
			return "You\'ve quickly realized that your years of hard labor give you an edge in mercenary work!\n\n[color=" + this.Const.UI.Color.Passive + "][u]Passive:[/u][/color]\n• Hitpoints increased by [color=" + this.Const.UI.Color.PositiveValue + "]+12%[/color], Maximum Fatigue, and Initiative are increased by [color=" + this.Const.UI.Color.PositiveValue + "]+12[/color] each.";
		}

		o.onUpdate = function( _properties )
		{
			_properties.Hitpoints += this.Math.floor(0.12 * this.getContainer().getActor().getBaseProperties().Hitpoints);
			_properties.Stamina += 12;
			_properties.Initiative += 12;
		}

	});

	::mods_hookExactClass("skills/perks/perk_ptr_flail_spinner", function ( o )
	{

		o.spinFlail = function(_skill, _targetTile)
		{
			local targetEntity = _targetTile.getEntity();
			if (targetEntity == null)
			{
				return;
			}

			if (this.m.IsSpinningFlail || this.Math.rand(1,100) > this.m.Chance)
			{
				return;
			}

			local user = this.getContainer().getActor();

			if (this.Tactical.TurnSequenceBar.getActiveEntity().getID() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == user.getID())
			{
				if (!user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
				{
					this.getContainer().setBusy(true);
					this.Time.scheduleEvent(this.TimeUnit.Virtual, 300, function ( perk )
					{
						targetEntity = _targetTile.getEntity();
						if (targetEntity!= null && !targetEntity.isDying() && targetEntity.isAlive())
						{
							this.logDebug("[" + user.getName() + "] is Spinning The Flail on target [" + targetEntity.getName() + "] with skill [" + _skill.getName() + "]");
							if (!user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
							{
								this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " is Spinning the Flail");
							}

							perk.m.IsSpinningFlail = true;

							local isAbleToDie = targetEntity.m.IsAbleToDie;
							if (!user.isPlayerControlled())
							{
								targetEntity.m.IsAbleToDie = false;
							}

							_skill.useForFree(_targetTile);

							if (!user.isPlayerControlled())
							{
								targetEntity.m.IsAbleToDie = isAbleToDie;
							}

							perk.m.IsSpinningFlail = false;
						}

						this.getContainer().setBusy(false);

					}.bindenv(this), this);
				}
				else
				{
					if (targetEntity.isAlive())
					{
						this.logDebug("[" + user.getName() + "] is Spinning The Flail on target [" + targetEntity.getName() + "] with skill [" + _skill.getName() + "]");
						this.m.IsSpinningFlail = true;

						local isAbleToDie = targetEntity.m.IsAbleToDie;
						if (!user.isPlayerControlled())
						{
							targetEntity.m.IsAbleToDie = false;
						}

						_skill.useForFree(_targetTile);

						if (!user.isPlayerControlled())
						{
							targetEntity.m.IsAbleToDie = isAbleToDie;
						}

						this.m.IsSpinningFlail = false;
					}
				}
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_know_their_weakness", function ( o )
	{
		if("getMeleeBonus" in o) {
			o.getTooltip = function()
			{
				local tooltip = this.skill.getTooltip();

				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getMeleeBonus() + "[/color] Melee Skill"
				});

				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/ranged_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getRangedBonus() + "[/color] Ranged Skill"
				});

				return tooltip;
			}

			o.onUpdate = function( _properties )
			{
				_properties.MeleeSkill += this.getMeleeBonus();
				_properties.RangedSkill += this.getMeleeBonus();
			}

			o.onTargetKilled = function( _targetEntity, _skill )
			{
				if (_skill == null || !_skill.isAttack())
				{
					return;
				}

				this.m.MeleeStacks = this.Math.min(this.m.BonusMax / this.m.BonusMeleePerStack, this.m.MeleeStacks + 1);
				this.m.RangedStacks = this.Math.min(this.m.BonusMax / this.m.BonusRangedPerStack, this.m.RangedStacks + 1);
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_swordmaster_juggernaut", function ( o )
	{
		function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
		{
			if (this.m.Target != null || !_skill.isAttack() || _skill.isAOE() || !this.isEnabled())
			{
				this.m.Target = null;
				return;
			}

			this.m.Target = null;

			local targetTile = _targetEntity.getTile();

			local targets = [];

			for (local i = 0; i < 6; i++)
			{
				if (targetTile.hasNextTile(i))
				{
					local nextTile = targetTile.getNextTile(i);
					if (nextTile.IsOccupiedByActor)
					{
						local entity = nextTile.getEntity();
						if (!entity.isAlliedWith(this.getContainer().getActor())) targets.push(entity);
					}
				}
			}

			this.m.Target = ::MSU.Array.rand(targets);
			_skill.onUse(this.getContainer().getActor(), this.m.Target.getTile());
			this.m.Target = null;
		}
		

		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
		}
	});

	::mods_hookExactClass("skills/perks/perk_gifted", function ( o )
	{
		o.onAdded = function()
		{
			if (!this.m.IsApplied)
			{
				this.m.IsApplied = true;
				local actor = this.getContainer().getActor();
				actor.m.LevelUps += 2;
				actor.fillAttributeLevelUpValues(2, true);
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_bloodlust", function ( o )
	{
		o.onAnySkillExecuted = function( _skill, _targetTile, _targetEntity, _forFree )
		{
			if (!_skill.isAttack() || _skill.isRanged() || _targetEntity == null)
			{
				return;
			}

			local actor = this.getContainer().getActor();

			if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
			{
				return;
			}

			if (_targetEntity.getID() == actor.getID() || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(actor))
			{
				return;
			}

			local bleedCount = 0;

			if (!_targetEntity.isAlive() || _targetEntity.isDying())
			{
				bleedCount = this.m.BleedStacksBeforeAttack + 1;
			}
			else
			{
				bleedCount = _targetEntity.getSkills().getAllSkillsByID("effects.bleeding").len();
			}

			this.m.FatigueRecoveryStacks += bleedCount;

			actor.setFatigue(this.Math.max(0, actor.getFatigue() - actor.getFatigue() * (bleedCount * this.m.FatigueReductionPercentage * 0.01)));
		}

	});

	::mods_hookExactClass("skills/perks/perk_ptr_fresh_and_furious", function ( o )
	{
		o.onAnySkillExecuted = function( _skill, _targetTile, _targetEntity, _forFree )
		{
			this.m.IsSpent = true;
		}

	});


	::mods_hookExactClass("skills/perks/perk_ptr_promised_potential", function ( o )
	{
		o.onAdded = function()
		{
			if (this.m.IsSet || !this.getContainer().getActor().isPlayerControlled())
			{
				return;
			}

			local actor = this.getContainer().getActor();

			if (this.Math.rand(1, 100) <= 80)
			{
				this.m.WillSucceed = false;
			}

			this.m.IsSet = true;
		}

		o.updatePerkVisuals = function ()
		{
			foreach (perk in this.getContainer().getActor().getBackground().m.PerkTree[0])
			{
				if (perk.ID == "perk.ptr_promised_potential")
				{
					if (this.m.WillSucceed)
					{
						perk.Name = "Realized Potential";
						perk.Icon = "ui/perks/ptr_realized_potential.png";
						perk.Tooltip = this.Const.Strings.PerkDescription.PTRRealizedPotential;
						break;
					}
					else
					{
						perk.Name = "Failed Potential";
						perk.Icon = "ui/perks/ptr_failed_potential.png";
						perk.Tooltip = this.Const.Strings.PerkDescription.PTRFailedPotential;
					}
				}
			}
			this.m.IsVisualsUpdated = true;
		}

		o.onUpdateLevel = function()
		{
			local actor = this.getContainer().getActor();
			if(actor.getLevel() >= this.Math.min(100, this.World.Assets.m.EL_WorldLevel) && !this.m.IsSpent) {
				this.m.IsSpent = true;
				if(this.m.WillSucceed) {
					local bg = actor.getBackground();
					bg.m.Description += " Once a dreg of society, with your help, " + actor.getNameOnly() + " has grown into a full-fledged mercenary.";
					bg.m.RawDescription += " Once a dreg of society, with your help, %name% has grown into a full-fledged mercenary.";

					actor.m.PerkPoints += 5;

					for(local i = 0 ;i < this.Const.Attributes.COUNT; ++i) {
						actor.m.Talents[i] = this.Math.min(4, actor.m.Talents[i] + 1);
						actor.m.Attributes[i] = [];
					}
					this.Const.EL_Player.EL_PerkTree.EL_AddRandomPerkTreeToPlayer(actor, 50);
					actor.resetPerks();
					actor.improveMood(1.0, "Realized potential");
					this.updatePerkVisuals();
				}
			}
		}
		o.onUpdate = function(_properties) {
			if (this.m.IsSpent && !this.m.IsVisualsUpdated)
			{
				this.updatePerkVisuals();
			}
		}

	});

	::mods_hookExactClass("skills/perks/perk_ptr_strength_in_numbers", function ( o )
	{

		o.getBonus = function()
		{
			local actor = this.getContainer().getActor();

			if(actor == null || actor.isDying() || !actor.isAlive()) {
				return 0;
			}
			local others = this.Tactical.Entities.getAllInstancesAsArray();

			local count = 0;

			foreach (o in others)
			{
				if(o == null || o.isDying() || !o.isAlive() || o == actor) {
					continue;
				}
				if (o.isAlliedWith(actor) && actor.getTile().getDistanceTo(o.getTile()) <= 1)
				{
					count++;
				}
			}
			return count * this.m.BonusPerAdjacentAlly;
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_through_the_ranks", function ( o )
	{

		o.getDescription <- function()
		{
			return "Ranged attacks have a [color=" + this.Const.UI.Color.PositiveValue + "]+50[/color] reduced chance to inflict friendly fire.";
		}


		o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
		{
			if (_skill.isAttack() && _targetEntity != null && _targetEntity.getID() != this.getContainer().getActor().getID() && _targetEntity.getFaction() == this.getContainer().getActor().getFaction())
			{
				_properties.RangedSkill -= this.m.Bonus;
			}
		}
	});


	::mods_hookExactClass("skills/perks/perk_ptr_tunnel_vision", function ( o )
	{

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.VisionBonus + "[/color] Vision"
			});

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.SkillBonus + "[/color] Melee Skill"
			});

			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.SkillBonus + "[/color] Ranged Skill"
			});

			return tooltip;
		}

		o.onUpdate = function( _properties )
		{
			this.m.IsHidden = true;
			if (!this.World.getTime().IsDaytime && this.getContainer().getActor().isPlacedOnMap())
			{
				this.m.IsHidden = false;
				_properties.MeleeSkill += this.m.SkillBonus;
				_properties.MeleeDefense += this.m.SkillBonus;
			}
		}
	});

	::mods_hookExactClass("skills/perks/perk_ptr_unstoppable", function ( o )
	{

		o.onBeforeTargetHit = function( _skill, _targetEntity, _hitInfo )
		{
			this.m.Distance = 0;
			this.m.APBonusBefore = this.getAPBonus();
			local actor = this.getContainer().getActor();
            if(actor == null || actor.isDying() || !actor.isAlive()) {
                return;
            }
			if (_skill.isAttack() && !_targetEntity.isAlliedWith(actor))
			{
				this.m.Distance = _targetEntity.getTile().getDistanceTo(actor.getTile());
			}
		}

		o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
		{
			local actor = this.getContainer().getActor();
            if(actor == null || actor.isDying() || !actor.isAlive()) {
                return;
            }
			if (!_skill.isAttack() || _targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || _targetEntity.isAlliedWith(actor) || this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
			{
				return;
			}

			this.m.Stacks = this.Math.minf(this.m.MaxStacks, this.m.Stacks + (this.m.Distance > 1 ? 0.5 : 1));
			actor.setActionPoints(actor.getActionPoints() + this.getAPBonus() - this.m.APBonusBefore);
		}

		o.onTargetMissed = function( _skill, _targetEntity )
		{
			local actor = this.getContainer().getActor();
            if(actor == null || actor.isDying() || !actor.isAlive()) {
                return;
            }
			if (_skill.isAttack() && !_targetEntity.isAlliedWith(actor))
			{
				this.m.Stacks = this.Math.floor(this.m.Stacks / 2);
			}
		}
	});


	::mods_hookExactClass("skills/perks/perk_ptr_utilitarian", function ( o )
	{

		o.getTooltip = function()
		{
			local tooltip = this.skill.getTooltip();
			local fat = this.getTotalArmorFat();
			local actor = this.getContainer().getActor();
			local meleeSkillBonus = this.getMeleeSkillBonus(fat);
			if (meleeSkillBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + meleeSkillBonus + "[/color] Melee Skill"
				});
			}
			else if (meleeSkillBonus < 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + meleeSkillBonus + "[/color] Melee Skill"
				});
			}

			local fatReductionBonus = this.getFatigueReductionBonus(fat);
			if (fatReductionBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "Skills build up [color=" + this.Const.UI.Color.PositiveValue + "]-" + fatReductionBonus + "%[/color] Fatigue"
				});
			}
			else if (fatReductionBonus < 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/melee_skill.png",
					text = "Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]+" + this.Math.abs(fatReductionBonus) + "%[/color] Fatigue"
				});
			}

			local damageBonus = this.getDamageBonus(fat);
			if (damageBonus > 0)
			{
				tooltip.push({
					id = 10,
					type = "text",
					icon = "ui/icons/damage_dealt.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + damageBonus + "%[/color] Melee Damage"
				});
			}
			tooltip.push({
				id = 6,
				type = "hint",
				text = "负重临界值是 [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(15 * (1 + 0.04 * actor.EL_getCombatLevel())) + "[/color]."
			});
			return tooltip;
		}

		o.onUpdate = function( _properties )
		{
			if (!this.isEnabled())
			{
				return;
			}
			this.m.PivotFat = this.Math.floor(15 * (1 + _properties.EL_CombatLevel * 0.04));
			this.m.FatReductionMaxBonus = this.Math.floor(15 * (1 + _properties.EL_CombatLevel * 0.04));
			local fat = this.getTotalArmorFat();

			_properties.MeleeSkill += this.getMeleeSkillBonus(fat);
			_properties.FatigueEffectMult *= 1.0 - this.getFatigueReductionBonus(fat) * 0.01;
			_properties.MeleeDamageMult *= 1.0 + this.getDamageBonus(fat) * 0.01;
		}
	});

	::mods_hookExactClass("skills/perks/perk_rebound", function ( o )
	{
		o.onUpdate = function( _properties )
		{
			local actor = this.getContainer().getActor();
			local maxFat = actor.getFatigueMax();
			local currentFat = actor.getFatigue();
			local ratio = currentFat / (maxFat <= 0 ? 1 : maxFat);
			if (ratio > 0.9)
			{
				_properties.FatigueRecoveryRate += 5;
			}
		}

	});


	::mods_hookExactClass("skills/perks/perk_student", function ( o )
	{
		o.onUpdate = function( _properties )
		{
			if (this.getContainer().getActor().getLevel() < 11)
			{
				_properties.XPGainMult *= 1.2;
			}
		}

		o.onUpdateLevel <- function ()
		{
			local actor = this.getContainer().getActor();
			if (actor.getLevel() == 11)
			{
				++actor.m.PerkPoints;
			}
		};

	});


	gt.Const.EL_Config.EL_modStrings();

});

gt.Const.EL_Config.EL_modStrings <- function()
{
	local el_new_perk_description = [
        {
            ID = "perk.anticipation",
            tooltip = "By watching your opponent/\'s aim, you have more time to react.\n\nWhen being attacked with ranged weapons, gain [color=" + this.Const.UI.Color.PositiveValue + "]+5 Ranged Defense[/color] as additional Ranged Defense per tile that the attacker is away, and always at least [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] to Ranged Defense."
        },
		{
            ID = "perk.brawny",
            tooltip = "The fatigue and initiative penalty from wearing armor, helmet, weapon and shield is reduced by [color=" + this.Const.UI.Color.NegativeValue + "]30%[/color]."
        },
        {
            ID = "perk.colossus",
            tooltip = "Bring it on! Hitpoints are increased by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color], which also reduces the chance to sustain debilitating injuries when being hit."
        },
		{
            ID = "perk.dodge",
            tooltip = "对你来说太快了！获得角色当前主动值获得近战和远程防御的加成。"
        },
        {
            ID = "perk.fortified_mind",
            tooltip = "An iron will is not swayed from the true path easily. Resolve is increased by [color=" + this.Const.UI.Color.PositiveValue + "]+15[/color]."
        },
		{
            ID = "perk.footwork",
            tooltip = "Work those feet!\n\n[color=" + this.Const.UI.Color.Passive + "][u]Active:[/u][/color]\n• Costs 3 AP and builds 20 Fatigue."
        },
        {
            ID = "perk.legend_horse_hippology",
            tooltip = "Knowledge of horse physiology allows for better diet, exercise and care. Increases hitpoints by +25"
        },
        {
            ID = "perk.legend_horse_impulsion",
            tooltip = "Effective leverage of equestrian physiology relaxes the spinal column and allows the hindquarters to engage effectively. Increases Initiative by +30"
        },
        {
            ID = "perk.legend_horse_leg_control",
            tooltip = "it is not possible to hold the reins while firing a bow. Horse and rider must learn to communicate through the rider\'s legs. Increases ranged attack in battle by +25"
        },
        {
            ID = "perk.legend_horse_longeing",
            tooltip = "Time spent working on a long rope helps build trust between horse and rider. Increases resolve by +15"
        },
        {
            ID = "perk.legend_horse_tempi_change",
            tooltip = "the most challenging form of lead change, a tempi change requires shifting back and forth between lead legs. This form of training can allow the horse to change lead leg according to the situation, useful when under fire. Increases ranged defense by +25"
        },
        {
            ID = "perk.legend_alert",
            tooltip = "Pay close attention at all times, surveying the surroundings and assessing every clue for an insight. Gain [color=" + this.Const.UI.Color.PositiveValue + "]+30[/color] Initiative."
        },
        {
            ID = "perk.legend_ammo_binding",
            tooltip = "Expertise in making ammunition lets you strip it down to pack the parts for storage, it also lets you draw out arrows faster. Increases maximum ammunition storage by [color=" + this.Const.UI.Color.PositiveValue + "]10[/color] and Ranged skill by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]."
        },
        {
            ID = "perk.legend_ammo_bundles",
            tooltip = "Using blankets and ropes to group large bundles of ammunition together you are able to carry far more. These bundles can also be used to shield yourself from enemy fire. Increases maximum ammunition storage by [color=" + this.Const.UI.Color.PositiveValue + "]20[/color] and Ranged Defense by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]"
        },
        {
            ID = "perk.legend_assured_conquest",
            tooltip = "你的信心影响的发挥。自信时获得 [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] 近攻，远攻，近防和远防。加成的属性会在士气衰减时衰减。稳定士气[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]，溃散士气[color=" + this.Const.UI.Color.NegativeValue + "]-5[/color]，逃跑士气[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color]。"
        },
		{
            ID = "perk.legend_barter_greed",
            tooltip = "This character is keen to guard the horde of gold the company has accumulated — and intends to protect it with their life. \n\n[color=#4f1800][u]Passive:[/u][/color]\n• Gains [color=" + this.Const.UI.Color.PositiveValue + "]5[/color] Melee Skill, Ranged Skill, Melee Defence, Ranged Defence and \n [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] Resolve for the fisrt 10000 crowns.\n• The needs of crowns to increace the properties is doubled when reaching the limit."
        },
        {
            ID = "perk.legend_med_ingredients",
            tooltip = "Learning the plants of the healing trade allows you to fashion crude healing supplies from common ingredients. Unlocks crafting bandages and medicine. Also increases maximum medicine storage by 10 and resolve by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]."
        },
        {
            ID = "perk.legend_med_packages",
            tooltip = "Not all of a plant is required for healing, your knowledge of the active ingredients lets you throw away excess leaves and roots.Your knowledge of medicines lets you repack them into more efficient packages. Increases maximum medicine storage by 30 and resolve by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color]"
        },
        {
            ID = "perk.legend_muscularity",
            tooltip = "把你的重量运用到每次攻击，增加基于最大生命值的伤害（生命值越高，单位生命值收益越小）。"
        },
        {
            ID = "perk.legend_pacifist",
            tooltip = "Fighting is a brutal thuggish pastime, most folk prefer a life without frequent bouts of extreme violence.  This character does not count towards your party strength when determining game difficulty. They will gain [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] resolve. They become content with being in reserve, and will grow unhappy if they are in more than half of the battles your company takes."
        },
        {
            ID = "perk.lone_wolf",
            tooltip = "I work best alone. With no ally within 2 tiles of distance, gain a [color=" + this.Const.UI.Color.PositiveValue + "]15[/color] bonus to Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve."
        },
		{
            ID = "perk.ptr_bloodbath",
            tooltip = "[color=" + this.Const.UI.Color.NegativeValue + "][u]Requires:[/u] Cutting Damage[/color]\n你只想再来一遍去头术！\n\n[color=" + this.Const.UI.Color.Passive + "][u]被动:[/u][/color]\n• 击杀后叠一层血浴，每层使下回合增加 [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] 行动点，最多增加[color=" + this.Const.UI.Color.PositiveValue + "]9[/color]点。\n• 回合开始时减少3层效果。"
        },
		{
            ID = "perk.ptr_cull",
            tooltip = "[color=" + this.Const.UI.Color.NegativeValue + "][u]Requires:[/u] Axe[/color]\n对生命值低于 50% 的单位造成 200% 的伤害。"
        },
		{
            ID = "perk.ptr_discovered_talent",
            tooltip = "You don\'t know where it came from, but you\'ve suddenly started excelling at everything you do!\n\n[color=" + this.Const.UI.Color.OneTimeEffect + "][u]One-Time Effect:[/u][/color]\n• Gain [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] Star to the talents in all attributes.\n• Then instantly gain a levelup to increase this character's attributes using normal rolls with talents.\n• 不能超过自身的潜力上限。"
        },
		{
            ID = "perk.ptr_fresh_and_furious",
            tooltip = "战斗开始时的活力是你造成最大伤害的时候！\n\n[color=" + this.Const.UI.Color.Passive + "][u]被动：[/u][/color]\n• 当回合开始疲劳恢复后低于[color=" + this.Const.UI.Color.NegativeValue + "]30%[/color]最大疲劳，每回合第一个技能的行动点消耗[color=" + this.Const.UI.Color.PositiveValue + "]减半[/color]，疲劳消耗减少[color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]。"
        },
        {
            ID = "perk.ptr_fruits_of_labor",
            tooltip = "You\'ve quickly realized that your years of hard labor give you an edge in mercenary work!\n\n[color=" + this.Const.UI.Color.Passive + "][u]Passive:[/u][/color]\n• Hitpoints, Maximum Fatigue, and Initiative are increased by [color=" + this.Const.UI.Color.PositiveValue + "]+12[/color] each."
        },
		{
            ID = "perk.ptr_formidable_approach",
            tooltip = "[color=" + this.Const.UI.Color.NegativeValue + "][u]Requires:[/u] Two-Handed Melee Weapon[/color]\nMake them think twice about getting close!\n\n[color=" + this.Const.UI.Color.Passive + "][u]Passive:[/u][/color]\n• 当持有双手武器时，减少控制区域内的敌方单位 [color=" + this.Const.UI.Color.NegativeValue + "]10[/color] 点近攻和近防。\n• The debuff lasts until the enemy exits your zone of control or successfully hits you.\n• Only has half the effect against enemies with Two-Handed weapons, and does not work if the enemy also has this perk."
        },
		{
            ID = "perk.ptr_promised_potential",
            tooltip = "队长说他要赌一把你的可能性，但你最好不要失望！\n\n[color=" + this.Const.UI.Color.OneTimeEffect + "][u]一次性效果：[/u][/color]\n达到世界等级时有[color=" + this.Const.UI.Color.PositiveValue + "] 20% [/color]的机会被替换为\'实现潜能\'，这会使你的所有属性天赋[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color], 获得 [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] 特技点，解锁大约 [color=" + this.Const.UI.Color.PositiveValue + "]+50[/color] 个可选特技并且返还所有小号的特技点，包括花在这个特技上的。"
        },
		{
            ID = "perk.ptr_target_practice",
            tooltip = "训练时间让你能够想出一种有效的方法来分配弹药, 同时提高你的准确性!\n\n[color=" + this.Const.UI.Color.Passive + "][u]被动:[/u][/color]\n• 切换箭袋不会消耗行动点.\n• 瞄准射击获得 [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] 命中率."
        },

        {
            ID = "perk.ptr_through_the_ranks",
            tooltip = "Ranged attacks have a [color=" + this.Const.UI.Color.PositiveValue + "]+50[/color] reduced chance to inflict friendly fire."
        },
		{
            ID = "perk.ptr_unstoppable",
            tooltip = "Once you get going, you can\'t be stopped!\n\n[color=" + this.Const.UI.Color.Passive + "][u]Passive:[/u][/color]\n• During your turn, every successful attack provides a stacking bonus to Melee Skill and Action Points.\n• Each stack increases Melee Skill by [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color].\n• Your Action Points are increased by a total of [color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] at 3 stacks, [color=" + this.Const.UI.Color.PositiveValue + "]+2[/color] at 6 stacks and [color=" + this.Const.UI.Color.PositiveValue + "]+3[/color] at 10 stacks.\n• Attacks at 2 tiles range only grant a stack after two successful hits.\n• You lose half of the stacks if you miss an attack or if you get hit.\n• Cannot have more than 10 stacks."
        },

        {
            ID = "perk.ptr_bulwark",
            tooltip = "\'Not much to be afraid of behind a suit of plate!\'\n\n[color=" + this.Const.UI.Color.Passive + "][u]Passive:[/u][/color]\n• 获得基于当前盔甲总耐久度的决心。\n• This bonus is [color=" + this.Const.UI.Color.PositiveValue + "]doubled[/color] against negative morale checks except mental attacks."
        },
        {
            ID = "perk.student",
            tooltip = "如果你全神贯注，你一切都可以学到. 额外获得 [color=" + this.Const.UI.Color.PositiveValue + "]20%[/color] 的经验。达到11级时, 不再获得加成，并额外获得1个特技点。"
        },
        {
            ID = "perk.gifted",
            tooltip = "当你天生有天赋的时候，雇佣兵的生活就会变得轻松。这个角色立即获得两次以能掷骰出的最大点数给属性加点的机会，但没有天赋的加成。"
        },
		{
			ID = "perk.legend_berserker_rage",
			tooltip = "Gain rage stacks over the course of a battle. Each stack increases Damage by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color], initiative by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color], resolve by [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] and reduces damage received by [color=" + this.Const.UI.Color.PositiveValue + "]4%[/color]. Gain [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] stack each time you take damage, and [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] stacks each time you kill. Lose [color=" + this.Const.UI.Color.NegativeValue + "]2[/color] rage stacks per turn.",
		}
	];

    foreach( i, perk in gt.Const.Perks.PerkDefObjects )
    {
        foreach(adjust_perk in el_new_perk_description)
        {
            if (perk.ID == adjust_perk.ID)
            {
                perk.Tooltip = adjust_perk.tooltip;
                break;
            }
        }
    }
}