pub fn part1(file: &str) -> u32 {
    return file
        .split("\n\n")
        .map(|cal| cal.lines().map(|x| x.parse::<u32>().unwrap()).sum())
        .max()
        .unwrap();
}

pub fn part2(file: &str) -> i32 {
    let mut cal_counts: Vec<usize> = file
        .split("\n\n")
        .map(|cal| cal.lines().map(|x| x.parse::<usize>().unwrap()).sum())
        .collect();

    cal_counts.sort_by(|a, b| b.cmp(a));
    return cal_counts.iter().take(3).sum::<usize>() as i32;
}

fn main() {
    let input = fs::read_to_string("./tests/day1.txt").unwrap();
    assert!(part1(input) == 68802,"Part1 is not working");
    assert!(part2(input) == 205370,"Part2 is not working");
}
