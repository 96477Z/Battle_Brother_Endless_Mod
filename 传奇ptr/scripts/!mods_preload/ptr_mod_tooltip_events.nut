local gt = this.getroottable();

gt.PTR.modTooltipEvents <- function()
{
	::mods_hookNewObject("ui/screens/tooltip/tooltip_events", function(o) {
		local tactical_queryTileTooltipData = o.tactical_queryTileTooltipData;
		o.tactical_queryTileTooltipData = function()
		{
			local ret = tactical_queryTileTooltipData();
			local lastTileHovered = this.Tactical.State.getLastTileHovered();
			if (ret != null && lastTileHovered.IsCorpseSpawned && this.Tactical.TurnSequenceBar.getActiveEntity() != null && lastTileHovered.IsDiscovered && lastTileHovered.IsVisibleForPlayer)
			{
				local actor = this.Tactical.TurnSequenceBar.getActiveEntity();				
				if (actor.isPlacedOnMap() && actor.isPlayerControlled())
				{
					local opportunist = actor.getSkills().getSkillByID("perk.ptr_opportunist");
					if (opportunist != null && opportunist.canProcOntile(lastTileHovered))
					{
						ret.push({
							id = 90,
							type = "text",
							icon = "ui/perks/ptr_opportunist.png"
							text = "Can be used for [b][color=" + this.Const.UI.Color.PositiveValue + "]Opportunist[/color][/b]"
						});
					}
				}
			}

			return ret;
		}
	});
}

