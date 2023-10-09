import torch


def build_tensor(input, game):
    mapping = {'AX': 0, 'AY': 1, 'AZ': 2,
               'BX': 3, 'BY': 4, 'BZ': 5,
               'CX': 6, 'CY': 7, 'CZ': 8}
    if game == 1:
        return sum(game1_table[torch.tensor([[mapping.get(item, -1)]
                                             for item in input])].numpy())
    if game == 2:
        return sum(game2_table[torch.tensor([[mapping.get(item, -1)]
                                             for item in input])].numpy())


game1_table = torch.tensor([[4],   # A X
                            [8],   # A Y
                            [3],   # A Z
                            [1],   # B X
                            [5],   # B Y
                            [9],   # B Z
                            [7],   # C X
                            [2],   # C Y
                            [6]])  # C Z

game2_table = torch.tensor([[3],   # A X
                            [4],   # A Y
                            [8],   # A Z
                            [1],   # B X
                            [5],   # B Y
                            [9],   # B Z
                            [2],   # C X
                            [6],   # C Y
                            [7]])  # C Z


def part1(file): return int(build_tensor(read_lines(file), 1))
def part2(file): return int(build_tensor(read_lines(file), 2))


def read_lines(filename):
    with open(filename, "r") as file:
        return [line.strip().replace(" ", "") for line in file]


file = "../inputs/day2.txt"
print(part1(file))
print(part2(file))
