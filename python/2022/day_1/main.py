def create_list(filename):
    current_elf = 0
    elf_list = []
    with open(filename, "r") as file:
        for line in file:
            if not line.strip():
                elf_list.append(current_elf)
                current_elf = 0
            else:
                current_elf += int(line)
    elf_list.sort()
    return elf_list


def most_cal(list, number):
    if number == 0:
        return 0
    else:
        return list[len(list) - number] + most_cal(list, number - 1)


def part1(str): return most_cal(create_list(str), 1)
def part2(str): return most_cal(create_list(str), 3)


input = "input.txt"
print("Most cal for 1 elf: ", part1(input))
print("Most cal for 3 elves: ", part2(input))
