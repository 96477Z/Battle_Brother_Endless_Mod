this.perk_ptr_swift_stabs <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = true
	},
	function create()
	{
		this.m.ID = "perk.ptr_swift_stabs";
		this.m.Name = this.Const.Strings.PerkName.PTRSwiftStabs;
		this.m.Description = "This character has successfully found an opening in %their% target\'s armor and can quickly deliver several deadly stabs.";
		this.m.Icon = "ui/perks/ptr_swift_stabs.png";
		this.m.IconMini = "ptr_swift_stabs_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.IsSpent;
	}

	function isEnabled()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Dagger, true))
		{
			return true;
		}

		return false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/action_points.png",
			text = "The Action Point costs of Dagger attacks are reduced"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "Will expire upon missing an attack, using any non-attack skill, swapping your weapon, or waiting or ending your turn"
		});

		return tooltip;
	}

	function onAfterUpdate(_properties)
	{
		if (!this.m.IsSpent && this.isEnabled())
		{
			local skills = this.getContainer().getActor().getMainhandItem().getSkills();
			foreach (skill in skills)
			{
				if (skill.isAttack() && !skill.isRanged())
				{
					skill.m.ActionPointCost = this.Math.max(2, skill.m.ActionPointCost - 2);
				}
			}
		}		
	}

	function onPayForItemAction( _skill, _items )
	{
		this.m.IsSpent = true;
	}

	function onTurnEnd()
	{
		this.m.IsSpent = true;
	}

	function onWaitTurn()
	{
		this.m.IsSpent = true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity.isAlive() && !_targetEntity.isDying() && this.isEnabled() && _skill.isAttack() && _skill.m.IsWeaponSkill)
		{
			this.m.IsSpent = false;
		}
		else
		{
			this.m.IsSpent = true;
		}
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		this.m.IsSpent = true;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (!this.isEnabled() || !_skill.isAttack() || !_skill.m.IsWeaponSkill)
		{
			this.m.IsSpent = true;
		}
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.IsSpent = true;
	}
});
