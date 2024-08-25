import torch

def tensor_part1(input):
    result = [[int(d) for d in s if d.isdigit()] for s in input]
    initial_tensor = torch.tensor([lst + [0] * (max(len(lst) for lst in result) - len(lst)) for lst in result])
    output_tensor = torch.zeros_like(initial_tensor)

    for i in range(initial_tensor.size(0)):
        row = initial_tensor[i, :]
        non_zero_elements = row[row != 0][[0, -1]]
        output_tensor[i, :len(non_zero_elements)] = non_zero_elements

    return output_tensor

def tensor_part2(input):
    initial_tensor = torch.tensor([lst + [0] * (max(len(lst) for lst in input) - len(lst)) for lst in input])
    output_tensor = torch.zeros_like(initial_tensor)

    for i in range(initial_tensor.size(0)):
        row = initial_tensor[i, :]
        non_zero_elements = row[row != 0][[0, -1]]
        output_tensor[i, :len(non_zero_elements)] = non_zero_elements

    return output_tensor

def prepare_array(input):
    str_to_number_mapping = {
        "one": '1',
        "two": '2',
        "three": '3',
        "four": '4',
        "five": '5',
        "six": '6',
        "seven": '7',
        "eight": '8',
        "nine": '9'
    }
    def map_word_to_digit(s):
        for word, digit in str_to_number_mapping.items():
            s = s.replace(word, word[0] + digit + word[-1])
        return s

    return [[int(d) for d in map_word_to_digit(s) if d.isdigit()] for s in input]


def part1(input): 
    tensor = tensor_part1(input)
    return int(torch.sum(tensor[:,0]) * 10 + torch.sum(tensor[:, 1]))
    

def part2(input): 
    tensor = tensor_part2(input)
    return int(torch.sum(tensor[:,0]) * 10 + torch.sum(tensor[:, 1]))

def read_input(filename):
    with open(filename, "r") as file:
        return [line.strip().replace(" ", "") for line in file]

file = "../inputs/day1.txt"
print(part1(read_input(file)))
print(part2(prepare_array(read_input(file))))
