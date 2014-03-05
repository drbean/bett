import Parsing
import Cats
import qualified Story_Cats as Story
import qualified Topic_Cats as Topic
import Data.Char
import Data.List

characters = unwords $ sort $ map ("<TR><TD>" ++ ) $ map toupper $ map (phon . head) Story.names


collect_lex = [
        ("auxiliary verbs",     aux ++ cops),
        ("adjectives",   Story.adjs),
        ("interesting verbs",   Story.verbs),
        ("other verbs",        transitives ++ ditransitives),
        ("WH words",   interrogatives),
        -- ("intransitive verbs",  intransitives),
        -- ("transitive verbs",    transitives),
        -- ("ditransitive verbs",  ditransitives),
        ("object_names",        Story.nouns),
        ("class_names", class_names),
        ("pronouns",        prons),
        ("prepositions",        preps),
        ("determiners", determiners),
        ("possessives", possessives)
        ]

classifieds = unlines $ 
	map ( \x -> "<TR><TD>" ++ fst x ++ ":<TD>" ++ (unwords $ map ( phon . head ) (snd x)) )
	collect_lex


otherwords = map (phon . head) $
	Story.nouns ++ class_names ++ Story.verbs ++ Story.adjs ++ Story.advs ++ Story.aux ++
	Topic.transitives ++
	prons ++ 
--	reflexives ++ 
	interrogatives ++
	aux ++ transitives ++ ditransitives ++ -- intransitives ++ 
	preps ++ determiners ++ possessives
	++ conjuncts

sortedwords = unlines $ map (
	\i -> unwords $ ["<TR><TD>" ++ (toUpper i) : ":" ++ "<TD>" ] ++
	[ (l:ls) | (l:ls) <- otherwords, i==l ]
	) ['\'' 'a'..'z']


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
