this.call_back = this.inherit("scripts/skills/skill", {
	m = {
		EL_EntryList = [],
		EL_StrengthenEntryNum = 0,
		EL_Level = -1,
		EL_CurrentLevel = -1,
		EL_RankLevel = 0,
		EL_RankPropertiesImproveIndex = [],
		EL_BaseNoRankConditionMax = 0,
		EL_BaseWithRankConditionMax = 0,
		EL_BaseNoRankValue = 0,
		EL_BaseWithRankValue = 0,

        EL_BaseNoRankShieldDamage = 0,
		EL_BaseNoRankRegularDamage = 0,
		EL_BaseNoRankRegularDamageMax = 0,
		EL_BaseNoRankStaminaModifier = 0,

        EL_BaseWithRankShieldDamage = 0,
		EL_BaseWithRankRegularDamage = 0,
		EL_BaseWithRankRegularDamageMax = 0,
		EL_BaseWithRankStaminaModifier = 0.0,

		EL_BaseNoRankAmmoMax = 0,
		EL_BaseNoRankArmorDamageMult = 0.0,
		EL_BaseNoRankDirectDamageAdd = 0.0,
		EL_BaseNoRankChanceToHitHead = 0,
		EL_BaseNoRankAdditionalAccuracy = 0,
		EL_BaseNoRankFatigueOnSkillUse = 0,
		EL_BaseNoRankRangeMax = 0,

		EL_BaseWithRankVision = 0,
		EL_BaseWithRankAmmoMax = 0,
		EL_BaseWithRankArmorDamageMult = 0.0,
		EL_BaseWithRankDirectDamageAdd = 0.0,
		EL_BaseWithRankChanceToHitHead = 0,
		EL_BaseWithRankAdditionalAccuracy = 0,
		EL_BaseWithRankFatigueOnSkillUse = 0,
		EL_BaseWithRankRangeMax = 0,
		EL_Condition = 0		
	},
	function create()
	{
		this.m.ID = "actives.call_back";
		this.m.Name = "召回长矛";
		this.m.Description = "召回长矛，可以再次使用。只有当你的主手和副手都是空的时候才能使用。";
		this.m.Icon = "skills/active_334.png";
		this.m.IconDisabled = "skills/active_334_sw.png";
		this.m.Overlay = "SpearofLonginus_02";
		this.m.SoundOnUse = [
			"sounds/combat/spearwall_01.wav",
			"sounds/combat/spearwall_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 5;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local ret = [
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
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
	

	


		return ret;
	}

	function isUsable()
	{
		return !this.Tactical.isActive()&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand)==null&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand)==null || this.skill.isUsable()&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand)==null&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand)==null ;
	}


	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInCrossbows ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local item = this.new("scripts/items/weapons/legendary/longinus_spear");
		this.EL_deserializeItem(item);    
	    _user.m.Items.equip(item);               
		this.getContainer().remove(this);
		return true;
	}

    function onCombatFinished()
    {
		local item = this.new("scripts/items/weapons/legendary/longinus_spear");
		this.EL_deserializeItem(item);    
		if(this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand)==null&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand)==null )
		{
			this.getContainer().getActor().getItems().equip(item);
		}
		else if(this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand)!=null&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand)!=null)
		{
			this.World.Assets.getStash().add(item);
		}
		this.removeSelf();
	}

	function EL_serializeItem( _item )
	{
		foreach(entry in _item.m.EL_EntryList)
		{
			this.m.EL_EntryList.push(entry);
		}
		this.m.EL_StrengthenEntryNum = _item.m.EL_StrengthenEntryNum;
		this.m.EL_Level = _item.m.EL_Level;
		this.m.EL_CurrentLevel = _item.m.EL_CurrentLevel;
		this.m.EL_RankLevel = _item.m.EL_RankLevel;
		foreach(index in _item.m.EL_RankPropertiesImproveIndex)
		{
			this.m.EL_RankPropertiesImproveIndex.push(index);
		}
		this.m.EL_BaseNoRankConditionMax = _item.m.EL_BaseNoRankConditionMax;
		this.m.EL_BaseWithRankConditionMax = _item.m.EL_BaseWithRankConditionMax;
		this.m.EL_BaseNoRankValue = _item.m.EL_BaseNoRankValue;
		this.m.EL_BaseWithRankValue = _item.m.EL_BaseWithRankValue;
		
        this.m.EL_BaseNoRankShieldDamage = _item.m.EL_BaseNoRankShieldDamage;
		this.m.EL_BaseNoRankRegularDamage = _item.m.EL_BaseNoRankRegularDamage;
		this.m.EL_BaseNoRankRegularDamageMax = _item.m.EL_BaseNoRankRegularDamageMax;
		this.m.EL_BaseNoRankStaminaModifier = _item.m.EL_BaseNoRankStaminaModifier;

        this.m.EL_BaseWithRankShieldDamage = _item.m.EL_BaseWithRankShieldDamage;
		this.m.EL_BaseWithRankRegularDamage = _item.m.EL_BaseWithRankRegularDamage;
		this.m.EL_BaseWithRankRegularDamageMax = _item.m.EL_BaseWithRankRegularDamageMax;
		this.m.EL_BaseWithRankStaminaModifier = _item.m.EL_BaseWithRankStaminaModifier;

		this.m.EL_BaseNoRankAmmoMax = _item.m.EL_BaseNoRankAmmoMax;
		this.m.EL_BaseNoRankArmorDamageMult = _item.m.EL_BaseNoRankArmorDamageMult;
		this.m.EL_BaseNoRankDirectDamageAdd = _item.m.EL_BaseNoRankDirectDamageAdd;
		this.m.EL_BaseNoRankChanceToHitHead = _item.m.EL_BaseNoRankChanceToHitHead;
		this.m.EL_BaseNoRankAdditionalAccuracy = _item.m.EL_BaseNoRankAdditionalAccuracy;
		this.m.EL_BaseNoRankFatigueOnSkillUse = _item.m.EL_BaseNoRankFatigueOnSkillUse;
		this.m.EL_BaseNoRankRangeMax = _item.m.EL_BaseNoRankRangeMax;

		this.m.EL_BaseWithRankVision = _item.m.EL_BaseWithRankVision;
		this.m.EL_BaseWithRankAmmoMax = _item.m.EL_BaseWithRankAmmoMax;
		this.m.EL_BaseWithRankArmorDamageMult = _item.m.EL_BaseWithRankArmorDamageMult;
		this.m.EL_BaseWithRankDirectDamageAdd = _item.m.EL_BaseWithRankDirectDamageAdd;
		this.m.EL_BaseWithRankChanceToHitHead = _item.m.EL_BaseWithRankChanceToHitHead;
		this.m.EL_BaseWithRankAdditionalAccuracy = _item.m.EL_BaseWithRankAdditionalAccuracy;
		this.m.EL_BaseWithRankFatigueOnSkillUse = _item.m.EL_BaseWithRankFatigueOnSkillUse;
		this.m.EL_BaseWithRankRangeMax = _item.m.EL_BaseWithRankRangeMax;
		this.m.EL_Condition = _item.m.Condition;	
	}

	function EL_deserializeItem( _item )
	{
		foreach(entry in this.m.EL_EntryList)
		{
			_item.m.EL_EntryList.push(entry);
		}
		_item.m.EL_StrengthenEntryNum = this.m.EL_StrengthenEntryNum;
		_item.m.EL_Level = this.m.EL_Level;
		_item.m.EL_CurrentLevel = this.m.EL_CurrentLevel;
		_item.m.EL_RankLevel = this.m.EL_RankLevel;
		foreach(index in this.m.EL_RankPropertiesImproveIndex)
		{
			_item.m.EL_RankPropertiesImproveIndex.push(index);
		}
		_item.m.EL_BaseNoRankConditionMax = this.m.EL_BaseNoRankConditionMax;
		_item.m.EL_BaseWithRankConditionMax = this.m.EL_BaseWithRankConditionMax;
		_item.m.EL_BaseNoRankValue = this.m.EL_BaseNoRankValue;
		_item.m.EL_BaseWithRankValue = this.m.EL_BaseWithRankValue;
		
        _item.m.EL_BaseNoRankShieldDamage = this.m.EL_BaseNoRankShieldDamage;
		_item.m.EL_BaseNoRankRegularDamage = this.m.EL_BaseNoRankRegularDamage;
		_item.m.EL_BaseNoRankRegularDamageMax = this.m.EL_BaseNoRankRegularDamageMax;
		_item.m.EL_BaseNoRankStaminaModifier = this.m.EL_BaseNoRankStaminaModifier;

        _item.m.EL_BaseWithRankShieldDamage = this.m.EL_BaseWithRankShieldDamage;
		_item.m.EL_BaseWithRankRegularDamage = this.m.EL_BaseWithRankRegularDamage;
		_item.m.EL_BaseWithRankRegularDamageMax = this.m.EL_BaseWithRankRegularDamageMax;
		_item.m.EL_BaseWithRankStaminaModifier = this.m.EL_BaseWithRankStaminaModifier;

		_item.m.EL_BaseNoRankAmmoMax = this.m.EL_BaseNoRankAmmoMax;
		_item.m.EL_BaseNoRankArmorDamageMult = this.m.EL_BaseNoRankArmorDamageMult;
		_item.m.EL_BaseNoRankDirectDamageAdd = this.m.EL_BaseNoRankDirectDamageAdd;
		_item.m.EL_BaseNoRankChanceToHitHead = this.m.EL_BaseNoRankChanceToHitHead;
		_item.m.EL_BaseNoRankAdditionalAccuracy = this.m.EL_BaseNoRankAdditionalAccuracy;
		_item.m.EL_BaseNoRankFatigueOnSkillUse = this.m.EL_BaseNoRankFatigueOnSkillUse;
		_item.m.EL_BaseNoRankRangeMax = this.m.EL_BaseNoRankRangeMax;

		_item.m.EL_BaseWithRankVision = this.m.EL_BaseWithRankVision;
		_item.m.EL_BaseWithRankAmmoMax = this.m.EL_BaseWithRankAmmoMax;
		_item.m.EL_BaseWithRankArmorDamageMult = this.m.EL_BaseWithRankArmorDamageMult;
		_item.m.EL_BaseWithRankDirectDamageAdd = this.m.EL_BaseWithRankDirectDamageAdd;
		_item.m.EL_BaseWithRankChanceToHitHead = this.m.EL_BaseWithRankChanceToHitHead;
		_item.m.EL_BaseWithRankAdditionalAccuracy = this.m.EL_BaseWithRankAdditionalAccuracy;
		_item.m.EL_BaseWithRankFatigueOnSkillUse = this.m.EL_BaseWithRankFatigueOnSkillUse;
		_item.m.EL_BaseWithRankRangeMax = this.m.EL_BaseWithRankRangeMax;
		_item.m.Condition = this.m.EL_Condition;	
	}
});

