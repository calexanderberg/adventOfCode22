def checkRuck(strings):
    return sum(calcValue(findChar(splitHalf(s))) for s in strings)


def checkRucks(str):
    if len(str) < 3:
        return 0
    return calcValue(findChar(str[:3])) + checkRucks(str[3:])


def splitHalf(str):
    middle = len(str) // 2
    return [str[:middle], str[middle:]]


def findChar(strings): return list(
    set.intersection(*(set(s) for s in strings)))


def calcValue(chars):
    alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return sum(map(lambda c: alphabet.index(c) + 1, chars))


def part1(file): return checkRuck(read_lines(file))
def part2(file): return checkRucks(read_lines(file))
def read_lines(filename): return [line.strip() for line in open(filename)]
