this.el_check_racial <- this.inherit("scripts/skills/skill", {
	m = {
        isInTurn = false
    },
	function create()
	{
		this.m.ID = "el_racial.check_thief";
		this.m.Name = "";
		this.m.Icon = "";
		this.m.IconMini = "";
		this.m.Type = this.Const.SkillType.Racial;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

    // function isInTurn()
    // {
    //     return this.m.isInTurn;
    // }

    // function onTurnStart()
    // {
    //     this.m.isInTurn = true;
    // }

	// function onTurnEnd()
	// {
    //     this.m.isInTurn = false;
	// }

	// function onAfterUpdate( _properties )
	// {
	// 	local actor = this.getContainer().getActor();
	// 	if (actor.isPlacedOnMap() && actor.isAlive() && actor.isDying())
	// 	{
	// 		this.logInfo("try to delete invalid actor-");
	// 		actor.die();
	// 		this.logInfo("try to delete invalid actor。");
	// 	}
	// }

});

