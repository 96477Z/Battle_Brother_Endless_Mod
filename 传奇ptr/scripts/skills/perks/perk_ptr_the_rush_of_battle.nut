this.perk_ptr_the_rush_of_battle <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 0,
		BonusPerStack = 5,
		BonusMax = 25
	},
	function create()
	{
		this.m.ID = "perk.ptr_the_rush_of_battle";
		this.m.Name = this.Const.Strings.PerkName.PTRTheRushOfBattle;
		this.m.Description = "%name% is in the thick of battle, with %their% heart beating faster, pumping fresh blood through %their% veins.";
		this.m.Icon = "ui/perks/ptr_the_rush_of_battle.png";
		this.m.IconMini = "ptr_the_rush_of_battle_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getName()
	{
		return this.m.Stacks > 1 ? this.m.Name + " (x" + this.m.Stacks + ")" : this.m.Name;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		local bonus = this.getBonus();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/initiative.png",
			text = "Skills build up [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Initiative"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "Skills build up [color=" + this.Const.UI.Color.PositiveValue + "]-" + bonus + "%[/color] Fatigue"
		});

		return tooltip;
	}

	function isHidden()
	{
		return this.m.Stacks == 0;
	}

	function onMissed( _attacker, _skill )
	{
		if (_attacker == null || !_skill.isAttack())
		{
			return;
		}

		this.m.Stacks++;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker == null || _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack())
		{
			return;
		}

		this.m.Stacks++;
	}

	function getBonus()
	{
		return this.Math.min(this.m.BonusMax, this.m.Stacks * this.m.BonusPerStack);
	}

	function onUpdate( _properties )
	{
		if (this.m.Stacks > 0)
		{
			local bonus = this.getBonus();
			_properties.Initiative += bonus;
			_properties.FatigueEffectMult *= 1.0 - bonus * 0.01;
		}
	}

	function onTurnEnd()
	{
		this.m.Stacks = 0;
	}

	function onCombatStarted()
	{
		this.m.Stacks = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.Stacks = 0;
	}
});
