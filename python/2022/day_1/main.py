def create_list(filename):
    elf_list = []
    current_elf = 0
    with open(filename) as file:
        for line in file:
            line = line.strip()
            if line:
                current_elf += int(line)
            else:
                elf_list.append(current_elf)
                current_elf = 0
    elf_list.sort()
    return elf_list


def most_cal(lst, number):
    return 0 if number == 0 else lst[-number] + most_cal(lst, number - 1)


def part1(str): return most_cal(create_list(str), 1)
def part2(str): return most_cal(create_list(str), 3)


input = "input.txt"
print("Most cal for 1 elf: ", part1(input))
print("Most cal for 3 elves: ", part2(input))
