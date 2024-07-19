this.perk_ptr_vigorous_assault <- this.inherit("scripts/skills/skill", {
	m = {
		BonusEveryXTiles = 2,
		APReduction = 1,
		FatCostReduction = 10,
		StartingTile = null,
		IsIconSet = false,
		CurrAPBonus = 0,
		CurrFatBonus = 0,
	},
	function create()
	{
		this.m.ID = "perk.ptr_vigorous_assault";
		this.m.Name = this.Const.Strings.PerkName.PTRVigorousAssault;
		this.m.Description = "This character is adding the momentum of their movement to %their% next attack.";
		this.m.Icon = "ui/perks/ptr_vigorous_assault.png";
		this.m.IconMini = "ptr_vigorous_assault_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.getContainer().getActor().isPlayerControlled() && this.m.CurrAPBonus == 0 && this.m.CurrFatBonus == 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		if (this.m.CurrAPBonus > 0)
		{
			tooltip.push(
				{
					id = 10,
					type = "text",
					icon = "ui/icons/action_points.png",
					text = "The next attack costs [color=" + this.Const.UI.Color.PositiveValue + "]-" + this.m.CurrAPBonus + "[/color] Action Point(s)"
				}
			);
		}

		if (this.m.CurrFatBonus > 0)
		{
			tooltip.push(
				{
					id = 10,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "The next attack builds up [color=" + this.Const.UI.Color.PositiveValue + "]-" + this.m.CurrFatBonus + "%[/color] Fatigue"
				}
			);
		}

		if (this.m.CurrAPBonus != 0 || this.m.CurrFatBonus != 0)
		{
			tooltip.push(
				{
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "Will expire upon waiting or ending the turn, using any skill, or swapping your weapon except to/from a throwing weapon"
				}
			);
		}

		return tooltip;
	}

	function isEnabled()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || this.m.StartingTile == null)
		{
			return false;
		}

		local weapon = actor.getMainhandItem();
		if (weapon != null && (!weapon.isItemType(this.Const.Items.ItemType.MeleeWeapon) && !weapon.isWeaponType(this.Const.Items.WeaponType.Throwing)))
		{
			return false;
		}

		return true;
	}

	function onNewRound()
	{
		if (!this.m.IsIconSet)
		{
			if (this.getContainer().getActor().getFaction() == this.World.FactionManager.getFactionOfType(this.Const.FactionType.Barbarians).getID())
			{
				this.m.Icon = "ui/perks/ptr_vigorous_assault_barbarian.png";
				this.m.IconMini = "ptr_vigorous_assault_barbarian_mini";
			}

			this.m.IsIconSet = true;
		}
	}

	function onAfterUpdate( _properties )
	{
		this.resetBonus();

		if (!this.isEnabled() || this.m.StartingTile == null || this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
		{
			return;
		}

		local actor = this.getContainer().getActor();
		local distanceMoved = this.m.StartingTile.getDistanceTo(actor.getTile());		
		local aoo = this.getContainer().getAttackOfOpportunity();

		local mult = distanceMoved / this.m.BonusEveryXTiles;

		if (!actor.isPlayerControlled() && aoo != null && distanceMoved < this.m.BonusEveryXTiles)
		{
			local myTile = actor.getTile();
			local actors = this.Tactical.Entities.getAllInstancesAsArray();			

			local numEnemiesInRange = 0;
			local numEnemiesApproachable = 0;

			foreach (a in actors)
			{
				if (a.isAlliedWith(actor))
				{
					continue;
				}

				local distance = a.getTile().getDistanceTo(myTile);

				if (distance == aoo.getMaxRange())
				{
					numEnemiesInRange++;
				}
				else if (distance == this.m.BonusEveryXTiles + aoo.getMaxRange())
				{
					numEnemiesApproachable++;
				}
			}

			if (numEnemiesInRange == 0 && numEnemiesApproachable > 0)
			{
				mult = 1;
			}
		}

		this.m.CurrAPBonus = this.m.APReduction * mult;
		this.m.CurrFatBonus = this.m.FatCostReduction * mult;

		if (this.m.CurrAPBonus != 0 && this.m.CurrFatBonus != 0)
		{
			foreach (skill in this.getContainer().getSkillsByFunction(@(_skill) _skill.isAttack()))
			{
				skill.m.ActionPointCost -= ::Math.max(0, this.Math.min(skill.m.ActionPointCost - 1, this.m.CurrAPBonus));
				skill.m.FatigueCostMult *= 1.0 - this.m.CurrFatBonus * 0.01;
			}
		}
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.getContainer().getActor().isPlacedOnMap())
		{
			this.m.StartingTile = this.getContainer().getActor().getTile();
		}
	}

	function onAffordablePreview( _skill, _movementTile )
	{
		if (!this.isEnabled()) return;

		if (_skill != null)
		{
			foreach (skill in this.getContainer().getSkillsByFunction(@(skill) skill.isAttack()))
	        {
	            this.modifyPreviewField(skill, "ActionPointCost", 0, false);
	            this.modifyPreviewField(skill, "FatigueCostMult", 1, true);
	        }
		}

		if (_movementTile != null)
		{
			local bonus = this.m.StartingTile.getDistanceTo(_movementTile) / this.m.BonusEveryXTiles;

	        foreach (skill in this.getContainer().getSkillsByFunction(@(skill) skill.isAttack()))
	        {
	            this.modifyPreviewField(skill, "ActionPointCost", ::Math.min(skill.m.ActionPointCost - 1, bonus) * -1, false);
	            this.modifyPreviewField(skill, "FatigueCostMult", 1 - this.m.FatCostReduction * bonus * 0.01, true);
	        }
		}
	}

	function onWaitTurn()
	{
		this.m.StartingTile = null;
		this.resetBonus();
	}

	function onResumeTurn()
	{
		this.m.StartingTile = this.getContainer().getActor().getTile();		
		this.resetBonus();
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

		this.m.StartingTile = this.getContainer().getActor().getTile();	
		this.resetBonus();
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.StartingTile = null;
		this.resetBonus();
	}

	function onTurnStart()
	{
		this.m.StartingTile = this.getContainer().getActor().getTile();		
		this.resetBonus();
	}

	function onTurnEnd()
	{	
		this.m.StartingTile = null;
		this.resetBonus();
	}

	function resetBonus()
	{
		this.m.CurrAPBonus = 0;
		this.m.CurrFatBonus = 0;
	}
});
