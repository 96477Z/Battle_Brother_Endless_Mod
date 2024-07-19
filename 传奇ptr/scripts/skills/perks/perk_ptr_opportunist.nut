this.perk_ptr_opportunist <- this.inherit("scripts/skills/skill", {
	m = {
		APRecovered = 4,
		IsPrimed = false,
		FatCostRed = 50
	},
	function create()
	{
		this.m.ID = "perk.ptr_opportunist";
		this.m.Name = this.Const.Strings.PerkName.PTROpportunist;
		this.m.Description = "This character wastes no opportunity to pull a weapon out of an enemy\'s corpse, only to launch it towards another!";
		this.m.Icon = "ui/perks/ptr_opportunist.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "The next throwing attack builds [color=" + this.Const.UI.Color.PositiveValue + "]-" + this.m.FatCostRed + "%[/color] Fatigue"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "Will expire upon waiting or ending the turn, swapping your weapon, or using any skill"
		});

		return tooltip;
	}

	function canProcOntile( _tile )
	{
		return _tile.IsCorpseSpawned && this.getContainer().getActor().getAlliedFactions().find(_tile.Properties.get("Corpse").Faction) == null && this.Const.Combat.OpportunistUsedTiles.find(_tile.ID) == null;
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

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap() || !this.isEnabled() || !::Tactical.TurnSequenceBar.isActiveEntity(actor))
		{
			return;
		}

		if (actor.m.IsMoving)
		{
			local tile = actor.getTile();

			if (tile == null || !this.canProcOntile(tile))
			{
				return;
			}

			local weapon = actor.getMainhandItem();

			weapon.setAmmo(this.Math.min(weapon.m.AmmoMax, weapon.m.Ammo + 1));

			actor.setActionPoints(this.Math.min(actor.getActionPointsMax(), actor.getActionPoints() + 4));
			actor.setDirty(true);
			this.spawnIcon("perk_ptr_opportunist", tile);

			this.Const.Combat.OpportunistUsedTiles.push(tile.ID);

			this.m.IsPrimed = true;
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.IsHidden = true;

		if (this.m.IsPrimed && this.isEnabled())
		{
			this.m.IsHidden = false;

			local skills = this.getContainer().getActor().getMainhandItem().getSkills();
			foreach (s in skills)
			{
				if (s.isAttack() && s.isRanged())
				{
					s.m.FatigueCostMult *= this.m.FatCostRed * 0.01;
				}
			}
		}
	}

	function onPayForItemAction( _skill, _items )
	{
		this.m.IsPrimed = false;
	}

	function onAnySkillExecuted ( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.IsPrimed = false;
	}

	function onTurnStart()
	{
		this.m.IsPrimed = false;
	}

	function onWaitTurn()
	{
		this.m.IsPrimed = false;
	}	

	function onCombatStarted()
	{
		this.Const.Combat.OpportunistUsedTiles.clear();
		this.m.IsPrimed = false;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.Const.Combat.OpportunistUsedTiles.clear();
		this.m.IsPrimed = false;
	}
});
