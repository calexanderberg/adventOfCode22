def count_cal(strings, val):
    result = []
    for s in strings:
        if s == "":
            result.append(val)
            val = 0
        else:
            val += int(s)
    return sorted(result, reverse=True)


def part1(file): return sum(count_cal(read_lines(file), 0)[:1])
def part2(file): return sum(count_cal(read_lines(file), 0)[:3])


def read_lines(filename):
    with open(filename) as file:
        return [line.strip() for line in file]
