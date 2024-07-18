local gt = this.getroottable();

gt.Const.WMS.modActor <- function()
{
	::mods_hookExactClass("entity/tactical/actor", function ( o ) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();
			this.getSkills().add(this.new("scripts/skills/effects/wms_mastery_effect"));
		}

		o.hasMasteryOfEquippedWeapon <- function(_properties)
		{
			local weapon = this.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

			if (weapon != null)
			{
				if (_properties.IsSpecializedInAxes && weapon.isWeaponType(this.Const.Items.WeaponType.Axe))
				{
					return true;
				}
				if (_properties.IsSpecializedInBows && weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
				{
					return true;
				}
				if (_properties.IsSpecializedInCleavers && weapon.isWeaponType(this.Const.Items.WeaponType.Cleaver))
				{
					return true;
				}
				if (_properties.IsSpecializedInCrossbows && weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow))
				{
					return true;
				}
				if (_properties.IsSpecializedInDaggers && weapon.isWeaponType(this.Const.Items.WeaponType.Dagger))
				{
					return true;
				}
				if (_properties.IsSpecializedInFlails && weapon.isWeaponType(this.Const.Items.WeaponType.Flail))
				{
					return true;
				}
				if (_properties.IsSpecializedInHammers && weapon.isWeaponType(this.Const.Items.WeaponType.Hammer))
				{
					return true;
				}
				if (_properties.IsSpecializedInMaces && weapon.isWeaponType(this.Const.Items.WeaponType.Mace))
				{
					return true;
				}
				if (_properties.IsSpecializedInPolearms && weapon.isWeaponType(this.Const.Items.WeaponType.Polearm))
				{
					return true;
				}
				if (_properties.IsSpecializedInSlings && weapon.isWeaponType(this.Const.Items.WeaponType.Sling))
				{
					return true;
				}
				if (_properties.IsSpecializedInSpears && weapon.isWeaponType(this.Const.Items.WeaponType.Spear))
				{
					return true;
				}
				if (_properties.IsSpecializedInStaves && weapon.isWeaponType(this.Const.Items.WeaponType.Staff))
				{
					return true;
				}

				if ("LegendMod" in gt.Const)
				{
					if ((_properties.IsSpecializedInSwords || _properties.IsSpecializedInGreatSwords) && weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
					{
						return true;
					}
				}
				else
				{
					if (_properties.IsSpecializedInSwords && weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
					{
						return true;
					}
				}

				if (_properties.IsSpecializedInThrowing && weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
				{
					return true;
				}
			}

			return false;
		}
	});
};
