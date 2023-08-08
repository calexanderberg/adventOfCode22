module Day1 where

readInputFile :: String -> [Int]
readInputFile content = map read (lines content)

average :: [Int] -> [Int] -> [Int]
average [_h] sumList = sumList
average (h : t) sumList = average t (sumList ++ [sum (take 3 (h : t))])

count :: [Int] -> Int -> Int
count [_h] num = num
count (h : t) num = count t (num + fromEnum (head t > h))

main :: IO ()
main = do
  file <- readFile "input.txt"
  putStrLn $ "Part 1: " ++ show (count (readInputFile file) 0)
  putStrLn $ "Part 2: " ++ show (count (average (readInputFile file) []) 0)
