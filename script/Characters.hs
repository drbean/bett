import Model
import Parsing
import Cats
import Story_Cats

main = do
	putStr $ concat $ map (\x -> unlines [fst x, show $ snd x] ) characters

