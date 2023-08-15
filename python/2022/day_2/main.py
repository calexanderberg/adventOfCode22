def game(filename, state):
    score = 0
    with open(filename, "r") as file:
        for line in file:
            if not line.strip():
                continue
            if state == 1:
                score += scoreCount(line.strip().split(" "), 1)
            elif state == 2:
                score += scoreCount(line.strip().split(" "), 2)
    return score


def scoreCount(lst, state):
    scores = {
        1: {
            'X': {'A': 4, 'B': 1, 'C': 7},
            'Y': {'A': 8, 'B': 5, 'C': 2},
            'Z': {'A': 3, 'B': 9, 'C': 6},
        },
        2: {
            'X': {'A': 3, 'B': 1, 'C': 2},
            'Y': {'A': 4, 'B': 5, 'C': 6},
            'Z': {'A': 8, 'B': 9, 'C': 7},
        }
    }
    return scores[state][lst[1]][lst[0]]


def part1(str): return game(str, 1)


def part2(str): return game(str, 2)


input = "input.txt"
print("Total score part 1: " + str(part1(input)))
print("Total score part 2: " + str(part2(input)))
