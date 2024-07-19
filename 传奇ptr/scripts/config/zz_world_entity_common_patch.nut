local gt = this.getroottable();

gt.Const.World.Common.addUnitsToCombat = function ( _into, _partyList, _resources, _faction, _minibossify = 0 )
{
	local p;

	if (typeof _partyList == "table")
	{
		p = this.Const.World.Common.buildDynamicTroopList(_partyList, _resources);
	}
	else
	{
		local total_weight = 0;
		local potential = [];

		foreach( party in _partyList )
		{
			if (party.Cost < _resources * 0.7)
			{
				continue;
			}

			if (party.Cost > _resources)
			{
				break;
			}

			potential.push(party);
			total_weight = total_weight + party.Cost;
		}

		if (potential.len() == 0)
		{
			local best;
			local bestCost = 9000;

			foreach( party in _partyList )
			{
				if (this.Math.abs(_resources - party.Cost) <= bestCost)
				{
					best = party;
					bestCost = this.Math.abs(_resources - party.Cost);
				}
			}

			p = best;
		}
		else
		{
			local pick = this.Math.rand(1, total_weight);

			foreach( party in potential )
			{
				if (pick <= party.Cost)
				{
					p = party;
					break;
				}

				pick = pick - party.Cost;
			}
		}
	}

	local troopMbMap = {};

	foreach( t in p.Troops )
	{
		local key = "Enemy" + t.Type.ID;

		if (!(key in troopMbMap))
		{
			troopMbMap[key] <- this.Const.LegendMod.GetFavEnemyBossChance(t.Type.ID);
		}

		local mb = troopMbMap[key];
		mb = mb + _minibossify;

		for( local i = 0; i != t.Num; i = i )
		{
			local unit = clone t.Type;
			unit.Faction <- _faction;
			unit.Name <- "";

			if (unit.Variant > 0)
			{
				local upperBound = "DieRoll" in unit ? unit.DieRoll : 100;

				if (!this.Const.DLC.Wildmen || this.Math.rand(1, upperBound) > unit.Variant + mb + (this.World.getTime().Days > 100 ? 0 : -1))
				{
					unit.Variant = 0;
				}
				else
				{
					unit.Strength = this.Math.round(unit.Strength * 1.35);
					unit.Variant = this.Math.rand(1, 255);
					if ("NameList" in unit)
					{
//add by bigmap

						unit.Name = this.generateName(unit.NameList) + (unit.TitleList != null ? " " + unit.TitleList[this.Math.rand(0, unit.TitleList.len() - 1)] : "");
//						unit.Name = this.generateName(unit.Type.NameList) + (unit.Type.TitleList != null ? " " + unit.Type.TitleList[this.Math.rand(0, unit.Type.TitleList.len() - 1)] : "");
						this.logDebug("addUnitsToCombat---------------unit.Name:  " + unit.Name);
					}
				}
			}

			_into.push(unit);
			i = ++i;
		}
	}
};
