this.legend_helmet_southern_headband <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {},
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_southern_headband";
		this.m.Name = "Southern Headband";
		this.m.Description = "A beautiful headband from southern lands where dyes are plentiful.";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 100;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
		this.m.IsLowerVanity = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
		this.m.ItemType = this.m.ItemType;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_southern_headband" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_southern_headband" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_southern_headband" + "_" + variant + "_dead";
		this.m.Icon = "legend_helmets/inventory_southern_headband" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}

});

