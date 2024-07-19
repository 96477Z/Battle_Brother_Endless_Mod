this.ptr_arrow_to_the_knee_attack_effect <- this.inherit("scripts/skills/skill", {
	m = {
		AIForcedTarget = null,
		AIForcedSkill = null
	},
	function create()
	{
		this.m.ID = "effects.ptr_arrow_to_the_knee_attack";
		this.m.Name = "Arrow to the Knee";
		this.m.Description = "This character is aiming %their% ranged attacks at %their% targets\' knees, attempting to reduce their defenses and mobility.";
		this.m.Icon = "ui/perks/ptr_arrow_to_the_knee.png";
		//this.m.IconMini = "ptr_arrow_to_the_knee_attack_effect_mini";
		this.m.SoundOnHit = [
			"sounds/combat/cleave_hit_hitpoints_01.wav",
			"sounds/combat/cleave_hit_hitpoints_02.wav",
			"sounds/combat/cleave_hit_hitpoints_03.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function isHidden()
	{
		return this.isGarbage();
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
				icon = "ui/icons/damage_dealt.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]50%[/color] reduced Ranged Damage"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Ranged Skill"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.NegativeValue + "]0%[/color] chance to hit the head"
			},					
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Target will have [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Melee and Ranged defense for 1 turn and [color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] in the turn after that"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Target will require [color=" + this.Const.UI.Color.NegativeValue + "]2[/color] additional Action Points per tile moved for 1 turn and [color=" + this.Const.UI.Color.NegativeValue + "]1[/color] in the turn after that"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.RangedDamageMult *= 0.5;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack() && _skill.isRanged())
		{			
			_properties.RangedSkill -= 10;		
			_properties.HitChanceMult[this.Const.BodyPart.Head] = 0.0;
			_properties.HitChanceMult[this.Const.BodyPart.Body] = 1.0;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!this.isGarbage() && _skill.isAttack() && _targetEntity.isAlive() && !_targetEntity.isDying())
		{
			local user = this.getContainer().getActor();

			if (this.m.SoundOnHit.len() > 0)
			{
				this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _targetEntity.getPos());
			}

			local effect = this.new("scripts/skills/effects/ptr_arrow_to_the_knee_debuff_effect");
			_targetEntity.getSkills().add(effect);
		}
	}

	function onTurnEnd()
	{
		this.removeSelf();
	}
});
