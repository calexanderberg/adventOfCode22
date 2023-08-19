module Main where

import Data.Bits ((.|.))
import Data.List (transpose)

buildMatrix :: [String] -> [[Int]]
buildMatrix = map (map (read . pure))

seenItem :: Int -> [Int] -> [Int]
seenItem _ [] = []
seenItem a (x : xs)
  | a < x = 1 : seenItem x xs
  | otherwise = 0 : seenItem a xs

seenLines :: [[Int]] -> [[Int]]
seenLines = map (\x -> zipWith max (seenItem (-1) x) $ reverse $ seenItem (-1) $ reverse x)

seenMatrix :: [String] -> [[Int]]
seenMatrix str = zipWith (zipWith (.|.)) (seenLines $ buildMatrix str) $ reverse . transpose $ seenLines $ transpose . reverse $ buildMatrix str

countSeen :: [[Int]] -> Int
countSeen matrix = sum [1 | x <- concat matrix, x == 1]

part1 :: String -> Int
part1 = countSeen . seenMatrix . lines

main :: IO ()
main = do
  file <- readFile "input.txt"
  print $ part1 file

-- putStrLn $ "Part 2: " ++ show (part1 file)
