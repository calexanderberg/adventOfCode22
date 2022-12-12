use std::{fs::read_to_string, str::FromStr};

struct Monkey {
    id: usize,
    worry: String,
    op: String,
    divisor: i32,
    true_monkey: usize,
    false_monkey: usize
}

fn main() {
   let _test_monkeys: Vec<Monkey> = vec![
    { Monkey 
        {id: 0, worry: String::from("79 98"), op: String::from("Old * 19"), divisor: 23, true_monkey: 2, false_monkey: 3,}},
    { Monkey 
        {id: 1, worry: String::from("54 65 75 74"), op: String::from("Old + 6"), divisor: 19, true_monkey: 2, false_monkey: 0,}},
    { Monkey 
        {id: 2, worry: String::from("79 60 97"), op: String::from("Old * old"), divisor: 13, true_monkey: 1, false_monkey: 3,}},
    { Monkey 
        {id: 3, worry: String::from("74"), op: String::from("Old + 3"), divisor: 17, true_monkey: 0, false_monkey: 1,}}
   ];

   let input_monkeys: Vec<Vec<&str>> = vec![
    vec!["0", "66 59 64 51", "old * 3", "2", "1", "4"],
    vec!["1", "67 61", "old * 19", "7", "3", "5"],
    vec!["2", "86 93 80 70 71 81 56", "old + 2", "11", "4", "0"],
    vec!["3", "94", "old * old", "19", "7", "6"],
    vec!["4", "71 92 64", "old + 3", "3", "5", "1"],
    vec!["5", "58 81 92 75 56", "old + 6", "5", "3", "6"],
    vec!["6", "82 98 77 94 86 81", "old + 7", "17", "7", "2"],
    vec!["7", "54 95 70 93 88 93 63 50", "old + 4", "13", "2", "0"],
   ];
 
   monkey_round(_test_monkeys, 20);
}

fn monkey_round(mut monkeys: Vec<Monkey>, rounds: u32) -> u32 {
    let mut passes = 0;
    let mut inspect: Vec<u32> = vec![0,0,0,0,0,0,0,0,0];
   
    for _a in 0..rounds+1 {
        println!("Round: {_a}");
        for n in 0..monkeys.len() {
        
            let temp_worry = monkeys[n].worry.clone();
            let temp_op = monkeys[n].op.clone();

            let items: Vec<&str> = temp_worry.split(" ").collect();
            let instruction: Vec<&str> = temp_op.split(" ").collect();

            for x in 0..items.len() {

                let item = items[x];
                let new_val = operate_item(instruction.clone(), item);
                let mut throw_to_monkey = 0;
                
                if test_item(new_val, monkeys[n].divisor) {
                    throw_to_monkey = monkeys[n].true_monkey;
                } else {
                    throw_to_monkey = monkeys[n].false_monkey;
                }

                monkeys[throw_to_monkey].worry = throw_item(monkeys[throw_to_monkey].worry.clone(), new_val);

                inspect[n] += 1;

                //monkeys[n].worry = remove_item(monkeys[n].worry.clone(), item)

            }
        }
    }

    for a in 0..inspect.len() {
        passes *= inspect[a];
    }
    
    println!("Inspect: {:?}", inspect);
    println!("Passes: {}", passes);
    return passes
}


fn operate_item(instruction: Vec<&str>, item: &str) -> u32 {
    let value1: u32 = FromStr::from_str(item).unwrap();
    let value2: u32;
    if instruction[2] == "old" {
        value2 = FromStr::from_str(item).unwrap();
    } else {
        value2 = FromStr::from_str(instruction[2]).unwrap();
    }

    if instruction[1] == "+" {
        return value1 + value2;
    } else {
        return value1 + value2;
    }
}

fn test_item(item: u32, test_value: i32) -> bool {
    return item % test_value as u32 == 0
}
 
fn throw_item(mut monkey: String, item: u32) ->  String {
    monkey.push_str(" ");
    monkey.push_str(&item.to_string());
    return monkey;
}

fn remove_item(mut monkey: String, item: &str) ->  String {
    monkey = monkey.replace(item, "");
    return monkey;
}