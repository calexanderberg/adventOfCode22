fn main() {
    let file = std::fs::read_to_string("test.txt").unwrap();
    
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

    let tail_tail: Vec<Vec<i32>> = vec![
        vec![0,0], vec![0,0], vec![0,0], 
        vec![0,0], vec![0,0], vec![0,0],
        vec![0,0], vec![0,0], vec![0,0]
        ];

    //let sum = tail_trail(head_vec.clone(), vec![vec![0,0]], 0,1);

    //println!("Part 1_Sum: {:?}", sum);

    let sum2 = tail_tail_trail(head_vec.clone(), vec![vec![0,0]], 0,1, tail_tail);

    println!("Part 2_Sum: {:?}", sum2);

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
        let set: std::collections::HashSet<Vec<i32>> = tail.into_iter().collect();
        return set.len();
    }
}

fn is_neightbor(host: Vec<i32>, client: Vec<i32>) -> bool {
    return 2 as f32 > (square(client[0]-host[0]) as f32 + square(client[1]-host[1]) as f32).sqrt()
}
 
fn square(value: i32) -> i32 {
    return value * value;
}

fn tail_tail_trail(vector: Vec<Vec<i32>>, mut tail: Vec<Vec<i32>>, prev_head: usize , next_head: usize, mut tail_tail: Vec<Vec<i32>>) -> usize {

    let temp_head = vector[next_head].clone();
    let temp_tail = tail.clone().pop().unwrap();


    if !is_neightbor(temp_tail, temp_head) {
     tail_tail = last_tail(tail_tail.clone(), vector[next_head].clone(), vector[prev_head].clone(), tail_tail[0].clone(), 0);
     tail.push(tail_tail.clone().pop().unwrap());
    }
  
    if next_head != vector.len()-1 {
        return tail_tail_trail(vector, tail, next_head, next_head+1, tail_tail);
    } else {
        let set: std::collections::HashSet<Vec<i32>> = tail.into_iter().collect();
        println!("{:?}", set);
        return set.len();
    }
}


fn last_tail(mut tail_tail: Vec<Vec<i32>>, parent: Vec<i32>, old_parent: Vec<i32>, child: Vec<i32>, index: usize) -> Vec<Vec<i32>> {
    if index > 7 {

    } else if !is_neightbor(child.clone(), parent.clone()){
        tail_tail[index] = old_parent.clone();
        last_tail(tail_tail.clone(), tail_tail[index].clone(), parent.clone(), tail_tail[index+1].clone(), index + 1);
    } else {
        tail_tail[8] = old_parent.clone();    
    }
    return tail_tail
}