this.ptr_immersive_damage_effect <- this.inherit("scripts/skills/skill", {
	m = {
		DamageMult = 1.0,
		Roll = 0,		
		IsUpdating = false,		
	},
	function create()
	{
		this.m.ID = "effects.ptr_immersive_damage";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "";		
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;		
	}

	function getMult()
	{
		return this.m.DamageMult;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || !_skill.isAttack() || this.m.IsUpdating)
		{
			return;
		}

		this.m.DamageMult = this.PTR.ImmersiveDamage.MaxDamageMult;		

		this.m.Roll = this.Math.rand(1, 100);
		if (this.m.Roll > 100 - this.PTR.ImmersiveDamage.ChanceCriticalFailure)
		{
			this.m.DamageMult = this.PTR.ImmersiveDamage.MinDamageMult;
		}
		else
		{	
			local half = this.PTR.ImmersiveDamage.ChanceFullDamage / 2.0;
			if (this.m.Roll < 50 - half || this.m.Roll > 50 + half)
			{
				this.m.IsUpdating = true;
				local stdev = this.Math.min(this.PTR.ImmersiveDamage.MaxHitChance, this.Math.max(this.PTR.ImmersiveDamage.MinHitChance, _skill.getHitchance(_targetEntity)));
				this.m.IsUpdating = false;

				this.m.DamageMult = this.Math.maxf(this.PTR.ImmersiveDamage.MinDamageMult, this.MSU.Math.normalDistNorm(this.m.Roll, 50, stdev));
			}
		}

		_properties.DamageTotalMult *= this.m.DamageMult;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || this.getContainer().getActor().isHiddenToPlayer() || !_targetEntity.getTile().IsVisibleForPlayer)
		{
			return;
		}

		local goodness = (this.m.DamageMult - this.PTR.ImmersiveDamage.MinDamageMult) / (this.PTR.ImmersiveDamage.MaxDamageMult - this.PTR.ImmersiveDamage.MinDamageMult);

		local key = "";
		foreach (g in this.PTR.ImmersiveDamage.GoodnessThresholds)
		{
			if (goodness >= this.PTR.ImmersiveDamage.GoodnessThreshold[g].Threshold)
			{
				key = g;
				break;
			}
		}

		local fluff = _skill.isRanged() ? this.PTR.ImmersiveDamage.GoodnessThreshold[key].FluffRanged : this.PTR.ImmersiveDamage.GoodnessThreshold[key].FluffMelee;

		local fluffString = fluff.len() > 0 ? fluff[this.Math.rand(0, fluff.len() - 1)] : "";

		fluffString += this.m.DamageMult < 1.0 ? " dealing [color=" + this.Const.UI.Color.NegativeValue + "]" + this.Math.floor((1.0 - this.m.DamageMult) * 100) + "%[/color] reduced damage!" : " dealing [color=" + this.Const.UI.Color.PositiveValue + "]no[/color] reduced damage!"

		fluffString = this.MSU.String.replace(fluffString, "target", _targetEntity.getName());
		
		this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + fluffString);
	}
});
