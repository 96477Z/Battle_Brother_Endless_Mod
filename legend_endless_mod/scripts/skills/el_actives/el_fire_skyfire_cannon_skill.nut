this.el_fire_skyfire_cannon_skill <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 10,
		AdditionalHitChance = -10,
		SoundOnFire = [],
        MainTarget = null,
	},
	function onItemSet()
	{
		this.m.MaxRange = this.m.Item.getRangeMax();
	}

	function create()
	{
		this.m.ID = "el_actives.fire_skyfire_cannon";
		this.m.Name = "发射天火";
		this.m.Description = "如同天火的审判，能对超远处的敌人进行毁灭性打击。对最中心的目标额外造成50%伤害。";
		this.m.Icon = "skills/active_203.png";
		this.m.IconDisabled = "skills/active_203_sw.png";
		this.m.Overlay = "active_203";
		this.m.SoundOnFire = [
			"sounds/combat/dlc6/fire_gonne_01.wav",
			"sounds/combat/dlc6/fire_gonne_02.wav",
			"sounds/combat/dlc6/fire_gonne_03.wav",
			"sounds/combat/dlc6/fire_gonne_04.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc6/fire_gonne_hit_01.wav",
			"sounds/combat/dlc6/fire_gonne_hit_02.wav",
			"sounds/combat/dlc6/fire_gonne_hit_03.wav",
			"sounds/combat/dlc6/fire_gonne_hit_04.wav"
		];
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 750;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsWeaponSkill = true;
		this.m.IsUsingHitchance = true;
		this.m.IsDoingForwardMove = false;
		this.m.IsTargetingActor = false;
		this.m.IsAOE = true;
		this.m.InjuriesOnBody = this.Const.Injury.BurningAndPiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.BurningAndPiercingHead;
		this.m.DirectDamageMult = 0.25;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 5;
		this.m.MinRange = 3;
		this.m.MaxRange = 12;
		this.m.MaxRangeBonus = 1;
		this.m.MaxLevelDifference = 4;
	}

	function getTooltip()
	{
		local ret = this.getRangedTooltip(this.getDefaultTooltip());
		local ammo = this.getAmmo();

		if (ammo > 0)
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/ammo.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]" + ammo + "[/color] shots left"
			});
		}
		else
		{
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Needs a non-empty powder bag equipped[/color]"
			});
		}

		if (!this.getItem().isLoaded())
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Must be reloaded before firing again[/color]"
			});
		}

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
		return this.skill.isUsable() && this.getItem().isLoaded() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function getAmmo()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Ammo);

		if (item == null)
		{
			return 0;
		}

		if (item.getAmmoType() == this.Const.Items.AmmoType.Powder)
		{
			return item.getAmmo();
		}
	}

	function applyEffectToTargets( _tag )
	{
		local user = _tag.User;
		local targets = _tag.Targets;
		local attackSkill = user.getCurrentProperties().getRangedSkill();

		foreach( t in targets )
		{
			if (!t.IsOccupiedByActor || !t.getEntity().isAttackable())
			{
				continue;
			}

			local target = t.getEntity();
			local success = this.attackEntity(user, target, false);
            if(success && target == this.m.MainTarget && !target.isDying() && target.isAlive())
            {
                local properties = this.getContainer().buildPropertiesForUse(_tag.Skill, target);
                properties.DamageTotalMult *= 0.5;
                local info = {
                    Skill = this,
                    Container = this.getContainer(),
                    User = user,
                    TargetEntity = target,
                    Properties = properties,
                    DistanceToTarget = user.getTile().getDistanceTo(target.getTile())
                };
                _tag.Skill.onScheduledTargetHit(info);
                this.m.MainTarget = null;
            }

			if (success && target.isAlive() && !target.isDying() && t.IsVisibleForPlayer)
			{
				if (user.getPos().X <= target.getPos().X)
				{
					for( local i = 0; i < this.Const.Tactical.ShrapnelLeftParticles.len(); i = i )
					{
						local effect = this.Const.Tactical.ShrapnelLeftParticles[i];
						this.Tactical.spawnParticleEffect(false, effect.Brushes, t, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
						i = ++i;
					}
				}
				else
				{
					for( local i = 0; i < this.Const.Tactical.ShrapnelRightParticles.len(); i = i )
					{
						local effect = this.Const.Tactical.ShrapnelRightParticles[i];
						this.Tactical.spawnParticleEffect(false, effect.Brushes, t, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
						i = ++i;
					}
				}
			}
		}
	}

	function getAffectedTiles( _targetTile )
	{
		local ret = [
			_targetTile
		];
		local ownTile = this.m.Container.getActor().getTile();
		local dir = 0;
        local explosion_range = 1;
        local has_rarity_entry = this.getContainer().hasSkill("el_rarity_entry.gunfire_licks_the_heavens") && this.getContainer().getSkillByID("el_rarity_entry.gunfire_licks_the_heavens").EL_isUsable();
        if(has_rarity_entry)
        {
            explosion_range *= this.Const.EL_Rarity_Entry.Factor.EL_GunfireLicksTheHeavens.ExplosionRangeMult;
        }
        explosion_range += this.getItem().m.EL_AdditionalExplosionRange / 2;
        for(local direction = 0; direction < 6; ++direction)
        {
            if (_targetTile.hasNextTile(direction))
            {
                local forwardTile = _targetTile.getNextTile(direction);
                if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
                {
                    ret.push(forwardTile);
                }
                for(local index = 1; index < explosion_range; ++index)
                {
                    if(forwardTile.hasNextTile(direction))
                    {
                        forwardTile = forwardTile.getNextTile(direction);
                        if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
                        {
                            ret.push(forwardTile);
                        }
                    }
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

    function EL_addTile( _forwardTile, _tileArray )
    {
        foreach(tile in _tileArray)
        {
            if(tile.SquareCoords.X == _forwardTile.SquareCoords.X && tile.SquareCoords.Y == _forwardTile.SquareCoords.Y)//if(tile == _forwardTile)
            {
                return;
            }
        }
        _tileArray.push(_forwardTile);
    }

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
		}
	}

	function onTargetSelected( _targetTile )
	{
		local affectedTiles = this.getAffectedTiles(_targetTile);

		foreach( t in affectedTiles )
		{
			this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, t, t.Pos.X, t.Pos.Y);
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInCrossbows ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
        this.m.MainTarget = _targetTile.getEntity();
		this.Sound.play(this.m.SoundOnFire[this.Math.rand(0, this.m.SoundOnFire.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, _user.getPos());
		local tag = {
			Skill = this,
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onDelayedEffect.bindenv(this), tag);
		this.getItem().setLoaded(false);
		local skillToAdd = this.new("scripts/skills/actives/reload_handgonne_skill");
		skillToAdd.setItem(this.getItem());
		skillToAdd.setFatigueCost(this.Math.max(0, skillToAdd.getFatigueCostRaw() + this.getItem().m.FatigueOnSkillUse));
		this.getContainer().add(skillToAdd);
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local user = _tag.User;
		local targetTile = _tag.TargetTile;
		local myTile = user.getTile();
		local dir = myTile.getDirectionTo(targetTile);

		if (myTile.IsVisibleForPlayer)
		{
			if (user.isAlliedWithPlayer())
			{
				for( local i = 0; i < this.Const.Tactical.HandgonneRightParticles.len(); i = i )
				{
					local effect = this.Const.Tactical.HandgonneRightParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, myTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
					i = ++i;
				}
			}
			else
			{
				for( local i = 0; i < this.Const.Tactical.HandgonneLeftParticles.len(); i = i )
				{
					local effect = this.Const.Tactical.HandgonneLeftParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, myTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
					i = ++i;
				}
			}
		}

		local affectedTiles = this.getAffectedTiles(targetTile);
		this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], 1.0, user.getPos());
		local tag = {
			Skill = _tag.Skill,
			User = user,
			Targets = affectedTiles
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, this.applyEffectToTargets.bindenv(this), tag);
		return true;
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.reload_handgonne");
	}

});