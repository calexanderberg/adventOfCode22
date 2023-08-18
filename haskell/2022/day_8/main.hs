module Main where

import Data.List (transpose)

numVisible :: [String] -> Int
numVisible (x : xs) = 1

checkAllDirections :: [String] -> Int
checkAllDirections l = sum $ map numVisible [l, reverse l, transpose l, reverse (transpose l)]

part1 :: String -> Int
part1 file = checkAllDirections (lines file)

main :: IO ()
main = do
  file <- readFile "test.txt"
  putStrLn $ "Part 1: " ++ show (part1 file)
  putStrLn $ "Part 2: " ++ show (part1 file)
