this.el_total_entry <- this.inherit("scripts/skills/skill", {
	m = {
		EL_EntryNum = 0,
		EL_Hitpoints = 0,
		EL_Stamina = 0,
		EL_Bravery = 0,
		EL_Initiative = 0,
        EL_MeleeSkill = 0,
        EL_RangedSkill = 0,
        EL_MeleeDefense = 0,
        EL_RangedDefense = 0,
		EL_Vision = 0,

        EL_CombatLevel = 0.0,
        EL_ActionPoint = 0,
		EL_FatigueRecover = 0,
		EL_EngrgyShieldCombat = 0,
		EL_EngrgyShield = 0,
		EL_DamageMult = 1.0,
		EL_DamageReceivedMult = 0.0,
		EL_HitpointsRecoveryRate = 0,
        EL_XPGainMult = 0.0,
		EL_Vampire = 0.0,
		EL_Curse = 0.0,
		EL_TargetAttractionMult = 1,
		EL_MeleeRangeMax = 0,
		EL_SaveAmmo = 0.0,
		EL_SpellDamageMult = 1.0,
		EL_ExtraSpellRange = 0,
		EL_FatigueOnSpellUseMult = 1.0,
		EL_ActionPointOnSkillUseDecrease = 0,
		
		EL_DamageMultForNortherner = 1.0,
		EL_DamageReceivedMultForNortherner = 1.0,
		EL_AdditionalAccuracyForNortherner = 0,
		EL_DamageMultForNorthNoble = 1.0,
		EL_DamageReceivedMultForNorthNoble = 1.0,
		EL_AdditionalAccuracyForNorthNoble = 0,
		EL_DamageMultForSoutherner = 1.0,
		EL_DamageReceivedMultForSoutherner = 1.0,
		EL_AdditionalAccuracyForSoutherner = 0,
		EL_DamageMultForSouthNoble = 1.0,
		EL_DamageReceivedMultForSouthNoble = 1.0,
		EL_AdditionalAccuracyForSouthNoble = 0,
		EL_DamageMultForUndead = 1.0,
		EL_DamageReceivedMultForUndead = 1.0,
		EL_AdditionalAccuracyForUndead = 0,
		EL_DamageMultForBeast = 1.0,
		EL_DamageReceivedMultForBeast = 1.0,
		EL_AdditionalAccuracyForBeast = 0,
		EL_DamageMultForGreenskin = 1.0,
		EL_DamageReceivedMultForGreenskin = 1.0,
		EL_AdditionalAccuracyForGreenskin = 0,

		EL_HitpointsRecoverDaliy = 0,
        EL_WeaponConditionRecoverDaliy = 0.0,
        EL_WeaponConditionRecoverRate = 0.0,
		EL_ShieldConditionRecoverDaliy = 0,
        EL_ShieldConditionRecoverRate = 0.0,
		EL_ShieldDamageReceivedMult = 0.0,
		EL_HelmetConditionRecoverDaliy = 0.0,
        EL_HelmetConditionRecoverRate = 0.0,
		EL_HelmetDamageReceivedMult = 1.0,
		EL_HelmetDamageDirectReceivedMult = 1.0,
		EL_HelmetReflectPercent = 0.0,
		EL_ArmorConditionRecoverDaliy = 1.0,
        EL_ArmorConditionRecoverRate = 1.0,
		EL_ArmorDamageReceivedMult = 0.0,
		EL_ArmorDamageDirectReceivedMult = 0.0,
		EL_ArmorReflectPercent = 0.0,

		EL_CheckMorale = false,
		EL_ImmueBleedingPoisonedFireMiasma = false,
		EL_ImmueGrabKnockTwirl = false,
		EL_ImmueOverwhelmDazed = false,
		EL_ImmueStunRootDisarm = false,
		EL_ImmueSurroundedRiposte = false
	},
	function create()
	{
		this.m.ID = "entry/total_entry",
		this.m.Name = "词条总加成";
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.Icon = "el_entrys/el_total_entry.png";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Trait;
		this.m.IsActive = false;
		this.m.IsStacking = false;
	}

    function Init()
	{
		this.m.EL_EntryNum = 0;
		this.m.EL_Hitpoints = 0;
		this.m.EL_Stamina = 0;
		this.m.EL_Bravery = 0;
		this.m.EL_Initiative = 0;
        this.m.EL_MeleeSkill = 0;
        this.m.EL_RangedSkill = 0;
        this.m.EL_MeleeDefense = 0;
        this.m.EL_RangedDefense = 0;
		this.m.EL_Vision = 0;

        this.m.EL_CombatLevel = 0.0;
        this.m.EL_ActionPoint = 0;
		this.m.EL_FatigueRecover = 0;
		this.m.EL_EngrgyShieldCombat = 0;
		this.m.EL_EngrgyShield = 0;
		this.m.EL_DamageMult = 1.0;
		this.m.EL_DamageReceivedMult = 0.0;
		this.m.EL_HitpointsRecoveryRate = 0.0;
        this.m.EL_XPGainMult = 0.0;
		this.m.EL_Vampire = 0.0;
		this.m.EL_Curse = 0.0
		this.m.EL_TargetAttractionMult = 1;
		this.m.EL_MeleeRangeMax = 0;
		this.m.EL_SaveAmmo = 0.0;		
		this.m.EL_SpellDamageMult = 1.0;
		this.m.EL_ExtraSpellRange = 0;
		this.m.EL_FatigueOnSpellUseMult = 1.0;
		this.m.EL_ActionPointOnSkillUseDecrease = 0;
		
		this.m.EL_DamageMultForNortherner = 1.0;
		this.m.EL_DamageReceivedMultForNortherner = 1.0;
		this.m.EL_AdditionalAccuracyForNortherner = 0;
		this.m.EL_DamageMultForNorthNoble = 1.0;
		this.m.EL_DamageReceivedMultForNorthNoble = 1.0;
		this.m.EL_AdditionalAccuracyForNorthNoble = 0;
		this.m.EL_DamageMultForSoutherner = 1.0;
		this.m.EL_DamageReceivedMultForSoutherner = 1.0;
		this.m.EL_AdditionalAccuracyForSoutherner = 0;
		this.m.EL_DamageMultForSouthNoble = 1.0;
		this.m.EL_DamageReceivedMultForSouthNoble = 1.0;
		this.m.EL_AdditionalAccuracyForSouthNoble = 0;
		this.m.EL_DamageMultForUndead = 1.0;
		this.m.EL_DamageReceivedMultForUndead = 1.0;
		this.m.EL_AdditionalAccuracyForUndead = 0;
		this.m.EL_DamageMultForBeast = 1.0;
		this.m.EL_DamageReceivedMultForBeast = 1.0;
		this.m.EL_AdditionalAccuracyForBeast = 0;
		this.m.EL_DamageMultForGreenskin = 1.0;
		this.m.EL_DamageReceivedMultForGreenskin = 1.0;
		this.m.EL_AdditionalAccuracyForGreenskin = 0;

		this.m.EL_HitpointsRecoverDaliy = 0;
        this.m.EL_WeaponConditionRecoverDaliy = 0.0;
        this.m.EL_WeaponConditionRecoverRate = 0.0;
		this.m.EL_ShieldConditionRecoverDaliy = 0.0;
        this.m.EL_ShieldConditionRecoverRate = 0.0;
		this.m.EL_ShieldDamageReceivedMult = 0.0
		this.m.EL_HelmetConditionRecoverDaliy = 0.0;
        this.m.EL_HelmetConditionRecoverRate = 0.0;
		this.m.EL_HelmetDamageReceivedMult = 1.0;
		this.m.EL_HelmetDamageDirectReceivedMult = 1.0;
		this.m.EL_HelmetReflectPercent = 0.0;
		this.m.EL_ArmorConditionRecoverDaliy = 0.0;
        this.m.EL_ArmorConditionRecoverRate = 0.0;
		this.m.EL_ArmorDamageReceivedMult = 1.0;
		this.m.EL_ArmorDamageDirectReceivedMult = 1.0;
		this.m.EL_ArmorReflectPercent = 0.0;

		this.m.EL_CheckMorale = false;
		this.m.EL_ImmueBleedingPoisonedFireMiasma = false;
		this.m.EL_ImmueGrabKnockTwirl = false;
		this.m.EL_ImmueOverwhelmDazed = false;
		this.m.EL_ImmueStunRootDisarm = false;
		this.m.EL_ImmueSurroundedRiposte = false;
	}

	function onAfterUpdate( _properties )
	{
		this.Init();
        local skills = this.getContainer().getActor().getSkills();
        foreach( skill in skills.m.Skills ) {
            if( skill.EL_isEntryEffect() )
            {
                skill.EL_refreshTotalEntry(this);
            }
        }
	}

	function isHidden()
	{
		return this.m.EL_EntryNum == 0;
	}

    function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			}
		];
		if(this.m.EL_Hitpoints)
		{
			result.push({
				id = 10,
				type = "text",
				text = "生命值 + " + this.m.EL_Hitpoints + "%"
			});
		}
		if(this.m.EL_Stamina)
		{
			result.push({
				id = 10,
				type = "text",
				text = "疲劳 + " + this.m.EL_Stamina
			});
		}
		if(this.m.EL_Bravery)
		{
			result.push({
				id = 10,
				type = "text",
				text = "决心 + " + this.m.EL_Bravery
			});
		}
		if(this.m.EL_Initiative)
		{
			result.push({
				id = 10,
				type = "text",
				text = "主动值 + " + this.m.EL_Initiative
			});
		}
		if(this.m.EL_MeleeSkill)
		{
			result.push({
				id = 10,
				type = "text",
				text = "近战技能 + " + this.m.EL_MeleeSkill
			});
		}
		if(this.m.EL_RangedSkill)
		{
			result.push({
				id = 10,
				type = "text",
				text = "远程技能 + " + this.m.EL_RangedSkill
			});
		}
		if(this.m.EL_MeleeDefense)
		{
			result.push({
				id = 10,
				type = "text",
				text = "近战防御 + " + this.m.EL_MeleeDefense
			});
		}
		if(this.m.EL_RangedDefense)
		{
			result.push({
				id = 10,
				type = "text",
				text = "远程防御 + " + this.m.EL_RangedDefense
			});
		}
		if(this.m.EL_Vision)
		{
			result.push({
				id = 10,
				type = "text",
				text = "视野 + " + this.m.EL_Vision
			});
		}
		if(this.m.EL_CombatLevel)
		{
			result.push({
				id = 10,
				type = "text",
				text = "战斗等级 + " + this.m.EL_CombatLevel
			});
		}
		if(this.m.EL_ActionPoint)
		{
			result.push({
				id = 10,
				type = "text",
				text = "行动点 + " + this.m.EL_ActionPoint
			});
		}
		if(this.m.EL_FatigueRecover)
		{
			result.push({
				id = 10,
				type = "text",
				text = "疲劳恢复 + " + this.m.EL_FatigueRecover
			});
		}
		if(this.m.EL_EngrgyShield)
		{
			result.push({
				id = 10,
				type = "text",
				text = "拥有一个能够抵抗伤害的能量盾, 最大层数: " + this.m.EL_EngrgyShield
			});
		}
		if(this.m.EL_DamageMult != 1.0)
		{
			result.push({
				id = 10,
				type = "text",
				text = "攻击伤害 + " + (this.m.EL_DamageMult - 1.0) * 100 + "%"
			});
		}
		if(this.m.EL_DamageReceivedMult)
		{
			result.push({
				id = 10,
				type = "text",
				text = "受到伤害 - " + this.m.EL_DamageReceivedMult + "%"
			});
		}
		if(this.m.EL_HitpointsRecoveryRate)
		{
			result.push({
				id = 10,
				type = "text",
				text = "生命值每回合恢复 + " + this.m.EL_HitpointsRecoveryRate + "%"
			});
		}
		if(this.m.EL_XPGainMult)
		{
			result.push({
				id = 10,
				type = "text",
				text = "经验获取 + " + this.m.EL_XPGainMult + "%"
			});
		}
		if(this.m.EL_Vampire)
		{
			result.push({
				id = 10,
				type = "text",
				text = "造成血量伤害的" + this.m.EL_Vampire + "% 将会恢复自身的生命值"
			});
		}
		if(this.m.EL_Curse)
		{
			result.push({
				id = 10,
				type = "text",
				text = "命中目标会使其本场战斗受到伤害 + " + this.m.EL_Curse + "%"
			});
		}
		if(this.m.EL_TargetAttractionMult > 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "人物仇恨 + " + (this.m.EL_TargetAttractionMult - 1) * 100 + "%"
			});
		}
		else if(this.m.EL_TargetAttractionMult < 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "人物仇恨 - " + (1.0 - this.m.EL_TargetAttractionMult) * 100 + "%"
			});
		}
		if(this.m.EL_MeleeRangeMax)
		{
			result.push({
				id = 10,
				type = "text",
				text = "武器技能射程 + " + this.m.EL_MeleeRangeMax
			});
		}
		if(this.m.EL_SaveAmmo)
		{
			result.push({
				id = 10,
				type = "text",
				text = this.m.EL_SaveAmmo + "% 不消耗弹药"
			});
		}
		if(this.m.EL_SpellDamageMult > 1.0)
		{
			result.push({
				id = 10,
				type = "text",
				text = "法术伤害增加 " + (this.m.EL_SpellDamageMult - 1.0) * 100 + "%"
			});
		}
		if(this.m.EL_ExtraSpellRange)
		{
			result.push({
				id = 10,
				type = "text",
				text = "法术释放范围增加 " + this.m.EL_ExtraSpellRange
			});
		}
		if(this.m.EL_FatigueOnSpellUseMult < 1.0)
		{
			result.push({
				id = 10,
				type = "text",
				text = "释放法术疲劳消耗减少 " + (1.0 - this.m.EL_FatigueOnSpellUseMult) * 100 + "%"
			});
		}
		if(this.m.EL_ActionPointOnSkillUseDecrease)
		{
			result.push({
				id = 10,
				type = "text",
				text = "释放法术行动点消耗减少 " + this.m.EL_ActionPointOnSkillUseDecrease
			});
		}
		if(this.m.EL_DamageMultForNortherner != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对北方强盗和野蛮人 + " + (this.m.EL_DamageMultForNortherner - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForNortherner != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对北方强盗和野蛮人 - " + (1 - this.m.EL_DamageReceivedMultForNortherner) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForNortherner)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对北方强盗和野蛮人 + " + this.m.EL_AdditionalAccuracyForNortherner + "% 命中率"
			});
		}
		if(this.m.EL_DamageMultForNorthNoble != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对北方贵族和村兵 + " + (this.m.EL_DamageMultForNorthNoble - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForNorthNoble != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对北方贵族和村兵 - " + (1 - this.m.EL_DamageReceivedMultForNorthNoble) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForNorthNoble)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对北方贵族和村兵 + " + this.m.EL_AdditionalAccuracyForNorthNoble + "% 命中率"
			});
		}
		if(this.m.EL_DamageMultForSoutherner != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对南方强盗 + " + (this.m.EL_DamageMultForSoutherner - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForSoutherner != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对南方强盗 - " + (1 - this.m.EL_DamageReceivedMultForSoutherner) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForSoutherner)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对南方强盗 + " + this.m.EL_AdditionalAccuracyForSoutherner + "% 命中率"
			});
		}
		if(this.m.EL_DamageMultForSouthNoble != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对南方贵族和村兵 + " + (this.m.EL_DamageMultForSouthNoble - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForSouthNoble != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对南方贵族和村兵 - " + (1 - this.m.EL_DamageReceivedMultForSouthNoble) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForSouthNoble)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对南方贵族和村兵 + " + this.m.EL_AdditionalAccuracyForSouthNoble + "% 命中率"
			});
		}
		if(this.m.EL_DamageMultForUndead != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对亡灵 + " + (this.m.EL_DamageMultForUndead - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForUndead != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对亡灵 - " + (1 - this.m.EL_DamageReceivedMultForUndead) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForUndead)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对亡灵 + " + this.m.EL_AdditionalAccuracyForUndead + "% 命中率"
			});
		}
		if(this.m.EL_DamageMultForBeast != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对野兽 + " + (this.m.EL_DamageMultForBeast - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForBeast != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对野兽 - " + (1 - this.m.EL_DamageReceivedMultForBeast) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForBeast)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对野兽 + " + this.m.EL_AdditionalAccuracyForBeast + "% 命中率"
			});
		}
		if(this.m.EL_DamageMultForGreenskin != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对兽人和哥布林 + " + (this.m.EL_DamageMultForGreenskin - 1) + "% 伤害"
			});
		}
		if(this.m.EL_DamageReceivedMultForGreenskin != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对兽人和哥布林 - " + (1 - this.m.EL_DamageReceivedMultForGreenskin) + "% 受到伤害"
			});
		}
		if(this.m.EL_AdditionalAccuracyForGreenskin)
		{
			result.push({
				id = 10,
				type = "text",
				text = "对兽人和哥布林 + " + this.m.EL_AdditionalAccuracyForGreenskin + "% 命中率"
			});
		}
		if(this.m.EL_HitpointsRecoverDaliy)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每日恢复 + " + this.m.EL_HitpointsRecoverDaliy + "% 生命值"
			});
		}
		if(this.m.EL_WeaponConditionRecoverDaliy)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每日恢复 + " + this.m.EL_WeaponConditionRecoverDaliy + "% 武器耐久"
			});
		}
		if(this.m.EL_WeaponConditionRecoverRate)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每回合恢复 + " + this.m.EL_WeaponConditionRecoverRate + "% 武器耐久"
			});
		}
		if(this.m.EL_ShieldConditionRecoverDaliy)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每日恢复 + " + this.m.EL_ShieldConditionRecoverDaliy + "% 盾牌耐久"
			});
		}
		if(this.m.EL_ShieldConditionRecoverRate)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每回合恢复 + " + this.m.EL_ShieldConditionRecoverRate + "% 盾牌耐久"
			});
		}
		if(this.m.EL_ShieldDamageReceivedMult)
		{
			result.push({
				id = 10,
				type = "text",
				text = "承受劈盾伤害 - " + this.m.EL_ShieldDamageReceivedMult
			});
		}
		if(this.m.EL_HelmetConditionRecoverDaliy)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每日恢复 + " + this.m.EL_HelmetConditionRecoverDaliy + "% 头盔耐久"
			});
		}
		if(this.m.EL_HelmetConditionRecoverRate)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每回合恢复 + " + this.m.EL_HelmetConditionRecoverRate + "% 头盔耐久"
			});
		}
		if(this.m.EL_HelmetDamageReceivedMult != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "头部护甲受到伤害 - " + this.Math.round((1.0 - this.m.EL_HelmetDamageReceivedMult) * 10000) * 0.01 + "%"
			});
		}
		if(this.m.EL_HelmetDamageDirectReceivedMult != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "减少头部受到的忽视护甲伤害" + this.Math.round((1.0 - this.m.EL_HelmetDamageDirectReceivedMult) * 10000) * 0.01 + "%"
			});
		}
		if(this.m.EL_HelmetReflectPercent)
		{
			result.push({
				id = 10,
				type = "text",
				text = "反弹 " + this.m.EL_HelmetReflectPercent + "%头部护甲受到的伤害"
			});
		}
		if(this.m.EL_ArmorConditionRecoverDaliy)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每日恢复 + " + this.m.EL_ArmorConditionRecoverDaliy + "% 身体耐久"
			});
		}
		if(this.m.EL_ArmorConditionRecoverRate)
		{
			result.push({
				id = 10,
				type = "text",
				text = "每回合恢复 + " + this.m.EL_ArmorConditionRecoverRate + "% 身体耐久"
			});
		}
		if(this.m.EL_ArmorDamageReceivedMult != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "身体护甲受到伤害 - " + this.Math.round((1.0 - this.m.EL_ArmorDamageReceivedMult) * 10000) * 0.01 + "%"
			});
		}
		if(this.m.EL_ArmorDamageDirectReceivedMult != 1)
		{
			result.push({
				id = 10,
				type = "text",
				text = "减少身体受到的忽视护甲伤害" + this.Math.round((1.0 - this.m.EL_ArmorDamageDirectReceivedMult) * 10000) * 0.01 + "%"
			});
		}
		if(this.m.EL_ArmorReflectPercent)
		{
			result.push({
				id = 10,
				type = "text",
				text = "反弹 " + this.m.EL_ArmorReflectPercent + "%身体护甲受到的伤害"
			});
		}



		if(this.m.EL_CheckMorale)
		{
			result.push({
				id = 10,
				type = "text",
				text = "命中目标时，根据敌我决心差使其进行一次士气降低判定"
			});
		}
		if(this.m.EL_ImmueBleedingPoisonedFireMiasma)
		{
			result.push({
				id = 10,
				type = "text",
				text = "免疫流血，中毒，火焰，瘴气"
			});
		}
		if(this.m.EL_ImmueGrabKnockTwirl)
		{
			result.push({
				id = 10,
				type = "text",
				text = "免疫抓取，击退，旋转"
			});
		}
		if(this.m.EL_ImmueOverwhelmDazed)
		{
			result.push({
				id = 10,
				type = "text",
				text = "免疫压制，茫然"
			});
		}
		if(this.m.EL_ImmueStunRootDisarm)
		{
			result.push({
				id = 10,
				type = "text",
				text = "免疫眩晕，定身，缴械"
			});
		}
		if(this.m.EL_ImmueSurroundedRiposte)
		{
			result.push({
				id = 10,
				type = "text",
				text = "免疫包围，反击"
			});
		}
		return result;
	}
});