import Parsing
import Cats
import Story_Cats
import Data.Char
import Data.List

characters = sort $ map toupper $ map (phon . head) proper_names

collect_lex = [
        ("auxiliary verbs",     aux ++ cops),
        ("adjectives",   story_adjs),
        ("interesting verbs",   story_verbs),
        ("WH words",   interrogatives),
        -- ("intransitive verbs",  intransitives),
        -- ("transitive verbs",    transitives),
        -- ("ditransitive verbs",  ditransitives),
        ("object_names",        object_names),
        ("class_names", class_names),
        ("prepositions",        preps),
        ("determiners", determiners),
        ("possessives", possessives)
        ]

classifieds = unlines $ 
	map ( \x -> fst x ++ ":\t" ++ (unwords $ map ( phon . head ) (snd x)) )
	collect_lex


otherwords = map (phon . head) $
	object_names ++ class_names ++ story_verbs ++ story_adjs ++ story_aux ++
	topic_transitives ++
--	prons ++ reflexives ++ interrogatives ++
	aux ++ transitives ++ ditransitives ++ -- intransitives ++ 
	preps ++ determiners ++ possessives
	++ conjuncts

sortedwords = unlines $ map (
	\i -> unwords $ [(toUpper i) : ":"] ++
	[ (l:ls) | (l:ls) <- otherwords, i==l ]
	) ['a'..'z']


main = do
	putStrLn "Names:"
	putStrLn $ unwords characters
	putStrLn "\nOther words (classified):"
	putStr classifieds
	putStrLn "\nWords (in alphabetical order):"
	putStr sortedwords
