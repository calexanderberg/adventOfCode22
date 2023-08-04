
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


elf_list = create_list("input.txt")
print("Most cal for 1 elf: ", most_cal(elf_list, 1))
print("Most cal for 3 elves: ", most_cal(elf_list, 3))
