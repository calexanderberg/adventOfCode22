

def expenses_1(filename) -> int:
    with open(filename, "r") as file:
        data = file.read().split("\n")

    for i in range(len(data) - 1):
        val_left = 2020 - int(data[i])
        if str(val_left) in data:
            return int(data[i]) * val_left


def expenses_2(filename) -> int:
    with open(filename, "r") as file:
        data = file.read().split("\n")

    for i in range(len(data) - 2):
        val_temp = 2020 - int(data[i])
        for j in range(i+1, len(data) - 1):
            val_left = val_temp - int(data[j])
            if str(val_left) in data:
                return int(data[i]) * int(data[j]) * val_left


val_1 = expenses_1("input.txt")
val_2 = expenses_2("input.txt")
print("Part 1: ", val_1)
print("Part 2: ", val_2)
