module Main where

import Data.Char (isDigit)

findDir :: [String] -> String -> [Int]
findDir (x : xs) str
  | x == str = calcDirValue xs 0
  | otherwise = findDir xs str

calcDirValue :: [String] -> Int -> [Int]
calcDirValue [] val = [val]
calcDirValue (x : xs) val
  | command !! 1 == "ls" = calcDirValue xs val
  | head command == "dir" = finder ++ calcDirValue xs (val + head finder)
  | isDigit (head x) = calcDirValue xs (val + read (head command))
  | otherwise = [val]
  where
    command = words x
    finder = findDir xs ("$ cd " ++ (command !! 1))

part1 :: [String] -> [Int]
part1 (x : xs) = calcDirValue xs 0

main :: IO ()
main = do
  file <- readFile "test.txt"
  putStrLn $ "Part 1: " ++ show (part1 (lines file))

-- I expect part1 to return Part 1: [48381165,94853,584,24933642]
-- Instead it returns Part 1: [48381165,94853,584]
