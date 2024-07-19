local gt = this.getroottable();

gt.ModBetterFencing.modWeapons <- function()
{
	::mods_hookNewObject("items/weapons/fencing_sword", function(o) {
		o.addWeaponType(this.Const.Items.WeaponType.BFFencing);
		
		o.m.DirectDamageMult = 0.25;
		o.m.DirectDamageAdd = 0.2;
		o.m.ArmorDamageMult = 0.3;

		o.onEquip = function()
		{
			this.weapon.onEquip();
			this.addSkill(this.new("scripts/skills/actives/bf_sword_thrust_skill"));
			this.addSkill(this.new("scripts/skills/actives/lunge_skill"));
			this.addSkill(this.new("scripts/skills/actives/riposte"));
		}

		local onUpdateProperties = ::mods_getMember(o, "onUpdateProperties");
		o.onUpdateProperties <- function( _properties )
		{
			onUpdateProperties(_properties);
			_properties.HitChance[::Const.BodyPart.Head] += -25;
		}

		local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip <- function()
		{
			local tooltip = getTooltip();
			tooltip.insert(tooltip.len() - 1, 
				{
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
				}
			);

			return tooltip;
		}
	});

	::mods_hookNewObject("items/weapons/named/named_fencing_sword", function(o) {
		o.addWeaponType(this.Const.Items.WeaponType.BFFencing);

		local baseWeapon = this.new("scripts/items/weapons/fencing_sword");
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
		o.m.Value = 4000;
		o.randomizeValues();

		o.onEquip = function()
		{
			this.weapon.onEquip();
			this.addSkill(this.new("scripts/skills/actives/bf_sword_thrust_skill"));
			this.addSkill(this.new("scripts/skills/actives/lunge_skill"));
			this.addSkill(this.new("scripts/skills/actives/riposte"));
		}

		local onUpdateProperties = ::mods_getMember(o, "onUpdateProperties");
		o.onUpdateProperties <- function( _properties )
		{
			onUpdateProperties(_properties);
			_properties.HitChance[::Const.BodyPart.Head] += -25;
		}

		local getTooltip = ::mods_getMember(o, "getTooltip");
		o.getTooltip <- function()
		{
			local tooltip = getTooltip();
			tooltip.insert(tooltip.len() - 1, 
				{
					id = 9,
					type = "text",
					icon = "ui/icons/chance_to_hit_head.png",
					text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
				}
			);

			return tooltip;
		}
	});

	if ("LegendMod" in gt.Const)
	{
		::mods_hookNewObject("items/weapons/legend_estoc", function(o) {
			o.addWeaponType(this.Const.Items.WeaponType.BFFencing);
			o.m.RegularDamage = 55;
			o.m.RegularDamageMax = 70;
			o.m.ArmorDamageMult = 0.3;
			o.m.DirectDamageMult = 0.25;
			o.m.DirectDamageAdd = 0.2;
			o.m.ChanceToHitHead = 0;
				
			o.onEquip = function()
			{
				this.weapon.onEquip();
				this.addSkill(this.new("scripts/skills/actives/bf_sword_thrust_skill"));
				this.addSkill(this.new("scripts/skills/actives/lunge_skill"));
				this.addSkill(this.new("scripts/skills/actives/riposte"));
			}

			local onUpdateProperties = ::mods_getMember(o, "onUpdateProperties");
			o.onUpdateProperties <- function( _properties )
			{
				onUpdateProperties(_properties);
				_properties.HitChance[::Const.BodyPart.Head] += -25;
			}

			local getTooltip = ::mods_getMember(o, "getTooltip");
			o.getTooltip <- function()
			{
				local tooltip = getTooltip();
				tooltip.insert(tooltip.len() - 1, 
					{
						id = 9,
						type = "text",
						icon = "ui/icons/chance_to_hit_head.png",
						text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
					}
				);

				return tooltip;
			}
		});

		::mods_hookNewObject("items/weapons/named/legend_named_estoc", function(o) {
			o.addWeaponType(this.Const.Items.WeaponType.BFFencing);

			local baseWeapon = this.new("scripts/items/weapons/legend_estoc");
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
			o.m.ChanceToHitHead = baseWeapon.m.ChanceToHitHead;
			o.m.Value = 4200;
			o.randomizeValues();

			o.onEquip = function()
			{
				this.weapon.onEquip();
				this.addSkill(this.new("scripts/skills/actives/bf_sword_thrust_skill"));
				this.addSkill(this.new("scripts/skills/actives/lunge_skill"));
				this.addSkill(this.new("scripts/skills/actives/riposte"));
			}

			local onUpdateProperties = ::mods_getMember(o, "onUpdateProperties");
			o.onUpdateProperties <- function( _properties )
			{
				onUpdateProperties(_properties);
				_properties.HitChance[::Const.BodyPart.Head] += -25;
			}

			local getTooltip = ::mods_getMember(o, "getTooltip");
			o.getTooltip <- function()
			{
				local tooltip = getTooltip();
				tooltip.insert(tooltip.len() - 1, 
					{
						id = 9,
						type = "text",
						icon = "ui/icons/chance_to_hit_head.png",
						text = "Chance to hit head [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color]"
					}
				);

				return tooltip;
			}
		});
	}
}
