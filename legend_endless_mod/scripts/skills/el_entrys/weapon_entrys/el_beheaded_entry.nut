this.el_beheaded_entry <- this.inherit("scripts/skills/el_entrys/el_entry", {
	m = {},
	function create()
	{
		this.el_entry.create();
		this.m.ID = "el_weapon_entry.beheaded";
	}

	function getTooltip( _id )
	{
		local colour = this.EL_getEntryColour();
		local result = {
			id = _id,
			type = "text",
			text = "[color=" + colour + "]攻击结算后若敌人仅余1血，将之斩杀[/color]"
		};
		return result;
	}

	function EL_getEntryColour()
	{
		return this.Const.EL_Item.Colour[this.Const.EL_Item.Type.Special];
	}
});