module Day2 where

game :: [String] -> Int -> Int
game [] status = 0
game (h : t) status = case status of
  1 -> gameRound [head (words h), words h !! 1] + game t 1
  2 -> gameRound2 [head (words h), words h !! 1] + game t 2

gameRound :: [String] -> Int
gameRound [] = 0
gameRound [x, y] =
  case y of
    "X" -> case x of "A" -> 4; "B" -> 1; "C" -> 7
    "Y" -> case x of "A" -> 8; "B" -> 5; "C" -> 2
    "Z" -> case x of "A" -> 3; "B" -> 9; "C" -> 6

gameRound2 :: [String] -> Int
gameRound2 [] = 0
gameRound2 [x, y] =
  case y of
    "X" -> case x of "A" -> 3; "B" -> 1; "C" -> 2
    "Y" -> case x of "A" -> 4; "B" -> 5; "C" -> 6
    "Z" -> case x of "A" -> 8; "B" -> 9; "C" -> 7

part1 :: String -> Int
part1 file = game (lines file) 1

part2 :: String -> Int
part2 file = game (lines file) 2
