this.perk_ptr_family_ties <- this.inherit("scripts/skills/skill", {
	m = {
		MinBoost = 1,
		MaxBoost = 2,
		BonusPerLevel = 0.25,
		IsSpent = false,
	},
	function create()
	{
		this.m.ID = "perk.ptr_family_ties";
		this.m.Name = this.Const.Strings.PerkName.PTRFamilyTies;
		this.m.Description = "This character is of noble birth and has connections far and wide.";
		this.m.Icon = "ui/perks/ptr_family_ties.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.IsSpent || this.getContainer().getActor().isPlacedOnMap();
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Will improve relations with the noble faction of the next City, Fortress, or Citadel visited today"
		});

		return tooltip;
	}

	function getBonus()
	{
		local levelBonus = (this.getContainer().getActor().getLevel() - 1) * this.m.BonusPerLevel;
		return this.Math.rand(this.m.MinBoost + levelBonus, this.m.MaxBoost + levelBonus);
	}

	function improveRelations( _settlement )
	{
		if (this.m.IsSpent || !this.isSettlementValid(_settlement))
		{
			return;
		}

		this.logInfo("Settlement owner " + _settlement.getOwner().getName());

		this.m.IsSpent = true;		
		_settlement.getOwner().addPlayerRelation(this.getBonus(), this.getContainer().getActor().getNameOnly() + "\'s family ties");
	}

	function isSettlementValid( _settlement )
	{
		if (!this.World.getTime().IsDaytime)
		{
			return false;
		}

		if (_settlement.isMilitary())
		{
			return _settlement.getSize() >= 2;
		}
		else
		{
			return _settlement.getSize() > 2;
		}
		
		return false;
	}

	function onNewMorning()
	{
		this.m.IsSpent = false;
	}
});
