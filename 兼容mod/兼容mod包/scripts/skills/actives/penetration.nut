this.penetration <- this.inherit("scripts/skills/skill", {
	m = {
	     skillCount = 1,
	     Hitchance = 0,
	     HitchancePerTile = 0
	    
	    },
	function create()
	{
		this.m.ID = "actives.penetration";
		this.m.Name = "投掷长矛";
		this.m.Description = "投掷你的长矛，穿透一行所有目标。近战时不能使用。";
		this.m.KilledString = "Impaled";
		this.m.Icon = "skills/active_333.png";
		this.m.IconDisabled = "skills/active_333_sw.png";
		this.m.Overlay = "SpearofLonginus_01";
		this.m.SoundOnUse = [
			"sounds/combat/dlc2/throwing_spear_throw_01.wav",
			"sounds/combat/dlc2/throwing_spear_throw_02.wav",
			"sounds/combat/dlc2/throwing_spear_throw_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc2/throwing_spear_hit_01.wav",
			"sounds/combat/dlc2/throwing_spear_hit_02.wav",
			"sounds/combat/dlc2/throwing_spear_hit_03.wav",
			"sounds/combat/dlc2/throwing_spear_hit_04.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/dlc2/throwing_spear_miss_01.wav",
			"sounds/combat/dlc2/throwing_spear_miss_02.wav",
			"sounds/combat/dlc2/throwing_spear_miss_03.wav",
			"sounds/combat/dlc2/throwing_spear_miss_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsTargetingActor = false;
		this.m.IsWeaponSkill = true;
		this.m.IsDoingForwardMove = false;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.45;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.None;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();

		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + 6 + "[/color] tiles"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+"+(this.m.Hitchance)+"%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]-"+(this.m.HitchancePerTile)+"%[/color] per tile of distance"
			}
		]);

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
		return !this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}




	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

function applyEffectToTargets( _tag )
	{
		local user = _tag.User;
		local targets = _tag.Targets;
		local attackSkill = user.getCurrentProperties().getRangedSkill();
		local last;
        foreach( t in targets )
        {
        if (t.IsOccupiedByActor&&t.getEntity().isAttackable())
			{
				last = t;
			
			}
		
        }
		foreach( t in targets )
		{
		    
			if (!t.IsOccupiedByActor || !t.getEntity().isAttackable())
			{
				continue;
			}
            
			local target = t.getEntity();
			  if(t == last)
            {
            this.m.ProjectileType = this.Const.ProjectileType.SpearofLonginus;
            }
			local success = this.attackEntity(user, target, false);
          
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
		
//		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, function ( user )
//			{
			user.getSkills().add(this.new("scripts/skills/actives/call_back"));
			user.getItems().unequip(user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));

			//			}.bindenv(this), this);
			
		this.m.ProjectileType = this.Const.ProjectileType.None;
	}

	function getAffectedTiles( _targetTile )
	{
		local ret = [
			_targetTile
		];
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);
		local forwardTile = _targetTile.getNextTile(dir);
		ret.push(forwardTile);
      for(local i = 0;i<5;i++)
      {
		if (forwardTile.hasNextTile(dir))
		{
			forwardTile = forwardTile.getNextTile(dir);

			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
			{
				ret.push(forwardTile);
			}
		}
      }

	

		return ret;
	}



	function onTargetSelected( _targetTile )
	{
		local affectedTiles = this.getAffectedTiles(_targetTile);

		foreach( t in affectedTiles )
		{
			this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, t, t.Pos.X, t.Pos.Y);
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
	function onUse( _user, _targetTile )
	{
	
		local tag = {
			Skill = this,
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 10, this.onDelayedEffect.bindenv(this), tag);
		
/*
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, function ( _user )
			{
			this.getContainer().getActor().getSkills().add(this.new("scripts/skills/actives/call_back"));
			this.getContainer().getActor().getItems().unequip(this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));
			}.bindenv(this), this);
*/
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local user = _tag.User;
		local targetTile = _tag.TargetTile;
		local myTile = user.getTile();
		local dir = myTile.getDirectionTo(targetTile);

	
		local affectedTiles = this.getAffectedTiles(targetTile);
		local tag = {
			Skill = _tag.Skill,
			User = user,
			Targets = affectedTiles
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 10, this.applyEffectToTargets.bindenv(this), tag);
		return true;
	}

	
	
	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
//			_properties.RangedSkill += this.Math.max(10, this.getContainer().getActor().getCurrentProperties().MeleeSkill- 50);
//			this.m.Hitchance = this.Math.max(10, this.getContainer().getActor().getCurrentProperties().MeleeSkill- 50);
			_properties.RangedSkill += this.Math.max(10, this.getContainer().getActor().getCurrentProperties().MeleeSkill- 10);
			this.m.Hitchance = this.Math.max(10, this.getContainer().getActor().getCurrentProperties().MeleeSkill- 10);
			_properties.HitChanceAdditionalWithEachTile -= this.Math.min(10, 13- this.getContainer().getActor().getCurrentProperties().RangedSkill*0.1);
		    this.m.HitchancePerTile = this.Math.min(10, 13- this.getContainer().getActor().getCurrentProperties().RangedSkill*0.1);
			_properties.RangedAttackBlockedChanceMult *= 0;
		}
	}



});

