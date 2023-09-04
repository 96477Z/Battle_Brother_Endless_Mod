local gt = getroottable();

::mods_registerMod("el_skills_terrain_ballance", 1, "el_skills_terrain_ballance");
::mods_queue(null, "el_player_npc", function ()
{


	::mods_hookNewObject("skills/terrain/swamp_effect", function(o){

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
                    id = 10,
                    type = "text",
                    icon = "/ui/icons/melee_skill.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Skill"
                },
                {
                    id = 11,
                    type = "text",
                    icon = "/ui/icons/melee_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Melee Defense"
                },
                {
                    id = 12,
                    type = "text",
                    icon = "/ui/icons/ranged_defense.png",
                    text = "[color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] Ranged Defense"
                }
            ];
        }

        o.onUpdate = function( _properties )
        {
            _properties.MeleeDefense -= 25;
            _properties.RangedDefense -= 25;
            _properties.MeleeSkill -= 25;
        }

	});








});