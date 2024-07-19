this.ptr_between_the_eyes_attack_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 0
	},
	function create()
	{
		this.m.ID = "effects.ptr_between_the_eyes_attack";
		this.m.Name = "Between the Eyes";
		this.m.Description = "This character is aiming %their% next Melee attack to hit right between %their% target\'s eyes.";
		this.m.Icon = "ui/perks/ptr_between_the_eyes.png";
		this.m.IconMini = "ptr_between_the_eyes_attack_effect_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
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
				id = 10,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.Bonus + "%[/color] chance to hit the head."
			}
		];
	}

	function setBonus(_properties)
	{
		this.m.Bonus = this.Math.floor(_properties.getMeleeSkill() * 0.5);
	}

	function onUpdate( _properties )
	{
		this.setBonus(_properties);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.isGarbage() || !_skill.isAttack() || _skill.isRanged())
		{
			return;
		}

		this.setBonus(_properties);
		_properties.HitChance[this.Const.BodyPart.Head] += this.m.Bonus;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.removeSelf();
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		this.removeSelf();
	}
});
