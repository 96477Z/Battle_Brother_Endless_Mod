this.ptr_en_garde_toggle_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsOn = true	
	},
	function create()
	{
		this.m.ID = "actives.ptr_en_garde_toggle";
		this.m.Name = "Toggle En Garde";
		this.m.Description = "Toggle your En Garde perk to be enabled or disabled."
		this.m.Icon = "skills/ptr_en_garde_toggle_on.png";
		this.m.IconDisabled = "skills/ptr_en_garde_toggle_bw.png";		
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = false;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "En Garde is currently " + (this.m.IsOn ? "[color=" + this.Const.UI.Color.PositiveValue + "]Enabled[/color]" : "[color=" + this.Const.UI.Color.NegativeValue + "]Disabled[/color]")
		});
		
		return tooltip;
	}

	function isHidden()
	{
		if (!this.getContainer().getActor().isPlayerControlled()) return true;
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return true;
		}

		return false;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onAffordablePreview( _skill, _movementTile )
	{
		this.modifyPreviewField(this, "FatigueCost", 15, false);
	}

	function onUse( _user, _targetTile )
	{
		this.m.IsOn = !this.m.IsOn;
		this.m.Icon = this.m.IsOn ? "skills/ptr_en_garde_toggle_on.png" : "skills/ptr_en_garde_toggle_off.png";
		this.getContainer().getSkillByID("perk.ptr_en_garde").m.IsOn = this.m.IsOn;
		return true;
	}
});
