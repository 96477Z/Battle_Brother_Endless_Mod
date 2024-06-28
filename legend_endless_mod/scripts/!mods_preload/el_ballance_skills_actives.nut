local gt = getroottable();

::mods_registerMod("el_ballance_skills_actives", 1, "el_ballance_skills_actives");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/actives/ghastly_touch", function ( o )
	{
		o.onUse = function( _user, _targetTile )
		{
            local target = _targetTile.getEntity();
			local ret = this.attackEntity(_user, target);

            if(target == null || target.isDying() || !target.isAlive()) {
                return ret;
            }
			if(ret == true) {
				local difficulty = -_user.getBravery() +
								   this.Const.EL_NPCOther.EL_Ghost.GhastlyTouch.BaseOffset +
								   this.Const.EL_NPCOther.EL_Ghost.GhastlyTouch.RankFactor * (target.EL_getRankLevel() - _user.EL_getRankLevel()) +
								   this.Math.pow(this.Const.EL_NPCOther.EL_Ghost.GhastlyTouch.CombatLevelFactor, this.Math.abs(target.EL_getCombatLevel() - _user.EL_getCombatLevel())) * (target.EL_getCombatLevel() - _user.EL_getCombatLevel());
				_targetTile.getEntity().checkMorale(-1, difficulty, this.Const.MoraleCheckType.MentalAttack);
			}
			return ret;
		}
	});

	::mods_hookExactClass("skills/actives/horrific_scream", function ( o )
	{
		o.onUse = function( _user, _targetTile )
		{
			if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Horrific Scream");
			}
			local target = _targetTile.getEntity();
			local difficulty = -_user.getBravery() +
							   this.Const.EL_NPCOther.EL_Ghost.HrrificScream.BaseOffset +
							   this.Const.EL_NPCOther.EL_Ghost.HrrificScream.RankFactor * (target.EL_getRankLevel() - _user.EL_getRankLevel()) +
							   this.Math.pow(this.Const.EL_NPCOther.EL_Ghost.HrrificScream.CombatLevelFactor, this.Math.abs(target.EL_getCombatLevel() - _user.EL_getCombatLevel())) * (target.EL_getCombatLevel() - _user.EL_getCombatLevel());
			_targetTile.getEntity().checkMorale(-1, difficulty, this.Const.MoraleCheckType.MentalAttack);
			_targetTile.getEntity().checkMorale(-1, difficulty, this.Const.MoraleCheckType.MentalAttack);
			_targetTile.getEntity().checkMorale(-1, difficulty, this.Const.MoraleCheckType.MentalAttack);
			_targetTile.getEntity().checkMorale(-1, difficulty, this.Const.MoraleCheckType.MentalAttack);
			return true;
		}
	});

	::mods_hookExactClass("skills/actives/legend_miasma_skill", function ( o )
	{
        o.getTooltip = function()
        {
            return [
                {
                    id = 1,
                    type = "title",
                    text = this.getName()
                },
                {
                    id = 2,
                    type = "description",
                    text = this.getDescription()
                },
                {
                    id = 3,
                    type = "text",
                    text = this.getCostString()
                },
                {
                    id = 10,
                    type = "text",
                    icon = "ui/icons/damage_received.png",
                    text = "造成目标5%到10%基础生命值的伤害，持续4回合。"
                }
            ];
        }
	});


	::mods_hookExactClass("skills/actives/slash_lightning", function(o){

        o.getTooltip = function()
        {
            local ret = this.getDefaultTooltip();
            ret.extend([
                {
                    id = 6,
                    type = "text",
                    icon = "ui/icons/special.png",
                    text = "造成[color=" + this.Const.UI.Color.DamageValue + "] 5% [/color]目标当前生命值 + [color=" + this.Const.UI.Color.DamageValue + "]20[/color] 忽视护甲的伤害。闪电链不会击中同一个单位2次。"
                },
                {
                    id = 7,
                    type = "text",
                    icon = "ui/icons/hitchance.png",
                    text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] chance to hit"
                }
            ]);
            return ret;
        }

        o.applyEffect = function( _data, _delay )
        {
            this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay, function ( _data )
            {
                for( local i = 0; i < this.Const.Tactical.LightningParticles.len(); i = ++i )
                {
                    this.Tactical.spawnParticleEffect(true, this.Const.Tactical.LightningParticles[i].Brushes, _data.TargetTile, this.Const.Tactical.LightningParticles[i].Delay, this.Const.Tactical.LightningParticles[i].Quantity, this.Const.Tactical.LightningParticles[i].LifeTimeQuantity, this.Const.Tactical.LightningParticles[i].SpawnRate, this.Const.Tactical.LightningParticles[i].Stages);
                }
            }, _data);

            if (_data.Target == null || !_data.Target.isAlive() || _data.Target.isDying())
            {
                return;
            }

            this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay + 200, function ( _data )
            {
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.floor(_data.Target.getBaseProperties().Hitpoints * 0.05 + 10 * (1 + _data.User.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).EL_getCurrentLevel() * 0.08));
                hitInfo.DamageDirect = 1.0;
                hitInfo.BodyPart = this.Const.BodyPart.Body;
                hitInfo.BodyDamageMult = 1.0;
                hitInfo.FatalityChanceMult = 0.0;
                _data.Target.onDamageReceived(_data.User, _data.Skill, hitInfo);
            }, _data);
        }

        o.onUse = function( _user, _targetTile )
        {
            this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectSlash);
            local success = this.attackEntity(_user, _targetTile.getEntity());
            local myTile = _user.getTile();
            if (success && _user.isAlive())
            {
                local selectedTargets = [];
                local potentialTargets = [];
                local potentialTiles = [];
                local target;
                local have_next_target = true;
                local delay_time = 100;
                local targetTile = _targetTile;

                if (this.m.SoundOnLightning.len() != 0)
                {
                    this.Sound.play(this.m.SoundOnLightning[this.Math.rand(0, this.m.SoundOnLightning.len() - 1)], this.Const.Sound.Volume.Skill * 2.0, _user.getPos());
                }

                if (!targetTile.IsEmpty && targetTile.getEntity().isAlive() && !targetTile.getEntity().isDying())
                {
                    target = targetTile.getEntity();
                    selectedTargets.push(target.getID());
                }
                else {
                    target = null;
                }

                while(have_next_target) {

                    local data = {
                        Skill = this,
                        User = _user,
                        TargetTile = targetTile,
                        Target = target
                    };
                    this.applyEffect(data, delay_time);
                    delay_time += 50;
                    potentialTargets = [];
                    potentialTiles = [];
                    for( local i = 0; i < 6; i = ++i )
                    {
                        if (targetTile.hasNextTile(i))
                        {
                            local tile = targetTile.getNextTile(i);
                            if (tile.IsOccupiedByActor && tile.getEntity().isAttackable() && !tile.getEntity().isAlliedWith(_user) && selectedTargets.find(tile.getEntity().getID()) == null)
                            {
                                potentialTargets.push(tile);
                            }
                        }
                    }
                    if (potentialTargets.len() != 0)
                    {
                        target = potentialTargets[this.Math.rand(0, potentialTargets.len() - 1)].getEntity();
                        selectedTargets.push(target.getID());
                        targetTile = target.getTile();
                    }
                    else
                    {
                        have_next_target = false;
                    }
                }
            }
            return success;
        }
	});

    ::mods_hookExactClass("skills/actives/legend_chain_lightning", function(o)
    {
        o.isUsable = function()
        {
            local weapon = this.getContainer().getActor().getMainhandItem();
            if (!this.getContainer().getActor().isArmedWithMagicStaff() && (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff)))
            {
                return false;
            }
            return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
        }
	});

    ::mods_hookExactClass("skills/actives/legend_firefield_skill", function(o)
    {
        o.isUsable = function()
        {
            local weapon = this.getContainer().getActor().getMainhandItem();
            if (!this.getContainer().getActor().isArmedWithMagicStaff() && (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff)))
            {
                return false;
            }
            return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	    }
	});

    ::mods_hookExactClass("skills/actives/legend_magic_missile", function(o)
    {
        o.isUsable = function()
        {
            local weapon = this.getContainer().getActor().getMainhandItem();
            if (!this.getContainer().getActor().isArmedWithMagicStaff() && (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff)))
            {
                return false;
            }
            return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	    }
	});

    ::mods_hookExactClass("skills/actives/mage_legend_magic_burning_hands", function(o)
    {
        o.isUsable = function()
        {
            local weapon = this.getContainer().getActor().getMainhandItem();
            if (!this.getContainer().getActor().isArmedWithMagicStaff() && (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff)))
            {
                return false;
            }
            return !this.Tactical.isActive() || this.skill.isUsable();
	    }
	});

    ::mods_hookExactClass("skills/actives/mage_legend_magic_skill", function(o)
    {
        o.isUsable = function()
        {
            local weapon = this.getContainer().getActor().getMainhandItem();
            if (!this.getContainer().getActor().isArmedWithMagicStaff() && (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Staff)))
            {
                return false;
            }
		    return this.skill.isUsable() && (!this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()));
	    }
	});

    ::mods_hookExactClass("skills/actives/quick_shot", function(o)
    {
        o.isUsable = function()
        {

            local has_rarity_entry = false;
            if(this.getContainer().hasSkill("el_rarity_entry.pursuit_of_wind") && this.getContainer().getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				has_rarity_entry = true;
			}

            return !this.Tactical.isActive() || this.skill.isUsable() && (this.getAmmo() > 0 || has_rarity_entry) && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
        }
	});

    ::mods_hookExactClass("skills/actives/aimed_shot", function(o)
    {
        o.isUsable = function()
        {

            local has_rarity_entry = false;
            if(this.getContainer().hasSkill("el_rarity_entry.pursuit_of_wind") && this.getContainer().getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				has_rarity_entry = true;
			}

            return !this.Tactical.isActive() || this.skill.isUsable() && (this.getAmmo() > 0 || has_rarity_entry) && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
        }
	});

    ::mods_hookExactClass("skills/actives/legend_piercing_shot", function(o)
    {
        o.isUsable = function()
        {

            local has_rarity_entry = false;
            if(this.getContainer().hasSkill("el_rarity_entry.pursuit_of_wind") && this.getContainer().getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				has_rarity_entry = true;
			}

            return !this.Tactical.isActive() || this.skill.isUsable() && (this.getAmmo() > 0 || has_rarity_entry) && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
        }
	});

	::mods_hookExactClass("skills/actives/legend_cascade_skill", function(o)
    {
        o.isUsable = function()
        {
            if (!this.getContainer().getActor().isArmedWithRangedWeapon())
            {
                return false;
            }

            local has_rarity_entry = false;
            if(this.getContainer().hasSkill("el_rarity_entry.pursuit_of_wind") && this.getContainer().getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				has_rarity_entry = true;
			}

            return !this.Tactical.isActive() || this.skill.isUsable() && (this.getAmmo() > 2 || has_rarity_entry) && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
        }

        o.isHidden = function()
        {
            local actor = this.getContainer().getActor();

            if (actor == null)
            {
                return true;
            }

            if (!actor.getSkills().hasSkill("perk.legend_cascade"))
            {
                return true;
            }
            local main_hand = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

            if (main_hand == null || !main_hand.isWeaponType(this.Const.Items.WeaponType.Bow))
            {
                return true;
            }
            return false;
        }

		o.onUse = function( _user, _targetTile )
		{
            local user = this.getContainer().getActor();
            local has_rarity_entry = false;
            if(user.getSkills().hasSkill("el_rarity_entry.pursuit_of_wind") && user.getSkills().getSkillByID("el_rarity_entry.pursuit_of_wind").EL_isUsable())
			{
				has_rarity_entry = true;
			}
            this.consumeAmmo();
            local target = _targetTile.getEntity();
            this.attackEntity(_user, target);
            this.m.IsDoingAttackMove = false;
            this.getContainer().setBusy(true);
            this.Time.scheduleEvent(this.TimeUnit.Virtual, 100, function ( _skill )
            {
                if (target.isAlive())
                {
                    _skill.attackEntity(_user, target);
                }
            }.bindenv(this), this);
            this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, function ( _skill )
            {
                if (target.isAlive())
                {
                    _skill.attackEntity(_user, target);
                }

                _skill.m.IsDoingAttackMove = true;
                _skill.getContainer().setBusy(false);
            }.bindenv(this), this);
            if(has_rarity_entry)
            {
                this.getContainer().setBusy(true);
                for(local i = 0;i < 6; ++i)
                {
                    this.Time.scheduleEvent(this.TimeUnit.Virtual, 100, function ( _skill )
                    {
                        if (target.isAlive())
                        {
                            _skill.attackEntity(_user, target);
                        }
                    }.bindenv(this), this);
                }
                this.getContainer().setBusy(false);
            }
            return true;
		}

        o.onAfterUpdate = function( _properties )
        {
            local weapon = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
            if(weapon != null)
            {
                this.m.MaxRange = weapon.getRangeMax() - 1 + (_properties.IsSpecializedInBows ? 1 : 0);
                this.m.AdditionalAccuracy = weapon.getAdditionalAccuracy();
                this.m.FatigueCostMult = _properties.IsSpecializedInBows ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
            }
        }
	});

	::mods_hookExactClass("skills/actives/legend_staff_lunge_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                local actor = this.getContainer().getActor();
                _properties.DamageTotalMult *= this.Math.max(1 + actor.getInitiative() * 0.005, 0);

                if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpears)
                {
                    _properties.MeleeSkill += 5;
                }
            }
        }
	});

	::mods_hookExactClass("skills/actives/legend_unarmed_lunge_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                local actor = this.getContainer().getActor();
                _properties.DamageTotalMult *= this.Math.max(1 + actor.getInitiative() * 0.005, 0);

                if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpears)
                {
                    _properties.MeleeSkill += 5;
                }
            }
        }

	});

	::mods_hookExactClass("skills/actives/lunge_skill", function(o){

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this)
            {
                local actor = this.getContainer().getActor();
                _properties.DamageTotalMult *= this.Math.max(1 + actor.getInitiative() * 0.005, 0);

                if (this.getContainer().getActor().getCurrentProperties().IsSpecializedInSpears)
                {
                    _properties.MeleeSkill += 5;
                }
            }
        }


	});

	::mods_hookExactClass("skills/actives/legend_wooden_stake_stab", function(o){
        o.getDescription <- function()
        {
            return "A quick and fast stab with the wooden shaft. Deals +" + this.Math.floor(100 * (1 + this.m.Item.EL_getCurrentLevel() * this.Const.EL_Weapon.EL_LevelFactor.RegularDamage)) + " damage to vampires";
        }

        o.onAnySkillUsed = function( _skill, _targetEntity, _properties )
        {
            if (_skill == this && _targetEntity != null)
            {
                if (_targetEntity.getType() == this.Const.EntityType.Vampire || _targetEntity.getType() == this.Const.EntityType.LegendVampireLord)
                {
                    local damage_bonus = this.Math.floor(100 * (1 + this.m.Item.EL_getCurrentLevel() * this.Const.EL_Weapon.EL_LevelFactor.RegularDamage));
                    _properties.DamageRegularMin += damage_bonus;
                    _properties.DamageRegularMax += damage_bonus + 5;
                }
            }
        }
	});

	::mods_hookExactClass("skills/actives/penetration", function(o){
        o.applyEffectToTargets = function( _tag )
        {
            local user = _tag.User;
            local targets = _tag.Targets;
            local attackSkill = user.getCurrentProperties().getRangedSkill();
            local last;
            foreach( t in targets )
            {
            if (t.IsOccupiedByActor&&t.getEntity().isAttackable())
                {
                    last = t;
                
                }
            
            }
            foreach( t in targets )
            {
                
                if (!t.IsOccupiedByActor || !t.getEntity().isAttackable())
                {
                    continue;
                }
                
                local target = t.getEntity();
                if(t == last)
                {
                this.m.ProjectileType = this.Const.ProjectileType.SpearofLonginus;
                }
                local success = this.attackEntity(user, target, false);
            
                if (success && target.isAlive() && !target.isDying() && t.IsVisibleForPlayer)
                {
                
            
                    if (user.getPos().X <= target.getPos().X)
                    {
                        for( local i = 0; i < this.Const.Tactical.ShrapnelLeftParticles.len(); i = i )
                        {
                            local effect = this.Const.Tactical.ShrapnelLeftParticles[i];
                            this.Tactical.spawnParticleEffect(false, effect.Brushes, t, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
                            i = ++i;
                        }
                    }
                    else
                    {
                        for( local i = 0; i < this.Const.Tactical.ShrapnelRightParticles.len(); i = i )
                        {
                            local effect = this.Const.Tactical.ShrapnelRightParticles[i];
                            this.Tactical.spawnParticleEffect(false, effect.Brushes, t, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
                            i = ++i;
                        }
                    }
                }
            }
		
    //		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, function ( user )
    //	    {
			user.getSkills().add(this.new("scripts/skills/actives/call_back"));
			local skill = user.getSkills().getSkillByID("actives.call_back");
			skill.EL_serializeItem(user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));
			user.getItems().unequip(user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));

			//			}.bindenv(this), this);
			
		    this.m.ProjectileType = this.Const.ProjectileType.None;
        }
	});

    ::mods_hookExactClass("skills/actives/call_back", function(o){
        o.m.EL_EntryList <- [];
        o.m.EL_StrengthenEntryNum <- 0;
        o.m.EL_Level <- -1;
        o.m.EL_CurrentLevel <- -1;
        o.m.EL_RankLevel <- 0;
        o.m.EL_RankPropertiesImproveIndex <- [];
        o.m.EL_BaseNoRankConditionMax <- 0;
        o.m.EL_BaseWithRankConditionMax <- 0;
        o.m.EL_BaseNoRankValue <- 0;
        o.m.EL_BaseWithRankValue <- 0;

        o.m.EL_BaseNoRankShieldDamage <- 0;
        o.m.EL_BaseNoRankRegularDamage <- 0;
        o.m.EL_BaseNoRankRegularDamageMax <- 0;
        o.m.EL_BaseNoRankStaminaModifier <- 0;

        o.m.EL_BaseWithRankShieldDamage <- 0;
        o.m.EL_BaseWithRankRegularDamage <- 0;
        o.m.EL_BaseWithRankRegularDamageMax <- 0;
        o.m.EL_BaseWithRankStaminaModifier <- 0.0;

        o.m.EL_BaseNoRankAmmoMax <- 0;
        o.m.EL_BaseNoRankArmorDamageMult <- 0.0;
        o.m.EL_BaseNoRankDirectDamageAdd <- 0.0;
        o.m.EL_BaseNoRankChanceToHitHead <- 0;
        o.m.EL_BaseNoRankAdditionalAccuracy <- 0;
        o.m.EL_BaseNoRankFatigueOnSkillUse <- 0;
        o.m.EL_BaseNoRankRangeMax <- 0;

        o.m.EL_BaseWithRankVision <- 0;
        o.m.EL_BaseWithRankAmmoMax <- 0;
        o.m.EL_BaseWithRankArmorDamageMult <- 0.0;
        o.m.EL_BaseWithRankDirectDamageAdd <- 0.0;
        o.m.EL_BaseWithRankChanceToHitHead <- 0;
        o.m.EL_BaseWithRankAdditionalAccuracy <- 0;
        o.m.EL_BaseWithRankFatigueOnSkillUse <- 0;
        o.m.EL_BaseWithRankRangeMax <- 0;
        o.m.EL_Condition <- 0;

        o.onUse = function( _user, _targetTile )
        {
            local item = this.new("scripts/items/weapons/legendary/longinus_spear");
            this.EL_deserializeItem(item);    
            _user.m.Items.equip(item);               
            this.getContainer().remove(this);
            return true;
        }

        o.onCombatFinished = function()
        {
            local item = this.new("scripts/items/weapons/legendary/longinus_spear");
            this.EL_deserializeItem(item);    
            if(this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand)==null&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand)==null )
            {
                this.getContainer().getActor().getItems().equip(item);
            }
            else if(this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand)!=null&&this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand)!=null)
            {
                this.World.Assets.getStash().add(item);
            }
            this.removeSelf();
        }

        o.EL_serializeItem <- function( _item )
        {
            foreach(entry in _item.m.EL_EntryList)
            {
                this.m.EL_EntryList.push(entry);
            }
            this.m.EL_StrengthenEntryNum = _item.m.EL_StrengthenEntryNum;
            this.m.EL_Level = _item.m.EL_Level;
            this.m.EL_CurrentLevel = _item.m.EL_CurrentLevel;
            this.m.EL_RankLevel = _item.m.EL_RankLevel;
            foreach(index in _item.m.EL_RankPropertiesImproveIndex)
            {
                this.m.EL_RankPropertiesImproveIndex.push(index);
            }
            this.m.EL_BaseNoRankConditionMax = _item.m.EL_BaseNoRankConditionMax;
            this.m.EL_BaseWithRankConditionMax = _item.m.EL_BaseWithRankConditionMax;
            this.m.EL_BaseNoRankValue = _item.m.EL_BaseNoRankValue;
            this.m.EL_BaseWithRankValue = _item.m.EL_BaseWithRankValue;
            
            this.m.EL_BaseNoRankShieldDamage = _item.m.EL_BaseNoRankShieldDamage;
            this.m.EL_BaseNoRankRegularDamage = _item.m.EL_BaseNoRankRegularDamage;
            this.m.EL_BaseNoRankRegularDamageMax = _item.m.EL_BaseNoRankRegularDamageMax;
            this.m.EL_BaseNoRankStaminaModifier = _item.m.EL_BaseNoRankStaminaModifier;

            this.m.EL_BaseWithRankShieldDamage = _item.m.EL_BaseWithRankShieldDamage;
            this.m.EL_BaseWithRankRegularDamage = _item.m.EL_BaseWithRankRegularDamage;
            this.m.EL_BaseWithRankRegularDamageMax = _item.m.EL_BaseWithRankRegularDamageMax;
            this.m.EL_BaseWithRankStaminaModifier = _item.m.EL_BaseWithRankStaminaModifier;

            this.m.EL_BaseNoRankAmmoMax = _item.m.EL_BaseNoRankAmmoMax;
            this.m.EL_BaseNoRankArmorDamageMult = _item.m.EL_BaseNoRankArmorDamageMult;
            this.m.EL_BaseNoRankDirectDamageAdd = _item.m.EL_BaseNoRankDirectDamageAdd;
            this.m.EL_BaseNoRankChanceToHitHead = _item.m.EL_BaseNoRankChanceToHitHead;
            this.m.EL_BaseNoRankAdditionalAccuracy = _item.m.EL_BaseNoRankAdditionalAccuracy;
            this.m.EL_BaseNoRankFatigueOnSkillUse = _item.m.EL_BaseNoRankFatigueOnSkillUse;
            this.m.EL_BaseNoRankRangeMax = _item.m.EL_BaseNoRankRangeMax;

            this.m.EL_BaseWithRankVision = _item.m.EL_BaseWithRankVision;
            this.m.EL_BaseWithRankAmmoMax = _item.m.EL_BaseWithRankAmmoMax;
            this.m.EL_BaseWithRankArmorDamageMult = _item.m.EL_BaseWithRankArmorDamageMult;
            this.m.EL_BaseWithRankDirectDamageAdd = _item.m.EL_BaseWithRankDirectDamageAdd;
            this.m.EL_BaseWithRankChanceToHitHead = _item.m.EL_BaseWithRankChanceToHitHead;
            this.m.EL_BaseWithRankAdditionalAccuracy = _item.m.EL_BaseWithRankAdditionalAccuracy;
            this.m.EL_BaseWithRankFatigueOnSkillUse = _item.m.EL_BaseWithRankFatigueOnSkillUse;
            this.m.EL_BaseWithRankRangeMax = _item.m.EL_BaseWithRankRangeMax;
            this.m.EL_Condition = _item.m.Condition;    
        }

        EL_deserializeItem <- function( _item )
        {
            foreach(entry in this.m.EL_EntryList)
            {
                _item.m.EL_EntryList.push(entry);
            }
            _item.m.EL_StrengthenEntryNum = this.m.EL_StrengthenEntryNum;
            _item.m.EL_Level = this.m.EL_Level;
            _item.m.EL_CurrentLevel = this.m.EL_CurrentLevel;
            _item.m.EL_RankLevel = this.m.EL_RankLevel;
            foreach(index in this.m.EL_RankPropertiesImproveIndex)
            {
                _item.m.EL_RankPropertiesImproveIndex.push(index);
            }
            _item.m.EL_BaseNoRankConditionMax = this.m.EL_BaseNoRankConditionMax;
            _item.m.EL_BaseWithRankConditionMax = this.m.EL_BaseWithRankConditionMax;
            _item.m.EL_BaseNoRankValue = this.m.EL_BaseNoRankValue;
            _item.m.EL_BaseWithRankValue = this.m.EL_BaseWithRankValue;
            
            _item.m.EL_BaseNoRankShieldDamage = this.m.EL_BaseNoRankShieldDamage;
            _item.m.EL_BaseNoRankRegularDamage = this.m.EL_BaseNoRankRegularDamage;
            _item.m.EL_BaseNoRankRegularDamageMax = this.m.EL_BaseNoRankRegularDamageMax;
            _item.m.EL_BaseNoRankStaminaModifier = this.m.EL_BaseNoRankStaminaModifier;

            _item.m.EL_BaseWithRankShieldDamage = this.m.EL_BaseWithRankShieldDamage;
            _item.m.EL_BaseWithRankRegularDamage = this.m.EL_BaseWithRankRegularDamage;
            _item.m.EL_BaseWithRankRegularDamageMax = this.m.EL_BaseWithRankRegularDamageMax;
            _item.m.EL_BaseWithRankStaminaModifier = this.m.EL_BaseWithRankStaminaModifier;

            _item.m.EL_BaseNoRankAmmoMax = this.m.EL_BaseNoRankAmmoMax;
            _item.m.EL_BaseNoRankArmorDamageMult = this.m.EL_BaseNoRankArmorDamageMult;
            _item.m.EL_BaseNoRankDirectDamageAdd = this.m.EL_BaseNoRankDirectDamageAdd;
            _item.m.EL_BaseNoRankChanceToHitHead = this.m.EL_BaseNoRankChanceToHitHead;
            _item.m.EL_BaseNoRankAdditionalAccuracy = this.m.EL_BaseNoRankAdditionalAccuracy;
            _item.m.EL_BaseNoRankFatigueOnSkillUse = this.m.EL_BaseNoRankFatigueOnSkillUse;
            _item.m.EL_BaseNoRankRangeMax = this.m.EL_BaseNoRankRangeMax;

            _item.m.EL_BaseWithRankVision = this.m.EL_BaseWithRankVision;
            _item.m.EL_BaseWithRankAmmoMax = this.m.EL_BaseWithRankAmmoMax;
            _item.m.EL_BaseWithRankArmorDamageMult = this.m.EL_BaseWithRankArmorDamageMult;
            _item.m.EL_BaseWithRankDirectDamageAdd = this.m.EL_BaseWithRankDirectDamageAdd;
            _item.m.EL_BaseWithRankChanceToHitHead = this.m.EL_BaseWithRankChanceToHitHead;
            _item.m.EL_BaseWithRankAdditionalAccuracy = this.m.EL_BaseWithRankAdditionalAccuracy;
            _item.m.EL_BaseWithRankFatigueOnSkillUse = this.m.EL_BaseWithRankFatigueOnSkillUse;
            _item.m.EL_BaseWithRankRangeMax = this.m.EL_BaseWithRankRangeMax;
            _item.m.Condition = this.m.EL_Condition;    
        }
	});
});