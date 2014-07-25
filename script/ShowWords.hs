import WordsCharacters
import qualified Data.Map as Map
import Data.Char

characters = unwords ( map ("<TR><TD>" ++ ) (gfWords Map.! "PN" ))
pos = Map.keys gfWords

containsSpace = elem ' '
quoteWords xs	| containsSpace xs = "\"" ++ xs ++ "\""
		| otherwise = xs

classifieds = unlines $ 
	map ( \x -> "<TR><TD>" ++ (posMap Map.! x) ++ ":<TD>" ++ (unwords (  map quoteWords $ gfWords Map.! x) ) )
		pos
	


allwords = concat ( map (\x -> gfWords Map.! x) pos )

sortedwords = unlines $ map (
	\i -> unwords $ ["<TR><TD>" ++ (toUpper i) : ":" ++ "<TD>" ] ++
	[ (l:ls) | (l:ls) <- allwords, i==l ]
	) ('\'' : ['a'..'z'])


main = do
	putStrLn "<UL>"
	putStrLn "<LI><TABLE><CAPTION><H3>Names:</H3>"
	putStrLn characters
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>"
	putStr classifieds
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>"
	putStr sortedwords
	putStrLn "</TABLE>"
