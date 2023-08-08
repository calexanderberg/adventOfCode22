module Day1 where

readInstruction :: [String] -> [Int] -> [Int]
readInstruction [_h] val = val
readInstruction (h : t) val = readInstruction t (instruction (words h) val)

instruction :: [String] -> [Int] -> [Int]
-- Part 1 code
instruction ("forward" : t : rest) [x, y] = [x + read t, y]
instruction ("up" : t : rest) [x, y] = [x, y - read t]
instruction ("down" : t : rest) [x, y] = [x, y + read t]
-- Part 2 code
instruction ("forward" : t : rest) [x, y, z] = [x + read t, y + (read t * z), z]
instruction ("up" : t : rest) [x, y, z] = [x, y, z - read t]
instruction ("down" : t : rest) [x, y, z] = [x, y, z + read t]
instruction _h val = val

main :: IO ()
main = do
  file <- readFile "input.txt"
  let part2 = readInstruction (lines file) [0, 0, 0]
  putStrLn $ "Part 1: " ++ show (product (readInstruction (lines file) [0, 0]))
  putStrLn $ "Part 2: " ++ show (head part2 * (part2 !! 1))
