this.perk_ptr_bone_breaker <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		IsForceTwoHanded = false,
		IsTargetValid = false,
		InjuryPool = null,
		BonusVsUndead = 1.15,
		ChanceOneHanded = 50,
		DamageInflictedHitpoints = 0,
		MinDamageToInflictInjury = 5,
		TargetsThisTurn = [],
		ValidEffects = [
			"effects.sleeping",
			"effects.stunned",
			"effects.net",
			"effects.legend_grappled",
			"effects.web",
			"effects.rooted"
		]
	},
	function create()
	{
		this.m.ID = "perk.ptr_bone_breaker";
		this.m.Name = this.Const.Strings.PerkName.PTRBoneBreaker;
		this.m.Description = this.Const.Strings.PerkDescription.PTRBoneBreaker;
		this.m.Icon = "ui/perks/ptr_bone_breaker.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Offensive;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local weapon = this.getContainer().getActor().getMainhandItem();
		if(weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Mace))
		{
			return false;
		}

		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || !_skill.isAttack() || !this.isEnabled())
		{
			return;
		}

		if(_targetEntity.getFlags().has("undead") && !_targetEntity.getFlags().has("ghoul") && !_targetEntity.getFlags().has("ghost"))
		{
			_properties.DamageTotalMult *= this.m.BonusVsUndead;
		}
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.InjuryPool = null;
	}
	
	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		this.m.InjuryPool = _hitInfo.Injuries;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.m.DamageInflictedHitpoints = _damageInflictedHitpoints;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (this.m.DamageInflictedHitpoints < this.m.MinDamageToInflictInjury || this.m.InjuryPool == null || _targetEntity == null || this.m.TargetsThisTurn.find(_targetEntity.getID()) != null || !_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.isAlliedWith(this.getContainer().getActor()) || !_skill.isAttack() || !this.isEnabled())
		{
			this.m.InjuryPool = null;
			return;
		}

		if (_targetEntity.getFlags().has("undead") && !_targetEntity.getFlags().has("ghoul") && !_targetEntity.getFlags().has("ghost") && !this.getContainer().hasSkill("perk.ptr_deep_impact"))
		{
			this.m.InjuryPool = null;
			return;
		}

		if (_targetEntity.getSkills().getSkillsByFunction((@(_skill) this.m.ValidEffects.find(_skill.getID()) != null).bindenv(this)).len() > 0)
		{
			local weapon = this.getContainer().getActor().getMainhandItem();
			if ((weapon != null && weapon.isItemType(this.Const.Items.ItemType.TwoHanded)) || this.m.IsForceTwoHanded || this.Math.rand(1,100) <= this.m.ChanceOneHanded)
			{
				this.m.TargetsThisTurn.push(_targetEntity.getID());
				this.applyInjury(_targetEntity);
				this.m.InjuryPool = null;
			}
		}
	}

	function onTurnStart()
	{
		this.m.TargetsThisTurn.clear();
	}

	function onCombatStarted()
	{
		this.m.InjuryPool = null;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.TargetsThisTurn.clear();
		this.m.InjuryPool = null;
	}

	function applyInjury( _targetEntity )
	{
		if (_targetEntity.m.CurrentProperties.IsAffectedByInjuries && _targetEntity.m.CurrentProperties.ThresholdToReceiveInjuryMult != 0)
		{
			local injuries = this.m.InjuryPool;
			local potentialInjuries = [];

			foreach( inj in injuries )
			{
				if (!_targetEntity.m.Skills.hasSkill(inj.ID) && _targetEntity.m.ExcludedInjuries.find(inj.ID) == null)
				{
					potentialInjuries.push(inj.Script);
				}
			}

			local appliedInjury = false;

			while (potentialInjuries.len() != 0)
			{
				local r = this.Math.rand(0, potentialInjuries.len() - 1);
				local injury = this.new("scripts/skills/" + potentialInjuries[r]);

				if (injury.isValid(_targetEntity))
				{
					_targetEntity.m.Skills.add(injury);

					if (_targetEntity.isPlayerControlled() && this.isKindOf(_targetEntity, "player"))
					{
						_targetEntity.worsenMood(this.Const.MoodChange.Injury, "Suffered an injury");
					}

					if (_targetEntity.isPlayerControlled() || !_targetEntity.isHiddenToPlayer())
					{
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_targetEntity) + " suffers " + injury.getNameOnly() + " due to " + this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + "\'s Bone Breaker perk!");
					}

					appliedInjury = true;
					break;
				}
				else
				{
					potentialInjuries.remove(r);
				}
			}

			if (appliedInjury)
			{
				_targetEntity.onUpdateInjuryLayer();
			}
		}
	}
});
