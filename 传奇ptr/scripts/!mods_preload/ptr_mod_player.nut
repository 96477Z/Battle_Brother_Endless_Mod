local gt = this.getroottable();

gt.PTR.modPlayer <- function()
{
	::mods_hookExactClass("entity/tactical/player", function(o) {
		o.m.LevelUpsSpent <- 0;

		local setAttributeLevelUpValues = o.setAttributeLevelUpValues;
		o.setAttributeLevelUpValues = function(_v)
		{
			setAttributeLevelUpValues(_v);
			this.m.LevelUpsSpent++;
		}

		o.setStartValuesEx = function( _backgrounds, _addTraits = true, _gender = -1, _addEquipment = true )
		{
			if (this.isSomethingToSee() && this.World.getTime().Days >= 7)
			{
				_backgrounds = this.Const.CharacterPiracyBackgrounds;
			}

			local background = this.new("scripts/skills/backgrounds/" + _backgrounds[this.Math.rand(0, _backgrounds.len() - 1)]);

			if (::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "All")
            {
                background.setGender(_gender);
            }
			this.m.Skills.add(background);

			/*Skill onAdded sets these values
			this.m.Background = background;
			this.m.Ethnicity = this.m.Background.getEthnicity();
			background.buildAttributes();
			*/
			background.buildDescription();

			if (background.isBackgroundType(this.Const.BackgroundType.Female))
			{
				this.setGender(1);
			}
			
			local maxTraits = 0;

			if (this.getFlags().has("PlayerZombie"))
			{
				this.m.StarWeights = background.buildAttributes("zombie", null);
			}
			else if (this.getFlags().has("PlayerSkeleton"))
			{
				this.m.StarWeights = background.buildAttributes("skeleton", null);
			}
			else
			{
				this.m.StarWeights = background.buildAttributes(null, null);
			}

			background.buildDescription();
			local inTraining = this.new("scripts/skills/traits/intensive_training_trait");

			if (!this.getSkills().hasSkill("trait.intensive_training_trait"))
			{
				this.m.Skills.add(inTraining);
			}

			if (_addTraits)
			{
				local maxTraits = 2;
				local traits = [
					background
				];

				if (background.m.IsGuaranteed.len() > 0)
				{
					maxTraits = maxTraits - background.m.IsGuaranteed.len();
					foreach(trait in background.m.IsGuaranteed)
					{
						traits.push(this.new("scripts/skills/traits/" + trait));
					}
				}

				pickTraits( traits, maxTraits );
				
				for( local i = 1; i < traits.len(); i = ++i )
				{
					this.m.Skills.add(traits[i]);

					if (traits[i].getContainer() != null)
					{
						traits[i].addTitle();
					}
				}
			}

			if (_addEquipment)
			{
				background.addEquipment();
			}

			if (this.getFlags().has("PlayerZombie"))
			{
				background.setAppearance("zombie");
			}
			else if (this.getFlags().has("PlayerSkeleton"))
			{
				background.setAppearance("skeleton");
			}
			else
			{
				background.setAppearance();
			}

			background.buildDescription(true);			

			if (_addTraits)
			{
				this.fillTalentValues(3);
				this.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
			}

			local attributes = background.buildPerkTree();

			local b = this.getBaseProperties();

			b.Hitpoints += this.Math.rand(attributes.Hitpoints[0], attributes.Hitpoints[1]);
			b.Bravery += this.Math.rand(attributes.Bravery[0], attributes.Bravery[1]);
			b.Stamina += this.Math.rand(attributes.Stamina[0], attributes.Stamina[1]);
			b.MeleeSkill += this.Math.rand(attributes.MeleeSkill[0], attributes.MeleeSkill[1]);
			b.RangedSkill += this.Math.rand(attributes.RangedSkill[0], attributes.RangedSkill[1]);
			b.MeleeDefense += this.Math.rand(attributes.MeleeDefense[0], attributes.MeleeDefense[1]);
			b.RangedDefense += this.Math.rand(attributes.RangedDefense[0], attributes.RangedDefense[1]);
			b.Initiative += this.Math.rand(attributes.Initiative[0], attributes.Initiative[1]);

			this.m.CurrentProperties = clone b;
			this.m.Skills.update();
			this.setHitpoints(this.m.CurrentProperties.Hitpoints);
		}

		local onHired = o.onHired;
		o.onHired = function()
		{
			onHired();
			if (this.getFlags().has("IsKingsGuard"))
			{
				this.getBackground().removePerk(this.Const.Perks.PerkDefs.PTRPromisedPotential);
			}
		}

		local onSerialize = o.onSerialize;
		o.onSerialize = function( _out )
		{
			onSerialize(_out);
			_out.writeU8(this.m.LevelUpsSpent);
		}

		local onDeserialize = o.onDeserialize;
		o.onDeserialize = function ( _in )
		{
			onDeserialize(_in);
			this.m.LevelUpsSpent = _in.readU8();
		}
	});
}
