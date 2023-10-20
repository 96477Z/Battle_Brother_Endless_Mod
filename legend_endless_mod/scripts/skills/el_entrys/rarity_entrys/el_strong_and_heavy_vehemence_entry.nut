this.el_strong_and_heavy_vehemence_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_replacedSkills = []
	},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.strong_and_heavy_vehemence";
		this.m.Name = "Strong and Heavy Vehemence(Two-Handed  Mace)";
		this.m.Description = "The majestic power makes the enemy unable to parry and unable to conceal their decline.";//磅礴的力量让敌人无法招架，难掩颓势
		this.m.Icon = "el_entrys/el_strong_and_heavy_vehemence_entry.png";
		//this.m.IconMini = "el_strong_and_heavy_vehemence_entry_mini";
		this.m.Overlay = "el_strong_and_heavy_vehemence_entry";
		this.m.Type = this.Const.SkillType.StatusEffect;
	}

	function getTooltip()
	{
        local result = [
            {
				id = 1,
				type = "title",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare] + "]" + this.getName() + "[/color]"
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
                type = "text",
                icon = "ui/icons/special.png",
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Merge and strengthen skills.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Cause additional fatigue damage equivalent to " + this.Const.EL_Rarity_Entry.Factor.EL_StrongAndHeavyVehemence.FatigueDamageMult * 100 +"% times health damage.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Has a 100% chance to stun 2 turns on a hit.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]Release a free split shield during the attack.[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]You need to equip Two-Handed  Mace to take effect.[/color]"
            });
        }
		return result;
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_useFreeSplitShield(this.getContainer().getActor(), _targetEntity);
		}
	}
    
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
			local fatigue_damage = _damageInflictedHitpoints * this.Const.EL_Rarity_Entry.Factor.EL_StrongAndHeavyVehemence.FatigueDamageMult;
			this.applyFatigueDamage(_targetEntity, fatigue_damage);
		}
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_useFreeSplitShield(this.getContainer().getActor(), _targetEntity);
		}
	}

	function onAfterUpdate( _properties )
	{
		if (EL_isUsable())
		{
			this.Const.EL_Rarity_Entry.EL_ReplaceSkill(this.getContainer().getActor(), this.m.EL_replacedSkills, this.Const.EL_Rarity_Entry.Factor.EL_StrongAndHeavyVehemence.ReplaceSkillList);
			this.getContainer().add(this.new("scripts/skills/el_actives/el_strong_and_heavy_vehemence_skill"));
		}
		else
		{
			this.m.EL_replacedSkills.clear();
			this.getContainer().removeByID("el_rarity_actives.strong_and_heavy_vehemence_skill");
		}
	}

	function onRemoved()
	{
		this.Const.EL_Rarity_Entry.EL_ReturnSkill(this.getContainer().getActor(), this.m.EL_replacedSkills);
		this.getContainer().removeByID("el_rarity_actives.strong_and_heavy_vehemence_skill");
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isWeaponType(this.Const.Items.WeaponType.Mace) && item.getRangeMax() == 1)
		{
			return true;
		}
		return false;
	}
});