import torch


def cal_tensor(input):
    data = [[]]
    [data[-1].append(int(item)) if item else data.append([]) for item in input]

    tensor = torch.tensor([elf + [0] * (max(len(elf)for elf in data)  # max = elf w/ most items
                                        - len(elf)) for elf in data])

    return torch.sort(torch.sum(tensor, dim=1), descending=True)[0]


def part1(file): return torch.max(cal_tensor(read_lines(file))).item()
def part2(file): return torch.sum(cal_tensor(read_lines(file))[:3]).item()
def read_lines(filename): return [line.strip() for line in open(filename)]


file = "../../inputs/day1.txt"
print(part1(file))
print(part2(file))
