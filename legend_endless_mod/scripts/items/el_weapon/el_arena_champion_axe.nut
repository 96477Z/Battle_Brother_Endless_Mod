this.el_arena_champion_axe <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "el_weapon.arena_champion_axe";
		this.m.Name = "冠军之斧";
		this.m.Description = "一种充满荣誉与欢呼的斧头。做工精良，独特的设计往往能让他直接给予敌人死亡。";
		this.m.IconLarge = "weapons/melee/arena_champion_axe.png";
		this.m.Icon = "weapons/melee/arena_champion_axe_70x70.png";
		this.m.WeaponType = this.Const.Items.WeaponType.Axe;
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.IsAgainstShields = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_axe_03";
		this.m.Value = 0;
		this.m.ShieldDamage = 16;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -18;
		this.m.RegularDamage = 35;
		this.m.RegularDamageMax = 65;
		this.m.ArmorDamageMult = 1.3;
		this.m.DirectDamageMult = 0.3;
		this.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Legendary, 0);
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/chop"));
		local skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setApplyAxeMastery(true);
		this.addSkill(skillToAdd);
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		for(local i = 0; i < result.len(); ++i)
		{
			if(result[i].type == "text" && result[i].text == "——————————————")
			{
				result.insert(i, {
					id = 8,
					type = "text",
					icon = "ui/icons/special.png",
					text = "结算伤害后若目标生命值低于33%或不高于2点生命值，则直接杀死敌人!"
				});
				break;
			}
		}
		return result;
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
        this.weapon.onDamageDealt(_target, _skill, _hitInfo);
		if (_target == null || !_target.isAlive() || _target.isDying())
		{
			return;
		}
        if(_target.getHitpoints() <= 2 || _target.getHitpoints() / (_target.getHitpointsMax() * 1.0) < 0.33)
        {
            _target.kill(this.getContainer().getActor(), _skill);
        }
	}


});

