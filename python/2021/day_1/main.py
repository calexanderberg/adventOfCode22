

def count_increase(filename):
    prev_input = -1
    counter = 0
    with open(filename, "r") as file:
        for line in file:
            current_input = int(line)
            if prev_input < current_input and prev_input != -1:
                counter += 1
            prev_input = current_input
    return counter


def count_3_increase(filename):
    status = 0
    input_1 = [0, 0]
    input_2 = [0, 0]
    list_of_3 = []
    counter = 0
    with open(filename, "r") as file:
        for line in file:
            input_1[0] += int(line)
            input_1[1] += 1
            if status == 1:
                input_2[0] += int(line)
                input_2[1] += 1
            if input_1[1] == 3:
                list_of_3.append(input_1)
                input_1 = [int(line), 1]
            elif input_2[1] == 3:
                list_of_3.append(input_2)
                input_2 = [int(line), 1]
            status = 1
    for i in range(1, len(list_of_3)):
        if list_of_3[i] > list_of_3[i-1]:
            counter += 1
    return counter


val1 = count_increase("input.txt")
val2 = count_3_increase("input.txt")
print("first value: ", val1)
print("second value: ", val2)
