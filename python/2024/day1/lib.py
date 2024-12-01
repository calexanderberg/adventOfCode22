def part1(left: list[int], right: list[int]) -> int:
    return sum([ abs(x-y) for x,y in zip(sorted(left), sorted(right)) ])

def part2(left: list[int], right: list[int]) -> int:
    return sum([ x * right.count(x) for x in left ])

def readfile(filename: str):
    with open(filename, "r") as file:
        return zip(*(map(int, line.split()) for line in file))

file = "./2024/inputs/day1.txt"
left, right = readfile(file)
assert part1(left, right) == 1873376
assert part2(left, right) == 18997088
