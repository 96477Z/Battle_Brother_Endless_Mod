this.perk_ptr_know_their_weakness <- this.inherit("scripts/skills/skill", {
	m = {
		MeleeStacks = 0,
		RangedStacks = 0,
		BonusMeleePerStack = 10,
		BonusRangedPerStack = 5,
		BonusMax = 30
	},
	function create()
	{
		this.m.ID = "perk.ptr_know_their_weakness";
		this.m.Name = "Knows their Weakness";
		this.m.Description = "With each enemy felled, this character finds it easier to kill those who remain.";
		this.m.Icon = "ui/perks/ptr_know_their_weakness.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getMeleeBonus() + "%[/color] Melee Skill"
		});

		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getRangedBonus() + "%[/color] Ranged Skill"
		});

		return tooltip;
	}

	function isHidden()
	{
		return this.m.MeleeStacks == 0 && this.m.RangedStacks == 0;
	}

	function getMeleeBonus()
	{
		return this.Math.min(this.m.BonusMax, this.m.MeleeStacks * this.m.BonusMeleePerStack);
	}

	function getRangedBonus()
	{
		return this.Math.min(this.m.BonusMax, this.m.RangedStacks * this.m.BonusRangedPerStack);
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		if (!_skill.isAttack())
		{
			return;
		}

		this.m.MeleeStacks = this.Math.min(this.m.BonusMax / this.m.BonusMeleePerStack, this.m.MeleeStacks + 1);
		this.m.RangedStacks = this.Math.min(this.m.BonusMax / this.m.BonusRangedPerStack, this.m.RangedStacks + 1);
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker == null || _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack())
		{
			return;
		}

		this.m.MeleeStacks = this.Math.max(0, this.m.MeleeStacks - 1);
		this.m.RangedStacks = this.Math.max(0, this.m.RangedStacks - 1);
	}

	function onUpdate( _properties )
	{
		_properties.MeleeSkillMult *= 1.0 + (this.getMeleeBonus() * 0.01);
		_properties.RangedSkillMult *= 1.0 + (this.getRangedBonus() * 0.01);
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.MeleeStacks = 0;
		this.m.RangedStacks = 0;
	}
});
