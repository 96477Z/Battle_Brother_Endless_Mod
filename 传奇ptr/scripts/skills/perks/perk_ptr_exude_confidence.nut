this.perk_ptr_exude_confidence <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_exude_confidence";
		this.m.Name = this.Const.Strings.PerkName.PTRExudeConfidence;
		this.m.Description = this.Const.Strings.PerkDescription.PTRExudeConfidence;
		this.m.Icon = "ui/perks/ptr_exude_confidence.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || actor.getMoraleState() == this.Const.MoraleState.Fleeing || actor.getMoraleState() == this.Const.MoraleState.Ignore)
		{
			return;
		}

		local allies = ::Tactical.Entities.getAlliedActors(actor.getFaction(), actor.getTile(), 1);
		foreach (ally in allies)
		{
			if (ally.getMoraleState() < actor.getMoraleState() && ally.getID() != actor.getID())
			{
				ally.setMoraleState(this.Math.min(this.Const.MoraleState.Confident, ally.getMoraleState() + 1));
				this.spawnIcon("perk_ptr_exude_confidence", ally.getTile());
			}
		}
	}
});
