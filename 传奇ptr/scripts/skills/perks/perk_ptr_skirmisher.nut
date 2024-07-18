this.perk_ptr_skirmisher <- this.inherit("scripts/skills/skill", {
	m = {
		AttacksRemaining = 2
		TurnCount = 0,
		ActionPointCostsBackup = null,
		FatigueCostsBackup = null,
		LevelActionPointCostBackup = null
	},
	function create()
	{
		this.m.ID = "perk.ptr_skirmisher";
		this.m.Name = this.Const.Strings.PerkName.PTRSkirmisher;
		this.m.Description = "This character is skilled at using the early stages of the battle to quickly throw deadly weapons at %their% enemies."
		this.m.Icon = "ui/perks/ptr_skirmisher.png";
		this.m.IconMini = "ptr_skirmisher_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return !this.isEnabled() || !this.getContainer().getActor().isPlacedOnMap() || (this.m.AttacksRemaining == 0 && this.m.TurnCount > 1);
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/action_points.png",
			text = "The next [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.AttacksRemaining + "[/color] Throwing attacks have their Action Point costs [color=" + this.Const.UI.Color.PositiveValue + "]halved[/color]"
		});

		if (this.m.TurnCount == 1)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The Action Point and Fatigue costs of movement during your first turn are reduced"
			});
		}
		
		return tooltip;
	}

	function isEnabled()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
		{
			return false;
		}

		return true;
	}

	function onTurnStart()
	{
		this.m.TurnCount++;
	}

	function onAfterUpdate( _properties )
	{
		if (this.isEnabled() && this.getContainer().getActor().isPlacedOnMap())
		{
			if (this.m.AttacksRemaining > 0)
			{
				local attacks = this.getContainer().getSkillsByFunction(@(_skill) _skill.isAttack() && _skill.m.IsWeaponSkill)
				foreach (a in attacks)
				{
					a.m.ActionPointCost -= ::Math.max(0, this.Math.min(a.m.ActionPointCost - 1, a.m.ActionPointCost / 2));
				}
			}

			if (this.m.TurnCount == 1)
			{
				local actor = this.getContainer().getActor();
				if (this.m.ActionPointCostsBackup == null)
				{					
					this.m.ActionPointCostsBackup = clone actor.m.ActionPointCosts;
					this.m.FatigueCostsBackup = clone actor.m.FatigueCosts;
					this.m.LevelActionPointCostBackup = actor.m.LevelActionPointCost;
				}

				local movementAPCost = [];
				local movementFatigueCost = [];

				if (this.getContainer().hasSkill("perk.pathfinder"))
				{
					movementAPCost = this.Const.PathfinderMovementAPCost;
					movementFatigueCost = this.Const.PathfinderMovementFatigueCost;
				}
				else
				{
					movementAPCost = this.Const.DefaultMovementAPCost;
					movementFatigueCost = this.Const.DefaultMovementFatigueCost;
				}

				actor.m.ActionPointCosts = [];
				actor.m.FatigueCosts = [];

				for (local i = 0; i < movementAPCost.len(); i++)
				{
					actor.m.ActionPointCosts.push(this.Math.max(1, movementAPCost[i] - 1));
					actor.m.FatigueCosts.push(this.Math.max(1, movementFatigueCost[i]) / 2);
				}

				actor.m.LevelActionPointCost = 0;				
			}
			else
			{
				this.resetCosts();
			}			
		}
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.AttacksRemaining > 0 && this.isEnabled() && _skill.isAttack() && _skill.m.IsWeaponSkill)
		{
			this.m.AttacksRemaining--;
		}
	}

	function onTurnEnd()
	{
		this.resetCosts();
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.AttacksRemaining = 2;
		this.m.TurnCount = 0;
		this.resetCosts();
	}

	function resetCosts()
	{
		if (this.m.ActionPointCostsBackup == null)
		{
			return;
		}

		local actor = this.getContainer().getActor();
		actor.m.ActionPointCosts = clone this.m.ActionPointCostsBackup;
		actor.m.FatigueCosts = clone this.m.FatigueCostsBackup;
		actor.m.LevelActionPointCost = this.m.LevelActionPointCostBackup;
		this.m.ActionPointCostsBackup = null;
		this.m.FatigueCostsBackup = null;
		this.m.LevelActionPointCostBackup = null;
	}
});
