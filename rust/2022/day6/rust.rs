use std::collections::HashSet;

// need to make it a non hashset
pub fn check_string(s: &str, val: i32) -> i32 {
    let group: HashSet<usize> = s.chars().take(val as usize).map(|c| c as usize).collect();
    if group.len() == val as usize {
        return val;
    } else {
        return 1 + check_string(&s[1..], val);
    }
}

pub fn part1(file: &str) -> i32 {
    let input: String = file.lines().map(str::to_string).collect();
    return check_string(&input, 4);
}

pub fn part2(file: &str) -> i32 {
    let input: String = file.lines().map(str::to_string).collect();
    return check_string(&input, 14);
}

fn main() {
    let input = std::fs::read_to_string("./tests/day6.txt").unwrap();
    assert!(part1(input) == 1702,"Part1 is not working");
    assert!(part2(input) == 3559,"Part2 is not working");
}
