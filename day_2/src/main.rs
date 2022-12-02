use core::panic;
use std::io::BufRead;

fn main() {
    let file = std::fs::File::open("input.txt").unwrap();
    let reader = std::io::BufReader::new(file);
    let mut points_one: i32 = 0;
    let mut points_two: i32 = 0;


    
    for (_index, line) in reader.lines().enumerate() {
        let line = line.unwrap(); 
        let game: Vec<&str> = line.split(" ").collect();
        points_one = points_one + part_one(game[0], game[1]);
        points_two = points_two + part_two(game[0], game[1]);

    }
    println!("Round one: {}", points_one);
    println!("Round two: {}", points_two);
}

fn part_one(x: &str, y: &str) -> i32  {
    let mut total_points: i32 = 0;
    let mut combination: [&str; 2] = [x, y];
    let win_combo: [[&str; 2]; 3] = [["C", "A"], ["A", "B" ], ["B", "C"]];
    
    // Count the points of the selection of Y
    match y {
        "X" => {
            total_points = total_points + 1;
            combination[1] = "A";
        },
        "Y" => { 
            total_points = total_points + 2;
            combination[1] = "B";
        },
        "Z" => {
            total_points = total_points + 3;
            combination[1] = "C";
        },
        _ => panic!(),
    }

    // Counts the outcome
    for a in 0..=2 {
        if  combination[0] == combination[1] {
            total_points = total_points + 3; 
            break;
        }
        if combination == win_combo[a] {
            total_points = total_points + 6; 
            break;
        }
    }

    return total_points;
}  

fn part_two(x: &str, mut y: &str) -> i32 {
    let mut points_round: i32 = 0;
    let options: [&str; 5] = ["C", "A", "B", "C", "A"]; 
    let mut i: usize = 1;

    for a in 1..4  {
        if options[a] == x {break;}
        i = i + 1;
    }

    match y {
        "X" => {
            points_round = points_round + 0;
            y = options[i-1];

        },
        "Y" => {
            points_round = points_round + 3;
            y = options[i];
            

        },
        "Z" => {
            points_round = points_round + 6;
            y = options[i+1];

        },
        _ => panic!(),
    }

    // Decision points
    match y {
        "A" => points_round = points_round + 1,
        "B" => points_round = points_round + 2,
        "C" => points_round = points_round + 3,
        _ => panic!(),
    }

    return points_round;
}

/*

CHEAT SHEET
A: Rock     
B: Paper    
C: Scissors 

Win: 6 points   X
Draw: 3 points  Y
Loss: 0 points  Z

*/