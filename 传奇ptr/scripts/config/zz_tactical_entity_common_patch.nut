local gt = this.getroottable();
gt.Const.Tactical.Common.getBlockedTiles <- function( _myTile, _targetTile, _myFaction, _visibleOnly = false )
{
		local dir = _targetTile.getDirectionTo(_myTile);
		local dist = _myTile.getDistanceTo(_targetTile);
		local ret = [];

		if (_targetTile.hasNextTile(dir))
		{
			local newTile = _targetTile.getNextTile(dir);

			if (!newTile.IsEmpty && newTile.Level - _targetTile.Level > -2 && (!_visibleOnly || newTile.IsVisibleForPlayer))
			{
				if (_myTile.getDistanceTo(newTile) > 1 || !(newTile.IsOccupiedByActor && newTile.getEntity().isAlliedWith(_myFaction)))
				{
					ret.push(newTile);
				}
			}
		}
//add by bigmap for 15.0.13
//		if (_targetTile.X != _myTile.X && _targetTile.Y != _myTile.Y && this.Math.abs(_targetTile.X - _myTile.X) != this.Math.abs(_targetTile.Y - _myTile.Y))
		if (_targetTile.X != _myTile.X && _targetTile.Y != _myTile.Y && (this.Math.abs(_targetTile.X - _myTile.X) != this.Math.abs(_targetTile.Y - _myTile.Y) || _myTile.X - _myTile.Y == _targetTile.X - _targetTile.Y))
		{
			local org_dir = dir;
			dir = org_dir + 1 < this.Const.Direction.COUNT ? org_dir + 1 : 0;

			if (_targetTile.hasNextTile(dir))
			{
				local newTile = _targetTile.getNextTile(dir);

				if (!newTile.IsEmpty && newTile.Level - _targetTile.Level > -2 && newTile.getDistanceTo(_myTile) < dist && (!_visibleOnly || newTile.IsVisibleForPlayer))
				{
					if (_myTile.getDistanceTo(newTile) > 1 || !(newTile.IsOccupiedByActor && newTile.getEntity().isAlliedWith(_myFaction)))
					{
						ret.push(newTile);
					}
				}
			}

			dir = org_dir - 1 >= 0 ? org_dir - 1 : this.Const.Direction.COUNT - 1;

			if (_targetTile.hasNextTile(dir))
			{
				local newTile = _targetTile.getNextTile(dir);

				if (!newTile.IsEmpty && newTile.Level - _targetTile.Level > -2 && newTile.getDistanceTo(_myTile) < dist && (!_visibleOnly || newTile.IsVisibleForPlayer))
				{
					if (_myTile.getDistanceTo(newTile) > 1 || !(newTile.IsOccupiedByActor && newTile.getEntity().isAlliedWith(_myFaction)))
					{
						ret.push(newTile);
					}
				}
			}
		}

		return ret;
};
