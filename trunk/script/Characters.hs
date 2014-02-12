import Model

main = do
	putStr $ concat $ map (\x -> unlines [fst x, show $ snd x] ) characters

