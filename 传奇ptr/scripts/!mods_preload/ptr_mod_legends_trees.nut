local gt = this.getroottable();

gt.PTR.modLegendsEnemyTrees <- function()
{
	# Beasts Tree
	this.Const.Perks.BeastsTree.Tree = array(7);
	this.Const.Perks.BeastsTree.PerkGroupMultipliers <- [
		[1.25, ::Const.Perks.SwordTree],
		[1.25, ::Const.Perks.SpearTree]
	];
	this.Const.Perks.BeastsTree.Tree[0] = [];
	this.Const.Perks.BeastsTree.Tree[1] = [];
	this.Const.Perks.BeastsTree.Tree[2] = [];
	this.Const.Perks.BeastsTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyGhoul,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySpider,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyLindwurm
	];
	this.Const.Perks.BeastsTree.Tree[4] = [];
	this.Const.Perks.BeastsTree.Tree[5] = [];
	this.Const.Perks.BeastsTree.Tree[6] = [];

	# Ghoul Tree
	this.Const.Perks.GhoulTree.Tree = array(7);
	this.Const.Perks.GhoulTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.SwordTree]
	];
	this.Const.Perks.GhoulTree.Tree[0] = [];
	this.Const.Perks.GhoulTree.Tree[1] = [];
	this.Const.Perks.GhoulTree.Tree[2] = [];
	this.Const.Perks.GhoulTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyGhoul
	];
	this.Const.Perks.GhoulTree.Tree[4] = [];
	this.Const.Perks.GhoulTree.Tree[5] = [];
	this.Const.Perks.GhoulTree.Tree[6] = [];

	# DirewolfTree
	this.Const.Perks.DirewolfTree.Tree = array(7);
	this.Const.Perks.DirewolfTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.SpearTree]
	];
	this.Const.Perks.DirewolfTree.Tree[0] = [];
	this.Const.Perks.DirewolfTree.Tree[1] = [];
	this.Const.Perks.DirewolfTree.Tree[2] = [];
	this.Const.Perks.DirewolfTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf
	];
	this.Const.Perks.DirewolfTree.Tree[4] = [];
	this.Const.Perks.DirewolfTree.Tree[5] = [];
	this.Const.Perks.DirewolfTree.Tree[6] = [];

	# SpiderTree
	this.Const.Perks.SpiderTree.Tree = array(7);
	this.Const.Perks.SpiderTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.SpearTree]
	];
	this.Const.Perks.SpiderTree.Tree[0] = [];
	this.Const.Perks.SpiderTree.Tree[1] = [];
	this.Const.Perks.SpiderTree.Tree[2] = [];
	this.Const.Perks.SpiderTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySpider
	];
	this.Const.Perks.SpiderTree.Tree[4] = [];
	this.Const.Perks.SpiderTree.Tree[5] = [];
	this.Const.Perks.SpiderTree.Tree[6] = [];

	# LindwurmTree
	this.Const.Perks.LindwurmTree.Tree = array(7);
	this.Const.Perks.LindwurmTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.PolearmTree]
	];
	this.Const.Perks.LindwurmTree.Tree[0] = [];
	this.Const.Perks.LindwurmTree.Tree[1] = [];
	this.Const.Perks.LindwurmTree.Tree[2] = [];
	this.Const.Perks.LindwurmTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyLindwurm
	];
	this.Const.Perks.LindwurmTree.Tree[4] = [];
	this.Const.Perks.LindwurmTree.Tree[5] = [];
	this.Const.Perks.LindwurmTree.Tree[6] = [];

	# MysticTree
	this.Const.Perks.MysticTree.Tree = array(7);
	this.Const.Perks.MysticTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TalentedTree]
	];
	this.Const.Perks.MysticTree.Tree[0] = [];
	this.Const.Perks.MysticTree.Tree[1] = [];
	this.Const.Perks.MysticTree.Tree[2] = [];
	this.Const.Perks.MysticTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySchrat,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyAlps
	];
	this.Const.Perks.MysticTree.Tree[4] = [];
	this.Const.Perks.MysticTree.Tree[5] = [];
	this.Const.Perks.MysticTree.Tree[6] = [];

	# SchratTree
	this.Const.Perks.SchratTree.Tree = array(7);
	this.Const.Perks.SchratTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.AxeTree]
	];
	this.Const.Perks.SchratTree.Tree[0] = [];
	this.Const.Perks.SchratTree.Tree[1] = [];
	this.Const.Perks.SchratTree.Tree[2] = [];
	this.Const.Perks.SchratTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySchrat
	];
	this.Const.Perks.SchratTree.Tree[4] = [];
	this.Const.Perks.SchratTree.Tree[5] = [];
	this.Const.Perks.SchratTree.Tree[6] = [];

	# HexenTree
	this.Const.Perks.HexenTree.Tree = array(7);
	this.Const.Perks.HexenTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.CalmTree]
	];
	this.Const.Perks.HexenTree.Tree[0] = [];
	this.Const.Perks.HexenTree.Tree[1] = [];
	this.Const.Perks.HexenTree.Tree[2] = [];
	this.Const.Perks.HexenTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyHexen
	];
	this.Const.Perks.HexenTree.Tree[4] = [];
	this.Const.Perks.HexenTree.Tree[5] = [];
	this.Const.Perks.HexenTree.Tree[6] = [];

	# AlpTree
	this.Const.Perks.AlpTree.Tree = array(7);
	this.Const.Perks.AlpTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.HoundmasterClassTree]
	];
	this.Const.Perks.AlpTree.Tree[0] = [];
	this.Const.Perks.AlpTree.Tree[1] = [];
	this.Const.Perks.AlpTree.Tree[2] = [];
	this.Const.Perks.AlpTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyAlps
	];
	this.Const.Perks.AlpTree.Tree[4] = [];
	this.Const.Perks.AlpTree.Tree[5] = [];
	this.Const.Perks.AlpTree.Tree[6] = [];

	# UndeadTree
	this.Const.Perks.UndeadTree.Tree = array(7);
	this.Const.Perks.UndeadTree.PerkGroupMultipliers <- [
		[1.25, ::Const.Perks.MaceTree],
		[1.25, ::Const.Perks.CleaverTree],
	];
	this.Const.Perks.UndeadTree.Tree[0] = [];
	this.Const.Perks.UndeadTree.Tree[1] = [];
	this.Const.Perks.UndeadTree.Tree[2] = [];
	this.Const.Perks.UndeadTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySkeleton,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyZombie,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyVampire
	];
	this.Const.Perks.UndeadTree.Tree[4] = [];
	this.Const.Perks.UndeadTree.Tree[5] = [];
	this.Const.Perks.UndeadTree.Tree[6] = [];

	# SkeletonTree
	this.Const.Perks.SkeletonTree.Tree = array(7);
	this.Const.Perks.SkeletonTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.MaceTree]
	];
	this.Const.Perks.SkeletonTree.Tree[0] = [];
	this.Const.Perks.SkeletonTree.Tree[1] = [];
	this.Const.Perks.SkeletonTree.Tree[2] = [];
	this.Const.Perks.SkeletonTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySkeleton
	];
	this.Const.Perks.SkeletonTree.Tree[4] = [];
	this.Const.Perks.SkeletonTree.Tree[5] = [];
	this.Const.Perks.SkeletonTree.Tree[6] = [];

	# ZombieTree
	this.Const.Perks.ZombieTree.Tree = array(7);
	this.Const.Perks.ZombieTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.CleaverTree]
	];
	this.Const.Perks.ZombieTree.Tree[0] = [];
	this.Const.Perks.ZombieTree.Tree[1] = [];
	this.Const.Perks.ZombieTree.Tree[2] = [];
	this.Const.Perks.ZombieTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyZombie
	];
	this.Const.Perks.ZombieTree.Tree[4] = [];
	this.Const.Perks.ZombieTree.Tree[5] = [];
	this.Const.Perks.ZombieTree.Tree[6] = [];

	# VampireTree
	this.Const.Perks.VampireTree.Tree = array(7);
	this.Const.Perks.VampireTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TrapperClassTree]
	];
	this.Const.Perks.VampireTree.Tree[0] = [];
	this.Const.Perks.VampireTree.Tree[1] = [];
	this.Const.Perks.VampireTree.Tree[2] = [];
	this.Const.Perks.VampireTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyVampire
	];
	this.Const.Perks.VampireTree.Tree[4] = [];
	this.Const.Perks.VampireTree.Tree[5] = [];
	this.Const.Perks.VampireTree.Tree[6] = [];

	# OrcsTree
	this.Const.Perks.OrcsTree.Tree = array(7);
	this.Const.Perks.OrcsTree.PerkGroupMultipliers <- [
		[1.25, ::Const.Perks.AgileTree],
		[1.25, ::Const.Perks.SturdyTree]
	];
	this.Const.Perks.OrcsTree.Tree[0] = [];
	this.Const.Perks.OrcsTree.Tree[1] = [];
	this.Const.Perks.OrcsTree.Tree[2] = [];
	this.Const.Perks.OrcsTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold
	];
	this.Const.Perks.OrcsTree.Tree[4] = [];
	this.Const.Perks.OrcsTree.Tree[5] = [];
	this.Const.Perks.OrcsTree.Tree[6] = [];

	# OrcTree
	this.Const.Perks.OrcTree.Tree = array(7);
	this.Const.Perks.OrcTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.HammerTree]
	];
	this.Const.Perks.OrcTree.Tree[0] = [];
	this.Const.Perks.OrcTree.Tree[1] = [];
	this.Const.Perks.OrcTree.Tree[2] = [];
	this.Const.Perks.OrcTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyOrk
	];
	this.Const.Perks.OrcTree.Tree[4] = [];
	this.Const.Perks.OrcTree.Tree[5] = [];
	this.Const.Perks.OrcTree.Tree[6] = [];

	# GoblinTree
	this.Const.Perks.GoblinTree.Tree = array(7);
	this.Const.Perks.GoblinTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.AgileTree]
	];
	this.Const.Perks.GoblinTree.Tree[0] = [];
	this.Const.Perks.GoblinTree.Tree[1] = [];
	this.Const.Perks.GoblinTree.Tree[2] = [];
	this.Const.Perks.GoblinTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin
	];
	this.Const.Perks.GoblinTree.Tree[4] = [];
	this.Const.Perks.GoblinTree.Tree[5] = [];
	this.Const.Perks.GoblinTree.Tree[6] = [];

	# UnholdTree
	this.Const.Perks.UnholdTree.Tree = array(7);
	this.Const.Perks.UnholdTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.SturdyTree]
	];
	this.Const.Perks.UnholdTree.Tree[0] = [];
	this.Const.Perks.UnholdTree.Tree[1] = [];
	this.Const.Perks.UnholdTree.Tree[2] = [];
	this.Const.Perks.UnholdTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold
	];
	this.Const.Perks.UnholdTree.Tree[4] = [];
	this.Const.Perks.UnholdTree.Tree[5] = [];
	this.Const.Perks.UnholdTree.Tree[6] = [];

	# CivilizationTree
	this.Const.Perks.CivilizationTree.Tree = array(7);
	this.Const.Perks.CivilizationTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TrainedTree]
	];
	this.Const.Perks.CivilizationTree.Tree[0] = [];
	this.Const.Perks.CivilizationTree.Tree[1] = [];
	this.Const.Perks.CivilizationTree.Tree[2] = [];
	this.Const.Perks.CivilizationTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyMercenary,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyNoble,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner
	];
	this.Const.Perks.CivilizationTree.Tree[4] = [];
	this.Const.Perks.CivilizationTree.Tree[5] = [];
	this.Const.Perks.CivilizationTree.Tree[6] = [];

	# CaravanTree
	this.Const.Perks.CaravanTree.Tree = array(7);
	this.Const.Perks.CaravanTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.UnstoppableTree]
	];
	this.Const.Perks.CaravanTree.Tree[0] = [];
	this.Const.Perks.CaravanTree.Tree[1] = [];
	this.Const.Perks.CaravanTree.Tree[2] = [];
	this.Const.Perks.CaravanTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyCaravan
	];
	this.Const.Perks.CaravanTree.Tree[4] = [];
	this.Const.Perks.CaravanTree.Tree[5] = [];
	this.Const.Perks.CaravanTree.Tree[6] = [];

	# MercenaryTree
	this.Const.Perks.MercenaryTree.Tree = array(7);
	this.Const.Perks.MercenaryTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TrainedTree]
	];
	this.Const.Perks.MercenaryTree.Tree[0] = [];
	this.Const.Perks.MercenaryTree.Tree[1] = [];
	this.Const.Perks.MercenaryTree.Tree[2] = [];
	this.Const.Perks.MercenaryTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyMercenary
	];
	this.Const.Perks.MercenaryTree.Tree[4] = [];
	this.Const.Perks.MercenaryTree.Tree[5] = [];
	this.Const.Perks.MercenaryTree.Tree[6] = [];

	# NoblesTree
	this.Const.Perks.NoblesTree.Tree = array(7);
	this.Const.Perks.NoblesTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TrainedTree]
	];
	this.Const.Perks.NoblesTree.Tree[0] = [];
	this.Const.Perks.NoblesTree.Tree[1] = [];
	this.Const.Perks.NoblesTree.Tree[2] = [];
	this.Const.Perks.NoblesTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyNoble
	];
	this.Const.Perks.NoblesTree.Tree[4] = [];
	this.Const.Perks.NoblesTree.Tree[5] = [];
	this.Const.Perks.NoblesTree.Tree[6] = [];

	# SouthernersTree
	this.Const.Perks.SouthernersTree.Tree = array(7);
	this.Const.Perks.SouthernersTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TrainedTree]
	];
	this.Const.Perks.SouthernersTree.Tree[0] = [];
	this.Const.Perks.SouthernersTree.Tree[1] = [];
	this.Const.Perks.SouthernersTree.Tree[2] = [];
	this.Const.Perks.SouthernersTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySoutherner
	];
	this.Const.Perks.SouthernersTree.Tree[4] = [];
	this.Const.Perks.SouthernersTree.Tree[5] = [];
	this.Const.Perks.SouthernersTree.Tree[6] = [];

	# OutlandersTree
	this.Const.Perks.OutlandersTree.Tree = array(7);
	this.Const.Perks.OutlandersTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.FlailTree],
		[1.5, ::Const.Perks.ViciousTree]
	];
	this.Const.Perks.OutlandersTree.Tree[0] = [];
	this.Const.Perks.OutlandersTree.Tree[1] = [];
	this.Const.Perks.OutlandersTree.Tree[2] = [];
	this.Const.Perks.OutlandersTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyBandit,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyNomad,
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyBarbarian
	];
	this.Const.Perks.OutlandersTree.Tree[4] = [];
	this.Const.Perks.OutlandersTree.Tree[5] = [];
	this.Const.Perks.OutlandersTree.Tree[6] = [];

	# BanditTree
	this.Const.Perks.BanditTree.Tree = array(7);
	this.Const.Perks.BanditTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.FlailTree]
	];
	this.Const.Perks.BanditTree.Tree[0] = [];
	this.Const.Perks.BanditTree.Tree[1] = [];
	this.Const.Perks.BanditTree.Tree[2] = [];
	this.Const.Perks.BanditTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyBandit
	];
	this.Const.Perks.BanditTree.Tree[4] = [];
	this.Const.Perks.BanditTree.Tree[5] = [];
	this.Const.Perks.BanditTree.Tree[6] = [];

	# NomadsTree
	this.Const.Perks.NomadsTree.Tree = array(7);
	this.Const.Perks.NomadsTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.FlailTree]
	];
	this.Const.Perks.NomadsTree.Tree[0] = [];
	this.Const.Perks.NomadsTree.Tree[1] = [];
	this.Const.Perks.NomadsTree.Tree[2] = [];
	this.Const.Perks.NomadsTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyNomad
	];
	this.Const.Perks.NomadsTree.Tree[4] = [];
	this.Const.Perks.NomadsTree.Tree[5] = [];
	this.Const.Perks.NomadsTree.Tree[6] = [];

	# BarbarianTree
	this.Const.Perks.BarbarianTree.Tree = array(7);
	this.Const.Perks.BarbarianTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.ViciousTree]
	];
	this.Const.Perks.BarbarianTree.Tree[0] = [];
	this.Const.Perks.BarbarianTree.Tree[1] = [];
	this.Const.Perks.BarbarianTree.Tree[2] = [];
	this.Const.Perks.BarbarianTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyBarbarian
	];
	this.Const.Perks.BarbarianTree.Tree[4] = [];
	this.Const.Perks.BarbarianTree.Tree[5] = [];
	this.Const.Perks.BarbarianTree.Tree[6] = [];

	# ArchersTree
	this.Const.Perks.ArchersTree.Tree = array(7);
	this.Const.Perks.ArchersTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.BowTree],
		[1.5, ::Const.Perks.RangedTree]
	];
	this.Const.Perks.ArchersTree.Tree[0] = [];
	this.Const.Perks.ArchersTree.Tree[1] = [];
	this.Const.Perks.ArchersTree.Tree[2] = [];
	this.Const.Perks.ArchersTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemyArcher
	];
	this.Const.Perks.ArchersTree.Tree[4] = [];
	this.Const.Perks.ArchersTree.Tree[5] = [];
	this.Const.Perks.ArchersTree.Tree[6] = [];

	# SwordmastersTree
	this.Const.Perks.SwordmastersTree.Tree = array(7);
	this.Const.Perks.SwordmastersTree.PerkGroupMultipliers <- [
		[1.5, ::Const.Perks.TrapperClassTree]
	];
	this.Const.Perks.SwordmastersTree.Tree[0] = [];
	this.Const.Perks.SwordmastersTree.Tree[1] = [];
	this.Const.Perks.SwordmastersTree.Tree[2] = [];
	this.Const.Perks.SwordmastersTree.Tree[3] = [
		gt.Const.Perks.PerkDefs.LegendFavouredEnemySwordmaster
	];
	this.Const.Perks.SwordmastersTree.Tree[4] = [];
	this.Const.Perks.SwordmastersTree.Tree[5] = [];
	this.Const.Perks.SwordmastersTree.Tree[6] = [];
}

gt.PTR.modTraitsTrees <- function()
{
	// this.Const.Perks.AgileTree.PerkGroupMultipliers <- [
	// 	[1.5, ::Const.Perks.FastTree]
	// ];

	this.Const.Perks.AgileTree.Descriptions = [
		"is agile",
		"moves with grace and agility",
		"is naturally agile",
		"is impressively agile",
		"has an agile physique",
		"is agile like a fox",
		"is particularly agile"
	],
	this.Const.Perks.AgileTree.Tree = array(7);
	this.Const.Perks.AgileTree.Tree[0] = [this.Const.Perks.PerkDefs.Pathfinder];
	this.Const.Perks.AgileTree.Tree[1] = [this.Const.Perks.PerkDefs.Anticipation];
	this.Const.Perks.AgileTree.Tree[2] = [this.Const.Perks.PerkDefs.Sprint];
	this.Const.Perks.AgileTree.Tree[3] = [this.Const.Perks.PerkDefs.PTRDynamicDuo];
	this.Const.Perks.AgileTree.Tree[4] = [this.Const.Perks.PerkDefs.Footwork];
	this.Const.Perks.AgileTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRFreshAndFurious];
	this.Const.Perks.AgileTree.Tree[6] = [this.Const.Perks.PerkDefs.Rebound];


	this.Const.Perks.IndestructibleTree.Name = "Resilient";
	this.Const.Perks.IndestructibleTree.Descriptions = [
		"is unnaturally resilient",
		"is stubbornly resilient",
		"is staunchly resilient",
		"has a resilient will",
		"resiliently persists",
		"seems unwaveringly resilient",
		"is resilient beyond measure"
	],

	this.Const.Perks.IndestructibleTree.Tree = array(7);
	this.Const.Perks.IndestructibleTree.Tree[0] = [this.Const.Perks.PerkDefs.NineLives];
	this.Const.Perks.IndestructibleTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRSurvivalInstinct];
	this.Const.Perks.IndestructibleTree.Tree[2] = [this.Const.Perks.PerkDefs.HoldOut];
	this.Const.Perks.IndestructibleTree.Tree[3] = [];
	this.Const.Perks.IndestructibleTree.Tree[4] = [this.Const.Perks.PerkDefs.LegendSecondWind];
	this.Const.Perks.IndestructibleTree.Tree[5] = [];
	this.Const.Perks.IndestructibleTree.Tree[6] = [this.Const.Perks.PerkDefs.LastStand];

	this.Const.Perks.ViciousTree.Descriptions = [
		"is vicious",
		"seems fiendishly vicious",
		"is ferociously vicious",
		"is brutal and vicious",
		"appears diabolically vicious",
		"is beastially vicious",
		"enjoys vicious butchery"
	],

	this.Const.Perks.ViciousTree.Tree = array(7);
	this.Const.Perks.ViciousTree.Tree[0] = [this.Const.Perks.PerkDefs.CripplingStrikes];
	this.Const.Perks.ViciousTree.Tree[1] = [this.Const.Perks.PerkDefs.CoupDeGrace];
	this.Const.Perks.ViciousTree.Tree[2] = [this.Const.Perks.PerkDefs.Debilitate];
	this.Const.Perks.ViciousTree.Tree[3] = [];
	this.Const.Perks.ViciousTree.Tree[4] = [this.Const.Perks.PerkDefs.Berserk];
	this.Const.Perks.ViciousTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendAssuredConquest];
	this.Const.Perks.ViciousTree.Tree[6] = [this.Const.Perks.PerkDefs.Fearsome];

	this.Const.Perks.DeviousTree.Descriptions = [
		"is devious",
		"strikes you as devious",
		"has a devious appearance",
		"is insincere and devious",
		"is devious and sneaky",
		"carries themselves deviously",
		"is shrewd and devious"
	],

	this.Const.Perks.DeviousTree.Tree = array(7);
	this.Const.Perks.DeviousTree.Tree[0] = [this.Const.Perks.PerkDefs.Pathfinder];
	this.Const.Perks.DeviousTree.Tree[1] = [this.Const.Perks.PerkDefs.Backstabber];
	this.Const.Perks.DeviousTree.Tree[2] = [this.Const.Perks.PerkDefs.LegendBlendIn];
	this.Const.Perks.DeviousTree.Tree[3] = [];
	this.Const.Perks.DeviousTree.Tree[4] = [this.Const.Perks.PerkDefs.LegendEvasion];
	this.Const.Perks.DeviousTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendHidden];
	this.Const.Perks.DeviousTree.Tree[6] = [this.Const.Perks.PerkDefs.LegendUntouchable];

	this.Const.Perks.IntelligentTree.Name = "Talented";
	this.Const.Perks.IntelligentTree.Descriptions = [
		"is talented",
		"lives with talented ease",
		"has unparalleled talent",
		"is bright and talented",
		"is talented in many ways",
		"is talented beyond belief",
		"succeeds easily and with talent"
	],

	this.Const.Perks.IntelligentTree.Tree = array(7);
	this.Const.Perks.IntelligentTree.Tree[0] = [this.Const.Perks.PerkDefs.Student];
	this.Const.Perks.IntelligentTree.Tree[1] = [this.Const.Perks.PerkDefs.Gifted];
	this.Const.Perks.IntelligentTree.Tree[2] = [];
	this.Const.Perks.IntelligentTree.Tree[3] = [this.Const.Perks.PerkDefs.PTRDiscoveredTalent];
	this.Const.Perks.IntelligentTree.Tree[4] = [];
	this.Const.Perks.IntelligentTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRKnowTheirWeakness];
	this.Const.Perks.IntelligentTree.Tree[6] = [];

	this.Const.Perks.CalmTree.Descriptions = [
		"is calm",
		"breathes calmly",
		"projects peace and calm",
		"seems calm and unflustered",
		"calmly follows the flow",
		"is calm and unworried"
	],

	this.Const.Perks.CalmTree.Tree = array(7);
	this.Const.Perks.CalmTree.Tree[0] = [this.Const.Perks.PerkDefs.FastAdaption];
	this.Const.Perks.CalmTree.Tree[1] = [this.Const.Perks.PerkDefs.LegendTrueBeliever];
	this.Const.Perks.CalmTree.Tree[2] = [this.Const.Perks.PerkDefs.FortifiedMind];
	this.Const.Perks.CalmTree.Tree[3] = [this.Const.Perks.PerkDefs.LegendPeaceful];
	this.Const.Perks.CalmTree.Tree[4] = [];
	this.Const.Perks.CalmTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendMindOverBody];
	this.Const.Perks.CalmTree.Tree[6] = [];

	this.Const.Perks.FastTree.Descriptions = [
		"is fast",
		"runs fast",
		"is fast like a flash",
		"has fast feet",
		"maneuvers fast",
		"has fast steps",
		"is a fast sprinter"
	],

	this.Const.Perks.FastTree.Tree = array(7);
	this.Const.Perks.FastTree.Tree[0] = [this.Const.Perks.PerkDefs.LegendAlert];
	this.Const.Perks.FastTree.Tree[1] = [this.Const.Perks.PerkDefs.QuickHands];
	this.Const.Perks.FastTree.Tree[2] = [this.Const.Perks.PerkDefs.Relentless];
	this.Const.Perks.FastTree.Tree[3] = [this.Const.Perks.PerkDefs.PTRTheRushOfBattle];
	this.Const.Perks.FastTree.Tree[4] = [];
	this.Const.Perks.FastTree.Tree[5] = [this.Const.Perks.PerkDefs.Overwhelm];
	this.Const.Perks.FastTree.Tree[6] = [this.Const.Perks.PerkDefs.KillingFrenzy];

	this.Const.Perks.LargeTree.Descriptions = [
		"is large",
		"is large and hulking",
		"has impressively large shoulders",
		"is a large sort",
		"looms large above you",
		"is mountainously large",
		"has large musculature"
	],

	this.Const.Perks.LargeTree.Tree = array(7);
	this.Const.Perks.LargeTree.Tree[0] = [this.Const.Perks.PerkDefs.Colossus];
	this.Const.Perks.LargeTree.Tree[1] = [];
	this.Const.Perks.LargeTree.Tree[2] = [this.Const.Perks.PerkDefs.Steadfast];
	this.Const.Perks.LargeTree.Tree[3] = [];
	this.Const.Perks.LargeTree.Tree[4] = [];
	this.Const.Perks.LargeTree.Tree[5] = [this.Const.Perks.PerkDefs.SunderingStrikes];
	this.Const.Perks.LargeTree.Tree[6] = [this.Const.Perks.PerkDefs.LegendMuscularity];

	this.Const.Perks.OrganisedTree.Descriptions = [
		"is organized",
		"coordinates activities with organization",
		"formulates organized plans",
		"Keeps supplies organized",
		"wants to organize your gear",
		"organized the supplies",
		"is fastidiously organized"
	],

	this.Const.Perks.OrganisedTree.Tree = array(7);
	this.Const.Perks.OrganisedTree.Tree[0] = [this.Const.Perks.PerkDefs.BagsAndBelts];
	this.Const.Perks.OrganisedTree.Tree[1] = [];
	this.Const.Perks.OrganisedTree.Tree[2] = [gt.Const.Perks.PerkDefs.LegendEfficientPacking];
	this.Const.Perks.OrganisedTree.Tree[3] = [];
	this.Const.Perks.OrganisedTree.Tree[4] = [this.Const.Perks.PerkDefs.LegendSkillfulStacking];
	this.Const.Perks.OrganisedTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendPacifist];
	this.Const.Perks.OrganisedTree.Tree[6] = [];

	this.Const.Perks.SturdyTree.Descriptions = [
		"is sturdy",
		"is sturdily built",
		"looks strong and sturdy",
		"is stouthearted and sturdy",
		"is sturdy and robust",
		"seems sturdy",
		"is sturdy as a mountain"
	],

	this.Const.Perks.SturdyTree.Tree = array(7);
	this.Const.Perks.SturdyTree.Tree[0] = [this.Const.Perks.PerkDefs.Recover];
	this.Const.Perks.SturdyTree.Tree[1] = [this.Const.Perks.PerkDefs.SteelBrow];
	this.Const.Perks.SturdyTree.Tree[2] = [this.Const.Perks.PerkDefs.Taunt];
	this.Const.Perks.SturdyTree.Tree[3] = [];
	this.Const.Perks.SturdyTree.Tree[4] = [this.Const.Perks.PerkDefs.ReturnFavor];
	this.Const.Perks.SturdyTree.Tree[5] = [this.Const.Perks.PerkDefs.Vengeance];
	this.Const.Perks.SturdyTree.Tree[6] = [this.Const.Perks.PerkDefs.Indomitable];

	this.Const.Perks.FitTree.Name = "Unstoppable";
	this.Const.Perks.FitTree.Descriptions = [
		"seems unstoppable",
		"lifts weights unstoppably",
		"seems unstoppably resolute",
		"acts unstoppable",
		"has unstoppable stamina",
		"is unstoppably strong"
	],

	this.Const.Perks.FitTree.Tree = array(7);
	this.Const.Perks.FitTree.Tree[0] = [this.Const.Perks.PerkDefs.Adrenaline];
	this.Const.Perks.FitTree.Tree[1] = [];
	this.Const.Perks.FitTree.Tree[2] = [];
	this.Const.Perks.FitTree.Tree[3] = [this.Const.Perks.PerkDefs.PTRVigorousAssault];
	this.Const.Perks.FitTree.Tree[4] = [this.Const.Perks.PerkDefs.LoneWolf];
	this.Const.Perks.FitTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRUnstoppable];
	this.Const.Perks.FitTree.Tree[6] = [this.Const.Perks.PerkDefs.BattleFlow];

	this.Const.Perks.TrainedTree.SelfWeightMultiplier <- 0.75;
	this.Const.Perks.TrainedTree.Descriptions = [
		"is well trained",
		"has great training",
		"is drilled and trained",
		"has combat training",
		"has trained a great deal",
		"has been trained by someone skillful",
		"is trained and disciplined",		
		"has genuine training"
	],

	this.Const.Perks.TrainedTree.Tree = array(7);	
	this.Const.Perks.TrainedTree.Tree[0] = [this.Const.Perks.PerkDefs.LegendBackToBasics];
	this.Const.Perks.TrainedTree.Tree[1] = [];
	this.Const.Perks.TrainedTree.Tree[2] = [this.Const.Perks.PerkDefs.Rotation];
	this.Const.Perks.TrainedTree.Tree[3] = [this.Const.Perks.PerkDefs.PTRVigilant];
	this.Const.Perks.TrainedTree.Tree[4] = [this.Const.Perks.PerkDefs.Underdog];
	this.Const.Perks.TrainedTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendClarity];
	this.Const.Perks.TrainedTree.Tree[6] = [this.Const.Perks.PerkDefs.PerfectFocus];

	this.Const.Perks.ResilientTree <- this.Const.Perks.IndestructibleTree;
	this.Const.Perks.TalentedTree <- this.Const.Perks.IntelligentTree;
	this.Const.Perks.TalentedTree.SelfWeightMultiplier <- 0.25;
	this.Const.Perks.TalentedTree.SpecialPerkMultipliers <- [
		[2, ::Const.Perks.PerkDefs.PTRRisingStar]
	];
	this.Const.Perks.UnstoppableTree <- this.Const.Perks.FitTree;

	gt.Const.Perks.TraitsTrees.Tree = [
		gt.Const.Perks.AgileTree,
		gt.Const.Perks.ResilientTree,
		gt.Const.Perks.ViciousTree,
		gt.Const.Perks.DeviousTree,
		gt.Const.Perks.TalentedTree,
		gt.Const.Perks.CalmTree,
		gt.Const.Perks.FastTree,
		gt.Const.Perks.LargeTree,
		gt.Const.Perks.OrganisedTree,
		gt.Const.Perks.SturdyTree,
		gt.Const.Perks.UnstoppableTree,
		gt.Const.Perks.TrainedTree
	];
}

gt.PTR.modClassTrees <- function()
{
	gt.Const.Perks.SergeantClassTree <- {
		ID = "SergeantClassTree",
		Descriptions = [
			"inspiring men"
		],
		Name = "Sergeant",
		PerkGroupMultipliers = [
			[2, ::Const.Perks.PolearmTree]
		],
		Attributes = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				4,
				4
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				2,
				2
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				2,
				2
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		},
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendCheerOn
			],
			[
				gt.Const.Perks.PerkDefs.RallyTheTroops
			],
			[],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.InspiringPresence
			],
			[
				gt.Const.Perks.PerkDefs.Inspire
			]
		]
	};

	gt.Const.Perks.HealerClassTree <- {
		ID = "HealerClassTree",
		Descriptions = [
			"healing"
		],
		Name = "Healer",
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendMedIngredients
			],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendSpecBandage
			],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendFieldTriage
			]
		]
	};

	gt.Const.Perks.TrapperClassTree <- {
		ID = "TrapperClassTree",
		Descriptions = [
			"trapping"
		],
		Name = "Trapper",
		Tree = [
			[],
			[
				gt.Const.Perks.PerkDefs.LegendNetRepair
			],
			[
				gt.Const.Perks.PerkDefs.LegendNetCasting
			],
			[
				gt.Const.Perks.PerkDefs.LegendMasteryNets
			],
			[
				gt.Const.Perks.PerkDefs.LegendEscapeArtist
			],
			[],
			[]
		]
	};

	gt.Const.Perks.ChefClassTree <- {
		ID = "ChefClassTree",
		Descriptions = [
			"cooking"
		],
		Name = "Chef",
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendMealPreperation
			],
			[
				gt.Const.Perks.PerkDefs.LegendCampCook
			],
			[
				gt.Const.Perks.PerkDefs.LegendAlcoholBrewing
			],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendQuartermaster
			],
			[
				gt.Const.Perks.PerkDefs.LegendFieldTreats
			]
		]
	};

	gt.Const.Perks.MenderClassTree <- {
		ID = "MenderClassTree",
		Descriptions = [
			"mending"
		],
		Name = "Mender",
		Tree = [
			[],
			[
				gt.Const.Perks.PerkDefs.LegendToolsDrawers
			],
			[
				gt.Const.Perks.PerkDefs.LegendToolsSpares
			],
			[],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendFieldRepairs
			]
		]
	};

	gt.Const.Perks.ClerkClassTree <- {
		ID = "ClerkClassTree",
		Descriptions = [
			"bookkeeping"
		],
		Name = "Clerk",
		SelfWeightMultiplier = 0.33,
		Tree = [
			[],
			[],
			[],
			[],
			[
				gt.Const.Perks.PerkDefs.LegendDangerPay
			],
			[
				gt.Const.Perks.PerkDefs.LegendPaymaster
			],
			[
				gt.Const.Perks.PerkDefs.LegendBribe
			]
		]
	};

	this.Const.Perks.HoundmasterClassTree.PerkGroupMultipliers <- [
		[3, ::Const.Perks.CleaverTree]
	];
	this.Const.Perks.HoundmasterClassTree.Tree = array(7);
	this.Const.Perks.HoundmasterClassTree.Tree[0] = [];
	this.Const.Perks.HoundmasterClassTree.Tree[1] = [];
	this.Const.Perks.HoundmasterClassTree.Tree[2] = [this.Const.Perks.PerkDefs.LegendDogWhisperer];
	this.Const.Perks.HoundmasterClassTree.Tree[3] = [this.Const.Perks.PerkDefs.LegendDogBreeder];
	this.Const.Perks.HoundmasterClassTree.Tree[4] = [this.Const.Perks.PerkDefs.LegendDogHandling];
	this.Const.Perks.HoundmasterClassTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendPackleader];
	this.Const.Perks.HoundmasterClassTree.Tree[6] = [this.Const.Perks.PerkDefs.LegendDogMaster];

	gt.Const.Perks.TacticianClassTree <- {
		ID = "TacticianClassTree",
		Descriptions = [
			"battlefield tactics"
		],
		Name = "Tactician",
		SelfWeightMultiplier = 0.33,
		PerkGroupMultipliers = [
		],
		Tree = [
			[
				gt.Const.Perks.PerkDefs.LegendMarkTarget
			],
			[
				
			],
			[
				gt.Const.Perks.PerkDefs.LegendShieldsUp
			],
			[
				gt.Const.Perks.PerkDefs.LegendForwardPush
			],
			[
				gt.Const.Perks.PerkDefs.LegendHoldTheLine
			],
			[
				gt.Const.Perks.PerkDefs.PTRVanguardDeployment	
			],
			[
				gt.Const.Perks.PerkDefs.PTRBlitzkrieg
			]
		]
	};

	gt.Const.Perks.EntertainerClassTree <- {
		ID = "EntertainerClassTree",
		Descriptions = [
			"entertainment",
			"painting smiles on faces"
		],
		Name = "Entertainer",
		SelfWeightMultiplier = 0.33,
		Tree = [
			[
				gt.Const.Perks.PerkDefs.PTRAlwaysAnEntertainer
			],
			[],
			[
				gt.Const.Perks.PerkDefs.PTRPaintASmile
			],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.ScoutClassTree <- {
		ID = "ScoutClassTree",
		Descriptions = [
			"organizing patrols",
			"keeping watch",
			"keeping a lookout"
		],
		Name = "Scout",
		SelfWeightMultiplier = 0.33,
		Tree = [
			[
				gt.Const.Perks.PerkDefs.Lookout
			],
			[],
			[],
			[],
			[],
			[],
			[]
		]
	};

	gt.Const.Perks.ClassTrees.Tree = [
		gt.Const.Perks.SergeantClassTree,
		gt.Const.Perks.HealerClassTree,
		gt.Const.Perks.TrapperClassTree,
		gt.Const.Perks.ChefClassTree,
		gt.Const.Perks.MenderClassTree,
		gt.Const.Perks.ClerkClassTree,
		gt.Const.Perks.HoundmasterClassTree,
		gt.Const.Perks.TacticianClassTree,
		gt.Const.Perks.EntertainerClassTree,
		gt.Const.Perks.ScoutClassTree
	];
}

gt.PTR.modWeaponTrees <- function()
{
	this.Const.Perks.AxeTree.Tree = array(7);
	this.Const.Perks.AxeTree.Tree[0] = [this.Const.Perks.PerkDefs.LegendSmashingShields];
	this.Const.Perks.AxeTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRHeft];
	this.Const.Perks.AxeTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRDismemberment];
	this.Const.Perks.AxeTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecAxe];
	this.Const.Perks.AxeTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRBetweenTheEyes];
	this.Const.Perks.AxeTree.Tree[5] = [this.Const.Perks.PerkDefs.SunderingStrikes];
	this.Const.Perks.AxeTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRCull];

	this.Const.Perks.BowTree.Tree = array(7);
	this.Const.Perks.BowTree.SelfWeightMultiplier <- 0.33;
	this.Const.Perks.BowTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRTargetPractice];
	this.Const.Perks.BowTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRRangedSupremacy];
	this.Const.Perks.BowTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRArrowToTheKnee];
	this.Const.Perks.BowTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecBow];
	this.Const.Perks.BowTree.Tree[4] = [this.Const.Perks.PerkDefs.PTREyesUp];
	this.Const.Perks.BowTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRFlamingArrows];
	this.Const.Perks.BowTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRHipShooter];

	this.Const.Perks.CleaverTree.Tree = array(7);
	this.Const.Perks.CleaverTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRDeepCuts];
	this.Const.Perks.CleaverTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRSanguinary];
	this.Const.Perks.CleaverTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRSwordlike];
	this.Const.Perks.CleaverTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecCleaver];
	this.Const.Perks.CleaverTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRBloodlust];
	this.Const.Perks.CleaverTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRBloodbath];
	this.Const.Perks.CleaverTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRMauler];


	this.Const.Perks.CrossbowTree.Tree = array(7);
	this.Const.Perks.CrossbowTree.SelfWeightMultiplier <- 1.25;
	this.Const.Perks.CrossbowTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRPowerShot];
	this.Const.Perks.CrossbowTree.Tree[1] = [this.Const.Perks.PerkDefs.PTREntrenched];
	this.Const.Perks.CrossbowTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRPrimalFear];
	this.Const.Perks.CrossbowTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecCrossbow];
	this.Const.Perks.CrossbowTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRIronSights];
	this.Const.Perks.CrossbowTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRTakeAim];
	this.Const.Perks.CrossbowTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRMuscleMemory];

	this.Const.Perks.DaggerTree.Tree = array(7);
	this.Const.Perks.DaggerTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRBetweenTheRibs];
	this.Const.Perks.DaggerTree.Tree[1] = [this.Const.Perks.PerkDefs.Backstabber];
	this.Const.Perks.DaggerTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRLightWeapon];
	this.Const.Perks.DaggerTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecDagger];
	this.Const.Perks.DaggerTree.Tree[4] = [this.Const.Perks.PerkDefs.DoubleStrike];
	this.Const.Perks.DaggerTree.Tree[5] = [this.Const.Perks.PerkDefs.Overwhelm];
	this.Const.Perks.DaggerTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRSwiftStabs];

	this.Const.Perks.FlailTree.Tree = array(7);
	this.Const.Perks.FlailTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRFromAllSides];
	this.Const.Perks.FlailTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRHeadSmasher];
	this.Const.Perks.FlailTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRSmallTarget];
	this.Const.Perks.FlailTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecFlail];
	this.Const.Perks.FlailTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRDeadlyPrecision];
	this.Const.Perks.FlailTree.Tree[5] = [this.Const.Perks.PerkDefs.HeadHunter];
	this.Const.Perks.FlailTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRFlailSpinner];

	this.Const.Perks.HammerTree.Tree = array(7);
	this.Const.Perks.HammerTree.Tree[0] = [this.Const.Perks.PerkDefs.LegendSmackdown];
	this.Const.Perks.HammerTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRRattle];
	this.Const.Perks.HammerTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRInternalHemorrhage];
	this.Const.Perks.HammerTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecHammer];
	this.Const.Perks.HammerTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRDismantle];
	this.Const.Perks.HammerTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRDeepImpact];
	this.Const.Perks.HammerTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRDentArmor];

	this.Const.Perks.MaceTree.Tree = array(7);
	this.Const.Perks.MaceTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRPushIt];
	this.Const.Perks.MaceTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRHeavyStrikes];
	this.Const.Perks.MaceTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRBearDown];
	this.Const.Perks.MaceTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecMace];
	this.Const.Perks.MaceTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRConcussiveStrikes];
	this.Const.Perks.MaceTree.Tree[5] = [this.Const.Perks.PerkDefs.PushTheAdvantage];
	this.Const.Perks.MaceTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRBoneBreaker];

	this.Const.Perks.PolearmTree.Tree = array(7);
	//this.Const.Perks.PolearmTree.Tree[0].push(this.Const.Perks.PerkDefs.PTRTesting);
	this.Const.Perks.PolearmTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRBolster];
	this.Const.Perks.PolearmTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRLeverage];
	this.Const.Perks.PolearmTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRIntimidate];
	this.Const.Perks.PolearmTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecPolearm];
	this.Const.Perks.PolearmTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRUtilitarian];
	this.Const.Perks.PolearmTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRLongReach];
	this.Const.Perks.PolearmTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRFollowUp];

	this.Const.Perks.SlingTree.Tree = array(7);
	this.Const.Perks.SlingTree.Tree[0] = [this.Const.Perks.PerkDefs.Lookout];
	this.Const.Perks.SlingTree.Tree[1] = [this.Const.Perks.PerkDefs.LegendSpecialistSlingSkill];
	this.Const.Perks.SlingTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRPatience];
	this.Const.Perks.SlingTree.Tree[3] = [this.Const.Perks.PerkDefs.LegendMasterySlings];
	this.Const.Perks.SlingTree.Tree[4] = [this.Const.Perks.PerkDefs.LegendSpecialistSlingDamage];
	this.Const.Perks.SlingTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRHeavyProjectiles];
	this.Const.Perks.SlingTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRDeathFromAfar];

	this.Const.Perks.SpearTree.Tree = array(7);
	this.Const.Perks.SpearTree.SelfWeightMultiplier <- 1.5;
	this.Const.Perks.SpearTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRPointyEnd];
	this.Const.Perks.SpearTree.Tree[1] = [this.Const.Perks.PerkDefs.LegendSpecSpearWall];
	this.Const.Perks.SpearTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRThroughTheGaps];
	this.Const.Perks.SpearTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecSpear];
	this.Const.Perks.SpearTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRTwoForOne];
	this.Const.Perks.SpearTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRABetterGrip];
	this.Const.Perks.SpearTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRKingOfAllWeapons];

	this.Const.Perks.SwordTree.Tree = array(7);
	this.Const.Perks.SwordTree.Name = "Sword";
	this.Const.Perks.SwordTree.SelfWeightMultiplier <- 1.25;
	this.Const.Perks.SwordTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRVersatileWeapon];
	this.Const.Perks.SwordTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRExploitOpening];
	this.Const.Perks.SwordTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRFluidWeapon];
	this.Const.Perks.SwordTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecSword];
	this.Const.Perks.SwordTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRTempo];
	this.Const.Perks.SwordTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRKata];
	this.Const.Perks.SwordTree.Tree[6] = [this.Const.Perks.PerkDefs.PTREnGarde];

	this.Const.Perks.GreatSwordTree.Tree = array(7);

	foreach (i, row in this.Const.Perks.SwordTree.Tree)
	{
		::Const.Perks.GreatSwordTree.Tree[i] = [];
		foreach (entry in row)
		{
			this.Const.Perks.GreatSwordTree.Tree[i].push(entry);
		}
	}

	this.Const.Perks.StaffTree.Tree = array(7);
	this.Const.Perks.StaffTree.Tree[0] = [this.Const.Perks.PerkDefs.LegendSpecStaffSkill];
	this.Const.Perks.StaffTree.Tree[1] = [this.Const.Perks.PerkDefs.LegendOnslaught];
	this.Const.Perks.StaffTree.Tree[2] = [this.Const.Perks.PerkDefs.PTREasyTarget];
	this.Const.Perks.StaffTree.Tree[3] = [this.Const.Perks.PerkDefs.LegendMasteryStaves];
	this.Const.Perks.StaffTree.Tree[4] = [this.Const.Perks.PerkDefs.LegendSpecStaffStun];
	this.Const.Perks.StaffTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRWearThemDown];
	this.Const.Perks.StaffTree.Tree[6] = [this.Const.Perks.PerkDefs.PTRWhackASmack];

	this.Const.Perks.ThrowingTree.Tree = array(7);
	this.Const.Perks.ThrowingTree.Tree[0] = [this.Const.Perks.PerkDefs.PTRMomentum];
	this.Const.Perks.ThrowingTree.Tree[1] = [this.Const.Perks.PerkDefs.PTRSkirmisher];
	this.Const.Perks.ThrowingTree.Tree[2] = [this.Const.Perks.PerkDefs.PTRHybridization];
	this.Const.Perks.ThrowingTree.Tree[3] = [this.Const.Perks.PerkDefs.SpecThrowing];
	this.Const.Perks.ThrowingTree.Tree[4] = [this.Const.Perks.PerkDefs.PTROpportunist];
	this.Const.Perks.ThrowingTree.Tree[5] = [this.Const.Perks.PerkDefs.PTRNailedIt];
	this.Const.Perks.ThrowingTree.Tree[6] = [this.Const.Perks.PerkDefs.CloseCombatArcher];

	local idx = gt.Const.Perks.WeaponTrees.Tree.find(this.Const.Perks.GreatSwordTree);
	if (idx != null)
	{
		gt.Const.Perks.WeaponTrees.Tree.remove(idx);
	}	
}

gt.PTR.modDefenseTrees <- function ()
{
	this.Const.Perks.ShieldTree.Tree = array(7);
	gt.Const.Perks.ShieldTree.SelfWeightMultiplier <- 1.25;
	this.Const.Perks.ShieldTree.PerkGroupMultipliers <- [];
	this.Const.Perks.ShieldTree.Tree[0] = [this.Const.Perks.PerkDefs.STRPhalanx];
	this.Const.Perks.ShieldTree.Tree[1] = [this.Const.Perks.PerkDefs.STRCoverAlly];
	this.Const.Perks.ShieldTree.Tree[2] = [this.Const.Perks.PerkDefs.ShieldExpert];
	this.Const.Perks.ShieldTree.Tree[3] = [this.Const.Perks.PerkDefs.STRLineBreaker];
	this.Const.Perks.ShieldTree.Tree[4] = [];
	this.Const.Perks.ShieldTree.Tree[5] = [];
	this.Const.Perks.ShieldTree.Tree[6] = [];

	this.Const.Perks.HeavyArmorTree.Tree = array(7);
	gt.Const.Perks.HeavyArmorTree.SelfWeightMultiplier <- 0.33;
	this.Const.Perks.HeavyArmorTree.PerkGroupMultipliers <- [];
	this.Const.Perks.HeavyArmorTree.SpecialPerkMultipliers <- [
		[0.5, ::Const.Perks.PerkDefs.BFFencer]
	];
	this.Const.Perks.HeavyArmorTree.Tree[0] = [];
	this.Const.Perks.HeavyArmorTree.Tree[1] = [];
	this.Const.Perks.HeavyArmorTree.Tree[2] = [this.Const.Perks.PerkDefs.Brawny];
	this.Const.Perks.HeavyArmorTree.Tree[3] = [];
	this.Const.Perks.HeavyArmorTree.Tree[4] = [this.Const.Perks.PerkDefs.PTRBulwark];
	this.Const.Perks.HeavyArmorTree.Tree[5] = [this.Const.Perks.PerkDefs.BattleForged];
	this.Const.Perks.HeavyArmorTree.Tree[6] = [];

	this.Const.Perks.LightArmorTree.Tree = array(7);
	this.Const.Perks.LightArmorTree.PerkGroupMultipliers <- [];
	this.Const.Perks.LightArmorTree.SpecialPerkMultipliers <- [
		[2, ::Const.Perks.PerkDefs.BFFencer]
	];
	this.Const.Perks.LightArmorTree.Tree[0] = [];
	this.Const.Perks.LightArmorTree.Tree[1] = [this.Const.Perks.PerkDefs.Dodge];
	this.Const.Perks.LightArmorTree.Tree[2] = [this.Const.Perks.PerkDefs.Relentless];
	this.Const.Perks.LightArmorTree.Tree[3] = [];
	this.Const.Perks.LightArmorTree.Tree[4] = [];
	this.Const.Perks.LightArmorTree.Tree[5] = [this.Const.Perks.PerkDefs.Nimble];
	this.Const.Perks.LightArmorTree.Tree[6] = [];

	this.Const.Perks.MediumArmorTree.Tree = array(7);
	this.Const.Perks.MediumArmorTree.PerkGroupMultipliers <- [];
	this.Const.Perks.MediumArmorTree.SpecialPerkMultipliers <- [];
	this.Const.Perks.MediumArmorTree.Tree[0] = [];
	this.Const.Perks.MediumArmorTree.Tree[1] = [this.Const.Perks.PerkDefs.Dodge];
	this.Const.Perks.MediumArmorTree.Tree[2] = [this.Const.Perks.PerkDefs.LegendBalance];
	this.Const.Perks.MediumArmorTree.Tree[3] = [];
	this.Const.Perks.MediumArmorTree.Tree[4] = [];
	this.Const.Perks.MediumArmorTree.Tree[5] = [this.Const.Perks.PerkDefs.LegendLithe];
	this.Const.Perks.MediumArmorTree.Tree[6] = [];
}

gt.PTR.modMagicTrees <- function()
{
	gt.Const.Perks.CaptainMagicTree.Tree[1] = [];
}
