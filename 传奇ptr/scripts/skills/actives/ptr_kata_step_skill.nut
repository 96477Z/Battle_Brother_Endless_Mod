this.ptr_kata_step_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false,
		IsForceEnabled = false
	},
	function create()
	{
		this.m.ID = "actives.ptr_kata_step";
		this.m.Name = "Kata Step";
		this.m.Description = "Use the flow of your sword\'s swings to take a step through Zone of Control without triggering attacks of opportunity. Can only be used immediately after a successful attack.";
		this.m.Icon = "skills/ptr_kata_step_skill.png";
		this.m.IconDisabled = "skills/ptr_kata_step_skill_bw.png";
		this.m.Overlay = "ptr_kata_step_skill";
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
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 1;
	}

	function onAdded()
	{
		this.m.IsSpent = true;

		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		local agent = actor.getAIAgent();

		if (agent.findBehavior(this.Const.AI.Behavior.ID.PTRKataStep) == null)
		{
			agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_ptr_kata_step"));
			agent.finalizeBehaviors();
		}
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap())
		{
			tooltip.push({
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Costs [color=" + this.Const.UI.Color.PositiveValue + "]2[/color] fewer Action Points than the movement cost of the starting tile"
			});
			tooltip.push({
				id = 3,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Builds Fatigue equal to the movement cost of the starting tile"
			});
		}
		else
		{
			tooltip.push({
				id = 3,
				type = "text",
				text = this.getCostString()
			});
		}

		local weapon = actor.getMainhandItem();
		local bladeDancerPerk = this.getContainer().getSkillByID("perk.ptr_swordmaster_blade_dancer");
		if (weapon == null || (!actor.isDoubleGrippingWeapon() && !weapon.isItemType(this.Const.Items.ItemType.TwoHanded) && (bladeDancerPerk == null || !bladeDancerPerk.isEnabled())))
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a Two-Handed Sword or a One-Handed Sword with the Offhand free[/color]"
			});
		}

		if (actor.getCurrentProperties().IsRooted)
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used while rooted[/color]"
			});
		}

		if(actor.isPlacedOnMap() && !this.anAdjacentEmptyTileHasAdjacentEnemy(actor.getTile()))
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires an empty tile adjacent to an enemy[/color]"
			});
		}

		if(this.m.IsSpent)
		{
			tooltip.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can only be used immediately after a successful attack[/color]"
			});
		}

		return tooltip;
	}

	function tileHasAdjacentEnemy(_tile)
	{
		if (_tile == null)
		{
			return false;
		}

		for( local i = 0; i < 6; i++ )
		{
			if (_tile.hasNextTile(i))
			{
				local nextTile = _tile.getNextTile(i);

				if (nextTile.IsOccupiedByActor)
				{
					local entity = nextTile.getEntity();

					if (!entity.isAlliedWith(this.getContainer().getActor()))
					{
						return true;
					}
				}
			}
		}

		return false;
	}

	function anAdjacentEmptyTileHasAdjacentEnemy( _tile )
	{
		if (_tile == null)
		{
			return false;
		}

		for( local i = 0; i < 6; i++ )
		{
			if (_tile.hasNextTile(i))
			{
				local nextTile = _tile.getNextTile(i);

				if (nextTile.IsEmpty && this.tileHasAdjacentEnemy(nextTile) && !(this.Math.abs(nextTile.Level - _tile.Level) > 1))
				{
					return true;
				}
			}
		}

		return false;
	}

	function isUsable()
	{
		if (this.m.IsSpent || !this.skill.isUsable() || this.getContainer().getActor().getCurrentProperties().IsRooted)
		{
			return false;
		}

		local actor = this.getContainer().getActor();
		local weapon = actor.getMainhandItem();
		if (weapon == null || (!this.m.IsForceEnabled && !actor.isDoubleGrippingWeapon() && !weapon.isItemType(this.Const.Items.ItemType.TwoHanded)))
		{
			local bladeDancerPerk = this.getContainer().getSkillByID("perk.ptr_swordmaster_blade_dancer");
			if (bladeDancerPerk == null || !bladeDancerPerk.isEnabled())
			{
				return false;
			}
		}

		local myTile = actor.getTile();
		if (this.anAdjacentEmptyTileHasAdjacentEnemy(myTile))
		{
			return true;
		}

		return false;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (!_targetTile.IsEmpty)
		{
			return false;
		}

		if (this.tileHasAdjacentEnemy(_targetTile))
		{
			return true;
		}

		return false;
	}

	function onUse( _user, _targetTile )
	{
		this.Tactical.getNavigator().teleport(_user, _targetTile, null, null, false);
		this.m.IsSpent = true;
		return true;
	}

	function onAfterUpdate ( _properties )
	{
		this.m.FatigueCost = 0;
		this.m.ActionPointCost = 0;

		local actor = this.getContainer().getActor();
		if (actor.isPlacedOnMap())
		{
			local myTile = actor.getTile();
			if (myTile != null)
			{
				this.m.FatigueCost = this.Math.max(0, (actor.getFatigueCosts()[myTile.Type] + _properties.MovementAPCostAdditional) * _properties.MovementAPCostMult);
				this.m.ActionPointCost = this.Math.max(0, (actor.getActionPointCosts()[myTile.Type] + _properties.MovementFatigueCostAdditional - 2) * _properties.MovementFatigueCostMult);
			}
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_skill.isAttack())
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
		{
			return;
		}

		local weapon = actor.getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return;
		}

		this.m.IsSpent = false;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().m.IsMoving)
		{
			this.m.IsSpent = true;
		}
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill != this) this.m.IsSpent = true;
	}

	function onPayForItemAction( _skill, _items )
	{
		this.m.IsSpent = true;
	}

	function onWaitTurn()
	{
		this.m.IsSpent = true;
	}

	function onTurnStart()
	{
		this.m.IsSpent = true;
	}

	function onCombatStarted()
	{
		this.m.IsSpent = true;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsSpent = false;
	}
});
