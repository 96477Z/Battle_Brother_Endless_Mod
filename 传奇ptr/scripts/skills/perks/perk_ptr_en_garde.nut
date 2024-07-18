this.perk_ptr_en_garde <- this.inherit("scripts/skills/skill", {
	m = {
		IsOn = true,
		IsSpent = false,
		FatigueRequired = 15
	},
	function create()
	{
		this.m.ID = "perk.ptr_en_garde";
		this.m.Name = this.Const.Strings.PerkName.PTREnGarde;
		this.m.Description = this.Const.Strings.PerkDescription.PTREnGarde;
		this.m.Icon = "ui/perks/ptr_en_garde.png";
		this.m.SoundOnUse = [
			"sounds/combat/return_favor_01.wav"
		];
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().m.IsMoving)
		{
			local meisterhau = this.getContainer().getSkillByID("actives.ptr_swordmaster_versatile_swordsman_stance_meisterhau");
			if (meisterhau == null || !meisterhau.m.IsOn)
			{
				this.m.IsSpent = true;
			}
		}
	}

	function onCombatStarted()
	{
		this.m.IsOn = true;
		this.getContainer().add(this.new("scripts/skills/actives/ptr_en_garde_toggle_skill"));
	}
	
	function pickSkill()
	{
		if (this.m.IsSpent) return null;

		local actor = this.getContainer().getActor();

		if (actor.getFatigueMax() - actor.getFatigue() < this.m.FatigueRequired) return null;

		local weapon = actor.getMainhandItem();
		if (weapon == null || !weapon.isWeaponType(this.Const.Items.WeaponType.Sword))
		{
			return null;
		}

		local riposte = this.getContainer().getSkillByID("actives.riposte");
		if (riposte != null && !riposte.isHidden())
		{
			return riposte;
		}
		else if (weapon.isItemType(::Const.Items.ItemType.TwoHanded))
		{
			return this.new("scripts/skills/effects/return_favor_effect");
		}
	}

	function onTurnEnd()
	{
		if (this.m.IsSpent || !this.m.IsOn)
		{
			return;
		}

		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || !actor.hasZoneOfControl() || ::Tactical.State.isAutoRetreat())
		{
			return;
		}

		local skill = this.pickSkill();
		if (skill != null)
		{
			if (skill.getID() == "actives.riposte")
			{
				skill.useForFree(actor.getTile());	
			}
			else
			{
				this.getContainer().add(skill);
				if (actor.getTile().IsVisibleForPlayer)
				{
					this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, actor.getPos());
				}
			}
		}
	}
});
