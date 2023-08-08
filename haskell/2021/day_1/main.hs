module Day1 where

readInputFile :: String -> [Int]
readInputFile content = map read (lines content)

countInc :: [Int] -> Int
countInc list = count list 0

count :: [Int] -> Int -> Int
count [] num = num
count [_h] num = num
count (h : t) num = count t (num + fromEnum (head t > h))

main :: IO ()
main = do
  file <- readFile "input.txt"
  let val1 = countInc (readInputFile file)
  putStrLn "Part 1: "
  print val1
