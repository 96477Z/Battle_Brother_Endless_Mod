local gt = this.getroottable();

local modID = "mod_legends_STR";
::mods_registerMod(modID, 1.0, "Shield Tree Rework 1.0.0");

::mods_queue(modID, "mod_legends, mod_msu", function()
{
	gt.Const.Strings.PerkName.STRPhalanx <- "Phalanx";
	gt.Const.Strings.PerkDescription.STRPhalanx <- "[color=" + this.Const.UI.Color.NegativeValue + "]Requires: Shield[/color]\n\n[color=" + this.Const.UI.Color.Passive + "][u]Passive:[/u][/color]\n• When engaged in melee and equipped with a shield, gain [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee Defense per adjacent ally holding a shield who is also engaged in melee.\n• When holding a shield and spear, additionally gain [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Melee Skill per adjacent ally holding a shield who is also engaged in melee.\n\n[color=#0b0084]From the Shield perk group[/color]";
	gt.Const.Strings.PerkName.STRLineBreaker <- "Line Breaker";
	gt.Const.Strings.PerkDescription.STRLineBreaker <- "[color=" + this.Const.UI.Color.NegativeValue + "]Requires: Shield[/color]\n\n[color=" + this.Const.UI.Color.Active + "][u]Active:[/u][/color]\n• Costs 4 AP and builds 25 Fatigue.\n• Allows you to knock back an enemy and take their place, all in one action.\n\n[color=#0b0084]From the Shield perk group[/color]";
	gt.Const.Strings.PerkName.STRCoverAlly <- "Cover Ally";
	gt.Const.Strings.PerkDescription.STRCoverAlly <- "[color=" + this.Const.UI.Color.NegativeValue + "]Requires: Shield[/color]\n\n[color=" + this.Const.UI.Color.Active + "][u]Active:[/u][/color]\n• Costs 4 AP and builds 20 Fatigue.\n• Allows you to target an adjacent ally to allow them to move [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] tile ignoring Zone of Control on their turn.\n• While under cover, the target ally\'s position in the turn order in the next round is determined as if they had [color=" + this.Const.UI.Color.PositiveValue + "]+5000[/color] Initiative.\n• The effect only remains active as long as you are adjacent to that ally.\n\n[color=#0b0084]From the Shield perk group[/color]";
	
	local perks = [
		{
			ID = "perk.str_line_breaker",
			Script = "scripts/skills/perks/perk_str_line_breaker",
			Name = this.Const.Strings.PerkName.STRLineBreaker,
			Tooltip = this.Const.Strings.PerkDescription.STRLineBreaker,
			Icon = "ui/perks/ptr_line_breaker.png",
			IconDisabled = "ui/perks/ptr_line_breaker_bw.png",
			Const = "STRLineBreaker"
		},
		{
			ID = "perk.str_cover_ally",
			Script = "scripts/skills/perks/perk_str_cover_ally",
			Name = this.Const.Strings.PerkName.STRCoverAlly,
			Tooltip = this.Const.Strings.PerkDescription.STRCoverAlly,
			Icon = "ui/perks/ptr_cover_ally.png",
			IconDisabled = "ui/perks/ptr_cover_ally_bw.png",
			Const = "STRCoverAlly"
		},
		{
			ID = "perk.str_phalanx",
			Script = "scripts/skills/perks/perk_str_phalanx",
			Name = this.Const.Strings.PerkName.STRPhalanx,
			Tooltip = this.Const.Strings.PerkDescription.STRPhalanx,
			Icon = "ui/perks/ptr_phalanx.png",
			IconDisabled = "ui/perks/ptr_phalanx_bw.png",
			Const = "STRPhalanx"
		},
		{
			ID = "perk.str_dummy1",
			Script = "scripts/skills/perks/perk_str_phalanx",
			Name = this.Const.Strings.PerkName.STRPhalanx,
			Tooltip = this.Const.Strings.PerkDescription.STRPhalanx,
			Icon = "ui/perks/ptr_phalanx.png",
			IconDisabled = "ui/perks/ptr_phalanx_bw.png",
			Const = "STRDummy1"
		},
		{
			ID = "perk.str_dummy2",
			Script = "scripts/skills/perks/perk_str_phalanx",
			Name = this.Const.Strings.PerkName.STRPhalanx,
			Tooltip = this.Const.Strings.PerkDescription.STRPhalanx,
			Icon = "ui/perks/ptr_phalanx.png",
			IconDisabled = "ui/perks/ptr_phalanx_bw.png",
			Const = "STRDummy2"
		},
		{
			ID = "perk.str_dummy3",
			Script = "scripts/skills/perks/perk_str_phalanx",
			Name = this.Const.Strings.PerkName.STRPhalanx,
			Tooltip = this.Const.Strings.PerkDescription.STRPhalanx,
			Icon = "ui/perks/ptr_phalanx.png",
			IconDisabled = "ui/perks/ptr_phalanx_bw.png",
			Const = "STRDummy3"
		},
		{
			ID = "perk.str_dummy4",
			Script = "scripts/skills/perks/perk_str_phalanx",
			Name = this.Const.Strings.PerkName.STRPhalanx,
			Tooltip = this.Const.Strings.PerkDescription.STRPhalanx,
			Icon = "ui/perks/ptr_phalanx.png",
			IconDisabled = "ui/perks/ptr_phalanx_bw.png",
			Const = "STRDummy4"
		}		
	];
	
	this.Const.Perks.addPerkDefObjects(perks);
	
	::mods_hookNewObject("ai/tactical/behaviors/ai_disengage", function (o)	{
		o.m.PossibleSkills.push("actives.str_move_under_cover");
	});

	::mods_hookNewObject("ai/tactical/behaviors/ai_ptr_kata_step", function (o)	{
		o.m.PossibleSkills.push("actives.str_move_under_cover");
	});
});
