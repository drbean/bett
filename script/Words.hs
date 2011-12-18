import Parsing
import Cats
import Story_Cats
import Data.Char
import Data.List

characters = sort $ map toupper $ map (phon . head) proper_names

collect_lex = [
        ("auxiliary verbs",     aux),
        ("interesting verbs",   story_verbs),
        ("intransitive verbs",  intransitives),
        ("transitive verbs",    transitives),
        ("ditransitive verbs",  ditransitives),
        ("object_names",        object_names),
        ("class_names", class_names),
        ("prepositions",        preps),
        ("determiners", determiners),
        ("possessives", possessives)
        ]


otherwords = map (phon . head) $
	object_names ++ class_names ++
--	prons ++ reflexives ++ interrogatives ++
	aux ++ intransitives ++ transitives ++ ditransitives ++
	preps ++ determiners ++ possessives
--	++ conjuncts

sortedwords = unlines $ map (
	\i -> unwords $ [(toUpper i) : ":"] ++
	[ (l:ls) | (l:ls) <- otherwords, i==l ]
	) ['a'..'z']


classifieds = unlines $ 
	map ( \x -> fst x ++ ":\t" ++ (unwords $ map ( phon . head ) (snd x)) )
	collect_lex

main = do
	putStrLn "Names:"
	putStrLn $ unwords characters
	putStrLn "\nOther words (classified):"
	putStr classifieds
	putStrLn "\nOther words (in alphabetical order):"
	putStr sortedwords
