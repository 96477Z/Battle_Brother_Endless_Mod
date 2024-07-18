local gt = this.getroottable();

gt.Const.ProjectileType.FlamingArrow <- gt.Const.ProjectileType.COUNT;
gt.Const.ProjectileType.COUNT = gt.Const.ProjectileType.COUNT + 1;

local flamingArrowsDecals = [];
foreach (decal in gt.Const.ProjectileDecals[this.Const.ProjectileType.Arrow])
{
	flamingArrowsDecals.push(decal);
}

gt.Const.ProjectileDecals.push(flamingArrowsDecals);

gt.Const.ProjectileSprite.push("projectile_flaming_arrow");

gt.Const.Combat.OpportunistUsedTiles <- [];