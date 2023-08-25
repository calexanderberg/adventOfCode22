use std::fs;

mod day1;
mod day2;
//mod day3;

fn main() {
    let file = fs::read_to_string("./inputs/day2.txt").unwrap();
    println!("{:?} | {:?}", day2::part1(&file), day2::part2(&file));
}
