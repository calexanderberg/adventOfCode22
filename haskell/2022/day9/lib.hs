module Day9.Lib where

import Data.List (nub)

part1 :: String -> Int
part1 = length . nub . ropeLength 1 . headPath [[0, 0]] . lines

-- part2 = length . nub . ropeLength 10 . headPath [[0, 0]] . lines

ropeLength :: Int -> [[Int]] -> [[Int]]
ropeLength 0 lst = lst
ropeLength n (x : xs) = ropeLength (n - 1) $ x : tailPath (x : xs)

readInstruction :: String -> [[Int]] -> [[Int]]
readInstruction str lst = case words str of
  ["R", num] -> lst ++ [[t0, t1 + x] | x <- [1 .. read num]]
  ["L", num] -> lst ++ [[t0, t1 - x] | x <- [1 .. read num]]
  ["U", num] -> lst ++ [[t0 + x, t1] | x <- [1 .. read num]]
  ["D", num] -> lst ++ [[t0 - x, t1] | x <- [1 .. read num]]
  _ -> []
  where
    [t0, t1] = last lst

headPath :: [[Int]] -> [String] -> [[Int]]
headPath = foldl $ flip readInstruction

tailPath :: [[Int]] -> [[Int]]
tailPath [] = []
tailPath (t : h : xs)
  | null xs = []
  | isNext = tailPath (t : xs)
  | otherwise = h : tailPath (h : xs)
  where
    isNext = isNeightbor t $ head xs

isNeightbor :: [Int] -> [Int] -> Bool
isNeightbor [t0, t1] [h0, h1] = (h0 - t0) ^ 2 + (h1 - t1) ^ 2 < 4

main = do
    input <- readFile "./2022/inputs/day9.txt"
    part1 input `shouldBe` 5878
