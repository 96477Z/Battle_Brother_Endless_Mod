this.perk_ptr_vengeful_spite <- this.inherit("scripts/skills/skill", {
	m = {
		Stacks = 0,
		BonusPerStack = 5
	},
	function create()
	{
		this.m.ID = "perk.ptr_vengeful_spite";
		this.m.Name = this.Const.Strings.PerkName.PTRVengefulSpite;
		this.m.Description = "This character does more damage as allies die next to %them%.";
		this.m.Icon = "ui/perks/ptr_vengeful_spite.png";
		this.m.IconMini = "ptr_vengeful_spite_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.Stacks == 0;
	}

	function getName()
	{
		return this.m.Stacks > 0 ? this.m.Name + " (x" + this.m.Stacks + ")" : this.m.Name;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.getBonus() + "[/color] Damage dealt"
		});

		return tooltip;
	}

	function onOtherActorDeath( _killer, _victim, _skill, _deathTile, _corpseTile, _fatalityType )
	{
		local actor = this.getContainer().getActor();
		if (_victim.getFaction() == actor.getFaction() && _deathTile.getDistanceTo(actor.getTile()) == 1)
		{
			this.m.Stacks++;
		}
	}

	function getBonus()
	{
		return this.m.Stacks * this.m.BonusPerStack;
	}

	function onUpdate( _properties )
	{
		_properties.DamageTotalMult *= 1.0 + this.getBonus() * 0.01;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.Stacks = 0;
	}
});
