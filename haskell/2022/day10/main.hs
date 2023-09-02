module Main where

fetch :: [String] -> [Int]
fetch [] = []
fetch (x : xs)
  | head (words x) == "noop" = 0 : fetch xs
  | otherwise = 0 : read (words x !! 1) : fetch xs

execute :: Int -> Int -> [Int] -> [Int]
execute _ _ [] = []
execute register counter (x : xs)
  | counter `elem` [20, 60, 100, 140, 180, 220] = (register + x) * counter : execute (x + register) (counter + 1) xs
  | otherwise = execute (x + register) (counter + 1) xs

-- part1 :: String -> Int
part1 = execute 1 1 . fetch . lines

main :: IO ()
main = do
  file <- readFile "test.txt"
  print $ part1 file
  file <- readFile "input.txt"
  print $ part1 file
