local modID = "mod_duelistDefense";
::mods_registerMod(modID, 1.4, "Duelist Defense 1.4.3");

local gt = this.getroottable();

::mods_queue(modID, "mod_msu, >mod_legends, >mod_fencerPerk", function()
{	
	::mods_hookChildren("ai/tactical/agent", function(o) {
		
		local createFunc = o.create;
		o.create = function()
		{
			createFunc();
			this.m.OriginalEngageTargetMultipleOpponentsMult <- this.m.Properties.EngageTargetMultipleOpponentsMult;
		}
		
		local updateFunc = ::mods_getMember(o, "onUpdate");
		o.onUpdate <- function()
		{				
			this.m.Properties.EngageTargetMultipleOpponentsMult = this.m.OriginalEngageTargetMultipleOpponentsMult;
			
			updateFunc();
			
			if (this.m.Properties.EngageTargetMultipleOpponentsMult > 0)
			{
				local item = this.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
				if (item != null && item.isItemType(this.Const.Items.ItemType.OneHanded) && this.getActor().getSkills().hasSkill("perk.duelist"))
				{
					this.m.Properties.EngageTargetMultipleOpponentsMult = 0.1;
				}				
			}
		}
	});

	::mods_hookNewObject("skills/perks/perk_duelist", function(o) {
		local onCombatStarted = ::mods_getMember(o, "onCombatStarted");		
		o.onCombatStarted <- function()
		{
			onCombatStarted();
			this.getContainer().add(this.new("scripts/skills/effects/duelist_defense_effect"));
		}
		
		
		local onAdded = ::mods_getMember(o, "onAdded");
		o.onAdded <- function()
		{
			onAdded();
			if (("State" in this.Tactical) && this.Tactical.State != null)
			{
				this.getContainer().add(this.new("scripts/skills/effects/duelist_defense_effect"));
			}
		}
	});

	gt.Const.Strings.PerkDescription.Duelist = "Become one with your weapon and go for the weak spots! With the offhand free, an additional [color=" + this.Const.UI.Color.PositiveValue + "]+25%[/color] of any damage ignores armor.\n\nGain a percentage of your Melee Skill as Melee Defense when engaged with a maximum of one or two enemies. [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] when engaged with one enemy, and [color=" + this.Const.UI.Color.PositiveValue + "]5%[/color] when engaged with two enemies.\n\nDoes not work with two-handed weapons.";

	foreach (perkRow in gt.Const.Perks.Perks)
	{
		foreach (perk in perkRow)
		{	
			if (perk.ID == "perk.duelist")
			{
				perk.Tooltip = this.Const.Strings.PerkDescription.Duelist;
				break;
			}
		}	
	}

	if ("LegendMod" in gt.Const)
	{
		gt.Const.Strings.PerkDescription.Duelist += "\n[color=#0b0084]From the One Handed Sword perk group[/color]";
		gt.Const.Perks.PerkDefObjects[gt.Const.Perks.PerkDefs.Duelist].Tooltip = gt.Const.Strings.PerkDescription.Duelist;
	}
});
