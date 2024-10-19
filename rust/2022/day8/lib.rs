fn matrix_lines(matrix: &Vec<Vec<i32>>) -> Vec<Vec<i32>> {
    return matrix
        .iter()
        .map(|x| {
            let seen_items_forward = seen_item(-1, x);
            let seen_items_backward = seen_item(-1, &x.iter().rev().cloned().collect());
            x.iter()
                .zip(
                    seen_items_forward
                        .iter()
                        .zip(seen_items_backward.iter().rev()),
                )
                .map(|(&value, (&forward, &backward))| value.max(forward).max(backward))
                .collect()
        })
        .collect();
}

pub fn seen_item(val: i32, line: Vec<i32>) -> Vec<i32> {
    if line.is_empty() {
        return vec![];
    }
    let (x, xs) = (list[0], &list[1..]);
    let mut vector = seen_item(val, xs.to_vec());
    return vector.insert(0, (val < x) as i32);
}

pub fn part1(file: &str) -> i32 {
    let input: String = file.lines().map(str::to_string).collect();
    create_matrix(&input, 0)
}

pub fn part2(file: &str) -> i32 {
    let input: String = file.lines().map(str::to_string).collect();
    create_matrix(&input, 1)
}

fn main() {
    let input = std::fs::read_to_string("./2022/inputs/day8.txt").expect("failed to read input file");
    assert!(part1(&input) == 1840,"Part1 is not working");
    assert!(part2(&input) == 405769,"Part2 is not working");
}
