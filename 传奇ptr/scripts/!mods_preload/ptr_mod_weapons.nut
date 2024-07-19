local gt = this.getroottable();

gt.PTR.modWeapons <- function()
{
	local goblinWeapons = [
		"items/weapons/greenskins/goblin_bow",
		"items/weapons/greenskins/goblin_crossbow",
		"items/weapons/greenskins/goblin_falchion",
		"items/weapons/greenskins/goblin_heavy_bow",
		"items/weapons/greenskins/goblin_notched_blade",
		"items/weapons/greenskins/goblin_pike",
		"items/weapons/greenskins/goblin_spear",
		"items/weapons/greenskins/goblin_staff",
		"items/weapons/named/named_goblin_falchion",
		"items/weapons/named/named_goblin_heavy_bow",
		"items/weapons/named/named_goblin_pike",
		"items/weapons/named/named_goblin_spear",
	];

	foreach (weapon in goblinWeapons)
	{
		if (weapon == "items/weapons/greenskins/goblin_bow" ||
			weapon == "items/weapons/greenskins/goblin_crossbow" ||
			weapon == "items/weapons/greenskins/goblin_heavy_bow" ||
			weapon == "items/weapons/named/named_goblin_heavy_bow"
			)
		{
			::mods_hookNewObject(weapon, function(o) {
				o.m.FatigueOnSkillUse -= 2;
			});
		}
		else
		{
			::mods_hookNewObject(weapon, function(o) {
				o.m.FatigueOnSkillUse -= 2;

				local getTooltip = ::mods_getMember(o, "getTooltip");
				o.getTooltip <- function()
				{
					local tooltip = getTooltip();
					tooltip.insert(tooltip.len() - 1, 
						{
							id = 10,
							type = "text",
							icon = "ui/icons/action_points.png",
							text = "Melee attacks cost [color=" + this.Const.UI.Color.PositiveValue + "]-1[/color] Action Point"
						}
					);

					return tooltip;
				}

				local onAfterUpdateProperties = ::mods_getMember(o, "onAfterUpdateProperties");
				o.onAfterUpdateProperties <- function( _properties )
				{
					onAfterUpdateProperties(_properties);
					if (!this.getContainer().getActor().getSkills().hasSkill("racial.ptr_goblin"))
					{
						local skills = this.getSkills();
						foreach (s in skills)
						{
							if (s.isAttack() && !s.isRanged())
							{
								s.m.ActionPointCost -= 1;
							}						
						}
					}
				}
			});
		}
	}
	
	::mods_hookNewObject("items/weapons/greenskins/goblin_falchion", function(o) {
		o.m.RegularDamage = 30;
		o.m.RegularDamageMax = 35;
		o.m.ArmorDamageMult = 0.65;
		o.m.DirectDamageAdd = 0.05;
	});
	
	::mods_hookNewObject("items/weapons/named/named_goblin_falchion", function(o) {
		local baseWeapon = this.new("scripts/items/weapons/greenskins/goblin_falchion");
		o.m.Condition = baseWeapon.m.Condition;
		o.m.ConditionMax = baseWeapon.m.ConditionMax;
		o.m.RegularDamage = baseWeapon.m.RegularDamage;
		o.m.RegularDamageMax = baseWeapon.m.RegularDamageMax;
		o.m.ArmorDamageMult = baseWeapon.m.ArmorDamageMult;
		o.m.ChanceToHitHead = baseWeapon.m.ChanceToHitHead;
		o.m.DirectDamageMult = baseWeapon.m.DirectDamageMult;
		o.m.DirectDamageAdd = baseWeapon.m.DirectDamageAdd;
		o.m.StaminaModifier = baseWeapon.m.StaminaModifier;
		o.m.ShieldDamage = baseWeapon.m.ShieldDamage;
		o.m.AdditionalAccuracy = baseWeapon.m.AdditionalAccuracy;
		o.m.FatigueOnSkillUse = baseWeapon.m.FatigueOnSkillUse;
		o.m.Value = 2600;
		o.randomizeValues();
	});

	::mods_hookExactClass("items/weapons/legend_staff", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/ptr_staff_sweep_skill"));
		}
	});

	::mods_hookExactClass("items/weapons/legend_tipstaff", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/ptr_staff_sweep_skill"));
		}
	});

	::mods_hookExactClass("items/weapons/greenskins/goblin_staff", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/ptr_staff_sweep_skill"));
		}
	});

	::mods_hookExactClass("items/weapons/legend_staff_vala", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/ptr_staff_sweep_skill"));
		}
	});

	::mods_hookExactClass("items/weapons/legend_staff_gnarled", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/ptr_staff_sweep_skill"));
		}
	});

	::mods_hookExactClass("items/weapons/legend_mystic_staff", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/ptr_staff_sweep_skill"));
		}
	});

	::mods_hookNewObject("items/weapons/legend_swordstaff", function(o) {
		o.setCategories("Spear/Sword, Two-Handed");
		o.m.RangeMin = 1;
		o.m.RangeMax = 2;
		o.m.Condition = 72.0;
		o.m.ConditionMax = 72.0;
		o.m.RegularDamage = 55;
		o.m.RegularDamageMax = 80;
		o.onEquip = function()
		{
			this.weapon.onEquip();			
			local prong = this.new("scripts/skills/actives/prong_skill");
			this.addSkill(prong);

			local overheadStrike = this.new("scripts/skills/actives/overhead_strike");
			overheadStrike.m.IsIgnoredAsAOO = true;
			this.addSkill(overheadStrike);		

			local spearwall = this.new("scripts/skills/actives/spearwall");
			spearwall.m.Icon = "skills/active_124.png";
			spearwall.m.IconDisabled = "skills/active_124_sw.png";
			spearwall.m.Overlay = "active_124";
			spearwall.m.BaseAttackName = prong.getName();
			spearwall.setFatigueCost(spearwall.getFatigueCostRaw() + 5);
			spearwall.m.ActionPointCost = 6;
			this.addSkill(spearwall);
		}
	});

	::mods_hookNewObject("items/weapons/named/legend_named_swordstaff", function(o) {
		o.setCategories("Spear/Sword, Two-Handed");
		o.m.RangeMin = 1;
		o.m.RangeMax = 2;

		local baseWeapon = this.new("scripts/items/weapons/legend_swordstaff");
		o.m.Condition = baseWeapon.m.Condition;
		o.m.ConditionMax = baseWeapon.m.ConditionMax;
		o.m.RegularDamage = baseWeapon.m.RegularDamage;
		o.m.RegularDamageMax = baseWeapon.m.RegularDamageMax;
		o.m.ArmorDamageMult = baseWeapon.m.ArmorDamageMult;
		o.m.ChanceToHitHead = baseWeapon.m.ChanceToHitHead;
		o.m.DirectDamageMult = baseWeapon.m.DirectDamageMult;
		o.m.DirectDamageAdd = baseWeapon.m.DirectDamageAdd;
		o.m.StaminaModifier = baseWeapon.m.StaminaModifier;
		o.m.ShieldDamage = baseWeapon.m.ShieldDamage;
		o.m.AdditionalAccuracy = baseWeapon.m.AdditionalAccuracy;
		o.m.FatigueOnSkillUse = baseWeapon.m.FatigueOnSkillUse;
		o.m.Value = 4800;
		o.randomizeValues();

		o.onEquip = function()
		{
			this.named_weapon.onEquip();			
			local prong = this.new("scripts/skills/actives/prong_skill");
			this.addSkill(prong);

			local overheadStrike = this.new("scripts/skills/actives/overhead_strike");
			overheadStrike.m.IsIgnoredAsAOO = true;
			this.addSkill(overheadStrike);

			local spearwall = this.new("scripts/skills/actives/spearwall");
			spearwall.m.Icon = "skills/active_124.png";
			spearwall.m.IconDisabled = "skills/active_124_sw.png";
			spearwall.m.Overlay = "active_124";
			spearwall.m.BaseAttackName = prong.getName();
			spearwall.setFatigueCost(spearwall.getFatigueCostRaw() + 5);
			spearwall.m.ActionPointCost = 6;
			this.addSkill(spearwall);
		}
	});

	::mods_hookNewObject("items/weapons/greenskins/goblin_spear", function(o) {
		o.setCategories("Sword/Spear, One-Handed");

		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/riposte"));
		}
	});

	::mods_hookNewObject("items/weapons/named/named_goblin_spear", function(o) {
		o.setCategories("Sword/Spear, One-Handed");		

		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/riposte"));
		}
	});

	::mods_hookNewObject("items/weapons/legend_militia_glaive", function(o) {
		o.setCategories("Sword/Spear, Two-Handed");

		o.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		o.m.IsDoubleGrippable = false;
		o.m.RegularDamage = 35;
		o.m.RegularDamageMax = 50;
		o.m.ArmorDamageMult = 0.75;

		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/swing"));
		}
	});

	::mods_hookNewObject("items/weapons/legend_glaive", function(o) {
		o.setCategories("Sword/Spear, Two-Handed");

		o.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		o.m.IsDoubleGrippable = false;
		o.m.RegularDamage = 50;
		o.m.RegularDamageMax = 55;
		o.m.ArmorDamageMult = 0.80;

		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/swing"));
		}
	});

	::mods_hookNewObject("items/weapons/legend_battle_glaive", function(o) {
		o.setCategories("Sword/Spear, Two-Handed");

		o.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		o.m.IsDoubleGrippable = false;
		o.m.RegularDamage = 55;
		o.m.RegularDamageMax = 60;
		o.m.ArmorDamageMult = 0.85;

		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/swing"));
		}
	});

	::mods_hookNewObject("items/weapons/named/legend_named_glaive", function(o) {
		o.setCategories("Sword/Spear, Two-Handed");

		o.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		o.m.IsDoubleGrippable = false;

		local baseWeapon = this.new("scripts/items/weapons/legend_battle_glaive");
		o.m.Condition = baseWeapon.m.Condition;
		o.m.ConditionMax = baseWeapon.m.ConditionMax;
		o.m.RegularDamage = baseWeapon.m.RegularDamage;
		o.m.RegularDamageMax = baseWeapon.m.RegularDamageMax;
		o.m.ArmorDamageMult = baseWeapon.m.ArmorDamageMult;
		o.m.ChanceToHitHead = baseWeapon.m.ChanceToHitHead;
		o.m.DirectDamageMult = baseWeapon.m.DirectDamageMult;
		o.m.DirectDamageAdd = baseWeapon.m.DirectDamageAdd;
		o.m.StaminaModifier = baseWeapon.m.StaminaModifier;
		o.m.ShieldDamage = baseWeapon.m.ShieldDamage;
		o.m.AdditionalAccuracy = baseWeapon.m.AdditionalAccuracy;
		o.m.FatigueOnSkillUse = baseWeapon.m.FatigueOnSkillUse;
		o.m.Value = 6000;
		o.randomizeValues();

		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/swing"));
		}
	});

	::mods_hookExactClass("items/weapons/spetum", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/repel"));
		}
	});

	::mods_hookExactClass("items/weapons/warfork", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/repel"));
		}
	});

	::mods_hookExactClass("items/weapons/named/named_spetum", function(o) {
		local onEquip = o.onEquip;
		o.onEquip = function()
		{
			onEquip();
			this.addSkill(this.new("scripts/skills/actives/repel"));
		}
	});

	local curvedSwords = [
		"items/weapons/shamshir",
		"items/weapons/named/named_shamshir",
		"items/weapons/scimitar",
		"items/weapons/oriental/saif",
	];

	foreach (sword in curvedSwords)
	{
		::mods_hookNewObject(sword, function(o) {
			local onUpdateProperties = ::mods_getMember(o, "onUpdateProperties");
			o.onUpdateProperties <- function(_properties)
			{
				onUpdateProperties(_properties);
				if (this.getContainer().getActor().getSkills().hasSkill("perk.mastery.sword"))
				{
					_properties.ThresholdToInflictInjuryMult *= 0.75;
				}
			}

			local onEquip = o.onEquip;
			o.onEquip = function()
			{
				onEquip();
				local riposte = this.new("scripts/skills/actives/riposte");
				riposte.isHidden <- function()
				{
					return !this.getContainer().hasSkill("perk.ptr_exploit_opening");
				}
				this.addSkill(riposte);
			}
		});
	}

	::mods_hookExactClass("items/weapons/throwing_spear", function(o) {
		local create = o.create;
		o.create = function()
		{
			create();
			this.m.ShieldDamage = 52;
		}
	});
}
