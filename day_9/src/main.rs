use std::collections::HashSet;

fn main() {
    let file = std::fs::read_to_string("input.txt").unwrap();
    
    let mut head_vec: Vec<Vec<i32>> = vec![vec![0,0]];

    for line in file.lines().filter(|l| !l.is_empty()) {
        let lines: Vec<&str> = line.split(" ").collect();
        
        let new_value = lines[1].parse::<i32>().unwrap();
        let mut current_val = head_vec[head_vec.len()-1].clone();

        // Creating our head path
        match lines[0] {
            "U" =>{
                for _a in 1..new_value+1 {
                    current_val[1] += 1;
                    head_vec.push(
                        vec![current_val[0], current_val[1]]
                    )   
                }
            },
            "D" => {
                for _a in -1..new_value-1 {
                    current_val[1] -= 1;
                    head_vec.push(
                        vec![current_val[0], current_val[1]]
                    )   
                }
            },
            "R" => {
                for _a in 1..new_value+1 {
                    current_val[0] += 1;
                    head_vec.push(
                        vec![current_val[0], current_val[1]]
                    )   
                }
            },
            "L" => {
                for _a in -1..new_value-1 {
                    current_val[0] -= 1;
                    head_vec.push(
                        vec![current_val[0], current_val[1]]
                    )   
                }
            },
            _ => panic!()
        }
    }

    let sum = tail_trail(head_vec, vec![vec![0,0]], 0,1);

    println!("Sum: {:?}", sum);
}

fn tail_trail(vector: Vec<Vec<i32>>, mut tail: Vec<Vec<i32>>, prev_head: usize , next_head: usize) -> usize {

    let temp_head = vector[next_head].clone();
    let temp_tail = tail.clone().pop().unwrap();

    if !is_neightbor(temp_tail, temp_head) {
       tail.push(vector[prev_head].clone()); 
    } 
  
    if next_head != vector.len()-1 {
        return tail_trail(vector, tail, next_head, next_head+1);
    } else {
        let set: HashSet<Vec<i32>> = tail.into_iter().collect();
        return set.len();
    }
}

fn is_neightbor(host: Vec<i32>, client: Vec<i32>) -> bool {
    return 2 as f32 > (square(client[0]-host[0]) as f32 + square(client[1]-host[1]) as f32).sqrt()
}
 
fn square(value: i32) -> i32 {
    return value * value;
}

/*
fn last_tail(parent: Vec<i32>, child: Vec<i32>, i: u32) -> <i32> {
    if i > 8 {
        return vector;
    } else {

    }
}
 */