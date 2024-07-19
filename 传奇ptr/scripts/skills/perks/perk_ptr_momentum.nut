this.perk_ptr_momentum <- this.inherit("scripts/skills/skill", {
	m = {
		BonusPerTile = 5,
		PrevTile = null,		
		TilesMovedThisTurn = 0,
		BeforeSkillExecutedTile = null
	},
	function create()
	{
		this.m.ID = "perk.ptr_momentum";
		this.m.Name = this.Const.Strings.PerkName.PTRMomentum;
		this.m.Description = "A running start goes a long way to throwing better!";
		this.m.Icon = "ui/perks/ptr_momentum.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.TilesMovedThisTurn == 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/action_points.png",
			text = "The next Throwing attack costs [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TilesMovedThisTurn + "[/color] fewer Action Points"
		});

		local damageBonus = this.getBonus();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/damage_dealt.png",
			text = "The next Throwing attack does [color=" + this.Const.UI.Color.PositiveValue + "]" + damageBonus + "%[/color] more damage"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "Will expire upon waiting or ending the turn, using any skill, or swapping your weapon except to/from a throwing weapon"
		});
		
		return tooltip;
	}

	function isEnabled()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap())
		{
			return false;
		}

		local weapon = actor.getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
		{
			return false;
		}

		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || !_skill.isRanged() || !_skill.m.IsWeaponSkill || this.m.TilesMovedThisTurn == 0 || !this.isEnabled())
		{
			return;
		}

		_properties.RangedDamageMult *= 1.0 + this.getBonus() * 0.01;
	}

	function onAfterUpdate( _properties )
	{
		if (this.isEnabled() && this.m.TilesMovedThisTurn > 0)
		{
			local skills = this.getContainer().getActor().getMainhandItem().getSkills();
			foreach (s in skills)
			{
				if (s.isAttack() && s.isRanged())
				{
					s.m.ActionPointCost -= ::Math.max(0, this.Math.min(s.m.ActionPointCost - 1, this.m.TilesMovedThisTurn));
				}
			}
		}
	}

	function onAffordablePreview( _skill, _movementTile )
	{
		if (!this.isEnabled()) return;

		if (_skill != null)
		{
			foreach (s in this.getContainer().getActor().getMainhandItem().getSkills())
			{
				if (s.isAttack() && s.isRanged())
				{
					this.modifyPreviewField(s, "ActionPointCost", 0, false);
				}
			}
		}

		if (_movementTile != null)
		{
			local bonus = this.m.TilesMovedThisTurn + _movementTile.getDistanceTo(this.getContainer().getActor().getTile());
			foreach (s in this.getContainer().getActor().getMainhandItem().getSkills())
			{
				if (s.isAttack() && s.isRanged())
				{
					this.modifyPreviewField(s, "ActionPointCost", ::Math.min(s.m.ActionPointCost - 1, bonus) * -1, false);
				}
			}
		}
	}

	function getBonus()
	{
		return this.m.TilesMovedThisTurn * this.m.BonusPerTile;
	}

	function onWaitTurn()
	{
		this.m.TilesMovedThisTurn = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.TilesMovedThisTurn = 0;
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.BeforeSkillExecutedTile = this.getContainer().getActor().getTile();
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.BeforeSkillExecutedTile != null && this.getContainer().getActor().getTile().isSameTileAs(this.m.BeforeSkillExecutedTile))
		{
			this.m.TilesMovedThisTurn = 0;
		}
	}

	function onPayForItemAction( _skill, _items )
	{
		foreach (item in _items)
		{
			if (item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Throwing))
			{
				return;
			}
		}
		
		this.m.TilesMovedThisTurn = 0;
	}

	function onTurnEnd()
	{		
		this.m.TilesMovedThisTurn = 0;
	}

	function onMovementStarted(_tile, _numTiles)
	{
		this.m.PrevTile = _tile;
	}

	function onMovementFinished (_tile) 
	{		
		this.m.TilesMovedThisTurn += _tile.getDistanceTo(this.m.PrevTile);
	}
});
