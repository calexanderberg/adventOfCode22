module Day8.Lib where

import Data.Bits ((.|.))
import Data.List (transpose)

buildMatrix :: [String] -> [[Int]]
buildMatrix = map $ map $ read . pure

createMatrix :: [String] -> Int -> [[Int]]
createMatrix str n
  | n == 0 = zipWith (zipWith (.|.)) (matrixLines n buildMatrix) $ reverse . transpose $ matrixLines n $ transpose . reverse $ buildMatrix
  | n == 1 = zipWith (zipWith (*)) (matrixLines n buildMatrix) $ reverse . transpose $ matrixLines n $ transpose . reverse $ buildMatrix
  where
    buildMatrix = map (map (read . pure)) str

matrixLines :: Int -> [[Int]] -> [[Int]]
matrixLines n
  | n == 0 = map (\x -> zipWith max (seenItem (-1) x) $ reverse $ seenItem (-1) $ reverse x)
  | n == 1 = map (\x -> zipWith (*) (scenicItem x) $ reverse $ scenicItem $ reverse x)

seenItem :: Int -> [Int] -> [Int]
seenItem _ [] = []
seenItem a (x : xs) = fromEnum (a < x) : seenItem (max a x) xs

scenicItem :: [Int] -> [Int]
scenicItem [] = []
scenicItem (x : xs) = countLarger x xs : scenicItem xs
  where
    countLarger _ [] = 0
    countLarger a (y : ys) = if a <= y then 1 else 1 + countLarger a ys

part1 :: String -> Int
part1 str = length . filter (== 1) . concat $ createMatrix (lines str) 0

part2 :: String -> Int
part2 str = maximum . map maximum $ createMatrix (lines str) 1

main = do
    input <- readFile "./2022/inputs/day8.txt"
    part1 input `shouldBe` 1840
    part2 input `shouldBe` 405769
