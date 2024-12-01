def part1(left, right) -> int:
    left.sort()
    right.sort()
    return sum([abs(x-y) for x,y in zip(left, right)])

def part2(left, right) -> int:
    return sum([ x * right.count(x) for x in left ])

def readfile(filename):
    right_arr, left_arr = [], []
    with open(filename, "r") as file:
        for line in file:
            left, right = map(int, line.split())
            left_arr.append(left)
            right_arr.append(right)
    return left_arr, right_arr


file = "./2024/inputs/day1.txt"
left, right = readfile(file)
assert part1(left, right) == 1873376
assert part2(left, right) == 18997088
