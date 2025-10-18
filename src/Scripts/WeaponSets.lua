table.insert(game.WeaponSets.TrapWeapons, "HadesSpikeTrapWeapon")

local hadesExpireProjectileExcludeProjectileNames = {
	"AresProjectile",
	"AthenaDeflectingProjectile",
	"DemeterProjectile",
	"GunGrenadeToss",
	"GunGrenadeSelfDamage",
	"ConsecrationField",
	"DionysusLobProjectile",
	"DionysusField",
	"ArtemisProjectile",
	"ArtemisSuperProjectile",
	"AphroditeSuperCharm",
	"AphroditeMaxSuperCharm",
	"DemeterSuper",
	"DemeterMaxSuper",
	"TheseusSpearThrow ",
	"TheseusSpearThrowReturn",
	"LavaTileWeapon",
	"LavaTileTriangle01Weapon",
	"LavaTileTriangle02Weapon",
	"NPC_FurySister_01_Assist",
	"NPC_Thanatos_01_Assist",
	"ThanatosDeathCurseAoE",
	"NPC_Sisyphus_01_Assist",
	"TheseusSpearThrow",
	"HadesCastBeam",
	"HadesCastBeamNoTracking",
	"HadesCerberusAssist",
}

game.WeaponSets.ExpireProjectileExcludeProjectileNames = game.CombineTablesIPairs(
	game.WeaponSets.ExpireProjectileExcludeProjectileNames,
	hadesExpireProjectileExcludeProjectileNames
)
