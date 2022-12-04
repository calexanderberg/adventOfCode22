use std::io::BufRead;
use std::cmp::max;

fn main() {
    let mut part1: i32 = 0;
    let mut part2: i32 = 0;
    let file = std::fs::File::open("input.txt").unwrap();
    let reader = std::io::BufReader::new(file);   

    for (_index, line) in reader.lines().enumerate() {
        let line = line.unwrap(); 
        part1 += part_one(&line);
        part2 += part_two(&line);
    }
    println!("Part 1: {}", part1);
    println!("Part 2: {}", part2);
}
fn part_one(s: &str) -> i32 {
    let values: Vec<i32> = s.split(|c| c == '-' || c == ',').map(|s| s.parse().unwrap()).collect();
    let mut contain: i32 = 0;

    if values[2] <= values[0] && values[3] >= values[1] 
    || values[0] <= values[2] && values[1] >= values[3] {
        contain += 1;
    }

    return contain;
}

fn part_two(s: &str) -> i32{
    let values: Vec<i32> = s.split(|c| c == '-' || c == ',').map(|s| s.parse().unwrap()).collect();
    let mut contain: i32 = 0;

    let list1: Vec<i32> = (values[0]..=values[1]).collect();
    let list2: Vec<i32> = (values[2]..=values[3]).collect();
   
    for a in 0..max(list1.len(), list2.len()) {
        if max(list1.len(), list2.len()) == list2.len() {
            if list1.contains(&list2[a]){
                contain += 1;
            }
        } else {
            if list2.contains(&list1[a]){
                contain += 1;
            }
        }
    }

    if contain != 0 { contain = 1; }

    return contain;
}