import torch

reds = [0, 3, 6, 9, 12, 15]
greens = [1, 4, 7, 10, 13, 16]
blues = [2, 5, 8, 11, 14, 17]

def extract_count(input):
    sentences = (input.replace(',', '').split(': ')[1:])[0].split('; ')
    counts = []
    for sentence in sentences:
        color_counts = {'red': 0, 'green': 0, 'blue': 0}
        words = sentence.split()
        for i in range(0, len(words), 2):
            color_counts[words[i + 1]] += int(words[i])
        counts.extend([color_counts[color] for color in ['red', 'green', 'blue']])
    return counts + [0] * (18 - len(counts))

def create_tensor(input):
    return torch.stack([torch.tensor(extract_count(val)) for val in input])

def part1(input):
    conditions = [
        all(row[idx] <= limit for idx, limit in zip(reds, [12] * 6)) and
        all(row[idx] <= limit for idx, limit in zip(greens, [13] * 6)) and
        all(row[idx] <= limit for idx, limit in zip(blues, [14] * 6))
        for row in create_tensor(input)
    ]

    return int(torch.sum(torch.tensor([i + 1 for i, condition in enumerate(conditions) if condition])))

def part2(input):
    tensor = create_tensor(input)
    
    max_reds = torch.max(tensor[:, reds], dim=1).values
    max_greens = torch.max(tensor[:, greens], dim=1).values
    max_blues = torch.max(tensor[:, blues], dim=1).values

    return int(torch.sum(max_reds * max_greens * max_blues))

def read_lines(filename):
    with open(filename, "r") as file:
        return [line.strip() for line in file]

file = "../inputs/day2.txt"
print(part1(read_lines(file)))
print(part2(read_lines(file)))
