import WordsCharacters
import PGF
import Data.Char
import Control.Monad
import Data.Maybe

containsSpace = elem ' '
quoteWords xs	| containsSpace xs = "\"" ++ xs ++ "\""
		| otherwise = xs

liftOp :: Monad m => (a -> b -> c) -> m a -> b -> m c
liftOp f a b = a >>= \a' -> return (f a' b)

allwords = map (\(x,y) -> y >>= \y' -> return ( id y')) gfWords
	
	
main :: IO ()
main = do
	--apids <- (snd . head) gfWords
	--advids <- (snd . head . tail) gfWords
	--pnids <- (snd . head . tail .tail) gfWords
	pnids <- fromMaybe (return [mkCId "drbean"]) (lookup "PN" gfWords)
	let pnwords = map showCId pnids
	let characters = unwords ( map ((++) "<TR><TD>") pnwords)

	ids <- mapM snd gfWords
	let words = map showCId (concat ids)

	let pos = map fst gfWords
	let tuples = zip pos ids

	let classifieds = unlines $ 
		map ( \(x,y) -> "<TR><TD>" ++ (posName x) ++ ":<TD>" ++ (unwords (  map showCId y) ) )
			tuples

	let sortedwords = unlines $ map (
		\i -> unwords $ ["<TR><TD>" ++ (toUpper i) : ":" ++ "<TD>" ] ++
		[ quoteWords (l:ls) | (l:ls) <- words, i==l ]
		) ('\'' : ['a'..'z'])

	putStrLn "<UL>"
	putStrLn "<LI><TABLE><CAPTION><H3>Names:</H3>"
	putStrLn characters
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>"
	putStr classifieds
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>"
	putStr $ sortedwords
	putStrLn "</TABLE>"
