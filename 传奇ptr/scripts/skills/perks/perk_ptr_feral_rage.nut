this.perk_ptr_feral_rage <- this.inherit("scripts/skills/skill", {
	m = {
		RageStacks = 0,
		LastRageSoundTime = 0
	},
	function create()
	{
		this.m.ID = "perk.ptr_feral_rage";
		this.m.Name = this.Const.Strings.PerkName.PTRFeralRage;
		this.m.Description = "The smell of blood and death sends you into an uncontrollable rage. Every taste of blood your weapon takes, every kill you make, and every hit you receive emboldens you and increases your lethality. Once in a rage, you must continuously feed it to keep it going.";
		this.m.Icon = "ui/perks/ptr_feral_rage.png";
		this.m.IconMini = "ptr_feral_rage_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.SoundOnUse = [
			"sounds/enemies/orc_rage_01.wav",
			"sounds/enemies/orc_rage_02.wav",
			"sounds/enemies/orc_rage_03.wav",
			"sounds/enemies/orc_rage_04.wav",
			"sounds/enemies/orc_rage_05.wav",
			"sounds/enemies/orc_rage_06.wav"
		];
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.RageStacks == 0;
	}

	function getName()
	{
		return this.m.RageStacks > 1 ? this.m.Name + " (x" + this.m.RageStacks + ")" : this.m.Name;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.extend([
			{
				id = 10,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.RageStacks + "[/color] Damage"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "Only receive [color=" + this.Const.UI.Color.PositiveValue + "]" + (100 - this.Math.min(70, 2 * this.m.RageStacks)) + "%[/color] of incoming damage"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.RageStacks + "[/color] Resolve"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.RageStacks + "[/color] Initiative"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-" + this.m.RageStacks + "[/color] Melee Defense"
			}
		]);

		return tooltip;
	}

	function addRage( _r )
	{
		this.m.RageStacks += _r;
		local actor = this.getContainer().getActor();

		if (!actor.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0 && this.Time.getVirtualTimeF() - this.m.LastRageSoundTime > 5.0)
			{
				this.m.LastRageSoundTime = this.Time.getVirtualTimeF();
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * (this.Math.rand(75, 100) * 0.01), actor.getPos(), this.Math.rand(75, 100) * 0.01);
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " gains rage!");
		}
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult *= this.Math.maxf(0.3, 1.0 - 0.02 * this.m.RageStacks);		
		_properties.Bravery += this.m.RageStacks;		
		_properties.Initiative += this.m.RageStacks;
		_properties.MeleeDefense -= this.m.RageStacks;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isRanged())
		{
			_properties.DamageRegularMin += this.m.RageStacks;
			_properties.DamageRegularMax += this.m.RageStacks;
		}
	}

	function onTurnStart()
	{
		this.m.RageStacks = this.Math.max(0, this.m.RageStacks - 2);
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		this.addRage(1);
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_skill.isRanged() && _targetEntity.isAlive() && !_targetEntity.isDying() && _targetEntity.getTile().getDistanceTo(this.getContainer().getActor().getTile()) == 1)
		{
			local rage = _skill.b.ActionPointCost > 4 ? 2 : 1;
			this.addRage(rage);
		}
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		if (!_skill.isRanged())
		{
			this.addRage(3);
		}
	}

	function onCombatFinished()
	{
		this.m.RageStacks = 0;
		this.m.LastRageSoundTime = 0;
		this.skill.onCombatFinished();
	}
});