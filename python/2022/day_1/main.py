def count_cal(strings, val):
    result = []
    for s in strings:
        if s == "":
            val = 0
        else:
            val += int(s)
        result.append(val)
    result.sort(reverse=True)
    return result


def part1(file): return sum(count_cal(read_lines(file), 0)[:1])
def part2(file): return sum(count_cal(read_lines(file), 0)[:3])
def read_lines(filename): return [line.strip() for line in open(filename)]


print(part1("input.txt"))
print(part2("input.txt"))
