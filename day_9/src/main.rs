fn main() {
    let file = std::fs::read_to_string("test.txt").unwrap();
    
    let mut head_vec: Vec<Vec<i32>> = vec![vec![0,0]];

    for line in file.lines().filter(|l| !l.is_empty()) {
        let lines: Vec<&str> = line.split(" ").collect();
        
        let new_value = lines[1].parse::<i32>().unwrap();
        let mut current_val = head_vec[head_vec.len()-1].clone();

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

    println!("{:?}", head_vec);
    let sum = tail_trail(head_vec, vec![vec![0,0]], 0,1, 0);
    println!("Sum: {:?}", sum);
}

fn tail_trail(vector: Vec<Vec<i32>>, mut tail: Vec<Vec<i32>>, current_head: usize , next_head: usize, sum: u32) -> u32 {

    let temp_head = vector[next_head].clone();
    let temp_tail = tail.clone().pop().unwrap();



    println!("head: {:?}", vector[current_head]);
    println!("tail: {:?}", tail.clone().pop().unwrap());
    println!("next head: {:?}\n", vector[next_head]);
  

    if vector[next_head] != vector[vector.len()-1] {
        tail_trail(vector, tail, next_head, next_head+1, sum);
    } else {
        //return sum;
    }
    return 0;
}

fn is_neightbor(){
    
}
 