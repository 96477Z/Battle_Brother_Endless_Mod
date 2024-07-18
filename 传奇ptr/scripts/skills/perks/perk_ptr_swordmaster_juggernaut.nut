this.perk_ptr_swordmaster_juggernaut <- this.inherit("scripts/skills/perks/perk_ptr_swordmaster_abstract", {
	m = {
		Target = null
	},
	function create()
	{
		this.perk_ptr_swordmaster_abstract.create();
		this.m.ID = "perk.ptr_swordmaster_juggernaut";
		this.m.Name = this.Const.Strings.PerkName.PTRSwordmasterJuggernaut;
		this.m.Description = this.Const.Strings.PerkDescription.PTRSwordmasterJuggernaut;
		this.m.Icon = "ui/perks/ptr_swordmaster_juggernaut.png";
	}

	function isEnabled()
	{
		if (this.m.IsForceEnabled) return true;

		local ret = this.perk_ptr_swordmaster_abstract.isEnabled();
		if (ret)
		{
			local weapon = this.getContainer().getActor().getMainhandItem();
			if (weapon.isWeaponType(::Const.Items.WeaponType.BFFencing) || !weapon.isItemType(::Const.Items.ItemType.TwoHanded)) return false;
		}

		return ret;
	}

	function onEquip( _item )
	{
		if (this.isEnabled() && !this.getContainer().hasSkill("actives.indomitable"))
		{
			_item.addSkill(::new("scripts/skills/actives/indomitable"));
		}
	}

	function onAdded()
	{
		if (this.perk_ptr_swordmaster_abstract.onAdded())
		{
			this.getContainer().add(this.new("scripts/skills/actives/ptr_swordmaster_charge_skill"));
			local equippedItem = this.getContainer().getActor().getMainhandItem();
			if (equippedItem != null)
			{
				this.getContainer().getActor().getItems().unequip(equippedItem);
				this.getContainer().getActor().getItems().equip(equippedItem);
			}
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.ptr_swordmaster_charge");
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (this.m.Target != null || !_skill.isAttack() || _skill.isAOE() || !this.isEnabled())
		{
			this.m.Target = null;
			return;
		}

		this.m.Target = null;

		local targetTile = _targetEntity.getTile();

		local targets = [];

		for (local i = 0; i < 6; i++)
		{
			if (targetTile.hasNextTile(i))
			{
				local nextTile = targetTile.getNextTile(i);
				if (nextTile.IsOccupiedByActor)
				{
					local entity = nextTile.getEntity();
					if (!entity.isAlliedWith(this.getContainer().getActor())) targets.push(entity);
				}
			}
		}

		this.m.Target = ::MSU.Array.rand(targets);
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.m.Target != null)
		{
			_skill.onUse(this.getContainer().getActor(), this.m.Target.getTile());
			this.m.Target = null;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.m.Target != null)
		{
			_properties.DamageTotalMult *= 0.5;
		}
	}

	function onCombatStarted()
	{
		this.perk_ptr_swordmaster_abstract.onCombatStarted();
		this.m.Target = null;
	}

	function onCombatFinished()
	{
		this.perk_ptr_swordmaster_abstract.onCombatFinished();
		this.m.Target = null;
	}
});
