local gt = getroottable();

::mods_registerMod("el_weapon", 1, "el_weapon");
::mods_queue(null, "el_item", function ()
{
    ::mods_hookExactClass("items/weapons/weapon", function ( o )
	{
		o.m.EL_Vision <- 0;
		o.m.EL_AdditionalExplosionRange <- 0;

        o.m.EL_BaseNoRankShieldDamage <- 0;
		o.m.EL_BaseNoRankRegularDamage <- 0;
		o.m.EL_BaseNoRankRegularDamageMax <- 0;
		o.m.EL_BaseNoRankStaminaModifier <- 0;

        o.m.EL_BaseWithRankShieldDamage <- 0;
		o.m.EL_BaseWithRankRegularDamage <- 0;
		o.m.EL_BaseWithRankRegularDamageMax <- 0;
		o.m.EL_BaseWithRankStaminaModifier <- 0.0;

		o.m.EL_BaseNoRankAmmoMax <- 0;
		o.m.EL_BaseNoRankArmorDamageMult <- 0.0;
		o.m.EL_BaseNoRankDirectDamageAdd <- 0.0;
		o.m.EL_BaseNoRankChanceToHitHead <- 0;
		o.m.EL_BaseNoRankAdditionalAccuracy <- 0;
		o.m.EL_BaseNoRankFatigueOnSkillUse <- 0;
		o.m.EL_BaseNoRankRangeMax <- 0;

		o.m.EL_BaseWithRankVision <- 0;
		o.m.EL_BaseWithRankAmmoMax <- 0;
		o.m.EL_BaseWithRankArmorDamageMult <- 0.0;
		o.m.EL_BaseWithRankDirectDamageAdd <- 0.0;
		o.m.EL_BaseWithRankChanceToHitHead <- 0;
		o.m.EL_BaseWithRankAdditionalAccuracy <- 0;
		o.m.EL_BaseWithRankFatigueOnSkillUse <- 0;
		o.m.EL_BaseWithRankRangeMax <- 0;

		local getTooltip = o.getTooltip;
		o.getTooltip = function ()
		{
			local result = getTooltip();

			if(this.m.EL_RankLevel == 0)
			{
				result[0] = {
					id = 1,
					type = "title",
					text = this.getName()
				};
			}
			else
			{
				result[0] = {
					id = 1,
					type = "title",
					text = "[color=" + this.Const.EL_Item.Colour[this.m.EL_RankLevel] +"]" + this.getName() + "[/color]"
				};
			}
			result.insert(4, {
				id = 22,
				type = "text",
				text = "等阶: " + this.m.EL_RankLevel + "/" + this.EL_getRankLevelMax()
			});
			if(this.m.EL_CurrentLevel < this.m.EL_Level)
			{
				result.insert(5, {
					id = 23,
					type = "text",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]等级: " + this.m.EL_CurrentLevel + "/" + this.m.EL_Level + "[/color]"
				});
			}
			else
			{
				result.insert(5, {
					id = 23,
					type = "text",
					text = "等级: " + this.m.EL_Level
				});
			}
			if (this.m.EL_Vision != 0)
			{
				result.push({
					id = 25,
					type = "text",
					icon = "ui/icons/vision.png",
					text = "Vision: [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.EL_Vision + "[/color]"
				});
			}
			if (this.m.EL_AdditionalExplosionRange != 0)
			{
				result.push({
					id = 26,
					type = "text",
					text = "额外爆炸范围: [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.EL_AdditionalExplosionRange + "[/color]"
				});
			}
			if (this.m.EL_EntryList.len() != 0)
			{
				result.push({
					id = 60,
					type = "text",
					text = "——————————————"
				});
				local tool_tip_id = 61;
				foreach(entry in this.m.EL_EntryList)
				{
					local tool_tip = entry.getTooltip(tool_tip_id);
					if(tool_tip != null)
					{
						result.push(tool_tip);
						++tool_tip_id;
					}
				}
			}
			for(local i = 0; i < result.len(); ++i)
			{
				if(result[i].id == 4 && result[i].icon == "ui/icons/regular_damage.png")
				{
					result[i] = {
						id = 5,
						type = "text",
						icon = "ui/icons/melee_defense.png",
						text = "Damage of [color=" + this.Const.UI.Color.DamageValue + "]" + this.m.RegularDamage + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + this.m.RegularDamageMax + "[/color] (" + this.m.EL_BaseNoRankRegularDamage + " - " + this.m.EL_BaseNoRankRegularDamageMax + ")"
					};
				}
				else if(result[i].id == 8 && result[i].icon == "ui/icons/fatigue.png")
				{
					result[i] = {
						id = 8,
						type = "text",
						icon = "ui/icons/fatigue.png",
						text = "Maximum Fatigue [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.StaminaModifier + "[/color] (" + this.m.EL_BaseNoRankStaminaModifier + ")"
					};
					break;
				}
			}
			if(this.m.EL_CurrentLevel < this.m.EL_Level)
			{
				result.push({
					id = 75,
					type = "text",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]当前人物的战斗等级无法发挥装备全部性能。[/color]"
				});
			}
			return result;
		}

		local onUpdateProperties = o.onUpdateProperties;
		o.onUpdateProperties = function ( _properties )
		{
			local stamina_mult = this.getContainer().getActor().getSkills().hasSkill("perk.brawny") ? 0.7 : 1.0;
			_properties.Stamina += this.Math.floor(this.m.StaminaModifier * stamina_mult);
			_properties.DamageRegularMin += this.m.RegularDamage;
			_properties.DamageRegularMax += this.m.RegularDamageMax;
			_properties.DamageArmorMult *= this.m.ArmorDamageMult;
			_properties.DamageDirectAdd += this.m.DirectDamageAdd;
			_properties.HitChance[this.Const.BodyPart.Head] += this.m.ChanceToHitHead;
			_properties.Vision += this.m.EL_Vision;
		}

		local onEquip = o.onEquip;
		o.onEquip = function ()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/el_items/el_item_level_check_skill"));
            foreach(entry in this.m.EL_EntryList)
			{
				entry.m.IsGarbage = false;
				entry.m.IsStacking = false;
				this.EL_addEntry(entry);
			}
		}

		local onUnequip = o.onUnequip;
		o.onUnequip = function ()
		{
			onUnequip();
			this.m.EL_CurrentLevel = this.m.EL_Level;
			EL_updateLevelProperties();
		}

        local onSerialize = o.onSerialize;
		o.onSerialize = function ( _out )
		{
			onSerialize(_out);

			_out.writeF32(this.m.ArmorDamageMult);
			_out.writeU16(this.m.ChanceToHitHead);
			_out.writeI16(this.m.AdditionalAccuracy);
			_out.writeF32(this.m.DirectDamageAdd);
			_out.writeI16(this.m.FatigueOnSkillUse);
			_out.writeU16(this.m.AmmoMax);
			_out.writeI32(this.m.EL_Vision);
			_out.writeI32(this.m.EL_AdditionalExplosionRange);

			_out.writeI32(this.m.EL_BaseNoRankShieldDamage);
			_out.writeI32(this.m.EL_BaseNoRankRegularDamage);
			_out.writeI32(this.m.EL_BaseNoRankRegularDamageMax);
            _out.writeI32(this.m.EL_BaseNoRankStaminaModifier);

			_out.writeI32(this.m.EL_BaseWithRankShieldDamage);
			_out.writeI32(this.m.EL_BaseWithRankRegularDamage);
			_out.writeI32(this.m.EL_BaseWithRankRegularDamageMax);
            _out.writeF32(this.m.EL_BaseWithRankStaminaModifier);

			_out.writeI32(this.m.EL_BaseNoRankAmmoMax);
			_out.writeF32(this.m.EL_BaseNoRankArmorDamageMult);
            _out.writeF32(this.m.EL_BaseNoRankDirectDamageAdd);
			_out.writeI32(this.m.EL_BaseNoRankChanceToHitHead);
			_out.writeI32(this.m.EL_BaseNoRankAdditionalAccuracy);
			_out.writeI32(this.m.EL_BaseNoRankFatigueOnSkillUse);
			_out.writeI32(this.m.EL_BaseNoRankRangeMax);

			_out.writeI32(this.m.EL_BaseWithRankVision);
			_out.writeI32(this.m.EL_BaseWithRankAmmoMax);
			_out.writeF32(this.m.EL_BaseWithRankArmorDamageMult);
            _out.writeF32(this.m.EL_BaseWithRankDirectDamageAdd);
			_out.writeI32(this.m.EL_BaseWithRankChanceToHitHead);
			_out.writeI32(this.m.EL_BaseWithRankAdditionalAccuracy);
			_out.writeI32(this.m.EL_BaseWithRankFatigueOnSkillUse);
			_out.writeI32(this.m.EL_BaseWithRankRangeMax);
			_out.writeF32(this.m.Condition);
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize(_in);
			this.m.ArmorDamageMult = _in.readF32();
			this.m.ChanceToHitHead = _in.readU16();
			this.m.AdditionalAccuracy = _in.readI16();
			this.m.DirectDamageAdd = _in.readF32();
			this.m.FatigueOnSkillUse = _in.readI16();
			this.m.AmmoMax = _in.readU16();
			this.m.EL_Vision = _in.readI32();
			this.m.EL_AdditionalExplosionRange = _in.readI32();

			this.m.EL_BaseNoRankShieldDamage = _in.readI32();
			this.m.EL_BaseNoRankRegularDamage = _in.readI32();
			this.m.EL_BaseNoRankRegularDamageMax = _in.readI32();
            this.m.EL_BaseNoRankStaminaModifier = _in.readI32();

			this.m.EL_BaseWithRankShieldDamage = _in.readI32();
			this.m.EL_BaseWithRankRegularDamage = _in.readI32();
			this.m.EL_BaseWithRankRegularDamageMax = _in.readI32();
            this.m.EL_BaseWithRankStaminaModifier = _in.readF32();

			this.m.EL_BaseNoRankAmmoMax = _in.readI32();
			this.m.EL_BaseNoRankArmorDamageMult = _in.readF32();
            this.m.EL_BaseNoRankDirectDamageAdd = _in.readF32();
			this.m.EL_BaseNoRankChanceToHitHead = _in.readI32();
			this.m.EL_BaseNoRankAdditionalAccuracy = _in.readI32();
			this.m.EL_BaseNoRankFatigueOnSkillUse = _in.readI32();
			this.m.EL_BaseNoRankRangeMax = _in.readI32();

			this.m.EL_BaseWithRankVision = _in.readI32();
			this.m.EL_BaseWithRankAmmoMax = _in.readI32();
			this.m.EL_BaseWithRankArmorDamageMult = _in.readF32();
            this.m.EL_BaseWithRankDirectDamageAdd = _in.readF32();
			this.m.EL_BaseWithRankChanceToHitHead = _in.readI32();
			this.m.EL_BaseWithRankAdditionalAccuracy = _in.readI32();
			this.m.EL_BaseWithRankFatigueOnSkillUse = _in.readI32();
			this.m.EL_BaseWithRankRangeMax = _in.readI32();
			if(this.m.EL_Level != -1 && this.m.ConditionMax != 1)
			{
				this.m.ConditionMax = this.Math.ceil(this.m.EL_BaseWithRankConditionMax * (1 + this.Const.EL_Armor.EL_LevelFactor.Condition * this.m.EL_CurrentLevel));
			}
            this.m.Condition = _in.readF32();
			this.m.RangeMax = this.m.EL_BaseWithRankRangeMax != 0 ? this.m.EL_BaseWithRankRangeMax : this.m.RangeMax;
		}

		local consumeAmmo = o.consumeAmmo;
		o.consumeAmmo = function()
		{
			local skills = this.getContainer().getActor().getSkills();
			if(skills.getSkillByID("el_weapon_entry.save_ammo") != null && this.Math.rand(1, 100) <= skills.getSkillByID("el_weapon_entry.save_ammo").m.EL_SaveAmmoChance)
			{
				return;
			}
			if(skills.getSkillByID("el_rarity_entry.infinite_penetration") != null && skills.getSkillByID("el_rarity_entry.infinite_penetration").EL_isUsable())
			{
				return;
			}
			// foreach( skill in skills.m.Skills ) {
			// 	local skill_id = skill.getID()
			// 	if(skill_id == "el_rarity_entry.infinite_penetration" && skill.EL_isUsable())
			// 	{
			// 		return;
			// 	}
			// }
			consumeAmmo();
		}

		o.getShieldDamage = function()
		{
			if (this.getContainer() == null || this.getContainer().getActor() == null)
			{
				return this.m.ShieldDamage;
			}
			local skill = this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.devastate");
			local shield_damage = (skill != null && skill.EL_isUsable()) ? this.Math.floor(this.m.ShieldDamage * this.Const.EL_Rarity_Entry.Factor.EL_Devastate.ShieldDamageMult) : this.m.ShieldDamage;
			skill = this.getContainer().getActor().getSkills().getSkillByID("el_rarity_entry.vehemence_of_the_sky");
			shield_damage = (skill != null && skill.EL_isUsable()) ? this.Math.floor(this.m.RegularDamageMax * this.Const.EL_Rarity_Entry.Factor.EL_VehemenceOfTheSky.ShieldDamageMult) : shield_damage;
			skill = this.getContainer().getActor().getSkills().getSkillByID("perk.legend_smashing_shields");
			return skill == null ? shield_damage : this.Math.round(shield_damage * skill.getModifier());
		}

		o.isAmountShown = function()
		{
			return true;
		}

		o.getAmountString = function()
		{
			this.Const.EL_Item_Other.EL_otherItemInit(this);
			if(this.m.Condition < this.m.ConditionMax)
			{
				return "lv" + this.m.EL_Level + ":" + this.Math.floor(this.m.Condition / (this.m.ConditionMax * 1.0) * 100) + "%";
			}
			return "lv" + this.m.EL_Level;
		}

		o.getAmountColor = function()
		{
			return this.Const.EL_Item.Colour[this.m.EL_RankLevel];
		}

		o.EL_getBaseNoRankShieldDamage <- function()
        {
			return this.m.EL_BaseNoRankShieldDamage;
        }
		o.EL_setBaseNoRankShieldDamage <- function( _EL_baseNoRankShieldDamage )
        {
			this.m.EL_BaseNoRankShieldDamage = _EL_baseNoRankShieldDamage;
        }
		o.EL_getBaseNoRankRegularDamage <- function()
        {
			return this.m.EL_BaseNoRankRegularDamage;
        }
		o.EL_setBaseNoRankRegularDamage <- function( _EL_baseNoRankRegularDamage )
        {
			this.m.EL_BaseNoRankRegularDamage = _EL_baseNoRankRegularDamage;
        }
		o.EL_getBaseNoRankRegularDamageMax <- function()
        {
			return this.m.EL_BaseNoRankRegularDamageMax;
        }
		o.EL_setBaseNoRankRegularDamageMax <- function( _EL_baseNoRankRegularDamageMax )
        {
			this.m.EL_BaseNoRankRegularDamageMax = _EL_baseNoRankRegularDamageMax;
        }
		o.EL_getBaseNoRankStaminaModifier <- function()
        {
			return this.m.EL_BaseNoRankStaminaModifier;
        }
		o.EL_setBaseNoRankStaminaModifier <- function( _EL_baseNoRankStaminaModifier )
        {
			this.m.EL_BaseNoRankStaminaModifier = _EL_baseNoRankStaminaModifier;
        }
		o.EL_getBaseWithRankShieldDamage <- function()
        {
			return this.m.EL_BaseWithRankShieldDamage;
        }
		o.EL_setBaseWithRankShieldDamage <- function( _EL_baseWithRankShieldDamage )
        {
			this.m.EL_BaseWithRankShieldDamage = _EL_baseWithRankShieldDamage;
        }
		o.EL_getBaseWithRankRegularDamage <- function()
        {
			return this.m.EL_BaseWithRankRegularDamage;
        }
		o.EL_setBaseWithRankRegularDamage <- function( _EL_baseWithRankRegularDamage )
        {
			this.m.EL_BaseWithRankRegularDamage = _EL_baseWithRankRegularDamage;
        }
		o.EL_getBaseWithRankRegularDamageMax <- function()
        {
			return this.m.EL_BaseWithRankRegularDamageMax;
        }
		o.EL_setBaseWithRankRegularDamageMax <- function( _EL_baseWithRankRegularDamageMax )
        {
			this.m.EL_BaseWithRankRegularDamageMax = _EL_baseWithRankRegularDamageMax;
        }
		o.EL_getBaseWithRankStaminaModifier <- function()
        {
			return this.m.EL_BaseWithRankStaminaModifier;
        }
		o.EL_setBaseWithRankStaminaModifier <- function( _EL_baseWithRankStaminaModifier )
        {
			this.m.EL_BaseWithRankStaminaModifier = _EL_baseWithRankStaminaModifier;
        }
		o.EL_getBaseWithRankVision <- function()
        {
			return this.m.EL_BaseWithRankVision;
        }
		o.EL_setBaseWithRankVision <- function( _EL_baseWithRankVision )
        {
			this.m.EL_BaseWithRankVision = _EL_baseWithRankVision;
        }
		o.EL_getBaseNoRankAmmoMax <- function()
        {
			return this.m.EL_BaseNoRankAmmoMax;
        }
		o.EL_setBaseNoRankAmmoMax <- function( _EL_baseNoRankAmmoMax )
        {
			this.m.EL_BaseNoRankAmmoMax = _EL_baseNoRankAmmoMax;
        }
		o.EL_getBaseWithRankAmmoMax <- function()
        {
			return this.m.EL_BaseWithRankAmmoMax;
        }
		o.EL_setBaseWithRankAmmoMax <- function( _EL_baseWithRankAmmoMax )
        {
			this.m.EL_BaseWithRankAmmoMax = _EL_baseWithRankAmmoMax;
        }
		o.EL_getBaseNoRankArmorDamageMult <- function()
        {
			return this.m.EL_BaseNoRankArmorDamageMult;
        }
		o.EL_setBaseNoRankArmorDamageMult <- function( _EL_baseNoRankArmorDamageMult )
        {
			this.m.EL_BaseNoRankArmorDamageMult = _EL_baseNoRankArmorDamageMult;
        }
		o.EL_getBaseWithRankArmorDamageMult <- function()
        {
			return this.m.EL_BaseWithRankArmorDamageMult;
        }
		o.EL_setBaseWithRankArmorDamageMult <- function( _EL_baseWithRankArmorDamageMult )
        {
			this.m.EL_BaseWithRankArmorDamageMult = _EL_baseWithRankArmorDamageMult;
        }
		o.EL_getBaseNoRankDirectDamageAdd <- function()
        {
			return this.m.EL_BaseNoRankDirectDamageAdd;
        }
		o.EL_setBaseNoRankDirectDamageAdd <- function( _EL_baseNoRankDirectDamageAdd )
        {
			this.m.EL_BaseNoRankDirectDamageAdd = _EL_baseNoRankDirectDamageAdd;
        }
		o.EL_getBaseWithRankDirectDamageAdd <- function()
        {
			return this.m.EL_BaseWithRankDirectDamageAdd;
        }
		o.EL_setBaseWithRankDirectDamageAdd <- function( _EL_baseWithRankDirectDamageAdd )
        {
			this.m.EL_BaseWithRankDirectDamageAdd = _EL_baseWithRankDirectDamageAdd;
        }
		o.EL_getBaseNoRankChanceToHitHead <- function()
        {
			return this.m.EL_BaseNoRankChanceToHitHead;
        }
		o.EL_setBaseNoRankChanceToHitHead <- function( _EL_baseNoRankChanceToHitHead )
        {
			this.m.EL_BaseNoRankChanceToHitHead = _EL_baseNoRankChanceToHitHead;
        }
		o.EL_getBaseWithRankChanceToHitHead <- function()
        {
			return this.m.EL_BaseWithRankChanceToHitHead;
        }
		o.EL_setBaseWithRankChanceToHitHead <- function( _EL_baseWithRankChanceToHitHead )
        {
			this.m.EL_BaseWithRankChanceToHitHead = _EL_baseWithRankChanceToHitHead;
        }
		o.EL_getBaseNoRankAdditionalAccuracy <- function()
        {
			return this.m.EL_BaseNoRankAdditionalAccuracy;
        }
		o.EL_setBaseNoRankAdditionalAccuracy <- function( _EL_baseNoRankAdditionalAccuracy )
        {
			this.m.EL_BaseNoRankAdditionalAccuracy = _EL_baseNoRankAdditionalAccuracy;
        }
		o.EL_getBaseWithRankAdditionalAccuracy <- function()
        {
			return this.m.EL_BaseWithRankAdditionalAccuracy;
        }
		o.EL_setBaseWithRankAdditionalAccuracy <- function( _EL_baseWithRankAdditionalAccuracy )
        {
			this.m.EL_BaseWithRankAdditionalAccuracy = _EL_baseWithRankAdditionalAccuracy;
        }
		o.EL_getBaseNoRankFatigueOnSkillUse <- function()
        {
			return this.m.EL_BaseNoRankFatigueOnSkillUse;
        }
		o.EL_setBaseNoRankFatigueOnSkillUse <- function( _EL_baseNoRankFatigueOnSkillUse )
        {
			this.m.EL_BaseNoRankFatigueOnSkillUse = _EL_baseNoRankFatigueOnSkillUse;
        }
		o.EL_getBaseWithRankFatigueOnSkillUse <- function()
        {
			return this.m.EL_BaseWithRankFatigueOnSkillUse;
        }
		o.EL_setBaseWithRankFatigueOnSkillUse <- function( _EL_baseWithRankFatigueOnSkillUse )
        {
			this.m.EL_BaseWithRankFatigueOnSkillUse = _EL_baseWithRankFatigueOnSkillUse;
        }
		o.EL_getBaseNoRankRangeMax <- function()
        {
			return this.m.EL_BaseNoRankRangeMax;
        }
		o.EL_setBaseNoRankRangeMax <- function( _EL_baseNoRankRangeMax )
        {
			this.m.EL_BaseNoRankRangeMax = _EL_baseNoRankRangeMax;
        }
		o.EL_getBaseWithRankRangeMax <- function()
        {
			return this.m.EL_BaseWithRankRangeMax;
        }
		o.EL_setBaseWithRankRangeMax <- function( _EL_baseWithRankRangeMax )
        {
			this.m.EL_BaseWithRankRangeMax = _EL_baseWithRankRangeMax;
        }
		o.EL_getLevelAddtionStaminaModifier <- function()
		{
			local stamina_mult = this.getContainer().getActor().getSkills().hasSkill("perk.brawny") ? 0.7 : 1.0;
			return this.m.StaminaModifier - this.m.EL_BaseWithRankStaminaModifier * stamina_mult;
		}
		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Normal;
		}

		//Initialize equipment based on level and rank after generating items
        o.EL_generateByRankAndLevel <- function( _EL_rankLevel, EL_level, EL_additionalRarityChance = 0 )
        {
			local percent = 0;
			percent = (this.m.Condition * 1.0)/ this.m.ConditionMax;
			if(this.m.EL_Level == -1)
			{
				this.m.EL_RankLevel = this.Math.min(this.m.EL_RankLevel + _EL_rankLevel, this.EL_getRankLevelMax());
				this.m.EL_Level = this.Math.min(EL_getLevelMax(), EL_level);
				EL_recordBaseNoRankProperties();
				this.Const.EL_Weapon.EL_updateRankLevelProperties(this);
				local entry_num = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_Entry.EntryNum.OneHanded[this.m.EL_RankLevel] : this.Const.EL_Weapon.EL_Entry.EntryNum.TwoHanded[this.m.EL_RankLevel];
        		this.Const.EL_Weapon.EL_assignItemEntrys(this, entry_num);
			}
			this.m.EL_CurrentLevel = this.m.EL_Level;
			EL_updateLevelProperties();
			this.m.Condition = this.m.ConditionMax * percent;
		}

		o.EL_addRankLevel <- function()
		{
			if(EL_getRankLevel() < this.Const.EL_Item.Type.Legendary)
			{
				++this.m.EL_RankLevel;
				EL_init();
				foreach(entry in this.m.EL_EntryList)
				{
					entry.EL_onUpgradeRank();
				}
				this.Const.EL_Weapon.EL_updateRankLevelProperties(this);
				local entry_num = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_Entry.EntryNum.OneHanded[this.m.EL_RankLevel] : this.Const.EL_Weapon.EL_Entry.EntryNum.TwoHanded[this.m.EL_RankLevel];
				this.Const.EL_Weapon.EL_assignItemEntrys(this, entry_num);
				this.setCondition(this.getConditionMax());
			}
		}

        o.EL_upgradeLevel <- function()
        {
			if(this.m.EL_Level < EL_getLevelMax())
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				this.m.EL_Level += 1;
				this.m.EL_CurrentLevel = this.m.EL_Level;
				EL_updateLevelProperties();
			}
        }

        o.EL_upgradeRank <- function()
        {
			if(EL_getRankLevel() < EL_getRankLevelMax())
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				++this.m.EL_RankLevel;
				EL_init();
				foreach(entry in this.m.EL_EntryList)
				{
					entry.EL_onUpgradeRank();
				}
				this.Const.EL_Weapon.EL_updateRankLevelProperties(this);
				local entry_num = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_Entry.EntryNum.OneHanded[this.m.EL_RankLevel] : this.Const.EL_Weapon.EL_Entry.EntryNum.TwoHanded[this.m.EL_RankLevel];
        		this.Const.EL_Weapon.EL_assignItemEntrys(this, entry_num);
			}
			else if(this.m.EL_StrengthenEntryNum < this.m.EL_EntryList.len())
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				++this.m.EL_StrengthenEntryNum;
			}
			EL_updateLevelProperties();
        }

		o.EL_disassemble <- function(_itemIndex)
		{
			this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
			local stash = this.World.Assets.getStash();
			stash.remove(this);
		}

		o.EL_recraft <- function()
        {
			if(this.m.EL_RankLevel && this.m.EL_Level != -1)
			{
				this.Sound.play("sounds/ambience/buildings/blacksmith_hammering_0" + this.Math.rand(0, 6) + ".wav", 1.0);
				this.m.IsBought = false;
				EL_init();
				this.m.EL_EntryList.clear();
				this.m.EL_RankPropertiesImproveIndex.clear();
        	    this.Const.EL_Weapon.EL_updateRankLevelProperties(this);
				local entry_num = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_Entry.EntryNum.OneHanded[this.m.EL_RankLevel] : this.Const.EL_Weapon.EL_Entry.EntryNum.TwoHanded[this.m.EL_RankLevel];
        		this.Const.EL_Weapon.EL_assignItemEntrys(this, entry_num);
				EL_updateLevelProperties();
			}
        }

		o.EL_updateLevelProperties <- function()
        {
			if(this.m.ConditionMax != 1)
			{
				this.m.ConditionMax = this.Math.ceil(this.m.EL_BaseWithRankConditionMax * (1 + this.Const.EL_Weapon.EL_LevelFactor.Condition * this.m.EL_CurrentLevel));
			}
			this.m.Value = this.Math.ceil(this.m.EL_BaseWithRankValue * (1 + this.Const.EL_Weapon.EL_LevelFactor.Value * this.m.EL_Level));
			this.m.RegularDamage = this.Math.ceil(this.m.EL_BaseWithRankRegularDamage * (1 + this.Const.EL_Weapon.EL_LevelFactor.RegularDamage * this.m.EL_CurrentLevel));
			this.m.RegularDamageMax = this.Math.ceil(this.m.EL_BaseWithRankRegularDamageMax * (1 + this.Const.EL_Weapon.EL_LevelFactor.RegularDamageMax * this.m.EL_CurrentLevel));
			this.m.StaminaModifier = this.Math.floor(this.m.EL_BaseWithRankStaminaModifier * (1 + this.Const.EL_Weapon.EL_LevelFactor.StaminaModifier * this.m.EL_Level));
			this.m.ShieldDamage = this.Math.ceil(this.m.EL_BaseWithRankShieldDamage * (1 + this.Const.EL_Weapon.EL_LevelFactor.ShieldDamage * this.m.EL_CurrentLevel));
			if(this.m.EL_EntryList.len() != 0)
			{
				for( local index = 0; index < this.m.EL_StrengthenEntryNum && index < this.m.EL_EntryList.len(); ++index )
				{
					this.m.EL_EntryList[index].EL_strengthen();
				}
				foreach(entry in this.m.EL_EntryList)
				{
					entry.EL_onItemUpdate(this);
				}
			}
			this.m.Condition = this.m.Condition > this.m.ConditionMax ? this.m.ConditionMax : this.m.Condition;
		}

		o.EL_isValid <- function()
		{
			return true;
		}

        o.EL_init <- function()
	    {
			this.m.EL_Vision = 0;
			this.m.EL_AdditionalExplosionRange = 0;
			this.m.ArmorDamageMult = this.m.EL_BaseNoRankArmorDamageMult;
			this.m.DirectDamageAdd = this.m.EL_BaseNoRankDirectDamageAdd;
			this.m.ChanceToHitHead = this.m.EL_BaseNoRankChanceToHitHead;
			this.m.AmmoMax = this.m.EL_BaseNoRankAmmoMax;
			this.m.AdditionalAccuracy = this.m.EL_BaseNoRankAdditionalAccuracy;
			this.m.FatigueOnSkillUse = this.m.EL_BaseNoRankFatigueOnSkillUse;
			this.m.RangeMax = this.m.EL_BaseNoRankRangeMax;
			this.m.EL_BaseWithRankArmorDamageMult = this.m.EL_BaseNoRankArmorDamageMult;
			this.m.EL_BaseWithRankDirectDamageAdd = this.m.EL_BaseNoRankDirectDamageAdd;
			this.m.EL_BaseWithRankChanceToHitHead = this.m.EL_BaseNoRankChanceToHitHead;
			this.m.EL_BaseWithRankAmmoMax = this.m.EL_BaseNoRankAmmoMax;
			this.m.EL_BaseWithRankAdditionalAccuracy = this.m.EL_BaseNoRankAdditionalAccuracy;
			this.m.EL_BaseWithRankFatigueOnSkillUse = this.m.EL_BaseNoRankFatigueOnSkillUse;
			this.m.EL_BaseWithRankRangeMax = this.m.EL_BaseNoRankRangeMax;
			this.m.EL_BaseWithRankConditionMax = this.m.EL_BaseNoRankConditionMax;
			this.m.EL_BaseWithRankValue = this.m.EL_BaseNoRankValue;
			this.m.EL_BaseWithRankRegularDamage = this.m.EL_BaseNoRankRegularDamage;
			this.m.EL_BaseWithRankRegularDamageMax = this.m.EL_BaseNoRankRegularDamageMax;
			this.m.EL_BaseWithRankStaminaModifier = this.m.EL_BaseNoRankStaminaModifier;
			this.m.EL_BaseWithRankShieldDamage = this.m.EL_BaseNoRankShieldDamage;
        }

		o.EL_recordBaseNoRankProperties <- function()
		{
			this.m.EL_BaseNoRankConditionMax = this.m.ConditionMax;
		    this.m.EL_BaseNoRankValue = this.m.Value;
		    this.m.EL_BaseNoRankRegularDamage = this.m.RegularDamage;
		    this.m.EL_BaseNoRankRegularDamageMax = this.m.RegularDamageMax;
		    this.m.EL_BaseNoRankStaminaModifier = this.m.StaminaModifier;
			this.m.EL_BaseNoRankShieldDamage = this.m.ShieldDamage;

			this.m.EL_BaseNoRankArmorDamageMult = this.m.ArmorDamageMult;
			this.m.EL_BaseNoRankDirectDamageAdd = this.m.DirectDamageAdd;
			this.m.EL_BaseNoRankChanceToHitHead = this.m.ChanceToHitHead;
			this.m.EL_BaseNoRankAdditionalAccuracy = this.m.AdditionalAccuracy;
			this.m.EL_BaseNoRankFatigueOnSkillUse = this.m.FatigueOnSkillUse;
			this.m.EL_BaseNoRankRangeMax = this.m.RangeMax;
			this.m.EL_BaseNoRankAmmoMax = this.m.AmmoMax;

			this.m.EL_BaseWithRankConditionMax = this.m.ConditionMax;
			this.m.EL_BaseWithRankValue = this.m.Value;
			this.m.EL_BaseWithRankRegularDamage = this.m.RegularDamage;
		    this.m.EL_BaseWithRankRegularDamageMax = this.m.RegularDamageMax;
		    this.m.EL_BaseWithRankStaminaModifier = this.m.StaminaModifier;
			this.m.EL_BaseWithRankShieldDamage = this.m.ShieldDamage;

			this.m.EL_BaseWithRankArmorDamageMult = this.m.ArmorDamageMult;
            this.m.EL_BaseWithRankDirectDamageAdd = this.m.DirectDamageAdd;
			this.m.EL_BaseWithRankChanceToHitHead = this.m.ChanceToHitHead;
			this.m.EL_BaseWithRankAdditionalAccuracy = this.m.AdditionalAccuracy;
			this.m.EL_BaseWithRankFatigueOnSkillUse = this.m.FatigueOnSkillUse;
			this.m.EL_BaseWithRankRangeMax = this.m.RangeMax;
			this.m.EL_BaseWithRankAmmoMax = this.m.AmmoMax;
		}

		o.EL_getUpgradeLevelEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			if(this.m.EL_Level < EL_getLevelMax())
			{
				local min_calculate_weight = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_EquipmentEssence.OneHandedMinCalculateWeight : this.Const.EL_Weapon.EL_EquipmentEssence.TwoHandedMinCalculateWeight;
				local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
				calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
				result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Weapon.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeLevelFactor[this.World.Assets.getEconomicDifficulty()]
														* this.Math.abs(calculate_weight * (1 + this.Const.EL_Weapon.EL_LevelFactor.StaminaModifier * this.m.EL_Level)));
			}
			return result;
		}

		o.EL_getUpgradeRankEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			if(EL_getRankLevel() < EL_getRankLevelMax())
			{
				local rank_level = EL_getRankLevel() + 1;
				local min_calculate_weight = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_EquipmentEssence.OneHandedMinCalculateWeight : this.Const.EL_Weapon.EL_EquipmentEssence.TwoHandedMinCalculateWeight;
				local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
				calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
				if(rank_level == this.Const.EL_Item.Type.Legendary)
				{
					result[this.Const.EL_Item.Type.Legendary] += (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeRankLegendaryNum : this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeRankLegendaryNum;
					}
				else
				{
					result[rank_level] += this.Math.ceil(this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeRankFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.abs(calculate_weight));
					result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Const.EL_Armor.EL_EquipmentEssence.UpgradeRankFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.pow(this.Const.EL_Weapon.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeLevelFactor[this.World.Assets.getEconomicDifficulty()]
															* this.Math.abs(calculate_weight * (1 + this.Const.EL_Weapon.EL_LevelFactor.StaminaModifier * this.m.EL_Level)) * this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeRankNormalEssenceFactor);

				}
			}
			else if(this.m.EL_StrengthenEntryNum < this.m.EL_EntryList.len())
			{
				result[this.Const.EL_Item.Type.Legendary] += this.Const.EL_Weapon.EL_EquipmentEssence.StrengthenEntryNum;
			}
			return result;
		}

		o.EL_getDisassembleEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			local min_calculate_weight = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_EquipmentEssence.OneHandedMinCalculateWeight : this.Const.EL_Weapon.EL_EquipmentEssence.TwoHandedMinCalculateWeight;
			local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
			local calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
			local extra_mult = this.World.Flags.get("EL_HasUpgradeItemAmbitionRule") ? 0.6 : 0.0;
			result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Weapon.EL_EquipmentEssence.RankFactor, this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic)) * (this.Const.EL_Weapon.EL_EquipmentEssence.DisassembleFactor[this.World.Assets.getEconomicDifficulty()] + extra_mult)
													* this.Math.abs(calculate_weight * (1 + this.Const.EL_Weapon.EL_LevelFactor.StaminaModifier * this.m.EL_Level)));
			if(this.m.EL_RankLevel == this.Const.EL_Item.Type.Legendary)
			{
				result[this.Const.EL_Item.Type.Legendary] += (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeRankLegendaryNum : this.Const.EL_Weapon.EL_EquipmentEssence.UpgradeRankLegendaryNum * 2;
			}
			else if(this.m.EL_RankLevel != this.Const.EL_Item.Type.Normal)
			{
				result[this.m.EL_RankLevel] += this.Math.ceil(this.Const.EL_Weapon.EL_EquipmentEssence.DisassembleFactor[this.World.Assets.getEconomicDifficulty()] * this.Math.abs(calculate_weight));
			}
			return result;
		}

		o.EL_getRecraftEquipmentEssenceNum <- function()
		{
			local result = [0, 0, 0, 0, 0];
			if(this.m.EL_RankLevel)
			{
				local rank_level = this.Math.min(this.m.EL_RankLevel, this.Const.EL_Item.Type.Epic);
				local min_calculate_weight = (this.isItemType(this.Const.Items.ItemType.OneHanded)) ? this.Const.EL_Weapon.EL_EquipmentEssence.OneHandedMinCalculateWeight : this.Const.EL_Weapon.EL_EquipmentEssence.TwoHandedMinCalculateWeight;
				local calculate_weight = this.Math.abs(this.Math.min(min_calculate_weight, this.m.EL_BaseNoRankStaminaModifier));
				calculate_weight = calculate_weight > 10 ? this.Math.pow(calculate_weight / 10.0, 2) * 10 : this.Math.pow(calculate_weight / 10.0, 0.5) * 10;
				result[this.Const.EL_Item.Type.Normal] += this.Math.floor(this.Math.pow(this.Const.EL_Weapon.EL_EquipmentEssence.RankFactor, rank_level) * this.Const.EL_Weapon.EL_EquipmentEssence.RecraftFactor[this.World.Assets.getEconomicDifficulty()]
														* this.Math.abs(calculate_weight * (1 + this.Const.EL_Weapon.EL_LevelFactor.StaminaModifier * this.World.Assets.m.EL_WorldLevel)));
				result[rank_level] += this.Math.ceil(this.Const.EL_Weapon.EL_EquipmentEssence.SeniorEquipmentEssenceMult * this.Const.EL_Weapon.EL_EquipmentEssence.RecraftFactor[this.Const.Difficulty.Legendary]
											 * this.Math.abs(calculate_weight));
			}
			return result;
		}
	});

    ::mods_hookExactClass("items/ammo/ammo", function ( o )
	{
		local consumeAmmo = o.consumeAmmo;
		o.consumeAmmo = function()
		{;
			local skills = this.getContainer().getActor().getSkills();
			if(skills.getSkillByID("el_weapon_entry.save_ammo") != null && this.Math.rand(1, 100) <= skills.getSkillByID("el_weapon_entry.save_ammo").m.EL_SaveAmmoChance)
			{
				return;
			}
			if(skills.getSkillByID("el_rarity_entry.pursuit_of_wind") != null && skills.getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				return;
			}
			// foreach( skill in skills.m.Skills ) {
			// 	local skill_id = skill.getID()
			// 	if(skill_id == "el_rarity_entry.pursuit_of_wind"  && skill.EL_isUsable())
			// 	{
			// 		return;
			// 	}
			// }
			consumeAmmo();
		}
	});

	for(local i = 0; i < this.Const.EL_Weapon.EL_ThrowingWeaponList.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Weapon.EL_ThrowingWeaponList[i], function ( o )
		{
			//this.logInfo("this.Const.EL_Weapon.EL_ThrowingWeaponList[i]" + this.Const.EL_Weapon.EL_ThrowingWeaponList[i]);
			o.getAmountString <- function()
			{
				if(this.m.EL_Level == -1)
				{
					this.Const.EL_Item_Other.EL_otherItemInit(this);
				}
				return "lv" + this.m.EL_Level + " " + this.m.Ammo + "/" + this.m.AmmoMax;
			}
		});
	}

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
			local additional_vertical_explosion_range = this.getItem().m.EL_AdditionalExplosionRange;
			local horizontal_explosion_range = 1;
			local has_rarity_entry = this.getContainer().hasSkill("el_rarity_entry.gunfire_licks_the_heavens") && this.getContainer().getSkillByID("el_rarity_entry.gunfire_licks_the_heavens").EL_isUsable();
			if(has_rarity_entry)
			{
				additional_vertical_explosion_range += 2 * (this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.ExplosionRangeMult - 1);
				horizontal_explosion_range += this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.ExplosionRangeMult - 1;
			}
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

				for(local count = 0; count < additional_vertical_explosion_range; ++count)
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
			local left_tile = _targetTile;
			local right = dir + 1 > 5 ? 0 : dir + 1;
			local right_tile = _targetTile;
			for(local index = 0; index < horizontal_explosion_range; ++index)
			{
				if (left_tile.hasNextTile(left))
				{
					local forwardTile = left_tile.getNextTile(left);
					left_tile = forwardTile;
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

					for(local count = 0; count < additional_vertical_explosion_range; ++count)
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
				if (right_tile.hasNextTile(right))
				{
					local forwardTile = right_tile.getNextTile(right);
					right_tile = forwardTile;
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

					for(local count = 0; count < additional_vertical_explosion_range; ++count)
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
			}

			return ret;
		}

        o.getTooltip = function()
	    {
			local has_rarity_entry = this.getContainer().hasSkill("el_rarity_entry.gunfire_licks_the_heavens") && this.getContainer().getSkillByID("el_rarity_entry.gunfire_licks_the_heavens").EL_isUsable();
			local ret = this.getRangedTooltip(this.getDefaultTooltip());
			if(has_rarity_entry)
			{
					ret.push({
					id = 10,
					type = "text",
					icon = "ui/icons/items.png",
					text = "Can hit up to " + ((this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.ExplosionRangeMult + 1) * (2 * this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.ExplosionRangeMult + this.getItem().m.EL_AdditionalExplosionRange)) + " targets"
				});
			}
			else
			{
				ret.push({
					id = 10,
					type = "text",
					icon = "ui/icons/items.png",
					text = "Can hit up to " + (3 * (2 + this.getItem().m.EL_AdditionalExplosionRange)) + " targets"
				});
			}

    		local ammo = this.getAmmo();
	    	if (ammo > 0)
	    	{
	    		ret.push({
		    		id = 8,
	    			type = "text",
	       			icon = "ui/icons/ammo.png",
	    			text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]" + ammo + "[/color] shots left"
	    		});
	    	}
	    	else
	    	{
	    		ret.push({
	    			id = 8,
	    			type = "text",
	    			icon = "ui/tooltips/warning.png",
	    			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Needs a non-empty powder bag equipped[/color]"
	    		});
	    	}

	    	if (!this.getItem().isLoaded())
	    	{
	    		ret.push({
	    			id = 9,
	    			type = "text",
	    			icon = "ui/tooltips/warning.png",
	    			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Must be reloaded before firing again[/color]"
	    		});
	    	}
    		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
    		{
    			ret.push({
    				id = 9,
    				type = "text",
	    			icon = "ui/tooltips/warning.png",
	    			text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
	    		});
	    	}
	    	return ret;
    	}
	});

	::mods_hookNewObject("items/weapons/fencing_sword", function(o) {
		local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip <- function()
		{
			local tooltip = getTooltip();
			tooltip.insert(11,
				{
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
				}
			);
			tooltip.remove(tooltip.len() - 2);

			return tooltip;
		}
	});

	::mods_hookNewObject("items/weapons/named/named_fencing_sword", function(o) {
		local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip <- function()
		{
			local tooltip = getTooltip();
			tooltip.insert(11,
				{
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
				}
			);
			tooltip.remove(tooltip.len() - 2);

			return tooltip;
		}
	});

	::mods_hookNewObject("items/weapons/legend_estoc", function(o) {
		local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip <- function()
		{
			local tooltip = getTooltip();
			tooltip.insert(11,
				{
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
				}
			);
			tooltip.remove(tooltip.len() - 2);

			return tooltip;
		}
	});

	::mods_hookNewObject("items/weapons/named/legend_named_estoc", function(o) {
		local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip <- function()
		{
			local tooltip = getTooltip();
			tooltip.insert(11,
				{
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
				}
			);
			tooltip.remove(tooltip.len() - 2);

			return tooltip;
		}
	});

	local goblinWeapons = [
		"items/weapons/greenskins/goblin_falchion",
		"items/weapons/greenskins/goblin_notched_blade",
		"items/weapons/greenskins/goblin_pike",
		"items/weapons/greenskins/goblin_spear",
		"items/weapons/greenskins/goblin_staff",
		"items/weapons/named/named_goblin_falchion",
		"items/weapons/named/named_goblin_pike",
		"items/weapons/named/named_goblin_spear",
	];

	foreach (weapon in goblinWeapons)
	{
		::mods_hookNewObject(weapon, function(o) {
			o.m.FatigueOnSkillUse -= 2;

			local getTooltip = ::mods_getMember(o, "getTooltip");
			o.getTooltip <- function()
			{
				local tooltip = getTooltip();
				tooltip.insert(12,
					{
						id = 10,
						type = "text",
						icon = "ui/icons/action_points.png",
						text = "Melee attacks cost [color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] Action Point"
					}
				);
				tooltip.remove(tooltip.len() - 2);
				return tooltip;
			}
		});
	}
});
