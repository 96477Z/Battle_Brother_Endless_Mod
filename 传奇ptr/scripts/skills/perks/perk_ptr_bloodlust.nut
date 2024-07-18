this.perk_ptr_bloodlust <- this.inherit("scripts/skills/skill", {
	m = {
		BleedStacksBeforeAttack = 0,
		FatigueRecoveryStacks = 0,		
		FatigueReductionPercentage = 5
	},
	function create()
	{
		this.m.ID = "perk.ptr_bloodlust";
		this.m.Name = this.Const.Strings.PerkName.PTRBloodlust;
		this.m.Description = "This character gains increased vigor when next to bleeding enemies.";
		this.m.Icon = "ui/perks/ptr_bloodlust.png";
		this.m.IconMini = "ptr_bloodlust_mini";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.FatigueRecoveryStacks == 0;
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
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.FatigueRecoveryStacks + "[/color] Fatigue Recovery on the next turn"
			},
		];
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (!_skill.isAttack() || _skill.isRanged() || _targetEntity == null)
		{
			return;
		}

		this.m.BleedStacksBeforeAttack = _targetEntity.getSkills().getAllSkillsByID("effects.bleeding").len();
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (!_skill.isAttack() || _skill.isRanged() || _targetEntity == null)
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != actor.getID())
		{
			return;
		}

		if (_targetEntity.getID() == actor.getID() || _targetEntity.isAlliedWith(actor))
		{
			return;
		}

		local bleedCount = 0;

		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			bleedCount = this.m.BleedStacksBeforeAttack + 1;			
		}
		else
		{
			bleedCount = _targetEntity.getSkills().getAllSkillsByID("effects.bleeding").len();			
		}

		this.m.FatigueRecoveryStacks += bleedCount;

		actor.setFatigue(this.Math.max(0, actor.getFatigue() - actor.getFatigue() * (bleedCount * this.m.FatigueReductionPercentage * 0.01)));
	}

	function onUpdate( _properties )
	{
		_properties.FatigueRecoveryRate += this.m.FatigueRecoveryStacks;
	}

	function onTurnStart()
	{
		this.m.FatigueRecoveryStacks = 0;
	}

	function onCombatFinished()
	{
		this.m.FatigueRecoveryStacks = 0;
	}

	function onCombatStarted()
	{
		this.m.FatigueRecoveryStacks = 0;
	}
});
