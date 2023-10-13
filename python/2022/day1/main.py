def part1(data: str) -> int:
    return max(map(sum, [list(map(int, group.splitlines())) for group in data.split('\n\n')]))


def part2(data: str) -> int:
    return sum(sorted(map(sum, [list(map(int, group.splitlines())) for group in data.split('\n\n')]), reverse=True)[:3])


def read_lines(filename): return open(filename, 'r').read()
