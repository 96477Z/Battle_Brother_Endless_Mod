this.ptr_between_the_eyes_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.ptr_between_the_eyes";
		this.m.Name = "Between the Eyes";
		this.m.Icon = "skills/ptr_between_the_eyes_skill.png";
		this.m.IconDisabled = "skills/ptr_between_the_eyes_skill_bw.png";
		this.m.Overlay = "ptr_between_the_eyes_skill";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 1;
		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getDescription()
	{
		return "Prepare to land your next attack right between your target\'s eyes.";
	}

	function getTooltip()
	{
		local ret = this.skill.getDefaultUtilityTooltip();

		return ret;
	}

	function isUsable()
	{
		local headHunter = this.getContainer().getSkillByID("perk.head_hunter");
		if (headHunter != null && !headHunter.isHidden())
		{	
			return false;
		}

		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.ptr_between_the_eyes_attack");
	}

	function isHidden()
	{
		return !this.getContainer().getActor().isArmedWithMeleeWeapon();
	}

	function onUse( _user, _targetTile )
	{
		this.m.Container.add(this.new("scripts/skills/effects/ptr_between_the_eyes_attack_effect"));
		return true;
	}
});
