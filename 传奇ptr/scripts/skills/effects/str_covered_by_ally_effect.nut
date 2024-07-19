this.str_covered_by_ally_effect <- this.inherit("scripts/skills/skill", {
	m = {
		CoverProvider = null,
		IsAlive = true,
		MoveInCoverSkill = null
	},
	function setCoverProvider( _p )
	{
		if (typeof _p == "instance")
		{
			this.m.CoverProvider = _p;
		}
		else
		{
			this.m.CoverProvider = this.WeakTableRef(_p);
		}
	}

	function create()
	{
		this.m.ID = "effects.str_covered_by_ally";
		this.m.Name = "Covered by Ally";
		this.m.Description = "This character has received temporary cover from a shield-wielding ally, gaining protection from attacks of opportunity.";
		this.m.Icon = "skills/ptr_covered_by_ally_effect.png";
		this.m.IconMini = "ptr_covered_by_ally_effect_mini";
		this.m.Overlay = "ptr_covered_by_ally_effect";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function isEnabled()
	{
		if (this.m.CoverProvider == null || this.m.CoverProvider.isNull() || !this.m.CoverProvider.isPlacedOnMap() || this.m.CoverProvider.getFlags().get("Devoured") == true)
		{
			return false;
		}

		local actor = this.getContainer().getActor();
		if (actor.m.IsMoving || !actor.isPlacedOnMap() || actor.getFlags().get("Devoured") == true)
		{
			return false;			
		}

		if (actor.getTile().getDistanceTo(this.m.CoverProvider.getTile()) > 1)
		{
			return false;
		}

		return true;
	}

	function onUpdate( _properties )
	{
		if (!this.isEnabled())
		{
			this.onRemoved();
			this.removeSelf();			
			return;
		}

		_properties.InitiativeForTurnOrderAdditional += 5000;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		local skill = this.new("scripts/skills/actives/str_move_under_cover_skill");
		this.m.MoveInCoverSkill = skill;
		this.getContainer().add(skill);
	}

	function onTurnEnd()
	{
		this.removeSelf();		
	}

	function onRemoved()
	{
		if (this.m.CoverProvider != null && !this.m.CoverProvider.isNull() && this.m.CoverProvider.isAlive())
		{
			local skill = this.m.CoverProvider.getSkills().getSkillByID("effects.str_covering_ally");

			if (skill != null)
			{
				skill.setAlly(null);
				this.m.CoverProvider.getSkills().remove(skill);
			}
		}

		if (this.m.MoveInCoverSkill != null && !this.m.MoveInCoverSkill.isGarbage())
		{
			this.m.MoveInCoverSkill.removeSelf();
		}
	}

	function onDeath( _fatalityType )
	{
		this.onRemoved();
	}
});
