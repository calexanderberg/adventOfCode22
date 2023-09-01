module Day6.Lib where

import Data.List (nub)

checkString :: String -> Int -> Int
checkString str val
  | length group == val = val
  | otherwise = 1 + checkString (drop 1 str) val
  where
    group = nub $ take val str

part1 :: String -> Int
part1 str = checkString str 4

part2 :: String -> Int
part2 str = checkString str 14
