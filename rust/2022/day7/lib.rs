pub fn calc_dir_value(list: Vec<&str>, command: Vec<&str>, val: i32, dir: &str) -> Vec<i32> {}

pub fn nav_to(list: Vec<&str>, command: Vec<&str>, current: &str, goal: &str) -> Vec<i32> {
    if command.is_empty() {
        return nev_to(list, list, vec!["/"], goal);
    }
    if current == goal {
        return calc_dir_value(list, command[1..], 0, current);
    }
    if {

    } else {
        return nav_to(list, command[1..], current, goal);
    }
}

pub fn create_list(input: &str) -> Vec<i32> {
    return calc_dir_value(input[1..], input[1..], 0, "/");
}

pub fn part1(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return create_list(&input).iter().sum();
}

//pub fn part2(file: &str) -> i32 {
//    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
//    return num_contain(&input, 2);
//}

fn main() {
    let input = std::fs::read_to_string("./2022/inputs/day7.txt").expect("failed to read input file");
    assert!(part1(&input) == 1543140,"Part1 is not working");
    //assert!(part2(input) == 2758,"Part2 is not working");
}
