game.ProjectileData.ModsNikkelMHadesBiomesRubbleFall = game.DeepCopyTable(game.ProjectileData.RubbleFall)
-- So it doesn't deal more damage to enemies than it should, and it doesn't destroy the rubble obstacles it spawns itself
game.ProjectileData.ModsNikkelMHadesBiomesRubbleFall.OutgoingDamageModifiers = { { ObstacleMultiplier = 0.0, }, }
