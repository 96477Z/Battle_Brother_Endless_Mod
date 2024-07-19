this.perk_ptr_survival_instinct <- this.inherit("scripts/skills/skill", {
	m = {
		MissStacks = 0,
		HitStacks = 0,
		BonusPerMiss = 2,
		BonusPerHit = 5
	},
	function create()
	{
		this.m.ID = "perk.ptr_survival_instinct";
		this.m.Name = this.Const.Strings.PerkName.PTRSurvivalInstinct;
		this.m.Description = "This character\'s senses are heightened when faced with mortal danger.";
		this.m.Icon = "ui/perks/ptr_survival_instinct.png";
		this.m.IconMini = "ptr_survival_instinct_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function getName()
	{
		local name = this.m.Name;

		if (this.m.HitStacks > 0)
		{
			name += " (x" + this.m.HitStacks + " hits)"
		}

		if (this.m.MissStacks > 0)
		{
			name += " (x" + this.m.MissStacks + " misses)"
		}

		return name;
	}

	function isHidden()
	{
		return this.m.HitStacks	== 0 && this.m.MissStacks == 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		local bonus = this.getBonus();

		tooltip.extend(
			[
				{
					id = 10,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Defense"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Ranged Defense"
				}
			]
		);

		return tooltip;
	}

	function getBonus()
	{
		return (this.m.MissStacks * this.m.BonusPerMiss) + (this.m.HitStacks * this.m.BonusPerHit);
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill == null || !_skill.isAttack() || _attacker == null || _attacker.getID() == this.getContainer().getActor().getID())
		{
			return;
		}

		this.m.HitStacks += 1;
	}

	function onMissed( _attacker, _skill )
	{
		if (_skill == null || !_skill.isAttack() || _attacker == null || _attacker.getID() == this.getContainer().getActor().getID())
		{
			return;
		}

		this.m.MissStacks += 1;
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBonus();
		_properties.MeleeDefense += bonus;
		_properties.RangedDefense += bonus;
	}

	function onTurnStart()
	{
		this.m.MissStacks = 0;

		if (this.m.HitStacks > 2)
		{
			this.m.HitStacks = 2;
		}
	}

	function onCombatStarted()
	{
		this.m.MissStacks = 0;
		this.m.HitStacks = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.MissStacks = 0;
		this.m.HitStacks = 0;
	}
});
