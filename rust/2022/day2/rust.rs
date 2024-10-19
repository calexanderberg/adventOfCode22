pub fn game(input: &[String], status: i32) -> i32 {
    if input.is_empty() {
        return 0;
    }
    let h: Vec<&str> = input[0].split_whitespace().collect();

    match status {
        1 => game_round(h[0], h[1]) + game(&input[1..], 1),
        2 => game_round2(h[0], h[1]) + game(&input[1..], 2),
        _ => return 0,
    }
}

pub fn game_round(x: &str, y: &str) -> i32 {
    match (y, x) {
        ("X", "A") => 4,
        ("X", "B") => 1,
        ("X", "C") => 7,
        ("Y", "A") => 8,
        ("Y", "B") => 5,
        ("Y", "C") => 2,
        ("Z", "A") => 3,
        ("Z", "B") => 9,
        ("Z", "C") => 6,
        (&_, _) => 0,
    }
}

pub fn game_round2(x: &str, y: &str) -> i32 {
    match (y, x) {
        ("X", "A") => 3,
        ("X", "B") => 1,
        ("X", "C") => 2,
        ("Y", "A") => 4,
        ("Y", "B") => 5,
        ("Y", "C") => 6,
        ("Z", "A") => 8,
        ("Z", "B") => 9,
        ("Z", "C") => 7,
        (&_, _) => 0,
    }
}

pub fn part1(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return game(&input, 1);
}

pub fn part2(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return game(&input, 2);
}

fn main() {
    let input = std::fs::read_to_string("./tests/day2.txt").unwrap();
    assert!(part1(input) == 14069,"Part1 is not working");
    assert!(part2(input) == 12411,"Part2 is not working");
}
