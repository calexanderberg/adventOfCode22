module Day_1.Day1 where

import Data.List (sort)

countCal :: [String] -> Int -> [Int]
countCal [] _ = []
countCal ("" : t) val = val : countCal t 0
countCal (h : t) val = countCal t (val + read h)

part1 :: String -> Int
part1 file = maximum (countCal (lines file) 0)

part2 :: String -> Int
part2 file = sum (drop (length list - 3) list)
  where
    list = sort $ countCal (lines file) 0
