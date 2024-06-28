el_soul_energy_state_effect <- this.inherit("scripts/skills/skill", {
	m = {
        EL_Stack = 0,
    },
	function create()
	{
		this.m.ID = "el_effects.soul_energy_state";
        this.m.Name = "灵能干涸";
        this.m.Icon = "el_skills/soul_energy_state_0.png";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

	function getTooltip()
	{
		local tooltip = this.skill.getTooltip();
		tooltip.push({
            id = 11,
            type = "text",
            icon = "ui/tooltips/soul_energy.png",
            text = "灵魂能量：" + this.World.Assets.EL_getSoulEnergy() + " / " + this.World.Assets.EL_getSoulEnergyMax() + "(每日自动恢复最大值的4%)"
		});
        if(this.m.EL_Stack > 0)
        {
            tooltip.extend([
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.InitiativeOffset + "[/color] Initiative"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.MeleeSkillOffset + "[/color] Melee Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.FatigueOnSkillUseOffset * 100 + "%[/color] Fatigue Cost"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/icons/damage_dealt.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.DamageTotalMult * 100 + "%[/color] Damage Dealt"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/icons/action_points.png",
                    text = "[color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.ActionPointOffset + "[/color] 行动点"
                }
            ]);
        }
        else if(this.m.EL_Stack < 0)
        {
            tooltip.extend([
                {
                    id = 11,
                    type = "text",
                    icon = "ui/icons/initiative.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.InitiativeOffset + "[/color] Initiative"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.MeleeSkillOffset + "[/color] Melee Skill"
                },
                {
                    id = 13,
                    type = "text",
                    icon = "ui/icons/fatigue.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]+"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.FatigueOnSkillUseOffset * 100 + "%[/color] Fatigue Cost"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/icons/damage_dealt.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.DamageTotalMult * 100 + "%[/color] Damage Dealt"
                },
                {
                    id = 14,
                    type = "text",
                    icon = "ui/tooltips/soul_energy.png",
                    text = "灵魂能量获取速度 [color=" + this.Const.UI.Color.PositiveValue + "]+"+ this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.SoulEnergyGianMult * 100 + "%[/color]"
                }
            ]);
        }
		return tooltip;
	}

	function onUpdate( _properties )
	{
        local percent = this.World.Assets.EL_getSoulEnergy() / (1.0 * this.World.Assets.EL_getSoulEnergyMax())
        if(percent < 0.1)
        {
            this.m.Name = "灵能干涸";
            this.m.Description = "霜之哀伤，饿了，它开始撕扯你的灵魂来取悦自己。\n你将难以使用专属技能，除非你快速找到新的灵魂能量来源。";
            this.m.Icon = "el_skills/soul_energy_state_0.png";
            this.m.EL_Stack = -2;
        }
        else if(percent < 0.4)
        {
            this.m.Name = "灵能枯竭";
            this.m.Description = "霜之哀伤非常饥渴，这把魔剑正在催促着你进食。\n与此同时，对于专属技能的使用你必须要谨慎起来了。";
            this.m.Icon = "el_skills/soul_energy_state_1.png";
            this.m.EL_Stack = -1;
        } 
        else if(percent < 0.65)
        {
            this.m.Name = "灵能稳定";
            this.m.Description = "霜之哀伤处于平静状态。";
            this.m.Icon = "el_skills/soul_energy_state_2.png";
            this.m.EL_Stack = 0;
        } 
        else if(percent < 0.9)
        {
            this.m.Name = "灵能充裕";
            this.m.Description = "霜之哀伤满足于你的进献，它向你反馈了一部分力量。";
            this.m.Icon = "el_skills/soul_energy_state_3.png";
            this.m.EL_Stack = 1;
        } 
        else
        {
            this.m.Name = "灵能饱满";
            this.m.Description = "霜之哀伤很满意，但它还是贪婪地向你索求着更多死亡与鲜血。";
            this.m.Icon = "el_skills/soul_energy_state_4.png";
            this.m.EL_Stack = 2;
        }   
		_properties.Initiative += this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.InitiativeOffset;
        _properties.MeleeSkill += this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.MeleeSkillOffset;
        _properties.FatigueEffectMult *= 1.0 + this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.FatigueOnSkillUseOffset;
        _properties.DamageTotalMult *= 1.0 + this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.DamageTotalMult;
        _properties.ActionPoints += this.Math.max(0, this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.ActionPointOffset);
        
        this.World.Assets.m.EL_SoulEnergyGianMult = this.Math.max(1, 1 - this.m.EL_Stack * this.Const.EL_LichKing.SoulEnergyState.SoulEnergyGianMult);
	}

    function onNewDay()
    {
        this.World.Assets.EL_addSoulEnergy(this.Math.ceil(this.World.Assets.EL_getSoulEnergyMax() * 0.04));
    }

});