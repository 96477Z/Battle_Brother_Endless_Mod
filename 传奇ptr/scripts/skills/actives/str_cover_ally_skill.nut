this.str_cover_ally_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.str_cover_ally";
		this.m.Name = "Cover Ally";
		this.m.Description = "Cover an adjacent ally, allowing them to move one tile ignoring zone of control on their turn. Your Melee Skill, Melee Defense, Ranged Skill, and Ranged Defense will be reduced while providing cover, and if you get stunned or rooted or are no longer adjacent to the target, the cover will be lost.";
		this.m.Icon = "skills/ptr_cover_ally_skill.png";
		this.m.IconDisabled = "skills/ptr_cover_ally_skill_bw.png";
		this.m.Overlay = "ptr_cover_ally_skill";
		this.m.SoundOnHit = [
			"sounds/combat/shieldwall_01.wav",
			"sounds/combat/shieldwall_02.wav",
			"sounds/combat/shieldwall_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.skill.getDefaultUtilityTooltip();

		ret.extend([
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Allows the target to move 1 tile ignoring zone of control on their turn"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "In the next round the target\'s turn order is calculated with [color=" + this.Const.UI.Color.NegativeValue + "]+25[/color] Initiative"
			},
		]);

		local actor = this.getContainer().getActor();
		if (!actor.isArmedWithShield())
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires a shield[/color]"
			});
		}

		if (!actor.getCurrentProperties().IsRooted || actor.getCurrentProperties().IsStunned)
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "Cannot be used while Rooted or Stunned"
			});
		}

		if (this.getContainer().hasSkill("effects.str_covering_ally"))
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot be used when already providing cover to an ally[/color]"
			});
		}

		return ret;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (actor.isPlayerControlled())
		{
			return;
		}

		local agent = actor.getAIAgent();

		if (agent.findBehavior(this.Const.AI.Behavior.ID.STRCoverAlly) == null)
		{
			agent.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_str_cover_ally"));
			agent.finalizeBehaviors();
		}
	}

	function isUsable()
	{
		local actor = this.getContainer().getActor();
		if (!this.Tactical.isActive() || !actor.isArmedWithShield() || actor.getCurrentProperties().IsRooted || actor.getCurrentProperties().IsStunned)
		{
			return false;
		}

		local off = actor.getOffhandItem();

		if (off == null || off.getID().find("buckler") != null || off.getID().find("parrying_dagger") != null)
		{
			return false;
		}

		return this.skill.isUsable() && !this.getContainer().hasSkill("effects.str_covering_ally") && ::Tactical.Entities.getAlliedActors(actor.getFaction(), actor.getTile(), 1).len() > 1;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (target.getSkills().hasSkill("effects.str_covered_by_ally") || target.getSkills().hasSkill("effects.str_covering_ally") || target.getSkills().hasSkill("effects.stunned") || target.getSkills().hasSkill("effects.horrified"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " provides cover to " + this.Const.UI.getColorizedEntityName(target));

			if (this.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill * 1.2, _user.getPos());
			}
		}

		local coveredByAllyEffect = this.new("scripts/skills/effects/str_covered_by_ally_effect");
		coveredByAllyEffect.setCoverProvider(_user);
		target.getSkills().add(coveredByAllyEffect);

		local coveringAllyEffect = this.new("scripts/skills/effects/str_covering_ally_effect");
		coveringAllyEffect.setAlly(target);
		_user.getSkills().add(coveringAllyEffect);

		return true;
	}
});
