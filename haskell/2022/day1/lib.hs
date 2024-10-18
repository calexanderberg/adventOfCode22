import Data.List (sort)
import Data.List.Split (splitOn)
import Test.Hspec

part1 :: String -> Int
part1 = maximum . map (sum . map read . lines) . splitOn "\n\n"

part2 :: String -> Int
part2 = sum . take 3 . reverse . sort . map (sum . map read . lines) . splitOn "\n\n"

main = do
    input <- readFile "../inputs/day1.txt"
    part1 input `shouldBe` 68802
    part2 input `shouldBe` 205370
