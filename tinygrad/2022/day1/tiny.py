from tinygrad.tensor import Tensor


def cal_tensor(input):
    tensor = Tensor([elf + [0] * (max(len(elf)  # max = elf w/ most items
                    for elf in input) - len(elf)) for elf in input])
    return sorted([sum(row) for row in tensor.numpy()], reverse=True)


def part1(file): return int(cal_tensor(read_lines(file))[0])
def part2(file): return int(sum(cal_tensor(read_lines(file))[:3]))


def read_lines(filename):
    with open(filename, "r") as file:
        return [[int(cal) for cal in line.split()] for line in file.read().split("\n\n")]


file = "./2022/inputs/day1.txt"
assert part1(file) == 68802
assert part2(file) == 205370
