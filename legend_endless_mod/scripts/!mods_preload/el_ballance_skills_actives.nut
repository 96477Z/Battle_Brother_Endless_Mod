local gt = getroottable();

::mods_registerMod("el_ballance_skills_actives", 1, "el_ballance_skills_actives");
::mods_queue(null, "el_player_npc", function ()
{

	::mods_hookExactClass("skills/actives/ghastly_touch", function ( o )
	{
		o.onUse = function( _user, _targetTile )
		{
			local ret = this.attackEntity(_user, _targetTile.getEntity());
			if(ret == true) {
				local target = _targetTile.getEntity();
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
                    text = "Inflicts an additional [color=" + this.Const.UI.Color.DamageValue + "]5%[/color] targets current hitpoints + [color=" + this.Const.UI.Color.DamageValue + "]20[/color] damage that ignores armor. The lightning won't hit the same target and will pass on until no targets left."
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

            if (_data.Target == null)
            {
                return;
            }

            this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay + 200, function ( _data )
            {
                local hitInfo = clone this.Const.Tactical.HitInfo;
                hitInfo.DamageRegular = this.Math.floor(_data.Target.getBaseProperties().Hitpoints * 0.05 + 10 * (1 + _data.User.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).EL_getCurrentLevel() * 0.04));
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

                if (!targetTile.IsEmpty && targetTile.getEntity().isAlive())
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

	::mods_hookExactClass("skills/actives/legend_cascade_skill", function(o)
    {
        o.isHidden = function()
        {
            local actor = this.getContainer().getActor();

            if (actor == null)
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
            if(this.m.Item != null)
            {
                this.m.MaxRange = this.m.Item.getRangeMax() - 1 + (_properties.IsSpecializedInBows ? 1 : 0);
                this.m.AdditionalAccuracy = this.m.Item.getAdditionalAccuracy();
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






});
