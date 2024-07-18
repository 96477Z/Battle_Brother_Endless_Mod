this.perk_ptr_family_pride <- this.inherit("scripts/skills/skill", {
	m = {
		RoundsThreshold = 5	
	},
	function create()
	{
		this.m.ID = "perk.ptr_family_pride";
		this.m.Name = this.Const.Strings.PerkName.PTRFamilyPride;
		this.m.Description = "This character is keen to prove that %their% family is the greatest of all.";
		this.m.Icon = "ui/perks/ptr_family_pride.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return !this.getContainer().getActor().isPlacedOnMap();
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
			
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Morale checks cannot drop this character\'s morale below [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Const.MoraleStateName[this.getMinMoraleState()] + "[/color]"
		});

		return tooltip;
	}

	function onAdded()
	{
		this.getContainer().removeByID("trait.insecure");
		this.getContainer().removeByID("trait.dastard");
	}

	function onCombatStarted()
	{
		this.getContainer().getActor().setMoraleState(this.Const.MoraleState.Confident);
	}

	function getMinMoraleState()
	{
		if (this.getContainer().hasSkill("trait.determined"))
		{
			return this.Const.MoraleState.Confident;
		}

		return this.Time.getRound() > this.m.RoundsThreshold ? this.Const.MoraleState.Steady : this.Const.MoraleState.Confident;
	}
});
