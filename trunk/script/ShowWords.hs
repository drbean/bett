import WordsCharacters
import PGF
import Data.Char
import Control.Monad

containsSpace = elem ' '
quoteWords xs	| containsSpace xs = "\"" ++ xs ++ "\""
		| otherwise = xs

liftOp :: Monad m => (a -> b -> c) -> m a -> b -> m c
liftOp f a b = a >>= \a' -> return (f a' b)

--classifieds = unlines $ 
--	map ( \x -> "<TR><TD>" ++ (posMap Map.! x) ++ ":<TD>" ++ (unwords (  map quoteWords $ gfWords Map.! x) ) )
--		pos

allwords = map (\(x,y) -> y >>= \y' -> return ( id y')) gfWords
	
	
main :: IO ()
main = do
	--apids <- (snd . head) gfWords
	--advids <- (snd . head . tail) gfWords
	--pnids <- (snd . head . tail .tail) gfWords
	--let pnwords = map showCId pnids
	--let characters = unwords ( map ((++) "<TR><TD>") pnwords)
	--let pos = map fst gfWords'

	let allwords' = map (\(x,y) -> y >>= \y' -> return ( map showCId y')) gfWords
	-- let allwords = sequence allwords'

	--let sortedwords = unlines $ map (
	--	\i -> unwords $ ["<TR><TD>" ++ (toUpper i) : ":" ++ "<TD>" ] ++
	--	[ quoteWords (l:ls) | (l:ls) <- allwords, i==l ]
	--	) ('\'' : ['a'..'z'])


	putStrLn "<UL>"
	putStrLn "<LI><TABLE><CAPTION><H3>Names:</H3>"
	-- putStrLn characters
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>"
	-- putStr classifieds
	putStrLn "</TABLE>"
	putStrLn "\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>"
	putStr $ unwords allwords'
	putStrLn "</TABLE>"
