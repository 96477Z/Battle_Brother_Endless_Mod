this.el_stagnant_spirit_form <- this.inherit("scripts/skills/skill", {
	m = {
        isOpen = false
    },
	function create()
	{
		this.m.ID = "el_actives.stagnant_spirit_form";
		this.m.Name = "开启滞灵姿态";
		this.m.Description = "滞灵姿态会带来强大的魔法控制能力";
		this.m.Icon = "skills/relax_square_bw.png";
		this.m.IconDisabled = "skills/relax_square.png";
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
            text = "攻击型法术会额外附加1个随机负面效果。"
        });
        ret.push({
            id = 7,
            type = "text",
            icon = "ui/icons/special.png",
            text = "施法时有50%效果对范围内的其他目标再次施法。（此效果判定成功时可重复判定）"
        });
		if (!this.m.isOpen)
		{
            ret.push({
                id = 8,
                type = "text",
                icon = "ui/tooltips/warning.png",
                text = "[color=" + this.Const.UI.Color.NegativeValue + "]使用滞灵姿态时会强制退出注魔姿态！[/color]"
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
        if(_skill.m.IsActive && !_skill.m.IsWeaponSkill && _skill.m.IsTargeted && _skill.m.IsAttack && _skill.m.IsRanged && _skill.m.IsIgnoredAsAOO)
        {
            local r = this.Math.rand(0, this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.StagnantSpirit.NegativeEffectList.len() - 1);
            local random_debuff = this.new(this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.StagnantSpirit.NegativeEffectList[r]);
            _targetEntity.getSkills().add(random_debuff);
        }
        if(this.Math.rand(1, 100) <= this.Const.EL_Rarity_Entry.Factor.EL_RadianceOfMagic.StagnantSpirit.MultipleChance)
        {
            local actor = this.getContainer().getActor();
            local targets = this.Tactical.Entities.getAllInstances();
            local affect_targets = [];
            foreach( tar in targets )
            {
                foreach( t in tar )
                {
                    if(t != null && t.isAlliedWith(actor))
                    {
                        break;
                    }
                    if(t != null && !t.isDying() && t.isAlive()) {
                        local distance = actor.getTile().getDistanceTo(t.getTile());
                        if(distance <= _skill.m.MaxRange) {
                            affect_targets.push(t);
                        }
                    }
                }
            }
            local r = this.Math.rand(0, affect_targets.len() - 1);
            _skill.useForFree(affect_targets[r].getTile());
        }
	}

	function onUse( _user, _targetTile )
	{
        this.m.isOpen = true;
        local another_form = this.getContainer().getSkillByID("el_actives.infuse_magic_form");
        another_form.m.isOpen = false;
		return true;
	}

});