local gt = this.getroottable();

gt.PTR.modSkill <- function()
{
	::mods_hookBaseClass("skills/skill", function(o) {
		o = o[o.SuperName];

		o.isDuelistValid <- function()
		{
			return this.isAttack() && !this.isRanged() && this.b.ActionPointCost <= 4 && this.getMaxRange() == 1;
		}

		if (::MSU.SemVer.compareVersionWithOperator(::MSU.Mod, "<", "1.2.0"))
		{
			o.onEquip <- function( _item )
			{
			}

			o.onUnequip <- function( _item )
			{
			}
		}

		local getHitFactors = ::mods_getMember(o, "getHitFactors");
		::mods_override(o, "getHitFactors", function(_targetTile)
		{
			local ret = getHitFactors(_targetTile);
			local targetEntity = _targetTile.IsOccupiedByActor ? _targetTile.getEntity() : null;
			local actor = this.getContainer().getActor();

			if (targetEntity != null)
			{
				if (!this.isRanged())
				{
					local targetPR = targetEntity.getSkills().getSkillByID("perk.ptr_pattern_recognition");
					if (targetPR != null)
					{
						local opponentEntry = targetPR.getOpponentEntry(this.getContainer().getActor().getID());
						if (opponentEntry != null)
						{
							ret.push({
								icon = "ui/tooltips/negative.png",
								text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + targetPR.getBonus(opponentEntry) + "%[/color] Pattern Recognition"
							});
						}
					}
				}			

				local targetSI = targetEntity.getSkills().getSkillByID("perk.ptr_survival_instinct");
				if (targetSI != null)
				{
					local bonus = targetSI.getBonus();
					if (bonus > 0)
					{
						ret.push({
							icon = "ui/tooltips/negative.png",
							text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + targetSI.getBonus() + "%[/color] Survival Instinct"
						});
					}
				}
			}

			return ret;
		});
	});
}
