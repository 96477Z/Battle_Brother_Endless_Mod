this.ptr_deploy_in_vanguard_skill <- this.inherit("scripts/skills/skill", {
	m = {
		TacticianPerk = null	
	},
	function create()
	{
		this.m.ID = "actives.ptr_deploy_in_vanguard";
		this.m.Name = "Deploy in Vanguard";		
		this.m.Icon = "skills/ptr_deploy_in_vanguard_skill.png";
		this.m.IconDisabled = "skills/ptr_deploy_in_vanguard_skill_bw.png";
		this.m.Overlay = "ptr_deploy_in_vanguard_skill";
		this.m.SoundOnUse = [
			"sounds/combat/footwork_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsDisengagement = true;
		this.m.ActionPointCost = 0;
		this.m.FatigueCost = 0;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.Description = "Use the start of the combat to deploy in a more favorable position. Can be used to redeploy up to [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color] tiles away, or swap positions with an adjacent ally. Can only be used during the first round of combat.";
		this.m.MaxLevelDifference = 1;
		this.m.IsRemovedAfterBattle = true;
	}

	function isHidden()
	{
		return this.m.TacticianPerk != null && !this.m.TacticianPerk.isNull() && !this.m.TacticianPerk.canDeploy();
	}

	function setTacticianPerk( _perk )
	{
		if (typeof _perk == "instance")
		{
			this.m.TacticianPerk = _perk;
		}
		else
		{
			this.m.TacticianPerk = this.WeakTableRef(_perk);
		}
	}

	function getTooltip()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();

		tooltip.extend([
			{
				id = 9,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TacticianPerk.m.UsesRemaining + "[/color] use(s) remaining (company-wide)"
			},
			{
				id = 9,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Will expire upon using any skill, moving, or waiting your turn"
			}
		]);

		if (this.getContainer().getActor().getCurrentProperties().IsRooted)
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used while rooted[/color]"
			});
		}

		if (this.getContainer().getActor().isEngagedInMelee())
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used when engaged in melee[/color]"
			});
		}

		return tooltip;
	}

	function getCursorForTile( _tile )
	{
		if (_tile.IsOccupiedByActor && _tile.getEntity().getFaction() == this.getContainer().getActor().getFaction())
		{
			return  ::Const.UI.Cursor.Rotation;
		}

		return ::Const.UI.Cursor.Attack;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().getActor().getCurrentProperties().IsRooted && !this.getContainer().getActor().isEngagedInMelee();		
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile) || _targetTile.getDistanceTo(this.getContainer().getActor().getTile()) > 7)
		{
			return false;
		}

		if (_targetTile.IsEmpty)
		{
			local enemies = this.Tactical.Entities.getHostileActors(this.getContainer().getActor().getFaction());
			foreach (enemy in enemies)
			{
				if (_targetTile.getDistanceTo(enemy.getTile()) <= 2)
				{
					return false;
				}
			}
		}
		else if (_targetTile.IsOccupiedByActor)
		{
			local ally = _targetTile.getEntity();
			return ally.getFaction() == this.getContainer().getActor().getFaction() && !ally.isEngagedInMelee() && !ally.getCurrentProperties().IsStunned && !ally.getCurrentProperties().IsRooted && ally.getCurrentProperties().IsMovable && !ally.getCurrentProperties().IsImmuneToRotation;
		}

		return _targetTile.IsEmpty;
	}

	function onUse( _user, _targetTile )
	{
		if (_targetTile.IsEmpty)
		{
			this.Tactical.getNavigator().teleport(_user, _targetTile, null, null, false, 2.0);
		}
		else
		{
			this.Tactical.getNavigator().switchEntities(_user, _targetTile.getEntity(), null, null, 2.0);
		}

		this.m.TacticianPerk.m.UsesRemaining--;
		
		this.removeSelf();
		return true;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.removeSelf();
	}

	function onMovementFinished( _tile )
	{
		this.removeSelf();
	}

	function onWaitTurn()
	{
		this.removeSelf();
	}
});
