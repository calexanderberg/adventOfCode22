module Day1 where

readInstruction :: [String] -> [Int] -> [Int]
readInstruction [_h] val = val
readInstruction (h : t) val = readInstruction t (instruction (words h) val)

instruction :: [String] -> [Int] -> [Int]
instruction ["forward", t] [x, y] = [x + read t, y]
instruction ["forward", t] [x, y, z] = [x + read t, y + (read t * z), z]
instruction ["up", t] val = init val ++ [last val - read t]
instruction ["down", t] val = init val ++ [last val + read t]
instruction _h val = val

main :: IO ()
main = do
  file <- readFile "input.txt"
  putStrLn $ "Part 1: " ++ show (product (readInstruction (lines file) [0, 0]))
  let part2 = readInstruction (lines file) [0, 0, 0]
  putStrLn $ "Part 2: " ++ show (head part2 * (part2 !! 1))
