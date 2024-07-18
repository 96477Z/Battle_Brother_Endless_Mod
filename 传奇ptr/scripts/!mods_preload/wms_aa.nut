local modID = "mod_WMS";
::mods_registerMod(modID, 1.4, "Weapon Mastery Standardization 1.4.6");

local gt = this.getroottable();

gt.Const.WMS <- {};

::mods_queue(modID, "mod_msu, >mod_legends", function() {
	gt.Const.WMS.Mastery <- {
		Axe = "Axe",
		Bow = "Bow",
		Cleaver = "Cleaver",
		Crossbow = "Crossbow",		
		Dagger = "Dagger",
		Firearm = "Firearm",
		Flail = "Flail",
		Mace = "Mace",
		Hammer = "Hammer",
		Polearm = "Polearm",
		Sling = "Sling",
		Spear = "Spear",
		Staff = "Staff",
		Sword = "Sword",
		Throwing = "Throwing"
	}

	gt.Const.WMS.addNewMastery <- function(_mastery, _categoriesString = "")
	{
		if (_mastery in gt.Const.WMS.Mastery)
		{
			this.logError("addNewMastery: \'" + _mastery + "\' already exists.");
			return;
		}

		if (_categoriesString = "")
		{
			_categoriesString = _mastery;
		}

		gt.Const.WMS.Mastery[_mastery] <- _categoriesString;
	}

	gt.Const.Strings.PerkDescription.SpecPolearm = this.MSU.String.replace(gt.Const.Strings.PerkDescription.SpecPolearm, "Polearm skills have their Action Point cost", "All skills with two-handed weapons, with a range of 2 tiles, having an Action Point cost of [color=" + this.Const.UI.Color.NegativeValue + "]6[/color] have their Action Point cost");	
	gt.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs.SpecPolearm].Tooltip = gt.Const.Strings.PerkDescription.SpecPolearm;

	gt.Const.WMS.modActor();
	gt.Const.WMS.modPerks();
	gt.Const.WMS.modWeapon();
	gt.Const.WMS.modWeapons();

	if ("LegendMod" in gt.Const)
	{
		gt.Const.Perks.SwordTree.Tree[3] = [gt.Const.Perks.PerkDefs.SpecSword];
		gt.Const.Perks.GreatSwordTree.Tree[3] = [gt.Const.Perks.PerkDefs.SpecSword];

		gt.Const.Strings.PerkName.LegendSpecGreatSword = "Sword Mastery";
		gt.Const.Strings.PerkDescription.LegendSpecGreatSword = "Master the art of fighting with a sword. Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color] less Fatigue.\n\nRiposte no longer has a penalty to hitchance.\n\nGash has a [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color] lower threshold to inflict injuries.\n\nSlash, Split, Swing, Overhead Strike and Great Slash gain [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] chance to hit.";
		this.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs.LegendSpecGreatSword].Name = gt.Const.Strings.PerkName.LegendSpecGreatSword;
		this.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs.LegendSpecGreatSword].Tooltip = gt.Const.Strings.PerkDescription.LegendSpecGreatSword;

		gt.Const.Strings.PerkName.SpecSword = "Sword Mastery";
		gt.Const.Strings.PerkDescription.SpecSword = "Master the art of fighting with a sword. Skills build up [color=" + this.Const.UI.Color.NegativeValue + "]25%[/color] less Fatigue.\n\nRiposte no longer has a penalty to hitchance.\n\nGash has a [color=" + this.Const.UI.Color.NegativeValue + "]50%[/color] lower threshold to inflict injuries.\n\nSlash, Split, Swing, Overhead Strike and Great Slash gain [color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] chance to hit.";
		this.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs.SpecSword].Name = gt.Const.Strings.PerkName.SpecSword;
		this.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs.SpecSword].Tooltip = gt.Const.Strings.PerkDescription.SpecSword;
	}
});
