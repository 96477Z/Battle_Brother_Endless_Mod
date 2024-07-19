local gt = this.getroottable();

gt.PTR.modCharacterBackground <- function()
{
	gt.PTR.PerkTreeDynamicMins <- {
		//Profession = 1,
		Weapon = 4,
		Defense = 2,
		Traits = 3,
		Enemy = 1,
		EnemyChance = 0.5,
		Class = 1,
		ClassChance = 0.01,
		Magic = 1,
		MagicChance = 0,
		Styles = 2
	};
	gt.PTR.PerkTreeDynamicMinsMagic <- {
		//Profession = 1,
		Weapon = 4,
		Defense = 2,
		Traits = 3,
		Enemy = 1,
		EnemyChance = 0.5,
		Class = 1,
		ClassChance = 0.01,
		Magic = 1,
		MagicChance = 0.001,
		Styles = 2
	};
	gt.PTR.PerkTreeDynamicMinsBeast <- {
		//Profession = 1,
		Weapon = 4,
		Defense = 2,
		Traits = 3,
		Enemy = 1,
		EnemyChance = 0.7,
		Class = 1,
		ClassChance = 0.02,
		Magic = 1,
		MagicChance = 0.001,
		Styles = 2
	};

	this.Const.Perks.TraitsTrees.getBaseAttributes = function()
	{
		return {
			Hitpoints = [
				-1,
				-1
			],
			Bravery = [
				-1,
				-1
			],
			Stamina = [
				-1,
				-1
			],
			MeleeSkill = [
				-1,
				-1
			],
			RangedSkill = [
				-1,
				-1
			],
			MeleeDefense = [
				-1,
				-1
			],
			RangedDefense = [
				-1,
				-1
			],
			Initiative = [
				-1,
				-1
			]
		};
	};

	::mods_hookExactClass("skills/backgrounds/character_background", function(o) {
		o.m.CustomPerkTreeMap <- null;
		o.m.SpecialPerkMultipliers <- [];
		o.m.IsCreatingPerkTree <- false;

		o.buildPerkTree = function()
		{
			local a = {
				Hitpoints = [
					0,
					0
				],
				Bravery = [
					0,
					0
				],
				Stamina = [
					0,
					0
				],
				MeleeSkill = [
					0,
					0
				],
				RangedSkill = [
					0,
					0
				],
				MeleeDefense = [
					0,
					0
				],
				RangedDefense = [
					0,
					0
				],
				Initiative = [
					0,
					0
				]
			};

			if (this.m.PerkTree != null)
			{
				return a;
			}

			if (this.m.CustomPerkTree == null)
			{
				if (::Legends.Mod.ModSettings.getSetting("PerkTrees").getValue())
				{
					local result = this.Const.Perks.GetDynamicPerkTree(this.getPerkTreeDynamicMins(), this.m.PerkTreeDynamic, this.getContainer().getActor());
					this.m.CustomPerkTree = result.Tree;
					a = result.Attributes;
				}
				else
				{
					this.m.CustomPerkTree = this.Const.Perks.DefaultCustomPerkTree;
				}
			}

			local pT = this.Const.Perks.BuildCustomPerkTree(this.m.CustomPerkTree);
			this.m.PerkTree = pT.Tree;
			this.m.PerkTreeMap = pT.Map;

			local origin = this.World.Assets.getOrigin();
			if (origin != null)
			{
				this.World.Assets.getOrigin().onBuildPerkTree(this);
			}

			return a;
		}

		o.hasPerkGroup <- function( _group )
		{
			if (this.m.IsCreatingPerkTree)
			{
				foreach (category in this.m.CustomPerkTreeMap)
				{
					foreach (tree in category)
					{
						if (tree.ID == _group.ID) return true;
					}
				}

				return false;
			}

			foreach (row in _group.Tree)
			{
				foreach (perk in row)
				{
					if (!this.hasPerk(perk)) return false;
				}
			}

			return true;
		}

		local getPerkBackgroundDescription = o.getPerkBackgroundDescription;
		o.getPerkBackgroundDescription = function(_tree)
		{
			if (this.m.CustomPerkTreeMap == null)
			{
				return getPerkBackgroundDescription(_tree);
			}

			local text = "";

			if (!this.getContainer().getActor().isTryoutDone())
			{
				text += "[color=" + this.Const.UI.Color.NegativeValue + "]Try out[/color] this character to reveal [color=" + this.Const.UI.Color.PositiveValue + "]more[/color] information!";			
			}
			else
			{	
				local order = ["Profession", "Traits", "Class", "Weapon", "Styles", "Defense", "Enemy"];

				local treesList = [];
				foreach (categoryName in order)
				{
					if (!(categoryName in this.m.CustomPerkTreeMap))
					{
						continue;
					}

					if (this.m.CustomPerkTreeMap[categoryName].len() == 1 && this.m.CustomPerkTreeMap[categoryName][0].ID == this.Const.Perks.NoTree.ID)
					{
						continue;
					}

					local prefix = "";
					switch (categoryName)
					{
						case "Weapon":
							prefix = "Has an aptitude for";
							break;
						case "Defense":
							prefix = "Likes using";
							break;
						case "Enemy":
							prefix = "Prefers fighting";
							break;
						case "Class":
							prefix = "Is skilled in";
							break;
						case "Profession":
							prefix = this.getContainer().getActor().getName() + " ";
							break;
						case "Styles":
							prefix = "Prefers using"
							break;
						case "Traits":
							prefix = (this.isBackgroundType(this.Const.BackgroundType.Female) ? "She" : "He") + " ";
							break;
					}

					foreach (perkTree in this.m.CustomPerkTreeMap[categoryName])
					{
						if (perkTree.ID == this.Const.Perks.NoTree.ID)
						{
							continue;
						}

						treesList.push(perkTree);
					}				

					text = text + this.getPerkTreeGroupDescription(treesList, prefix);
					treesList.clear();
				}

				foreach (perk in this.Const.Perks.SpecialTrees.Perks)
				{
					if (this.hasPerk(perk.Perk))
					{
						text += perk.Desc + "\n";
					}
				}
			}

			return text;
		}

		o.getPerkTreeDynamicMins = function()
		{
			local mins = this.PTR.PerkTreeDynamicMins;

			if (this.World.Assets.getOrigin().getID() == "scenario.beast_hunters")
			{
				mins = this.PTR.PerkTreeDynamicMinsBeast;
			}
			else if (this.LegendsMod.Configs().LegendMagicEnabled())
			{
				mins = this.PTR.PerkTreeDynamicMinsMagic;
			}

			return mins;
		}

		o.rebuildPerkTree = function (_tree)
		{
			this.m.CustomPerkTree = _tree;

			if (::Legends.Mod.ModSettings.getSetting("PerkTrees").getValue())
			{
				// TODO: Might need looking into to make sure if we should be passing this.m.PerkTreeDynamic or something else
				this.Const.Perks.GetDynamicPerkTree(this.getPerkTreeDynamicMins(), this.m.PerkTreeDynamic, this.getContainer().getActor());
				this.m.CustomPerkTree = this.Const.Perks.MergeDynamicPerkTree(_tree, this.m.CustomPerkTreeMap);
			}

			local pT = this.Const.Perks.BuildCustomPerkTree(this.m.CustomPerkTree);
			this.m.PerkTree = pT.Tree;
			this.m.PerkTreeMap = pT.Map;
		}

		local onSerialize = o.onSerialize;
		o.onSerialize = function(_out)
		{
			onSerialize(_out);

			if(this.m.CustomPerkTreeMap == null)
			{
				_out.writeU8(0);
			}
			else
			{
				_out.writeU8(this.m.CustomPerkTreeMap.len());

				foreach(categoryName, category in this.m.CustomPerkTreeMap)
				{
					_out.writeString(categoryName);
					_out.writeU8(category.len());
					foreach (perkTree in category)
					{
						_out.writeString(perkTree.ID);
					}
				}
			}
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function(_in)
		{
			onDeserialize(_in);

			local mapSize = _in.readU8();
			if (mapSize == 0)
			{
				this.m.CustomPerkTreeMap = null;
			}
			else
			{
				this.m.CustomPerkTreeMap = {};
				for (local i = 0; i < mapSize; i++)
				{
					local categoryName = _in.readString();
					local category = [];

					local categorySize = _in.readU8();
					for (local j = 0; j < categorySize; j++)
					{
						local treeID = _in.readString();
						foreach (t in this.Const.Perks[categoryName + "Trees"].Tree)
						{
							if (t.ID == treeID)
							{
								category.push(t);
							}
						}
					}

					this.m.CustomPerkTreeMap[categoryName] <- category;
				}
			}
		}
	});
}
