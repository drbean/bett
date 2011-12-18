import Model
import Parsing
import Cats
import Story_Cats

main = do
	putStr $ concat $ map (\x ->
		unlines [x, show $ maybe Unspec id $ lookup x characters]) $
			map (phon . head) $ proper_names ++ object_names

