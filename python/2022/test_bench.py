import timeit
from day_1 import main as Day1
from day_2 import main as Day2
import unittest


def test_day_part(part_fn, file_content, expected_result):
    return lambda self: self.assertEqual(part_fn(file_content), expected_result)


def benchmark_part(part_fn, file_content):
    execution_times = timeit.repeat(
        lambda: part_fn(file_content), number=1, repeat=5)
    mean_execution_time = sum(execution_times) / len(execution_times) * 1000
    return mean_execution_time


class TestSolutions(unittest.TestCase):
    test_day_1_1 = test_day_part(Day1.part1, "day_1/input.txt", 68802)
    test_day_1_2 = test_day_part(Day1.part2, "day_1/input.txt", 205370)
    test_day_2_1 = test_day_part(Day2.part1, "day_2/input.txt", 14069)
    test_day_2_2 = test_day_part(Day2.part2, "day_2/input.txt", 12411)


class BenchmarkSpec:
    def __init__(self, identifier, part_fn, input_file):
        self.identifier = identifier
        self.part_fn = part_fn
        self.input_file = input_file


benchmark_specs = [
    BenchmarkSpec("Day 1 part 1", Day1.part1, "day_1/input.txt"),
    BenchmarkSpec("Day 1 part 2", Day1.part2, "day_1/input.txt"),
    BenchmarkSpec("Day 2 part 1", Day2.part1, "day_2/input.txt"),
    BenchmarkSpec("Day 2 part 2", Day2.part2, "day_2/input.txt")
]

suite = unittest.TestLoader().loadTestsFromTestCase(TestSolutions)
test_runner = unittest.TextTestRunner()
test_result = test_runner.run(suite)

print("\nBenchmarking:")
for spec in benchmark_specs:
    mean_execution_time = benchmark_part(spec.part_fn, spec.input_file)
    print(f"{spec.identifier}: Mean execution time - {mean_execution_time:.3f} ms")

