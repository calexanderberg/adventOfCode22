module Day_4.Day4 where

import Data.List.Split

numContain :: [String] -> Int -> Int
numContain [] _ = 0
numContain (h : t) x = case x of
  0 -> fromEnum (isFullyContained (take 2 nums) (drop 2 nums)) + numContain t 0
  1 -> fromEnum (isPartContained (take 2 nums) (drop 2 nums)) + numContain t 1
  where
    nums = concatMap (map read . splitOn "-") (splitOn "," h)

isFullyContained :: [Int] -> [Int] -> Bool
isFullyContained xs ys =
  (minimum xs >= minimum ys && maximum xs <= maximum ys)
    || (minimum ys >= minimum xs && maximum ys <= maximum xs)

isPartContained :: [Int] -> [Int] -> Bool
isPartContained [h1, t1] [h2, t2] = t1 >= h2 && t2 >= h1

part1 :: String -> Int
part1 file = numContain (lines file) 0

part2 :: String -> Int
part2 file = numContain (lines file) 1
