this.perk_ptr_professional <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false,
		PerksAdded = []
	},
	function create()
	{
		this.m.ID = "perk.ptr_professional";
		this.m.Name = this.Const.Strings.PerkName.PTRProfessional;
		this.m.Description = this.Const.Strings.PerkDescription.PTRProfessional;
		this.m.Icon = "ui/perks/ptr_professional.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (this.m.IsSpent)
		{
			return;
		}

		local addPerk = function ( _perk, _row = 0 )
		{
			local actor = this.getContainer().getActor();
			if (typeof actor == "instance")
			{
				actor = actor.get();
			}

			if (!this.isKindOf(actor, "player"))
			{
				return;
			}

			local bg = this.getContainer().getActor().getBackground();	
			local hasRow = false;
			local direction = -1;
			local row = _row;
			while (row >= 0 && row <= 6)
			{
				if (bg.m.CustomPerkTree[row].len() < 13)
				{
					hasRow = true;
					break;
				}

				row += direction;

				if (row == -1)
				{
					row = _row;
					direction = 1;
				}
			}

			row = hasRow ? this.Math.max(0, this.Math.min(row, 6)) : _row;
			bg.addPerk(_perk, row);
			this.m.PerksAdded.push(_perk);
		}

		if (!this.getContainer().hasSkill("perk.shield_expert"))
		{
			this.getContainer().add(this.new("scripts/skills/perks/perk_shield_expert"));
			addPerk(this.Const.Perks.PerkDefs.ShieldExpert, 2);
		}

		if (!this.getContainer().hasSkill("perk.ptr_weapon_master"))
		{
			this.getContainer().add(this.new("scripts/skills/perks/perk_ptr_weapon_master"));
			addPerk(this.Const.Perks.PerkDefs.PTRWeaponMaster, 6);
		}

		if (!this.getContainer().hasSkill("perk.duelist"))
		{
			this.getContainer().add(this.new("scripts/skills/perks/perk_duelist"));
			addPerk(this.Const.Perks.PerkDefs.Duelist, 5);
		}

		if (!this.getContainer().hasSkill("perk.reach_advantage"))
		{
			this.getContainer().add(this.new("scripts/skills/perks/perk_reach_advantage"));
			addPerk(this.Const.Perks.PerkDefs.ReachAdvantage, 4);	
		}

		if (!this.getContainer().hasSkill("perk.ptr_bloody_harvest"))
		{
			this.getContainer().add(this.new("scripts/skills/perks/perk_ptr_bloody_harvest"));
			addPerk(this.Const.Perks.PerkDefs.PTRBloodyHarvest, 1);
		}

		this.m.IsSpent = true;
	}

	function onRemoved()
	{
		foreach (perk in this.m.PerksAdded)
		{
			this.getContainer().removeByID(this.Const.Perks.PerkDefObjects[perk].ID);
		}
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		local size = _out.writeU8(this.m.PerksAdded.len());
		foreach (perk in this.m.PerksAdded)
		{
			_out.writeU16(perk);
		}		
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);

		this.m.IsSpent = true;

		this.m.PerksAdded = [];
		
		local size = _in.readU8();
		for (local i = 0; i < size; i++)
		{
			this.m.PerksAdded.push(_in.readU16());
		}
	}
});
