fn part1(file: &str) -> i32 {
    file.lines()
        .map(|x| {
            x.split(":")
                .nth(1)
                .expect("can't remove card indicator")
                .split("|")
                .map(|j| {
                    j.split_whitespace()
                        .map(|s| s.parse::<i32>().unwrap())
                        .collect::<Vec<_>>()
                })
                .collect::<Vec<_>>()
                .windows(2)
                .next()
                .map_or(0, |w| w[0].iter().filter(|i| w[1].contains(i)).count())
        })
        .filter(|&x| x > 0)
        .map(|x| 2_i32.pow(x as u32 - 1))
        .sum()
}

// Don't like this solution, I might need to go over this again
// I want to make it one variable, I did like 50% of it but I didn't make it clean
fn part2(file: &str) -> i32 {
    let mut vec = vec![1; file.lines().count()];
    vec![1; file.lines().count()]
        .iter()
        .enumerate()
        .map(|(i, _)| {
            (1..=file
                .lines()
                .nth(i)
                .expect("can't get line")
                .split(":")
                .nth(1)
                .expect("can't remove card indicator")
                .split("|")
                .map(|j| {
                    j.split_whitespace()
                        .map(|s| s.parse::<i32>().unwrap())
                        .collect::<Vec<_>>()
                })
                .collect::<Vec<_>>()
                .windows(2)
                .next()
                .map_or(0, |w| w[0].iter().filter(|i| w[1].contains(i)).count()))
                .for_each(|j| vec[j + i] += 1 * vec[i]);
            vec[i]
        })
        .sum()
}

fn main() {
    let input = std::fs::read_to_string("./inputs/day4.txt").expect("Failed to read input file");
    assert!(part1(&input) == 33950, "Part1 is not working");
    assert!(part2(&input) == 14814534, "Part2 is not working");
}
