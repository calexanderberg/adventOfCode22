module Day1 where

readInputFile :: String -> [Int]
readInputFile content = map read (lines content)

average :: [Int] -> [Int] -> [Int]
average [_h] sumList = sumList
average (h : t) sumList = average t (sumList ++ [sum (take 3 (h : t))])

countInc :: [Int] -> Int
countInc list = count list 0

count :: [Int] -> Int -> Int
count [_h] num = num
count (h : t) num = count t (num + fromEnum (head t > h))

main :: IO ()
main = do
  file <- readFile "input.txt"
  let val1 = countInc (readInputFile file)
  let val2 = countInc (average (readInputFile file) [])
  putStrLn $ "Part 1: " ++ show val1
  putStrLn $ "Part 2: " ++ show val2
