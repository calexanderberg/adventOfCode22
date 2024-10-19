pub fn check_ruck(input: &[String]) -> i32 {
    return input
        .iter()
        .map(|s| calc_val(find_char(split_str(s))))
        .sum();
}

pub fn check_rucks(input: &[String]) -> i32 {
    if input.is_empty() {
        return 0;
    } else {
        let (x, xs) = (
            input
                .iter()
                .take(3)
                .map(|s| s.as_str())
                .collect::<Vec<&str>>(),
            &input[3..],
        );
        return calc_val(find_char(x)) + check_rucks(xs);
    }
}

pub fn split_str(s: &String) -> Vec<&str> {
    return vec![&s[..s.len() / 2], &s[s.len() / 2..]];
}

pub fn find_char(strings: Vec<&str>) -> char {
    return strings[0]
        .chars()
        .filter(|c| strings[1..].iter().all(|s| s.contains(*c)))
        .collect::<Vec<char>>()[0];
}

pub fn calc_val(c: char) -> i32 {
    return alphabet().find(c).map(|x| x as i32).unwrap() + 1;
}

pub fn alphabet() -> String {
    return String::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
}

pub fn part1(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return check_ruck(&input);
}

pub fn part2(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return check_rucks(&input);
}

fn main() {
    let input = std::fs::read_to_string("./tests/day3.txt").unwrap();
    assert!(part1(input) == 7553,"Part1 is not working");
    assert!(part2(input) == 2758,"Part2 is not working");
}
