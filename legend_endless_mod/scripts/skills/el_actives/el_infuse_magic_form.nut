this.el_infuse_magic_form <- this.inherit("scripts/skills/skill", {
	m = {
        isOpen = false
    },
	function create()
	{
		this.m.ID = "el_actives.infuse_magic_form";
		this.m.Name = "开启注魔姿态";
		this.m.Description = "注魔姿态会带来强大的魔法爆发能力";
		this.m.Icon = "skills/siphon_square_bw.png";
		this.m.IconDisabled = "skills/siphon_square.png";
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
	}

	function isUsable()
	{
		return !this.m.isOpen;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip();
        if(this.m.isOpen)
        {
            ret.push({
                id = 6,
                type = "text",
                text = "[color=" + this.Const.UI.Color.PositiveValue + "]当前已开启[/color]"
            });
        }
        else
        {
			ret.push({
                id = 6,
                type = "text",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]当前未开启[/color]"
            });
        }
        ret.push({
            id = 7,
            type = "text",
            icon = "ui/icons/special.png",
            text = "攻击型法术的伤害提升" + (this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.DamageMult - 1) * 100 + "%，施法范围提升" + (this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.RangeMaxMult - 1) * 100 + "%，施法消耗降低" + (1 - this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.FatigueCostMult) * 100 + "%。"
        });
        ret.push({
            id = 7,
            type = "text",
            icon = "ui/icons/special.png",
            text = "施法时有50%效果对同目标再次施法。（此效果判定成功时可重复判定）"
        });
		if (!this.m.isOpen)
		{
            ret.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]使用注魔姿态时会强制退出滞灵姿态！[/color]"
            });
        }

		return ret;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		if(!this.m.isOpen || _targetEntity == null || !_targetEntity.isAlive() || _targetEntity.isDying() || _skill == this)
        {
            return;
        }
        if(this.Math.rand(1, 100) <= this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.MultipleChance)
        {
            _skill.useForFree(_targetTile);
        }
	}

    function onAnySkillUsed( _skill, _targetEntity, _properties )
    {
        if(this.m.isOpen && _skill.m.IsActive && !_skill.m.IsWeaponSkill && _skill.m.IsTargeted && _skill.m.IsAttack && _skill.m.IsRanged && _skill.m.IsIgnoredAsAOO)
        {
            _properties.DamageTotalMult *= this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.DamageMult;
        }
    }

	function onAfterUpdate( _properties )
	{
        if(this.m.isOpen)
        {
			local actor = this.getContainer().getActor();
            local skills = actor.getSkills();
            foreach( skill in skills.m.Skills ) {
                if( skill.m.IsActive && !skill.m.IsWeaponSkill && skill.m.IsTargeted && skill.m.IsAttack && skill.m.IsRanged && skill.m.IsIgnoredAsAOO)
                {
                    skill.m.MaxRange = this.Math.ceil(skill.m.MaxRange * this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.RangeMaxMult);
                    skill.m.FatigueCost  = this.Math.floor(skill.m.FatigueCost * this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.FatigueCostMult);
                    skill.m.ActionPointCost  = this.Math.floor(skill.m.ActionPointCost * this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.InfuseMagic.ActionPointCostMult);
                }
            }
        }
	}

	function onUse( _user, _targetTile )
	{
        this.m.isOpen = true;
        local another_form = this.getContainer().getSkillByID("el_actives.stagnant_spirit_form");
        another_form.m.isOpen = false;
		return true;
	}

});