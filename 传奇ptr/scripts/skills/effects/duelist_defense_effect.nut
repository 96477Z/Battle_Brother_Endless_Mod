this.duelist_defense_effect <- this.inherit("scripts/skills/skill", {
	m = {
		IsForceEnabled = false,
		DefenseBonus = 0
	},
	function create()
	{
		this.m.ID = "effects.duelist_defense";
		this.m.Name = "Duelist Defense";
		this.m.Description = "This duelist is gaining increased Melee Defense due to being engaged with fewer than 3 opponents.";
		this.m.Icon = "ui/perks/perk_41.png";
		//this.m.IconMini = "perk_01_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;		
	}
	
	function isHidden()
	{
		return this.m.DefenseBonus < 1;
	}
	
	function getDefenseBonus()
	{	
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap())
		{
			return 0;
		}

		local adjacentEnemies = ::Tactical.Entities.getHostileActors(actor.getFaction(), actor.getTile(), 1, true).len();

		local bonus = 0;

		if (adjacentEnemies == 2)
		{
			bonus = 5;
		}
		else if (adjacentEnemies == 1)
		{
			bonus = 10;
		}
		
		return this.Math.round(0.01 * bonus * actor.getCurrentProperties().getMeleeSkill());
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.DefenseBonus + "[/color] Melee Defense"
			}
		];
	}
	
	function isEnabled()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}
		
		local items = this.getContainer().getActor().getItems();
		local off = items.getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (off == null && !items.hasBlockedSlot(this.Const.ItemSlot.Offhand) || off != null && off.isItemType(this.Const.Items.ItemType.Tool))
		{
			return true;
		}
		
		return false;
	}

	function onAfterUpdate( _properties )
	{
		this.m.DefenseBonus = 0;
		
		if (this.isEnabled())
		{
			this.m.DefenseBonus = this.getDefenseBonus();
			_properties.MeleeDefense += this.m.DefenseBonus;
		}
	}
});

