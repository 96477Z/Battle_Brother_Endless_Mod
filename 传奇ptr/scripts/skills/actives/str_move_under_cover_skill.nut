this.str_move_under_cover_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.str_move_under_cover";
		this.m.Name = "Move Under Cover";
		this.m.Description = "Use the cover provided by a shield-bearing ally to move 1 tile ignoring Zone of Control and without triggering free attacks.";
		this.m.Icon = "ui/perks/perk_25_active.png";
		this.m.IconDisabled = "ui/perks/perk_25_active_sw.png";
		this.m.Overlay = "perk_25_active";
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

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];

		if (this.getContainer().getActor().getCurrentProperties().IsRooted)
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot be used while rooted[/color]"
			});
		}

		return ret;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		local agent = actor.getAIAgent();
		local weapon = actor.getMainhandItem();

		if (weapon != null && (weapon.isItemType(this.Const.Items.ItemType.RangedWeapon) || weapon.m.RangeMax == 2))
		{
			if (agent.findBehavior(this.Const.AI.Behavior.ID.Disengage) == null)
			{
				agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_disengage"));
				agent.finalizeBehaviors();
			}
		}
		else
		{
			if (agent.findBehavior(this.Const.AI.Behavior.ID.PTRKataStep) == null)
			{
				agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_ptr_kata_step"));
				agent.finalizeBehaviors();
			}
		}
	}

	function isUsable()
	{
		if (this.skill.isUsable() && !this.getContainer().getActor().getCurrentProperties().IsRooted && this.getContainer().hasSkill("effects.str_covered_by_ally"))
		{
			local myTile = this.getContainer().getActor().getTile();

			for( local i = 0; i < 6; i++ )
			{
				if (myTile.hasNextTile(i))
				{
					local nextTile = myTile.getNextTile(i);

					if (!nextTile.IsOccupiedByActor)
					{
						return true;
					}
				}
			}
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

		return true;
	}

	function onAfterUpdate( _properties )
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
				this.m.ActionPointCost = this.Math.max(0, (actor.getActionPointCosts()[myTile.Type] + _properties.MovementFatigueCostAdditional) * _properties.MovementFatigueCostMult);
			}
		}
	}

	function onUse( _user, _targetTile )
	{
		this.Tactical.getNavigator().teleport(_user, _targetTile, null, null, false);
		this.m.IsHidden = true;
		this.removeSelf();
		return true;
	}
});
