this.el_into_the_breach_effect <- this.inherit("scripts/skills/skill", {
	m = {
        EL_Stack = 0,
		EL_TurnLeft = 2
    },
	function create()
	{
		this.m.ID = "el_rarity_effects.into_the_breach";
		this.m.Name = "陷阵";
		this.m.Icon = "skills/status_effect_04.png";
		this.m.IconMini = "status_effect_04_mini";
		this.m.Overlay = "status_effect_04";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "这个角色对任何试图进入他控制区域的对手进行自由攻击。";
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.extend([
			{
				id = 12,
				type = "text",
				text = "我们同仇敌忾，誓死不退！"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_IntoTheBreach.MeleeSkillChainOffset + "[/color] Melee Skill"
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_IntoTheBreach.MeleeDefenseChainOffset + "[/color] Melee Defense"
			}
		]);
		return tooltip;
	}

	function onAdded()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
		{
			item.onLowerWeapon();
		}
	}

	function onUpdate( _properties )
	{
		_properties.IsAttackingOnZoneOfControlEnter = true;

		if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpears)
		{
			_properties.IsAttackingOnZoneOfControlAlways = true;
		}
        _properties.MeleeSkill += this.Math.floor(this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_IntoTheBreach.MeleeSkillChainOffset);
		_properties.MeleeDefense += this.Math.floor(this.m.EL_Stack * this.Const.EL_Rarity_Entry.Factor.EL_IntoTheBreach.MeleeDefenseChainOffset);
	}

	function onRemoved()
	{
		local item = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
		{
			item.onRaiseWeapon();
		}
		else
		{
			local app = this.getContainer().getActor().getItems().getAppearance();
			app.LowerWeapon = false;
			this.getContainer().getActor().getItems().updateAppearance();
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			this.removeSelf();
			return;
		}
		if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
		{
			_properties.DamageTotalMult *= 0.5;
		}
	}

	function onRoundEnd()
	{
		--this.m.EL_TurnLeft;
		if(!this.m.EL_TurnLeft)
		{
			this.removeSelf();
		}
	}

    function EL_setStack( _EL_stcak )
	{
		this.m.EL_Stack = _EL_stcak;
	}
});

