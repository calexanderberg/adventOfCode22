module Main where

import Criterion.Main
import Day_1.Day1 qualified as Day1
import Day_2.Day2 qualified as Day2
import Day_3.Day3 qualified as Day3
import Day_4.Day4 qualified as Day4
import Day_5.Day5 qualified as Day5
import Day_6.Day6 qualified as Day6
import Day_7.Day7 qualified as Day7
import Day_8.Day8 qualified as Day8
import Test.Hspec

readInputFile :: FilePath -> IO String
readInputFile = readFile

spec :: Spec
spec = do
  describe "2022 solutions" $ do
    describe "Day 1" $ do
      input <- runIO $ readInputFile "day_1/input.txt"
      it "part 1 should return the expected value" $
        Day1.part1 input `shouldBe` 68802

      it "part 2 should return the expected value" $
        Day1.part2 input `shouldBe` 205370

    describe "Day 2" $ do
      input <- runIO $ readInputFile "day_2/input.txt"
      it "part 1 should return the expected value" $
        Day2.part1 input `shouldBe` 14069

      it "part 2 should return the expected value" $
        Day2.part2 input `shouldBe` 12411

    describe "Day 3" $ do
      input <- runIO $ readInputFile "day_3/input.txt"
      it "part 1 should return the expected value" $
        Day3.part1 input `shouldBe` 7553

      it "part 2 should return the expected value" $
        Day3.part2 input `shouldBe` 2758

    describe "Day 4" $ do
      input <- runIO $ readInputFile "day_4/input.txt"
      it "part 1 should return the expected value" $
        Day4.part1 input `shouldBe` 534

      it "part 2 should return the expected value" $
        Day4.part2 input `shouldBe` 841

    describe "Day 5" $ do
      input <- runIO $ readInputFile "day_5/input.txt"
      it "part 1 should return the expected value" $
        Day5.part1 input `shouldBe` "QGTHFZBHV"

      it "part 2 should return the expected value" $
        Day5.part2 input `shouldBe` "MGDMPSZTM"

    describe "Day 6" $ do
      input <- runIO $ readInputFile "day_6/input.txt"
      it "part 1 should return the expected value" $
        Day6.part1 input `shouldBe` 1702

      it "part 2 should return the expected value" $
        Day6.part2 input `shouldBe` 3559

    describe "Day 7" $ do
      input <- runIO $ readInputFile "day_7/input.txt"
      it "part 1 should return the expected value" $
        Day7.part1 input `shouldBe` 1543140

      it "part 2 should return the expected value" $
        Day7.part2 input `shouldBe` 1117448

    describe "Day 8" $ do
      input <- runIO $ readInputFile "day_8/input.txt"
      it "part 1 should return the expected value" $
        Day8.part1 input `shouldBe` 1840

-- it "part 2 should return the expected value" $
--  Day8.part2 input `shouldBe` 405769

benchmarkPartInt :: String -> (String -> Int) -> FilePath -> Benchmark
benchmarkPartInt identifier partFn inputFile =
  bench (identifier ++ ": " ++ inputFile) $ nfIO $ do
    content <- readInputFile inputFile
    return $ partFn content

benchmarkPartStr :: String -> (String -> String) -> FilePath -> Benchmark
benchmarkPartStr identifier partFn inputFile =
  bench (identifier ++ ": " ++ inputFile) $ nfIO $ do
    content <- readInputFile inputFile
    return $ partFn content

benchmarks :: [Benchmark]
benchmarks =
  [ benchmarkPartInt "Day 1, Part 1" Day1.part1 "day_1/input.txt",
    benchmarkPartInt "Day 1, Part 2" Day1.part2 "day_1/input.txt",
    benchmarkPartInt "Day 2, Part 1" Day2.part1 "day_2/input.txt",
    benchmarkPartInt "Day 2, Part 2" Day2.part2 "day_2/input.txt",
    benchmarkPartInt "Day 3, Part 1" Day3.part1 "day_3/input.txt",
    benchmarkPartInt "Day 3, Part 2" Day3.part2 "day_3/input.txt",
    benchmarkPartInt "Day 4, Part 1" Day4.part1 "day_4/input.txt",
    benchmarkPartInt "Day 4, Part 2" Day4.part2 "day_4/input.txt",
    benchmarkPartStr "Day 5, Part 1" Day5.part1 "day_5/input.txt",
    benchmarkPartStr "Day 5, Part 2" Day5.part2 "day_5/input.txt",
    benchmarkPartInt "Day 6, Part 1" Day6.part1 "day_6/input.txt",
    benchmarkPartInt "Day 6, Part 2" Day6.part2 "day_6/input.txt",
    benchmarkPartInt "Day 7, Part 1" Day7.part1 "day_7/input.txt",
    benchmarkPartInt "Day 7, Part 2" Day7.part2 "day_7/input.txt",
    benchmarkPartInt "Day 8, Part 1" Day8.part1 "day_8/input.txt"
    -- benchmarkPartInt "Day 8, Part 2" Day8.part2 "day_8/input.txt"
  ]

main :: IO ()
main = do
  hspec spec
  defaultMain benchmarks
