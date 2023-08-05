
def first_position(filename):
    position = [0, 0]
    with open(filename, "r") as file:
        for line in file:
            command = line.strip().split(" ")
            match command[0]:
                case "forward":
                    position[0] += int(command[1])
                case "down":
                    position[1] += int(command[1])
                case "up":
                    position[1] -= int(command[1])
    return position


def second_position(filename):
    position = [0, 0, 0]
    with open(filename, "r") as file:
        for line in file:
            command = line.strip().split(" ")
            match command[0]:
                case "forward":
                    position[0] += int(command[1])
                    position[1] += int(command[1]) * position[2]
                case "down":
                    position[2] += int(command[1])
                case "up":
                    position[2] -= int(command[1])
    return position


position_1 = first_position("input.txt")
position_2 = second_position("input.txt")
print("first value: ", position_1[0] * position_1[1])
print("second value: ", position_2[0] * position_2[1])
