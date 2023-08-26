use std::io::BufRead;

fn main() {
    let file = std::fs::File::open("input.txt").unwrap();
    let reader = std::io::BufReader::new(file);
    let mut sum1: i32 = 0;
    let mut sum2: i32 = 0;

    let mut length: usize = 0;
    let mut p2: [String; 3] = Default::default();

    for (_index, line) in reader.lines().enumerate() {
        let line = line.unwrap();
        sum1 = sum1 + part_one(&line);
        p2[length] = line.to_owned();

        length = length + 1;

        if length == 3 {
            sum2 = sum2 + part_two(&p2);
            length = 0;
        }
    }

    println!("part one: {}", sum1);
    println!("part two: {}", sum2);
}

pub fn findChar() -> Vec<char> {}

pub fn calcVal(c: Vec<char>) -> i32 {
    c.iter().map(|&c| alphabet().find(c)).sum()
}

pub fn alphabet() -> &str {
    return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
}

fn part_one(s: &str) -> i32 {
    let alphabet: &str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    let mut priority: i32 = 1;

    let vec: Vec<&str> = vec![&s[..s.len() / 2], &s[s.len() / 2..]];
    let second: Vec<char> = vec[1].chars().collect();
    let common_char: char = vec[0].chars().find(|c| second.contains(&c)).unwrap();

    priority = priority + alphabet.chars().position(|c| c == common_char).unwrap() as i32;
    return priority;
}

fn part_two(s: &[String; 3]) -> i32 {
    let alphabet: &str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    let mut priority: i32 = 1;

    let first: Vec<char> = s[0].chars().collect();
    let mid: Vec<char> = s[1].chars().collect();
    let last: Vec<char> = s[2].chars().collect();

    for char in s[0].chars() {
        if first.contains(&char) && mid.contains(&char) && last.contains(&char) {
            priority = priority + alphabet.chars().position(|c| c == char).unwrap() as i32;
            break;
        }
    }

    return priority;
}
