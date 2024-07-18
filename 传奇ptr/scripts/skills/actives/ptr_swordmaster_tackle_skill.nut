this.ptr_swordmaster_tackle_skill <- this.inherit("scripts/skills/actives/ptr_swordmaster_active_abstract", {
	m = {},
	function create()
	{
		this.m.ID = "actives.ptr_swordmaster_tackle";
		this.m.Name = "Tackle";
		this.m.Description = "Tackle an enemy with sheer force and skill, switching places with them.";
		this.m.Icon = "skills/ptr_swordmaster_tackle_skill.png";
		this.m.IconDisabled = "skills/ptr_swordmaster_tackle_skill_bw.png";
		this.m.Overlay = "ptr_swordmaster_tackle_skill";
		this.m.SoundOnUse = [
			"sounds/combat/indomitable_01.wav",
			"sounds/combat/indomitable_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local tooltip = this.getDefaultUtilityTooltip();

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color] chance to stagger the target"
		});

		if (!this.getContainer().getActor().isArmedWithTwoHandedWeapon() && !this.getContainer().getActor().isDoubleGrippingWeapon())
		{
			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a two-handed or double-gripped one-handed sword[/color]"
			});
		}

		if (this.getContainer().getActor().getCurrentProperties().IsRooted)
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used while rooted[/color]"
			});
		}

		this.addEnabledTooltip(tooltip);

		return tooltip;
	}

	function getCursorForTile( _tile )
	{
		return this.Const.UI.Cursor.Rotation;
	}

	function isUsable()
	{
		return this.ptr_swordmaster_active_abstract.isUsable() && !this.getContainer().getActor().getCurrentProperties().IsRooted && (this.getContainer().getActor().isArmedWithTwoHandedWeapon() || this.getContainer().getActor().isDoubleGrippingWeapon());
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!_targetTile.IsOccupiedByActor)
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (target.isAlliedWith(this.getContainer().getActor()))
		{
			return false;
		}

		return this.skill.onVerifyTarget(_originTile, _targetTile) && !target.getCurrentProperties().IsStunned && !target.getCurrentProperties().IsRooted && target.getCurrentProperties().IsMovable && !target.getCurrentProperties().IsImmuneToRotation;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		local userTile = _user.getTile();
		target.getSkills().add(this.new("scripts/skills/effects/staggered_effect"));

		this.Tactical.getNavigator().switchEntities(_user, target, null, null, 1.0);

		if (userTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " tackled and staggered " + this.Const.UI.getColorizedEntityName(target));
		}

		return true;
	}

});

