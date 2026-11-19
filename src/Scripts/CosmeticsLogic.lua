public.ApplyCardAltarGlow = function(source, args)
	args = args or {
		Foreground = { 162, 255, 119, 131 },
		Additive = { 159, 255, 115, 122 },
	}

	game.SetColor({ Id = 588763, Color = args.Foreground, SetBase = true })
	game.SetColor({ Id = 589565, Color = args.Additive, SetBase = true })
end
