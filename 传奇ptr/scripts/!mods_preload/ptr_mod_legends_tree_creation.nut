local gt = this.getroottable();

gt.PTR.modLegendsPerkTreeCreationSystem <- function()
{
	gt.Const.Perks.RandomTree <- {ID = "RandomTree"};
	gt.Const.Perks.NoTree <- {
		ID = "NoTree",
		Descriptions = [
			""
		],
		Tree = [
			[],	[],	[],	[], [], [],	[]
		]
	};

	::Const.Perks.OrderOfAssignment <- ["Profession", "Enemy", "Traits", "Class", "Defense", "Weapon", "Styles"];

	gt.Const.Perks.PerkTreeMinsChances <- {
		Enemy1 = 95,
		Enemy2 = 4,
		Enemy3 = 1
	};

	gt.Const.Perks.TalentMultipliers <- array(::Const.Attributes.COUNT);

	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.Hitpoints] = [
		[2, ::Const.Perks.LargeTree],
		[2, ::Const.Perks.SturdyTree]
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.Bravery] = [
		[2, ::Const.Perks.CalmTree],
		[2, ::Const.Perks.SergeantClassTree],
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.Fatigue] = [
		[1.33, ::Const.Perks.HeavyArmorTree]
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.Initiative] = [
		[2, ::Const.Perks.LightArmorTree],
		[2, ::Const.Perks.SwordTree]
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.MeleeSkill] = [
		[0.5, ::Const.Perks.BowTree],
		[0.5, ::Const.Perks.CrossbowTree],
		[0.5, ::Const.Perks.SlingTree],
		[0.5, ::Const.Perks.RangedTree]
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.RangedSkill] = [
		[2, ::Const.Perks.BowTree],
		[2, ::Const.Perks.CrossbowTree],
		[2, ::Const.Perks.SlingTree],
		[1.5, ::Const.Perks.ThrowingTree],
		[2, ::Const.Perks.RangedTree]
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.MeleeDefense] = [
		[2, ::Const.Perks.TrainedTree]
	];
	gt.Const.Perks.TalentMultipliers[this.Const.Attributes.RangedDefense] = [
		[2, ::Const.Perks.FastTree]
	];

	gt.Const.Perks.GetDynamicPerkTree = function ( _mins, _map, _player )
	{
		if (!("PerkGroupMultipliers" in _player.getBackground().m))
		{
			local PTRMap = {};
			_player.getBackground().m.PerkGroupMultipliers <- [];

			foreach (categoryName, treeList in _map)
			{
				local PTRCategory = [];
				foreach (tree in treeList)
				{
					switch (tree.ID)
					{
						case "InspirationalTree":
							PTRCategory.push(::Const.Perks.SergeantClassTree);
							break;

						case "MartyrTree":
							PTRCategory.push(::Const.Perks.ResilientTree);
							break;

						default:
							PTRCategory.push(tree);
					}
				}

				PTRMap[categoryName] <- PTRCategory;
			}

			_map = PTRMap;
		}

		// length 11
		local dynamicTree = [
			[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[]
		];

		foreach (categoryName, treeContainersInCategory in _map)
		{
			foreach (treeContainer in treeContainersInCategory)
			{
				if (typeof treeContainer != "table" && (typeof treeContainer != "instance" || !(treeContainer instanceof ::MSU.Class.WeightedContainer)))
				{
					this.logError("GetDynamicPerkTree: Background " + _player.getBackground().getID() + " has wrongly formatted dynamic perk tree -- Category: " + categoryName);
				}
			}
		}

		local attributes = this.Const.Perks.TraitsTrees.getBaseAttributes();
		local characterTraits = _player == null ? null : _player.getSkills().getSkillsByFunction(@(skill) skill.m.Type == ::Const.SkillType.Trait);

		if (_player.getBackground().m.CustomPerkTreeMap == null) _player.getBackground().m.CustomPerkTreeMap = {};
		local localMap = _player.getBackground().m.CustomPerkTreeMap;
		_player.getBackground().m.IsCreatingPerkTree = true;


		local applyMultipliers = function( _multipliersList, _treeContainer )
		{
			foreach (multiplier in _multipliersList)
			{
				local tree = multiplier[1];
				if (_treeContainer.contains(tree))
				{
					if (multiplier[0] == 0) _treeContainer.setWeight(tree, 0);
					else
					{
						if (_treeContainer.getWeight(tree) > 0) _treeContainer.setWeight(tree, _treeContainer.getWeight(tree) * multiplier[0]);
					}
				}
			}
		}

		local applyMultipliersBasedOnAssignedCategories = function( _treeContainer )
		{
			foreach (categoryName, treesInCategory in localMap)
			{
				foreach (tree in treesInCategory)
				{
					if ("PerkGroupMultipliers" in tree)
					{	
						applyMultipliers(tree.PerkGroupMultipliers, _treeContainer);
					}
				}
			}

			return _treeContainer;
		}

		local applyMultipliersBasedOnEquipment = function ( _treeContainer )
		{
			local weapon = _player.getMainhandItem();
			if (weapon == null)	return;

			local trees = [];

			foreach (weaponTypeName, weaponType in ::Const.Items.WeaponType)
			{
				local treeName = weaponTypeName + "Tree";
				if (weapon.isWeaponType(weaponType) && (treeName in ::Const.Perks))
				{
					trees.push(::Const.Perks[treeName]);
				}
			}

			if (trees.len() > 0)
			{
				applyMultipliers([[-1, ::MSU.Array.rand(trees)]], _treeContainer);
			}
		}

		local applyMultipliersBasedOnTalents = function( _treeContainer )
		{
			if (_player.getTalents().len() == 0) return;

			local talents = _player.getTalents();

			local multipliers = [];

			for (local attribute = 0; attribute < this.Const.Attributes.COUNT; attribute++)
			{
				if (talents[attribute] == 0) continue;

				foreach (mult in ::Const.Perks.TalentMultipliers[attribute])
				{
					multipliers.push(
						[mult[0] < 1 ? mult[0] / talents[attribute] : mult[0] * talents[attribute], mult[1]]
					);
				}
			}
			
			applyMultipliers(multipliers, _treeContainer);
		}

		local applyMultipliersBasedOnTraits = function( _treeContainer )
		{	
			local multipliers = [];

			foreach (trait in characterTraits)
			{
				multipliers.extend(trait.m.PerkGroupMultipliers);
			}

			applyMultipliers(multipliers, _treeContainer);
		}

		local getWeightedRandomTreeFromCategory = function(_categoryName, _exclude = null)
		{
			local potentialTrees = ::MSU.Class.WeightedContainer();

			foreach (tree in gt.Const.Perks[_categoryName + "Trees"].Tree)
			{
				if (_exclude != null && _exclude.find(tree.ID) != null)	continue;

				local weight = 1;
				if ("SelfWeightMultiplier" in tree)
				{
					weight *= tree.SelfWeightMultiplier;
				}

				potentialTrees.add(tree, weight);
			}

			if (potentialTrees.len() != 0)
			{
				applyMultipliersBasedOnAssignedCategories(potentialTrees);
				applyMultipliers(_player.getBackground().m.PerkGroupMultipliers, potentialTrees);
				applyMultipliersBasedOnTraits(potentialTrees);
				applyMultipliersBasedOnTalents(potentialTrees);
				applyMultipliersBasedOnEquipment(potentialTrees);		
			}

			local tree = potentialTrees.roll();
			return tree != null ? tree : ::Const.Perks.NoTree;
		}

		local addTreesFromMapCategory = function( _categoryName )
		{
			local treeContainersInCategory = _map[_categoryName];

			local exclude = [];
			foreach (tree in localMap[_categoryName])
			{
				exclude.push(tree.ID);
			}

			foreach (treeContainer in treeContainersInCategory)
			{
				local tree;

				if (typeof treeContainer == "table")
				{
					tree = treeContainer;
				}
				else
				{
					if (treeContainer.len() == 1)
					{
						tree = treeContainer.rand();
					}
					else
					{
						applyMultipliersBasedOnAssignedCategories(treeContainer);
						applyMultipliers(_player.getBackground().m.PerkGroupMultipliers, treeContainer);
						applyMultipliersBasedOnTraits(treeContainer);
						applyMultipliersBasedOnTalents(treeContainer);
						applyMultipliersBasedOnEquipment(treeContainer);

						tree = treeContainer.roll();

						if (tree == ::Const.Perks.RandomTree)
						{
							tree = getWeightedRandomTreeFromCategory(_categoryName, exclude);
						}
						else if (tree == null) tree = ::Const.Perks.NoTree;
					}
				}

				localMap[_categoryName].push(tree);
				if (tree.ID != ::Const.Perks.NoTree.ID) exclude.push(tree.ID);
			}
		}

		local assignMins = function(_categoryName)
		{
			local exclude = [];
			foreach (tree in localMap[_categoryName])
			{
				exclude.push(tree.ID);
			}

			local r = ::Math.rand(0, 100);
			for (local i = localMap[_categoryName].len(); i < _mins[_categoryName]; i++)
			{
				if (_categoryName == "Enemy")
				{
					if ((i == 0 && r > ::Const.Perks.PerkTreeMinsChances.Enemy1) || (i == 1 && r > ::Const.Perks.PerkTreeMinsChances.Enemy2) || (i == 2 && r > ::Const.Perks.PerkTreeMinsChances.Enemy3))
					{
						continue;
					}
				}

				if (_categoryName == "Magic" && r > _mins.MagicChance * 100.0)
				{
					continue;
				}

				local t = getWeightedRandomTreeFromCategory(_categoryName, exclude);
				localMap[_categoryName].push(t);
				exclude.push(t.ID);
			}
		}

		foreach (categoryName in ::Const.Perks.OrderOfAssignment)
		{
			if (!(categoryName in localMap))
			{
				localMap[categoryName] <- [];
			}

			if (categoryName in _map)
			{
				addTreesFromMapCategory(categoryName);
			}

			if (categoryName in _mins)
			{
				if (categoryName == "Styles")
				{
					local hasRangedWeaponTree = false;
					local hasMeleeWeaponTree = false;
					foreach (tree in localMap.Weapon)
					{
						if (!hasRangedWeaponTree && this.Const.Perks.RangedWeaponTrees.Tree.find(tree) != null)
						{
							hasRangedWeaponTree = true;
							continue;
						}
						if (!hasMeleeWeaponTree && this.Const.Perks.MeleeWeaponTrees.Tree.find(tree) != null)
						{
							hasMeleeWeaponTree = true;
						}
					}

					if (!hasRangedWeaponTree)
					{
						_player.getBackground().m.PerkGroupMultipliers.push([0, ::Const.Perks.RangedTree]);
					}
					if (!hasMeleeWeaponTree)
					{
						_player.getBackground().m.PerkGroupMultipliers.push([0, ::Const.Perks.OneHandedTree]);
						_player.getBackground().m.PerkGroupMultipliers.push([0, ::Const.Perks.TwoHandedTree]);
					}
				}

				assignMins(categoryName);
			}
		}

		foreach (categoryName, category in localMap)
		{
			foreach (tree in category)
			{
				foreach (rowNumber, perksInRow in tree.Tree)
				{
					foreach (perk in perksInRow)
					{
						dynamicTree[rowNumber].push(perk);
					}
				}
			}
		}

		foreach (tree in localMap.Traits)
		{
			if ("Attributes" in tree)
			{
				local c = tree.Attributes;
				attributes.Hitpoints[0] += c.Hitpoints[0];
				attributes.Hitpoints[1] += c.Hitpoints[1];
				attributes.Bravery[0] += c.Bravery[0];
				attributes.Bravery[1] += c.Bravery[1];
				attributes.Stamina[0] += c.Stamina[0];
				attributes.Stamina[1] += c.Stamina[1];
				attributes.MeleeSkill[0] += c.MeleeSkill[0];
				attributes.MeleeSkill[1] += c.MeleeSkill[1];
				attributes.MeleeDefense[0] += c.MeleeDefense[0];
				attributes.MeleeDefense[1] += c.MeleeDefense[1];
				attributes.RangedSkill[0] += c.RangedSkill[0];
				attributes.RangedSkill[1] += c.RangedSkill[1];
				attributes.RangedDefense[0] += c.RangedDefense[0];
				attributes.RangedDefense[1] += c.RangedDefense[1];
				attributes.Initiative[0] += c.Initiative[0];
				attributes.Initiative[1] += c.Initiative[1];
			}
		}

		foreach (perk in ::Const.Perks.SpecialTrees.Perks)
		{
			local chance = perk.Func(_player, perk.Chance);

			// if (chance == 0) continue;

			foreach (multiplier in _player.getBackground().m.SpecialPerkMultipliers)
			{
				if (multiplier[1] == perk.Perk)
				{
					if (multiplier[0] < 0) chance = multiplier[0];
					else chance *= multiplier[0];
					break;
				}
			}

			if (chance == 0) continue;

			foreach (trait in characterTraits)
			{
				foreach (multiplier in trait.m.SpecialPerkMultipliers)
				{
					if (multiplier[1] == perk.Perk)
					{
						if (multiplier[0] < 0) chance = multiplier[0];
						else chance *= multiplier[0];
						break;
					}
				}
			}

			if (chance == 0) continue;

			foreach (category in localMap)
			{
				foreach (tree in category)
				{
					if ("SpecialPerkMultipliers" in tree)
					{
						foreach (multiplier in tree.SpecialPerkMultipliers)
						{
							if (multiplier[1] == perk.Perk)
							{
								if (multiplier[0] < 0) chance = multiplier[0];
								else chance *= multiplier[0];
								break;
							}
						}
					}
				}
			}

			if (chance < 0 || ::Math.rand(1, 100) <= chance)
			{
				local hasRow = false;
				local direction = -1;
				local row = perk.Row;

				while (row >= 0 && row <= 6)
				{
					if (dynamicTree[row].len() < 13)
					{
						hasRow = true;
						break;
					}

					row += direction;

					if (row == -1)
					{
						row = perk.Row;
						direction = 1;
					}
				}

				row = hasRow ? this.Math.max(0, this.Math.min(row, 6)) : perk.Row;

				dynamicTree[row].push(perk.Perk);
			}
		}

		_player.getBackground().m.IsCreatingPerkTree = false;

		return {
			Tree = dynamicTree,
			Attributes = attributes
		};
	};

	gt.Const.Perks.MergeDynamicPerkTree <- function(_tree, _map)
	{
		foreach( categoryName, category in _map )
		{
			foreach( treeEntry in category )
			{
				foreach( rowNumber, perksInRow in treeEntry.Tree )
				{
					foreach( perk in perksInRow )
					{
						if (this.Const.Perks.isInTree(_tree, perk))
						{
							continue;
						}

						_tree[rowNumber].push(perk);
					}
				}
			}
		}

		return _tree;
	}
}
