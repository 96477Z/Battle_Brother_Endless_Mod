this.perk_ptr_hip_shooter <- this.inherit("scripts/skills/skill", {
	m = {
		Count = 0,
		FatigueCostIncreasePerCount = 10
	},
	function create()
	{
		this.m.ID = "perk.ptr_hip_shooter";
		this.m.Name = this.Const.Strings.PerkName.PTRHipShooter;
		this.m.Description = this.Const.Strings.PerkDescription.PTRHipShooter;
		this.m.Icon = "ui/perks/ptr_hip_shooter.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if (_skill.getID() == "actives.quick_shot")
		{
			this.m.Count++;
		}
	}

	function onAfterUpdate(_properties)
	{
		local quickShot = this.getContainer().getSkillByID("actives.quick_shot");
		if (quickShot != null)
		{
			quickShot.m.ActionPointCost -= 1;
			quickShot.m.FatigueCostMult *= 1.0 + (this.m.FatigueCostIncreasePerCount * 0.01 * this.m.Count);
		}
	}

	function onTurnEnd()
	{
		this.m.Count = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.Count = 0;
	}
});
