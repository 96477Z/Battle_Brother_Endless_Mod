this.el_impair_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {},
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_Impair.ID;
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.EL_Percentage = this.Const.EL_Weapon.EL_Entry.Factor.EL_Impair.Percentage;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]削弱：命中目标会同步降低目标本次伤害" + this.m.EL_Percentage * 100 + "%的血量上限[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        if(this.m.EL_Percentage > this.Const.EL_Weapon.EL_Entry.Factor.EL_Impair.Percentage)
		{
			return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
		}
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special];
	}

	function EL_strengthen()
	{
		this.m.EL_Percentage = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_Impair.Percentage;
	}

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || !_skill.m.IsWeaponSkill) 
		{
			return;
		}
        local skill = _targetEntity.getSkills().getSkillByID("el_effects.impair");
        if(skill == null)
        {
            skill = this.new("scripts/skills/el_effects/el_impair_effect");
            _targetEntity.getSkills().add(skill);
        }
        skill.EL_addBonus((_damageInflictedHitpoints + _damageInflictedArmor) * this.m.EL_Percentage);
	}
});
