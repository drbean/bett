import Tests

main :: IO ()
main = do
	putStrLn "<H3>Example sentences:</H3>"
	putStrLn "<UL>"

	let lis = zipWith (++) (repeat "<LI>") dic_test
	let lilns = zipWith (++) lis (repeat "\n")
	putStr ( concat lilns )
	putStrLn "</UL>"
