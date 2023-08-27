use std::fs;

mod day1;
mod day2;
mod day3;
mod day4;
mod day5;

fn main() {
    let test = fs::read_to_string("./tests/day5.txt").unwrap();
    println!("{:?} | {:?}", day5::part1(&test), day5::part2(&test));
    let input = fs::read_to_string("./inputs/day5.txt").unwrap();
    println!("{:?} | {:?}", day5::part1(&input), day5::part2(&input));
}
