module Day4.Lib where

import Data.List.Split

numContain :: [String] -> Int -> Int
numContain [] _ = 0
numContain (h : t) x = case x of
  0 -> fromEnum (isFullyContained (take 2 nums) $ drop 2 nums) + numContain t 0
  1 -> fromEnum (isPartContained (take 2 nums) $ drop 2 nums) + numContain t 1
  where
    nums = concatMap (map read . splitOn "-") $ splitOn "," h

isFullyContained :: [Int] -> [Int] -> Bool
isFullyContained [h1, t1] [h2, t2] =
  (h1 >= h2 && t1 <= t2) || (h2 >= h1 && t2 <= t1)

isPartContained :: [Int] -> [Int] -> Bool
isPartContained [h1, t1] [h2, t2] = t1 >= h2 && t2 >= h1

part1 :: String -> Int
part1 file = numContain (lines file) 0

part2 :: String -> Int
part2 file = numContain (lines file) 1

main = do
    input <- readFile "./inputs/day4.txt"
    part1 input `shouldBe` 534
    part2 input `shouldBe` 841
