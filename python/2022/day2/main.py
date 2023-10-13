def game(strings, state):
    return sum(score_count(item.strip().split(), state) for item in strings)


def score_count(lst, state):
    scores = {
        0: {
            'X': {'A': 4, 'B': 1, 'C': 7},
            'Y': {'A': 8, 'B': 5, 'C': 2},
            'Z': {'A': 3, 'B': 9, 'C': 6},
        },
        1: {
            'X': {'A': 3, 'B': 1, 'C': 2},
            'Y': {'A': 4, 'B': 5, 'C': 6},
            'Z': {'A': 8, 'B': 9, 'C': 7},
        }
    }
    return scores[state][lst[1]][lst[0]]


def part1(file): return game(read_lines(file), 0)
def part2(file): return game(read_lines(file), 1)
def read_lines(filename): return [line.strip() for line in open(filename)]
