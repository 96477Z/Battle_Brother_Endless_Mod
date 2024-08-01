local gt = getroottable();

::mods_registerMod("el_named_item", 1, "el_named_item");
::mods_queue(null, "el_item", function ()
{
	::mods_hookExactClass("items/weapons/named/named_weapon", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			_out.writeString(this.m.Name);
		    _out.writeF32(0);
		    this.weapon.onSerialize(_out);
		}

		o.onDeserialize = function ( _in )
		{
			this.m.Name = _in.readString();
		    _in.readF32();
		    this.weapon.onDeserialize(_in);
		    this.updateVariant();

    		if (this.isRuned())
	    	{
	    		this.updateRuneSigil();
	    	}
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/shields/named/named_shield", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			this.shield.onSerialize(_out);
			_out.writeString(this.m.Name);
		}

		o.onDeserialize = function ( _in )
		{
			this.shield.onDeserialize(_in);
			this.m.Name = _in.readString();

			if (this.isRuned())
			{
				this.updateRuneSigil();
			}
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/armor/named/named_armor", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			this.armor.onSerialize(_out);
			_out.writeString(this.m.Name);
		}

		o.onDeserialize = function ( _in )
		{
			this.armor.onDeserialize(_in);
			this.m.Name = _in.readString();

			if (this.isRuned())
			{
				this.updateRuneSigil();
			}
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/helmets/named/named_helmet", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			this.helmet.onSerialize(_out);
			_out.writeString(this.m.Name);
		}

		o.onDeserialize = function ( _in )
		{
			this.helmet.onDeserialize(_in);
			this.m.Name = _in.readString();

			if (this.isRuned())
			{
				this.updateRuneSigil();
			}
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/legend_armor/legend_cloth_named", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			_out.writeString(this.m.Name);
			this.legend_armor.onSerialize(_out);
		}

		o.onDeserialize = function ( _in )
		{
			this.m.Name = _in.readString();
			this.legend_armor.onDeserialize(_in);
			this.updateVariant();

			if (this.isRuned())
			{
				this.updateRuneSigil();
			}
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/legend_armor/legend_named_armor_upgrade", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			_out.writeString(this.m.Name);
			this.legend_armor_upgrade.onSerialize(_out);
		}

		o.onDeserialize = function ( _in )
		{
			this.m.Name = _in.readString();
			this.legend_armor_upgrade.onDeserialize(_in);
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/legend_armor/legend_named_armor", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			_out.writeString(this.m.Name);
			this.legend_armor.onSerialize(_out);
		}

		o.onDeserialize = function ( _in )
		{
			this.m.Name = _in.readString();
			this.legend_armor.onDeserialize(_in);

			if (this.isRuned())
			{
				this.updateRuneSigil();
			}
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	});

	::mods_hookExactClass("items/legend_helmets/legend_named_helmet_upgrade", function ( o )
	{
		o.m.EL_RankLevel <- 1;

		o.randomizeValues = function ()
		{
		}

		o.onSerialize = function ( _out )
		{
			_out.writeString(this.m.Name);
			this.legend_helmet_upgrade.onSerialize(_out);
		}

		o.onDeserialize = function ( _in )
		{
			this.m.Name = _in.readString();
			this.legend_helmet_upgrade.onDeserialize(_in);
		}

		o.EL_getRankLevelMax <- function()
		{
			return this.Const.EL_Item.MaxRankLevel.Named;
		}
	})

	for(local i = 0; i < this.Const.EL_Item_Other.EL_SpecialNamedItem.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Item_Other.EL_SpecialNamedItem[i], function ( o )
		{
			o.randomizeValues = function ()
			{
			}
		});
	}

	for(local i = 0; i < this.Const.EL_Item_Other.EL_ExtraNamedItem.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Item_Other.EL_ExtraNamedItem[i], function ( o )
		{
			o.m.EL_RankLevel <- 1;

			local create = o.create;
			o.create = function ()
			{
				create();
				this.addItemType(this.Const.Items.ItemType.Named);
			};

			o.EL_getRankLevelMax <- function()
			{
				return this.Const.EL_Item.MaxRankLevel.Named;
			}
		});
	}

	for(local i = 0; i < this.Const.EL_Item_Other.EL_OnlyItemList.len(); ++i) {
		::mods_hookExactClass("items/" + this.Const.EL_Item_Other.EL_OnlyItemList[i], function ( o )
		{
			o.EL_getRankLevelMax <- function()
			{
				this.m.EL_BaseNoRankValue = 0;
				return this.Const.EL_Item.MaxRankLevel.Only;
			}

			o.EL_disassemble <- function(_itemIndex)
			{
			}

			o.EL_getDisassembleEquipmentEssenceNum <- function()
			{
				return [0, 0, 0, 0, 0];
			}

			o.onAddedToStash <- function(_stashID)
			{
				if (_stashID == "player")
				{
					this.World.Assets.EL_UpdateLegendaryItemNum();
				}
			}
		});
	}
});