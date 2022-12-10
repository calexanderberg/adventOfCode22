fn main() {
    let file = std::fs::read_to_string("input.txt").unwrap();
    let program: Vec<&str> = file.lines().collect();

    let cycle = build_cycle(vec![], program, 0);
    let signal = execute(cycle, 1, 0, 1);

    println!("Value of signal {}", signal);
}

fn build_cycle(mut cycle: Vec<i32>, program: Vec<&str>, index: usize) -> Vec<i32>{
    if program[index].starts_with("noop") {
        cycle.push(0);
    } else {
        let split: Vec<&str> = program[index].clone().split(" ").collect();
        let value: i32 = split[1].parse::<i32>().unwrap();
        cycle.push(0);
        cycle.push(value);
    }

    if index == program.len()-1 {
        return cycle
    } else {
        return build_cycle(cycle, program, index+1);
    }
}

fn execute(mut cycle: Vec<i32>, mut register: i32, mut signal: i32, mut counter: i32) -> i32 {
    if cycle.len() == 0 {
        return signal;
    } else {

        if counter == 20 || counter == 60 || counter == 100 || counter == 140 || counter == 180 || counter == 220 {
            signal += register * counter;
            }    
        
        if cycle[0] != 0{
            register = addx(register, cycle[0]);
        }
        cycle.remove(0);
        counter += 1;
        return execute(cycle, register, signal, counter);
    }

}

fn addx(register: i32, value: i32) -> i32 {
    let new_value: i32 = register + value;
    //println!("ADDX: {register} + {value} = {new_value}");
    return new_value;
}