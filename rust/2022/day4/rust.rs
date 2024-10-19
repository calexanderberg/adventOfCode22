pub fn num_contain(input: &[String], status: i32) -> i32 {
    if input.is_empty() {
        return 0;
    } else {
        let (x, xs) = (&input[0], &input[1..]);
        let nums: Vec<i32> = x
            .split(|c| c == '-' || c == ',')
            .map(|x| x.parse().unwrap())
            .collect();
        match status {
            1 => {
                (is_fully_contained([nums[0], nums[1]], [nums[2], nums[3]])) as i32
                    + num_contain(xs, 1)
            }
            2 => {
                (is_part_contained([nums[0], nums[1]], [nums[2], nums[3]])) as i32
                    + num_contain(xs, 2)
            }
            _ => panic!("Invalid status"),
        }
    }
}
pub fn is_part_contained(int1: [i32; 2], int2: [i32; 2]) -> bool {
    return int1[1] >= int2[0] && int2[1] >= int1[0];
}

pub fn is_fully_contained(int1: [i32; 2], int2: [i32; 2]) -> bool {
    return (int1[0] >= int2[0] && int1[1] <= int2[1])
        || (int2[0] >= int1[0] && int2[1] <= int1[1]);
}

pub fn part1(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return num_contain(&input, 1);
}

pub fn part2(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return num_contain(&input, 2);
}

fn main() {
    let input = fs::read_to_string("./tests/day4.txt").unwrap();
    assert!(part1(input) == 534,"Part1 is not working");
    assert!(part2(input) == 841,"Part2 is not working");
}
