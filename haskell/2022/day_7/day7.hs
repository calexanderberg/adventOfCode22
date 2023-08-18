module Day_7.Day7 where

import Data.Char (isDigit)

calcDirValue :: [String] -> [String] -> Int -> [String] -> [Int]
calcDirValue list [] val dir = [val]
calcDirValue list (x : xs) val dir
  | head command == "dir" = calcDirValue list xs (val + head find) dir ++ find
  | isDigit (head x) = calcDirValue list xs (val + read (head command)) dir
  | length command == 3 = [val]
  | otherwise = calcDirValue list xs val dir
  where
    command = words x
    find = navTo list xs dir $ dir ++ [command !! 1]

navTo :: [String] -> [String] -> [String] -> [String] -> [Int]
navTo list [] current goal = navTo list list ["/"] goal
navTo list (x : xs) current goal
  | current == goal = calcDirValue list xs 0 current
  | length command == 3 && last command == ".." = navTo list xs (init current) goal
  | length command == 3 && command !! 1 == "cd" = navTo list xs (current ++ [last command]) goal
  | otherwise = navTo list xs current goal
  where
    command = words x

createList :: [String] -> [Int]
createList (x : xs) = calcDirValue xs xs 0 ["/"]

part1 :: String -> Int
part1 file = sum $ filter (<= 100000) $ createList $ lines file

part2 :: String -> Int
part2 file = minimum $ filter (>= sizeToDel) list
  where
    sizeToDel = 30000000 - (70000000 - head list)
    list = createList (lines file)
