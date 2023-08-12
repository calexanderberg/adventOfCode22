module Day_5.Day5 where

buildList :: [String] -> [String] -> Int -> String
buildList [] list _ = map head list
buildList (h : t) list val = case val of
  0 -> buildList t (transferList splited1 0 [z, y] list) 0
  1 -> buildList t (transferList splited2 0 [z, y] list) 1
  where
    [x, y, z] = [read (words h !! i) | i <- [1, 3, 5]]
    splited1 = [reverse (take x (list !! (y - 1))), drop x (list !! (y - 1))]
    splited2 = [take x (list !! (y - 1)), drop x (list !! (y - 1))]

transferList :: [String] -> Int -> [Int] -> [String] -> [String]
transferList _ _ _ [] = []
transferList [str1, str2] count [z, y] (h : t)
  | (z - 1) == count = (str1 ++ h) : transferRest
  | (y - 1) == count = str2 : transferRest
  | otherwise = h : transferRest
  where
    transferRest = transferList [str1, str2] (count + 1) [z, y] t

build1 str = buildList str input 0

build2 str = buildList str input 1

part1 :: String -> String
part1 file = build1 (lines file)

part2 :: String -> String
part2 file = build2 (lines file)

test :: [[Char]]
test = [['N', 'Z'], ['D', 'C', 'M'], ['P']]

input :: [[Char]]
input = [['Z', 'P', 'B', 'Q', 'M', 'D', 'N'], ['V', 'H', 'D', 'M', 'Q', 'Z', 'L', 'C'], ['G', 'Z', 'F', 'V', 'D', 'R', 'H', 'Q'], ['N', 'F', 'D', 'G', 'H'], ['Q', 'F', 'N'], ['T', 'B', 'F', 'Z', 'V', 'Q', 'D'], ['H', 'S', 'V', 'D', 'Z', 'T', 'M', 'Q'], ['Q', 'N', 'P', 'F', 'G', 'M'], ['M', 'R', 'W', 'B']]
