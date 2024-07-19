this.legend_kick <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_kick";
		this.m.Name = "Kick";
		this.m.Description = "Kick a target away by one tile. Targets hit will receive fatigue and may take damage if they are pushed down several levels of height. Shieldwall, Spearwall and Riposte will be canceled for a target that is successfully knocked back. A rooted target can not be knocked back.";
		this.m.Icon = "skills/kick_square.png";
		this.m.IconDisabled = "skills/kick_square_bw.png";
		this.m.Overlay = "active_10";
		this.m.SoundOnUse = [
			"sounds/combat/knockback_01.wav",
			"sounds/combat/knockback_02.wav",
			"sounds/combat/knockback_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/hand_hit_01.wav",
			"sounds/combat/hand_hit_02.wav",
			"sounds/combat/hand_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
		local p = this.getContainer().getActor().getCurrentProperties();
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

		if (p.IsSpecializedInFists)
		{
			local actor = this.getContainer().getActor();
			local p = this.getContainer().getActor().getCurrentProperties();
			local bodyHealth = actor.getHitpointsMax();
			local mult = p.MeleeDamageMult;
			local damagemin = this.Math.abs(10 * p.DamageTotalMult);
			local damagemax = this.Math.abs(25 * p.DamageTotalMult);

			if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))
			{
				local muscularity = this.Math.floor(bodyHealth * 0.1);
				damagemax = damagemax + muscularity;
			}

			if (mult != 1.0)
			{
				damagemin = this.Math.floor(damagemin * mult);
				damagemax = this.Math.floor(damagemax * mult);
			}

			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damagemin + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damagemax + "[/color] damage to hitpoints"
			});
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + this.Math.abs(0.5 * damagemin) + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + this.Math.abs(0.5 * damagemax) + "[/color] damage to armor"
			});
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+40%[/color] chance to hit"
			});
		}
		else
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] chance to hit"
			});
		}

		return ret;
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _userTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local knockToTile = _targetTile.getNextTile(dir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		local altdir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		altdir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_targetTile.hasNextTile(altdir))
		{
			local knockToTile = _targetTile.getNextTile(altdir);

			if (knockToTile.IsEmpty && knockToTile.Level - _targetTile.Level <= 1)
			{
				return knockToTile;
			}
		}

		return null;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (_targetTile.getEntity().getCurrentProperties().IsRooted)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
		}

		if (this.Math.rand(1, 100) > this.getHitchance(target))
		{
			target.onMissed(this.getContainer().getActor(), this);
			return false;
		}

		local knockToTile = this.findTileToKnockBackTo(_user.getTile(), _targetTile);

		if (knockToTile == null)
		{
			return false;
		}

		this.applyFatigueDamage(target, 10);

		if (target.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return false;
		}

		if (!_user.isHiddenToPlayer() && (_targetTile.IsVisibleForPlayer || knockToTile.IsVisibleForPlayer))
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has knocked back " + this.Const.UI.getColorizedEntityName(target));
		}

		local skills = target.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");

		if (this.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
		}

		target.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
		local hasFistMastery = _user.getSkills().hasSkill("perk.mastery_fist");
		local damage = this.Math.max(0, this.Math.abs(knockToTile.Level - _targetTile.Level) - 1) * this.Const.Combat.FallingDamage;

		if (damage == 0 && !hasFistMastery)
		{
			this.Tactical.getNavigator().teleport(target, knockToTile, null, null, true);
		}
		else
		{
			local p = this.getContainer().getActor().getCurrentProperties();
			local tag = {
				Attacker = _user,
				Skill = this,
				HitInfo = clone this.Const.Tactical.HitInfo,
				HitInfoBash = null
			};
			tag.HitInfo.DamageRegular = damage;
			tag.HitInfo.DamageFatigue = this.Const.Combat.FatigueReceivedPerHit;
			tag.HitInfo.DamageDirect = 1.0;
			tag.HitInfo.BodyPart = this.Const.BodyPart.Body;
			tag.HitInfo.BodyDamageMult = 1.0;
			tag.HitInfo.FatalityChanceMult = 1.0;

			if (hasFistMastery)
			{
				local actor = this.getContainer().getActor();
				local p = this.getContainer().getActor().getCurrentProperties();
				local bodyHealth = actor.getHitpointsMax();
				local damagemin = this.Math.abs(10 * p.DamageTotalMult);
				local damagemax = this.Math.abs(25 * p.DamageTotalMult);

				if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))
				{
					local muscularity = this.Math.floor(bodyHealth * 0.1);
					damagemin = damagemin + muscularity;
					damagemax = damagemax + muscularity;
				}

				damage = damage + this.Math.rand(damagemin, damagemax);
				tag.HitInfoBash = clone this.Const.Tactical.HitInfo;
				tag.HitInfoBash.DamageRegular = damage * p.DamageRegularMult;
				tag.HitInfoBash.DamageArmor = this.Math.floor(damage * 0.5);
				tag.HitInfoBash.DamageFatigue = 10;
				tag.HitInfoBash.BodyPart = this.Const.BodyPart.Body;
				tag.HitInfoBash.BodyDamageMult = 1.0;
				tag.HitInfoBash.FatalityChanceMult = 0.0;
			}

			this.Tactical.getNavigator().teleport(target, knockToTile, this.onKnockedDown, tag, true);
		}

		return true;
	}

	function onAfterUpdate( _properties )
	{
		if ("IsSpecializedInFists" in _properties)
		{
			this.m.FatigueCostMult = _properties.IsSpecializedInFists ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
			this.m.ActionPointCost = _properties.IsSpecializedInFists ? 3 : 4;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.MeleeSkill += 25;

			if (_properties.IsSpecializedInFists)
			{
				_properties.MeleeSkill += 15;
			}
		}
	}

	function onKnockedDown( _entity, _tag )
	{
		if (_tag.HitInfo.DamageRegular != 0)
		{
			_entity.onDamageReceived(_tag.Attacker, _tag.Skill, _tag.HitInfo);
		}

		if (_tag.HitInfoBash != null)
		{
			_entity.onDamageReceived(_tag.Attacker, _tag.Skill, _tag.HitInfoBash);
		}
	}

});

