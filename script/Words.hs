import Parsing
import Cats
import Story_Cats
import Topic_Cats
import Data.Char
import Data.List

characters = sort $ map ("<LI>" ++ ) $ map toupper $ map (phon . head) proper_names


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
	map ( \x -> "<TR><TD>" ++ fst x ++ "<TD>" ++ (unwords $ map ( phon . head ) (snd x)) )
	collect_lex


otherwords = map (phon . head) $
	object_names ++ class_names ++ story_verbs ++ story_adjs ++ story_aux ++
	topic_transitives ++
--	prons ++ reflexives ++ interrogatives ++
	aux ++ transitives ++ ditransitives ++ -- intransitives ++ 
	preps ++ determiners ++ possessives
	++ conjuncts

sortedwords = unlines $ map (
	\i -> unwords $ ["<TR><TD>" ++ (toUpper i) : ":" ++ "<TD>" ] ++
	[ (l:ls) | (l:ls) <- otherwords, i==l ]
	) ['a'..'z']


main = do
	putStrLn "<UL>"
	putStrLn "<LI><TABLE><TR><TH>Names:"
	putStrLn $ "<TD><UL>" ++ unwords characters
	putStrLn "</UL></TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION>Other words (classified):"
	putStr classifieds
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION>Words (in alphabetical order):"
	putStr sortedwords
	putStrLn "</TABLE>"
