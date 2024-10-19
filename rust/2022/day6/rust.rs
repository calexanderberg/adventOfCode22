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
