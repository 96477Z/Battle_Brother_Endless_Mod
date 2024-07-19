this.perk_ptr_promised_potential <- this.inherit("scripts/skills/skill", {
	m = {
		StatBoost = 15,
		ChanceToSucceed = 50,
		IsSet = false,
		IsSpent = false,
		WillSucceed = true,
		IsVisualsUpdated = false
	},
	function create()
	{
		this.m.ID = "perk.ptr_promised_potential";
		this.m.Name = this.Const.Strings.PerkName.PTRPromisedPotential;
		this.m.Description = this.Const.Strings.PerkDescription.PTRPromisedPotential;
		this.m.Icon = "ui/perks/ptr_promised_potential.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function updatePerkVisuals()
	{
		foreach (perk in this.getContainer().getActor().getBackground().m.PerkTree[0])
		{
			if (perk.ID == "perk.ptr_promised_potential")
			{
				if (this.m.WillSucceed)
				{
					perk.Name = "Realized Potential";
					perk.Icon = "ui/perks/ptr_realized_potential.png";
					perk.Tooltip = this.Const.Strings.PerkDescription.PTRRealizedPotential;
					break;
				}
				else
				{
					perk.Name = "Failed Potential";
					perk.Icon = "ui/perks/ptr_failed_potential.png";
					perk.Tooltip = this.Const.Strings.PerkDescription.PTRFailedPotential;
				}
			}
		}

		this.m.IsVisualsUpdated = true;
	}

	function onUpdate(_properties)
	{
		if (this.m.IsSpent && !this.m.IsVisualsUpdated)
		{
			this.updatePerkVisuals();
		}
	}

	function onUpdateLevel()
	{
		local actor = this.getContainer().getActor();
		if (actor.m.Level == 11 || actor.m.Level == 7 && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.getBackground().getID() == "background.slave")
		{
			if (!this.m.IsSpent)
			{
				this.m.IsSpent = true;

				if (this.m.WillSucceed)
				{
					++actor.m.PerkPoints;

					local bg = actor.getBackground();
					local b = actor.getBaseProperties();

					b.DailyWageMult *= 2;
					b.MeleeSkill += this.m.StatBoost;
					b.MeleeDefense += this.m.StatBoost;
					b.RangedSkill += this.m.StatBoost;
					b.RangedDefense += this.m.StatBoost;
					b.Hitpoints += this.m.StatBoost;
					b.Stamina += this.m.StatBoost;
					b.Initiative += this.m.StatBoost;
					b.Bravery += this.m.StatBoost;
					
					bg.m.Description += " Once a dreg of society, with your help, " + actor.getNameOnly() + " has grown into a full-fledged mercenary.";
					bg.m.RawDescription += " Once a dreg of society, with your help, %name% has grown into a full-fledged mercenary.";

					local getExclude = function( _treeList )
					{
						local exclude = [];
						foreach (tree in _treeList)
						{
							foreach (category in bg.m.CustomPerkTreeMap)
							{
								foreach (treeInMap in category)
								{
									if (treeInMap.ID == tree.ID)
									{
										exclude.push(tree.ID);
									}
								}
							}
						}

						return exclude;
					}

					local traitsExclude = getExclude(this.Const.Perks.TraitsTrees.Tree);			
					traitsExclude.push(this.Const.Perks.TalentedTree.ID);
					local traitTree = ::MSU.Array.rand(::Const.Perks.TraitsTrees.Tree.filter(@(idx, tree) traitsExclude.find(tree.ID) == null));
					if (traitTree != null)
					{
						bg.addPerkGroup(traitTree.Tree);
					}

					local weaponExclude = getExclude(this.Const.Perks.WeaponTrees.Tree);	
					local weaponTree = ::MSU.Array.rand(::Const.Perks.WeaponTrees.Tree.filter(@(idx, tree) weaponExclude.find(tree.ID) == null));
					if (weaponTree != null)
					{
						bg.addPerkGroup(weaponTree.Tree);
						weaponExclude.push(weaponTree.ID);
						local weaponTree2 = ::MSU.Array.rand(::Const.Perks.WeaponTrees.Tree.filter(@(idx, tree) weaponExclude.find(tree.ID) == null));
						if (weaponTree2 != null)
						{
							bg.addPerkGroup(weaponTree2.Tree);
						}
					}

					local perksToRemove = [];
					foreach (row in bg.m.CustomPerkTree)
					{
						for (local i = row.len() - 1; i > 12; i--)
						{
							perksToRemove.push(row[i]);
						}
					}

					foreach (perk in perksToRemove)
					{
						bg.removePerk(perk);
					}

					local row = 0;
					foreach (perk in perksToRemove)
					{
						while (row < 7)
						{
							if (bg.m.CustomPerkTree[row].len() < 13)
							{
								bg.addPerk(perk, row);
								break;
							}
							else
							{
								row++;
							}
						}
					}

					actor.resetPerks();

					actor.improveMood(1.0, "Realized potential");
				}
				else
				{
					this.updatePerkVisuals();
				}
			}
		}
	}

	function onAdded()
	{
		if (this.m.IsSet || !this.getContainer().getActor().isPlayerControlled())
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (this.Math.rand(1, 100) > this.m.ChanceToSucceed - (this.getContainer().getActor().getPerkPointsSpent() * 10))
		{
			this.m.WillSucceed = false;
		}

		this.m.IsSet = true;
	}

	function onSerialize(_out)
	{
		this.skill.onSerialize(_out);
		_out.writeBool(this.m.IsSpent);
		_out.writeBool(this.m.WillSucceed);
	}

	function onDeserialize(_in)
	{
		this.skill.onDeserialize(_in);

		this.m.IsSet = true;
		this.m.IsSpent = _in.readBool();
		this.m.WillSucceed = _in.readBool();
	}
});
