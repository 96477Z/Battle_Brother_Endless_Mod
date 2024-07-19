local gt = this.getroottable();

gt.PTR.modRetinue <- function()
{
	local retinuesToFixGuaranteedTooltip = [
		"retinue/followers/blacksmith_follower",
		"retinue/followers/cook_follower",
		"retinue/followers/lookout_follower",
		"retinue/followers/minstrel_follower",
		"retinue/followers/negotiator_follower",
		"retinue/followers/paymaster_follower",
		"retinue/followers/quartermaster_follower",
		"retinue/followers/recruiter_follower",
		"retinue/followers/surgeon_follower"
	];

	::mods_hookBaseClass("retinue/follower", function(o) {
		o = o[o.SuperName];

		local getRequirements = o.getRequirements;
		o.getRequirements = function()
		{
			local ret = getRequirements();
			if (ret.len() != 0 && ("Text" in ret[0]))
			{
				local idx = ret[0].Text.find("Guaranteed");
				if (idx != null)
				{
					ret[0].Text = ret[0].Text.slice(0, idx);
				}
			}

			return ret;
		}		
	});
}