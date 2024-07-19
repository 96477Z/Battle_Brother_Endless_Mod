this.ptr_swordmaster_charge_skill <- this.inherit("scripts/skills/actives/ptr_swordmaster_active_abstract", {
	m = {
		IsSpent = false,
		IsCharging = false,
		DamageMultBonus = 0.5
	},
	function create()
	{
		this.m.ID = "actives.ptr_swordmaster_charge";
		this.m.Name = "Juggernaut Charge";
		this.m.Description = "Unleash the juggernaut! Rush towards your opponents, closing the gap quickly, and perform a devastating attack.";
		this.m.Icon = "skills/ptr_swordmaster_charge_skill.png";
		this.m.IconDisabled = "skills/ptr_swordmaster_charge_skill_bw.png";
		this.m.Overlay = "ptr_swordmaster_charge_skill";
		this.m.SoundOnUse = [
			"sounds/combat/indomitable_01.wav",
			"sounds/combat/indomitable_02.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/knockback_hit_01.wav",
			"sounds/combat/knockback_hit_02.wav",
			"sounds/combat/knockback_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingActorPitch = true;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.MaxLevelDifference = 1;
	}

	function getTooltip()
	{
		local tooltip = this.getDefaultUtilityTooltip();

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immediately gain the Indomitable effect"
		});

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Will move to the targeted tile and attack a random adjacent enemy with [color=" + this.Const.UI.Color.PositiveValue + "]" + (this.m.DamageMultBonus * 100) + "%[/color] increased damage"
		});

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color] chance to stagger all enemies adjacent to the target tile"
		});

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon == null || weapon.isWeaponType(::Const.Items.WeaponType.BFFencing) || !weapon.isWeaponType(::Const.Items.WeaponType.Sword) || !weapon.isItemType(::Const.Items.ItemType.TwoHanded))
		{
			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a two-handed non-fencing sword[/color]"
			});
		}

		this.addEnabledTooltip(tooltip);

		if (this.getContainer().getActor().isEngagedInMelee())
		{
			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Not usable when engaged in melee[/color]"
			});
		}

		if (this.m.IsSpent)
		{
			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Is only usable once per turn[/color]"
			});
		}

		return tooltip;
	}

	function isUsable()
	{
		return !this.m.IsSpent && this.ptr_swordmaster_active_abstract.isUsable() &&
				this.getContainer().getActor().isArmedWithTwoHandedWeapon() &&
				!this.getContainer().getActor().getMainhandItem().isWeaponType(::Const.Items.WeaponType.BFFencing) &&
				!this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!_targetTile.IsEmpty)
		{
			return false;
		}

		if (this.Math.abs(_targetTile.Level - _originTile.Level) > this.m.MaxLevelDifference)
		{
			return false;
		}

		local myPos = _originTile.Pos;
		local targetPos = _targetTile.Pos;
		local distance = _originTile.getDistanceTo(_targetTile);
		local Dx = (targetPos.X - myPos.X) / distance;
		local Dy = (targetPos.Y - myPos.Y) / distance;

		for( local i = 0; i < distance; i = ++i )
		{
			local x = myPos.X + Dx * i;
			local y = myPos.Y + Dy * i;
			local tileCoords = this.Tactical.worldToTile(this.createVec(x, y));
			local tile = this.Tactical.getTile(tileCoords);

			if (!tile.IsOccupiedByActor && !tile.IsEmpty)
			{
				return false;
			}

			if (tile.hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
			{
				return false;
			}

			if (this.Math.abs(tile.Level - _originTile.Level) > 1)
			{
				return false;
			}
		}

		return true;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

	function onUse( _user, _targetTile )
	{
		this.m.IsSpent = true;
		_user.getSkills().add(::new("scripts/skills/effects/indomitable_effect"));

		local tag = {
			Skill = this,
			User = _user,
			OldTile = _user.getTile(),
			TargetTile = _targetTile,
			OnRepelled = this.onRepelled
		};

		if (tag.OldTile.IsVisibleForPlayer || _targetTile.IsVisibleForPlayer)
		{
			local myPos = _user.getPos();
			local targetPos = _targetTile.Pos;
			local distance = tag.OldTile.getDistanceTo(_targetTile);
			local Dx = (targetPos.X - myPos.X) / distance;
			local Dy = (targetPos.Y - myPos.Y) / distance;

			for( local i = 0; i < distance; i = ++i )
			{
				local x = myPos.X + Dx * i;
				local y = myPos.Y + Dy * i;
				local tile = this.Tactical.worldToTile(this.createVec(x, y));

				if (this.Tactical.isValidTile(tile.X, tile.Y) && this.Const.Tactical.DustParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, this.Tactical.getTile(tile), this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.5, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages);
					}
				}
			}
		}

		this.Tactical.getNavigator().teleport(_user, _targetTile, this.onTeleportDone, tag, false, 2.0);
		return true;
	}

	function onRepelled( _tag )
	{
		this.Tactical.getNavigator().teleport(_tag.User, _tag.TargetTile, null, null, false);
	}

	function onTeleportDone( _entity, _tag )
	{
		local attack = _entity.getSkills().getAttackOfOpportunity();
		local myTile = _entity.getTile();
		local ZOC = [];
		local dirToTarget = _tag.OldTile.getDirectionTo(myTile);

		if (attack != null)
		{
			for (local i = 0; i < 6; i = ++i)
			{
				if (myTile.hasNextTile(i))
				{
					local tile = myTile.getNextTile(i);

					if (tile.IsOccupiedByActor && attack.verifyTargetAndRange(tile, myTile))
					{
						local actor = tile.getEntity();

						if (!actor.isAlliedWith(_entity))
						{
							ZOC.push(actor);
						}
					}
				}
			}
		}

		foreach (actor in ZOC)
		{
			if (!actor.onMovementInZoneOfControl(_entity, true))
			{
				continue;
			}

			if (actor.onAttackOfOpportunity(_entity, true))
			{
				if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges and is repelled");
				}

				if (!_entity.isAlive() || _entity.isDying())
				{
					return;
				}

				local dir = myTile.getDirectionTo(_tag.OldTile);

				if (myTile.hasNextTile(dir))
				{
					local tile = myTile.getNextTile(dir);

					if (tile.IsEmpty && this.Math.abs(tile.Level - myTile.Level) <= 1 && tile.getDistanceTo(actor.getTile()) > 1)
					{
						_tag.TargetTile = tile;
						this.Time.scheduleEvent(this.TimeUnit.Virtual, 50, _tag.OnRepelled, _tag);
						return;
					}
				}

				for( local i = 0; i != 6; i = ++i )
				{
					if (myTile.hasNextTile(i))
					{
						local tile = myTile.getNextTile(i);

						if (tile.IsEmpty && this.Math.abs(tile.Level - myTile.Level) <= 1)
						{
							if (tile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions()) == 0)
							{
								_tag.TargetTile = tile;
								this.Time.scheduleEvent(this.TimeUnit.Virtual, 50, _tag.OnRepelled, _tag);
								return;
							}
						}
					}
				}

				_tag.TargetTile = _tag.OldTile;
				this.Time.scheduleEvent(this.TimeUnit.Virtual, 50, _tag.OnRepelled, _tag);
				return;
			}
		}

		if (ZOC.len() != 0)
		{
			local victim = ::MSU.Array.rand(ZOC);

			if (_tag.Skill.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(_tag.Skill.m.SoundOnHit[this.Math.rand(0, _tag.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, victim.getPos());
			}

			foreach (enemy in ZOC)
			{
				if (!enemy.isHiddenToPlayer())
				{
					local layers = this.Const.ShakeCharacterLayers[this.Const.BodyPart.Body];
					this.Tactical.getShaker().shake(enemy, myTile, 2);
				}

				enemy.getSkills().add(this.new("scripts/skills/effects/staggered_effect"));
			}

			if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges and attacks " + this.Const.UI.getColorizedEntityName(victim) + " while staggering adjacent targets");
			}

			_tag.Skill.m.IsCharging = true;
			attack.useForFree(victim.getTile());
			_tag.Skill.m.IsCharging = false;

			return;
		}

		if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges");
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.m.IsCharging)
		{
			_properties.DamageTotalMult *= 1.0 + this.m.DamageMultBonus;
		}
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.IsCharging) this.m.IsCharging = false;
	}

});

