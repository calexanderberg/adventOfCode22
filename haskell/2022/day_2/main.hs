module Day2 where

game :: [String] -> Int -> Int
game [] status = 0
game (h : t) status = case status of
  1 -> gameRound [head (words h), words h !! 1] + game t 1
  2 -> gameRound2 [head (words h), words h !! 1] + game t 2

gameRound :: [String] -> Int
gameRound [] = 0
gameRound [x, "X"] =
  1 + case x of
    "A" -> 3
    "B" -> 0
    "C" -> 6
gameRound [x, "Y"] =
  2 + case x of
    "A" -> 6
    "B" -> 3
    "C" -> 0
gameRound [x, "Z"] =
  3 + case x of
    "A" -> 0
    "B" -> 6
    "C" -> 3

gameRound2 :: [String] -> Int
gameRound2 [] = 0
gameRound2 [x, "X"] =
  0 + case x of
    "A" -> 3
    "B" -> 1
    "C" -> 2
gameRound2 [x, "Y"] =
  3 + case x of
    "A" -> 1
    "B" -> 2
    "C" -> 3
gameRound2 [x, "Z"] =
  6 + case x of
    "A" -> 2
    "B" -> 3
    "C" -> 1

main :: IO ()
main = do
  file <- readFile "input.txt"
  putStrLn $ "Part 1: " ++ show (game (lines file) 1)
  putStrLn $ "Part 2: " ++ show (game (lines file) 2)
