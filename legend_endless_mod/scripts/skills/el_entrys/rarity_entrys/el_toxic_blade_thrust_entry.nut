this.el_toxic_blade_thrust_entry <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.ID = "el_rarity_entry.toxic_blade_thrust";
		this.m.Name = "毒刃刺骨(匕首)";
		this.m.Description = "不详的气息在匕首上萦绕，它的敌人将遭受难以想象的痛楚与折磨";//An ominous aura lingers on the dagger, and its enemies will suffer unimaginable pain and torment.
		this.m.Icon = "el_entrys/el_toxic_blade_thrust_entry.png";
		//this.m.IconMini = "el_toxic_blade_thrust_entry_mini";
		this.m.Overlay = "el_toxic_blade_thrust_entry";
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
				text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]当你击中目标时，随机对其施加 " + this.Const.EL_Rarity_Entry.Factor.EL_ToxicBladeThrust.DebuffNum + " 种负面效果.[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]目标拥有的每种负面效果都会提升你" + this.Const.EL_Rarity_Entry.Factor.EL_ToxicBladeThrust.DamageMultPurEffect * 100 + "%的伤害[/color]"
			},
			{
				id = 4,
                type = "text",
                icon = "ui/icons/special.png",
                text = "[color=" + this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special] + "]造成的伤害将会直接忽视护甲[/color]"
			}
        ]
		if (!EL_isUsable())
		{
            result.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]你需要装备匕首来发挥效果[/color]"
            });
        }
		return result;
	}
    
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return;
		}
		if (EL_isUsable())
		{
            for(local i = 0; i < this.Const.EL_Rarity_Entry.Factor.EL_ToxicBladeThrust.DebuffNum; ++i)
            {
                local r = this.Math.rand(0, this.Const.EL_Item_Other.NegativeEffectScripts.len() - 5);
			    _targetEntity.getSkills().add(this.new(this.Const.EL_Item_Other.NegativeEffectScripts[r]));
            }
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity != null && _skill.m.IsWeaponSkill && EL_isUsable())
		{
			//this.logInfo("Use Skill name:"+_skill.getID());
			local number = EL_getTargetNegativeEffectNum(_targetEntity);
			//this.logInfo("target negative effect num:" + number);
			_properties.DamageTotalMult *= (1.0 + number * this.Const.EL_Rarity_Entry.Factor.EL_ToxicBladeThrust.DamageMultPurEffect);
			_properties.DamageDirectAdd = 1;
			_properties.IsIgnoringArmorOnAttack = true;
		}
	}

    function EL_getTargetNegativeEffectNum( _targetEntity )
    {
        local skills = _targetEntity.getSkills();
        local number = 0;
        foreach( skill in skills.m.Skills ) {
			if(this.Const.EL_Rarity_Entry.EL_isNegativeEffect(skill))
			{
				++number;
			}
        }
        return number;
    }
	
	function isHidden()
	{
		return this.getContainer().getActor().getFaction() != this.Const.Faction.Player && !EL_isUsable();
	}

	function EL_isUsable()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);
		if (item != null && item.getID() == "el_accessory.core")
		{
			return false;
		}
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isWeaponType(this.Const.Items.WeaponType.Dagger))
		{
			return true;
		}
		return false;
	}
});

