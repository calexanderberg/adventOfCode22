module Day3 where

import Data.List (transpose)

createVal :: [[Char]] -> [Char]
createVal (h : t) = show (fromEnum (averageChar h >= 1)) ++ createVal t
createVal [] = []

averageChar :: [Char] -> Int
averageChar ('0' : t) = -1 + averageChar t
averageChar ('1' : t) = 1 + averageChar t
averageChar _h = 0

inverseDigits :: [Char] -> [Char]
inverseDigits (h : t) = show (fromEnum (read [h] == 0)) ++ inverseDigits t
inverseDigits [] = []

binaryToDecimal :: String -> Int
binaryToDecimal = foldl (\acc bit -> acc * 2 + read [bit]) 0

main :: IO ()
main =
  do
    file <- readFile "test.txt"
    let binary = createVal (transpose (lines file))
    putStrLn $ "Part 1: " ++ show ((binaryToDecimal binary) * (binaryToDecimal (inverseDigits binary)))

-- putStrLn $ "Part 2: " ++ show (filterOut (lines file) 0)
