
def first_position(filename):
    with open(filename, "r") as file:
        data = file.read().strip().split("\n")
        print(data)

    length = len(data[0])
    for i in range(length):
        for j in range(len(data) - 1):
            ones = sum(str(data[i][j]).count("1")
                       for j in range(len(data) - 1))
            print(ones)


first_position("test.txt")
# print("first value: ", position_1[0] * position_1[1])
