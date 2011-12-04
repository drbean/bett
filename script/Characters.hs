import Model
import Parsing
import Story_Parsing

main = do
	putStr $ concat $ map (\x ->
		unlines [x, show $ maybe Unspec id $ lookup x characters]) $
			map (phon . head) $ proper_names ++ object_names

