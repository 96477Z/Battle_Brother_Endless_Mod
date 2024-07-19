this.follower <- {
	m = {
		ID = "",
		Name = "",
		Description = "",
		Effects = [],
		Requirements = [],
		Image = "",
		Cost = 0,
		RequiredSkills = [],
		LinkedBro = null,
		WasOwned = false
	},
	function getID()
	{
		return this.m.ID;
	}

	function getOrder()
	{
		return this.m.Order;
	}

	function getName()
	{
		return this.m.Name;
	}

	function getDescription()
	{
		return this.m.Description;
	}

	function getImage()
	{
		return this.m.Image;
	}

	function getEffects()
	{
		return this.m.Effects;
	}

	function getLinkedBro()
	{
		return this.m.LinkedBro;
	}

	function setOwned()
	{
		this.m.WasOwned = true;
	}

	function getCost()
	{
		return this.m.WasOwned ? 0 : this.m.Cost;
	}

	function getRequirements()
	{
		return this.m.Requirements;
	}

	function isValid()
	{
		return true;
	}

	function isVisible()
	{
		return true;
	}

	function isUnlocked()
	{
		for( local i = 0; i < this.m.Requirements.len(); i = i )
		{
			if (!this.m.Requirements[i].IsSatisfied)
			{
				return false;
			}

			i = ++i;
		}

		return true;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 4,
				type = "description",
				text = this.getDescription()
			}
		];

		foreach( i, e in this.m.Effects )
		{
			ret.push({
				id = i,
				type = "text",
				icon = "ui/icons/special.png",
				text = e
			});
		}

		ret.push({
			id = 1,
			type = "hint",
			icon = "ui/icons/mouse_left_button.png",
			text = "Open Hiring Screen to replace"
		});
		return ret;
	}

	function create()
	{
	}

	function update()
	{
		this.onUpdate();
	}

	function isEnabled()
	{
		if (this.m.RequiredSkills.len() == 0)
		{
			return true;
		}

		this.checkRequiredSkills();
		return this.m.LinkedBro != null && this.m.LinkedBro.isAlive();
	}

	function resetLinkedBro()
	{
		this.m.LinkedBro = null;
	}

	function evaluate()
	{
		for( local i = 0; i < this.m.Requirements.len(); i = i )
		{
			this.m.Requirements[i].IsSatisfied = false;
			i = ++i;
		}

		this.onEvaluate();
	}

	function clear()
	{
	}

	function onEvaluate()
	{
		this.m.Requirements[this.m.Requirements.len() - 1].IsSatisfied = this.isEnabled();
	}

	function checkRequiredSkills()
	{
		local isCorrectSkill = function ( _skill )
		{
			if (this.m.RequiredSkills.find(_skill.getID()) != null)
			{
				return true;
			}

			return false;
		};

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			if (bro.getSkills().getSkillsByFunction(isCorrectSkill.bindenv(this)).len() != 0)
			{
				this.m.LinkedBro = bro;
				break;
			}
		}
	}

	function onUpdate()
	{
	}

	function onNewDay()
	{
	}

	function onSerialize( _out )
	{
	}

	function onDeserialize( _in )
	{
	}

};

