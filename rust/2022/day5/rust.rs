pub fn build_list(input: &[String], stacks: Vec<Vec<char>>, status: i32) -> String {
    if input.is_empty() {
        return stacks.iter().map(|s| s[0]).collect();
    }
    let (x, xs) = (&input[0], &input[1..]);
    let nums =  input[0].split_whitespace().enumerate().filter_map(|(i, word)| {if [1, 3, 5].contains(&i) {word.parse::<i32>().ok()} else {None}})
    .collect();
    let (split1, split2) = ([list[nums[1] - 1][..nums[0]].chars().rev().collect(), list[nums[1] - 1][nums[0]..].to_string()], [list[nums[1] - 1][..nums[0]].to_string(), list[nums[1] - 1][nums[0]..].to_string()]);
    match status {
        1 => {
            return build_list(xs, stacks, 1):
        },
        2 => {
            return build_list(xs, (), 2):
        },
        _ => panic!("Invalid status"),
    }
}

pub fn transfer_list(
    str1: &String,
    str2: &String,
    count: i32,
    indexes: [i32; 2],
    input: Vec<String>,
) -> Vec<String> {
    if input.is_empty() {
        return vec![];
    }

    let (x, xs) = (input[0].clone(), input[1..].to_vec());
    let transfer_rest = transfer_list(str1, str2, count + 1, indexes, xs);

    if count + 1 == indexes[0] {
        return vec![str1.clone() + &x]
            .into_iter()
            .chain(transfer_rest)
            .collect();
    } else if count + 1 == indexes[1] {
        return vec![str2.clone()]
            .into_iter()
            .chain(transfer_rest)
            .collect();
    } else {
        return vec![x.clone()].into_iter().chain(transfer_rest).collect();
    }
}

pub fn part1(file: &str) -> String {
    let input: Vec<String> = file.lines().map(str::to_string).collect();
    build_list(&input, test(), 1)
}

pub fn part2(file: &str) -> String {
    let input: Vec<String> = file.lines().map(str::to_string).collect();
    build_list(&input, test(), 2)
}

pub fn test() -> Vec<Vec<char>> {
    vec![vec!['N', 'Z'], vec!['D', 'C', 'M'], vec!['P']]
}

pub fn input() -> Vec<Vec<char>> {
    vec![
        vec!['Z', 'P', 'B', 'Q', 'M', 'D', 'N'],
        vec!['V', 'H', 'D', 'M', 'Q', 'Z', 'L', 'C'],
        vec!['G', 'Z', 'F', 'V', 'D', 'R', 'H', 'Q'],
        vec!['N', 'F', 'D', 'G', 'H'],
        vec!['Q', 'F', 'N'],
        vec!['T', 'B', 'F', 'Z', 'V', 'Q', 'D'],
        vec!['H', 'S', 'V', 'D', 'Z', 'T', 'M', 'Q'],
        vec!['Q', 'N', 'P', 'F', 'G', 'M'],
        vec!['M', 'R', 'W', 'B'],
    ]
}

fn main() {
    let input = fs::read_to_string("./tests/day5.txt").unwrap();
    assert!(part1(input) == String::from("QGTHFZBHV"),"Part1 is not working");
    assert!(part2(input) == String::from("MGDMPSZTM"),"Part2 is not working");
}
