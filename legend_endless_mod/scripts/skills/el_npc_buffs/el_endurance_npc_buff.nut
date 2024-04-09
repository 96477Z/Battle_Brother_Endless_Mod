this.el_endurance_npc_buff <- this.inherit("scripts/skills/el_npc_buffs/el_npc_buff", {
	m = {},
	function create()
	{
		this.el_npc_buff.create();
		this.m.ID = "el_npc_buffs.endurance";
		this.m.Name = "坚韧";
		this.m.Description = "";
	}

	function onUpdate( _properties )
	{
        if(this.m.EL_RankLevel == 0) {
            _properties.IsImmuneToStun = true;
            _properties.IsImmuneToRoot = true;
        }
        if(this.m.EL_RankLevel == 1) {
            _properties.IsImmuneToStun = true;
            _properties.IsImmuneToDaze = true;
            _properties.IsImmuneToRoot = true;
            _properties.IsImmuneToKnockBackAndGrab = true;
            _properties.IsImmuneToRotation = true;
        }
        else if(this.m.EL_RankLevel == 2) {
            _properties.IsImmuneToOverwhelm = true;
            _properties.IsImmuneToStun = true;
            _properties.IsImmuneToDaze = true;
            _properties.IsImmuneToRoot = true;
            _properties.IsImmuneToKnockBackAndGrab = true;
            _properties.IsImmuneToRotation = true;
            _properties.IsImmuneToDisarm = true;
            _properties.IsImmuneToSurrounding = true;
            _properties.IsImmuneToBleeding = true;
            _properties.IsImmuneToPoison = true;
            _properties.IsImmuneToDamageReflection = true;
            _properties.IsImmuneToFire = true;
            _properties.IsResistantToAnyStatuses = true;
            _properties.IsResistantToPhysicalStatuses = true;
            _properties.IsResistantToMiasma = true;
        }
	}
	
    function onAfterUpdate( _properties ) {
		this.el_npc_buff.onAfterUpdate(_properties);
        switch(this.m.EL_RankLevel){
            case 0:
                this.m.Description = "免疫眩晕和定身。";
                break;
            case 1:
                this.m.Description = "免疫眩晕和定身和部分控制效果。";
                break;
            case 2:
                this.m.Description = "免疫大部分负面效果。";
                break;
        }
    }

});

