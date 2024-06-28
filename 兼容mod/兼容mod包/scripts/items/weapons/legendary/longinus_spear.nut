this.longinus_spear <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.longinus_spear";
		this.m.Name = "朗吉努斯长矛";
		this.m.Description = "一支装饰华丽的古代长矛，但仍相当坚固。枪尖闪烁着强大的力量，可以穿透一切。";
		this.m.Categories = "Spear, Two-Handed";
		this.m.IconLarge = "weapons/melee/spear_of_longinus.png";
		this.m.Icon = "weapons/melee/spear_of_longinus_70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "Spear_of_Longinus";
		this.m.Value = 5000;
		this.m.Condition = 100.0;
		this.m.ConditionMax = 100.0;
		this.m.StaminaModifier = -12;
//		this.m.RegularDamage = 55;
//		this.m.RegularDamageMax = 80;
		this.m.RegularDamage = 70;
		this.m.RegularDamageMax = 95;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.25;
	}

	function onEquip()
	{
   
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/thrust"));
       		this.addSkill(this.new("scripts/skills/actives/penetration"));
		
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

