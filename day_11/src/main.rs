fn main() {
    let file = std::fs::read_to_string("test.txt").unwrap();
    let instructions: Vec<&str> = file.lines().collect();

    println!("{:?}", instructions);

    let mut monkey_id: u32 = 0;
    for a in 0..instructions.len(){

    }


}
