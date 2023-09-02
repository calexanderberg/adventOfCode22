def num_contained(list) -> int:

    return sum(map(int, nums))


def is_fully_contained(first_nums, rest_nums):
    return all(map(lambda num: num in rest_nums, first_nums))


def is_partially_contained(list_0, list_1) -> bool:
    return list_0[1] >= list_1[0] and list_0[0] >= list_1[1]


def part_1(file): return ""
def part_2(file): return ""
def read_lines(filename): return [line.strip() for line in open(filename)]


input = "test.txt"
print(part_1(input))
print(part_2(input))
