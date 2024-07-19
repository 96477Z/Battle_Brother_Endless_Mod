local gt = this.getroottable();

gt.PTR.modSettlement <- function()
{
	::mods_hookExactClass("entity/world/settlement", function(o) {
		local onEnter = o.onEnter;
		o.onEnter = function()
		{
			local ret = onEnter();

			if (ret)
			{
				local roster = this.World.getPlayerRoster().getAll();
				local moneyToAdd = 0;
				foreach (bro in roster)
				{
					local perk = bro.getSkills().getSkillByID("perk.ptr_always_an_entertainer");
					if (perk != null && !perk.m.IsSpent)
					{
						if (moneyToAdd == 0)
						{
							moneyToAdd += perk.earnMoneyFromSettlement(this);
						}

						perk.addSettlementVisited(this);
					}

					local familyTies = bro.getSkills().getSkillByID("perk.ptr_family_ties");
					if (familyTies != null && !familyTies.m.IsSpent)
					{
						familyTies.improveRelations(this);
					}
				}

				this.World.Assets.addMoney(moneyToAdd);
			}

			return ret;
		}
	});
}
