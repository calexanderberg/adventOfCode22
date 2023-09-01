module Main where

import Criterion.Main
import Day1.Lib qualified as Day1
import Day2.Lib qualified as Day2
import Day3.Lib qualified as Day3
import Day4.Lib qualified as Day4
import Day5.Lib qualified as Day5
import Day6.Lib qualified as Day6
import Day7.Lib qualified as Day7
import Day8.Lib qualified as Day8
import Day9.Lib qualified as Day9
import Test.Hspec

readInputFile :: FilePath -> IO String
readInputFile = readFile

spec :: Spec
spec = do
  describe "2022 solutions" $ do
    describe "Day 1" $ do
      input <- runIO $ readInputFile "inputs/day1.txt"
      it "part 1 should return the expected value" $
        Day1.part1 input `shouldBe` 68802

      it "part 2 should return the expected value" $
        Day1.part2 input `shouldBe` 205370

    describe "Day 2" $ do
      input <- runIO $ readInputFile "inputs/day2.txt"
      it "part 1 should return the expected value" $
        Day2.part1 input `shouldBe` 14069

      it "part 2 should return the expected value" $
        Day2.part2 input `shouldBe` 12411

    describe "Day 3" $ do
      input <- runIO $ readInputFile "inputs/day3.txt"
      it "part 1 should return the expected value" $
        Day3.part1 input `shouldBe` 7553

      it "part 2 should return the expected value" $
        Day3.part2 input `shouldBe` 2758

    describe "Day 4" $ do
      input <- runIO $ readInputFile "inputs/day4.txt"
      it "part 1 should return the expected value" $
        Day4.part1 input `shouldBe` 534

      it "part 2 should return the expected value" $
        Day4.part2 input `shouldBe` 841

    describe "Day 5" $ do
      input <- runIO $ readInputFile "inputs/day5.txt"
      it "part 1 should return the expected value" $
        Day5.part1 input `shouldBe` "QGTHFZBHV"

      it "part 2 should return the expected value" $
        Day5.part2 input `shouldBe` "MGDMPSZTM"

    describe "Day 6" $ do
      input <- runIO $ readInputFile "inputs/day6.txt"
      it "part 1 should return the expected value" $
        Day6.part1 input `shouldBe` 1702

      it "part 2 should return the expected value" $
        Day6.part2 input `shouldBe` 3559

    describe "Day 7" $ do
      input <- runIO $ readInputFile "inputs/day7.txt"
      it "part 1 should return the expected value" $
        Day7.part1 input `shouldBe` 1543140

      it "part 2 should return the expected value" $
        Day7.part2 input `shouldBe` 1117448

    describe "Day 8" $ do
      input <- runIO $ readInputFile "inputs/day8.txt"
      it "part 1 should return the expected value" $
        Day8.part1 input `shouldBe` 1840

      it "part 2 should return the expected value" $
        Day8.part2 input `shouldBe` 405769

    describe "Day 9" $ do
      input <- runIO $ readInputFile "inputs/day9.txt"
      it "part 1 should return the expected value" $
        Day9.part1 input `shouldBe` 5878

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
  [ benchmarkPartInt "Day 1, Part 1" Day1.part1 "inputs/day1.txt",
    benchmarkPartInt "Day 1, Part 2" Day1.part2 "inputs/day1.txt",
    benchmarkPartInt "Day 2, Part 1" Day2.part1 "inputs/day2.txt",
    benchmarkPartInt "Day 2, Part 2" Day2.part2 "inputs/day2.txt",
    benchmarkPartInt "Day 3, Part 1" Day3.part1 "inputs/day3.txt",
    benchmarkPartInt "Day 3, Part 2" Day3.part2 "inputs/day3.txt",
    benchmarkPartInt "Day 4, Part 1" Day4.part1 "inputs/day4.txt",
    benchmarkPartInt "Day 4, Part 2" Day4.part2 "inputs/day4.txt",
    benchmarkPartStr "Day 5, Part 1" Day5.part1 "inputs/day5.txt",
    benchmarkPartStr "Day 5, Part 2" Day5.part2 "inputs/day5.txt",
    benchmarkPartInt "Day 6, Part 1" Day6.part1 "inputs/day6.txt",
    benchmarkPartInt "Day 6, Part 2" Day6.part2 "inputs/day6.txt",
    benchmarkPartInt "Day 7, Part 1" Day7.part1 "inputs/day7.txt",
    benchmarkPartInt "Day 7, Part 2" Day7.part2 "inputs/day7.txt",
    benchmarkPartInt "Day 8, Part 1" Day8.part1 "inputs/day8.txt",
    benchmarkPartInt "Day 8, Part 2" Day8.part2 "inputs/day8.txt",
    benchmarkPartInt "Day 9, Part 1" Day9.part1 "inputs/day9.txt"
  ]

main :: IO ()
main = do
  hspec spec
  defaultMain benchmarks
