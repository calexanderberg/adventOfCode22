module Main where

import Data.List (nub)

readInstruction :: String -> [[Int]] -> [[Int]]
readInstruction str lst = case words str of
  ["R", num] -> lst ++ [[t0, t1 + x] | x <- [1 .. read num]]
  ["L", num] -> lst ++ [[t0, t1 - x] | x <- [1 .. read num]]
  ["U", num] -> lst ++ [[t0 + x, t1] | x <- [1 .. read num]]
  ["D", num] -> lst ++ [[t0 - x, t1] | x <- [1 .. read num]]
  _ -> []
  where
    [t0, t1] = last lst

createHeadPath :: [[Int]] -> [String] -> [[Int]]
createHeadPath = foldl $ flip readInstruction

createTailPath :: [[Int]] -> [[Int]]
createTailPath [] = []
createTailPath (t : h : xs)
  | null xs = []
  | isNext = createTailPath (t : xs)
  | otherwise = h : createTailPath (h : xs)
  where
    isNext = isNeightbor t $ head xs

isNeightbor :: [Int] -> [Int] -> Bool
isNeightbor [t0, t1] [h0, h1] = 2 > sqrt (fromIntegral $ (h0 - t0) ^ 2 + (h1 - t1) ^ 2)

part1 :: String -> Int
part1 str = length $ nub $ createTailPath $ createHeadPath [[0, 0]] $ lines str

part2 :: String -> Int
part2 str = length $ nub $ createTailPath $ createHeadPath [[0, 0]] $ lines str

main :: IO ()
main = do
  file <- readFile "input.txt"
  print $ part1 file
  print $ part2 file
