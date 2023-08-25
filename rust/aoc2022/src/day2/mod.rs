pub fn game(input: &[String], status: i32) -> i32 {
    if input.is_empty() {
        return 0;
    }
    let h: [&str; 2] = [
        input[0].split_whitespace().next().unwrap_or(""),
        input[0].split_whitespace().nth(1).unwrap_or(""),
    ];
    let t = &input[1..];

    match status {
        1 => return game_round1(h) + game(t, 1),
        2 => return game_round2(h) + game(t, 2),
        _ => return 0,
    }
}

pub fn game_round1(input: [&str; 2]) -> i32 {
    match (input[0], input[1]) {
        ("X", "A") => return 4,
        ("X", "B") => return 1,
        ("X", "C") => return 7,
        ("Y", "A") => return 8,
        ("Y", "B") => return 5,
        ("Y", "C") => return 2,
        ("Z", "A") => return 3,
        ("Z", "B") => return 9,
        ("Z", "C") => return 6,
        _ => return 0,
    }
}

pub fn game_round2(input: [&str; 2]) -> i32 {
    match (input[0], input[1]) {
        ("X", "A") => return 3,
        ("X", "B") => return 1,
        ("X", "C") => return 2,
        ("Y", "A") => return 4,
        ("Y", "B") => return 5,
        ("Y", "C") => return 5,
        ("Z", "A") => return 8,
        ("Z", "B") => return 9,
        ("Z", "C") => return 7,
        _ => return 0,
    }
}

pub fn part1(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return game(&input, 1);
}

pub fn part2(file: &str) -> i32 {
    let input: Vec<String> = file.lines().map(|s| s.to_string()).collect();
    return game(&input, 1);
}



