this.perk_ptr_swordmaster_metzger <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {
		Weapons = [
			"weapon.shamshir",
			"weapon.named_shamshir",
			"weapon.scimitar",
			"weapon.saif",
		],
		IsSet = false
	},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_metzger";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterMetzger;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterMetzger;
		this.m.Icon = "ui/perks/ptr_swordmaster_metzger.png";
	}

	function onAdded()
	{
		local equippedItem = this.getContainer().getActor().getMainhandItem();
		if (equippedItem != null)
		{
			this.getContainer().getActor().getItems().unequip(equippedItem);
			this.getContainer().getActor().getItems().equip(equippedItem);
		}

		if (!this.m.IsSet && this.perk_ptr_swordmaster_abstract.onAdded())
		{
			this.getContainer().getActor().getBackground().addPerkGroup(::Const.Perks.CleaverTree.Tree);
			this.getContainer().getActor().getBackground().removePerk(::Const.Perks.PerkDefs.SpecCleaver);
			this.getContainer().getActor().getBackground().removePerk(::Const.Perks.PerkDefs.PTRSwordlike);
			this.getContainer().getActor().getBackground().removePerk(::Const.Perks.PerkDefs.PTRMauler);
			this.m.IsSet = true;
		}
	}

	function onRemoved()
	{
		if (this.m.IsSet)
		{
			local equippedItem = this.getContainer().getActor().getMainhandItem();
			if (equippedItem != null)
			{
				this.getContainer().getActor().getItems().unequip(equippedItem);
				this.getContainer().getActor().getItems().equip(equippedItem);
			}
		}
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled) return true;

		if (this.perk_ptr_swordmaster_abstract.isEnabled())
		{
			return this.m.Weapons.find(this.getContainer().getActor().getMainhandItem().getID()) != null;
		}

		return false;
	}

	function onEquip( _item )
	{
		if (!this.isEnabled() || _item.getSlotType() != ::Const.ItemSlot.Mainhand) return;

		if (!this.getContainer().hasSkill("actives.decapitate"))
		{
			_item.addSkill(this.new("scripts/skills/actives/decapitate"));
		}

		if (!this.getContainer().hasSkill("perk.ptr_sanguinary"))
		{
			local skill = ::new("scripts/skills/perks/perk_ptr_sanguinary");
			skill.m.IsSerialized = false;
			_item.addSkill(skill);
		}
		if (!this.getContainer().hasSkill("perk.ptr_bloodbath"))
		{
			local skill = ::new("scripts/skills/perks/perk_ptr_bloodbath");
			skill.m.IsSerialized = false;
			_item.addSkill(skill);
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || !this.isEnabled()) return;

		if (!_targetEntity.getCurrentProperties().IsImmuneToBleeding && _damageInflictedHitpoints >= ::Const.Combat.MinDamageToApplyBleeding)
		{
			local actor = this.getContainer().getActor();
			local effect = this.new("scripts/skills/effects/bleeding_effect");
			effect.setDamage(10);

			if (actor.getFaction() == this.Const.Faction.Player)
			{
				effect.setActor(this.getContainer().getActor());
			}

			_targetEntity.getSkills().add(effect);
		}
	}

	function onDeserialize( _in )
	{
		this.perk_ptr_swordmaster_abstract.onDeserialize(_in);
		this.m.IsSet = true;
	}
});
