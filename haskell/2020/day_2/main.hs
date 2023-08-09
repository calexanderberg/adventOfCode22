module Day2 where

import Data.List.Split (splitOn)

checkPasswords :: [String] -> Int
checkPasswords [] = 0
checkPasswords (h : t) = checkPassword (words h !! 2) (head (words h !! 1)) (map read $ concatMap (splitOn "-") (words (head (words h)))) + checkPasswords t

checkPassword :: String -> Char -> [Int] -> Int
checkPassword str c [x, y]
  | x <= length (filter (== c) str) && length (filter (== c) str) <= y = 1
  | otherwise = 0

checkNewPasswords :: [String] -> Int
checkNewPasswords [] = 0
checkNewPasswords (h : t) = checkNewPassword (words h !! 2) (head (words h !! 1)) (map read $ concatMap (splitOn "-") (words (head (words h)))) + checkNewPasswords t

checkNewPassword :: String -> Char -> [Int] -> Int
checkNewPassword str c [x, y]
  | x <= length str && y <= length str && (((str !! (x - 1)) == c) /= ((str !! (y - 1)) == c)) = 1
  | otherwise = 0

main :: IO ()
main = do
  file <- readFile "input.txt"
  putStrLn $ "Part 1: " ++ show (checkPasswords (lines file))
  putStrLn $ "Part 2: " ++ show (checkNewPasswords (lines file))
