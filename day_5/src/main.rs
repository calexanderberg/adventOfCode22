
use std::io::BufRead;

fn main() {


    let crane: Vec<Vec<char>> = vec![
        vec!['N', 'D', 'M', 'Q', 'B', 'P', 'Z'],        // 1
        vec!['C', 'L', 'Z', 'Q', 'M', 'D', 'H', 'V'],   // 2
        vec!['Q', 'H', 'R', 'D', 'V', 'F', 'Z', 'G'],   // 3
        vec!['H', 'G', 'D', 'F', 'N'],                  // 4
        vec!['N', 'F', 'Q'],                            // 5
        vec!['D', 'Q', 'V', 'Z', 'F', 'B', 'T'],        // 6
        vec!['Q', 'M', 'T', 'Z', 'D', 'V', 'S', 'H'],   // 7
        vec!['M', 'G', 'F', 'P', 'N', 'Q'],             // 8
        vec!['B', 'W', 'R', 'M'],                       // 9
    ];

    let mut part1 = crane.clone();
    let mut part2 = crane.clone();

    
    let file = std::fs::File::open("input.txt").unwrap();
    let reader = std::io::BufReader::new(file);   

    for (_index, line) in reader.lines().enumerate() {
        let line = line.unwrap(); 
        part1 = part_one(part1, &line);
        part2 = part_two(part2, &line);
    }
    println!("Part one: ");
    for a in 0..part1.len() {
        println!("{}: {:?}",a+1, part1[a][part1[a].len()-1]);
    }
    println!("\nPart two: ");
    for a in 0..part2.len() {
        println!("{}: {:?}",a+1, part2[a][part2[a].len()-1]);
    }
}

fn part_one(mut array: Vec<Vec<char>>, s: &str) -> Vec<Vec<char>> {

    let mut a: Vec<&str> = s.split(" ").collect();  
    a.remove(0);  
    a.remove(1);  
    a.remove(2);  

    let mut instruction: Vec<usize> = a.iter().map(|s| s.trim()).filter(|s| !s.is_empty()).map(|s| s.parse().unwrap()).collect();


    if instruction[0] > array[instruction[1]-1].len() {
        instruction[0] = array[instruction[1]-1].len();
    }
    for _a in 0..instruction[0] {
        let __new_val = array[instruction[1]-1][array[instruction[1]-1].len()-1]; // This is not pretty i know
        array[instruction[2]-1].push(__new_val);
        array[instruction[1]-1].pop();
    }
    return array;
}

fn part_two(mut array: Vec<Vec<char>>, s: &str) -> Vec<Vec<char>> {

    let mut a: Vec<&str> = s.split(" ").collect();  
    a.remove(0);  
    a.remove(1);  
    a.remove(2);  

    let mut instruction: Vec<usize> = a.iter().map(|s| s.trim()).filter(|s| !s.is_empty()).map(|s| s.parse().unwrap()).collect();

    if instruction[0] > array[instruction[1]-1].len() {
        instruction[0] = array[instruction[1]-1].len();
    }

    /* 
    This has to be the most hackey solution I have ever done.
    Trust me I will rewrite this when I am better at algorithms and rust. 
    Don't judge me. I can do better
    */

    let mut _new_val: Vec<char> = vec![];
    _new_val = array[instruction[1]-1].as_slice()[array[instruction[1]-1].len()-instruction[0]..].to_vec();
        
    for a in 0.._new_val.len() {
        array[instruction[2]-1].push(_new_val[a]);
        array[instruction[1]-1].pop();
    }

    return array;
}