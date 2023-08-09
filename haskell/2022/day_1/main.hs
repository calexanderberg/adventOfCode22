module Day1 where

import Data.List (sort)

countCal :: [String] -> Int -> [Int]
countCal [] _ = []
countCal ("" : t) val = val : countCal t 0
countCal (h : t) val = countCal t (val + read h)

main :: IO ()
main = do
  file <- readFile "input.txt"
  let list = sort (countCal (lines file) 0)
  putStrLn $ "Part 1: " ++ show (maximum list)
  putStrLn $ "Part 2: " ++ show (sum (drop (length list - 3) list))
