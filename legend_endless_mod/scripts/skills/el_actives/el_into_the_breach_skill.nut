this.el_into_the_breach_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.spearwall";
		this.m.Name = "陷阵之志！";
		this.m.Icon = "el_skills/into_the_breach_skill.png";
		this.m.IconDisabled = "el_skills/into_the_breach_skill_sw.png";
		this.m.Overlay = "into_the_breach_skill";
		this.m.SoundOnUse = [
			"sounds/combat/spearwall_01.wav",
			"sounds/combat/spearwall_02.wav",
			"sounds/combat/spearwall_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getDescription()
	{
		return "Prepare to immediately attack any opponent that attempts to move into melee range and, on a hit, prevent that opponent from closing in. Targets hit will receive half the damage of a normal attack.";
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

		if (this.Tactical.isActive() && !this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpears && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return !this.Tactical.isActive() || this.skill.isUsable() && (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpears || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions())) && !this.getContainer().hasSkill("el_rarity_effects.into_the_breach");
	}

	function onAfterUpdate( _properties )
	{
		if (_properties.IsSpecializedInSpears)
		{
			this.m.FatigueCostMult *= 0.75;
		}
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local chain_ally = [];
		EL_findUsableAlly(_user, chain_ally);
		this.logInfo("chain_ally len："+chain_ally.len());
		foreach( actor in chain_ally )
		{
			local skill = this.new("scripts/skills/el_effects/el_into_the_breach_effect");
			skill.EL_setStack(chain_ally.len());
			actor.getSkills().add(skill);
			if (!_user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " uses 陷阵");
			}
		}
		local skill = this.new("scripts/skills/el_effects/el_into_the_breach_effect");
		skill.EL_setStack(chain_ally.len());
		this.m.Container.add(skill);
		if (!_user.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses 陷阵");
		}
		return true;
	}
	
	function EL_findUsableAlly( _user, _chain_ally )
	{
		local my_tile = _user.getTile();
		local actors = this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());
		foreach( actor in actors )
		{
			if (actor.getID() == _user.getID() && !actor.isArmedWithMeleeWeapon())
			{
				continue;
			}

			if (my_tile.getDistanceTo(actor.getTile()) > this.Const.EL_Rarity_Entry.Factor.EL_IntoTheBreach.DistanceRange)
			{
				continue;
			}

			if (this.Math.abs(actor.getTile().Level - my_tile.Level) > 1)
			{
				continue;
			}

			if (actor.getFaction() == _user.getFaction())
			{   
				local is_add = true;
				foreach(ally in _chain_ally)
				{
					if(actor == ally)
					{
						is_add = false;
						break;
					}
				}
				if(is_add)
				{
					_chain_ally.push(actor);
					EL_findUsableAlly(actor, _chain_ally);
				}
			}
		}
	}

});

