this.el_beheaded_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {
		EL_Duration = 1
	},
	function create()
	{
		this.el_entry.create();
		this.m.ID = this.Const.EL_Weapon.EL_Entry.Factor.EL_Beheaded.ID;
		this.m.EL_Duration = this.Const.EL_Weapon.EL_Entry.Factor.EL_Beheaded.Duration;
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]对敌人施加状态：若敌人仅余1血，则死亡，持续" + this.m.EL_Duration + "回合[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
        if(this.m.EL_Duration > this.Const.EL_Weapon.EL_Entry.Factor.EL_Beheaded.Duration)
		{
			return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Rare];
		}
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special];
	}

	function EL_strengthen()
	{
		this.m.EL_Duration = this.Const.EL_Weapon.EL_Entry.EntryStrengthenMult * this.Const.EL_Weapon.EL_Entry.Factor.EL_Beheaded.Duration;
	}

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || _targetEntity.isDying() || !_targetEntity.isAlive() || !_skill.m.IsWeaponSkill) 
		{
			return;
		}
		skill = this.new("scripts/skills/el_effects/el_beheaded_effect");
		skill.m.Skill = _skill;
		skill.m.Killer = this.getContainer().getActor();
		skill.m.Duration = this.m.EL_Duration;
		_targetEntity.getSkills().add(skill);
	}
});
