this.ptr_blitzkrieg_skill <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false	
	},
	function create()
	{
		this.m.ID = "actives.ptr_blitzkrieg";
		this.m.Name = "Blitzkrieg";
		this.m.Description = "Order your mercenaries to attack as fast as possible!"
		this.m.Icon = "skills/ptr_blitzkrieg_skill.png";
		this.m.IconDisabled = "skills/ptr_blitzkrieg_skill_bw.png";
		this.m.Overlay = "ptr_blitzkrieg_skill";
		this.m.SoundOnUse = [
			"sounds/combat/legends_blitzkrieg_skill_1.wav",
			"sounds/combat/legends_blitzkrieg_skill_2.wav"
			"sounds/combat/legends_blitzkrieg_skill_3.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();

		tooltip.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Every ally within [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] tiles who has at least [color=" + this.Const.UI.Color.NegativeValue + "]10[/color] Fatigue remaining and is not Stunned or Fleeing will get the Adrenaline effect and build [color=" + this.Const.UI.Color.NegativeValue + "]10[/color] Fatigue"
		});

		if (this.m.IsSpent)
		{
			tooltip.push({
				id = 7,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot be used more than once per day (company-wide)[/color]"
			});
		}
		

		return tooltip;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		local agent = actor.getAIAgent();

		if (agent.findBehavior(this.Const.AI.Behavior.ID.PTRBlitzkrieg) == null)
		{
			agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_ptr_blitzkrieg"));
			agent.finalizeBehaviors();
		}
	}

	function isUsable()
	{
		return !this.m.IsSpent && this.skill.isUsable();
	}

	function onUse( _user, _targetTile )
	{
		this.m.IsSpent = true;

		if (_user.isPlayerControlled())
		{
			local rosterBros = this.World.getPlayerRoster().getAll();
			foreach (bro in rosterBros)
			{
				local skill = bro.getSkills().getSkillByID("actives.ptr_blitzkrieg");
				if (skill != null) skill.m.IsSpent = true;
			}
		}

		local bros = clone this.Tactical.Entities.getInstancesOfFaction(_user.getFaction());

		local sortByInitiative = function( _bro1, _bro2 )
		{
			local ini1 = _bro1.getInitiative();
			local ini2 = _bro2.getInitiative();

			if (ini1 > ini2) return -1;
			if (ini1 < ini2) return 1;
			return 0;
		}

		bros.sort(sortByInitiative);

		local myTile = _user.getTile();

		foreach (bro in bros)
		{
			if (bro.getMoraleState() == this.Const.MoraleState.Fleeing || bro.getCurrentProperties().IsStunned)
			{
				continue;
			}

			if (bro.getID() == _user.getID())
			{
				this.getContainer().add(this.new("scripts/skills/effects/adrenaline_effect"));
			}			
			else 
			{
				local skill = bro.getSkills().getSkillByID("actives.ptr_blitzkrieg");
				if (skill != null) skill.m.IsSpent = true;
			
				if (bro.getTile().getDistanceTo(myTile) <= 4 && bro.getFatigueMax() - bro.getFatigue() >= 10)
				{
					bro.setFatigue(bro.getFatigue() + 10);
					local effect = this.new("scripts/skills/effects/adrenaline_effect");				
					if (!bro.isTurnStarted() && !bro.isTurnDone())
					{
						effect.m.TurnsLeft++;
					}
					bro.getSkills().add(effect);
				}
			}
		}
	}

	function onNewMorning()
	{
		this.m.IsSpent = false;
	}
});
