module Day3 where

import Data.List

checkRuck :: [String] -> Int
checkRuck = sum . map (calValue . findChar . splitHalf)
  where
    splitHalf str = [take (length str `div` 2) str, drop (length str `div` 2) str]

checkRucks :: [String] -> Int
checkRucks [] = 0
checkRucks (x : y : z : rest) = calValue (findChar [x, y, z]) + checkRucks rest

calValue :: [Char] -> Int
calValue = sum . map (\c -> maybe 0 (+ 1) (elemIndex c alphabet))

findChar :: [String] -> [Char]
findChar strings
  | length strings == 2 = nub (filter (`elem` last strings) (head strings))
  | length strings == 3 = nub (filter (\c -> c `elem` (strings !! 1) && c `elem` last strings) (head strings))
  | otherwise = []

alphabet :: String
alphabet = ['a' .. 'z'] ++ ['A' .. 'Z']

main :: IO ()
main = do
  file <- readFile "input.txt"
  putStrLn $ "Part 1: " ++ show (checkRuck (lines file))
  putStrLn $ "Part 2: " ++ show (checkRucks (lines file))
