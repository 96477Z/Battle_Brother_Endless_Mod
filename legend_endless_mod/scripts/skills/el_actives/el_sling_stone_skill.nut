this.el_sling_stone_skill <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = -10,
		AdditionalHitChance = -5
	},
	function create()
	{
		this.m.ID = "actives.sling_stone";
		this.m.Name = "暴雨梨花";
		this.m.Description = "Propel a stone towards a target with your sling. Accuracy drops sharply with distance. Can not be used while engaged in melee.";
		this.m.KilledString = "Stoned";
		this.m.Icon = "skills/active_12.png";
		this.m.IconDisabled = "skills/active_12_sw.png";
		this.m.Overlay = "active_12";
		this.m.SoundOnUse = [
			"sounds/combat/dlc4/sling_use_01.wav",
			"sounds/combat/dlc4/sling_use_02.wav",
			"sounds/combat/dlc4/sling_use_03.wav",
			"sounds/combat/dlc4/sling_use_04.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc4/sling_hit_01.wav",
			"sounds/combat/dlc4/sling_hit_02.wav",
			"sounds/combat/dlc4/sling_hit_03.wav",
			"sounds/combat/dlc4/sling_hit_04.wav"
		];
		this.m.SoundOnHitShield = [
			"sounds/combat/dlc4/sling_shield_hit_01.wav",
			"sounds/combat/dlc4/sling_shield_hit_02.wav",
			"sounds/combat/dlc4/sling_shield_hit_03.wav",
			"sounds/combat/dlc4/sling_shield_hit_04.wav",
			"sounds/combat/dlc4/sling_shield_hit_05.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/dlc4/sling_miss_01.wav",
			"sounds/combat/dlc4/sling_miss_02.wav",
			"sounds/combat/dlc4/sling_miss_03.wav",
			"sounds/combat/dlc4/sling_miss_04.wav",
			"sounds/combat/dlc4/sling_miss_05.wav",
			"sounds/combat/dlc4/sling_miss_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 500;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsWeaponSkill = true;
		this.m.IsDoingForwardMove = false;
		this.m.IsTargetingActor = false;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.35;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 2;
		this.m.MaxRange = 6;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Stone;
		this.m.ProjectileTimeScale = 1.2;
		this.m.IsProjectileRotated = true;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 25;
	}

	function getTooltip()
	{
		local ret = this.getRangedTooltip(this.getDefaultTooltip());
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a [color=" + this.Const.UI.Color.NegativeValue + "]100%[/color] chance to daze a target on a hit to the head"
		});

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && (!this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()));
	}

	function onAfterUpdate( _properties )
	{
		this.m.MaxRange = this.m.Item.getRangeMax() + (_properties.IsSpecializedInSlings ? 1 : 0);
		this.m.AdditionalAccuracy = _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
		this.m.FatigueCostMult = _properties.IsSpecializedInSlings ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onTargetSelected( _targetTile )
	{
		local affectedTiles = this.getAffectedTiles(_targetTile);

		foreach( t in affectedTiles )
		{
			this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, t, t.Pos.X, t.Pos.Y);
		}
	}

	function onUse( _user, _targetTile )
	{
		this.getContainer().setBusy(true);
		local condition = this.m.Item.getCondition();
		local affectedTiles = this.getAffectedTiles(_targetTile);
		local attack_time = this.Math.rand(10, 25);
		local attack_tile = [];
		while(attack_time)
		{
			local r = this.Math.rand(0, affectedTiles.len() - 1);
			attack_tile.push(affectedTiles[r]);
			--attack_time;
		}
		foreach(tile in attack_tile)
		{
			local target_entity = tile.getEntity();
			if (target_entity == null || target_entity.isRock() || target_entity.isSticks() || target_entity.isBush() || target_entity.isTree() || target_entity.isSupplies())
			{
				continue;
			}
			if(target_entity.getName() != "UNKNOWN" && !tile.IsEmpty && target_entity.isAlive() && !target_entity.isDying())
			{
				this.attackEntity(_user, target_entity);
			}
		}
		this.m.Item.setCondition(condition);
		this.m.Item.lowerCondition();
		this.getContainer().setBusy(false);

		if (!_user.isPlayerControlled() && _targetTile.getEntity().isPlayerControlled())
		{
			_user.getTile().addVisibilityForFaction(this.Const.Faction.Player);
		}
		return true;
	}	
	

	function getAffectedTiles( _targetTile )
	{
		local ret = [
			_targetTile
		];
		local ownTile = this.m.Container.getActor().getTile();
		local dir = 0;
		for(local direction = 0; direction < 6; ++direction)
		{
			if (_targetTile.hasNextTile(direction))
			{
				local forwardTile = _targetTile.getNextTile(direction);
				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					ret.push(forwardTile);
				}
			}
		}
		local temp_ret = clone ret;
		foreach(tile in temp_ret)
		{
			local distance = tile.getDistanceTo(_targetTile);
			if(distance < 2)
			{
				continue;
			}
			local dir = tile.getDirectionTo(_targetTile);
			local left = dir + 1 > 5 ? 0 : dir + 1;
			local right = dir - 1 < 0 ? 5 : dir - 1;
			local forwardTile;
			if(tile.hasNextTile(left))
			{
				forwardTile = tile.getNextTile(left);
				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					EL_addTile(forwardTile, ret);
				}
			}
			for(local index = 2; index < distance; ++index)
			{
				if(forwardTile.hasNextTile(left))
				{
					local forwardTile = forwardTile.getNextTile(left);
					if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
					{
						EL_addTile(forwardTile, ret);
					}
				}
			}
			if(tile.hasNextTile(right))
			{
				forwardTile = tile.getNextTile(right);
				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					EL_addTile(forwardTile, ret);
				}
			}
			for(local index = 2; index < distance; ++index)
			{
				if(forwardTile.hasNextTile(right))
				{
					local forwardTile = forwardTile.getNextTile(right);
					if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
					{
						EL_addTile(forwardTile, ret);
					}
				}
			}
		}
		return ret;
	}

	function onPerformAttack( _tag )
	{
		_tag.Skill.getContainer().setBusy(false);
		return _tag.Skill.attackEntity(_tag.User, _tag.TargetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += _properties.IsSpecializedInSlings ? this.m.Item.getAdditionalAccuracy() + 5 : this.m.Item.getAdditionalAccuracy();
			_properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this && _targetEntity.isAlive() && !_targetEntity.isDying() && !_targetEntity.getCurrentProperties().IsImmuneToStun)
		{
			local targetTile = _targetEntity.getTile();
			local user = this.getContainer().getActor();
			

			if (_bodyPart == this.Const.BodyPart.Head && !_targetEntity.getCurrentProperties().IsImmuneToDaze)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/dazed_effect"));

				if (!user.isHiddenToPlayer() && targetTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " struck a hit that leaves " + this.Const.UI.getColorizedEntityName(_targetEntity) + " dazed");
				}
			}
		}
	}

    function EL_isRaritySkill()
    {
        return true;
    }

});