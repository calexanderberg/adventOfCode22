module Main where

import Criterion.Main
import Day_1.Day1 qualified as Day1
import Day_2.Day2 qualified as Day2
import Day_3.Day3 qualified as Day3
import Day_4.Day4 qualified as Day4
import Test.Hspec

readInputFile :: FilePath -> IO String
readInputFile = readFile

spec :: Spec
spec = do
  describe "2022 solutions" $ do
    describe "Day 1" $ do
      input <- runIO (readInputFile "day_1/input.txt")
      it "part 1 should return the expected value" $
        Day1.part1 input `shouldBe` 68802

      it "part 2 should return the expected value" $
        Day1.part2 input `shouldBe` 205370

    describe "Day 2" $ do
      input <- runIO (readInputFile "day_2/input.txt")
      it "part 1 should return the expected value" $
        Day2.part1 input `shouldBe` 14069

      it "part 2 should return the expected value" $
        Day2.part2 input `shouldBe` 12411

    describe "Day 3" $ do
      input <- runIO (readInputFile "day_3/input.txt")
      it "part 1 should return the expected value" $
        Day3.part1 input `shouldBe` 7553

      it "part 2 should return the expected value" $
        Day3.part2 input `shouldBe` 2758

    describe "Day 4" $ do
      input <- runIO (readInputFile "day_4/input.txt")
      it "part 1 should return the expected value" $
        Day4.part1 input `shouldBe` 534

      it "part 2 should return the expected value" $
        Day4.part2 input `shouldBe` 841

benchmarkPart :: String -> (String -> Int) -> FilePath -> Benchmark
benchmarkPart identifier partFn inputFile =
  bench (identifier ++ ": " ++ inputFile) $ nfIO $ do
    content <- readInputFile inputFile
    return (partFn content)

benchmarks :: [Benchmark]
benchmarks =
  [ benchmarkPart "Day 1, Part 1" Day1.part1 "day_1/input.txt",
    benchmarkPart "Day 1, Part 2" Day1.part2 "day_1/input.txt",
    benchmarkPart "Day 2, Part 1" Day2.part1 "day_2/input.txt",
    benchmarkPart "Day 2, Part 2" Day2.part2 "day_2/input.txt",
    benchmarkPart "Day 3, Part 1" Day3.part1 "day_3/input.txt",
    benchmarkPart "Day 3, Part 2" Day3.part2 "day_3/input.txt",
    benchmarkPart "Day 4, Part 1" Day4.part1 "day_4/input.txt",
    benchmarkPart "Day 4, Part 2" Day4.part2 "day_4/input.txt"
  ]

main :: IO ()
main = do
  hspec spec
  defaultMain benchmarks
