this.perk_ptr_paint_a_smile <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ptr_paint_a_smile";
		this.m.Name = this.Const.Strings.PerkName.PTRPaintASmile;
		this.m.Description = this.Const.Strings.PerkDescription.PTRPaintASmile;
		this.m.Icon = "ui/perks/ptr_paint_a_smile.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onNewDay()
	{
		local bro = this.getBro();
		if (bro != null)
		{
			bro.improveMood(1.0, "Entertained by " + this.getContainer().getActor().getName());
		}
	}

	function getBro()
	{
		local roster = this.World.getPlayerRoster().getAll();

		local saddestBro = null;
		local mood = 999999;

		foreach (bro in roster)
		{
			if (bro.getID() == this.getContainer().getActor().getID())
			{
				continue;
			}

			if (bro.getMood() < mood)
			{
				mood = bro.getMood();
				saddestBro = bro;
			}
		}

		return saddestBro;
	}
});
