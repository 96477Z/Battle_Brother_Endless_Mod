local gt = this.getroottable();

gt.PTR.modAI <- function()
{
	gt.Const.Movement.AutoEndTurnBelowAP = 1;
	
	::mods_hookNewObject("ai/tactical/behaviors/ai_engage_ranged", function(o) {

		local onExecute = o.onExecute;
		o.onExecute = function(_entity)
		{
			if (this.m.IsWaiting && _entity.getSkills().hasSkill("effects.ptr_arrow_to_the_knee_attack"))
			{
				this.m.IsWaiting = false;
			}

			return onExecute(_entity);
		}
	});

	::mods_hookNewObject("ai/tactical/behaviors/ai_boost_stamina", function ( o ) {
			local idx1 = o.m.PossibleSkills.find("actives.legend_push_forward");
			if (idx1 != null)
			{
				o.m.PossibleSkills.remove(idx1);
			}

			local idx2 = o.m.PossibleSkills.find("actives.legend_hold_the_line");
			if (idx2 != null)
			{
				o.m.PossibleSkills.remove(idx2);
			}
		});

	::mods_hookNewObject("ai/tactical/behaviors/ai_attack_bow", function(o) {
		local onEvaluate = o.onEvaluate;
		o.onEvaluate = function(_entity)
		{
			local ret = onEvaluate(_entity);
			local skill = _entity.getSkills().getSkillByID("effects.ptr_arrow_to_the_knee_attack");
			if (skill != null && skill.m.AIForcedTarget != null && skill.m.AIForcedSkill != null && skill.m.AIForcedSkill.isUsableOn(skill.m.AIForcedTarget.getTile()))
			{
				if (this.Const.AI.VerboseMode && this.m.SelectedSkill != null && this.m.TargetTile != null)
				{
					this.logInfo("* I would have shot " + this.m.TargetTile.getEntity().getName() + " with " + this.m.SelectedSkill.getID() + " but I am instead switching targets to " + skill.m.AIForcedTarget.getName() + " using " + skill.m.AIForcedSkill.getID() + " as I have prepped an Arrow to the Knee");
				}
				this.m.TargetTile = skill.m.AIForcedTarget.getTile();
				this.m.SelectedSkill = skill.m.AIForcedSkill;
				skill.m.AIForcedTarget = null;
				skill.m.AIForcedSkill = null;
				ret *= 1000;
			}

			return ret;
		}
	});

	::mods_hookNewObject("ai/tactical/behaviors/ai_defend_riposte", function(o) {
		local onEvaluate = o.onEvaluate;
		o.onEvaluate = function( _entity )
		{
			local score = onEvaluate(_entity);
			if (this.m.Skill != null && this.m.Skill.getID() == "actives.riposte")
			{
				local engarde = _entity.getSkills().getSkillByID("perk.ptr_en_garde");
				if (engarde != null && !engarde.m.IsSpent)
				{
					score = this.Const.AI.Behavior.Score.Zero;
				}
			}

			return score;
		}
	});
}
