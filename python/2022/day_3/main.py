def checkRuck(str):
    return sum(map(lambda c: calcValue(findChar(c)), map(splitHalf, str)))


def checkRucks(str):
    if len(str) < 3:
        return 0
    return calcValue(findChar(str[:3])) + checkRucks(str[3:])


def splitHalf(str):
    middle = len(str) // 2
    return [str[:middle], str[middle:]]


def findChar(strings):
    if len(strings) == 2:
        return list(set(strings[0]) & set(strings[1]))
    if len(strings) == 3:
        return list(set(strings[0]) & set(strings[1]) & set(strings[2]))


alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"


def calcValue(chars): return sum(map(lambda c: alphabet.index(c) + 1, chars))


def part1(file): return checkRuck(read_lines(file))


def part2(file): return checkRucks(read_lines(file))


def read_lines(filename):
    with open(filename) as file:
        return [line.strip() for line in file]
