fn main() {
    let file = std::fs::read_to_string("./input.txt").unwrap();
    
    let mut prev_value: u32 = 0;
    let mut increased_num: u32 = 0;

    for line in file.lines().filter(|l| !l.is_empty()) {
    let current_value: u32 = std::str::FromStr::from_str(line).unwrap();
    if prev_value == 0 {
        println!("(N/A - no previous measurement)");
    } else {
        if prev_value < current_value {
            println!("(increased)");
            increased_num += 1;
        } else if prev_value > current_value {
            println!("(decreased)");
        } else {
            panic!("Value is equal");
        }
    }
    prev_value = current_value.clone();
    
    }
    println!("{}", increased_num);
}
