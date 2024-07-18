this.perk_ptr_nailed_it <- this.inherit("scripts/skills/skill", {
	m = {
		BaseBonus = 25,
		BonusDecreasePerTile = 5
	},
	function create()
	{
		this.m.ID = "perk.ptr_nailed_it";
		this.m.Name = this.Const.Strings.PerkName.PTRNailedIt;
		this.m.Description = this.Const.Strings.PerkDescription.PTRNailedIt;
		this.m.Icon = "ui/perks/ptr_nailed_it.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (!_skill.isAttack() || !_skill.isRanged() || _targetEntity == null)
		{
			return;
		}

		local myTile = this.getContainer().getActor().getTile();
		local targetTile = _targetEntity.getTile();

		if (myTile != null && targetTile != null)
		{
			_properties.HitChance[this.Const.BodyPart.Head] += this.Math.max(0, this.m.BaseBonus - this.m.BonusDecreasePerTile * targetTile.getDistanceTo(myTile));
		}
	}
});
