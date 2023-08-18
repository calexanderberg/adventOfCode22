module Main where

import Data.Char (isDigit)

calcDirValue :: [String] -> [String] -> Int -> String -> [Int]
calcDirValue list [] val _
  | val >= 100000 = []
  | otherwise = [val]
calcDirValue list (x : xs) val dir
  | command !! 1 == "ls" = calcDirValue list xs val dir
  | head command == "dir" = case find of
      [] -> find
      _ -> find ++ calcDirValue list xs (val + head find) dir
  | isDigit (head x) = calcDirValue list xs (val + read (head command)) dir
  | otherwise = [val]
  where
    command = words x
    find = navTo list xs dir (dir ++ (command !! 1))

navTo :: [String] -> [String] -> String -> String -> [Int]
navTo list [] current goal = navTo list list "/" goal
navTo list (x : xs) current goal
  | command !! 1 == "cd" = case command !! 2 of
      ".." -> navTo list xs (init current) goal
      lastSegment -> navTo list xs (current ++ (command !! 2)) goal
  | current == goal && x == "$ ls" = calcDirValue list xs 0 current
  | otherwise = navTo list xs current goal
  where
    command = words x
    lastSegment = last current

part1 :: [String] -> [Int]
part1 (x : xs) = calcDirValue xs xs 0 "/"

main :: IO ()
main = do
  file <- readFile "test.txt"
  file2 <- readFile "input.txt"
  putStrLn $ "Test: " ++ show (part1 (lines file))
  putStrLn $ "Input: " ++ show (part1 (lines file2))
