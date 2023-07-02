fn main() {
    let file = std::fs::read_to_string("test.txt").unwrap();
    let x_axis: Vec<&str> = file.lines().collect();


    // Creates the start and end position
    let mut start_pos: [usize; 2] = [0,0];
    let mut end_pos: [usize; 2] = [0,0];

    let alphabet = String::from("Xabcdefghijklmnopqrstuvwxyz");
    let weight: Vec<char> = alphabet.chars().collect();
    let current_weight = 'X';
    
    for a in 0..x_axis.len() {
        if x_axis[a].contains('S'){
            start_pos = [x_axis[a].chars().position(|c| c == 'S').unwrap(), a];
        }

        if x_axis[a].contains('E'){
            end_pos = [x_axis[a].chars().position(|c| c == 'E').unwrap(), a];
        }
    }
    
    println!("Start: {:?} End: {:?}", start_pos, end_pos);

    
}

fn check_neighbours() -> [usize; 2] {


    if if_neighbour_is_less() {

    } else {
        
    }
}


fn if_neighbour_is_less(alphabet: String, current_weight: char, new_weight: char ) -> bool {
    let home =  alphabet.chars().position(|c| c == current_weight).unwrap();
    let neighbour = alphabet.chars().position(|c| c == current_weight).unwrap();
    return home > neighbour;
}  