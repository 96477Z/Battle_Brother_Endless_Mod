this.call_back <- this.inherit("scripts/skills/skill", {
m = {
		
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
		item.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Premium, _user.getLevel());
	    _user.m.Items.equip(item);                   
		this.getContainer().remove(this);
		return true;
	}

    function onCombatFinished()
    {
		local item = this.new("scripts/items/weapons/legendary/longinus_spear");
		item.EL_generateByRankAndLevel(this.Const.EL_Item.Type.Premium, this.getContainer().getActor().getLevel());
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
});

