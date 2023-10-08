use std::fs;

mod day1;
mod day2;
mod day3;
mod day4;
//mod day5;
mod day6;
mod day7;

fn main() {
    let test = fs::read_to_string("./tests/day6.txt").unwrap();
    println!("{:?} | {:?}", day6::part1(&test), day6::part2(&test));
    let input = fs::read_to_string("./inputs/day6.txt").unwrap();
    println!("{:?} | {:?}", day6::part1(&input), day6::part2(&input));
}
