this.el_flustered_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {},
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_Flustered.ID;
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.EL_Bonus = this.Const.EL_Weapon.EL_Entry.Factor.EL_Flustered.Bonus;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]慌乱：攻击目标会使其本场战斗双防-" + this.m.EL_Bonus + "[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        if(this.m.EL_Bonus > this.Const.EL_Weapon.EL_Entry.Factor.EL_Flustered.Bonus)
		{
			return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
		}
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special];
	}

	function EL_strengthen()
	{
		this.m.EL_Bonus = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_Flustered.Bonus;
	}

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || !_skill.m.IsWeaponSkill) 
		{
			return;
		}
        local skill = _targetEntity.getSkills().getSkillByID("el_effects.flustered");
        if(skill == null)
        {
            skill = this.new("scripts/skills/el_effects/el_flustered_effect");
            _targetEntity.getSkills().add(skill);
        }
        skill.EL_addBonus(this.m.EL_Bonus);
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if (_targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || !_skill.m.IsWeaponSkill) 
		{
			return;
		}
        local skill = _targetEntity.getSkills().getSkillByID("el_effects.flustered");
        if(skill == null)
        {
            skill = this.new("scripts/skills/el_effects/el_flustered_effect");
            _targetEntity.getSkills().add(skill);
        }
        skill.EL_addBonus(this.m.EL_Bonus);
	}
});
