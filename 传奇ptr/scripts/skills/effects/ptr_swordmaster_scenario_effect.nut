this.ptr_swordmaster_scenario_effect <- this.inherit("scripts/skills/skill", {
	m = {
		WrongWeaponName = null		
	},
	function create()
	{
		this.m.ID = "effects.ptr_swordmaster_scenario";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;		
	}

	function onUpdate( _properties )
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (this.getContainer().getActor().isPlacedOnMap() && weapon != null && !this.isValidWeapon(weapon))
		{
			this.m.WrongWeaponName = weapon.getName();
		}
	}

	function isEnabled()
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && this.isValidWeapon(weapon) && weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return true;
		}

		return false;
	}

	function isValidWeapon( _weapon )
	{
		if (	!_weapon.isItemType(this.Const.Items.ItemType.MeleeWeapon) ||
				_weapon.isWeaponType(this.Const.Items.WeaponType.Sword, true) ||
				_weapon.isWeaponType(this.Const.Items.WeaponType.BFFencing) ||
				_weapon.getID() == "weapon.player_banner" ||
				(_weapon.getID() == "weapon.legend_staff_vala" && this.getContainer().getActor().getBackground().getID() == "background.legend_vala")
			)
		{
			return true;
		}

		return false;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		if (this.m.WrongWeaponName != null)
		{
			local roster = this.World.getPlayerRoster().getAll();
			foreach (bro in roster)
			{
				bro.worsenMood(99.0, "Made someone use " + this.m.WrongWeaponName + " instead of Sword!");
			}
			this.m.WrongWeaponName = null;
		}
	}
});
