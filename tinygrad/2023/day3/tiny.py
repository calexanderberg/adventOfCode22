import torch

def tensor_part1(input):
    return torch.tensor([[int(c) if c.isdigit() else 0 for c in row] for row in input])

def symbol_locations(input):
    nums = [list(location) for location in sum([[(i, j) for j, c in enumerate(row) if not c.isdigit() and c != '.'] for i, row in enumerate(input)], []) if location]
    neighbors = []
    for num_pair in nums:
        neighbors.extend([(num_pair[0] - 1, num_pair[1]), (num_pair[0] + 1, num_pair[1]),
                          (num_pair[0], num_pair[1] - 1), (num_pair[0], num_pair[1] + 1)])
    return neighbors

def get_elements_from_hit(tensor, row_index, target_index):
    return int(''.join(map(str, [num for num in tensor[row_index].tolist() if num != 0][:target_index + 1]))) if target_index < len(tensor[row_index].nonzero().flatten()) else 0

def part1(input):
    tensor_input = tensor_part1(input)
    unique_locations = set(symbol_locations(input))
    return torch.tensor([get_elements_from_hit(tensor_input, val[0], val[1]) for val in unique_locations])

def read_lines(filename):
    with open(filename, "r") as file:
        return [line.strip() for line in file]

file = "../tests/day3.txt"
input = read_lines(file)
print(input)
print(tensor_part1(input))
print(get_elements_from_hit(tensor_part1(input),0,2))
print(symbol_locations(input))
print(part1(input))
