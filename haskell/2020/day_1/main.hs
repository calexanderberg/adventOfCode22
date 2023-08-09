module Day1 where

sumCounter :: [String] -> Int -> [Int]
sumCounter [] _ = []
sumCounter (h : t) val =
  if (val - read h) `elem` map read t
    then [read h, val - read h]
    else sumCounter t val

sumCounter2 :: [String] -> Int -> [Int]
sumCounter2 [] _ = []
sumCounter2 (h : t) val =
  if null (sumCounter t (val - read h))
    then sumCounter2 t val
    else read h : sumCounter t (val - read h)

main :: IO ()
main = do
  file <- readFile "input.txt"
  putStrLn $ "Part 1: " ++ show (product (sumCounter (lines file) 2020))
  putStrLn $ "Part 2: " ++ show (product (sumCounter2 (lines file) 2020))
